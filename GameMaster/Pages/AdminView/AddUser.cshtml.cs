using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using GameMaster.Models;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace GameMaster.Pages.AdminView
{
    public class AddUserModel : PageModel
    {
        private readonly Controller _controller;

        public List<User> Users { get; set; } = new();

        public List<Role> Roles { get; set; } = new();

        [BindProperty]
        public InputModel Input { get; set; } = new();

        public string SuccessMessage { get; set; } = string.Empty;

        public AddUserModel(Controller controller)
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

            [Required]
            public int Role { get; set; }
        }

        public void OnGet()
        {
            Users = _controller.GettAllUsers();
            if (Users is not null)
            {
                foreach (var user in Users)
                {
                    Roles.Add(_controller.GetRoleById(user.RoleId));
                }
            }
        }

        public IActionResult OnPostCreate()
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

            _controller.CreateUser(Input.FirstName, Input.LastName, Input.Birthday, Input.Email, Input.Username, Input.Password, Input.Role);
            return RedirectToPage("AddUser");
        }

        public IActionResult OnPostEdit(int id)
        {
            _controller.EditUser(id, Input.Username, Input.Email, Input.Role);

            return RedirectToPage("AddUser");
        }

        public IActionResult OnPostDelete(int id)
        {
            _controller.DeleteUserById(id);

            SuccessMessage = "User has been deleted successfully";
            return Page();
        }

    }
}
