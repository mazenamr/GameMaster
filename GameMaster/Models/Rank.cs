using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Rank
    {
        public Rank()
        {
            Players = new HashSet<Player>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Score { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Player> Players { get; set; }
    }
}
