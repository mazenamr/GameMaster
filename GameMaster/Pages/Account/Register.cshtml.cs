using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System;
using System.ComponentModel.DataAnnotations;

namespace GameMaster.Pages.Account
{
    public class RegisterModel : PageModel
    {
        private readonly Controller _controller;

        [BindProperty]
        public InputModel Input { get; set; } = new();

        public RegisterModel(Controller controller)
        {
            _controller = controller;
        }
    
        public class InputModel
        {
            [Required]
            [EmailAddress]
            public string Email { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Text)]
            [MinLength(8)]
            [MaxLength(50)]
            public string Username { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Password)]
            [MinLength(8)]
            [MaxLength(100)]
            public string Password { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Text)]
            public string FirstName { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Text)]
            public string LastName { get; set; } = string.Empty;

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

            if (_controller.GetUserByEmail(Input.Email) != null)
            {
                ModelState.AddModelError(string.Empty, "Email already in use");
                return Page();
            }

            _controller.CreateUser(Input.FirstName, Input.LastName, Input.Birthday, Input.Email, Input.Username, Input.Password, Constants.Role.Player);
            return RedirectToPage("/Index");
        }
    }
}
