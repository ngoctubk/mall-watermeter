using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SensorBackgroundJobs.Models
{
    public class CannotConnectWarning
    {
        public Guid Id { get; set; }
        public Guid? StallId { get; set; }
        public required Guid SensorId { get; set; }
        public required Guid MeterId { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public class CannotConnectWarningConfiguration : IEntityTypeConfiguration<CannotConnectWarning>
    {
        public void Configure(EntityTypeBuilder<CannotConnectWarning> builder)
        {
            builder.ToTable("CannotConnectWarnings");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder.HasOne<Stall>()
                .WithMany()
                .HasForeignKey(a => a.StallId)
                .IsRequired(false);

            builder.HasOne<Sensor>()
                .WithMany()
                .HasForeignKey(a => a.SensorId);

            builder.HasOne<Meter>()
                .WithMany()
                .HasForeignKey(a => a.MeterId);

            builder.HasIndex(a => a.CreatedDate);
        }
    }
}
