using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(5)]
    public class _005_UserTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.User)
                .AutoId()
                .WithColumn("Email").AsString(StringLength.Hundred).NotNullable().Unique()
                .WithColumn("Username").AsString(StringLength.Fifty).NotNullable().Unique()
                .WithColumn("Password").AsString(StringLength.Hundred).NotNullable()
                .IntForeignKeyIndexed("RoleId", Constants.Tables.Role, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("PersonId", Constants.Tables.Person, isNullable: false, isPK: false)
                .IsActive();
        }
    }
}
