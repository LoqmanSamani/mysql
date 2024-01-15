CREATE DATABASE StudentManagement;

USE StudentManagement;

/*
Students Table:

    student_id (Primary Key)
    student_name
    date_of_birth
    email
    phone_number
    address
*/

CREATE TABLE students(

  STUDENT_ID INT AUTO_INCREMENT,
  FIRST_NAME VARCHAR (25),
  MIDDLE_NALE VARCHAR (25),
  LAST_NAME VARCHAR (25),
  DATE_OF_BIRTH DATE,
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  ADDRESS VARCHAR (200),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (STUDENT_ID)

);



/*
Courses Table:

    course_id (Primary Key)
    course_name
    course_code
    credit_hours
*/

CREATE TABLE courses(

  COURSE_ID INT AUTO_INCREMENT,
  COURSE_NAME VARCHAR (50),
  COURSE_CODE VARCHAR (10),
  CREATION_DATE DATE,
  CREDIT_HOURS DECIMAL (4, 2),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (COURSE_ID)

);


/*
Enrollments Table:

    enrollment_id (Primary Key)
    student_id (Foreign Key referencing Students table)
    course_id (Foreign Key referencing Courses table)
    enrollment_date
*/

CREATE TABLE enrollments(

  ENROLLMENT_ID INT AUTO_INCREMENT,
  STUDENT_ID INT,
  COURSE_ID INT,
  ENROLLMENT_DATE DATETIME DEFAULT NOW(),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (ENROLLMENT_ID),
  FOREIGN KEY (STUDENT_ID)
  REFERENCES students (STUDENT_ID),
  FOREIGN KEY (COURSE_ID) REFERENCES courses (COURSE_ID)

);


/*
Classes Table:

    class_id (Primary Key)
    course_id (Foreign Key referencing Courses table)
    class_name
    class_schedule
    class_room
*/

CREATE TABLE classes(

  CLASS_ID INT AUTO_INCREMENT,
  COURSE_ID INT,
  CLASS_NAME VARCHAR (50),
  CLASS_SCHEDULE VARCHAR (200),
  CLASS_ROOM VARCHAR (10),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (CLASS_ID),
  FOREIGN KEY (COURSE_ID)
  REFERENCES courses (COURSE_ID)

);


/*
Attendance Table:

    attendance_id (Primary Key)
    class_id (Foreign Key referencing Classes table)
    student_id (Foreign Key referencing Students table)
    attendance_date
    status (e.g., present, absent)
*/

CREATE TABLE attendance(

  ATTENDANCE_ID INT AUTO_INCREMENT PRIMARY KEY,
  CLASS_ID INT REFERENCES classes.CLASS_ID,
  STUDENT_ID INT REFERENCES students.STUDENT_ID,
  ATTENDANCE_DATE DATETIME DEFAULT NOW(),
  STATUS_ VARCHAR (15),
  DESCRIPTION_ VARCHAR (2000)

);


/*
Grades Table:

    grade_id (Primary Key)
    enrollment_id (Foreign Key referencing Enrollments table)
    marks_obtained
    total_marks
    grade
*/

CREATE TABLE grades(

  GRADE_ID INT AUTO_INCREMENT
  PRIMARY KEY,
  ENROLLMENT_ID INT
  REFERENCES enrollments.ENROLLMENT_ID,
  MARKS_OBTAINED DECIMAL (5, 2), -- the actual achieved grade
  TOTAL_MARKS DECIMAL (5, 2), -- the maximum possible grade
  GRADE VARCHAR (10), -- A, B, C, Pass, Fail
  DESCRIPTION_ VARCHAR (2000)
);


/*
Teachers Table:

    teacher_id (Primary Key)
    teacher_name
    email
    phone_number
*/

CREATE TABLE teachers(

  TEACHER_ID INT AUTO_INCREMENT,
  FIRST_NAME VARCHAR (50),
  MIDDLE_NAME VARCHAR (50),
  LAST_NAME VARCHAR (50),
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  ADDRESS VARCHAR (200),
  PRIMARY KEY (TEACHER_ID),
  DESCRIPTION_ VARCHAR (2000)

);

/*
TeachingAssignments Table:

    assignment_id (Primary Key)
    teacher_id (Foreign Key referencing Teachers table)
    class_id (Foreign Key referencing Classes table)
*/


CREATE TABLE teaching_assignments(

  ASSIGNMENT_ID INT AUTO_INCREMENT
  PRIMARY KEY,
  TEACHER_ID INT
  REFERENCES teachers.TEACHER_ID,
  CLASS_ID INT
  REFERENCES classes.CLASS_ID,
  DESCRIPTION_ VARCHAR (2000)

);


/*
Departments Table:

    department_id (Primary Key)
    department_name
*/

CREATE TABLE departments(

  DEPARTMENT_ID INT AUTO_INCREMENT
  PRIMARY KEY,
  DEPARTMENT_NAME VARCHAR (100),
  DESCRIPTION_ VARCHAR (2000)

);



/*
StudentDepartments Table (Associative table to represent many-to-many relationship between students and departments):

    student_id (Foreign Key referencing Students table)
    department_id (Foreign Key referencing Departments table)
*/

CREATE TABLE student_department(

  STUDENT_ID INT
  REFERENCES students.STUDENT_ID,
  DEPARTMENT_ID INT
  REFERENCES departments.DEPARTMENT_ID

);

ALTER TABLE student_department
ADD COLUMN DESCRIPTION_ VARCHAR (2000);






