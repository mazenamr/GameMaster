using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(19)]
    public class _019_HistoryTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.History)
                .AutoId()
                .WithColumn("Message").AsString(StringLength.FiveHundred).NotNullable()
                .WithColumn("Username").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("TimeCreated").AsDateTime().NotNullable();
        }
    }
}
