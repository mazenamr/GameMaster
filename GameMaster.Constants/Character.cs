﻿using System.Collections.Generic;

namespace GameMaster.Constants
{
    public static class Character
    {
        public record CharacterInfo(string Name, int Strength, int Mobility, int Health);

        public static CharacterInfo Archer = new("Archer", 200, 8, 8);
        public static CharacterInfo Assassin = new("Assassin", 500, 9, 5);
        public static CharacterInfo Knight = new("Knight", 1000, 5, 8);
        public static CharacterInfo Wizard = new("Wizard", 500, 9, 5);

        public static List<CharacterInfo> Characters = new()
        { Archer, Assassin, Knight, Wizard };
    }
}