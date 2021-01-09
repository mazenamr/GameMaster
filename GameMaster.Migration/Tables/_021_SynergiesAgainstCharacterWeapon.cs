using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(21)]
    public class _021_SynergiesAgainstCharacterWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesAgainstCharacterWeapon)
                .AutoId()
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
