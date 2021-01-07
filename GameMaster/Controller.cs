using GameMaster.Models;
using Microsoft.Data.SqlClient;
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
            string query = "SELECT * FROM [@tableName] WHERE IsActive = 1;";
            return _dbContext.Roles.FromSqlRaw(query, new SqlParameter("tableName", Constants.Tables.Role)).ToList();
        }

        public int AddRole(string roleName)
        {
            string query = "INSERT INTO [@tableName] (Name) VALUES(@rolename);";
            return _dbContext.Database.ExecuteSqlRaw(query, new SqlParameter("tableName", Constants.Tables.Role),
                new SqlParameter("rolename", roleName));
        }

        public User? GetUserByEmail(string email)
        {
            string query = "SELECT * FROM [@tableName] where Email = @email and IsActive = 1;";
            return _dbContext.Users.FromSqlRaw(query, new SqlParameter("tableName", Constants.Tables.User),
                new SqlParameter("email", email)).FirstOrDefault();
        }

        public int AddPerson(string firstName, string lastName, DateTime birthday)
        {
            string query = "INSERT INTO [@tableName] (Birthday, DateCreated, FirstName, LastName) VALUES(@birthday, @datecreated, @firstname, @lastname);";
            return _dbContext.Database.ExecuteSqlRaw(query, new SqlParameter("tableName", Constants.Tables.Person),
                new SqlParameter("birthday", birthday), new SqlParameter("datecreated", DateTime.UtcNow), 
                new SqlParameter("firstname", firstName), new SqlParameter("lastname", lastName));
        }

        public List<Person> GetPersonByName(string firstName, string lastName)
        {
            string query = "SELECT * FROM [@tableName] WHERE FirstName = @firstName and LastName = @lastName;";
            return _dbContext.People.FromSqlRaw(query, new SqlParameter("tableName", Constants.Tables.Person),
                new SqlParameter("tableName", Constants.Tables.Person),
                new SqlParameter("firstName", firstName), new SqlParameter("lastName", lastName)).ToList();
        }

        public int AddUser(string email, string password, int personId, int roleId)
        {
            string query = "INSERT INTO [@tableName] (Email, Password, personId, RoleId) VALUES(@email, @password, @personId, @roleId)";
            return _dbContext.Database.ExecuteSqlRaw(query, new SqlParameter("tableName", Constants.Tables.User),
                new SqlParameter("email", email), new SqlParameter("password", password),
                new SqlParameter("personId", personId), new SqlParameter("roleId", roleId));
        }

    }
}
