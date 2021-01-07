using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(3)]
    public class _003_RegionTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Region)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Twenty).NotNullable()
                .IsActive();
        }
    }
}
