using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Character
    {
        public Character()
        {
            CharacterDetails = new HashSet<CharacterDetail>();
            GamePlayers = new HashSet<GamePlayer>();
            Synergies = new HashSet<Synergy>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Health { get; set; }
        public int Mana { get; set; }
        public int Mobility { get; set; }
        public int Strength { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<CharacterDetail> CharacterDetails { get; set; }
        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
        public virtual ICollection<Synergy> Synergies { get; set; }
    }
}
