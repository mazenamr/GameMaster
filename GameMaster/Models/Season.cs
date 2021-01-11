using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Season
    {
        public Season()
        {
            CharacterDetails = new HashSet<CharacterDetail>();
            Games = new HashSet<Game>();
            WeaponDetails = new HashSet<WeaponDetail>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<CharacterDetail> CharacterDetails { get; set; }
        public virtual ICollection<Game> Games { get; set; }
        public virtual ICollection<WeaponDetail> WeaponDetails { get; set; }
    }
}
