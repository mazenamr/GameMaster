﻿using GameMaster.Models;
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

        public List<Rank> GetRanks()
        {
            return _dbContext.Ranks.FromSqlInterpolated($"SELECT * FROM [Rank] WHERE IsActive = 1").ToList();
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

        public User? GetUserByEmailOrUsername(string email, string username)
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] where (Email = {email} or Username = {username}) and IsActive = 1").FirstOrDefault();
        }

        public User? GetUserByUsername(string username)
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] WHERE Username = {username} and IsActive = 1").FirstOrDefault();
        }

        public List<User> GettAllUsers()
        {
            return _dbContext.Users.FromSqlInterpolated($"SELECT * FROM [User] WHERE IsActive = 1").ToList();
        }

        public int EditUserPassword(string username, string password)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [User] SET password = {password} WHERE Username = {username}");
        }

        public int AddUser(string email, string username, string password, int personId, int roleId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [User] (Email, Username, Password, personId, RoleId) VALUES({email}, {username}, {password}, {personId}, {roleId})");
        }

        public List<Weapon> GetAllWeapons()
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM [Weapon] WHERE IsActive = 1").ToList();
        }

        public int EditWeapon(int id, string name, int block, int magic, int power, int speed)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE Weapon SET Name = {name} , Block = {block} , Magic = {magic} , Power = {power} , Speed = {speed} WHERE Id = {id}");
        }

        public int DeleteWeapon(int id)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE Weapon SET IsActive = 0 WHERE Id = {id}");
        }

        public Weapon? GetWeaponById(int id)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM [Weapon] WHERE Id = {id} AND IsActive = 1").FirstOrDefault();
        }

        public Weapon AddWeapon(string name, int block, int magic, int power, int speed)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"Exec NewWeapon {name}, {block}, {magic}, {power}, {speed}").AsEnumerable().First();
        }

        public WeaponDetail? GetWeaponDetails(int id)
        {
            return _dbContext.WeaponDetails.FromSqlInterpolated($"SELECT * FROM [WeaponDetails] WHERE WeaponId={id}").FirstOrDefault();
        }

        public List<WeaponDetail> GetAllWeaponDetails()
        {
            return _dbContext.WeaponDetails.FromSqlInterpolated($"Select D.Id, D.WeaponId, D.GamesPlayed, D.GamesWon, D.SeasonId from [WeaponDetails] D, [Weapon] W WHERE D.WeaponId = W.Id and W.IsActive = 1").ToList();
        }

        public List<WeaponDetail> GetAllWeaponDetailsBySeasonId(int seasonId)
        {
            return _dbContext.WeaponDetails.FromSqlInterpolated($"Select D.Id, D.WeaponId, D.GamesPlayed, D.GamesWon, D.SeasonId from [WeaponDetails] D, [Weapon] W WHERE D.WeaponId = W.Id and W.IsActive = 1 and D.SeasonId = {seasonId}").ToList();
        }
        
        public Weapon? MostUsedWeaponByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM Weapon WHERE Id IN (SELECT TOP (1) WeaponId FROM Gameplayer WHERE PlayerId = 1 AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY WeaponId ORDER BY COUNT(WeaponId) DESC)").FirstOrDefault();
        }

        public List<Character> GetAllCharacters()
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE IsActive = 1").ToList();
        }

        public int EditCharacter(int id, string name, int health, int mana, int mobility, int strength)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE Character SET Name = {name} , Health = {health} , Mana = {mana} , Mobility = {mobility} , Strength = {strength} WHERE Id = {id}");
        }

        public int DeleteCharacter(int id)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE Character SET IsActive = 0 WHERE Id = {id}");
        }

        public Character? GetCharacterById(int id)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM [Character] WHERE Id = {id} AND IsActive = 1").FirstOrDefault();
        }

        public Character AddCharacter(string name, int health, int mana, int mobility, int strength)
        {
            return _dbContext.Characters.FromSqlInterpolated($"Exec NewCharacter {name}, {health}, {mana}, {mobility}, {strength}").AsEnumerable().First();
        }

        public CharacterDetail? GetCharacterDetails(int id)
        {
            return _dbContext.CharacterDetails.FromSqlInterpolated($"SELECT * FROM [CharacterDetails] WHERE CharacterId={id}").FirstOrDefault();
        }

        public List<CharacterDetail> GetAllCharacterDetails()
        {
            return _dbContext.CharacterDetails.FromSqlInterpolated($"Select D.Id, D.CharacterId, D.GamesPlayed, D.GamesWon, D.SeasonId from [CharacterDetails] D, [Weapon] C WHERE D.CharacterId = C.Id and C.IsActive = 1").ToList();
        }

        public List<CharacterDetail> GetAllCharacterDetailsBySeasonId(int seasonId)
        {
            return _dbContext.CharacterDetails.FromSqlInterpolated($"Select D.Id, D.CharacterId, D.GamesPlayed, D.GamesWon, D.SeasonId from [CharacterDetails] D, [Weapon] C WHERE D.CharacterId = C.Id and C.IsActive = 1 and D.SeasonId = {seasonId}").ToList();
        }

        public Character? MostUsedCharacterByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM Character WHERE Id IN (SELECT TOP (1) CharacterId FROM Gameplayer WHERE PlayerId = {playerId} AND GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId}) GROUP BY CharacterId ORDER BY COUNT(CharacterId) DESC)").FirstOrDefault();
        }

        public List<Synergy> GetSynergies()
        {
            return _dbContext.Synergies.FromSqlInterpolated($"SELECT * FROM [Synergy]").ToList();
        }

        public Season NewSeason(string name, DateTime startDate, DateTime endDate)
        {
            string query = $"EXEC NewSeason '{name}', '{startDate}', '{endDate}'";
            //return _dbContext.Seasons.FromSqlInterpolated($"EXEC NewSeason '{name}', '{startDate}', '{endDate}'").AsEnumerable().First();
            return _dbContext.Seasons.FromSqlRaw(query).AsEnumerable().First();
        }

        public Game NewGame(int seasonId, int regionId, DateTime StartTime)
        {
            string query = $"EXEC NewGame {seasonId}, {regionId}, '{StartTime}'";
            //return _dbContext.Games.FromSqlInterpolated($"EXEC NewGame {seasonId}, {regionId}, '{StartTime}'").AsEnumerable().First();
            return _dbContext.Games.FromSqlRaw(query).AsEnumerable().First();
        }

        public int AddCharacterDetails(int seasonId, int characterId, int gamesPlayed, int gamesWon)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [CharacterDetails] (SeasonId, CharacterId, GamesPlayed, GamesWon) VALUES({seasonId}, {characterId}, {gamesPlayed}, {gamesWon})");
        }

        public int SaveGamePlayers(List<GamePlayer> gamePlayers)
        {
            _dbContext.AddRange(gamePlayers);
            return _dbContext.SaveChanges();
        }

        public int AddWeaponDetails(int seasonId, int weaponId, int gamesPlayed, int gamesWon)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [WeaponDetails] (SeasonId, WeaponId, GamesPlayed, GamesWon) VALUES({seasonId}, {weaponId}, {gamesPlayed}, {gamesWon})");
        }

        public int AddGamePlayer(int gameId, int playerId, int characterId, int weaponId, bool isWinner)
        {
            int isWinnerInt = isWinner ? 1 : 0;
            return _dbContext.Database.ExecuteSqlInterpolated($"INSERT INTO [GamePlayer] (GameId, PlayerId, CharacterId, WeaponId, IsWinner) VALUES({gameId}, {playerId}, {characterId}, {weaponId}, {isWinnerInt})");
        }

        public int UpdatePlayer(int playerId, int score)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [Player] SET Score = {score} WHERE Id = {playerId}");
        }

        public Rank GetRank(int score)
        {
            return _dbContext.Ranks.FromSqlInterpolated($"SELECT TOP(1) * FROM [Rank] WHERE Score <= {score} ORDER BY Score DESC").AsEnumerable().First();
        }

        public Player? GetPlayerByName(string name)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE Name={name} and IsActive = 1").FirstOrDefault();
        }

        public Player? GetPlayerById(int id)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE Id={id} and IsActive = 1").FirstOrDefault();
        }

        public List<int> GetPlayerIds()
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE IsActive = 1").Select(x => x.Id).ToList();
        }

        public List<Player> GetTop100Players()
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT TOP (100) * FROM [Player] WHERE IsActive = 1 ORDER BY Score DESC").ToList();
        }

        public List<Player> GetPlayerByRegionAndRank(int regionId, int rankId)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE RegionId = {regionId} AND RankId = {rankId} AND IsActive = 1").ToList();
        }

        public int DeactivatePlayer(int id)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [Player] SET IsActive = 0 WHERE Id = {id}");
        }

        public int AddPlayer(string firstName, string lastName, string birthday, DateTime dateCreated, string name, int activity, int skill, int temper, int score, int regionId)
        {
            string query = $"EXEC NewPlayer '{firstName}', '{lastName}', '{birthday}', '{dateCreated}', '{name}', {activity}, {skill}, {temper}, {score}, {regionId}";
            //return _dbContext.Database.ExecuteSqlInterpolated($"EXEC NewPlayer '{firstName}', '{lastName}', '{birthday}', '{dateCreated}', '{name}', {activity}, {skill}, {temper}, {score}, {regionId}");
            return _dbContext.Database.ExecuteSqlRaw(query);
        }

        public List<Person> GetPerson()
        {
            return _dbContext.People.FromSqlInterpolated($"SELECT * FROM [Person] WHERE IsActive=1" ).ToList();
        }

        public int CreateUser(string firstName, string lastName, DateTime birthday, string email, string username, string password, int roleId)
        {
            _dbContext.Database.BeginTransaction(System.Data.IsolationLevel.ReadCommitted);
            try
            {
                Person person = AddPerson(firstName, lastName, birthday);
                User user = new()
                {
                    Email = email,
                    Username = username,
                    PersonId = person.Id,
                    Person = person,
                    RoleId = roleId
                };
                string hashedPassword = _hasher.HashPassword(user, password);
                int result = AddUser(email, username, hashedPassword, person.Id, roleId);
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
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT * FROM GamePlayer Where PlayerId = {playerId} and GameId IN (SELECT Id FROM Game Where SeasonId = {seasonId})").Count();
        }

        public int NumberOfGamesWonByPlayerInSeason(int playerId, int seasonId)
        {
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT * FROM GamePlayer WHERE PlayerId = {playerId} and IsWinner = 1 and GameId IN (SELECT Id FROM Game WHERE SeasonId = {seasonId})").Count();
        }

        public List<GamePlayer> LastTenPlayedGamesByPlayer(int playerId)
        {
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT TOP(10) Gp.* FROM GamePlayer Gp,Game G  WHERE  Gp.PlayerId = {playerId} AND Gp.GameId = G.Id ORDER BY G.StartTime DESC").ToList();
        }

        public List<GamePlayer> OpponentsOfPlayerInLastTenGames(int playerId)
        {
            return _dbContext.GamePlayers.FromSqlInterpolated($"SELECT TOP(10) Gp.* FROM GamePlayer Gp,Game G  WHERE  Gp.PlayerId != {playerId} AND Gp.GameId = G.Id AND G.Id IN (SELECT GameId FROM GamePlayer WHERE PlayerId = {playerId}) ORDER BY G.StartTime DESC").ToList();
        }

        public int GetPlayerCountInRegionByRegionId(int regionId)
        {
            return _dbContext.Players.FromSqlInterpolated($"SELECT * FROM [Player] WHERE RegionId = {regionId} and IsActive = 1").Count();
        }

        public int GetGamesCountInRegionByRegionIdAndSeasonId(int regionId, int seasonId)
        {
            return _dbContext.Games.FromSqlInterpolated($"SELECT * FROM [Game] WHERE RegionId = {regionId} and SeasonId = {seasonId}").Count();
        }

        public Weapon? GetMostPopularWeaponByRegionIdAndSeasonId(int regionId, int seasonId)
        {
            return _dbContext.Weapons.FromSqlInterpolated($"SELECT * FROM Weapon WHERE ID IN(SELECT TOP(1) GP.WeaponId FROM Region R,Player P,GamePlayer GP,Game G WHERE R.Id = P.RegionId AND R.Id = {regionId} AND P.Id = GP.PlayerId AND G.Id = GP.GameId AND G.SeasonId = {seasonId} GROUP BY GP.WeaponId ORDER BY COUNT(GP.WeaponId) DESC)").FirstOrDefault();
        }

        public Character? GetMostPopularCharacterByRegionIdAndSeasonId(int regionId, int seasonId)
        {
            return _dbContext.Characters.FromSqlInterpolated($"SELECT * FROM Character WHERE ID IN(SELECT TOP(1) GP.CharacterId FROM Region R,Player P,GamePlayer GP,Game G WHERE R.Id = P.RegionId AND R.Id = {regionId} AND P.Id = GP.PlayerId AND G.Id = GP.GameId AND G.SeasonId = {seasonId} GROUP BY GP.CharacterId ORDER BY COUNT(GP.CharacterId) DESC)").FirstOrDefault();
        }

        public int AddMessage(string message, string username)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"insert into [History] ([Message], [Username], [TimeCreated]) values({message}, {username}, {DateTime.UtcNow})");
        }

        public List<History> GetLast10MessagesByTime()
        {
            return _dbContext.Histories.FromSqlInterpolated($"SELECT TOP(10) * FROM [History] ORDER BY TimeCreated DESC").ToList();
        }

        public Role? GetRoleById(int id)
        {
            return _dbContext.Roles.FromSqlInterpolated($"SELECT * FROM [Role] WHERE Id = {id}").FirstOrDefault();
        }

        public int EditUser(int id, string username , string email, int roleId)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"UPDATE [User] SET Email = {email} ,Username = {username} , RoleId = {roleId} WHERE Id = {id}");
        }

        public int DeleteUserById(int id)
        {
            return _dbContext.Database.ExecuteSqlInterpolated($"Update [User] Set IsActive = 0 Where Id = {id}");
        }

        public Season? GetCurrentSeason()
        {
            return _dbContext.Seasons.FromSqlInterpolated($"SELECT TOP(1) * FROM [Season] WHERE IsActive = 1 ORDER BY StartDate DESC").FirstOrDefault();
        }
    }
}
