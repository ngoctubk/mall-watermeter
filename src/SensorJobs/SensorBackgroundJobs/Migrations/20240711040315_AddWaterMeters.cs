using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddWaterMeters : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "GasMeters",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    StallCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    SensorId = table.Column<Guid>(type: "uuid", nullable: false),
                    SensorCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    Value = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Raw = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Pre = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Error = table.Column<string>(type: "text", nullable: false),
                    Rate = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    FromTimestamp = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    ToTimestamp = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_GasMeters", x => x.Id);
                    table.ForeignKey(
                        name: "FK_GasMeters_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_GasMeters_Sensors_SensorId",
                        column: x => x.SensorId,
                        principalTable: "Sensors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_GasMeters_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "WaterMeters",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    StallCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    SensorId = table.Column<Guid>(type: "uuid", nullable: false),
                    SensorCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    Value = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Raw = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Pre = table.Column<double>(type: "double precision", maxLength: 40, nullable: false),
                    Error = table.Column<string>(type: "text", nullable: true),
                    Rate = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    FromTimestamp = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    ToTimestamp = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WaterMeters", x => x.Id);
                    table.ForeignKey(
                        name: "FK_WaterMeters_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WaterMeters_Sensors_SensorId",
                        column: x => x.SensorId,
                        principalTable: "Sensors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_WaterMeters_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_CreatedDate",
                table: "Stalls",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_CreatedDate",
                table: "Sensors",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_Meters_CreatedDate",
                table: "Meters",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_FromTimestamp",
                table: "GasMeters",
                column: "FromTimestamp");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_MeterId",
                table: "GasMeters",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_SensorCode",
                table: "GasMeters",
                column: "SensorCode");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_SensorId",
                table: "GasMeters",
                column: "SensorId");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_StallId",
                table: "GasMeters",
                column: "StallId");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_ToTimestamp",
                table: "GasMeters",
                column: "ToTimestamp");

            migrationBuilder.CreateIndex(
                name: "IX_GasMeters_Value",
                table: "GasMeters",
                column: "Value");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_FromTimestamp",
                table: "WaterMeters",
                column: "FromTimestamp");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_MeterId",
                table: "WaterMeters",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_SensorCode",
                table: "WaterMeters",
                column: "SensorCode");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_SensorId",
                table: "WaterMeters",
                column: "SensorId");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_StallId",
                table: "WaterMeters",
                column: "StallId");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_ToTimestamp",
                table: "WaterMeters",
                column: "ToTimestamp");

            migrationBuilder.CreateIndex(
                name: "IX_WaterMeters_Value",
                table: "WaterMeters",
                column: "Value");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "GasMeters");

            migrationBuilder.DropTable(
                name: "WaterMeters");

            migrationBuilder.DropIndex(
                name: "IX_Stalls_CreatedDate",
                table: "Stalls");

            migrationBuilder.DropIndex(
                name: "IX_Sensors_CreatedDate",
                table: "Sensors");

            migrationBuilder.DropIndex(
                name: "IX_Meters_CreatedDate",
                table: "Meters");
        }
    }
}
