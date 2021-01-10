using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Rank
    {
        public const int Bronze = 100;
        public const int Silver = 200;
        public const int Gold = 300;
        public const int Platinum = 400;
        public const int Diamond = 500;

        public record RankInfo(int Id, string Name, int Score, int PlayerPercentage);

        public static List<RankInfo> Ranks = new()
        {
            new(Bronze, nameof(Bronze), 0000, 15),
            new(Silver, nameof(Silver), 1000, 40),
            new(Gold, nameof(Gold), 2000, 30),
            new(Platinum, nameof(Platinum), 3000, 10),
            new(Diamond, nameof(Diamond), 4000, 5)
        };
    }
}
