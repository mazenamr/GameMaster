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

        public List<int> regionPlayers { get; set; }

        public List<int> regionGames { get; set; }

        public EngagementModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            regions = _controller.GetAllRegions();
            foreach(var region in regions)
            {
                regionPlayers.Append(_controller.GetPlayerCountInRegionByRegionId(region.Id));
                regionGames.Append(_controller.GetGamesCountInRegionByRegionIdAndSeasonId(region.Id, 0));
            }
        }
    }
}
