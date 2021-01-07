using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(1)]
    public class _001_RoleTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Role)
                .WithColumn("Id").AsInt32().PrimaryKey().NotNullable()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .IsActive();
        }
    }
}
