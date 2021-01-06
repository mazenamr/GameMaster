using System;
using System.Collections.Generic;

#nullable disable

namespace GameMaster.Models
{
    public partial class Person
    {
        public Person()
        {
            Players = new HashSet<Player>();
            Users = new HashSet<User>();
        }

        public int Id { get; set; }
        public DateTime Birthday { get; set; }
        public DateTime DateCreated { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public bool? IsActive { get; set; }

        public virtual ICollection<Player> Players { get; set; }
        public virtual ICollection<User> Users { get; set; }
    }
}
