using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Character
    {
        public record CharacterInfo(string Name, int Health, int Mana, int Mobility, int Strength);

        public static CharacterInfo Archer = new("Archer", 3, 4, 4, 10);
        public static CharacterInfo Assassin = new("Assassin", 3, 6, 9, 5);
        public static CharacterInfo Knight = new("Knight", 10, 3, 1, 8);
        public static CharacterInfo Wizard = new("Wizard", 4, 10, 5, 3);

        public static List<CharacterInfo> Characters = new()
        { Archer, Assassin, Knight, Wizard };
    }
}
