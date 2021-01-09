using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(19)]
    public class _019_SynergiesAgainstCharacterCharacter : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.SynergiesAgainstCharacterCharacter)
                .AutoId()
                .IntForeignKeyIndexed("Character1Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Character2Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
