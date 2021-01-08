using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(101)]
    public class _101_SeedRoleTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Role.Roles.ForEach(role =>
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
