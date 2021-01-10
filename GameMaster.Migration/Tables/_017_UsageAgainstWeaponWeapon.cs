using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(17)]
    public class _017_UsageAgainstWeaponWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.UsageAgainstWeaponWeapon)
                .AutoId()
                .IntForeignKeyIndexed("Weapon1Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Weapon2Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
