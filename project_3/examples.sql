USE InventoryManagementSystem;






-- 1.  Retrieve the names and quantities in stock of products with a unit price greater than $50.

SELECT * FROM product;

SELECT PRODUCT_NAME, QUANTITY_IN_STOCK FROM product
WHERE UNIT_PRICE > 50.00;

SELECT c.FIRST_NAME, c.LAST_NAME, p.PRODUCT_NAME
FROM customer c
JOIN sale s ON c.CUSTOMER_ID = s.CUSTOMER_ID
JOIN product p ON s.PRODUCT_ID = p.PRODUCT_ID;







-- 2. List the names of customers who made a purchase along with the product names they bought.

SELECT * FROM customer;
SELECT * FROM product;
SELECT * FROM sale;

SELECT CONCAT(customer.FIRST_NAME, " ", customer.LAST_NAME)
AS CUSTOMER_FULL_NAME, product.PRODUCT_NAME
FROM customer
JOIN sale ON customer.CUSTOMER_ID = sale.CUSTOMER_ID
JOIN product ON sale.PRODUCT_ID = product.PRODUCT_ID;








-- 3. Calculate the total sales amount for each product category.

SELECT * FROM category;
SELECT * FROM product;
SELECT * FROM sale;

SELECT category.CATEGORY_NAME, SUM(sale.TOTAL_AMOUNT) AS TOTAL_SALES_AMOUNT
FROM category
JOIN product ON product.CATEGORY_ID = category.CATEGORY_ID
JOIN sale ON product.PRODUCT_ID = sale.PRODUCT_ID
GROUP BY category.CATEGORY_ID, category.CATEGORY_NAME;







-- 4. Add a new product to the 'Electronics' category with a quantity of 10, unit price of $499.99, and a brief description.

SELECT * FROM category;
SELECT * FROM product;

INSERT INTO product (PRODUCT_ID, CATEGORY_ID, QUANTITY_IN_STOCK, UNIT_PRICE, DESCRIPTION_)
VALUES ("P000000011", 100, 10, 499.99, " the new product!!!" );

SELECT * FROM product;







-- 5. Increase the quantity in stock of the 'Smartphone' product by 5 units.

SELECT * FROM product;

UPDATE product
SET QUANTITY_IN_STOCK = QUANTITY_IN_STOCK + 5
WHERE PRODUCT_ID = "P000000001";






-- 6. Remove the 'Clothing' category from the database, and update the products in that category to a new category.

SELECT * FROM category;

UPDATE category
SET CATEGORY_NAME = "Clothes"
WHERE CATEGORY_ID = 101;






SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS CUSTOMER_NAME, s.TOTAL_AMOUNT
FROM customer c
JOIN sale s ON c.CUSTOMER_ID = s.CUSTOMER_ID
ORDER BY s.TOTAL_AMOUNT DESC
LIMIT 1;





-- 7. Find the customer who spent the most in a single transaction.

SELECT * FROM customer;
SELECT * FROM sale;

SELECT CONCAT(c.FIRST_NAME, " ", c.LAST_NAME) AS CUSTOMER_NAME, s.TOTAL_AMOUNT 
FROM customer AS c
JOIN sale AS s ON c.CUSTOMER_ID = s.CUSTOMER_ID
ORDER BY s.TOTAL_AMOUNT DESC
LIMIT 1;




