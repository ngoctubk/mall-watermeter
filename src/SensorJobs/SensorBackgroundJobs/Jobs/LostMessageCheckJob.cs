using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

using Quartz;

using SensorBackgroundJobs.Models;

namespace SensorBackgroundJobs.Jobs
{
    [DisallowConcurrentExecution]
    internal class LostMessageCheckJob(AppDbContext dbContext, IOptions<CommonSettings> commonSettingsOption) : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            CommonSettings commonSettings = commonSettingsOption.Value;
            DateTime currentDate = DateTime.UtcNow.AddHours(commonSettings.LostMessageHours);

            var waterSensors = dbContext.Sensors.AsNoTracking()
                    .Include(s => s.Meter)
                    .Include(s => s.WaterMeters)
                    .Where(s => s.IsActive
                                    && s.MeterId != null
                                    && s.Meter.MeterType == "water"
                                    && (!s.WaterMeters.Any() || s.WaterMeters.Max(m => m.ToTimestamp) < currentDate))
                    .Select(s => new
                    {
                        s.Id,
                        s.MeterId,
                        s.StallId
                    })
                    .ToList();

            var gasSensors = dbContext.Sensors.AsNoTracking()
                    .Include(s => s.Meter)
                    .Include(s => s.GasMeters)
                    .Where(s => s.IsActive
                                    && s.MeterId != null
                                    && s.Meter.MeterType == "gas"
                                    && (!s.GasMeters.Any() || s.GasMeters.Max(m => m.ToTimestamp) < currentDate))
                    .Select(s => new
                    {
                        s.Id,
                        s.MeterId,
                        s.StallId
                    })
                    .ToList();

            var sensors = waterSensors.Concat(gasSensors);

            DateTime now = DateTime.UtcNow;
            foreach (var sensor in sensors)
            {
                NoIncomingMessageWarning noIncomingMessageWarning = new()
                {
                    StallId = sensor.StallId,
                    SensorId = sensor.Id,
                    MeterId = sensor.MeterId.Value,
                    CreatedDate = now,
                };
                dbContext.Add(noIncomingMessageWarning);
            }
            await dbContext.SaveChangesAsync();
        }
    }
}
