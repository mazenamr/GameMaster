﻿using FluentMigrator;

namespace GameMaster.Migration.Tables
{
    [Migration(7)]
    public class _007_SeasonTable : AutoReversingMigration
    {
        public override void Up()
        {
            Create.Table(Constants.Tables.Season)
                .AutoId()
                .WithColumn("Name").AsString(StringLength.Hundred).NotNullable()
                .WithColumn("StartDate").AsDateTime().NotNullable()
                .WithColumn("EndDate").AsDateTime().NotNullable()
                .IsActive();
        }
    }
}
