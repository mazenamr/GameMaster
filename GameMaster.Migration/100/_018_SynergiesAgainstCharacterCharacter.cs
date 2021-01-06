using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(18)]
    public class _018_SynergiesAgainstCharacterCharacter : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.SynergiesAgainstCharacterCharacter)
                .AutoId()
                .IntForeignKeyIndexed("Character1Id", Tables.Character, false, false)
                .IntForeignKeyIndexed("Character2Id", Tables.Character, false, false)
                .WithColumn("Constant").AsInt32().NotNullable()
                .WithColumn("Multiplier").AsInt32().NotNullable();
        }
    }
}
