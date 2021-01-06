using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class SynergiesAgainstWeaponWeapon
    {
        public int Id { get; set; }
        public int Weapon1Id { get; set; }
        public int Weapon2Id { get; set; }
        public int Constant { get; set; }
        public int Multiplier { get; set; }

        public virtual Weapon Weapon1 { get; set; }
        public virtual Weapon Weapon2 { get; set; }
    }
}
