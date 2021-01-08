using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(102)]
    public class _102_SeedRegionTable : FluentMigrator.Migration
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
