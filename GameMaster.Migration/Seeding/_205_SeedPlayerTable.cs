using FluentMigrator;
using System;
using System.Data;

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
            int totalPlayers = 1000;
            Random random = new();
            Constants.Region.Regions.ForEach(region =>
            {
                int regionPlayers = totalPlayers / 100 * region.PlayerPercentage;
                Execute.WithConnection((con, trans) =>
                {
                    int regionId;
                    using (IDbCommand cmd = con.CreateCommand())
                    {
                        cmd.Transaction = trans;
                        cmd.CommandText = $"SELECT TOP(1) * FROM {Constants.Tables.Region} WHERE Name = '{region.Name}'";
                        regionId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    Constants.Rank.Ranks.ForEach(rank =>
                    {
                        int rankPlayers = regionPlayers / 100 * rank.PlayerPercentage;
                        for (int i = 0; i < rankPlayers; i++)
                        {
                            string guid = Guid.NewGuid().ToString();
                            int score = rank.Score + random.Next(1001);
                            int activity = 10 + rank.Score / 125 + rank.Score / 250 * random.Next(2) + random.Next(43);
                            int skill = 40 + rank.Score / 125 + rank.Score / 250 * random.Next(2) + random.Next(13);
                            int temper = rank.Score / 500 + random.Next(11);
                            using (IDbCommand cmd = con.CreateCommand())
                            {
                                cmd.Transaction = trans;
                                cmd.CommandText = $"EXEC NewPlayer '{guid}', '{guid}', '2000-01-01', '{DateTime.UtcNow}', '{guid}', {activity}, {skill}, {temper}, {score}, {regionId}";
                                cmd.ExecuteNonQuery();
                            }    
                        }
                    });
                });
            });
        }
    }
}
