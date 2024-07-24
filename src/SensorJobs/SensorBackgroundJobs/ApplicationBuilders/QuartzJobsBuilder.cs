using Quartz;

using SensorBackgroundJobs.Helpers;
using SensorBackgroundJobs.Jobs;

namespace SensorBackgroundJobs.ApplicationBuilders
{
    public static class QuartzJobsBuilder
    {
        public static HostApplicationBuilder AddQuartzJobs(this HostApplicationBuilder builder)
        {
            builder.Services.AddQuartz(q =>
            {
                q.AddJobListener<TrackNextJobListener>();
                q.AddJobAndTrigger<LostMessageCheckJob>(builder.Configuration);
                q.AddJobAndTrigger<SensorPingJob>(builder.Configuration);
            });

            builder.Services.AddQuartzHostedService(options =>
            {
                // when shutting down we want jobs to complete gracefully
                options.WaitForJobsToComplete = true;
            });

            return builder;
        }
    }

}
