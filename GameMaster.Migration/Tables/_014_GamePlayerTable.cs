using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(14)]
    public class _014_GamePlayerTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.GamePlayer)
                .AutoId()
                .IntForeignKeyIndexed("GameId", Constants.Tables.Game, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("PlayerId", Constants.Tables.Player, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("CharacterId", Constants.Tables.Character, isNullable: false, isPK: false)
                .IntForeignKeyIndexed("WeaponId", Constants.Tables.Weapon, isNullable: false, isPK: false)
                .WithColumn("IsWinner").AsBoolean().NotNullable().WithDefaultValue(false);
        }
    }
}
