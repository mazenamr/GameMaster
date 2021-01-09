using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.PlayerView
{
    public class ViewPlayerModel : PageModel
    {

        private readonly Controller _controller;

        [BindProperty]
        public string playerName { get; set; } = string.Empty;

        public Player? player { get; set; }

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

            return Page();
        }

    }
}
