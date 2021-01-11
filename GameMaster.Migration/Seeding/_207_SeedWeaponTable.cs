using FluentMigrator;

namespace GameMaster.Migration.Seeding
{
    [Migration(207)]
    public class _207_SeedWeaponTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Weapon.Weapons.ForEach(weapon =>
            {
                Insert.IntoTable(Constants.Tables.Weapon).Row(new
                {
                    weapon.Name,
                    weapon.Block,
                    weapon.Magic,
                    weapon.Power,
                    weapon.Speed
                });
            });
        }
    }
}
