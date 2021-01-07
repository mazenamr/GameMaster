using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(13)]
    public class _013_UsageWithTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.UsageWith)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
