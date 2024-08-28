-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100),
    course_description TEXT,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);


-- Create Instructors table
CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Insert data into Students table
INSERT INTO Students (first_name, last_name, email, date_of_birth) VALUES
('John', 'Doe', 'john.doe@example.com', '2000-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2001-02-20'),
('Michael', 'Johnson', 'michael.johnson@example.com', '1999-03-25'),
('Emily', 'Davis', 'emily.davis@example.com', '2002-04-30'),
('David', 'Wilson', 'david.wilson@example.com', '2000-05-10'),
('Sarah', 'Brown', 'sarah.brown@example.com', '2001-06-15'),
('James', 'Jones', 'james.jones@example.com', '1999-07-20'),
('Linda', 'Garcia', 'linda.garcia@example.com', '2002-08-25'),
('Robert', 'Martinez', 'robert.martinez@example.com', '2000-09-10'),
('Patricia', 'Hernandez', 'patricia.hernandez@example.com', '2001-10-15');

-- Insert data into Courses table
INSERT INTO Course (course_name, course_description) VALUES
('Introduction to Computer Science', 'An introductory course to computer science.'),
('Data Structures', 'A course on the implementation and usage of data structures.'),
('Database Systems', 'An in-depth look at database design and SQL.'),
('Operating Systems', 'A course on the fundamentals of operating systems.'),
('Algorithms', 'An advanced course on algorithm design and analysis.');

-- Insert data into Instructors table
INSERT INTO Instructors (first_name, last_name, email) VALUES
('Alice', 'Taylor', 'alice.taylor@example.com'),
('Bob', 'Anderson', 'bob.anderson@example.com'),
('Carol', 'Thomas', 'carol.thomas@example.com');

-- Insert data into Enrollments table
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-08-01'),
(2, 1, '2024-08-02'),
(3, 2, '2024-08-03'),
(4, 3, '2024-08-04'),
(5, 4, '2024-08-05'),
(6, 5, '2024-08-06'),
(7, 1, '2024-08-07'),
(8, 2, '2024-08-08'),
(9, 3, '2024-08-09'),
(10, 4, '2024-08-10'),
(1, 2, '2024-08-11'),
(2, 3, '2024-08-12'),
(3, 4, '2024-08-13'),
(4, 5, '2024-08-14'),
(5, 1, '2024-08-15');

--Basic Queries
--1
select * from Students
--2
select * from Course
--3
select
    E.*,
    C.course_name,
    S.first_name,
    S.last_name
from Enrollments as E
JOIN Courses C 
ON E.course_id = C.course_id
JOIN Students S 
ON E.student_id = S.student_id;

--Advanced Queries
--1
select * from Students , Course
where course_name = 'Operating Systems'

--2
SELECT COUNT(e.[course_id]) AS student_count,c.[course_name]
FROM Enrollments e, Course c
WHERE e.[course_id] = c.[course_id]
GROUP BY e.[course_id], c.[course_name]
HAVING COUNT(e.[course_id]) > 3;

--3
update [dbo].[Students]
set [email] = 'omarnouh@example.com'
where [student_id] = 3

select email from [dbo].[Students]

--4
 DELETE FROM Course
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

