using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(10)]
    public class _010_CharacterDetailsTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.CharacterDetails)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Tables.Character, false, false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable()
                .IntForeignKeyIndexed("SeasonId", Tables.Season, false, false)
                .WithColumn("WinRate").AsFloat().Nullable(); 
        }
    }
}
