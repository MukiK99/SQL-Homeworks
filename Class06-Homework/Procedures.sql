USE SEDC_ACADEMY_HOMEWORK
GO
/*

Create new procedure called CreateGrade;
Procedure should create only Grade header info (not Grade Details); 
Procedure should return the total number of grades in the system for the Student on input (from the CreateGrade);
Procedure should return second resultset with the MAX Grade of all grades for the Student and Teacher on input (regardless the Course).

*/

SELECT * FROM dbo.Grade

CREATE OR ALTER PROCEDURE usp_CreateGrade
(
	@StudentId INT,
	@CourseId INT,
	@TeacherId INT,
	@Grade INT,
	@Comment NVARCHAR(MAX)

)
AS
BEGIN

	INSERT INTO dbo.Grade (StudentID,CourseID,TeacherID,Grade,Comment,CreatedDate)
	VALUES (@StudentId,@CourseId,@TeacherId,@Grade,@Comment,GETDATE())

	SELECT COUNT(*) AS StudentTotalGrades
	FROM Grade g
	WHERE StudentID = @StudentId

	SELECT MAX(g.Grade) AS MaxGrade
	FROM Grade g
	WHERE g.StudentID = @StudentId AND g.TeacherID = @TeacherId


END
GO

EXEC usp_CreateGrade @StudentId = 111, @CourseId = 2, @TeacherId = 82, @Grade = 10, @Comment = 'Very good grade'
SELECT * FROM Grade o ORDER BY o.ID DESC

/*

Create new procedure called CreateGradeDetail;
Procedure should add details for specific Grade (new record for new AchievementTypeID, Points, MaxPoints, Date for specific Grade);
Output from this procedure should be resultset with SUM of GradePoints calculated with formula AchievementPoints/AchievementMaxPoints*ParticipationRate for specific Grade

*/
SELECT * FROM GradeDetails
SELECT * FROM Grade
SELECT * FROM AchievementType



CREATE OR ALTER PROCEDURE usp_CreateGradeDetail
(
	@GradeId INT,
	@AchievementTypeId INT,
	@AchievementPoints INT,
	@AchievementMaxPoints INT
	
	

)
AS
BEGIN
	
	INSERT INTO dbo.GradeDetails (GradeID,AchievementTypeID,AchievementPoints,AchievementMaxPoints,AchievementDate)
	VALUES (@GradeId,@AchievementTypeId,@AchievementPoints,@AchievementMaxPoints,GETDATE())

	SELECT SUM(g.AchievementPoints * 1.0 / g.AchievementMaxPoints * act.ParticipationRate) AS GradePoints
	FROM dbo.GradeDetails g
	INNER JOIN dbo.AchievementType act ON act.ID = g.AchievementTypeID
	WHERE g.GradeID = @GradeId

END
GO


EXEC usp_CreateGradeDetail @GradeId = 0, @AchievementTypeId = 0, @AchievementPoints = 70, @AchievementMaxPoints = 100
SELECT * FROM dbo.GradeDetails g ORDER BY g.ID DESC
