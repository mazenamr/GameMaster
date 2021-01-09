using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class GamePlayer
    {
        public int Id { get; set; }
        public int GameId { get; set; }
        public int PlayerId { get; set; }
        public int CharacterId { get; set; }
        public int WeaponId { get; set; }
        public bool IsWinner { get; set; }

        public virtual Character Character { get; set; }
        public virtual Player Game { get; set; }
        public virtual Game Player { get; set; }
        public virtual Weapon Weapon { get; set; }
    }
}
