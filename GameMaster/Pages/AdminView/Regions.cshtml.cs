using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.AdminView
{
    public class RegionsModel : PageModel
    {
        private readonly Controller _controller;

        public List<Region> Regions = new();

        [BindProperty]
        [MinLength(0)]
        [MaxLength(50)]
        [Required]
        public string RegionName { get; set; } = string.Empty;

        public RegionsModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            Regions = _controller.GetRegions();
        }

        public IActionResult OnPostCreate()
        {
            _controller.AddRegion(RegionName);
            return RedirectToPage("Regions");
        }

        public IActionResult OnPostEdit(int id)
        {
            _controller.EditRegion(id, RegionName);
            return RedirectToPage("Regions");
        }

        public IActionResult OnPostDelete(int id)
        {
            _controller.DeleteRegion(id);
            return RedirectToPage("Regions");
        }
    }
}
