using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddWarnings : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "CannotConnectWarnings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    SensorId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_CannotConnectWarnings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_CannotConnectWarnings_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CannotConnectWarnings_Sensors_SensorId",
                        column: x => x.SensorId,
                        principalTable: "Sensors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_CannotConnectWarnings_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateTable(
                name: "NoIncomingMessageWarnings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: true),
                    SensorId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_NoIncomingMessageWarnings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_NoIncomingMessageWarnings_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_NoIncomingMessageWarnings_Sensors_SensorId",
                        column: x => x.SensorId,
                        principalTable: "Sensors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_NoIncomingMessageWarnings_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_MeterErrors_Reason",
                table: "MeterErrors",
                column: "Reason");

            migrationBuilder.CreateIndex(
                name: "IX_CannotConnectWarnings_CreatedDate",
                table: "CannotConnectWarnings",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_CannotConnectWarnings_MeterId",
                table: "CannotConnectWarnings",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_CannotConnectWarnings_SensorId",
                table: "CannotConnectWarnings",
                column: "SensorId");

            migrationBuilder.CreateIndex(
                name: "IX_CannotConnectWarnings_StallId",
                table: "CannotConnectWarnings",
                column: "StallId");

            migrationBuilder.CreateIndex(
                name: "IX_NoIncomingMessageWarnings_CreatedDate",
                table: "NoIncomingMessageWarnings",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_NoIncomingMessageWarnings_MeterId",
                table: "NoIncomingMessageWarnings",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_NoIncomingMessageWarnings_SensorId",
                table: "NoIncomingMessageWarnings",
                column: "SensorId");

            migrationBuilder.CreateIndex(
                name: "IX_NoIncomingMessageWarnings_StallId",
                table: "NoIncomingMessageWarnings",
                column: "StallId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "CannotConnectWarnings");

            migrationBuilder.DropTable(
                name: "NoIncomingMessageWarnings");

            migrationBuilder.DropIndex(
                name: "IX_MeterErrors_Reason",
                table: "MeterErrors");
        }
    }
}
