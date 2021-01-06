using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(2)]
    public class _002_PersonTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Person)
                .AutoId()
                .WithColumn("Birthday").AsDate().NotNullable()
                .WithColumn("DateCreated").AsDate().NotNullable()
                .WithColumn("FirstName").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("LastName").AsString(StringLength.Fifty).NotNullable()
                .IsActive();
        }
    }
}
