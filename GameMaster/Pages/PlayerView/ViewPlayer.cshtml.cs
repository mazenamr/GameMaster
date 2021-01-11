using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;

namespace GameMaster.Pages.PlayerView
{
    public class ViewPlayerModel : PageModel
    {

        private readonly Controller _controller;

        [BindProperty]
        public string PlayerName { get; set; } = string.Empty;

        public Player? Player { get; set; }

        public Character? Character { get; set; }

        public Weapon? Weapon { get; set; }

        public Rank? Rank { get; set; }

        public List<GamePlayer> CurrentPlayer { get; set; } = new();

        public List<GamePlayer> OpponentGamePlayers { get; set; } = new();

        public List<Player> OpponentPlayers { get; set; } = new();

        public List<Weapon> PlayerWeapons { get; set; } = new();

        public List<Weapon> OpponentWeapons { get; set; } = new();

        public List<Character> PlayerCharacters { get; set; } = new();

        public List<Character> OpponentCharacters { get; set; } = new();

        public int TotalGamesPlayed { get; set; } = 0;

        public int TotalGamesWon { get; set; } = 0;

        public int Matches { get; set; } = 10;

        public ViewPlayerModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (string.IsNullOrEmpty(PlayerName))
            {
                ModelState.AddModelError(string.Empty, "Please add a player name to search for");
                return Page();
            }

            Player = _controller.GetPlayerByName(PlayerName);
            Season currentSeason = _controller.GetCurrentSeason();
            if (Player is not null)
            {
                TotalGamesPlayed = _controller.NumberOfPlayedGamesByPlayerInASeason(Player.Id, currentSeason.Id);
                TotalGamesWon = _controller.NumberOfGamesWonByPlayerInSeason(Player.Id, currentSeason.Id);
                Character = _controller.MostUsedCharacterByPlayerInSeason(Player.Id, currentSeason.Id);
                Weapon = _controller.MostUsedWeaponByPlayerInSeason(Player.Id, currentSeason.Id);
                Rank = _controller.GetRankById(Player.RankId);
                CurrentPlayer = _controller.LastTenPlayedGamesByPlayer(Player.Id);
                OpponentGamePlayers = _controller.OpponentsOfPlayerInLastTenGames(Player.Id);

                if (TotalGamesPlayed < 10)
                {
                    Matches = TotalGamesPlayed;
                }

                if (Matches != -1)
                {
                    for (int i = 0; i < Matches; i++)
                    {
                        PlayerWeapons.Add(_controller.GetWeaponById(CurrentPlayer[i].WeaponId));
                        PlayerCharacters.Add(_controller.GetCharacterById(CurrentPlayer[i].CharacterId));
                        OpponentWeapons.Add(_controller.GetWeaponById(OpponentGamePlayers[i].WeaponId));
                        OpponentCharacters.Add(_controller.GetCharacterById(OpponentGamePlayers[i].CharacterId));
                        OpponentPlayers.Add(_controller.GetPlayerById(OpponentGamePlayers[i].PlayerId));
                    }
                }
            }

            return Page();
        }

    }
}
