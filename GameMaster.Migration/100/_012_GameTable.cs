using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(12)]
    public class _012_GameTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Game)
                .AutoId()
                .WithColumn("DateTime").AsDateTime().NotNullable()
                .IntForeignKeyIndexed("Player1Id", Tables.Player, false, false)
                .IntForeignKeyIndexed("Player2Id", Tables.Player, false, false)
                .IntForeignKeyIndexed("Character1Id", Tables.Character, false, false)
                .IntForeignKeyIndexed("Character2Id", Tables.Character, false, false)
                .IntForeignKeyIndexed("Weapon1Id", Tables.Weapon, false, false)
                .IntForeignKeyIndexed("Weapon2Id", Tables.Weapon, false, false)
                .IntForeignKeyIndexed("GamewinnerId", Tables.Player, false, false)
                .IntForeignKeyIndexed("SeasonId", Tables.Season, false, false);
        }
    }
}
