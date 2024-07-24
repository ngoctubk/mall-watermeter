using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SensorBackgroundJobs.Models
{
    public class MeterError
    {
        public Guid Id { get; set; }
        public string? Topic { get; set; }
        public Guid? StallId { get; set; }
        public Guid? SensorId { get; set; }
        public Guid? MeterId { get; set; }
        public DateTime CreatedDate { get; set; }
        public string? Payload { get; set; }
        public string? Reason { get; set; }
    }

    public class MeterErrorConfiguration : IEntityTypeConfiguration<MeterError>
    {
        public void Configure(EntityTypeBuilder<MeterError> builder)
        {
            builder.ToTable("MeterErrors");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder.Property(a => a.Topic).HasMaxLength(100);
            builder.Property(a => a.Payload).HasMaxLength(200);
            builder.Property(a => a.Reason).HasMaxLength(100);


            builder.HasOne<Stall>()
                .WithMany()
                .HasForeignKey(a => a.StallId)
                .IsRequired(false);

            builder.HasOne<Sensor>()
                .WithMany()
                .HasForeignKey(a => a.SensorId)
                .IsRequired(false);

            builder.HasOne<Meter>()
                .WithMany()
                .HasForeignKey(a => a.MeterId)
                .IsRequired(false);

            builder.HasIndex(a => a.Reason);
            builder.HasIndex(a => a.CreatedDate);
        }
    }
}
