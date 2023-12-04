CREATE DATABASE InventoryManagementSystem;

USE InventoryManagementSystem;





-- create a primary catrgory table

CREATE TABLE category(

    CATEGORY_ID INT PRIMARY KEY AUTO_INCREMENT

);


-- create a primary supply table

CREATE TABLE supplier(

    SUPPLIER_ID INT PRIMARY KEY AUTO_INCREMENT

);






/*
Products Table:

    ProductID: Primary Key, unique identifier for each product.
    ProductName: Name of the product.
    CategoryID: Foreign Key, referencing the Categories Table, indicating the category to which the product belongs.
    SupplierID: Foreign Key, referencing the Suppliers Table, identifying the supplier of the product.
    QuantityInStock: The current quantity of the product in stock.
    UnitPrice: The price per unit of the product.
    Description: A brief description of the product.
*/



CREATE TABLE product(

    PRODUCT_ID VARCHAR (10) PRIMARY KEY,
    PRODUCT_NAME VARCHAR (50),
    CATEGORY_ID INT,
    SUPPLIER_ID INT,
    QUANTITY_IN_STOCK INT,
    UNIT_PRICE DECIMAL (10, 2),
    DESCRIPTION_ VARCHAR (2000),
    FOREIGN KEY (CATEGORY_ID) REFERENCES category(CATEGORY_ID),
    FOREIGN KEY (SUPPLIER_ID) REFERENCES supplier(SUPPLIER_ID)

);


SELECT * FROM product;


/*

Category Table:

    CategoryID: Primary Key, unique identifier for each category.
    CategoryName: Name of the category.
    CategoryDescription: a brief descriprion about the category.
    NumberOfProduct: How many products are in this category.

*/


--  modify the category table

ALTER TABLE category
ADD CATEGORY_NAME VARCHAR (50),
ADD NUMBER_OF_PRODUCT INT, 
ADD DESCRIPTION_ VARCHAR (2000);




/*

Supplier Table:

    SupplierID: Primary Key, unique identifier for each supplier.
    SupplierName: Name of the supplier.
    ContactPerson: The person to contact at the supplier's end.
    ContactNumber: Contact number for the supplier.
    Email: Email address for communication.

*/


-- modify the supplier table

ALTER TABLE supplier
ADD SUPPLIER_NAME VARCHAR (50),
ADD CONTACT_PERSON VARCHAR (50),
ADD CONTACT_NUMBER VARCHAR (15),
ADD EMAIL VARCHAR (30);



/*

Sales Table:

    SaleID: Primary Key, unique identifier for each sale transaction.
    ProductID: Foreign Key, referencing the Products Table, specifying the product sold.
    QuantitySold: The quantity of the product sold in the transaction.
    TotalAmount: The total amount for the sale transaction.
    SaleDate: The date and time when the sale occurred.

*/ 

CREATE TABLE sale(

    SALE_ID INT PRIMARY KEY AUTO_INCREMENT,
    PRODUCT_ID VARCHAR(10),
    QUANTITY_SOLD INT,
    TOTAL_AMOUNT INT,
    SALE_DATE DATETIME DEFAULT NOW()

);


-- the product id in the sale table must be a foreign key

ALTER TABLE sale
ADD CONSTRAINT fk_sale_product
FOREIGN KEY (PRODUCT_ID) REFERENCES product(PRODUCT_ID);

SELECT * FROM sale;




-- add a description column to the product table

SELECT * FROM product;


CREATE TABLE customer(

    CUSTOMER_ID INT PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME VARCHAR (50),
    LAST_NAME VARCHAR (50),
    PHONE_NUMBER VARCHAR (15),
    EMAIL VARCHAR (30),
    ADDRESS VARCHAR (200)

);





-- add a customer_id column to the sale table

ALTER TABLE sale
ADD CUSTOMER_ID INT,
ADD CONSTRAINT fk_sale_customer
FOREIGN KEY (CUSTOMER_ID) REFERENCES customer(CUSTOMER_ID);