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

        public record RegionInfo(int Id, string Name);

        public static List<RegionInfo> Regions = new()
        {
            new(Africa, nameof(Africa)),
            new(Asia, nameof(Asia)),
            new(Australia, nameof(Australia)),
            new(Europe, nameof(Europe)),
            new(MiddleEast, nameof(MiddleEast)),
            new(NorthAmerica, nameof(NorthAmerica)),
            new(SouthAmerica, nameof(SouthAmerica))
        };
    }
}
