SELECT * FROM departments;  -- Check the departments table before adding values



-- Add some new data to the departments table

INSERT INTO departments (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION, DESCRIPTION_)
VALUES
    ('D001', 'Sales', NULL, 'Office A', 'Responsible for driving sales and revenue.'),
    ('D002', 'Marketing', 'E002', 'Office B', 'Handles marketing campaigns and promotions.'),
    ('D003', 'IT', 'E003', 'Data Center', 'Manages and supports IT infrastructure.'),
    ('D004', 'HR', 'E004', 'Office C', 'Responsible for human resources and employee relations.'),
    ('D005', 'Finance', 'E005', 'Office D', 'Manages financial planning and budgeting.'),
    ('D006', 'Operations', 'E006', 'Warehouse', 'Oversees day-to-day operational activities.'),
    ('D007', 'Customer Support', 'E007', 'Office E', 'Provides customer assistance and support.'),
    ('D008', 'Research and Development', 'E008', 'Lab', 'Focuses on innovation and product development.'),
    ('D009', 'Legal', 'E009', 'Office F', 'Handles legal matters and compliance.'),
    ('D010', 'Quality Assurance', 'E010', 'Testing Center', 'Ensures product quality and standards.');


SELECT * FROM departments;  -- Check the departments table after adding values



SELECT * FROM positions;  


-- Add some new data to the position table

INSERT INTO positions 
VALUES
    (1, 'Software Engineer', 'Develops and maintains software applications.', '60,000 - 80,000'),
    (2, 'Marketing Specialist', 'Executes marketing strategies and campaigns.', '50,000 - 70,000'),
    (3, 'IT Specialist', 'Manages IT systems and provides technical support.', '65,000 - 85,000'),
    (4, 'HR Specialist', 'Handles human resources tasks and employee relations.', '55,000 - 75,000'),
    (5, 'Financial Analyst', 'Analyzes financial data and prepares reports.', '70,000 - 90,000'),
    (6, 'Operations Manager', 'Oversees day-to-day operational activities.', '80,000 - 100,000'),
    (7, 'Customer Support Representative', 'Assists customers with inquiries and issues.', '45,000 - 65,000'),
    (8, 'Research Scientist', 'Conducts research and experiments for development.', '75,000 - 95,000'),
    (9, 'Legal Counsel', 'Provides legal advice and handles legal matters.', '85,000 - 105,000'),
    (10, 'Quality Assurance Analyst', 'Ensures product quality and compliance.', NULL);
    
    
SELECT * FROM positions;

 

SELECT * FROM employees; 


-- Add some new data to the departments table



INSERT INTO employees 
VALUES
    ('E001', 'John', 'Doe', 'john.doe@email.com', '+1234567890', '123 Main St', '1985-03-15', '2020-01-10', 'D001', 1, 75000.00),
    ('E002', 'Alice', 'Smith', 'alice.smith@email.com', '+2345678901', '456 Oak St', '1990-08-22', '2019-05-03', 'D002', 2, 65000.00),
    ('E003', 'Robert', 'Johnson', 'robert.johnson@email.com', NULL, '789 Pine St', '1988-11-10', '2022-03-18', 'D003', 3, 80000.00),
    ('E004', 'Emily', 'Brown', 'emily.brown@email.com', '+4567890123', '101 Elm St', '1995-04-25', '2021-07-01', 'D004', 4, 70000.00),
    ('E005', 'Daniel', 'Miller', 'daniel.miller@email.com', '+5678901234', '202 Cedar St', '1982-09-08', '2023-02-14', 'D005', 5, 90000.00),
    ('E006', 'Olivia', 'Jones', 'olivia.jones@email.com', '+6789012345', '303 Birch St', '1989-12-17', '2020-11-30', 'D006', 6, 95000.00),
    ('E007', 'Michael', 'Davis', 'michael.davis@email.com', '+7890123456', '404 Maple St', '1992-05-30', '2022-09-22', 'D007', 7, 60000.00),
    ('E008', 'Sophia', 'Taylor', 'sophia.taylor@email.com', '+8901234567', '505 Walnut St', NULL, '2021-03-05', 'D008', 8, 85000.00),
    ('E009', 'James', 'Wilson', 'james.wilson@email.com', '+9012345678', '606 Spruce St', '1997-07-22', '2023-08-10', 'D009', 9, 100000.00),
    ('E010', 'Emma', 'Anderson', 'emma.anderson@email.com', '+0123456789', '707 Oak St', '1987-01-10', '2020-06-25', 'D010', 10, 70000.00);







SELECT * FROM employees;




SELECT * FROM employee_position;

INSERT INTO employee_position
VALUES
     ("E010", 9),
     ("E009", 6),
     ("E007", 8),
     ("E005", 5),
     ("E002", 6),
     ("E006", 7),
     ("E001", 3),
     ("E003", 2),
     ("E004", 2),
     ("E008", 2);
     
SELECT * FROM employee_position;





SELECT * FROM employees;





SELECT * FROM employee_department;

INSERT INTO employee_department (EMPLOYEE_ID, DEPARTMENT_ID, START_DATE, END_DATE)
VALUES
    ('E001', 'D001', '2020-01-01', NULL), 
    ('E002', 'D002', '2019-05-03', NULL), 
    ('E003', 'D003', '2022-01-15', NULL),
    ("E004", "D004", "2019-05-02", "2023-04-02"),
	('E006', 'D006', '2020-01-01', NULL), 
    ('E005', 'D005', '2019-05-03', NULL), 
    ('E007', 'D007', '2022-01-15', NULL),
    ("E008", "D008", "2019-05-02", "2023-04-02"),
    ('E009', 'D009', '2022-01-15', NULL),
    ("E010", "D010", "2019-05-02", "2023-04-02");
  

     
SELECT * FROM employee_department;




SELECT * FROM employee_manager;

INSERT INTO employee_manager
VALUES
    ('E001', 'E001'), 
    ('E002', 'E002'), 
    ('E003', 'E003');
   
  

     
SELECT * FROM employee_manager;
