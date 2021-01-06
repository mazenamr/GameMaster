using FluentMigrator.Runner;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.CommandLine;
using System.CommandLine.Invocation;
using System.IO;
using System.Threading.Tasks;

namespace NPC.Migration
{
    internal class Program
    {
        private static async Task Main(string[] args)
        {
            var upOption = new Option("--up", "Migrate Up");
            upOption.Argument = new Argument<bool>(() => false);
            var downOption = new Option("--down", "Rollback database to a version");
            downOption.Argument = new Argument<long>(() => -1);

            var rootCommand = new RootCommand();
            rootCommand.Description = "NPC Fluent Migrator Runner";
            rootCommand.AddOption(upOption);
            rootCommand.AddOption(downOption);
            rootCommand.Handler = CommandHandler.Create<bool, long>((up, down) =>
            {
                var serviceProvider = CreateServices();

                using (var scope = serviceProvider.CreateScope())
                {
                    if (up)
                        UpdateDatabase(scope.ServiceProvider);

                    if (down > -1)
                        RollbackDatabase(scope.ServiceProvider, down);
                }
            });

            await rootCommand.InvokeAsync(args);
        }

        /// <summary>
        /// Configure the dependency injection services
        /// </sumamry>
        private static IServiceProvider CreateServices()
        {
            var builder = new ConfigurationBuilder()
               .SetBasePath(Directory.GetCurrentDirectory())
               .AddJsonFile("appSettings.json", optional: true, reloadOnChange: true);

            IConfigurationRoot configuration = builder.Build();
            var connectionString = configuration["connectionString"];

            return new ServiceCollection()
                // Add common FluentMigrator services
                .AddFluentMigratorCore()
                .ConfigureRunner(rb => rb
                    // Add SQLite support to FluentMigrator
                    .AddSqlServer()
                    // Set the connection string
                    .WithGlobalConnectionString(connectionString)
                    // Define the assembly containing the migrations
                    .ScanIn(typeof(Program).Assembly).For.Migrations())
                // Enable logging to console in the FluentMigrator way
                .AddLogging(lb => lb.AddFluentMigratorConsole())
                // Build the service provider
                .BuildServiceProvider(false);
        }

        private static void UpdateDatabase(IServiceProvider serviceProvider)
        {
            var runner = serviceProvider.GetRequiredService<IMigrationRunner>();
            runner.MigrateUp();
        }

        private static void RollbackDatabase(IServiceProvider serviceProvider, long rollbackVersion)
        {
            var runner = serviceProvider.GetRequiredService<IMigrationRunner>();
            runner.MigrateDown(rollbackVersion);
        }
    }
}