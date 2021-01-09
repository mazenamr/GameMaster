using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Region
    {
        public const int Africa = 100;
        public const int Asia = 200;
        public const int Australia = 300;
        public const int Europe = 400;
        public const int MiddleEast = 500;
        public const int NorthAmerica = 600;
        public const int SouthAmerica = 700;

        public record RegionInfo(int Id, string Name, int PlayerPercentage);

        public static List<RegionInfo> Regions = new()
        {
            new(Africa, nameof(Africa), 5),
            new(Asia, nameof(Asia), 25),
            new(Australia, nameof(Australia), 5),
            new(Europe, nameof(Europe), 20),
            new(MiddleEast, nameof(MiddleEast), 15),
            new(NorthAmerica, nameof(NorthAmerica), 20),
            new(SouthAmerica, nameof(SouthAmerica), 10)
        };
    }
}
