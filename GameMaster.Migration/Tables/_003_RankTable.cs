using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(3)]
    public class _003_RankTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Rank)
                .WithColumn("Id").AsInt32().PrimaryKey().NotNullable()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Score").AsInt32().NotNullable()
                .IsActive();
        }
    }
}
