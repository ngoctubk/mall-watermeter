using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SensorBackgroundJobs.Models
{
    public class Meter
    {
        public Guid Id { get; set; }
        public required string MeterCode { get; set; }
        public required string MeterType { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public Sensor? Sensor {  get; set; }
        public ICollection<WaterMeter> WaterMeters { get; } = [];
        public ICollection<GasMeter> GasMeters { get; } = [];
        public ICollection<StallWaterInvoice> StallWaterInvoices { get; } = [];
        public ICollection<StallGasInvoice> StallGasInvoices { get; } = [];
    }

    public class MeterConfiguration : IEntityTypeConfiguration<Meter>
    {
        public void Configure(EntityTypeBuilder<Meter> builder)
        {
            builder.ToTable("Meters");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder.Property(a => a.MeterCode).IsRequired();
            builder.Property(a => a.MeterCode).HasMaxLength(40);
            builder.HasIndex(a => a.MeterCode).IsUnique();

            builder.Property(a => a.MeterType).IsRequired();
            builder.Property(a => a.MeterType).HasMaxLength(40);
            builder.HasIndex(a => a.MeterType);

            builder.HasIndex(a => a.CreatedDate);
        }
    }
}
