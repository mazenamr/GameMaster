using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(201)]
    public class _201_SeedRoleTable : FluentMigrator.Migration
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
