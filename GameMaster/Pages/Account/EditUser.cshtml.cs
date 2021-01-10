using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using GameMaster.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace GameMaster.Pages.Account
{
    public class EditUserModel : PageModel
    {
        private readonly Controller _controller;

        private readonly PasswordHasher<User> _hasher;

        public User? user { get; set; }

        [BindProperty]
        public InputModel input { get; set; } = new();

        public string ErrorMessage { get; set; } = string.Empty;

        public string SuccessMessage { get; set; } = string.Empty;
        
        public EditUserModel(Controller controller, PasswordHasher<User> hasher)
        {
            _controller = controller;
            _hasher = hasher;
        }

        public class InputModel
        {
            [Required]
            [DataType(DataType.Password)]
            [MinLength(8)]
            [MaxLength(100)]
            public string currentPass { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Password)]
            [MinLength(8)]
            [MaxLength(100)]
            public string newPass { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Password)]
            [MinLength(8)]
            [MaxLength(100)]
            public string verifyPass { get; set; } = string.Empty;

        }

        public void OnGet()
        {
        }

        public IActionResult OnPostEdit()
        {
            user = _controller.GetUserByUsername(HttpContext.User.Identity.Name);

            if (user is null)
            {
                return RedirectToPage("/Error");
            }

            if (!ModelState.IsValid)
            {
                ErrorMessage = "Please make sure to fill in all required fields";
                return Page();
            }

            if (_hasher.VerifyHashedPassword(user, user.Password, input.currentPass) != PasswordVerificationResult.Success)
            {
                ErrorMessage = "Old password does not match with the current password";
                return Page();
            }

            if (input.newPass != input.verifyPass)
            {
                ErrorMessage = "The new password does not match the verified password";
                return Page();
            }

            _controller.EditUserPassword(user.Username, _hasher.HashPassword(user, input.newPass));
            SuccessMessage = "Password has been changed successfully";
            return Page();
        }

    }
}
