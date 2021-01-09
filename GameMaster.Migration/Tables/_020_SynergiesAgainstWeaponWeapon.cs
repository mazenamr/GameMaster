using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(20)]
    public class _020_SynergiesAgainstWeaponWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesAgainstWeaponWeapon)
                .AutoId()
                .IntForeignKeyIndexed("Weapon1Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Weapon2_id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
