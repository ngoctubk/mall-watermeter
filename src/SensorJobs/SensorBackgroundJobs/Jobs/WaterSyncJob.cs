using MQTTnet.Client;
using MQTTnet.Formatter;
using MQTTnet;
using Microsoft.Extensions.Options;
using System.Text.Json;
using SensorBackgroundJobs.Helpers;
using SensorBackgroundJobs.Dtos;
using System.Text;
using SensorBackgroundJobs.Models;
using Microsoft.EntityFrameworkCore;

namespace SensorBackgroundJobs.Jobs
{
    public class WaterSyncJob(ILogger<WaterSyncJob> logger,
                                IOptions<MqttSettings> optionMqttSettings,
                                IOptions<CommonSettings> commonSettingsOption,
                                IServiceScopeFactory scopeFactory) : BackgroundService
    {
        private readonly MqttSettings _mqttSettings = optionMqttSettings.Value;
        private readonly CommonSettings _commonSettings = commonSettingsOption.Value;

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            var mqttFactory = new MqttFactory();
            using var mqttClient = mqttFactory.CreateMqttClient();

            mqttClient.ApplicationMessageReceivedAsync += HandleMessageAsync;

            var mqttClientOptions = new MqttClientOptionsBuilder()
                                    .WithClientId(_mqttSettings.WaterClientId)
                                    .WithTcpServer(_mqttSettings.Server, _mqttSettings.Port)
                                    .WithCredentials(_mqttSettings.Username, _mqttSettings.Password)
                                    .WithCleanSession()
                                    .WithProtocolVersion(MqttProtocolVersion.V500)
                                    .Build();
            logger.LogInformation("Connecting to MQTT Broker...");
            _ = Task.Run(async () =>
            {
                // User proper cancellation and no while(true).
                while (true)
                {
                    try
                    {
                        // This code will also do the very first connect! So no call to _ConnectAsync_ is required in the first place.
                        if (!await mqttClient.TryPingAsync())
                        {
                            await mqttClient.ConnectAsync(mqttClientOptions, CancellationToken.None);
                            logger.LogInformation("The MQTT client is connected.");
                            var mqttSubscribeOptions = mqttFactory.CreateSubscribeOptionsBuilder()
                                .WithTopicFilter(f => f.WithTopic(_mqttSettings.WaterTopic))
                                .Build();
                            var response = await mqttClient.SubscribeAsync(mqttSubscribeOptions, CancellationToken.None);
                            logger.LogInformation("MQTT client subscribed to topic.");
                            // Subscribe to topics when session is clean etc.
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle the exception properly (logging etc.).
                        logger.LogError(ex, "Exception");
                    }
                    finally
                    {
                        // Check the connection state every 5 seconds and perform a reconnect if required.
                        await Task.Delay(TimeSpan.FromSeconds(30));
                    }
                }
            }, stoppingToken);
            await Task.Delay(Timeout.InfiniteTimeSpan, stoppingToken);
        }

        public async Task HandleMessageAsync(MqttApplicationMessageReceivedEventArgs e)
        {
            try
            {
                using var scope = scopeFactory.CreateScope();
                var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();

                var payload = Encoding.UTF8.GetString(e.ApplicationMessage.PayloadSegment);
                var topic = e.ApplicationMessage.Topic;
                var topics = topic.Split("/");
                var sensorCode = topics[1];

                var sensorInformation = await GetSensorInformation(context, sensorCode);
                sensorInformation.Topic = topic;
                sensorInformation.Payload = payload;

                if (!sensorInformation.IsExisted || !sensorInformation.IsActive)
                {
                    await InsertSensorIsNotExistedError(context, sensorInformation);
                    return;
                }

                MqttMeter? meter = GetMeterFromPayload(e);

                if (meter is null)
                {
                    await InsertMeterIsNullError(context, sensorInformation);
                    return;
                }

                var insertMeterError = await InsertMeterErrorIfHasErrorMessage(context, meter, sensorInformation);
                if (insertMeterError)
                    return;

                //bool isValueIncorrect = await IsValueIncorrect(context, meter, sensorInformation);

                //if (isValueIncorrect)
                //{
                //    await InsertValueIsNotCorrectError(context, sensorInformation);
                //    return;
                //}

                await InsertWaterMeter(context, meter, sensorInformation);
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Exception");
            }
        }

        private static async Task<bool> InsertMeterErrorIfHasErrorMessage(AppDbContext dbContext, MqttMeter meter, SensorInformation sensorInformation)
        {
            if (!meter.Error.Equals("no error"))
            {
                string reason = "SensorMessageHasError";

                MeterError meterError = new()
                {
                    Topic = sensorInformation.Topic,
                    StallId = sensorInformation.StallId,
                    SensorId = sensorInformation.SensorId,
                    MeterId = sensorInformation.MeterId,
                    Payload = sensorInformation.Payload,
                    Reason = reason,
                    CreatedDate = DateTime.Now
                };
                dbContext.Add(meterError);
                await dbContext.SaveChangesAsync();

                return true;
            }

            return false;
        }

        private static async Task InsertMeterCanNotGetPreviousValue(AppDbContext dbContext, MqttMeter meter, SensorInformation sensorInformation)
        {
            string reason = "CanNotGetPreviousValue";

            MeterError meterError = new()
            {
                Topic = sensorInformation.Topic,
                StallId = sensorInformation.StallId,
                SensorId = sensorInformation.SensorId,
                MeterId = sensorInformation.MeterId,
                Payload = sensorInformation.Payload,
                Reason = reason,
                CreatedDate = DateTime.Now
            };
            dbContext.Add(meterError);
            await dbContext.SaveChangesAsync();
        }

        private static async Task<bool> IsValueIncorrect(AppDbContext dbContext, MqttMeter meter, SensorInformation sensorInformation)
        {
            bool meterIsSmallerThanMax = await dbContext.WaterMeters.AsNoTracking()
                                                    .AnyAsync(m => m.SensorId == sensorInformation.SensorId
                                                                                    && m.MeterId == sensorInformation.MeterId
                                                                                    && m.Value > meter.Value);
            return meterIsSmallerThanMax;
        }

        private async Task InsertWaterMeter(AppDbContext dbContext, MqttMeter meter, SensorInformation sensorInformation)
        {
            WaterMeter? waterMeter = await dbContext.WaterMeters.FirstOrDefaultAsync(m => m.SensorId == sensorInformation.SensorId
                                                                                                            && m.MeterId == sensorInformation.MeterId
                                                                                                            && m.Value == meter.Value);
            var currentDate = DateTime.Now;
            if (waterMeter is null)
            {
                // Add new
                WaterMeter? lastWaterMeter = await dbContext.WaterMeters.Where(m => m.SensorId == sensorInformation.SensorId
                                                                                                    && m.MeterId == sensorInformation.MeterId)
                                                                        .OrderByDescending(w => w.ToTimestamp)
                                                                        .ThenByDescending(w => w.FromTimestamp)
                                                                        .FirstOrDefaultAsync();
                if (lastWaterMeter is null)
                {
                    var exists = await dbContext.WaterMeters.AnyAsync(m => m.SensorId == sensorInformation.SensorId
                                                                                                && m.MeterId == sensorInformation.MeterId);
                    if (exists)
                    {
                        await InsertMeterCanNotGetPreviousValue(dbContext, meter, sensorInformation);
                        return;
                    }
                }
                else
                {
                    lastWaterMeter.ToTimestamp = currentDate;
                }

                waterMeter = new WaterMeter()
                {
                    StallId = sensorInformation.StallId,
                    StallCode = sensorInformation.StallCode,
                    SensorId = sensorInformation.SensorId.Value,
                    SensorCode = sensorInformation.SensorCode,
                    MeterId = sensorInformation.MeterId.Value,
                    MeterCode = sensorInformation.MeterCode,
                    Value = meter.Value,
                    Raw = meter.Raw,
                    Pre = meter.Pre,
                    Error = meter.Error,
                    Rate = meter.Rate,
                    FromTimestamp = currentDate,
                    ToTimestamp = currentDate
                };
                dbContext.Add(waterMeter);
            }
            else
            {
                // Update -> only update ToTimestamp
                waterMeter.StallId = sensorInformation.StallId;
                waterMeter.StallCode = sensorInformation.StallCode;
                waterMeter.ToTimestamp = currentDate;
            }

            await dbContext.SaveChangesAsync();
        }

        private static async Task InsertValueIsNotCorrectError(AppDbContext dbContext, SensorInformation sensorInformation)
        {
            MeterError meterError = new()
            {
                Topic = sensorInformation.Topic,
                StallId = sensorInformation.StallId,
                SensorId = sensorInformation.SensorId,
                MeterId = sensorInformation.MeterId,
                Payload = sensorInformation.Payload,
                Reason = "MessageValueIsNotCorrect",
                CreatedDate = DateTime.Now
            };
            dbContext.Add(meterError);
            await dbContext.SaveChangesAsync();
        }

        private static async ValueTask InsertMeterIsNullError(AppDbContext dbContext, SensorInformation sensorInformation)
        {
            MeterError meterError = new()
            {
                Topic = sensorInformation.Topic,
                StallId = sensorInformation.StallId,
                SensorId = sensorInformation.SensorId,
                MeterId = sensorInformation.MeterId,
                Payload = sensorInformation.Payload,
                Reason = "CannotDeserializePayload",
                CreatedDate = DateTime.Now
            };
            dbContext.Add(meterError);
            await dbContext.SaveChangesAsync();
        }

        private static async ValueTask InsertSensorIsNotExistedError(AppDbContext dbContext, SensorInformation sensorInformation)
        {
            MeterError meterError = new()
            {
                Topic = sensorInformation.Topic,
                StallId = sensorInformation.StallId,
                SensorId = sensorInformation.SensorId,
                MeterId = sensorInformation.MeterId,
                Payload = sensorInformation.Payload,
                Reason = "SensorOrMeterDoesNotExistOrActive",
                CreatedDate = DateTime.Now
            };
            dbContext.Add(meterError);
            await dbContext.SaveChangesAsync();
        }

        private static MqttMeter? GetMeterFromPayload(MqttApplicationMessageReceivedEventArgs e)
        {
            try
            {

                var options = new JsonSerializerOptions
                {
                    PropertyNameCaseInsensitive = true,
                    NumberHandling = System.Text.Json.Serialization.JsonNumberHandling.AllowReadingFromString
                };
                options.Converters.Add(new DateTimeJsonConverterUsingDateTimeParse());
                options.Converters.Add(new EmptyStringToDoubleConverter());

                var meter = JsonSerializer.Deserialize<MqttMeter>(e.ApplicationMessage.PayloadSegment.AsSpan(), options);
                return meter;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        private static async Task<SensorInformation> GetSensorInformation(AppDbContext dbContext, string sensorCode)
        {
            Sensor? sensor = await dbContext.Sensors.AsNoTracking()
                                    .Include(s => s.Meter)
                                    .Include(s => s.Stall)
                                    .FirstOrDefaultAsync(s => s.SensorCode == sensorCode);

            SensorInformation sensorInformation = new();
            if (sensor is null || sensor.MeterId is null || sensor.Meter is null)
            {
                sensorInformation.IsExisted = false;
                if (sensor is not null)
                {
                    sensorInformation.SensorId = sensor.Id;
                    sensorInformation.SensorCode = sensor.SensorCode;
                    sensorInformation.IsActive = sensor.IsActive;
                }
                if (sensor?.StallId is not null)
                {
                    sensorInformation.StallId = sensor.StallId;
                    sensorInformation.StallCode = sensor.Stall?.StallCode;
                }
                if (sensor?.MeterId is not null)
                {
                    sensorInformation.MeterId = sensor.MeterId;
                    sensorInformation.MeterCode = sensor.Meter?.MeterCode;
                }
                return sensorInformation;
            }

            sensorInformation.IsExisted = true;
            sensorInformation.IsActive = sensor.IsActive;
            sensorInformation.SensorId = sensor.Id;
            sensorInformation.SensorCode = sensorCode;
            sensorInformation.StallId = sensor.StallId;
            sensorInformation.StallCode = sensor.Stall?.StallCode;
            sensorInformation.MeterId = sensor.MeterId;
            sensorInformation.MeterCode = sensor.Meter?.MeterCode;

            return sensorInformation;
        }

    }
}
