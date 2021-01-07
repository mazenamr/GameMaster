namespace GameMaster.Constants
{
    public static class Tables
    {
            #region UserInfo

            public const string User = "User";
            public const string Role = "Role";
            public const string Person = "Person";
            public const string Player = "Player";

            #endregion UserInfo

            #region GameInfo

            public const string Rank = "Rank";
            public const string Game = "Game";
            public const string Season = "Season";
            public const string Region = "Region";

            #endregion GameInfo

            #region Items

            public const string Weapon = "Weapon";
            public const string WeaponDetails = "WeaponDetails";
            public const string Character = "Character";
            public const string CharacterDetails = "CharacterDetails";

            #endregion Items

            #region AgainstCombinations

            public const string UsageAgainstCharacterCharacter = "UsageAgainstCharacterCharacter";
            public const string UsageAgainstWeaponWeapon = "UsageAgainstWeaponWeapon";
            public const string UsageAgainstCharacterWeapon = "UsageAgainstCharacterWeapon";
            public const string SynergiesAgainstCharacterCharacter = "SynergiesAgainstCharacterCharacter";
            public const string SynergiesAgainstWeaponWeapon = "SynergiesAgainstWeaponWeapon";
            public const string SynergiesAgainstCharacterWeapon = "SynergiesAgainstCharacterWeapon";

            #endregion AgainstCombinations

            #region WithCombinations

            public const string UsageWith = "UsageWith";
            public const string SynergiesWith = "SynergiesWith";

            #endregion WithCombinations
    }
}
