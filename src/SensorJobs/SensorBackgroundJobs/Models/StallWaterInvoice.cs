using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace SensorBackgroundJobs.Models
{
    public class StallWaterInvoice
    {
        public Guid Id { get; set; }
        public Guid StallId { get; set; }
        public required Stall Stall { get; set; }
        public Guid MeterId { get; set; }
        public required Meter Meter { get; set; }
        public string? InvoiceCode { get; set; }
        public double Quantity { get; set; }
        public double Payment { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double StartValue { get; set; }
        public double EndValue { get; set; }
        public string? Comments { get; set; }
        public bool IsPrinted { get; set; }
        public bool IsPaid { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public class StallWaterInvoiceConfiguration : IEntityTypeConfiguration<StallWaterInvoice>
    {
        public void Configure(EntityTypeBuilder<StallWaterInvoice> builder)
        {
            builder.ToTable("StallWaterInvoices");

            builder.HasKey(a => a.Id);
            builder.Property(a => a.Id).ValueGeneratedOnAdd();

            builder
                .HasOne(e => e.Stall)
                .WithMany(e => e.StallWaterInvoices)
                .HasForeignKey(e => e.StallId);

            builder
                .HasOne(e => e.Meter)
                .WithMany(e => e.StallWaterInvoices)
                .HasForeignKey(e => e.MeterId);

            builder.Property(a => a.InvoiceCode).HasMaxLength(100);
            builder.HasIndex(a => a.InvoiceCode).IsUnique();

            builder.Property(a => a.Comments).HasMaxLength(300);

            builder.HasIndex(a => a.Quantity);
            builder.HasIndex(a => a.Payment);
            builder.HasIndex(a => a.StartDate);
            builder.HasIndex(a => a.EndDate);
            builder.HasIndex(a => a.StartValue);
            builder.HasIndex(a => a.EndValue);
            builder.HasIndex(a => a.IsPrinted);
            builder.HasIndex(a => a.IsPaid);
            builder.HasIndex(a => a.CreatedDate);
        }
    }
}
