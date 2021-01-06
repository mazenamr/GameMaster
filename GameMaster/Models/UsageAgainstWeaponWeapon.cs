using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class UsageAgainstWeaponWeapon
    {
        public int Id { get; set; }
        public int Weapon1Id { get; set; }
        public int Weapon2Id { get; set; }
        public int? GamesPlayed { get; set; }
        public int? GamesWon { get; set; }
        public float? WinRate { get; set; }

        public virtual Weapon Weapon1 { get; set; }
        public virtual Weapon Weapon2 { get; set; }
    }
}
