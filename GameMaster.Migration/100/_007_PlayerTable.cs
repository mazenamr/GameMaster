using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(7)]
    public class _007_PlayerTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Player)
                .AutoId()
                .IntForeignKeyIndexed("PersonId", Tables.Person, false, false)
                .IntForeignKeyIndexed("RegionId", Tables.Region, false, false)
                .IntForeignKeyIndexed("RankId", Tables.Rank, false, false)
                .WithColumn("Score").AsInt32().Nullable()
                .WithColumn("Skill").AsInt32().NotNullable()
                .WithColumn("Temper").AsInt32().NotNullable()
                .WithColumn("DateCreated").AsDate().NotNullable()
                .IsActive();
        }
    }
}
