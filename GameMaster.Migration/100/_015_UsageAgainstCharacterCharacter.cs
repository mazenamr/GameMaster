using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(15)]
    public class _015_UsageAgainstCharacterCharacter : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.UsageAgainstCharacterCharacter)
                .AutoId()
                .IntForeignKeyIndexed("Character1Id", Tables.Character, false, false)
                .IntForeignKeyIndexed("Character2Id", Tables.Character, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable();
        }
    }
}
