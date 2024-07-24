using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SensorBackgroundJobs.Models
{
    public class Sensor
    {
        public Guid Id { get; set; }
        public required string SensorCode { get; set; }
        public required string SensorName { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid? StallId { get; set; }
        public Stall? Stall { get; set; }
        public Guid? MeterId { get; set; }
        public Meter? Meter { get; set; }
        public required string IpAddress { get; set; }
        public ICollection<WaterMeter> WaterMeters { get; } = [];
        public ICollection<GasMeter> GasMeters { get; } = [];
    }
    public class SensorConfiguration : IEntityTypeConfiguration<Sensor>
    {
        public void Configure(EntityTypeBuilder<Sensor> builder)
        {
            builder.ToTable("Sensors");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder.Property(a => a.SensorCode).IsRequired();
            builder.Property(a => a.SensorCode).HasMaxLength(40);
            builder.HasIndex(a => a.SensorCode).IsUnique();

            builder.Property(a => a.SensorName).IsRequired();
            builder.Property(a => a.SensorName).HasMaxLength(300);
            builder.HasIndex(a => a.SensorName);

            builder.Property(a => a.IpAddress).IsRequired();
            builder.Property(a => a.IpAddress).HasMaxLength(100);
            builder.HasIndex(a => a.IpAddress).IsUnique();

            builder.HasIndex(a => a.CreatedDate);

            builder
                .HasOne(e => e.Stall)
                .WithMany(e => e.Sensors)
                .HasForeignKey(e => e.StallId)
                .IsRequired(false);

            builder
                .HasOne(e => e.Meter)
                .WithOne(e => e.Sensor)
                .HasForeignKey<Sensor>(e => e.MeterId)
                .IsRequired(false);
        }
    }
}
