using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class CharacterDetail
    {
        public int Id { get; set; }
        public int CharacterId { get; set; }
        public int? GamesPlayed { get; set; }
        public int? GamesWon { get; set; }
        public int SeasonId { get; set; }

        public virtual Character Character { get; set; }
        public virtual Season Season { get; set; }
    }
}
