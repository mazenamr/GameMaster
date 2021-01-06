using GameMaster.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace GameMaster
{
    public class Controller
    {
        private readonly GameMasterContext _dbContext;

        public Controller(GameMasterContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<Role> GetRoles()
        {
            return _dbContext.Roles.FromSqlRaw("SELECT * FROM Role;").ToList();
        }
    }
}
