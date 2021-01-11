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

        public NewSeasonModel(Controller controller, GameMasterContext dbContext)
        {
            _controller = controller;
            _dbContext = dbContext;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            Simulator.SimulatorSettings simulatorSettings = new(100000, 1000, 500);
            Simulator simulator = new(_controller, _dbContext, simulatorSettings);
            await simulator.SimulateSeason();
            return Page();
        }
    }
}
