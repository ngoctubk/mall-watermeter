using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;

using Quartz;

namespace SensorBackgroundJobs.Jobs
{
    [DisallowConcurrentExecution]
    public class RemoveOldWarningsJobs(AppDbContext dbContext, IOptions<CommonSettings> commonSettingsOption) : IJob
    {
        public async Task Execute(IJobExecutionContext context)
        {
            CommonSettings commonSettings = commonSettingsOption.Value;
            DateTime oldErrorsAndWarningDate = DateTime.UtcNow.AddMonths(commonSettings.OldErrorsAndWarningsInMonths);

            await dbContext.MeterErrors.Where(e => e.CreatedDate < oldErrorsAndWarningDate)
                                        .ExecuteDeleteAsync();

            await dbContext.NoIncomingMessageWarnings.Where(e => e.CreatedDate < oldErrorsAndWarningDate)
                                        .ExecuteDeleteAsync();

            await dbContext.CannotConnectWarnings.Where(e => e.CreatedDate < oldErrorsAndWarningDate)
                                        .ExecuteDeleteAsync();

            await dbContext.SaveChangesAsync();
        }
    }
}
