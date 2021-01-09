using GameMaster.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GameMaster
{
    public class Controller
    {
        private readonly GameMasterContext _dbContext;
        private readonly PasswordHasher<User> _hasher;

        public Controller(GameMasterContext dbContext, PasswordHasher<User> hasher)
        {
            _dbContext = dbContext;
            _hasher = hasher;
        }

        public List<Role> GetRoles()
        {
            return _dbContext.Roles.FromSqlInterpolated($"SELECT * FROM [Role] WHERE IsActive = 1").ToList();
        }

        public int AddRole(string roleName)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [Role] (Name) VALUES({roleName})");
        }

        public Person AddPerson(string firstName, string lastName, DateTime birthday)
        {
            return _dbContext.People.FromSqlInterpolated($"Exec NewPerson {firstName}, {lastName}, {birthday}, {DateTime.UtcNow}").AsEnumerable().First();
        }

        public User? GetUserByEmail(string email)
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] where Email = {email} and IsActive = 1").FirstOrDefault();
        }

        public int AddUser(string email, string password, int personId, int roleId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [User] (Email, Password, personId, RoleId) VALUES({email}, {password}, {personId}, {roleId})");
        }

        public List<Weapon> GetAllWeapons()
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM [Weapon] WHERE IsActive = 1").ToList();
        }

        public Weapon? GetWeapon(string name)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM [Weapon] WHERE Name = {name} AND IsActive = 1").FirstOrDefault();
        }

        public Weapon AddWeapon(string name, int power, int speed, int block)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"Exec NewWeapon {name}, {power}, {speed}, {block}").AsEnumerable().First();
        }

        public WeaponDetail? GetWeaponDetails(int id)
        {
            return _dbContext.WeaponDetails.FromSqlInterpolated($"SELECT * FROM [WeaponDetails] WHERE WeaponId={id}").FirstOrDefault();
        }

        public List<WeaponDetail> GetAllWeaponDetails()
        {
            return _dbContext.WeaponDetails.FromSqlInterpolated($"Select D.Id, D.WeaponId, D.GamesPlayed, D.GamesWon, D.SeasonId from [WeaponDetails] D, [Weapon] W WHERE D.WeaponId = W.Id and W.IsActive = 1").ToList();
        }

        public List<Character> GetAllCharacters()
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE IsActive = 1").ToList();
        }

        public Character? GetCharacter(string name)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE Name = {name} AND IsActive = 1").FirstOrDefault();
        }

        public Character AddCharacter(string name, int strength, int mobility, int health)
        {
            return _dbContext.Characters.FromSqlInterpolated($"Exec NewCharacter {name}, {strength}, {mobility}, {health}").AsEnumerable().First();
        }

        public CharacterDetail? GetCharacterDetails(int id)
        {
            return _dbContext.CharacterDetails.FromSqlInterpolated($"SELECT * FROM [CharacterDetails] WHERE CharacterId={id}").FirstOrDefault();
        }

        public List<CharacterDetail> GetAllCharacterDetails()
        {
            return _dbContext.CharacterDetails.FromSqlInterpolated($"Select D.Id, D.CharacterId, D.GamesPlayed, D.GamesWon, D.SeasonId from [CharacterDetails] D, [Weapon] C WHERE D.CharacterId = C.Id and C.IsActive = 1").ToList();
        }

        public Player? GetPlayerByName(string name)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE Name={name} and IsActive = 1").FirstOrDefault();
        }

        public List<Player> GetTop100Players()
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT TOP (100) * FROM [Player] WHERE IsActive = 1 ORDER BY Score DESC").ToList();
        }

        public List<Person> GetPerson()
        {
            return _dbContext.People.FromSqlInterpolated($"SELECT * FROM [Person] WHERE IsActive=1" ).ToList();
        }

        public int CreateUser(string firstName, string lastName, DateTime birthday, string email, string password, int roleId)
        {
            _dbContext.Database.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
            try
            {
                Person person = AddPerson(firstName, lastName, birthday);
                User user = new()
                {
                    Email = email,
                    PersonId = person.Id,
                    Person = person,
                    RoleId = roleId
                };
                string hashedPassword = _hasher.HashPassword(user, password);
                int result = AddUser(email, hashedPassword, person.Id, roleId);
                _dbContext.Database.CommitTransaction();
                return result;
            }
            catch
            {
                _dbContext.Database.RollbackTransaction();
                throw;
            }
        }

        public int NumberOfPlayedGamesByPlayerInASeason(string playerId, int seasonId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"SELECT COUNT(*) FROM GamePlayer Where PlayerId = {playerId} and GameId IN (SELECT Id FROM Game Where SeasonId = {seasonId})");
        }

        public int NumberOfGamesWonByPlayerInSeason(string playerId, int seasonId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"SELECT COUNT(*) FROM GamePlayer WHERE PlayerId = {playerId} and IsWinner = 1 and GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}");
        }

        public Weapon? MostUsedWeaponByPlayerInSeason(string playerId, int seasonId)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM Weapon WHERE Id IN (SELECT TOP (1) WeaponId FROM Gameplayer WHERE PlayerId = 1 AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY WeaponId ORDER BY COUNT(WeaponId) DESC)").FirstOrDefault();
        }

        public Character? MostUsedCharacterByPlayerInSeason(string playerId, int seasonId)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM Character WHERE Id IN (SELECT TOP (1) CharacterId FROM Gameplayer WHERE PlayerId = {playerId} AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY CharacterId ORDER BY COUNT(CharacterId) DESC)").FirstOrDefault();
        }

    }
}
