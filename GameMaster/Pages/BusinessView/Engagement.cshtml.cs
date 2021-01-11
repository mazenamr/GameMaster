using System.Collections.Generic;
using System.Linq;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.BusinessView
{
    public class EngagementModel : PageModel
    {
        private readonly Controller _controller;

        public List<Region> Regions { get; set; }

        public List<int> RegionPlayers { get; set; } = new();

        public List<int> RegionGames { get; set; } = new();

        public List<Character> RegionCharacters { get; set; } = new();

        public List<Weapon> RegionWeapons { get; set; } = new();

        public EngagementModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            Regions = _controller.GetRegions();
            Season currentSeason = _controller.GetCurrentSeason();
            foreach(var region in Regions)
            {
                RegionPlayers.Add(_controller.GetPlayerCountInRegionByRegionId(region.Id));
                RegionGames.Add(_controller.GetGamesCountInRegionByRegionIdAndSeasonId(region.Id, currentSeason.Id));
                RegionCharacters.Add(_controller.GetMostPopularCharacterByRegionIdAndSeasonId(region.Id, currentSeason.Id));
                RegionWeapons.Add(_controller.GetMostPopularWeaponByRegionIdAndSeasonId(region.Id, currentSeason.Id));
            }
        }
    }
}
