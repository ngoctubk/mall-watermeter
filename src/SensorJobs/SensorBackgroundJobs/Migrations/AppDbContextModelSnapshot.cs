﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;
using SensorBackgroundJobs;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    [DbContext(typeof(AppDbContext))]
    partial class AppDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.7")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("SensorBackgroundJobs.Models.CannotConnectWarning", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("SensorId")
                        .HasColumnType("uuid");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("MeterId");

                    b.HasIndex("SensorId");

                    b.HasIndex("StallId");

                    b.ToTable("CannotConnectWarnings", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.GasMeter", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Error")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<DateTime>("FromTimestamp")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("MeterCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<double>("Pre")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.Property<string>("Rate")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<double>("Raw")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.Property<string>("SensorCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid>("SensorId")
                        .HasColumnType("uuid");

                    b.Property<string>("StallCode")
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.Property<DateTime>("ToTimestamp")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("Value")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.HasKey("Id");

                    b.HasIndex("FromTimestamp");

                    b.HasIndex("MeterId");

                    b.HasIndex("SensorCode");

                    b.HasIndex("SensorId");

                    b.HasIndex("StallId");

                    b.HasIndex("ToTimestamp");

                    b.HasIndex("Value");

                    b.ToTable("GasMeters", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Meter", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<bool>("IsActive")
                        .HasColumnType("boolean");

                    b.Property<string>("MeterCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<short>("MeterType")
                        .HasColumnType("smallint");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("MeterCode")
                        .IsUnique();

                    b.HasIndex("MeterType");

                    b.ToTable("Meters", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.MeterError", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<Guid?>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<string>("Payload")
                        .HasMaxLength(500)
                        .HasColumnType("character varying(500)");

                    b.Property<string>("Reason")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)");

                    b.Property<Guid?>("SensorId")
                        .HasColumnType("uuid");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.Property<string>("Topic")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("MeterId");

                    b.HasIndex("Reason");

                    b.HasIndex("SensorId");

                    b.HasIndex("StallId");

                    b.ToTable("MeterErrors", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.NoIncomingMessageWarning", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<Guid>("SensorId")
                        .HasColumnType("uuid");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("MeterId");

                    b.HasIndex("SensorId");

                    b.HasIndex("StallId");

                    b.ToTable("NoIncomingMessageWarnings", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Sensor", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("IpAddress")
                        .IsRequired()
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)");

                    b.Property<bool>("IsActive")
                        .HasColumnType("boolean");

                    b.Property<Guid?>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<string>("SensorCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("SensorName")
                        .IsRequired()
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.Property<string>("SnNumber")
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("IpAddress")
                        .IsUnique();

                    b.HasIndex("MeterId")
                        .IsUnique();

                    b.HasIndex("SensorCode")
                        .IsUnique();

                    b.HasIndex("SensorName");

                    b.HasIndex("SnNumber");

                    b.HasIndex("StallId");

                    b.ToTable("Sensors", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Setting", b =>
                {
                    b.Property<double>("GasUnitPrice")
                        .HasColumnType("double precision");

                    b.Property<int>("InvoicePublishDay")
                        .HasColumnType("integer");

                    b.Property<string>("MQTTIP")
                        .IsRequired()
                        .HasMaxLength(15)
                        .HasColumnType("character varying(15)");

                    b.Property<string>("SensorIPTemplate")
                        .IsRequired()
                        .HasMaxLength(15)
                        .HasColumnType("character varying(15)");

                    b.Property<double>("WaterUnitPrice")
                        .HasColumnType("double precision");

                    b.ToTable("Settings", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Stall", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<int>("InvoicePublishDay")
                        .HasColumnType("integer");

                    b.Property<bool>("IsActive")
                        .HasColumnType("boolean");

                    b.Property<string>("StallCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("StallFloor")
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("StallInfo")
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.Property<string>("StallLot")
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("StallName")
                        .IsRequired()
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("StallCode")
                        .IsUnique();

                    b.HasIndex("StallFloor");

                    b.HasIndex("StallInfo");

                    b.HasIndex("StallLot");

                    b.HasIndex("StallName");

                    b.ToTable("Stalls", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.StallGasInvoice", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Comments")
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("EndValue")
                        .HasColumnType("double precision");

                    b.Property<string>("InvoiceCode")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)");

                    b.Property<bool>("IsPaid")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsPrinted")
                        .HasColumnType("boolean");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<double>("Payment")
                        .HasColumnType("double precision");

                    b.Property<double>("Quantity")
                        .HasColumnType("double precision");

                    b.Property<Guid>("StallId")
                        .HasColumnType("uuid");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("StartValue")
                        .HasColumnType("double precision");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("EndDate");

                    b.HasIndex("EndValue");

                    b.HasIndex("InvoiceCode")
                        .IsUnique();

                    b.HasIndex("IsPaid");

                    b.HasIndex("IsPrinted");

                    b.HasIndex("MeterId");

                    b.HasIndex("Payment");

                    b.HasIndex("Quantity");

                    b.HasIndex("StallId");

                    b.HasIndex("StartDate");

                    b.HasIndex("StartValue");

                    b.ToTable("StallGasInvoices", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.StallWaterInvoice", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Comments")
                        .HasMaxLength(300)
                        .HasColumnType("character varying(300)");

                    b.Property<DateTime>("CreatedDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("EndValue")
                        .HasColumnType("double precision");

                    b.Property<string>("InvoiceCode")
                        .HasMaxLength(100)
                        .HasColumnType("character varying(100)");

                    b.Property<bool>("IsPaid")
                        .HasColumnType("boolean");

                    b.Property<bool>("IsPrinted")
                        .HasColumnType("boolean");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<double>("Payment")
                        .HasColumnType("double precision");

                    b.Property<double>("Quantity")
                        .HasColumnType("double precision");

                    b.Property<Guid>("StallId")
                        .HasColumnType("uuid");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("StartValue")
                        .HasColumnType("double precision");

                    b.HasKey("Id");

                    b.HasIndex("CreatedDate");

                    b.HasIndex("EndDate");

                    b.HasIndex("EndValue");

                    b.HasIndex("InvoiceCode")
                        .IsUnique();

                    b.HasIndex("IsPaid");

                    b.HasIndex("IsPrinted");

                    b.HasIndex("MeterId");

                    b.HasIndex("Payment");

                    b.HasIndex("Quantity");

                    b.HasIndex("StallId");

                    b.HasIndex("StartDate");

                    b.HasIndex("StartValue");

                    b.ToTable("StallWaterInvoices", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.WaterMeter", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid");

                    b.Property<string>("Error")
                        .HasColumnType("text");

                    b.Property<DateTime>("FromTimestamp")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("MeterCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid>("MeterId")
                        .HasColumnType("uuid");

                    b.Property<double>("Pre")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.Property<string>("Rate")
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<double>("Raw")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.Property<string>("SensorCode")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid>("SensorId")
                        .HasColumnType("uuid");

                    b.Property<string>("StallCode")
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<Guid?>("StallId")
                        .HasColumnType("uuid");

                    b.Property<DateTime>("ToTimestamp")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("Value")
                        .HasMaxLength(40)
                        .HasColumnType("double precision");

                    b.HasKey("Id");

                    b.HasIndex("FromTimestamp");

                    b.HasIndex("MeterId");

                    b.HasIndex("SensorCode");

                    b.HasIndex("SensorId");

                    b.HasIndex("StallId");

                    b.HasIndex("ToTimestamp");

                    b.HasIndex("Value");

                    b.ToTable("WaterMeters", (string)null);
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.CannotConnectWarning", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", null)
                        .WithMany()
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Sensor", null)
                        .WithMany()
                        .HasForeignKey("SensorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", null)
                        .WithMany()
                        .HasForeignKey("StallId");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.GasMeter", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", "Meter")
                        .WithMany("GasMeters")
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Sensor", "Sensor")
                        .WithMany("GasMeters")
                        .HasForeignKey("SensorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", "Stall")
                        .WithMany("GasMeters")
                        .HasForeignKey("StallId");

                    b.Navigation("Meter");

                    b.Navigation("Sensor");

                    b.Navigation("Stall");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.MeterError", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", null)
                        .WithMany()
                        .HasForeignKey("MeterId");

                    b.HasOne("SensorBackgroundJobs.Models.Sensor", null)
                        .WithMany()
                        .HasForeignKey("SensorId");

                    b.HasOne("SensorBackgroundJobs.Models.Stall", null)
                        .WithMany()
                        .HasForeignKey("StallId");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.NoIncomingMessageWarning", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", null)
                        .WithMany()
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Sensor", null)
                        .WithMany()
                        .HasForeignKey("SensorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", null)
                        .WithMany()
                        .HasForeignKey("StallId");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Sensor", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", "Meter")
                        .WithOne("Sensor")
                        .HasForeignKey("SensorBackgroundJobs.Models.Sensor", "MeterId");

                    b.HasOne("SensorBackgroundJobs.Models.Stall", "Stall")
                        .WithMany("Sensors")
                        .HasForeignKey("StallId");

                    b.Navigation("Meter");

                    b.Navigation("Stall");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.StallGasInvoice", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", "Meter")
                        .WithMany("StallGasInvoices")
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", "Stall")
                        .WithMany("StallGasInvoices")
                        .HasForeignKey("StallId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Meter");

                    b.Navigation("Stall");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.StallWaterInvoice", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", "Meter")
                        .WithMany("StallWaterInvoices")
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", "Stall")
                        .WithMany("StallWaterInvoices")
                        .HasForeignKey("StallId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Meter");

                    b.Navigation("Stall");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.WaterMeter", b =>
                {
                    b.HasOne("SensorBackgroundJobs.Models.Meter", "Meter")
                        .WithMany("WaterMeters")
                        .HasForeignKey("MeterId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Sensor", "Sensor")
                        .WithMany("WaterMeters")
                        .HasForeignKey("SensorId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.HasOne("SensorBackgroundJobs.Models.Stall", "Stall")
                        .WithMany("WaterMeters")
                        .HasForeignKey("StallId");

                    b.Navigation("Meter");

                    b.Navigation("Sensor");

                    b.Navigation("Stall");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Meter", b =>
                {
                    b.Navigation("GasMeters");

                    b.Navigation("Sensor");

                    b.Navigation("StallGasInvoices");

                    b.Navigation("StallWaterInvoices");

                    b.Navigation("WaterMeters");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Sensor", b =>
                {
                    b.Navigation("GasMeters");

                    b.Navigation("WaterMeters");
                });

            modelBuilder.Entity("SensorBackgroundJobs.Models.Stall", b =>
                {
                    b.Navigation("GasMeters");

                    b.Navigation("Sensors");

                    b.Navigation("StallGasInvoices");

                    b.Navigation("StallWaterInvoices");

                    b.Navigation("WaterMeters");
                });
#pragma warning restore 612, 618
        }
    }
}
