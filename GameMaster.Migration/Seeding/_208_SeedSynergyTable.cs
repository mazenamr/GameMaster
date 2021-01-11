using FluentMigrator;
using System;
using System.Data;

namespace GameMaster.Migration.Seeding
{
    [Migration(208)]
    public class _208_SeedSynergyTable : FluentMigrator.Migration
    {
        public override void Down()
        {
        }

        public override void Up()
        {
            Constants.Synergy.Synergies.ForEach(synergy =>
            {
                Execute.WithConnection((con, trans) =>
                {
                    int characterId;
                    int weaponId;
                    using (IDbCommand cmd = con.CreateCommand())
                    {
                        cmd.Transaction = trans;
                        cmd.CommandText = $"SELECT TOP(1) * FROM {Constants.Tables.Character} WHERE Name = '{synergy.Character}'";
                        characterId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    using (IDbCommand cmd = con.CreateCommand())
                    {
                        cmd.Transaction = trans;
                        cmd.CommandText = $"SELECT TOP(1) * FROM {Constants.Tables.Weapon} WHERE Name = '{synergy.Weapon}'";
                        weaponId = Convert.ToInt32(cmd.ExecuteScalar());
                    }
                    using (IDbCommand cmd = con.CreateCommand())
                    {
                        cmd.Transaction = trans;
                        cmd.CommandText = $"INSERT INTO [{Constants.Tables.Synergy}] (CharacterId, WeaponId, Constant, Multiplier) VALUES({characterId}, {weaponId}, {synergy.Constant}, {synergy.Multiplier})";
                        cmd.ExecuteNonQuery();
                    }    
                });
            });
        }
    }
}
