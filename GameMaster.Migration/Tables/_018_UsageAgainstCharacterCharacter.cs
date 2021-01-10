using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(18)]
    public class _018_UsageAgainstCharacterCharacter : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.UsageAgainstCharacterCharacter)
                .AutoId()
                .IntForeignKeyIndexed("Character1Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Character2Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
