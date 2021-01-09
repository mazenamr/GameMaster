using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(12)]
    public class _012_GameTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Game)
                .AutoId()
                .IntForeignKeyIndexed("Player1Id", Constants.Tables.Player, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Player2Id", Constants.Tables.Player, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Character1Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Character2Id", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Weapon1Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("Weapon2Id", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("GamewinnerId", Constants.Tables.Player, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("SeasonId", Constants.Tables.Season, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("RegionId", Constants.Tables.Region, isNullable: false, isPK: false)
                .WithColumn("DateTime").AsDateTime().NotNullable();
        }
    }
}
