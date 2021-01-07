using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(2)]
    public class _002_PersonTable : AutoReversingMigration
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
