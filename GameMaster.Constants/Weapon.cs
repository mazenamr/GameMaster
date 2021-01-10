using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Weapon
    {
        public record WeaponInfo(string Name, int Block, int Magic, int Power, int Speed);

        public static WeaponInfo Bow = new("Bow", 2, 3, 10, 5);
        public static WeaponInfo XBow = new("XBow", 1, 1, 9, 9);

        public static WeaponInfo Daggers = new("Daggers", 1, 5, 5, 9);
        public static WeaponInfo Poison = new("Poison", 1, 7, 6, 7);

        public static WeaponInfo Lance = new("Lance", 8, 2, 6, 3);
        public static WeaponInfo Sword = new("Sword", 9, 2, 5, 2);

        public static WeaponInfo Staff = new("Staff", 4, 9, 3, 4);
        public static WeaponInfo Grimoire = new("Grimoire", 1, 10, 3, 5);

        public static List<WeaponInfo> Weapons = new()
        { Bow, XBow, Daggers, Poison, Lance, Sword, Staff, Grimoire };
    }
}
