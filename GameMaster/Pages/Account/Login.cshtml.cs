using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Security.Claims;
using System.Threading.Tasks;
using GameMaster.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace GameMaster.Pages.Account
{
    public class LoginModel : PageModel
    {
        private readonly ILogger<LoginModel> _logger;

        private readonly Controller _controller;

        private readonly PasswordHasher<User> _hasher;

        [BindProperty]
        public InputModel Input { get; set; } = new();

        public LoginModel(ILogger<LoginModel> logger, PasswordHasher<User> hasher, Controller controller)
        {
            _logger = logger;
            _controller = controller;
            _hasher = hasher;
        }

        public class InputModel
        {
            [Required]
            [EmailAddress]
            public string Email { get; set; } = string.Empty;

            [Required]
            [DataType(DataType.Password)]
            public string Password { get; set; } = string.Empty;
        }

        public async Task OnGetAsync()
        {
            await HttpContext.SignOutAsync(
                CookieAuthenticationDefaults.AuthenticationScheme);
        }

        public async Task<IActionResult> OnPostAsync()
        {
            User? user = _controller.GetUserByEmail(Input.Email.Trim());
            if (user is null)
            {
                ModelState.AddModelError(string.Empty, "No account is registered with this email address");
                return Page();
            }

            if (_hasher.VerifyHashedPassword(user, user.Password, Input.Password) != PasswordVerificationResult.Success)
            {
                ModelState.AddModelError(string.Empty, "Email or password incorrect");
                return Page();
            }

            List<Claim> claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Email)
            };

            ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            AuthenticationProperties authenticationProperties = new AuthenticationProperties
            {
                AllowRefresh = true,
                ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(60),
                IsPersistent = true,
                IssuedUtc = DateTime.UtcNow,
                RedirectUri = "/Index"
            };

            await HttpContext.SignInAsync(
                CookieAuthenticationDefaults.AuthenticationScheme,
                new ClaimsPrincipal(claimsIdentity),
                authenticationProperties);

            return RedirectToPage("/Index");
        }
    }
}
