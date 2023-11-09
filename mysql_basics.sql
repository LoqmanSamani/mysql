-- Crete a data base

CREATE DATABASE database_name   -- create a new database.

USE database_name   -- active the database.

DROP database_name   -- delete the created database, in this case database_name.

DROP DATABASE test_database;   -- delete theintire databse without using USE statement.


ALTER DATABASE database_name  READ ONLY = 1;  -- the mood of database is read only and you can not modify it.
ALTER DATABASE database_name READ ONLY = 0;    -- you can modify it.




-- create a table in the data base


CREATE TABLE friends (

   friends_id INT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   hourly_pay DECIMAL(5, 2),
   hire_data DATE

);

SELECT * FROM friends;  -- select the whole table.

RENAME TABLE friends TO coworker;   -- rename a table.

DROP TABLE coworker;   -- delete a table.



-- modify a table

ALTER TABLE coworker
ADD phone_number VARCHAR(15);


-- modify a value or a variable

UPDATE customers
SET first_name = "Loqman"
WHERE customer_id = 1;


-- rename a column from a table

ALTER TABLE coworker
RENAME COLUMN phone_number TO email;


-- modify the variable type in a column of a table

ALTER TABLE coworker
MODIFY COLUMN email VARCHAR(100);


-- change the position of a column in a table

ALTER TABLE coworker
MODIFY email VARCHAR(100)
AFTER last_name;    -- if you want to the column be in the first position just type FIRST;


-- delete a column from a table

ALTER TABLE coworker
DROP COLUMN email;


-- insert a row to a table

INSERT INTO coworker
VALUES (2, "Loqman", "Samani", 30.40, "2022-03-06");


-- insert multiple rows to a table

INSERT INTO coworker

VALUES (3, "Ali", "Irani", 12.49, "2002-04-08"),
       (4, "Salman" , "Badpar", 14, "2001-05-09"),
       (5, "Jaqub", "Samani", 40.50, "2019-09-08"),
       (6, "Reza", "Joshkar", 56.9, "2011-05-06");
       



-- insert rows with missing values  

INSERT INTO coworker (friends_id, first_name, last_name)
VALUES (7, "Diman", "Hossaini");


-- select specific columns from a table

SELECT first_name, last_name
FROM coworker;



-- select a specific row from a table

SELECT * FROM coworker
WHERE friends_id = 2;


SELECT * FROM coworker
WHERE hourly_pay >= 30;


SELECT * FROM coworker
WHERE friends_id != 2;

SELECT * FROM coworker
WHERE hire_date IS NULL;

SELECT * FROM coworker
WHERE hire_date IS NOT NULL;


-- update a column

ET SQL_SAFE_UPDATES = 0;

UPDATE coworker
SET hourly_pay = 20.00
WHERE friends_id = 7;


-- update multiple columns

SET SQL_SAFE_UPDATES = 0;

UPDATE coworker
SET hourly_pay = 20.00,
    hire_date = "2023-08-05"
WHERE friends_id = 7;


SET SQL_SAFE_UPDATES = 0;

UPDATE coworker
SET hourly_pay = null
WHERE friends_id = 2;


UPDATE coworker
SET hire_date = "2001-03-06";   -- update the whole column



-- delete a row

DELETE FROM coworker
WHERE friends_id = 4;


-- auto commit on and off

SET AUTOCOMMIT = OFF;

SET AUTOCOMMIT = ON


-- COMMIT manually

COMMIT;








-- if you delete something in autocommit = off mode, you can undo it

SET AUTOCOMMIT = OFF;  -- set auto safe to off

COMMIT;  -- safe the data

DELETE FROM coworker;   -- delete all points
SELECT * FROM coworker;

ROLLBACK;                 -- go back to the safe point
SELECT * FROM coworker;    -- no the deleted data is restore




--  create a datetime table


USE test_db;  -- first select the database

CREATE TABLE current_date_time (
     my_date DATE,
     my_time TIME,
     date_time DATETIME
);

SELECT * FROM current_date_time;

-- insert current date and time   

INSERT INTO current_date_time
VALUES (
    CURRENT_DATE(),
    CURRENT_TIME(),
    NOW()
);



