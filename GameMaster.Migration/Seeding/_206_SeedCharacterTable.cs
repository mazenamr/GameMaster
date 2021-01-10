using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(206)]
    public class _206_SeedCharacterTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Character.Characters.ForEach(character =>
            {
                Insert.IntoTable(Constants.Tables.Character).Row(new
                {
                    character.Name,
                    character.Health,
                    character.Mobility,
                    character.Strength
                });
            });
        }
    }
}
