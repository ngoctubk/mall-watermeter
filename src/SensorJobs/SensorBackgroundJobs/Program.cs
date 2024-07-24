using Microsoft.EntityFrameworkCore;

using SensorBackgroundJobs;
using SensorBackgroundJobs.ApplicationBuilders;
using SensorBackgroundJobs.Jobs;

using Serilog;
using Serilog.Events;

Log.Logger = new LoggerConfiguration()
    .MinimumLevel.Override("Microsoft", LogEventLevel.Information)
    .Enrich.FromLogContext()
    .WriteTo.Console()
    .CreateBootstrapLogger();

try
{
    Log.Information("Starting web application");

    var builder = Host.CreateApplicationBuilder(args);

    builder.Services.AddSerilog((services, lc) => lc
                                                    .ReadFrom.Configuration(builder.Configuration)
                                                    .ReadFrom.Services(services));

    builder.Services.Configure<MqttSettings>(builder.Configuration.GetSection("MqttSettings"));
    builder.Services.Configure<CommonSettings>(builder.Configuration.GetSection("CommonSettings"));

    builder.Services.AddHostedService<WaterSyncJob>();
    builder.Services.AddHostedService<GasSyncJob>();

    builder.AddQuartzJobs();

    builder.Services.AddDbContextPool<AppDbContext>(options => options.
                                                    UseNpgsql(builder.Configuration.GetConnectionString("MeterManagement")));

    var host = builder.Build();

    await host.RunAsync();
}
catch (Exception ex)
{
    Log.Fatal(ex, "Application terminated unexpectedly");
}
finally
{
    Log.CloseAndFlush();
}