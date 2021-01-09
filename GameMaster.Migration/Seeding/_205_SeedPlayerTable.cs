using FluentMigrator;
using System;

namespace GameMaster.Migration.Seeding
{
    [Migration(205)]
    public class _205_SeedPlayerTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            int totalPlayers = 10000;
            Random random = new();
            Constants.Region.Regions.ForEach(region =>
            {
                int regionPlayers = totalPlayers / 100 * region.PlayerPercentage;
                Constants.Rank.Ranks.ForEach(rank =>
                {
                    int rankPlayers = regionPlayers / 100 * rank.PlayerPercentage;
                    for (int i = 0; i < rankPlayers; i++)
                    {
                        string guid = Guid.NewGuid().ToString();
                        int score = rank.Score + random.Next(999);
                        Execute.Sql($"EXEC NewPlayer '{guid}', '{guid}', '2000-01-01', '{DateTime.UtcNow}', '{guid}', 100, 100, 100, {score}, {rank.Id}, {region.Id}");
                    }
                });
            });
        }
    }
}
