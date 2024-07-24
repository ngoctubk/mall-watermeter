using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SensorBackgroundJobs.Models
{
    public class Setting
    {
        public int InvoicePublishDay { get; set; }
        public double WaterUnitPrice { get; set; }
        public double GasUnitPrice { get; set; }
        public string SensorIPTemplate { get; set; }
        public string MQTTIP { get; set; }
    }

    public class SettingConfiguration : IEntityTypeConfiguration<Setting>
    {
        public void Configure(EntityTypeBuilder<Setting> builder)
        {
            builder.ToTable("Settings");
            builder.HasNoKey();

            builder.Property(e => e.SensorIPTemplate).HasMaxLength(15);
            builder.Property(e => e.MQTTIP).HasMaxLength(15);

        }
    }
}
