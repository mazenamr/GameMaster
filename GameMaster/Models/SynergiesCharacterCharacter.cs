using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class SynergiesCharacterCharacter
    {
        public int Id { get; set; }
        public int Character1Id { get; set; }
        public int Character2Id { get; set; }
        public int Constant { get; set; }
        public int Multiplier { get; set; }

        public virtual Character Character1 { get; set; }
        public virtual Character Character2 { get; set; }
    }
}
