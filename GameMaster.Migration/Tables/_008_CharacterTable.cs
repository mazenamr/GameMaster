using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(8)]
    public class _008_CharacterTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Character)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Strength").AsInt32().NotNullable()
                .WithColumn("Mobility").AsInt32().NotNullable()
                .WithColumn("Health").AsInt32().NotNullable()
                .IsActive();
        }
    }
}
