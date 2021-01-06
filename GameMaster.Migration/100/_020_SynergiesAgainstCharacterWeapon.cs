using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(20)]
    public class _020_SynergiesAgainstCharacterWeapon : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.SynergiesAgainstCharacterWeapon)
                .AutoId()
                .IntForeignKeyIndexed("WeaponId", Tables.Weapon, false, false)
                .IntForeignKeyIndexed("CharacterId", Tables.Character, false, false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
