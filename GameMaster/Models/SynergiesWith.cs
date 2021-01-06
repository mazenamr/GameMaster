using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class SynergiesWith
    {
        public int Id { get; set; }
        public int CharacterId { get; set; }
        public int WeaponId { get; set; }
        public int Constant { get; set; }
        public int Multiplier { get; set; }

        public virtual Character Character { get; set; }
        public virtual Weapon Weapon { get; set; }
    }
}
