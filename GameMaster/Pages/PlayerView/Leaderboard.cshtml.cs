using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;


namespace GameMaster.Pages.PlayerView
{
    public class LeaderboardModel : PageModel
    {
        private readonly Controller _controller;
        public List<Player> Players { get; set; }
        public List<Person> People { get; set; }
        public LeaderboardModel(Controller controller)
        {
            _controller = controller;
        }

        public void OnGet()
        {
            Players = _controller.GetTop100Players();
        }

    }
}
