using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Rank
    {
        public record RankInfo(string Name, int Score, int PlayerPercentage);

        public static List<RankInfo> Ranks = new()
        {
            new("Bronze", 0000, 15),
            new("Silver", 1000, 40),
            new("Gold", 2000, 30),
            new("Platinum", 3000, 10),
            new("Diamond", 4000, 5)
        };
    }
}
