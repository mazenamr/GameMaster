using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using GameMaster.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.AdminView
{
    public class RegionsModel : PageModel
    {
        private readonly Controller _controller;

        private readonly IHttpContextAccessor _httpContextAccessor;

        public List<Region> Regions = new();

        [BindProperty]
        [MinLength(0)]
        [MaxLength(50)]
        [Required]
        public string RegionName { get; set; } = string.Empty;

        public RegionsModel(Controller controller, IHttpContextAccessor httpContextAccessor)
        {
            _controller = controller;
            _httpContextAccessor = httpContextAccessor;
        }

        public void OnGet()
        {
            Regions = _controller.GetRegions();
        }

        public IActionResult OnPostCreate()
        {
            _controller.AddRegion(RegionName);

            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Region {RegionName} has been added to the game";

            _controller.AddMessage(message, username);

            return RedirectToPage("Regions");
        }

        public IActionResult OnPostEdit(int id)
        {
            string oldName = _controller.GetRegionById(id).Name;
            _controller.EditRegion(id, RegionName);

            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Region {oldName} was changed to {RegionName}";

            _controller.AddMessage(message, username);

            return RedirectToPage("Regions");
        }

        public IActionResult OnPostDelete(int id)
        {
            _controller.DeleteRegion(id);

            string username = _httpContextAccessor.HttpContext.User.Identity.Name;
            string message = $"Region {RegionName} has been deleted from the game";

            _controller.AddMessage(message, username);

            return RedirectToPage("Regions");
        }
    }
}
