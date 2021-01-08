using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(2)]
    public class _002_RegionTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Region)
                .WithColumn("Id").AsInt32().PrimaryKey().NotNullable()
                .WithColumn("Name").AsString(StringLength.Twenty).NotNullable()
                .IsActive();
        }
    }
}
