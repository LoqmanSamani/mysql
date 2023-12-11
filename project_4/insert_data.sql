USE BankingSystem;





INSERT INTO customers
VALUES
	('C000000001', 'John', 'Doe', '2022-01-01 08:00:00', 2, '1991-08-23', 'john.doe@email.com', '+1234567890', '123 Main St', 'Regular customer'),
    ('C000000002', 'Alice', 'Smith', '2022-02-15 10:30:00', 1, '1985-08-22', NULL, '+2345678901', '456 Oak St', 'VIP customer'),
    ('C000000003', 'Robert', 'Johnson', '2022-03-10 11:45:00', 3, '1992-11-10', 'robert.johnson@email.com', '+3456789012', '789 Pine St', 'Frequent customer'),
    ('C000000004', 'John', 'Doe', '2022-01-01 08:00:00', 2, '1990-05-15', 'john.doe@email.com', '+1234567890', '123 Main St', 'Regular customer'),
    ('C000000005', 'Alice', 'Smith', '2022-02-15 10:30:00', 1, '1985-08-22', 'alice.smith@email.com', '+2345678901', '456 Oak St', 'VIP customer'),
    ('C000000006', 'John', 'Doe', '2023-01-01 12:00:00', 2, '1990-05-15', 'john.doe@email.com', '123-456-7890', '123 Main St, Cityville', 'Regular customer'),
    ('C000000007', 'Jane', 'Smith', '2023-02-15 10:30:00', 1, '1985-08-22', 'jane.smith@email.com', NULL, '456 Oak St, Townsville', "_");






INSERT INTO accounts
VALUES
    ('ACC000001', 'C000000001', 'Savings', 5000.00, 'Primary account'),
    ('ACC000002', 'C000000001', 'Checking', 1500.50, 'Secondary account'),
    ('ACC000003', 'C000000002', 'Savings', 10000.00, 'Main account'),
    ('ACC000004', 'C000000003', 'Savings', 5000.00, 'Primary account'),
    ('ACC000005', 'C000000004', 'Checking', 1500.00, 'Secondary account'),
    ('ACC000006', 'C000000003', 'Savings', 10000.00, 'Main account'),
    ('ACC000007', 'C000000006', 'Savings', 5000.00, 'Primary account'),
    ('ACC000008', 'C000000007', 'Checking', 1500.00, 'Secondary account'),
    ('ACC000009', 'C000000003', 'Savings', 10000.00, 'Main account');








INSERT INTO balances (BALANCE_ID, ACCOUNT_ID, BALANCE_AMOUNT, DESCRIPTION_)
VALUES
     ('BAL00001', 'ACC000001', 5500.00, 'Current balance after deposit'),
     ('BAL00002', 'ACC000001', 5000.00, 'Current balance after pending withdrawal'),
     ('BAL00003', 'ACC000002', 5000.00, 'Initial balance'),
     ('BAL00004', 'ACC000003', 1500.00, 'Initial balance'),
     ('BAL00005', 'ACC000006', 10000.00, 'Initial balance'),
     ('BAL00006', 'ACC000003', 5000.00, 'Initial balance'),
     ('BAL00007', 'ACC000003', 1500.00, 'Initial balance'),
	 ('BAL00008', 'ACC000005', 10000.00, 'Initial balance');






INSERT INTO transactions
VALUES
    ('T000000001', 'ACC000001', 'Deposit', 'Completed', 1000.00, '2022-01-05 12:30:00', 'Regular deposit'),
    ('T000000002', 'ACC000002', 'Withdrawal', 'Pending', 500.00, '2022-02-10 15:45:00', 'Pending withdrawal request'),
    ('T000000003', 'ACC000001', 'Deposit', 'Completed', 1000.00, '2022-01-05 12:30:00', 'Regular deposit'),
    ('T000000004', 'ACC000002', 'Withdrawal', 'Pending', 500.00, '2022-02-10 15:45:00', 'Pending withdrawal request'),
    ('T000000005', 'ACC000001', 'Deposit', 'Completed', 1000.00, '2023-03-10 14:45:00', 'Initial deposit'),
    ('T000000006', 'ACC000005', 'Withdrawal', 'Pending', 500.50, '2023-03-11 09:30:00', 'Pending withdrawal request');






