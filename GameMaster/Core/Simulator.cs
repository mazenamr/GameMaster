using EFCore.BulkExtensions;
using GameMaster.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GameMaster.Core
{
    public class Simulator
    {
        public record SimulatorSettings
        (
            int GamesCount,
            int NewPlayerCount,
            int DecativatedPlayerCount
        );

        private readonly Controller _controller;
        private readonly GameMasterContext _dbContext;
        private readonly SimulatorSettings _simulatorSettings;
        private Season NewSeason { get; set; }
        private List<int> PlayerIds { get; set; }
        private Dictionary<(int, int), Queue<Player>> Players { get; set; } = new();
        private Dictionary<(int, int), bool> RunnerDone { get; set; } = new();
        private Dictionary<int, (Character, Weapon)> PlayerItems { get; set; } = new();
        private List<Region> Regions { get; set; }
        private List<Rank> Ranks { get; set; }
        private Dictionary<int, Character> Characters { get; set; } = new();
        private Dictionary<int, CharacterDetail> CharacterDetails { get; set; } = new();
        private Dictionary<int, Weapon> Weapons { get; set; } = new();
        private Dictionary<int, WeaponDetail> WeaponDetails { get; set; } = new();
        private Dictionary<(int, int), Synergy> Synergies { get; set; } = new();
        private List<GamePlayer> GamePlayers { get; set; } = new();

        public Simulator(Controller controller, GameMasterContext dbContext, SimulatorSettings simulatorSettings)
        {
            _controller = controller;
            _dbContext = dbContext;
            _simulatorSettings = simulatorSettings;
            NewSeason = _controller.NewSeason(Guid.NewGuid().ToString(), DateTime.UtcNow, DateTime.UtcNow.AddDays(7));
            PlayerIds = _controller.GetPlayerIds();
            Regions = _controller.GetRegions();
            Ranks = _controller.GetRanks();
            Characters = _controller.GetAllCharacters().ToDictionary(x => x.Id, x => x);
            CharacterDetails = _controller.GetAllCharacters().ToDictionary(x => x.Id, x => new CharacterDetail{ CharacterId = x.Id, GamesPlayed = 0, GamesWon = 0, SeasonId = NewSeason.Id });
            Weapons = _controller.GetAllWeapons().ToDictionary(x => x.Id, x => x);
            WeaponDetails = _controller.GetAllWeapons().ToDictionary(x => x.Id, x => new WeaponDetail{ WeaponId = x.Id, GamesPlayed = 0, GamesWon = 0, SeasonId = NewSeason.Id });
            Synergies = _controller.GetSynergies().ToDictionary(x => (x.CharacterId, x.WeaponId), x => x);
            DeactivatePlayers();
            AddPlayers();
            PlayerIds = _controller.GetPlayerIds();
            Regions.ForEach(region => Ranks.ForEach(rank =>
            {
                Players.Add((region.Id, rank.Id), new(_controller.GetPlayerByRegionAndRank(region.Id, rank.Id)));
                RunnerDone[(region.Id, rank.Id)] = false;
            }));
        }

        private void DeactivatePlayers()
        {
            Random random = new();
            int i = _simulatorSettings.DecativatedPlayerCount;
            while (i > 0 && PlayerIds.Count > 0)
            {
                _controller.DeactivatePlayer(PlayerIds[random.Next(PlayerIds.Count)]);
                i--;
            }
        }

        private void AddPlayers()
        {
            Random random = new();
            for (int i = 0; i < _simulatorSettings.NewPlayerCount; i++)
            {
                Region region = Regions[random.Next(Regions.Count)];
                string guid = Guid.NewGuid().ToString();
                int score = 0;
                int activity = random.Next(101);
                int skill = random.Next(101);
                int temper = random.Next(5);
                _controller.AddPlayer(guid, guid, "2000-01-01", DateTime.UtcNow, guid, activity, skill, temper, score, region.Id);
            }
        }

        public async Task SimulateSeason()
        {
            List<Task> runners = new();
            foreach (var q in Players.Keys)
            {
                int gamesCount = Players[q].Count * _simulatorSettings.GamesCount / PlayerIds.Count;
                Queue<Game> games = new();
                while (games.Count < gamesCount)
                    games.Enqueue(new Game { SeasonId = NewSeason.Id, StartTime = DateTime.UtcNow, RegionId = q.Item1 });

                _dbContext.BulkInsert(games.ToArray(), new BulkConfig { PreserveInsertOrder = true, SetOutputIdentity = true, BatchSize = 4000 });

                runners.Add(Task.Factory.StartNew(() => SimulateGames(Players[q], games, q.Item1, q.Item2)));
                //SimulateGames(q);
            }
            await Task.WhenAll(runners);
            _dbContext.BulkInsert(GamePlayers);
            _dbContext.BulkInsert(CharacterDetails.Values.ToArray());
            _dbContext.BulkInsert(WeaponDetails.Values.ToArray());

            foreach (Queue<Player> q in Players.Values)
            {
                _dbContext.BulkUpdate(q.ToArray());
            }

            await _dbContext.SaveChangesAsync();
        }

        private void SimulateGames(Queue<Player> players, Queue<Game> games, int regionId, int rankId)
        {
            Random random = new();
            while (games.Count > 0)
            {
                Game game = games.Dequeue();
                List<Player> gamePlayers = new(2);

                while (players.Count > 0 && gamePlayers.Count < 2)
                {
                    Player player = players.Dequeue();

                    if (random.Next(100) <= player.Activity)
                    {
                        gamePlayers.Add(player);
                    }
                    else
                    {
                        players.Enqueue(player);
                    }
                }

                if (players.Count < 2)
                    return;

                List<int> playerScores = new(2);
                foreach (Player player in gamePlayers)
                {
                    Character character;
                    Weapon weapon;
                    if (!PlayerItems.ContainsKey(player.Id))
                    {
                        character = Characters[Characters.Keys.ToList()[random.Next(Characters.Count)]];
                        weapon = Weapons[Weapons.Keys.ToList()[random.Next(Weapons.Count)]];
                        PlayerItems.Add(player.Id, (character, weapon));
                    }
                    else
                    {
                        character = PlayerItems[player.Id].Item1;
                        weapon = PlayerItems[player.Id].Item2;
                    }

                    int playerScore = (character.Health * weapon.Block) + (character.Mana * weapon.Magic) + (character.Mobility * weapon.Speed) + (character.Strength * weapon.Power);
                    playerScore *= Synergies[(character.Id, weapon.Id)].Multiplier;
                    playerScore += Synergies[(character.Id, weapon.Id)].Constant;
                    playerScore *= player.Skill;
                    playerScores.Add(playerScore);
                }

                for (int playerNumber = 0; playerNumber < 2; playerNumber++)
                {
                    Player player = gamePlayers[playerNumber];
                    int playerId = player.Id;
                    Character character = PlayerItems[playerId].Item1;
                    Weapon weapon = PlayerItems[playerId].Item2;
                    CharacterDetails[character.Id].GamesPlayed += 1;
                    WeaponDetails[weapon.Id].GamesPlayed += 1;
                    GamePlayer gamePlayer = new()
                    {
                        GameId = game.Id,
                        PlayerId = playerId,
                        CharacterId = character.Id,
                        WeaponId = weapon.Id
                    };
                    int d = playerScores[playerNumber] - playerScores[1 - playerNumber];
                    int newScore = d > 200 ? 10 : d < -100 ? 100 : d > 0 ? 10 + d / 5 : 10 + d / 2;
                    if (playerScores[playerNumber] > playerScores[1 - playerNumber])
                    {
                        gamePlayer.IsWinner = true;
                        player.Score += newScore * 2;
                        CharacterDetails[character.Id].GamesWon += 1;
                        WeaponDetails[weapon.Id].GamesWon += 1;
                    }
                    else if (playerScores[playerNumber] < playerScores[1 - playerNumber])
                    {
                        gamePlayer.IsWinner = false;
                        player.Score -= newScore / 4;
                        player.Score = player.Score < 0 ? 0 : player.Score;
                        if (random.Next(player.Temper) == 0)
                        {
                            character = Characters[Characters.Keys.ToList()[random.Next(Characters.Count)]];
                            weapon = Weapons[Weapons.Keys.ToList()[random.Next(Weapons.Count)]];
                            PlayerItems[player.Id] = (character, weapon);
                        }
                    }
                    else
                    {
                        gamePlayer.IsWinner = true;
                        CharacterDetails[character.Id].GamesWon += 1;
                        WeaponDetails[weapon.Id].GamesWon += 1;
                    }
                    GamePlayers.Add(gamePlayer);
                    Rank newRank = Ranks.Where(r => r.Score <= player.Score).OrderByDescending(r => r.Score).First();
                    player.RankId = newRank.Id;
                    player.Rank = newRank;
                    if (!RunnerDone[(regionId, newRank.Id)])
                    {
                        Players[(player.RegionId, newRank.Id)].Enqueue(player);
                        if (newRank.Id != rankId)
                        {
                            System.Console.WriteLine("Nice");
                        }
                    }
                    else
                    {
                        Players[(regionId, rankId)].Enqueue(player);
                    }
                }
            }
            RunnerDone[(regionId, rankId)] = true;
        }
    }
}
