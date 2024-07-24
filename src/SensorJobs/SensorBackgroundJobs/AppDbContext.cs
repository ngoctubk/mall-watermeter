using Microsoft.EntityFrameworkCore;

using SensorBackgroundJobs.Models;

namespace SensorBackgroundJobs
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : DbContext(options)
    {
        public DbSet<Setting> Settings { get; set; }
        public DbSet<Stall> Stalls { get; set; }
        public DbSet<Sensor> Sensors { get; set; }
        public DbSet<Meter> Meters { get; set; }

        public DbSet<WaterMeter> WaterMeters { get; set; }
        public DbSet<GasMeter> GasMeters { get; set; }
        public DbSet<StallWaterInvoice> StallWaterInvoices { get; set; }
        public DbSet<StallGasInvoice> StallGasInvoices { get; set; }
        public DbSet<MeterError> MeterErrors { get; set; }
        public DbSet<NoIncomingMessageWarning> NoIncomingMessageWarnings { get; set; }
        public DbSet<CannotConnectWarning> CannotConnectWarnings { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new SettingConfiguration());
            modelBuilder.ApplyConfiguration(new StallConfiguration());
            modelBuilder.ApplyConfiguration(new MeterConfiguration());
            modelBuilder.ApplyConfiguration(new SensorConfiguration());
            modelBuilder.ApplyConfiguration(new WaterMeterConfiguration());
            modelBuilder.ApplyConfiguration(new GasMeterConfiguration());
            modelBuilder.ApplyConfiguration(new StallWaterInvoiceConfiguration());
            modelBuilder.ApplyConfiguration(new StallGasInvoiceConfiguration());
            modelBuilder.ApplyConfiguration(new MeterErrorConfiguration());
            modelBuilder.ApplyConfiguration(new NoIncomingMessageWarningConfiguration());
            modelBuilder.ApplyConfiguration(new CannotConnectWarningConfiguration());
        }
    }
}
