using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(13)]
    public class _013_GameTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Game)
                .AutoId()
                .IntForeignKeyIndexed("SeasonId", Constants.Tables.Season, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("RegionId", Constants.Tables.Region, isNullable: false, isPK: false)
                .WithColumn("StartTime").AsDateTime().NotNullable();
        }
    }
}
