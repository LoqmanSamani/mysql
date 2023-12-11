USE BankingSystem;


SET SQL_SAFE_UPDATES = 0;





/*

1. Retrieve the names of all customers who have more than one account.

2. Calculate the average balance of all accounts.

3. Update the email address of a specific customer.

4. List the customers who have made transactions in the last month.

5. Find the average age of all customers.

6. Retrieve the latest transaction for each account.

*/






-- Question one:

SELECT * FROM customers;

SELECT CONCAT(FIRST_NAME, " ", LAST_NAME), NUMBER_OF_ACCOUNTS AS CUSTOMER_WITH_MULTIPLE_ACCOUNTS
FROM customers
WHERE NUMBER_OF_ACCOUNTS > 1;








 -- Question two:

 SELECT * FROM balances;

 SELECT AVG(BALANCE_AMOUNT) AS MEAN_BALANCE
 FROM balances;







 -- Question three:

 SELECT * FROM customers;

 UPDATE customers
 SET EMAIL = "samaniloqman91@gmail.com"
 WHERE CONCAT(FIRST_NAME, " ", LAST_NAME) = "John Doe";

 SELECT * FROM customers;







 -- Question four:

 SELECT * FROM transactions;
 SELECT * FROM accounts;
 SELECT * FROM customers;

 SELECT CONCAT(customers.FIRST_NAME, " ", customers.LAST_NAME) AS CUSTOMER_NAME
 FROM customers
 JOIN accounts ON customers.CUSTOMER_ID = accounts.CUSTOMER_ID
 JOIN transactions ON accounts.ACCOUNT_ID = transactions.ACCOUNT_ID
 WHERE transactions.TRANSACTION_DATE > "2022-01-05" AND transactions.TRANSACTION_DATE < "2022-02-05";







 -- Question five:

SELECT * FROM customers;

SELECT AVG(YEAR(CURDATE()) - YEAR(BIRTH_DAY) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(BIRTH_DAY, '%m%d')))
AS AVERAGE_AGE
FROM customers;





-- Question six

SELECT * FROM transactions;


SELECT * FROM transactions
JOIN (
    SELECT ACCOUNT_ID, MAX(TRANSACTION_DATE) AS MAX_DATE
    FROM transactions
    GROUP BY ACCOUNT_ID
) max_dates ON transactions.ACCOUNT_ID = max_dates.ACCOUNT_ID AND transactions.TRANSACTION_DATE = max_dates.MAX_DATE;




