using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(15)]
    public class _015_SynergiesWeaponWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesWeaponWeapon)
                .AutoId()
                .IntForeignKeyIndexed("Weapon1Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Weapon2Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
