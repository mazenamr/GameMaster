using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(101)]
    public class _101_SeedRoleTable : FluentMigrator.Migration
    {
        public override void Down()
        {
            Delete.FromTable(Constants.Tables.Role).AllRows();
        }

        public override void Up()
        {
            Constants.Roles.AllRoles.ForEach(role =>
            {
                Insert.IntoTable(Constants.Tables.Role).Row(new
                {
                    role.Id,
                    role.Name
                });
            });
        }
    }
}
