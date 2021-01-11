using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Game
    {
        public Game()
        {
            GamePlayers = new HashSet<GamePlayer>();
        }

        public int Id { get; set; }
        public int SeasonId { get; set; }
        public int RegionId { get; set; }
        public DateTime StartTime { get; set; }

        public virtual Region Region { get; set; }
        public virtual Season Season { get; set; }
        public virtual ICollection<GamePlayer> GamePlayers { get; set; }
    }
}
