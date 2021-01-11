using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Synergy
    {
        
        public record SynergyInfo(string Character, string Weapon, int Constant, int Multiplier);

        public static List<SynergyInfo> Synergies = new()
        {
            new(Character.Archer.Name, Weapon.Bow.Name, 1000, 106),
            new(Character.Archer.Name, Weapon.XBow.Name, 1000, 109),
            new(Character.Archer.Name, Weapon.Daggers.Name, 2000, 100),
            new(Character.Archer.Name, Weapon.Poison.Name, 2000, 100),
            new(Character.Archer.Name, Weapon.Lance.Name, 2000, 100),
            new(Character.Archer.Name, Weapon.Sword.Name, 2000, 100),
            new(Character.Archer.Name, Weapon.Staff.Name, 2000, 100),
            new(Character.Archer.Name, Weapon.Grimoire.Name, 2000, 100),

            new(Character.Assassin.Name, Weapon.Bow.Name, 2000, 100),
            new(Character.Assassin.Name, Weapon.XBow.Name, 18000, 100),
            new(Character.Assassin.Name, Weapon.Daggers.Name, 500, 109),
            new(Character.Assassin.Name, Weapon.Poison.Name, 500, 110),
            new(Character.Assassin.Name, Weapon.Lance.Name, 2000, 100),
            new(Character.Assassin.Name, Weapon.Sword.Name, 2000, 100),
            new(Character.Assassin.Name, Weapon.Staff.Name, 2000, 100),
            new(Character.Assassin.Name, Weapon.Grimoire.Name, 2000, 100),

            new(Character.Knight.Name, Weapon.Bow.Name, 2000, 100),
            new(Character.Knight.Name, Weapon.XBow.Name, 2000, 100),
            new(Character.Knight.Name, Weapon.Daggers.Name, 2000, 100),
            new(Character.Knight.Name, Weapon.Poison.Name, 2000, 100),
            new(Character.Knight.Name, Weapon.Lance.Name, 500, 110),
            new(Character.Knight.Name, Weapon.Sword.Name, 500, 110),
            new(Character.Knight.Name, Weapon.Staff.Name, 2000, 100),
            new(Character.Knight.Name, Weapon.Grimoire.Name, 2000, 100),

            new(Character.Wizard.Name, Weapon.Bow.Name, 2000, 100),
            new(Character.Wizard.Name, Weapon.XBow.Name, 2000, 100),
            new(Character.Wizard.Name, Weapon.Daggers.Name, 2000, 100),
            new(Character.Wizard.Name, Weapon.Poison.Name, 2000, 105),
            new(Character.Wizard.Name, Weapon.Lance.Name, 2000, 100),
            new(Character.Wizard.Name, Weapon.Sword.Name, 2000, 100),
            new(Character.Wizard.Name, Weapon.Staff.Name, 500, 112),
            new(Character.Wizard.Name, Weapon.Grimoire.Name, 500, 110),
        };
    }
}
