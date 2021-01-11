using System.Collections.Generic;
using System.Linq;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.BusinessView
{
    public class EngagementModel : PageModel
    {
        private readonly Controller _controller;

        public List<Region> regions { get; set; }

        public List<int> regionPlayers { get; set; } = new();

        public List<int> regionGames { get; set; } = new();

        public List<Character> regionCharacters { get; set; }

        public List<Weapon> regionWeapons { get; set; }

        public EngagementModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            regions = _controller.GetAllRegions();
            foreach(var region in regions)
            {
                regionPlayers.Add(_controller.GetPlayerCountInRegionByRegionId(region.Id));
                regionGames.Add(_controller.GetGamesCountInRegionByRegionIdAndSeasonId(region.Id, 0));
                regionCharacters.Add(_controller.GetMostPopularCharacterByRegionIdAndSeasonId(region.Id, 0));
                regionWeapons.Add(_controller.GetMostPopularWeaponByRegionIdAndSeasonId(region.Id, 0));
            }
        }
    }
}
