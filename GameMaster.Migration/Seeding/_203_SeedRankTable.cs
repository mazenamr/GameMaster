using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(203)]
    public class _203_SeedRankTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Rank.Ranks.ForEach(rank =>
            {
                Insert.IntoTable(Constants.Tables.Rank).Row(new
                {
                    rank.Id,
                    rank.Name,
                    rank.Score
                });
            });
        }
    }
}
