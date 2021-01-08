namespace GameMaster.Constants
{
    public static class ApplicationClaimTypes
    {
        private const string Root = "./schemas/claims/";

        public const string FirstName = Root + "FirstName";
        public const string LastName = Root + "LastName";
        public const string UserId = Root + "UserId";
        public const string RoleId = Root + "RoleId";
        public static string UserRoleName = "UserRoleName";
    }
}
