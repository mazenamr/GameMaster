using GameMaster.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace GameMaster.Pages.GameMasterView
{
    public class CharactersModel : PageModel
    {
        private readonly Controller _controller;

        private readonly IHttpContextAccessor _httpContextAccessor;

        public List<Character> Characters = new();

        public string SuccessMessage { get; set; } = string.Empty;

        [BindProperty]
        [Required]
        public InputModel Input { get; set; } = new();

        public class InputModel
        {
            [Required]
            [MinLength(0)]
            [MaxLength(50)]
            public string Name { get; set; } = string.Empty;

            [Required]
            [Range(0,100)]
            public int Health { get; set; }

            [Required]
            [Range(0,100)]
            public int Mana { get; set; }

            [Required]
            [Range(0,100)]
            public int Mobility { get; set; }

            [Required]
            [Range(0,100)]
            public int Strength { get; set; }
        }

        public CharactersModel(Controller controller, IHttpContextAccessor httpContextAccessor)
        {
            _controller = controller;
            _httpContextAccessor = httpContextAccessor;
        }

        public void OnGet()
        {
            Characters = _controller.GetAllCharacters();
        }

        public IActionResult OnPostCreate()
        {
            _controller.AddCharacter(Input.Name, Input.Health, Input.Mana, Input.Mobility, Input.Strength);

            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Character {Input.Name} has been added to the game";
            _controller.AddMessage(message, username);

            return RedirectToPage("Characters");
        }

        public IActionResult OnPostEdit(int id)
        {
            string oldName = _controller.GetCharacterById(id).Name;
            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Changes have been made to character {Input.Name}";

            _controller.AddMessage(message, username);

            _controller.EditCharacter(id, Input.Name, Input.Health, Input.Mana, Input.Mobility, Input.Strength);

            return RedirectToPage("Characters");
        }

        public IActionResult OnPostDelete(int id)
        {
            string oldName = _controller.GetCharacterById(id).Name;
            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Character {Input.Name} has been removed from the game";
            _controller.AddMessage(message, username);

            _controller.DeleteCharacter(id);

            SuccessMessage = $"Character {Input.Name} has been deleted successfully";
            return Page();
        }
    }
}
