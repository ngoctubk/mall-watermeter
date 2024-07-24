namespace SensorBackgroundJobs.Dtos
{
    public class SensorInformation
    {
        public bool IsExisted { get; set; }
        public bool IsActive { get; set; }
        public string? Topic { get; set; }
        public string? Payload { get; set; }
        public Guid? StallId { get; set; }
        public string? StallCode { get; set; }
        public Guid? SensorId { get; set; }
        public string? SensorCode { get; set; }
        public Guid? MeterId { get; set; }
        public string? MeterCode { get; set; }
    }
}
