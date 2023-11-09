
# Crete a data base

CREATE DATABASE database_name  # create a new database.

USE database_name  # active the database.

DROP database_name   # delete the created database, in this case database_name.

DROP DATABASE test_database;   # delete theintire databse without using USE statement.


ALTER DATABASE database_name  READ ONLY = 1;  # the mood of database is read only and you can not modify it.
ALTER DATABASE database_name READ ONLY = 0;    # you can modify it.




# create a table in the data base


CREATE TABLE friends (

   friends_id INT,
   first_name VARCHAR(50),
   last_name VARCHAR(50),
   hourly_pay DECIMAL(5, 2),
   hire_data DATE

);

SELECT * FROM friends;  # select the whole table.

RENAME TABLE friends TO coworker;   # rename a table.

DROP TABLE coworker;   # delete a table.



# modify a table

ALTER TABLE coworker
ADD phone_number VARCHAR(15);


# rename a column from a table

ALTER TABLE coworker
RENAME COLUMN phone_number TO email;


# modify the variable type in a column of a table

ALTER TABLE coworker
MODIFY COLUMN email VARCHAR(100);


# change the position of a column in a table

ALTER TABLE coworker
MODIFY email VARCHAR(100)
AFTER last_name; # if you want to the column be in the first position just type FIRST;


# delete a column from a table

ALTER TABLE coworker
DROP COLUMN email;


# insert a row to a table

INSERT INTO coworker
VALUES (2, "Loqman", "Samani", 30.40, "2022-03-06");


# insert multiple rows to a table

INSERT INTO coworker

VALUES (3, "Ali", "Irani", 12.49, "2002-04-08"),
       (4, "Salman" , "Badpar", 14, "2001-05-09"),
       (5, "Jaqub", "Samani", 40.50, "2019-09-08"),
       (6, "Reza", "Joshkar", 56.9, "2011-05-06");
       



# insert rows with missing values  

INSERT INTO coworker (friends_id, first_name, last_name)
VALUES (7, "Diman", "Hossaini");


# select specific columns from a table

SELECT first_name, last_name
FROM coworker;



# select a specific column from a table

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


# update a column

ET SQL_SAFE_UPDATES = 0;

UPDATE coworker
SET hourly_pay = 20.00
WHERE friends_id = 7;


# update multiple columns

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
SET hire_date = "2001-03-06";   # update the whole column



# delete a row

DELETE FROM coworker
WHERE friends_id = 4;


# auto commit on and off

SET AUTOCOMMIT = OFF;

SET AUTOCOMMIT = ON


# COMMIT manually

COMMIT;








# if you delete something in autocommit = off mode, you can undo it

SET AUTOCOMMIT = OFF;  # set auto safe to off

COMMIT;  # safe the data

DELETE FROM coworker;   # delete all points
SELECT * FROM coworker;

ROLLBACK;                 # go back to the safe point
SELECT * FROM coworker;    # no the deleted data is restore




#  create a datetime table


USE test_db;  # first select the database

CREATE TABLE current_date_time (
     my_date DATE,
     my_time TIME,
     date_time DATETIME
);

SELECT * FROM current_date_time;

# insert current date and time   

INSERT INTO current_date_time
VALUES (
    CURRENT_DATE(),
    CURRENT_TIME(),
    NOW()
);



# set a column in a table to be uniqie, which is already created

USE test_db;

ALTER TABLE products
ADD CONSTRAINT
UNIQUE (product_name);  

# you can do the same when you are creating the table

USE test_db;

CREATE TABLE products
VALUES (
    productL_id INT,
    product_name VARCHAR (25) UNIQUE,
    price DECIMAL (5, 2)
);




# create a column which does not accept null values

CREATE TABLE not_null (
   can_be_null INT,
   cant_be_null DECIMAL (2, 1) NOT NULL
);

INSERT INTO not_null
VALUES (NULL, 1.1),
       (3, 1.3);



# check the entrance of a column

CREATE TABLE check_table (
   value_to_check DECIMAL(4, 2),
   not_to_check DECIMAL (3, 1),
   CONSTRAINT check_col CHECK (value_to_check >= 10.10)
);


# modify version

ALTER TABLE check_table

ADD CONSTRAINT check_col CHECK(hourly_pay >= 10.10);

# delete a check statement

ALTER TABLE check_table
DROP CHECK check_col;


# create a table with a default column

USE test_db;
CREATE TABLE products(
    product_id INT,
    producu_name VARCHAR(50),
    price DECIMAL (4, 2) DEFAULT 0.00
);

# modify version

ALTER TABLE products
ALTER price SET DEFAULT 0;

# add new rows

SELECT * FROM products;

INSERT INTO products (product_id, product_name)
VALUES (104, "napkin"),
       (105, "water"),
       (106, "pizza");


# useful usage of default

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



# create a table with primary key

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

# modify version
ALTER TABLE primary_key
ADD CONSTRAINT
PRIMARY KEY (pri_id);






