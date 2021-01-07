using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Player
    {
        public Player()
        {
            GameGamewinners = new HashSet<Game>();
            GamePlayer1s = new HashSet<Game>();
            GamePlayer2s = new HashSet<Game>();
        }

        public int Id { get; set; }
        public int? Score { get; set; }
        public int Skill { get; set; }
        public int Temper { get; set; }
        public int RegionId { get; set; }
        public int RankId { get; set; }
        public int PersonId { get; set; }
        public DateTime DateCreated { get; set; }
        public bool? IsActive { get; set; }

        public virtual Person Person { get; set; }
        public virtual Rank Rank { get; set; }
        public virtual Region Region { get; set; }
        public virtual ICollection<Game> GameGamewinners { get; set; }
        public virtual ICollection<Game> GamePlayer1s { get; set; }
        public virtual ICollection<Game> GamePlayer2s { get; set; }
    }
}
