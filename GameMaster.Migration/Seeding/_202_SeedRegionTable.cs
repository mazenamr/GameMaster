using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(202)]
    public class _202_SeedRegionTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Region.Regions.ForEach(region =>
            {
                Insert.IntoTable(Constants.Tables.Region).Row(new
                {
                    region.Id,
                    region.Name
                });
            });
        }
    }
}
