using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Role
    {
        public const int Admin = 100;
        public const int GameMaster = 200;
        public const int Business = 300;
        public const int Player = 400;

        public record RoleInfo(int Id, string Name);

        public static List<RoleInfo> Roles = new()
        {
            new(Admin, nameof(Admin)),
            new(GameMaster, nameof(GameMaster)),
            new(Business, nameof(Business)),
            new(Player, nameof(Player))
        };
    }
}
