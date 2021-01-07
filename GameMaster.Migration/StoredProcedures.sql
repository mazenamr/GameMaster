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