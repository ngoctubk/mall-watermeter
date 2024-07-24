using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

using Quartz;

using SensorBackgroundJobs.Models;

using System.Net.NetworkInformation;

namespace SensorBackgroundJobs.Jobs
{
    [DisallowConcurrentExecution]
    internal class SensorPingJob(AppDbContext dbContext, IOptions<CommonSettings> commonSettingsOption) : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            CommonSettings commonSettings = commonSettingsOption.Value;

            Ping myPing = new Ping();
            int timeout = commonSettings.PingTimeout;

            try
            {
                var sensors = dbContext.Sensors.AsNoTracking()
                        .Where(s => s.IsActive
                                        && s.MeterId != null)
                        .Select(s => new
                        {
                            s.Id,
                            s.MeterId,
                            s.StallId,
                            s.IpAddress
                        })
                        .ToList();

                DateTime now = DateTime.UtcNow;
                foreach (var sensor in sensors)
                {
                    PingReply reply = await myPing.SendPingAsync(sensor.IpAddress, timeout);
                    
                    if (reply.Status != IPStatus.Success)
                    {
                        CannotConnectWarning cannotConnectWarning = new()
                        {
                            StallId = sensor.StallId,
                            SensorId = sensor.Id,
                            MeterId = sensor.MeterId.Value,
                            CreatedDate = now,
                        };
                        dbContext.Add(cannotConnectWarning);
                    }
                }
                await dbContext.SaveChangesAsync();
            }
            catch (PingException)
            {
                Console.WriteLine("Error while pinging.");
                // Handle exceptions if necessary
            }
            finally
            {
                myPing.Dispose();
            }

        }
    }
}
