CREATE PROCEDURE NewPerson @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime
AS
DECLARE @PersonOutput table(Id int,
                           FirstName nvarchar(50),
						   LastName nvarchar(50),
						   Birthday date,
						   DateCreated datetime,
						   IsActive bit);
INSERT Person (FirstName, LastName, Birthday, DateCreated, IsActive)
    OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
        INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
SELECT * FROM @PersonOutput;
GO

CREATE PROCEDURE NewWeapon @Name nvarchar(50), @Power int, @Speed int, @Block int
AS
DECLARE @WeaponOutput table(Id int,
                           Name nvarchar(50),
						   Power int,
						   Speed int,
						   Block int,
						   IsActive bit);
INSERT Weapon (Name, Power, Speed, Block, IsActive)
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
INSERT Character (Name, Strength, Mobility, Health, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Strength, INSERTED.Mobility, INSERTED.Health, INSERTED.IsActive
        INTO @CharacterOutput
VALUES (@Name, @Strength, @Mobility, @Health, 1);
SELECT * FROM @CharacterOutput;
GO
