using GameMaster.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace GameMaster.Pages.Account
{
    public class RegisterModel : PageModel
    {
        private readonly ILogger<RegisterModel> _logger;

        private readonly Controller _controller;

        private readonly PasswordHasher<User> _hasher;

        [BindProperty]
        public InputModel Input { get; set; } = new();

        public RegisterModel(ILogger<RegisterModel> logger, Controller controller, PasswordHasher<User> hasher)
        {
            _logger = logger;
            _controller = controller;
            _hasher = hasher;
        }
    
        public class InputModel
        { 
            [Required]
            [EmailAddress]
            public string Email { get; set; }

            [Required]
            [DataType(DataType.Password)]
            public string Password { get; set; }

            [Required]
            [DataType(DataType.Text)]
            public string FirstName { get; set; }

            [Required]
            [DataType(DataType.Text)]
            public string LastName { get; set; }

            [Required]
            [DataType(DataType.Date)]
            public DateTime Birthday { get; set; }
        }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Please fill in all credentials");
                return Page();
            }

            _controller.AddPerson(Input.FirstName, Input.LastName, Input.Birthday);
            List<Person> people = _controller.GetPersonByName(Input.FirstName, Input.LastName);
            Person? person = people.OrderByDescending(x => x.Id).FirstOrDefault();

            User? user = _controller.GetUserByEmail(Input.Email);
            if (user != null)
            {
                ModelState.AddModelError(string.Empty, "Email or username already in use");
                return Page();
            }
            else
            {
                user = new();
            }

            _controller.AddUser(Input.Email.Trim(), _hasher.HashPassword(user, Input.Password), person.Id, 100);
            return RedirectToPage("/Index");
        }
    }
}
