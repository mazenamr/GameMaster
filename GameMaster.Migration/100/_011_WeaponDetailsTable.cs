using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(11)]
    public class _011_WeaponDetailsTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.WeaponDetails)
                .AutoId()
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable()
                .IntForeignKeyIndexed("SeasonId", Constants.Tables.Season, isNullable: false, isPK: false);
        }
    }
}
