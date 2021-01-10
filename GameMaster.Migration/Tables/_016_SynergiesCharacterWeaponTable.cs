using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(16)]
    public class _016_SynergiesCharacterWeaponTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesCharacterWeapon)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
