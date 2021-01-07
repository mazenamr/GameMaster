using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(9)]
    public class _009_WeaponTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Weapon)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Power").AsInt32().NotNullable()
                .WithColumn("Speed").AsInt32().NotNullable()
                .WithColumn("Block").AsInt32().NotNullable()
                .IsActive();
        }
    }
}
