CREATE DATABASE OnlineBookStore;  -- Create the data base

USE OnlineBookStore;




-- Create the authors-table

CREATE TABLE authors(

    AUTHOR_ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR (100),
    LAST_NAME VARCHAR (100),
    BIOGRAPHY VARCHAR (2000),
    BIRTH_DAY DATE,
    NATIONALITY VARCHAR (50),
    WEBSITE VARCHAR (255)

);




-- Create books-table

CREATE TABLE books(

    BOOK_ID VARCHAR (25) PRIMARY KEY,
    TITLE VARCHAR (255) NOT NULL,
    ISBN VARCHAR (25),
    GENRE VARCHAR (50),
    PRICE_IN_DOLLAR DECIMAL (8, 2),
    PUBLISHED_DATE DATE,
    AUTHOR_ID INT,
    FOREIGN KEY (AUTHOR_ID) REFERENCES authors(AUTHOR_ID),
    ADDED_DATE DATETIME DEFAULT NOW()

);




-- Create the customers-table

  CREATE TABLE customers(
    CUSTOMER_ID VARCHAR(15) PRIMARY KEY,
    FIRST_NAME VARCHAR(100),
    LAST_NAME VARCHAR(100),
    EMAIL VARCHAR(50),
    PASSCODE VARCHAR(100),  -- It should be hashed during storage process
    ADDRESS VARCHAR(200),
    PHONE_NUMBER VARCHAR(15)
);





/*
An example in which the input password is hashed:
INSERT INTO customers (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PASSWORD_HASH, ADDRESS, PHONE_NUMBER)
VALUES (
        '123',
        'John',
        'Doe',
        'john.doe@example.com',
        SHA2('secretpassword', 256),
        '123 Main St',
        5551234567
        );

*/





-- Create the orders-table

CREATE TABLE orders(

    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID VARCHAR (15),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES customers (CUSTOMER_ID),
    ORDER_DATE DATETIME DEFAULT NOW(),
    TOTAL_AMOUNT DECIMAL (8, 2),
    STATUS_ VARCHAR (15)

);






-- Create review-table

CREATE TABLE review(
    REVIEW_ID INT PRIMARY KEY AUTO_INCREMENT,
    BOOK_ID VARCHAR(25),
    CUSTOMER_ID VARCHAR(15),
    RATING TINYINT,
    COMMENT_ VARCHAR(5000),
    REVIEW_DATE DATETIME DEFAULT NOW(),

    FOREIGN KEY (BOOK_ID) REFERENCES books(BOOK_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES customers(CUSTOMER_ID)
);


