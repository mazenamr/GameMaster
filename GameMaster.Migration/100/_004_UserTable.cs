using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(4)]
    public class _004_UserTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.User)
                .AutoId()
                .WithColumn("Email").AsString(StringLength.Hundred).NotNullable()
                .WithColumn("Password").AsString(StringLength.Hundred).NotNullable()
                .IntForeignKeyIndexed("RoleId", Constants.Tables.Role, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("PersonId", Constants.Tables.Person, isNullable: false, isPK: false)
                .IsActive();
        }
    }
}
