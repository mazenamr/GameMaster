using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(6)]
    public class _006_RankTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Rank)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Fifty).NotNullable()
                .WithColumn("Score").AsInt32().NotNullable()
                .IsActive();
        }
    }
}
