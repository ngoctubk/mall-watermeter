namespace SensorBackgroundJobs
{
    public class MqttSettings
    {
        public required string GasClientId {  get; set; }
        public required string WaterClientId {  get; set; }
        public required string Server {  get; set; }
        public int Port { get; set; }
        public required string Username { get; set; }
        public required string Password { get; set; }
        public required string GasTopic { get; set; }
        public required string WaterTopic { get; set; }
    }
}
