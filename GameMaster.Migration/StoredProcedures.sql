CREATE PROCEDURE NewPerson @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime
AS
DECLARE @PersonOutput table(Id int,
						   FirstName nvarchar(50),
						   LastName nvarchar(50),
						   Birthday date,
						   DateCreated datetime,
						   IsActive bit);
INSERT [Person] (FirstName, LastName, Birthday, DateCreated, IsActive)
	OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
		INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
SELECT * FROM @PersonOutput;
GO

CREATE PROCEDURE NewUser @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime, @Email nvarchar(100), @Username nvarchar(50), @Password nvarchar(100), @RoleId int
AS
DECLARE @PersonOutput table(Id int,
						   FirstName nvarchar(50),
						   LastName nvarchar(50),
						   Birthday date,
						   DateCreated datetime,
						   IsActive bit);
INSERT [Person] (FirstName, LastName, Birthday, DateCreated, IsActive)
	OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
		INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
DECLARE @UserOutput table(Id int,
						  Email nvarchar(100),
						  Username nvarchar(50),
						  Password nvarchar(100),
						  RoleId int,
						  PersonId int,
						  IsActive bit);
INSERT [User] (Email, Username, Password, RoleId, PersonId, IsActive)
	OUTPUT INSERTED.Id, INSERTED.Email, INSERTED.Username, INSERTED.Password, INSERTED.RoleId, INSERTED.PersonId, INSERTED.IsActive
		INTO @UserOutput
VALUES (@Email, @Username, @Password, @RoleId, (SELECT Id FROM @PersonOutput), 1);
SELECT * FROM @UserOutput;
GO

CREATE PROCEDURE NewWeapon @Name nvarchar(50), @Power int, @Speed int, @Block int
AS
DECLARE @WeaponOutput table(Id int,
						   Name nvarchar(50),
						   Power int,
						   Speed int,
						   Block int,
						   IsActive bit);
INSERT [Weapon] (Name, Power, Speed, Block, IsActive)
	OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Power, INSERTED.Speed, INSERTED.Block, INSERTED.IsActive
		INTO @WeaponOutput
VALUES (@Name, @Power, @Speed, @Block, 1);
SELECT * FROM @WeaponOutput;
GO

CREATE PROCEDURE NewCharacter @Name nvarchar(50), @Strength int, @Mobility int, @Health int
AS
DECLARE @CharacterOutput table(Id int,
							   Name nvarchar(50),
							   Strength int,
							   Mobility int,
							   Health int,
							   IsActive bit);
INSERT [Character] (Name, Strength, Mobility, Health, IsActive)
	OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Strength, INSERTED.Mobility, INSERTED.Health, INSERTED.IsActive
		INTO @CharacterOutput
VALUES (@Name, @Strength, @Mobility, @Health, 1);
SELECT * FROM @CharacterOutput;
GO
