using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(10)]
    public class _010_CharacterDetailsTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.CharacterDetails)
                .AutoId()
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .WithColumn("GamesPlayed").AsInt32().Nullable()
                .WithColumn("GamesWon").AsInt32().Nullable()
                .IntForeignKeyIndexed("SeasonId", Constants.Tables.Season, isNullable: false, isPK: false);
        }
    }
}
