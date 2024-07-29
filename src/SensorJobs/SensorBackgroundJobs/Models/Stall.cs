using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;

namespace SensorBackgroundJobs.Models
{
    public class Stall
    {
        public Guid Id { get; set; }
        public required string StallCode { get; set; }
        public required string StallName { get; set; }
        public string? StallFloor { get; set; }
        public string? StallLot { get; set; }
        public string? StallInfo { get; set; }
        public bool IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public int InvoicePublishDay { get; set; }
        public ICollection<Sensor> Sensors { get; } = [];
        public ICollection<WaterMeter> WaterMeters { get; } = [];
        public ICollection<GasMeter> GasMeters { get; } = [];
        public ICollection<StallWaterInvoice> StallWaterInvoices { get; } = [];
        public ICollection<StallGasInvoice> StallGasInvoices { get; } = [];
    }

    public class StallConfiguration : IEntityTypeConfiguration<Stall>
    {
        public void Configure(EntityTypeBuilder<Stall> builder)
        {
            builder.ToTable("Stalls");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder.Property(a => a.StallCode).IsRequired();
            builder.Property(a => a.StallCode).HasMaxLength(40);
            builder.HasIndex(a => a.StallCode).IsUnique();

            builder.Property(a => a.StallName).IsRequired();
            builder.Property(a => a.StallName).HasMaxLength(300);
            builder.HasIndex(a => a.StallName);

            builder.Property(a => a.StallFloor).HasMaxLength(40);
            builder.HasIndex(a => a.StallFloor);
            builder.Property(a => a.StallLot).HasMaxLength(40);
            builder.HasIndex(a => a.StallLot);
            builder.Property(a => a.StallInfo).HasMaxLength(300);
            builder.HasIndex(a => a.StallInfo);

            builder.Property(a => a.CreatedDate).HasColumnType("timestamp without time zone");
            builder.HasIndex(a => a.CreatedDate);
        }
    }
}
