using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(14)]
    public class _014_SynergiesWithTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.SynergiesWith)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Tables.Character, false, false)
                .IntForeignKeyIndexed("WeaponId", Tables.Weapon, false, false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
