using GameMaster.Models;
using Microsoft.EntityFrameworkCore;
using System;
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
            return _dbContext.Roles.FromSqlInterpolated($"SELECT * FROM [Role] WHERE IsActive = 1;").ToList();
        }

        public int AddRole(string roleName)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [Role] (Name) VALUES({roleName});");
        }

        public Person AddPerson(string firstName, string lastName, DateTime birthday)
        {
            return _dbContext.People.FromSqlInterpolated($"Exec NewPerson {firstName}, {lastName}, {birthday}, {DateTime.UtcNow};").First();
        }

        public User? GetUserByEmail(string email)
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] where Email = {email} and IsActive = 1;").FirstOrDefault();
        }

        public int AddUser(string email, string password, int personId, int roleId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [User] (Email, Password, personId, RoleId) VALUES({email}, {password}, {personId}, {roleId})");
        }

        public int NewUser(string firstName, string lastName, DateTime birthday, string email, string password, int roleId)
        {
            _dbContext.Database.ExecuteSqlRaw("START TRANSACTION;");
            try
            {
                Person person = AddPerson(firstName, lastName, birthday);
                _dbContext.Database.ExecuteSqlRaw("COMMIT;");
                return AddUser(email, password, person.Id, roleId);
            }
            catch
            {
                _dbContext.Database.ExecuteSqlRaw("ROLLBACK;");
                throw;
            }
        }
    }
}
