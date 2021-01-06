using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(4)]
    public class _004_UserTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.User)
                .AutoId()
                .WithColumn("Email").AsString(StringLength.Hundred).NotNullable()
                .WithColumn("Password").AsString(StringLength.Hundred).NotNullable()
                .IntForeignKeyIndexed("RoleId", Tables.Role, false, false)
                .IntForeignKeyIndexed("PersonId", Tables.Person, false, false)
                .IsActive();
        }
    }
}
