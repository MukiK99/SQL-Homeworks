-- 7. Find all unique courses students are taking, using the CourseName column.

SELECT c.CourseName
FROM [dbo].[Courses] c
UNION
SELECT e.CourseName
FROM [dbo].[Enrollments] e

-- 8. Find all courses students are taking, including duplicates.
SELECT c.CourseName
FROM [dbo].[Courses] c
UNION ALL
SELECT e.CourseName
FROM [dbo].[Enrollments] e

-- 9. Find common courses between those students are taking and those available in the Courses table.
SELECT e.CourseName
FROM [dbo].[Enrollments] e
INTERSECT
SELECT c.CourseName
FROM [dbo].[Courses] c

-- 10. Create combinations of each student with each course.
SELECT s.FirstName,s.LastName, c.CourseName
FROM [dbo].[Students] s
CROSS JOIN [dbo].[Courses] c 

-- 11. Find all students and their courses, including students who may not be enrolled in any courses.
SELECT s.FirstName,s.LastName,e.CourseName,e.StudentID 
FROM [dbo].[Students] s
LEFT JOIN [dbo].[Enrollments] e ON s.StudentID = e.StudentID

-- 12. Find all students whose name starts with 'M'.
SELECT s.FirstName,s.LastName
FROM [dbo].[Students] s
WHERE s.FirstName LIKE 'M%'

-- 13. Find all courses students are taking that have more than 3 credits.

SELECT c.CourseName
FROM [dbo].[Courses] c
WHERE c.CourseCredits > 3

-- 14. BONUS - Find all courses and students enrolled in those courses, including courses where no students may be enrolled. 
SELECT c.CourseName,s.FirstName,s.LastName
FROM [dbo].[Courses] c
LEFT JOIN [dbo].[Enrollments] e ON c.CourseName = e.CourseName
LEFT JOIN [dbo].[Students] s ON e.StudentID = s.StudentID





