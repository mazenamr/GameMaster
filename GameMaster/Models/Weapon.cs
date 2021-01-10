using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Weapon
    {
        public Weapon()
        {
            GamePlayers = new HashSet<GamePlayer>();
            Synergies = new HashSet<Synergy>();
            UsageAgainstCharacterWeapons = new HashSet<UsageAgainstCharacterWeapon>();
            UsageAgainstWeaponWeaponWeapon1s = new HashSet<UsageAgainstWeaponWeapon>();
            UsageAgainstWeaponWeaponWeapon2s = new HashSet<UsageAgainstWeaponWeapon>();
            UsageWiths = new HashSet<UsageWith>();
            WeaponDetails = new HashSet<WeaponDetail>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Block { get; set; }
        public int Power { get; set; }
        public int Speed { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
        public virtual ICollection<Synergy> Synergies { get; set; }
        public virtual ICollection<UsageAgainstCharacterWeapon> UsageAgainstCharacterWeapons { get; set; }
        public virtual ICollection<UsageAgainstWeaponWeapon> UsageAgainstWeaponWeaponWeapon1s { get; set; }
        public virtual ICollection<UsageAgainstWeaponWeapon> UsageAgainstWeaponWeaponWeapon2s { get; set; }
        public virtual ICollection<UsageWith> UsageWiths { get; set; }
        public virtual ICollection<WeaponDetail> WeaponDetails { get; set; }
    }
}
