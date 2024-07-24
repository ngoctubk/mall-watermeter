using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class AddInvoices : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "StallGasInvoices",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    InvoiceCode = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    Quantity = table.Column<double>(type: "double precision", nullable: false),
                    Payment = table.Column<double>(type: "double precision", nullable: false),
                    StartDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    EndDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    StartValue = table.Column<double>(type: "double precision", nullable: false),
                    EndValue = table.Column<double>(type: "double precision", nullable: false),
                    Comments = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                    IsPrinted = table.Column<bool>(type: "boolean", nullable: false),
                    IsPaid = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StallGasInvoices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StallGasInvoices_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StallGasInvoices_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "StallWaterInvoices",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uuid", nullable: false),
                    StallId = table.Column<Guid>(type: "uuid", nullable: false),
                    MeterId = table.Column<Guid>(type: "uuid", nullable: false),
                    InvoiceCode = table.Column<string>(type: "character varying(100)", maxLength: 100, nullable: true),
                    Quantity = table.Column<double>(type: "double precision", nullable: false),
                    Payment = table.Column<double>(type: "double precision", nullable: false),
                    StartDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    EndDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    StartValue = table.Column<double>(type: "double precision", nullable: false),
                    EndValue = table.Column<double>(type: "double precision", nullable: false),
                    Comments = table.Column<string>(type: "character varying(300)", maxLength: 300, nullable: true),
                    IsPrinted = table.Column<bool>(type: "boolean", nullable: false),
                    IsPaid = table.Column<bool>(type: "boolean", nullable: false),
                    CreatedDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_StallWaterInvoices", x => x.Id);
                    table.ForeignKey(
                        name: "FK_StallWaterInvoices_Meters_MeterId",
                        column: x => x.MeterId,
                        principalTable: "Meters",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_StallWaterInvoices_Stalls_StallId",
                        column: x => x.StallId,
                        principalTable: "Stalls",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_CreatedDate",
                table: "StallGasInvoices",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_EndDate",
                table: "StallGasInvoices",
                column: "EndDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_EndValue",
                table: "StallGasInvoices",
                column: "EndValue");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_InvoiceCode",
                table: "StallGasInvoices",
                column: "InvoiceCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_IsPaid",
                table: "StallGasInvoices",
                column: "IsPaid");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_IsPrinted",
                table: "StallGasInvoices",
                column: "IsPrinted");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_MeterId",
                table: "StallGasInvoices",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_Payment",
                table: "StallGasInvoices",
                column: "Payment");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_Quantity",
                table: "StallGasInvoices",
                column: "Quantity");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_StallId",
                table: "StallGasInvoices",
                column: "StallId");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_StartDate",
                table: "StallGasInvoices",
                column: "StartDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallGasInvoices_StartValue",
                table: "StallGasInvoices",
                column: "StartValue");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_CreatedDate",
                table: "StallWaterInvoices",
                column: "CreatedDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_EndDate",
                table: "StallWaterInvoices",
                column: "EndDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_EndValue",
                table: "StallWaterInvoices",
                column: "EndValue");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_InvoiceCode",
                table: "StallWaterInvoices",
                column: "InvoiceCode",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_IsPaid",
                table: "StallWaterInvoices",
                column: "IsPaid");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_IsPrinted",
                table: "StallWaterInvoices",
                column: "IsPrinted");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_MeterId",
                table: "StallWaterInvoices",
                column: "MeterId");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_Payment",
                table: "StallWaterInvoices",
                column: "Payment");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_Quantity",
                table: "StallWaterInvoices",
                column: "Quantity");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_StallId",
                table: "StallWaterInvoices",
                column: "StallId");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_StartDate",
                table: "StallWaterInvoices",
                column: "StartDate");

            migrationBuilder.CreateIndex(
                name: "IX_StallWaterInvoices_StartValue",
                table: "StallWaterInvoices",
                column: "StartValue");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "StallGasInvoices");

            migrationBuilder.DropTable(
                name: "StallWaterInvoices");
        }
    }
}
