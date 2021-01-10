using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Region
    {
        public record RegionInfo(string Name, int PlayerPercentage);

        public static List<RegionInfo> Regions = new()
        {
            new("Africa", 5),
            new("Asia", 25),
            new("Australia", 5),
            new("Europe", 20),
            new("Middle East", 15),
            new("North America", 20),
            new("South America", 10)
        };
    }
}
