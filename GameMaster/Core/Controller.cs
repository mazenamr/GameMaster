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

        public List<Region> GetRegions()
        {
            return _dbContext.Regions.FromSqlInterpolated($"SELECT * FROM [Region] WHERE IsActive = 1").ToList();
        }

        public int AddRegion(string name)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [Region] (Name) VALUES({name})");
        }

        public int EditRegion(int id, string name)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [Region] SET Name = {name} WHERE Id = {id}");
        }

        public int DeleteRegion(int id)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [Region] SET IsActive = 0 WHERE Id = {id}");
        }

        public Rank? GetRankById(int rankId)
        {
            return _dbContext.Ranks.FromSqlInterpolated($"SELECT * FROM Rank WHERE Id = {rankId}").FirstOrDefault();
        }

        public Region? GetRegionById(int regionId)
        {
            return _dbContext.Regions.FromSqlInterpolated($"SELECT * FROM Region WHERE Id = {regionId}").FirstOrDefault();
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

        public Weapon? GetWeaponById(int id)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM [Weapon] WHERE Id = {id} AND IsActive = 1").FirstOrDefault();
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
        
        public Weapon? MostUsedWeaponByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM Weapon WHERE Id IN (SELECT TOP (1) WeaponId FROM Gameplayer WHERE PlayerId = 1 AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY WeaponId ORDER BY COUNT(WeaponId) DESC)").FirstOrDefault();
        }

        public List<Character> GetAllCharacters()
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE IsActive = 1").ToList();
        }

        public Character? GetCharacterById(int id)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE Id = {id} AND IsActive = 1").FirstOrDefault();
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

        public Character? MostUsedCharacterByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM Character WHERE Id IN (SELECT TOP (1) CharacterId FROM Gameplayer WHERE PlayerId = {playerId} AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY CharacterId ORDER BY COUNT(CharacterId) DESC)").FirstOrDefault();
        }

        public Player? GetPlayerByName(string name)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE Name={name} and IsActive = 1").FirstOrDefault();
        }

        public Player? GetPlayerById(int id)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE Id={id} and IsActive = 1").FirstOrDefault();
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

        public int NumberOfPlayedGamesByPlayerInASeason(int playerId, int seasonId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"SELECT COUNT(*) FROM GamePlayer Where PlayerId = {playerId} and GameId IN (SELECT Id FROM Game Where SeasonId = {seasonId})");
        }

        public int NumberOfGamesWonByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"SELECT COUNT(*) FROM GamePlayer WHERE PlayerId = {playerId} and IsWinner = 1 and GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId})");
        }

        public List<GamePlayer> LastTenPlayedGamesByPlayer(int playerId)
        {
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT TOP(10) Gp.* FROM GamePlayer Gp,Game G  WHERE  Gp.PlayerId = {playerId} AND Gp.GameId = G.Id ORDER BY G.StartTime DESC").ToList();
        }

        public List<GamePlayer> OpponentsOfPlayerInLastTenGames(int playerId)
        {
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT TOP(10) Gp.* FROM GamePlayer Gp,Game G  WHERE  Gp.PlayerId != {playerId} AND Gp.GameId = G.Id AND G.Id IN (SELECT GameId FROM GamePlayer WHERE PlayerId = 1) ORDER BY G.StartTime DESC").ToList();
        }
    }
}