-- set a column in a table to be uniqie, which is already created

USE test_db;

ALTER TABLE products
ADD CONSTRAINT
UNIQUE (product_name);  

-- you can do the same when you are creating the table

USE test_db;

CREATE TABLE products
VALUES (
    productL_id INT,
    product_name VARCHAR (25) UNIQUE,
    price DECIMAL (5, 2)
);




-- create a column which does not accept null values

CREATE TABLE not_null (
   can_be_null INT,
   cant_be_null DECIMAL (2, 1) NOT NULL
);

INSERT INTO not_null
VALUES (NULL, 1.1),
       (3, 1.3);



-- check the entrance of a column

CREATE TABLE check_table (
   value_to_check DECIMAL(4, 2),
   not_to_check DECIMAL (3, 1),
   CONSTRAINT check_col CHECK (value_to_check >= 10.10)
);


-- modify version

ALTER TABLE check_table

ADD CONSTRAINT check_col CHECK(hourly_pay >= 10.10);

--delete a check statement

ALTER TABLE check_table
DROP CHECK check_col;


-- create a table with a default column

USE test_db;
CREATE TABLE products(
    product_id INT,
    producu_name VARCHAR(50),
    price DECIMAL (4, 2) DEFAULT 0.00
);

-- modify version

ALTER TABLE products
ALTER price SET DEFAULT 0;

-- add new rows

SELECT * FROM products;

INSERT INTO products (product_id, product_name)
VALUES (104, "napkin"),
       (105, "water"),
       (106, "pizza");


-- useful usage of default

USE test_db;

CREATE TABLE transactions(
     trans_id INT,
     amount DECIMAL (5, 2),
     trans_date DATETIME DEFAULT NOW()
);



INSERT INTO transactions (trans_id, amount)
VALUES (201, 22.0),
       (202, 11.23),
       (203, 10),
       (204, 223.56);
       
SELECT * FROM transactions;



-- create a table with primary key

USE test_db;

CREATE TABLE primary_key(
    pri_id INT PRIMARY KEY,
    sec_col DECIMAL (5, 3),
    thi_col VARCHAR (25),
    last_col DATETIME DEFAULT NOW()
);


INSERT INTO primary_key (pri_id, sec_col, thi_col)
VALUES (301, 1.2, "correct"),
       (302, 2.1, "correct"),
       (303, 2.222, "true");
       
       
       
SELECT * FROM primary_key;

-- modify version

ALTER TABLE primary_key
ADD CONSTRAINT
PRIMARY KEY (pri_id);






-- a good example


CREATE TABLE transactions(

    trans_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL (5, 2),
    data_time DATETIME DEFAULT NOW()
);

INSERT INTO transactions (amount)
VALUES (32.22),
       (32.66),
       (20.00),
       (10),
       (22);
       





-- how to connect two tables using foreign key

USE test_db;


CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    date_time DATETIME DEFAULT NOW()
);




-- INNER JOIN (intersection)


-- if we have two tables (transactions & customers):

CREATE TABLE customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);


CREATE TABLE transactions(
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    date_time DATETIME DEFAULT NOW()
);


-- They can be connected using INNER JOIN function:

SELECT * FROM transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;


SELECT * FROM customers
INNER JOIN transactions
ON customers.customer_id = transactions.customer_id;


SELECT transaction_id, first_name, last_name,  amount FROM  transactions
INNER JOIN customers
ON transactions.customer_id = customers.customer_id;



-- LEFT & RIGHT JOIN 

SELECT * FROM transactions
LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;


SELECT * FROM customers
RIGHT JOIN transactions
ON customers.customer_id = transactions.customer_id;


SELECT transaction_id, first_name, last_name,  amount FROM  transactions
LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;





-- functions in mySQL:


SELECT COUNT(amount) FROM transactions; -- Number of rows of amount column in transactions table (it generates a column with the name of "COUNT(amount)")

SELECT COUNT(amount) AS amount_count FROM transactions; -- You can modify the name of the generated column using "AS".

SELECT MAX(amount) FROM transactions;  -- The maximum value in the amount column of the transactions table.

