using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class UsageAgainstCharacterCharacter
    {
        public int Id { get; set; }
        public int Character1Id { get; set; }
        public int Character2Id { get; set; }
        public int? GamesPlayed { get; set; }
        public int? GamesWon { get; set; }

        public virtual Character Character1 { get; set; }
        public virtual Character Character2 { get; set; }
    }
}
