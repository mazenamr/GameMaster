using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(14)]
    public class _014_SynergiesWithTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesWith)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
