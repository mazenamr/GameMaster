using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Player
    {
        public Player()
        {
            GamePlayers = new HashSet<GamePlayer>();
            Games = new HashSet<Game>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int Activity { get; set; }
        public int Skill { get; set; }
        public int Temper { get; set; }
        public int? Score { get; set; }
        public int RankId { get; set; }
        public int RegionId { get; set; }
        public int PersonId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Person Person { get; set; }
        public virtual Rank Rank { get; set; }
        public virtual Region Region { get; set; }
        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
        public virtual ICollection<Game> Games { get; set; }
    }
}
