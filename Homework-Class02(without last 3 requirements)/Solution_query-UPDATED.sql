USE [SEDC_ACADEMY_HOMEWORK]

-- Find all Students with FirstName = Antonio

SELECT * FROM dbo.Student
WHERE FirstName = 'Antonio'
GO

-- Find all Students with DateOfBirth greater than ‘01.01.1999’

SELECT * FROM dbo.Student
WHERE DateOfBirth > '01.01.1999'
GO

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998

SELECT * FROM dbo.Student
WHERE LastName LIKE 'J%' AND EnrolledDate >= '1998.01.01' AND EnrolledDate <= '1998.01.31'
GO

-- List all Students ordered by FirstName

SELECT * FROM dbo.Student
ORDER BY FirstName ASC
GO

-- List all Teacher Last Names and Student Last Names in single result set. Remove duplicates

SELECT LastName FROM dbo.Teacher
UNION 
SELECT LastName FROM dbo.Student
GO

-- List all possible combinations of Courses names and AchievementType names that can be passed by student
SELECT c.Name as CourseName,a.Name as AchievementTypeName
FROM [dbo].[Course] c
CROSS JOIN [dbo].[AchievementType] a

-- List all Teachers without exam Grade
SELECT t.FirstName,t.LastName,g.TeacherID,g.Grade
FROM [dbo].[Teacher] t
LEFT JOIN [dbo].[Grade] g ON t.ID = g.TeacherID
WHERE g.TeacherID IS NULL

