using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class User
    {
        public int Id { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int RoleId { get; set; }
        public int PersonId { get; set; }
        public bool? IsActive { get; set; }

        public virtual Person Person { get; set; }
        public virtual Role Role { get; set; }
    }
}
