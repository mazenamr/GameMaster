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
        public string playerName { get; set; } = string.Empty;

        public Player? player { get; set; }

        public Character? character { get; set; }

        public Weapon? weapon { get; set; }

        public Rank? rank { get; set; }

        public List<GamePlayer> currentPlayer { get; set; }

        public List<GamePlayer> opponentGamePlayers { get; set; }

        public List<Player> opponentPlayers { get; set; }

        public List<Weapon> playerWeapons { get; set; }

        public List<Weapon> opponentWeapons { get; set; }

        public List<Character> playerCharacters { get; set; }

        public List<Character> opponentCharacters { get; set; }

        public int totalGamesPlayed { get; set; } = 0;

        public int totalGamesWon { get; set; } = 0;

        public int matches { get; set; } = 10;

        public ViewPlayerModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (string.IsNullOrEmpty(playerName))
            {
                ModelState.AddModelError(string.Empty, "Please add a player name to search for");
                return Page();
            }

            player = _controller.GetPlayerByName(playerName);
            if (player is not null)
            {
                totalGamesPlayed = _controller.NumberOfPlayedGamesByPlayerInASeason(player.Id, 0);
                totalGamesWon = _controller.NumberOfGamesWonByPlayerInSeason(player.Id, 0);
                character = _controller.MostUsedCharacterByPlayerInSeason(player.Id, 0);
                weapon = _controller.MostUsedWeaponByPlayerInSeason(player.Id, 0);
                rank = _controller.GetRankById(player.RankId);
                currentPlayer = _controller.LastTenPlayedGamesByPlayer(player.Id);
                opponentGamePlayers = _controller.OpponentsOfPlayerInLastTenGames(player.Id);

                if (totalGamesPlayed < 10)
                {
                    matches = totalGamesPlayed;
                }

                if (matches != -1)
                {
                    for (int i = 0; i < matches; i++)
                    {
                        playerWeapons[i] = _controller.GetWeaponById(currentPlayer[i].WeaponId);
                        playerCharacters[i] = _controller.GetCharacterById(currentPlayer[i].CharacterId);
                        opponentWeapons[i] = _controller.GetWeaponById(opponentGamePlayers[i].WeaponId);
                        opponentCharacters[i] = _controller.GetCharacterById(opponentGamePlayers[i].CharacterId);
                        opponentPlayers[i] = _controller.GetPlayerById(opponentGamePlayers[i].PlayerId);
                    }
                }
            }

            return Page();
        }

    }
}
