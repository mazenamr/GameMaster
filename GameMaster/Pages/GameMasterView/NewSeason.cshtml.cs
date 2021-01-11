using System.Threading.Tasks;
using GameMaster.Core;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.GameMasterView
{
    public class NewSeasonModel : PageModel
    {
        public Controller _controller { get; set; }

        public NewSeasonModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            Simulator.SimulatorSettings simulatorSettings = new(20000, 0, 0);
            Simulator simulator = new(_controller, simulatorSettings);
            await simulator.SimulateSeason();
            return Page();
        }
    }
}