--5
SELECT (DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age 
FROM Students;

--6
select max(max_count) as max_enrollments 
from 
	(select count(course_id) as max_count 
	from [dbo].[Enrollments] 
	group by course_id ) as subquery

--7
select count([course_id]) as courses_count
from [dbo].[Enrollments]
group by [course_id]


--Join Queries
--1
select s.*,c.[course_name] from [dbo].[Students] as s 
join [dbo].[Enrollments] as e on s.[student_id] = e.[student_id]
join [dbo].[Course] as c on e.[course_id] = c.[course_id]
--2
select distinct i.* ,  c.[course_name] from  [dbo].[Instructors] as i
join [dbo].[Course] as c  on i.[instructor_id] = c.[instructor_id]
join [dbo].[Enrollments] as e on c.[course_id] = e.[course_id]
--3
select [first_name],[last_name] from [dbo].[Students] as s 
left join [dbo].[Enrollments] as e on s.student_id = e.student_id
where e.student_id is null
--Subqueries and Set Operations
--1
select s.[student_id] ,s.[first_name],s.[last_name],count(e.course_id) AS course_count 
from [dbo].[Students] as s
join [dbo].[Enrollments] as e on s.student_id = e.student_id 
GROUP BY 
    s.student_id,
    s.first_name,
    s.last_name
having count(e.course_id)>1
--2
select c.[course_name] , i.[first_name] from [dbo].[Course] as c
join [dbo].[Instructors] as i on c.instructor_id = i.instructor_id
where i.[first_name] = 'Carol'
--3
select top 3 s.[student_id] ,s.[first_name],s.[last_name],count(e.course_id) AS enrollment_count  from [dbo].[Students] as s
join [dbo].[Enrollments] as e on s.student_id = e.student_id
GROUP BY 
    s.student_id,
    s.first_name,
    s.last_name
order by count(e.course_id) desc

--4 
SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM [dbo].[Students] AS s
JOIN [dbo].[Enrollments] AS e ON s.student_id = e.student_id
JOIN [dbo].[Courses] AS c ON e.course_id = c.course_id
WHERE c.course_name = 'Introduction to Computer Science'

UNION

SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM [dbo].[Students] AS s
JOIN [dbo].[Enrollments] AS e ON s.student_id = e.student_id
JOIN [dbo].[Courses] AS c ON e.course_id = c.course_id
WHERE c.course_name = 'Data Structures';
--Functions and Stored Procedures
--1
CREATE PROCEDURE AddNewStudent
    @FirstName VARCHAR(100),
    @LastName VARCHAR(100),
    @Email VARCHAR(255),
    @DateOfBirth DATE
AS
BEGIN
    -- Insert the new student into the Students table
    INSERT INTO Students (first_name, last_name, email, date_of_birth)
    VALUES (@FirstName, @LastName, @Email, @DateOfBirth);
END;

EXEC AddNewStudent 
    @FirstName = 'omar', 
    @LastName = 'nouh', 
    @Email = 'omar.nouh@example.com', 
    @DateOfBirth = '2004-03-1';

select * from  [dbo].[Students]

--2
CREATE PROCEDURE CalculateStudentAge
    @StudentID INT,
    @Age INT OUTPUT
AS
BEGIN
    -- Calculate the age based on the student's date of birth
    SELECT @Age = DATEDIFF(YEAR, date_of_birth, GETDATE()) 
                  - CASE WHEN DATEADD(YEAR, DATEDIFF(YEAR, date_of_birth, GETDATE()), date_of_birth) > GETDATE() 
                         THEN 1 
                         ELSE 0 
                    END
    FROM Students
    WHERE student_id = @StudentID;
END;

DECLARE @StudentAge INT;

EXEC CalculateStudentAge 
    @StudentID = 1, 
    @Age = @StudentAge OUTPUT;

SELECT @StudentAge AS StudentAge;

--Aggregate Functions and Grouping
--1
select count([student_id]) as sum_of_students from [dbo].[Students]

--2
SELECT
    AVG(num_of_enrollment) AS avg_Enrollments,
    MAX(num_of_enrollment) AS max_Enrollments,
    MIN(num_of_enrollment) AS min_Enrollments
FROM (
    SELECT course_id,COUNT(*) AS num_of_enrollment
    FROM[dbo].[Enrollments]
    GROUP BY course_id
)   AS EnrollmentCounts;



--Additional Tasks
--1
SELECT * ,
    DATEDIFF(YEAR, date_of_birth, GETDATE()) AS age,
    CASE
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) < 20 THEN 'Under 20'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 20 AND 29 THEN '20-29'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN DATEDIFF(YEAR, date_of_birth, GETDATE()) >= 40 THEN '40 and above'
        ELSE 'Unknown'
    END AS age_category
FROM
    [dbo].[Students];

--2
SELECT c.course_id,c.course_name
FROM[dbo].[Courses] as c
WHERE
    EXISTS (SELECT 1 
			FROM [dbo].[Enrollments] as e 
			WHERE e.course_id = c.course_id);




