using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.BusinessView
{
    public class PatchNotesModel : PageModel
    {
        private readonly Controller _controller;

        public List<History> Changes { get; set; }

        public int Count { get; set; } = 0;

        public PatchNotesModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            Changes = _controller.GetLast10MessagesByTime();
            Count = Changes.Count();
        }
    }
}
