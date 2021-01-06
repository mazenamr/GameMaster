using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(17)]
    public class _017_UsageAgainstCharacterWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.UsageAgainstCharacterWeapon)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Tables.Character, false, false)
                .IntForeignKeyIndexed("WeaponId", Tables.Weapon, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
