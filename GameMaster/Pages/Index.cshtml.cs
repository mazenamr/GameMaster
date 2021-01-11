using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GameMaster.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        private readonly Controller _controller;

        public List<Character> Characters { get; set; }

        public List<CharacterDetail> CharacterDetails { get; set; }

        public List<Weapon> Weapons { get; set; }

        public List<WeaponDetail> WeaponDetails { get; set; }

        public IndexModel(ILogger<IndexModel> logger, Controller controller)
        {
            _logger = logger;
            _controller = controller;
        }

        public void OnGet()
        {
            Characters = _controller.GetAllCharacters();
            Weapons = _controller.GetAllWeapons();
            Season season = _controller.GetCurrentSeason();
            CharacterDetails = _controller.GetAllCharacterDetailsBySeasonId(season.Id);
            WeaponDetails = _controller.GetAllWeaponDetailsBySeasonId(season.Id);
        }
    }
}
