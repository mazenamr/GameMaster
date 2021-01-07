using GameMaster.Models;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Security.Policy;

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
            return _dbContext.Roles.FromSqlRaw("SELECT * FROM Role where IsActive = 1;").ToList();
        }

        public int AddRole(string roleName)
        {
            return _dbContext.Database.ExecuteSqlRaw("INSERT INTO Role (Name) VALUES(@rolename)", new SqlParameter("rolename", roleName));
        }

        public User? GetUserByEmail(string email)
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] where Email = {email} and IsActive = 1").FirstOrDefault();
        }

        public int AddPerson(string firstName, string lastName, DateTime birthday)
        {
            return _dbContext.Database.ExecuteSqlRaw("INSERT INTO Person (Birthday, DateCreated, FirstName, LastName) VALUES(@birthday, @datecreated," +
                " @firstname, @lastname)", new SqlParameter("birthday", birthday), new SqlParameter("datecreated", DateTime.UtcNow), 
                new SqlParameter("firstname", firstName), new SqlParameter("lastname", lastName));
        }

        public List<Person> GetPersonByName(string firstName, string lastName)
        {
            return _dbContext.People.FromSqlInterpolated($"SELECT * FROM Person WHERE FirstName = {firstName} and LastName = {lastName}").ToList();
        }
        public int AddUser(string email, string password, int personId, int roleId)
        {
            return _dbContext.Database.ExecuteSqlRaw("INSERT INTO [User] (Email, Password, personId, RoleId) VALUES(@email, @password, @personid, @roleid)",
                new SqlParameter("email", email), new SqlParameter("password", password),
                new SqlParameter("personid", personId), new SqlParameter("roleid", roleId));
        }



    }
}
