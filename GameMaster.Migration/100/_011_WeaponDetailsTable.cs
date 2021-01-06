using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(11)]
    public class _011_WeaponDetailsTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.WeaponDetails)
                .AutoId()
                .IntForeignKeyIndexed("WeaponId", Tables.Weapon, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable()
                .IntForeignKeyIndexed("SeasonId", Tables.Season, false, false)
                .WithColumn("WinRate").AsFloat().Nullable();
        }
    }
}
