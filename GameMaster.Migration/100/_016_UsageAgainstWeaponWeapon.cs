using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(16)]
    public class _016_UsageAgainstWeaponWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.UsageAgainstWeaponWeapon)
                .AutoId()
                .IntForeignKeyIndexed("Weapon1Id", Tables.Weapon, false, false)
                .IntForeignKeyIndexed("Weapon2Id", Tables.Weapon, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
