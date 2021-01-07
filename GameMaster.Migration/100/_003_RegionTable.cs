using FluentMigrator;

namespace GameMaster.Migration._100
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
