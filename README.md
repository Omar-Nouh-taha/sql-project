
Understood! Here’s a README file without specific SQL queries, focusing on project setup and objectives:

SQL Project: Student Course Management
Project Overview
This project involves creating a database to manage student course information. The database will include tables for students, courses, enrollments, and instructors. This project is designed to help you learn and practice SQL through various tasks including database setup, table creation, data insertion, and query formulation.

Project Requirements
Database Setup
Create a Database

Create a database named StudentCourseManagement.

Table Creation
Create the following tables with appropriate data types and constraints:

Students

student_id (Primary Key, INT, AUTO_INCREMENT)
first_name (VARCHAR)
last_name (VARCHAR)
email (VARCHAR)
date_of_birth (DATE)
Courses

course_id (Primary Key, INT, AUTO_INCREMENT)
course_name (VARCHAR)
course_description (TEXT)
Instructors

instructor_id (Primary Key, INT, AUTO_INCREMENT)
first_name (VARCHAR)
last_name (VARCHAR)
email (VARCHAR)
Enrollments

enrollment_id (Primary Key, INT, AUTO_INCREMENT)
student_id (Foreign Key, INT)
course_id (Foreign Key, INT)
enrollment_date (DATE)
Insert Sample Data
Insert at least:

10 students
5 courses
3 instructors
15 enrollments
Basic Queries
Perform basic queries to:

Select all students
Select all courses
Select all enrollments with student names and course names
Advanced Queries
Perform advanced queries to:

Select students who enrolled in a specific course
Select courses with more than 5 students
Update a student's email
Delete a course that no students are enrolled in
Calculate the average age of students
Find the course with the maximum enrollments
List courses along with the number of students enrolled
Join Queries
Perform join queries to:

Select all students with their enrolled courses
List all instructors and their courses
Find students who are not enrolled in any course
Subqueries and Set Operations
Use subqueries and set operations to:

Select students enrolled in more than one course
Find courses taught by a specific instructor
Select the top 3 students with the most enrollments
Use UNION to combine results of two different SELECT queries
Functions and Stored Procedures
Create and use:

A stored procedure to add a new student
A function to calculate the age of a student based on their date of birth
Aggregate Functions and Grouping
Calculate and group data to:

Calculate the total number of students
Calculate the average, minimum, and maximum number of enrollments per course
Additional Tasks
Perform additional tasks to:

Create aliases for complex column names
Use CASE to categorize students based on their age
Use EXISTS to find courses with at least one enrolled student
Add comments in SQL for clarity
