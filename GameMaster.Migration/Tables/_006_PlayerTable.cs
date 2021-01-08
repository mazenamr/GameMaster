using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(6)]
    public class _006_PlayerTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Player)
                .AutoId()
                .WithColumn("Score").AsInt32().Nullable()
                .WithColumn("Skill").AsInt32().NotNullable()
                .WithColumn("Temper").AsInt32().NotNullable()
                .IntForeignKeyIndexed("RegionId", Constants.Tables.Region, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("RankId", Constants.Tables.Rank, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("PersonId", Constants.Tables.Person, isNullable: false, isPK: false)
                .WithColumn("DateCreated").AsDate().NotNullable()
                .IsActive();
        }
    }
}
