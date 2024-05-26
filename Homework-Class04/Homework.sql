USE SEDC_ACADEMY_HOMEWORK
GO

--Calculate the count of all grades per Teacher in the system
SELECT * FROM dbo.Teacher
SELECT * FROM dbo.Grade

SELECT t.FirstName, t.LastName, COUNT(g.Grade) as TotalgradeCount 
FROM dbo.Grade g
INNER JOIN dbo.Teacher t ON t.ID = g.TeacherID
GROUP BY t.FirstName, t.LastName


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
SELECT * FROM Grade

SELECT t.FirstName + ' ' + t.LastName AS FullName, COUNT(g.Grade) as TotalgradeCount 
FROM dbo.Grade g
INNER JOIN dbo.Teacher t ON t.ID = g.TeacherID
WHERE g.StudentID < 100
GROUP BY t.FirstName + ' ' + t.LastName


--Find the Maximal Grade, and the Average Grade per Student on all grades in the system
SELECT s.FirstName + ' ' + s.LastName AS FullName, MAX(g.Grade) as MaxGrade, AVG(g.Grade) as AverageGrade FROM dbo.Grade g
INNER JOIN dbo.Student s ON s.ID = g.StudentID
GROUP BY s.FirstName + ' ' + s.LastName


--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
SELECT t.FirstName, t.LastName, COUNT(g.Grade) as GradesCountAbove200 
FROM dbo.Grade g
INNER JOIN dbo.Teacher t ON t.ID = g.TeacherID
GROUP BY t.FirstName, t.LastName
HAVING COUNT(g.Grade) > 200


--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade

SELECT s.ID as StudentId, COUNT(g.Grade) as TotalCountOfGrades, MAX(g.Grade) as MaximalGrade, AVG(g.Grade) as AverageGrade FROM dbo.Grade g 
INNER JOIN dbo.Student s ON s.ID = g.StudentID 
GROUP BY s.ID
HAVING MAX(g.Grade) = AVG(g.Grade)


--List Student First Name and Last Name next to the other details from previous query
SELECT s.FirstName as FirstName, s.LastName as LastName, COUNT(g.Grade) as TotalCountOfGrades, MAX(g.Grade) as MaximalGrade, AVG(g.Grade) as AverageGrade FROM dbo.Grade g 
INNER JOIN dbo.Student s ON s.ID = g.StudentID 
GROUP BY s.FirstName, s.LastName
HAVING MAX(g.Grade) = AVG(g.Grade)

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
CREATE VIEW vw_StudentGrades AS
SELECT s.ID, COUNT(g.Grade) as TotalCountOfGrades FROM dbo.Grade g
INNER JOIN dbo.Student s ON s.ID = g.StudentID
GROUP BY s.ID

--Change the view to show Student First and Last Names instead of StudentID
ALTER VIEW vw_StudentGrades AS
SELECT
	s.FirstName,
	s.LastName,
	COUNT(g.Grade) as TotalCountOfGrades
FROM dbo.Grade g
INNER JOIN dbo.Student s ON s.ID = g.StudentID
GROUP BY s.FirstName,s.LastName

--List all rows from view ordered by biggest Grade Count
SELECT * FROM dbo.vw_StudentGrades
ORDER BY 3 DESC