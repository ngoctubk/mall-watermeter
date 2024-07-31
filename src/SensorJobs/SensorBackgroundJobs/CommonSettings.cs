namespace SensorBackgroundJobs
{
    public class CommonSettings
    {
        public double LostMessageHours { get; set; }
        public int OldErrorsAndWarningsInMonths { get; set; }
        public int PingTimeout {  get; set; }
        public double MaxTimeToUpdateLastMeterInMinutes { get; set; }
        public double TimeDistanceToUpdateInMinutes { get; set; }
    }
}
