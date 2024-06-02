--Declare scalar variable for storing FirstName values
--Assign value ‘Antonio’ to the FirstName variable
DECLARE @FirstName NVARCHAR(50) 
SET @FirstName = 'Antonio' 
SELECT @FirstName AS FirstName

--Find all Students having FirstName same as the variable
SELECT * FROM dbo.Student s
WHERE s.FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
DECLARE @Students TABLE (StudentId INT, StudentName NVARCHAR(50), DateOfBirth DATE)
INSERT INTO @Students (StudentId,StudentName,DateOfBirth)
SELECT s.ID, s.FirstName + ' ' + s.LastName, s.DateOfBirth
FROM dbo.Student s
WHERE s.Gender = 'F'
SELECT * FROM @Students
GO

SELECT * FROM Student

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
CREATE TABLE #StudentsTemp (LastName NVARCHAR(50), EnrolledDate DATE)
INSERT INTO #StudentsTemp (LastName,EnrolledDate)
SELECT s.LastName, s.EnrolledDate
FROM dbo.Student s
WHERE s.Gender = 'M' AND s.FirstName LIKE 'A%'
SELECT * FROM #StudentsTemp

--Retrieve the students from the table which last name is with 7 characters
SELECT * FROM #StudentsTemp
WHERE LEN(LastName) = 7

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same
SELECT * FROM dbo.Teacher t
WHERE LEN(t.FirstName) < 5 AND LEFT(t.FirstName, 3) = RIGHT(t.LastName, 3)
GO
