using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GameMaster.Constants
{
    public static class Rank
    {
        public const int Bronze = 100;
        public const int Silver = 200;
        public const int Gold = 300;
        public const int Platinum = 400;
        public const int Diamond = 500;

        public record RankInfo(int Id, string Name, int Score);

        public static List<RankInfo> Ranks = new()
        {
            new(Bronze, nameof(Bronze), 0000),
            new(Silver, nameof(Silver), 1000),
            new(Gold, nameof(Gold), 2000),
            new(Platinum, nameof(Platinum), 3000),
            new(Diamond, nameof(Diamond), 4000)
        };
    }
}
