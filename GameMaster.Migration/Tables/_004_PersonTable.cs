using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(4)]
    public class _004_PersonTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Person)
                .AutoId()
                .WithColumn("FirstName").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("LastName").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Birthday").AsDate().NotNullable()
                .WithColumn("DateCreated").AsDateTime().NotNullable()
                .IsActive();
        }
    }
}
