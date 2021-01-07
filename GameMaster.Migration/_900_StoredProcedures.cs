using FluentMigrator;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace GameMaster.Migration
{

    [Migration(900)]
    public class _900_StoredProcedures : FluentMigrator.Migration
    {
        private static string StoredProcedures { get; set; } = Path.Combine(Directory.GetCurrentDirectory(), "StoredProcedures.sql");

        public override void Up()
        {
            if (File.Exists(StoredProcedures))
                Execute.Script(StoredProcedures);
        }

        public override void Down()
        {
            List<string> procedures = File.ReadAllText(StoredProcedures).Split('\n')
                .Select(x => x.Split(' '))
                .Where(x => x.FirstOrDefault().ToLower() == "create")
                .Select(x => x[2]).ToList();
            procedures.ForEach(x => Execute.Sql($"DROP PROCEDURE {x}"));
        }
    }
}
