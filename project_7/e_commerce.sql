CREATE DATABASE ECommerce;


USE ECommerce;




/*

Users Table:

    user_id (Primary Key)
    username
    first name
    middle name
    last name
    password
    email
    full_name
    address
    phone_number
    description

*/



CREATE TABLE users(

  USER_ID INT AUTO_INCREMENT,
  USER_NAME VARCHAR (25) NOT NULL UNIQUE,
  FIRST_NAME VARCHAR (50) NOT NULL,
  MIDDLE_NAME VARCHAR (50),
  LAST_NAME VARCHAR (50) NOT NULL,
  PASSCODE VARCHAR (200) NOT NULL, -- should be hashed during the insert process
  EMAIL VARCHAR (50) NOT NULL,
  ADDRESS VARCHAR (500) NOT NULL,
  PHONE_NUMBER VARCHAR (15),
  DESCRIPTION_ VARCHAR (1000),
  PRIMARY KEY (USER_ID)

);




/*

Categories Table:

    category_id (Primary Key)
    category_name

*/


CREATE TABLE categories(

  CATEGORY_ID INT AUTO_INCREMENT,
  CATEGORY_NAME VARCHAR (50),
  PRIMARY KEY (CATEGORY_ID)

);



-- Modify categories table
ALTER TABLE categories
ADD COLUMN DESCRIPTION_ VARCHAR (2000);







/*

Products Table:

    product_id (Primary Key)
    product_name
    product category
    price
    stock quantity
    description

*/


CREATE TABLE products(

  PRODUCT_ID INT AUTO_INCREMENT,
  PRODUCT_NAME VARCHAR (50) NOT NULL,
  CATEGORY VARCHAR (50) NOT NULL,
  PRICE_$ INT NOT NULL,
  STOCK_QUANTITY INT,
  DESCRIPTION_ VARCHAR (1000),
  PRIMARY KEY (PRODUCT_ID)

);




-- Modify products table
ALTER TABLE products
RENAME COLUMN CATEGORY TO CATEGORY_ID;

ALTER TABLE products
MODIFY CATEGORY_ID INT;

ALTER TABLE products
ADD CONSTRAINT product_ibfk
FOREIGN KEY (CATEGORY_ID)
REFERENCES categories (CATEGORY_ID);






/*

ProductCategories Table (Associative table to represent many-to-many relationship):

    product_id (Foreign Key referencing Products table)
    category_id (Foreign Key referencing Categories table)

*/



CREATE TABLE product_category(

  PRODUCT_ID INT,
  CATEGORY_ID INT,
  FOREIGN KEY (PRODUCT_ID)
  REFERENCES products (PRODUCT_ID),
  FOREIGN KEY (CATEGORY_ID)
  REFERENCES categories (CATEGORY_ID)

);






/*

Orders Table:

    order_id (Primary Key)
    user_id (Foreign Key referencing Users table)
    order_date
    total_price
    status (e.g., pending, shipped, delivered)
    description

*/


CREATE TABLE orders(

  ORDER_ID INT AUTO_INCREMENT,
  USER_ID INT,
  ORDER_DATE DATETIME DEFAULT NOW(),
  TOTAL_PRICE DECIMAL (10, 2) NOT NULL,
  STATUS_ VARCHAR (25) DEFAULT "_",
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (ORDER_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID)

);







/*

OrderItems Table (Associative table to represent items within an order):

    order_id (Foreign Key referencing Orders table)
    product_id (Foreign Key referencing Products table)
    quantity
    subtotal

*/


CREATE TABLE oreder_items (

  ORDER_ID INT,
  PRODUCT_ID INT,
  QUANTITY INT,
  SUB_TOTAL DECIMAL (10, 2),
  FOREIGN KEY (ORDER_ID)
  REFERENCES orders (ORDER_ID),
  FOREIGN KEY (PRODUCT_ID)
  REFERENCES products (PRODUCT_ID)

);




-- Modify order_items table

RENAME TABLE oreder_items TO order_items;

ALTER TABLE order_items
ADD COLUMN DESCRIPTION_ VARCHAR (1000);







/*

Reviews Table:

    review_id (Primary Key)
    user_id (Foreign Key referencing Users table)
    product_id (Foreign Key referencing Products table)
    rating
    comment
    review_date

*/


CREATE TABLE reviews(

  REVIEW_ID INT AUTO_INCREMENT,
  USER_ID INT,
  PRODUCT_ID INT,
  RATING VARCHAR (25),
  COMMENT_ VARCHAR (2000),
  REVIEW_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (REVIEW_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID),
  FOREIGN KEY (PRODUCT_ID)
  REFERENCES products (PRODUCT_ID)

);




-- Modify reviews table
ALTER TABLE reviews
MODIFY COLUMN RATING DECIMAL (5, 2);



