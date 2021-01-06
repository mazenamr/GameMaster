﻿using FluentMigrator;

namespace GameMaster.Migration._100
{
    [Migration(5)]
    public class _005_SeasonTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Tables.Season)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Hundred).NotNullable()
                .WithColumn("StartDate").AsDate().NotNullable()
                .WithColumn("EndDate").AsDate().NotNullable()
                .IsActive();
        }
    }
}