CREATE DATABASE CourseReport;

USE CourseReport;

CREATE TABLE [dbo].[Course] (
	CourseId INT IDENTITY(1, 1) NOT NULL,
	CourseCode VARCHAR(5) NOT NULL,
	[Description] VARCHAR(50) NOT NULL,
	PRIMARY KEY (CourseId)
);

CREATE TABLE [dbo].[Student] (
	StudentId INT IDENTITY(1, 1) NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	PRIMARY KEY (StudentId)
);

CREATE TABLE [dbo].[Enrollment] (
	EnrollmentId INT IDENTITY(1, 1) NOT NULL,
	StudentId INT NOT NULL,
	CourseId INT NOT NULL,
	PRIMARY KEY (EnrollmentId),
	FOREIGN KEY (StudentId) REFERENCES Student(StudentId),
	FOREIGN KEY (CourseId) REFERENCES Course(CourseId)
);

--Course
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('AF', 'Accouting & Finance');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('ME', 'Aeronautical & Manufacturing Engineering');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('AF', 'Agriculture & Forestry');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('AS', 'Amercian Studies');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('APSY', 'Anatomy & Physiology');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('ANT', 'Antropology');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('ARC', 'Archeology');
INSERT INTO [dbo].[Course] (CourseCode, [Description]) VALUES ('CS', 'Computer Science');

--Student
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('Desmondo', 'Messer');
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('James', 'Bond');
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('Indiana', 'Jones');
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('John', 'Rambo');
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('Esmeralda', 'Smith');
INSERT INTO [dbo].[Student] (FirstName, LastName) VALUES ('Iron', 'Maiden');

--Enrollments
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (1, 1);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (2, 1);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (3, 1);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (2, 2);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (3, 2);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (4, 2);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (5, 3);
INSERT INTO [dbo].[Enrollment] (StudentId, CourseId) VALUES (6, 4);


--create view
CREATE VIEW [dbo].[EnrollmentReport] AS
	SELECT
		t1.EnrollmentId,
		t2.FirstName,
		t2.LastName,
		t3.CourseCode,
		t3.[Description]
	FROM
		[dbo].[Enrollment] t1
	INNER JOIN
		[dbo].[Student] t2 ON t2.StudentId = t1.StudentId
	INNER JOIN
		[dbo].[Course] t3 ON t3.CourseId = t1.CourseId
GO


CREATE PROCEDURE [dbo].[EnrollmentReport_GetList]
AS
	SELECT 
		EnrollmentId,
		FirstName,
		LastName,
		CourseCode,
		[Description]
	FROM
		[dbo].[EnrollmentReport]
GO

USE CourseReport;
EXEC EnrollmentReport_GetList