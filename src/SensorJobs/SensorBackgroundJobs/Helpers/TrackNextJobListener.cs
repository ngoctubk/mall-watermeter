using Quartz;

namespace SensorBackgroundJobs.Helpers
{
    public class TrackNextJobListener : IJobListener
    {
        private readonly ILogger<TrackNextJobListener> _logger;

        public string Name => "TrackNextJobListener";

        public TrackNextJobListener(ILogger<TrackNextJobListener> logger)
        {
            _logger = logger;
        }

        public Task JobExecutionVetoed(IJobExecutionContext context, CancellationToken cancellationToken = default)
        {
            return Task.CompletedTask;
        }

        public Task JobToBeExecuted(IJobExecutionContext context, CancellationToken cancellationToken = default)
        {
            return Task.CompletedTask;
        }

        public Task JobWasExecuted(IJobExecutionContext context, JobExecutionException? jobException, CancellationToken cancellationToken = default)
        {
            var jobName = context.JobDetail.JobType.Name;
            if (jobException != null)
            {
                _logger.LogError(jobException, "Job {jobName} throw exception", jobName);
            }

            if (context.NextFireTimeUtc.HasValue)
            {
                DateTime nextRunDate = context.NextFireTimeUtc.Value.DateTime.ToLocalTime();
                _logger.LogInformation("-----------Job {jobName} will run next time at: {time} ----------", jobName, nextRunDate);
            }
            return Task.CompletedTask;
        }
    }
}
