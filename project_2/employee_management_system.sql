CREATE DATABASE EmployeeManagementSystem;   -- Create the database  "employee management system"


USE EmployeeManagementSystem;  -- Active the crated database (employee management system)





-- Crate a basic of departments table!

CREATE TABLE departments(

    DEPARTMENT_ID VARCHAR (15) PRIMARY KEY
);





-- Create a basic of positions table!

CREATE TABLE positions(
    
    POSITION_ID INT PRIMARY KEY
);






/*
Employees Table:

    EmployeeID: Primary Key, unique identifier for each employee.
    FirstName: First name of the employee.
    LastName: Last name of the employee.
    Email: Email address of the employee.
    PhoneNumber: Phone number of the employee.
    Address: Residential address of the employee.
    BirthDate: Date of birth of the employee.
    HireDate: Date when the employee was hired.
    DepartmentID: Foreign Key, referencing the Departments Table.
    RoleID: Foreign Key, referencing the Roles Table.
    Salary: Salary of the employee.
*/



-- Create the first table  "employee table" (Actually, you should first create a basic version of the tables that are linked to this via foreign keys!)

CREATE TABLE employees(
    
    EMPLOYEE_ID VARCHAR (15) PRIMARY KEY,
    FIRST_NAME VARCHAR (50),
    LAST_NAME VARCHAR (50),
    EMAIL VARCHAR (50),
    PHONE_NUMBER VARCHAR (15),
    ADDRESS VARCHAR (500),
    BIRHT_DAY DATE,
    HIRE_DATE DATETIME,
    DEPARTMENT_ID VARCHAR (15),
    POSITION_ID INT,
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID),
    FOREIGN KEY (POSITION_ID) REFERENCES positions(POSITION_ID)
    
);





ALTER TABLE employees
RENAME COLUMN BIRHT_DAY TO BIRTH_DAY; -- Correct the typing error in the employees table


-- I forgot to define a salary column, so I add it now :)
ALTER TABLE employees
ADD COLUMN SALARY DECIMAL (8,  2);








/*
Departments Table:

    DepartmentID: Primary Key, unique identifier for each department.
    DepartmentName: Name of the department.
    ManagerID: Foreign Key, referencing the Employees Table (EmployeeID of the department manager).
    Location: Location or office of the department.
    Description: Description of the department.
*/



-- Modify (improve) the departments table

ALTER TABLE departments
ADD DEPARTMENT_NAME VARCHAR (50),
ADD MANAGER_ID VARCHAR (15),
ADD LOCATION VARCHAR (200),
ADD DESCRIPTION_ VARCHAR (2000),
ADD FOREIGN KEY (MANAGER_ID) REFERENCES employees (EMPLOYEE_ID); 








/*
Positions Table:

    PositionID: Primary Key, unique identifier for each role.
    RoleName: Name or title of the role.
    Description: Description of the role.
    SalaryRange: Range or specific amount representing the salary for this role.
*/



-- Modify (improve) the positions table

ALTER TABLE positions
ADD POSITION_NAME VARCHAR (50),
ADD DESCRIPTION_ VARCHAR (2000),
ADD SALARY_RANGE VARCHAR (30);








-- I decided to add three more tables (linking tables)!

/*
 EmployeePosition (a Linking Table)
        EmployeeID: Foreign Key referencing employees Table
        PositionID: Foreign Key referencing positions Table
*/

CREATE TABLE employee_position(
    
    EMPLOYEE_ID VARCHAR (15),
    POSITION_ID INT,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID),
    FOREIGN KEY (POSITION_ID) REFERENCES positions(POSITION_ID)
);







/*
EmployeeDepartments Table (Linking Table):
        EmployeeID (Foreign Key referencing Employees Table)
        DepartmentID (Foreign Key referencing Departments Table)
        StartDate
        EndDate
*/


CREATE TABLE employee_department(

    EMPLOYEE_ID VARCHAR (15),
    DEPARTMENT_ID VARCHAR (15),
    START_DATE DATE,  -- START_DATE & END_DATE used to track the period during which an employee is associated with a particular department
    END_DATE DATE,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID),
    FOREIGN KEY (DEPARTMENT_ID) REFERENCES departments(DEPARTMENT_ID)
    
);







/*
EmployeeManagers Table (Linking Table):
        EmployeeID (Foreign Key referencing Employees Table)
        ManagerID (Foreign Key referencing Employees Table)
*/


CREATE TABLE employee_manager(

    EMPLOYEE_ID VARCHAR (15),
    MANAGER_ID VARCHAR (15),
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES employees(EMPLOYEE_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES employees(EMPLOYEE_ID)
    
);