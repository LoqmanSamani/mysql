USE EmployeeManagementSystem; -- Activates the database


SHOW TABLES; -- Shows all the tables in the database


SELECT * FROM employees;



-- Changes the position of the salary column 
ALTER TABLE employees
MODIFY SALARY DECIMAL(8, 2)
AFTER LAST_NAME;

SELECT * FROM employees;





-- Deletes the hire-date column
ALTER TABLE employees
DROP COLUMN HIRE_DATE;

SELECT * FROM employees;
SELECT * FROM departments;





-- Count the number of employees in each department

SELECT d.DEPARTMENT_NAME, COUNT(e.EMPLOYEE_ID) AS EMPLOYEE_COUNT
FROM departments AS d
LEFT JOIN employees AS e ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_NAME;




SELECT * FROM employees;





-- Find employees who are above 50 (born before 1973)
SELECT FIRST_NAME, LAST_NAME FROM employees
WHERE BIRTH_DAY < "1973-01-01";







-- find the latest 5 hired employees

SELECT FIRST_NAME, LAST_NAME FROM employees
ORDER BY HIRE_DATE DESC LIMIT 5;


SELECT * FROM employees;
SELECT * FROM employee_manager;






-- Calculate the average salary of all employees 

SELECT ROUND(AVG(SALARY), 2) AS AVERGE_SALARY FROM employees;







-- Find employees who are managers

SELECT CONCAT(e.FIRST_NAME, " ", e.LAST_NAME) AS FULL_NAME,  m.MANAGER_ID FROM employees AS e
JOIN employee_manager m ON e.EMPLOYEE_ID = m.EMPLOYEE_ID;







-- Retrieve employees and their corresponding positions
SELECT * FROM positions;
SELECT * FROM employees;

SELECT CONCAT(employees.FIRST_NAME, " ", employees.LAST_NAME) AS FULL_NAME, positions.POSITION_NAME
FROM employees 
LEFT JOIN positions ON positions.POSITION_ID = employees.POSITION_ID;






-- List all positions
SELECT DISTINCT POSITION_NAME AS ALL_POSITIONS FROM positions;






-- Find employees who have a salary greater than $80,000
SELECT * FROM employees
WHERE SALARY > 80000;







-- Retrieve department information along with the names of the managers

SELECT departments.*, CONCAT(employees.FIRST_NAME, " ", employees.LAST_NAME) AS DEPARTMENT_MANAGER FROM departments
LEFT JOIN employees ON departments.MANAGER_ID = employees.EMPLOYEE_ID; 

