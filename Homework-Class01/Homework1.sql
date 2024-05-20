USE [master]
GO
-- query for the execution of the whole file to work as aspected
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'SEDCACADEMYDB')
	ALTER DATABASE [SEDC] SET  SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
USE [Master]
GO
DROP DATABASE IF EXISTS [SEDCACADEMYDB]
GO
CREATE DATABASE [SEDCACADEMYDB]
GO
USE [SEDCACADEMYDB]
GO

CREATE TABLE [Student] (
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	EnrolledDate DATE NOT NULL,
	Gender NVARCHAR(15) NULL,
	NationalIIDNumber INT NULL,
	StudentCardNumber INT NOT NULL
	CONSTRAINT PK_Student PRIMARY KEY CLUSTERED (Id)
	)
GO
SELECT * FROM dbo.Student

CREATE TABLE [Teacher] (
	Id INT IDENTITY(1,1),
	FirstName NVARCHAR(30) NOT NULL,
	LastName NVARCHAR(30) NOT NULL,
	DateOfBirth DATE NOT NULL,
	AcademicRank NVARCHAR(50) NOT NULL,
	HireDate DATE NULL
	CONSTRAINT PK_Teacher PRIMARY KEY CLUSTERED (Id)
	)
GO
SELECT * FROM dbo.Teacher

CREATE TABLE [Grade] (
	Id INT IDENTITY(1,1),
	StudentId INT NOT NULL,
	CourseId INT NOT NULL,
	TeacherId INT NOT NULL,
	Grade INT  NOT NULL,
	Comment NVARCHAR(MAX) NULL,
	CreatedDate DATE NULL
	CONSTRAINT PK_Grade PRIMARY KEY CLUSTERED (Id)
	)
GO
SELECT * FROM dbo.Grade

CREATE TABLE [Course] (
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL,
	Credit TINYINT NOT NULL,
	AcademicYear TINYINT NOT NULL,
	Semester TINYINT NOT NULL
	CONSTRAINT PK_Course PRIMARY KEY CLUSTERED (Id)
	)
	GO
SELECT * FROM dbo.Course

CREATE TABLE [GradeDetails] (
	Id INT IDENTITY(1,1),
	GradeId INT NOT NULL,
	AchievementTypeId INT NOT NULL,
	AchievementPoints INT NOT NULL,
	AchievementMaxPoints INT NULL,
	AchievementDate DATE NULL
	CONSTRAINT PK_GradeDetails PRIMARY KEY CLUSTERED (Id)
	)
	GO
SELECT * FROM dbo.GradeDetails

CREATE TABLE [AchievementType] (
	Id INT IDENTITY(1,1),
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(MAX) NULL,
	ParticipationRate DECIMAL(6,4) NULL
	CONSTRAINT PK_AchievementType PRIMARY KEY CLUSTERED (Id)
	)
	GO

SELECT * FROM dbo.AchievementType