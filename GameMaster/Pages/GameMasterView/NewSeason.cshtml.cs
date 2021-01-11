using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.GameMasterView
{
    public class NewSeasonModel : PageModel
    {
        private readonly Controller _controller;

        public NewSeasonModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
        }

        public void OnPost()
        {

        }
    }
}
