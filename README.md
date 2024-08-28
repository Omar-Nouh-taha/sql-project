# SQL Project: Student Course Management

## Project Overview

This project involves creating a database to manage student course information. You’ll be working with tables for students, courses, enrollments, and instructors. The aim is to practice SQL queries covering various aspects like selection, filtering, aggregation, joins, and subqueries.

## What You Need to Do

### 1. Database Setup

- **Create a Database**: Set up a database named `StudentCourseManagement`.

### 2. Table Creation

Create the following tables:

- **Students**
  - `student_id` (Primary Key, INT, AUTO_INCREMENT)
  - `first_name` (VARCHAR)
  - `last_name` (VARCHAR)
  - `email` (VARCHAR)
  - `date_of_birth` (DATE)

- **Courses**
  - `course_id` (Primary Key, INT, AUTO_INCREMENT)
  - `course_name` (VARCHAR)
  - `course_description` (TEXT)

- **Instructors**
  - `instructor_id` (Primary Key, INT, AUTO_INCREMENT)
  - `first_name` (VARCHAR)
  - `last_name` (VARCHAR)
  - `email` (VARCHAR)

- **Enrollments**
  - `enrollment_id` (Primary Key, INT, AUTO_INCREMENT)
  - `student_id` (Foreign Key, INT)
  - `course_id` (Foreign Key, INT)
  - `enrollment_date` (DATE)

### 3. Insert Sample Data

- Add at least 10 students.
- Insert 5 courses.
- Include 3 instructors.
- Create 15 enrollments connecting students with courses.

### 4. Basic Queries

Run queries to:
- Select all students.
- Select all courses.
- Select all enrollments along with student names and course names.

### 5. Advanced Queries

Execute advanced queries to:
- Find students enrolled in a specific course.
- Identify courses with more than 5 students.
- Update a student’s email address.
- Delete a course if no students are enrolled in it.
- Calculate the average age of students.
- Find the course with the most enrollments.
- List courses and the number of students enrolled in each.

### 6. Join Queries

Perform joins to:
- Select all students and their enrolled courses.
- List all instructors and their courses.
- Find students who are not enrolled in any course.

### 7. Subqueries and Set Operations

Use subqueries and set operations to:
- Select students enrolled in more than one course.
- Find courses taught by a specific instructor.
- Select the top 3 students with the most enrollments.
- Combine results from different queries using UNION.

### 8. Functions and Stored Procedures

Create and use:
- A stored procedure to add a new student.
- A function to calculate a student’s age based on their date of birth.

### 9. Aggregate Functions and Grouping

Calculate and group data to:
- Find the total number of students.
- Calculate the average, minimum, and maximum number of enrollments per course.

### 10. Additional Tasks

Complete additional tasks to:
- Use CASE statements to categorize students by age.
- Use EXISTS to find courses with at least one enrolled student.


