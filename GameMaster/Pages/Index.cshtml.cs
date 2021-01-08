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

        public List<Role>? Roles { get; set; }

        [Required]
        [BindProperty]
        public string? Role { get; set; }

        public IndexModel(ILogger<IndexModel> logger, Controller controller)
        {
            _logger = logger;
            _controller = controller;
        }

        public void OnGet()
        {
            List<Character> characters = _controller.GetAllCharacters();
            List<Weapon> weapons = _controller.GetAllWeapons();
        }

        public IActionResult OnPostAddRole()
        {
            if (Role is not null)
            {
                _controller.AddRole(Role);
            }
            return RedirectToPage("Index");
        }
    }
}
