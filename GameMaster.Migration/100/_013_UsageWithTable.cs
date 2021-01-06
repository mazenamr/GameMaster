using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(13)]
    public class _013_UsageWithTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.UsageWith)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Tables.Character, false, false)
                .IntForeignKeyIndexed("WeaponId", Tables.Weapon, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
