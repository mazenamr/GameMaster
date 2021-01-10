using FluentMigrator.Builders.Create.Table;

namespace GameMaster.Migration
{
    public static class StringLength
    {
        public const int One = 1;
        public const int Two = 2;
        public const int Ten = 10;
        public const int Fifteen = 15;
        public const int Twenty = 20;
        public const int Fifty = 50;
        public const int Hundred = 100;
        public const int TwoHundredFifty = 250;
        public const int FiveHundred = 500;
    }

    public static class FluentMigratorExtensions
    {
        public static ICreateTableColumnOptionOrWithColumnSyntax AutoId(this ICreateTableWithColumnOrSchemaSyntax self) =>
            self.WithColumn("Id").AsInt32().NotNullable().Identity().PrimaryKey();

        public static ICreateTableColumnOptionOrWithColumnSyntax IntForeignKeyIndexed(this ICreateTableColumnOptionOrWithColumnSyntax self, string name, string foreignTable, bool isNullable, bool isPK)
        {
            ICreateTableColumnOptionOrWithColumnSyntax col;

            if (isNullable)
                col = self.WithColumn(name).AsInt32().Nullable().ForeignKey(foreignTable, "id");
            else
                col = self.WithColumn(name).AsInt32().NotNullable().ForeignKey(foreignTable, "id");

            if (isPK)
                col.PrimaryKey();
            else
                col.Indexed();

            return self;
        }

        public static ICreateTableColumnOptionOrWithColumnSyntax IsActive(this ICreateTableColumnOptionOrWithColumnSyntax self, bool defaultValue = true) =>
            self.WithColumn("IsActive").AsBoolean().NotNullable().WithDefaultValue(defaultValue);
    }
}