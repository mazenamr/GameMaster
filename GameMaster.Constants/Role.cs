using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Role
    {
        public const int Player = 100;
        public const int Business = 200;
        public const int GameMaster = 300;
        public const int Admin = 400;

        public record RoleInfo(int Id, string Name);

        public static List<RoleInfo> Roles = new()
        {
            new(Player, nameof(Player)),
            new(Business, nameof(Business)),
            new(GameMaster, nameof(GameMaster)),
            new(Admin, nameof(Admin))
        };
    }
}
