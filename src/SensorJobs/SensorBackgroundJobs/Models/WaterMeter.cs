﻿using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace SensorBackgroundJobs.Models
{
    public class WaterMeter
    {
        public Guid Id { get; set; }
        public Guid? StallId { get; set; }
        public string? StallCode { get; set; }
        public Stall? Stall { get; set; }
        public required Guid SensorId { get; set; }
        public required string SensorCode { get; set; }
        public Sensor? Sensor { get; set; }
        public required Guid MeterId { get; set; }
        public required string MeterCode { get; set; }
        public Meter? Meter { get; set; }
        public double Value { get; set; }
        public double Raw { get; set; }
        public double Pre { get; set; }
        public string? Error { get; set; }
        public string? Rate { get; set; }
        public DateTime FromTimestamp { get; set; }
        public DateTime ToTimestamp { get; set; }
    }

    public class WaterMeterConfiguration : IEntityTypeConfiguration<WaterMeter>
    {
        public void Configure(EntityTypeBuilder<WaterMeter> builder)
        {
            builder.ToTable("WaterMeters");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder
                .HasOne(e => e.Stall)
                .WithMany(e => e.WaterMeters)
                .HasForeignKey(e => e.StallId)
                .IsRequired(false);

            builder.Property(a => a.StallCode).HasMaxLength(40);

            builder
                .HasOne(e => e.Sensor)
                .WithMany(e => e.WaterMeters)
                .HasForeignKey(e => e.SensorId);

            builder.Property(a => a.SensorCode).HasMaxLength(40);
            builder.Property(a => a.SensorCode).IsRequired();
            builder.HasIndex(a => a.SensorCode);

            builder
                .HasOne(e => e.Meter)
                .WithMany(e => e.WaterMeters)
                .HasForeignKey(e => e.MeterId);

            builder.Property(a => a.MeterCode).HasMaxLength(40);
            builder.Property(a => a.MeterCode).IsRequired();

            builder.Property(a => a.Value).HasMaxLength(40);
            builder.HasIndex(a => a.Value);
            builder.Property(a => a.Raw).HasMaxLength(40);
            builder.Property(a => a.Pre).HasMaxLength(40);
            builder.Property(a => a.Rate).HasMaxLength(40);

            builder.Property(a => a.FromTimestamp).HasColumnType("timestamp without time zone");
            builder.HasIndex(a => a.FromTimestamp);
            builder.Property(a => a.ToTimestamp).HasColumnType("timestamp without time zone");
            builder.HasIndex(a => a.ToTimestamp);
        }
    }
}
