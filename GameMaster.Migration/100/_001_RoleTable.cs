using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(1)]
    public class _001_RoleTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Role)
                .WithColumn("Id").AsInt32().PrimaryKey().NotNullable()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .IsActive();
        }
    }
}