SELECT MIN(amount) FROM transactions; -- The minimum value in the amount column of the transactions table.

SELECT AVG(amount) FROM transactions;  -- Average (mean) of the values in a column.

SELECT SUM(amount) FROM transactions;  -- The sum of all values in a column.

SELECT CONCAT(first_name, " ", last_name) FROM customers AS  full_name;  -- Concatenate two columns in a table, in this case gegerating full_name column from first_name and last_name columns.





-- Logical Operations in mySQL


CREATE TABLE coworker(
    
    coworker_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    job VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATETIME DEFAULT NOW()
    
);

INSERT INTO coworker (first_name, last_name, job, hourly_pay)
VALUES ("Loqman", "Samani", "bioinformatician", 100),
       ("Jaqub", "Badpar", "IT-specialist", 60),
       ("Diman", "Hissaini", "teacher", 40),
       ("Shaida", "Yosefi", "biologist", 70),
       ("Somaye", "Mariwani", "lawyer", 80);
       


SELECT * FROM coworker
WHERE job = "lawyer" AND hire_date > "2023-01-02";  -- Select all lawer which got hired after a specific date(how to use AND statement).


SELECT * FROM coworker
WHERE job = "IT-specialist" OR job = "teacher"; -- How to use OR statement.


SELECT * FROM coworker
WHERE NOT job = "bioinformatician"; -- How to use NOT statement.



SELECT * FROM coworker
WHERE NOT job = "bioinformatician" AND NOT job = "IT-specialist" ; -- How to combine AND & NOT statements.


SELECT * FROM coworker
WHERE hire_date BETWEEN "2022-02-01" AND "2024-08-09";  -- How to use BETWEEN operator.



SELECT * FROM coworker
WHERE job IN ("IT-specialist", "biologist", "doctor");  -- How to use IN operator.





-- Wild card characters

SELECT * FROM coworker
WHERE first_name LIKE "S%";  -- All rows which the first_name  column starts with "S".

SELECT * FROM coworker
WHERE last_name LIKE "%ni"; -- All rows which the last_name  column ends with "ni".


SELECT * FROM coworker
WHERE job LIKE "_eacher";  -- "_" means it can be anything.


SELECT * FROM coworker
WHERE job LIKE "_ea%"; -- combine "_" and "%".






-- Sort

SELECT * FROM coworker
ORDER BY last_name;  -- Sorts the items in the table by last_name in alphabetical order 


SELECT * FROM coworker
ORDER BY last_name; -- The same as previous command, because ASC is default.


SELECT * FROM coworker
ORDER BY first_name DESC;  -- Sorts the items in the table in descending order based on last_name


SELECT * FROM coworker
ORDER BY first_name DESC, last_name ASC; -- Using two columns to sort the data






-- LIMIT clause

SELECT * FROM coworker
LIMIT 3;  -- Limit the number of rows, in this case only the first three rows will be shown.


SELECT * FROM coworker
ORDER BY first_name LIMIT 2;


SELECT * FROM coworker
ORDER BY first_name LIMIT 2, 1; -- The first number (2) is an offset.






-- UNION operator


-- This operation combines both table vertically.
SELECT * FROM transactions
UNION
SELECT * FROM products;


-- This operation combines specific rows from both table vertically.
SELECT transaction_id, amount FROM transactions
UNION
SELECT product_id, price FROM products;






-- SELF JOIN

CREATE TABLE customers(
   
     customer_id INT PRIMARY KEY AUTO_INCREMENT,
     first_name VARCHAR(25),
     last_name VARCHAR(25),
     referral_id INT
);

INSERT INTO customers (fist_name, last_name, referral_id)
VALUES("Loqman", "Samani", NULL),
      ("Ali", "Safai", 1),
      ("Fatah", "Mariwani", 2),
      ("Hadi", "Dastan", 2);



SELECT cu1.customer_id, cu1.first_name, cu1.last_name,
       CONCAT(cu2.first_name, " ", cu2.last_name) AS "referred_by"

FROM customers AS cu1

INNER JOIN customers AS cu2

ON cu1.referral_id = cu2.customer_id;


















