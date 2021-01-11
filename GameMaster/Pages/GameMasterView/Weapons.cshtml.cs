using GameMaster.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Http;

namespace GameMaster.Pages.GameMasterView
{
    public class WeaponsModel : PageModel
    {
        private readonly Controller _controller;

        private readonly IHttpContextAccessor _httpContextAccessor;

        public List<Weapon> Weapons = new();

        [BindProperty]
        [Required]
        public InputModel Input { get; set; } = new();

        public string SuccessMessage { get; set; } = string.Empty;

        public class InputModel
        {
            [Required]
            [MinLength(0)]
            [MaxLength(50)]
            public string Name { get; set; } = string.Empty;

            [Required]
            [Range(0, 100)]
            public int Block { get; set; }

            [Required]
            [Range(0, 100)]
            public int Magic { get; set; }

            [Required]
            [Range(0, 100)]
            public int Speed { get; set; }

            [Required]
            [Range(0, 100)]
            public int Power { get; set; }
        }

        public WeaponsModel(Controller controller, IHttpContextAccessor httpContextAccessor)
        {
            _controller = controller;
            _httpContextAccessor = httpContextAccessor;
        }

        public void OnGet()
        {
            Weapons = _controller.GetAllWeapons();
        }

        public IActionResult OnPostCreate()
        {
            _controller.AddWeapon(Input.Name, Input.Block, Input.Magic, Input.Power, Input.Speed);

            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Weapon {Input.Name} has been added to the game";

            _controller.AddMessage(message, username);

            return RedirectToPage("Weapons");
        }

        public IActionResult OnPostEdit(int id)
        {
            Weapon oldWeapon = _controller.GetWeaponById(id);
            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Weapon {oldWeapon} has been edited";

            _controller.AddMessage(message, username);

            _controller.EditWeapon(id, Input.Name, Input.Block, Input.Magic, Input.Power, Input.Speed);


            return RedirectToPage("Weapons");
        }

        public IActionResult OnPostDelete(int id)
        {
            string weaponName = _controller.GetWeaponById(id).Name;
            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Weapon {weaponName} has been removed from the game";

            _controller.AddMessage(message, username);

            SuccessMessage = $"Weapon {weaponName} has been deleted successfully";
            _controller.DeleteWeapon(id);

            return Page();
        }
    }
}
