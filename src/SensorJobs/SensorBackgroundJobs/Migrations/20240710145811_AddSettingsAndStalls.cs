using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddSettingsAndStalls : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Settings",
                columns: table => new
                {
                    InvoicePublishDay = table.Column<int>(type: "integer", nullable: false),
                    WaterUnitPrice = table.Column<double>(type: "double precision", nullable: false),
                    GasUnitPrice = table.Column<double>(type: "double precision", nullable: false)
                },
                constraints: table =>
                {
                });

            migrationBuilder.CreateTable(
                name: "Stalls",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallCode = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: false),
                    StallName = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: false),
                    StallFloor = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    StallLot = table.Column<string>(type: "character varying(40)", maxLength: 40, nullable: true),
                    StallInfo = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                    IsActive = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    InvoicePublishDay = table.Column<int>(type: "integer", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Stalls", x => x.Id);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallCode",
                table: "Stalls",
                column: "StallCode");

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallFloor",
                table: "Stalls",
                column: "StallFloor");

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallInfo",
                table: "Stalls",
                column: "StallInfo");

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallLot",
                table: "Stalls",
                column: "StallLot");

            migrationBuilder.CreateIndex(
                name: "IX_Stalls_StallName",
                table: "Stalls",
                column: "StallName");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Settings");

            migrationBuilder.DropTable(
                name: "Stalls");
        }
    }
}
