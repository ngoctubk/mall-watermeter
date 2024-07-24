using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddMeterSensor : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Stalls_StallCode",
                table: "Stalls");

            migrationBuilder.AddColumn<string>(
                name: "MQTTIP",
                table: "Settings",
                type: "character varying(15)",
                maxLength: 15,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "SensorIPTemplate",
                table: "Settings",
                type: "character varying(15)",
                maxLength: 15,
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateTable(
                name: "Meters",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    MeterType = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    IsActive = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Meters", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Sensors",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    SensorCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    SensorName = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: false),
                    IsActive = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: true),
                    IpAddress = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Sensors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Sensors_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Sensors_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallCode",
                table: "Stalls",
                column: "StallCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Meters_MeterCode",
                table: "Meters",
                column: "MeterCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Meters_MeterType",
                table: "Meters",
                column: "MeterType");

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_IpAddress",
                table: "Sensors",
                column: "IpAddress",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_MeterId",
                table: "Sensors",
                column: "MeterId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_SensorCode",
                table: "Sensors",
                column: "SensorCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_SensorName",
                table: "Sensors",
                column: "SensorName");

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_StallId",
                table: "Sensors",
                column: "StallId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Sensors");

            migrationBuilder.DropTable(
                name: "Meters");

            migrationBuilder.DropIndex(
                name: "IX_Stalls_StallCode",
                table: "Stalls");

            migrationBuilder.DropColumn(
                name: "MQTTIP",
                table: "Settings");

            migrationBuilder.DropColumn(
                name: "SensorIPTemplate",
                table: "Settings");

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallCode",
                table: "Stalls",
                column: "StallCode");
        }
    }
}
