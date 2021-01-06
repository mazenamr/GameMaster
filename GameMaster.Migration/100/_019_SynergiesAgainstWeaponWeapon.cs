using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(19)]
    public class _019_SynergiesAgainstWeaponWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.SynergiesAgainstWeaponWeapon)
                .AutoId()
                .IntForeignKeyIndexed("Weapon1Id", Tables.Weapon, false, false)
                .IntForeignKeyIndexed("Weapon2_id", Tables.Weapon, false, false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
