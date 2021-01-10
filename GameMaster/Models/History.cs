using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class History
    {
        public int Id { get; set; }
        public string Message { get; set; }
        public int UserId { get; set; }
        public DateTime TimeCreated { get; set; }

        public virtual User User { get; set; }
    }
}
