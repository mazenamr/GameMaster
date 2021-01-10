using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(14)]
    public class _014_SynergiesCharacterCharacter : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesCharacterCharacter)
                .AutoId()
                .IntForeignKeyIndexed("Character1Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Character2Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
