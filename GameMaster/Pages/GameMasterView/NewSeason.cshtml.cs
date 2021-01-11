using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using GameMaster.Core;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.GameMasterView
{
    public class NewSeasonModel : PageModel
    {
        public Controller _controller { get; set; }
        public GameMasterContext _dbContext { get; set; }
        public Season? CurrentSeason { get; set; }
        [BindProperty]
        [Required]
        [Range(0, 200000)]
        public int GamesCount { get; set; } = 0;
        [BindProperty]
        [Required]
        [Range(0, 10000)]
        public int NewPlayers { get; set; } = 0;

        public NewSeasonModel(Controller controller, GameMasterContext dbContext)
        {
            _controller = controller;
            _dbContext = dbContext;
        }

        public void OnGet()
        {
            CurrentSeason = _controller.GetCurrentSeason();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            Simulator.SimulatorSettings simulatorSettings = new(GamesCount, NewPlayers, NewPlayers / 10);
            Simulator simulator = new(_controller, _dbContext, simulatorSettings);
            await simulator.SimulateSeason();
            return RedirectToPage("NewSeason");
        }
    }
}
