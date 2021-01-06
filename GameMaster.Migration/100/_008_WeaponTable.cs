using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(8)]
    public class _008_WeaponTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Weapon)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Power").AsInt32().NotNullable()
                .WithColumn("Speed").AsInt32().NotNullable()
                .WithColumn("Block").AsInt32().NotNullable()
                .IsActive();
        }
    }
}
