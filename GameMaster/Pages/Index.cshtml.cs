using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GameMaster.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly Controller _controller;
        public List<Role> Roles { get; set; } = new();

        public IndexModel(ILogger<IndexModel> logger, Controller controller)
        {
            _logger = logger;
            _controller = controller;
        }

        public void OnGet()
        {
            Roles = _controller.GetRoles();
        }
    }
}
