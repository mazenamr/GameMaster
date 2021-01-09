using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Game
    {
        public int Id { get; set; }
        public int Player1Id { get; set; }
        public int Player2Id { get; set; }
        public int Character1Id { get; set; }
        public int Character2Id { get; set; }
        public int Weapon1Id { get; set; }
        public int Weapon2Id { get; set; }
        public int GamewinnerId { get; set; }
        public int SeasonId { get; set; }
        public int RegionId { get; set; }
        public DateTime DateTime { get; set; }

        public virtual Character Character1 { get; set; }
        public virtual Character Character2 { get; set; }
        public virtual Player Gamewinner { get; set; }
        public virtual Player Player1 { get; set; }
        public virtual Player Player2 { get; set; }
        public virtual Region Region { get; set; }
        public virtual Season Season { get; set; }
        public virtual Weapon Weapon1 { get; set; }
        public virtual Weapon Weapon2 { get; set; }
    }
}
