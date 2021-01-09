using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Region
    {
        public Region()
        {
            Games = new HashSet<Game>();
            Players = new HashSet<Player>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Game> Games { get; set; }
        public virtual ICollection<Player> Players { get; set; }
    }
}
