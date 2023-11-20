USE OnlineBookStore; -- Activate the data-base


SELECT * FROM authors;



-- modify a value or some values in one of the tables

UPDATE authors
SET FIRST_NAME = "Bachtyar", LAST_NAME = "Ali", NATIONALITY = "Kurdish"
WHERE author_id = 1000;

SELECT * FROM authors;





-- rename a column from a table

SELECT * FROM orders;

ALTER TABLE orders
RENAME COLUMN TOTAL_AMOUNT TO AMOUNT;

SELECT * FROM orders;





-- change the position of a column in a table

SELECT * FROM review;

ALTER TABLE review
MODIFY RATING TINYINT
AFTER REVIEW_DATE;

SELECT * FROM review;




-- select specific columns from a table

SELECT FIRST_NAME, LAST_NAME
FROM customers;




-- select a specific row from a table

SELECT * FROM orders;

SELECT * FROM orders
WHERE ORDER_ID = 5;




-- Add a new column BOOK_ID to the orders table with a foreign key constraint
ALTER TABLE orders
ADD COLUMN BOOK_ID VARCHAR(25),
ADD CONSTRAINT FK_orders_books FOREIGN KEY (BOOK_ID) REFERENCES books(BOOK_ID);

INSERT INTO orders (BOOK_ID)
VALUES ("B001"),("B003"),("B009"),("B004"),("B008"),("B004"),("B005"),("B008"),("B001"),("B008");




-- Example: Recommend books to a customer based on their purchase history

SELECT b.TITLE
FROM books b
JOIN orders o ON b.BOOK_ID = o.BOOK_ID
JOIN customers c ON o.CUSTOMER_ID = c.CUSTOMER_ID
WHERE c.CUSTOMER_ID = 'C001'
ORDER BY o.ORDER_DATE DESC
LIMIT 5;




-- Example: List bestselling authors based on total book sales

SELECT a.AUTHOR_ID, a.FIRST_NAME, a.LAST_NAME, SUM(b.PRICE_IN_DOLLAR) AS TOTAL_SALES
FROM authors a
JOIN books b ON a.AUTHOR_ID = b.AUTHOR_ID
JOIN orders o ON b.BOOK_ID = o.BOOK_ID
GROUP BY a.AUTHOR_ID
ORDER BY TOTAL_SALES DESC
LIMIT 5;