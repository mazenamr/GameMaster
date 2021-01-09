using FluentMigrator;
using Microsoft.AspNetCore.Identity;
using System;

namespace GameMaster.Migration.Seeding
{
    [Migration(204)]
    public class _204_SeedUserTable : FluentMigrator.Migration
    {
        internal class UserPassword
        {
            public static string HashPassword(string password)
            {
                return new PasswordHasher<UserPassword>().HashPassword(new(), password);
            }
        }

        public override void Down()
        {
        }

        public override void Up()
        {
            string password = UserPassword.HashPassword("1234567890");
            Constants.Role.Roles.ForEach(role =>
            {
                string name = role.Name.ToLower();
                Execute.Sql($"EXEC NewUser '{role.Name}', '{role.Name}', '2000-01-01', '{DateTime.UtcNow}', '{name}@gamemaster.xyz', '{name}', '{password}', {role.Id}");
            });
        }
    }
}
