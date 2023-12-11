CREATE DATABASE BankingSystem;

USE BankingSystem;




/*

Customers Table:

    CustomerID (Primary Key)
    FirstName
    LastName
    Email
    PhoneNumber
    Address

*/


CREATE TABLE customers(

    CUSTOMER_ID VARCHAR(15) NOT NULL,
    FIRST_NAME VARCHAR (50),
    LAST_NAME VARCHAR (50),
    BIRTH_DAY DATE,
    ACCOUNT_CREATION_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    EMAIL VARCHAR (50) DEFAULT NULL,
    PHONE_NUMBER VARCHAR (15) DEFAULT NULL,
    ADDRESS VARCHAR (200),
    PRIMARY KEY (CUSTOMER_ID)

);



SELECT * FROM customers;




-- modify customers table

ALTER TABLE customers
RENAME COLUMN ACCOUNT_CREATION_DATE TO CUSTOMER_SINCE;


ALTER TABLE customers
ADD NUMBER_OF_ACCOUNTS INT DEFAULT 1;


SELECT * FROM customers;


ALTER TABLE customers
ADD DESCRIPTION_ VARCHAR (200);


ALTER TABLE customers
MODIFY CUSTOMER_SINCE DATETIME DEFAULT CURRENT_TIMESTAMP
AFTER LAST_NAME;


SELECT * FROM customers;


ALTER TABLE customers
MODIFY NUMBER_OF_ACCOUNTS INT DEFAULT 1
AFTER CUSTOMER_SINCE;


SELECT * FROM customers;

/*

the customers table after modifications:

CREATE TABLE `customers` (
  `CUSTOMER_ID` varchar(15) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `CUSTOMER_SINCE` datetime DEFAULT CURRENT_TIMESTAMP,
  `NUMBER_OF_ACCOUNTS` int DEFAULT '1',
  `BIRTH_DAY` date DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(15) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `DESCRIPTION_` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CUSTOMER_ID`)
)

*/




/*

Accounts Table:

    AccountID (Primary Key)
    CustomerID (Foreign Key referencing Customers Table)
    AccountType (e.g., Savings, Checking)
    Balance

*/

CREATE TABLE accounts(

    ACCOUNT_ID VARCHAR (15) NOT NULL,
    CUSTOMER_ID VARCHAR (15) DEFAULT NULL,
    ACCOUNT_TYPE VARCHAR (15) DEFAULT NULL,
    BALANCE DECIMAL (12, 2) DEFAULT NULL,
    CONSIDERATION VARCHAR (200) DEFAULT "_",
    PRIMARY KEY (ACCOUNT_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES customers (CUSTOMER_ID)

);

SELECT * FROM accounts;







/*

Transactions Table:

    TransactionID (Primary Key)
    AccountID (Foreign Key referencing Accounts Table)
    TransactionType (e.g., Deposit, Withdrawal)
    Amount
    TransactionDate

*/


CREATE TABLE transactions(

    TRANSACTION_ID VARCHAR (15) PRIMARY KEY,
    ACCOUNT_ID VARCHAR (15),
    TRANSACTION_TYPE VARCHAR (15),
    AMOUNT DECIMAL (12, 2),
    TRANSACTION_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    DESCRIPTION_ VARCHAR (200)

);


SELECT * FROM transactions;


-- modify transactions table

ALTER TABLE transactions
ADD COLUMN TRANSACTION_STATUS VARCHAR (15) DEFAULT "Pending"
AFTER TRANSACTION_TYPE;


SELECT * FROM transactions;

/*

the transactions table after modifications:

CREATE TABLE `transactions` (
  `TRANSACTION_ID` varchar(15) NOT NULL,
  `ACCOUNT_ID` varchar(15) DEFAULT NULL,
  `TRANSACTION_TYPE` varchar(15) DEFAULT NULL,
  `TRANSACTION_STATUS` varchar(15) DEFAULT 'Pending',
  `AMOUNT` decimal(12,2) DEFAULT NULL,
  `TRANSACTION_DATE` datetime DEFAULT CURRENT_TIMESTAMP,
  `DESCRIPTION_` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TRANSACTION_ID`)
)

*/




/*

Balances Table:

    BalanceID (Primary Key)
    AccountID (Foreign Key referencing Accounts Table)
    BalanceAmount
    BalanceDate

*/



CREATE TABLE balances(

    BALANCE_ID VARCHAR (15) NOT NULL,
    ACCOUNT_ID VARCHAR (15),
    BALANCE_AMOUNT DECIMAL (12, 2),
    BALANCE_DATE DATETIME DEFAULT CURRENT_TIMESTAMP,
    DESCRIPTION_ VARCHAR (200) DEFAULT "_",
    PRIMARY KEY (BALANCE_ID),
    FOREIGN KEY (ACCOUNT_ID) REFERENCES accounts(ACCOUNT_ID)
);


