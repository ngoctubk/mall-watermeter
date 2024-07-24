using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddMeterErrors : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "MeterErrors",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    Topic = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    SensorId = table.Column<Guid>(type: "uuid", nullable: true),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: true),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    Payload = table.Column<string>(type: "character varying(200)", maxLength: 200, nullable: true),
                    Reason = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MeterErrors", x => x.Id);
                    table.ForeignKey(
                        name: "FK_MeterErrors_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MeterErrors_Sensors_SensorId",
                        column: x => x.SensorId,
                        principalTable: "Sensors",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_MeterErrors_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_MeterErrors_CreatedDate",
                table: "MeterErrors",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_MeterErrors_MeterId",
                table: "MeterErrors",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_MeterErrors_SensorId",
                table: "MeterErrors",
                column: "SensorId");

            migrationBuilder.CreateIndex(
                name: "IX_MeterErrors_StallId",
                table: "MeterErrors",
                column: "StallId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "MeterErrors");
        }
    }
}
