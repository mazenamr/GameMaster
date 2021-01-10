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
            int totalPlayers = 20000;
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
                        int score = rank.Score + random.Next(1000);
                        int activity = 50 + rank.Score / 50 + random.Next(101);
                        int skill = 40 + rank.Score / 125 + rank.Score / 250 * random.Next(2) + random.Next(13);
                        int temper = rank.Score / 500 + random.Next(11);
                        Execute.Sql($"EXEC NewPlayer '{guid}', '{guid}', '2000-01-01', '{DateTime.UtcNow}', '{guid}', {activity}, {skill}, {temper}, {score}, {rank.Id}, {region.Id}");
                    }
                });
            });
        }
    }
}
