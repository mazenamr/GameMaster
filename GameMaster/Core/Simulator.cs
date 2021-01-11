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
        private readonly SimulatorSettings _simulatorSettings;
        private Season NewSeason { get; set; }
        private List<int> PlayerIds { get; set; }
        private Dictionary<(int, int), Queue<Player>> Players { get; set; } = new();
        private Dictionary<int, (Character, Weapon)> PlayerItems { get; set; } = new();
        private List<Region> Regions { get; set; }
        private List<Rank> Ranks { get; set; }
        private Dictionary<int, Character> Characters { get; set; } = new();
        private Dictionary<int, CharacterDetail> CharacterDetails { get; set; } = new();
        private Dictionary<int, Weapon> Weapons { get; set; } = new();
        private Dictionary<int, WeaponDetail> WeaponDetails { get; set; } = new();
        private Dictionary<(int, int), Synergy> Synergies { get; set; } = new();
        private Dictionary<(int, int), UsageWith> UsagesWith { get; set; } = new();
        private List<GamePlayer> GamePlayers { get; set; } = new();

        public Simulator(Controller controller, SimulatorSettings simulatorSettings)
        {
            _controller = controller;
            _simulatorSettings = simulatorSettings;
            NewSeason = _controller.NewSeason(Guid.NewGuid().ToString(), DateTime.UtcNow, null);
            PlayerIds = _controller.GetPlayerIds();
            Regions = _controller.GetRegions();
            Ranks = _controller.GetRanks();
            Characters = _controller.GetAllCharacters().ToDictionary(x => x.Id, x => x);
            CharacterDetails = _controller.GetAllCharacters().ToDictionary(x => x.Id, x => new CharacterDetail());
            Weapons = _controller.GetAllWeapons().ToDictionary(x => x.Id, x => x);
            WeaponDetails = _controller.GetAllWeapons().ToDictionary(x => x.Id, x => new WeaponDetail());
            Synergies = _controller.GetSynergies().ToDictionary(x => (x.CharacterId, x.WeaponId), x => x);
            _controller.GetAllCharacters().ForEach(c =>
            {
                _controller.GetAllWeapons().ForEach(w =>
                {
                    UsagesWith.Add((c.Id, w.Id), new UsageWith());
                });
            });
            DeactivatePlayers();
            AddPlayers();
            Regions.ForEach(region => Ranks.ForEach(rank =>
            {
                Players.Add((region.Id, rank.Id), new(_controller.GetPlayerByRegionAndRank(region.Id, rank.Id)));
            }));
        }

        private void DeactivatePlayers()
        {
            Random random = new();
            for (int i = 0; i < _simulatorSettings.DecativatedPlayerCount; i++)
            {
                _controller.DeactivatePlayer(PlayerIds[random.Next(PlayerIds.Count)]);
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
                int temper = random.Next(21);
                _controller.AddPlayer(guid, guid, "2000-01-01", DateTime.UtcNow, guid, activity, skill, temper, score, region.Id);
            }
        }

        public async Task SimulateSeason()
        {
            List<Task> runners = new();
            foreach (var q in Players.Values)
            {
                runners.Add(Task.Factory.StartNew(() => SimulateGames(q)));
            }
            await Task.WhenAll(runners);
            GamePlayers.ForEach(g =>
            {
                _controller.AddGamePlayer(g.GameId, g.PlayerId, g.CharacterId, g.WeaponId, g.IsWinner);
            });
            foreach (int c in CharacterDetails.Keys)
            {
                _controller.AddCharacterDetails(c, CharacterDetails[c].GamesPlayed.GetValueOrDefault(), CharacterDetails[c].GamesWon.GetValueOrDefault());
            }
            foreach (int w in WeaponDetails.Keys)
            {
                _controller.AddWeaponDetails(w, WeaponDetails[w].GamesPlayed.GetValueOrDefault(), WeaponDetails[w].GamesWon.GetValueOrDefault());
            }
            foreach (Queue<Player> q in Players.Values)
            {
                foreach (Player p in q)
                {
                    _controller.UpdatePlayer(p.Id, p.Score.GetValueOrDefault());
                }
            }
        }

        private void SimulateGames(Queue<Player> players)
        {
            int games = players.Count / PlayerIds.Count;
            Random random = new();
            for (int gameNumber = 0; gameNumber < games; gameNumber++)
            {
                List<Player> gamePlayers = new(2);
                int chance = 0;
                while (players.Count > 0 && gamePlayers.Count < 2)
                {
                    chance++;
                    Player player = players.Dequeue();
                    if (random.Next(100) <= player.Activity + chance)
                    {
                        gamePlayers.Add(player);
                    }
                    else
                    {
                        players.Enqueue(player);
                    }
                }
                Game game = _controller.NewGame(NewSeason.Id, gamePlayers[0].RegionId, DateTime.UtcNow);
                List<int> playerScores = new(2);
                foreach (Player player in gamePlayers)
                {
                    Character character;
                    Weapon weapon;
                    if (!PlayerItems.ContainsKey(player.Id))
                    {
                        character = Characters[random.Next(Characters.Count)];
                        weapon = Weapons[random.Next(Weapons.Count)];
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
                for (int playerId = 0; playerId < 2; playerId++)
                {
                    Player player = gamePlayers[playerId];
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
                    if (playerScores[playerId] > playerScores[1-playerId])
                    {
                        gamePlayer.IsWinner = true;
                        player.Score += 10;
                        CharacterDetails[character.Id].GamesWon += 1;
                        WeaponDetails[weapon.Id].GamesWon += 1;
                    }
                    else if (playerScores[playerId] < playerScores[1-playerId])
                    {
                        gamePlayer.IsWinner = false;
                        player.Score -= 10;
                    }
                    else
                    {
                        gamePlayer.IsWinner = true;
                        CharacterDetails[character.Id].GamesWon += 1;
                        WeaponDetails[weapon.Id].GamesWon += 1;
                    }
                    GamePlayers.Add(gamePlayer);
                }
                gamePlayers.ForEach(p => players.Enqueue(p));
            }
        }
    }
}
