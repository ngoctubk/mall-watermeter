using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace SensorBackgroundJobs.Migrations
{
    /// <inheritdoc />
    public partial class ChangeMeterTypeToIntAndAddSnNumber : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "SnNumber",
                table: "Sensors",
                type: "character varying(300)",
                maxLength: 300,
                nullable: true);

            migrationBuilder.AlterColumn<short>(
                name: "MeterType",
                table: "Meters",
                type: "smallint",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "character varying(40)",
                oldMaxLength: 40);

            migrationBuilder.CreateIndex(
                name: "IX_Sensors_SnNumber",
                table: "Sensors",
                column: "SnNumber");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_Sensors_SnNumber",
                table: "Sensors");

            migrationBuilder.DropColumn(
                name: "SnNumber",
                table: "Sensors");

            migrationBuilder.AlterColumn<string>(
                name: "MeterType",
                table: "Meters",
                type: "character varying(40)",
                maxLength: 40,
                nullable: false,
                oldClrType: typeof(short),
                oldType: "smallint");
        }
    }
}
