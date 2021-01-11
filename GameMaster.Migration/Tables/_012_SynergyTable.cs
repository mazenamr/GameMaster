using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(12)]
    public class _012_SynergyTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Synergy)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
