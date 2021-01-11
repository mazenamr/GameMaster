using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(16)]
    public class _016_UsageAgainstCharacterCharacterTable : AutoReversingMigration
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
