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
                .IntForeignKeyIndexed("UserId", Constants.Tables.User, isNullable: false, isPK: false)
                .WithColumn("TimeCreated").AsDateTime().NotNullable();
        }
    }
}
