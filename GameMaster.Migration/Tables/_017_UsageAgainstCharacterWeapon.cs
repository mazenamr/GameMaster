using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(17)]
    public class _017_UsageAgainstCharacterWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.UsageAgainstCharacterWeapon)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
