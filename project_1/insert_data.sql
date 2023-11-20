-- Insert 10 sets of mock data into the authors-table


-- The first input set
INSERT INTO authors
VALUES(1000, "John", "Smith", "enowned author with a passion for storytelling", "1980-05-15", "American", "www.johnsmith.com");


-- The rest of the sets (the customer_id is automatically incremented so that it does not have to be entered for each set).
INSERT INTO authors(FIRST_NAME, LAST_NAME, BIOGRAPHY, BIRTH_DAY, NATIONALITY, WEBSITE)
VALUES("Emma","Johnson", "Visionary writer exploring various literary genres", "1975-08-22", "British", "www.emmajohnson-writes.com" ),
      ("Michael", "Davis", "Prolific novelist known for captivating plots", "1988-11-10", "Canadian", "www.michaeldavis-author.net"),
	  ("Robert", "Martinez", "Sci-fi enthusiast creating futuristic worlds", "1985-09-05", "Spanish", "www.robertmartinez-author.org"),
      ("Sarah", "White", "Award-winning author of thought-provoking novels", "1972-03-28", "Australian", "www.sarahwhitebooks.com"),
      ("Grace", "Lee", "Poet with a unique perspective on life and love", "1990-12-17", "Korean", "www.gracelee-poetry.com"),
      ("David", "Robinson", "Mystery writer keeping readers on the edge", "1978-06-08", "Irish", "www.davidrobinson-mysteries.com"),
      ("Lisa", "Taylor", "Romantic novelist spreading love through words", "1982-02-14", "Canadian", "www.lisataylor-romance.com"),
      ("Ahmed", "Khan", "Cultural storyteller preserving traditions", "1970-09-30", "Indian", "www.ahmedkhan-culturaltales.org"),
      ("Elena", "Petrov", "Historical fiction writer delving into the past", "1983-07-19", "Russian", "www.elenapetrov-historicals.com");


 -- Check the table
 SELECT * FROM authors;






-- Insert 10 sets of mock data for the books-table.

INSERT INTO books (BOOK_ID, TITLE, ISBN, GENRE, PRICE_IN_DOLLAR, PUBLISHED_DATE, AUTHOR_ID)
VALUES
    ('B001', 'The Enigma of Time', '978-1234567890', 'Science Fiction', 19.99, '2022-04-15', 1000),
    ('B002', 'Whispers in the Wind', '978-2345678901', 'Romance', 14.95, '2021-09-28', 1001),
    ('B003', 'Chronicles of Tomorrow', '978-3456789012', 'Fantasy', 24.99, '2020-12-05', 1007),
    ('B004', 'Echoes of Eternity', '978-4567890123', 'Historical Fiction', 17.50, '2019-07-22', 1008),
    ('B005', 'Shadows of Mystery', '978-5678901234', 'Mystery', 21.99, '2018-03-14', NULL),
    ('B006', 'Love Beyond Words', '978-6789012345', 'Romance', 15.75, '2023-01-08', 1008),
    ('B007', 'Sands of Time', '978-7890123456', 'Adventure', 29.99, '2017-05-30', 1004),
    ('B008', 'Songs of the Soul', '978-8901234567', 'Poetry', 12.50, '2016-11-18', 1006),
    ('B009', 'Cultural Chronicles', '978-9012345678', 'Cultural', 18.95, '2015-06-03', 1009),
    ('B010', 'In the Shadow of Wars', '978-0123456789', 'Historical Fiction', 26.99, '2014-02-19', 1004);


-- Check the table
SELECT * FROM books;






-- Insert 10 sets of mock data for the customers-table

INSERT INTO customers
VALUES
    ('C001', 'Alice', 'Johnson', 'alice@email.com', SHA2('secretpassword', 256), '123 Main St, Cityville', '+5551231001'),
    ('C002', 'Bob', 'Smith', 'bob@email.com', SHA2('secretpassword', 256), '456 Oak St, Townburg', '+5552342002'),
    ('C003', 'Charlie', 'Williams', 'charlie@email.com', SHA2('secretpassword', 256), '789 Pine St, Villagetown', '+5553453003'),
    ('C004', 'David', 'Brown', 'david@email.com', SHA2('secretpassword', 256), '101 Elm St, Hamletville', '+5554564004'),
    ('C005', 'Eva', 'Miller', 'eva@email.com', SHA2('secretpassword', 256), '202 Cedar St, Boroughburg', '+5555675005'),
    ('C006', 'Frank', 'Jones', 'frank@email.com', SHA2('secretpassword', 256), '303 Birch St, Villageburg', '+5556786006'),
    ('C007', 'Grace', 'Davis', 'grace@email.com', SHA2('secretpassword', 256), '404 Maple St, Townville', '+5557897007'),
    ('C008', 'Harry', 'Taylor', 'harry@email.com', SHA2('secretpassword', 256), '505 Walnut St, Cityburg', '+5558908008'),
    ('C009', 'Ivy', 'Wilson', 'ivy@email.com', SHA2('secretpassword', 256), '606 Spruce St, Hamletburg', '+5559019009'),
    ('C010', 'Jack', 'Anderson', 'jack@email.com', SHA2('secretpassword', 256), '707 Oak St, Villagetown', '+5550120001');


-- Check the table
SELECT * FROM customers;





-- Insert 10 sets of mock data for the orders-table

INSERT INTO orders (CUSTOMER_ID, TOTAL_AMOUNT, STATUS_)
VALUES
    ('C001', 150.99, 'Processing'),
    ('C002', 75.50, 'Shipped'),
    ('C003', 100, 'Delivered'),
    ('C004', 120.75, 'Processing'),
    ('C005', 89.99, 'Shipped'),
    ('C006', 300.50, 'Delivered'),
    ('C007', 50.25, 'Processing'),
    ('C008', 180.00, 'Shipped'),
    ('C009', 95.75, 'Delivered'),
    ('C010', 130.99, 'Processing');






 -- Insert 10 sets of mock data for the review-table

INSERT INTO review (BOOK_ID, CUSTOMER_ID, RATING, COMMENT_)
VALUES
    ('B001', 'C001', 5, 'Excellent book! I couldn\'t put it down.'),
    ('B002', 'C002', 4, 'Enjoyed the storyline, but it could have been shorter.'),
    ('B003', 'C003', 5, 'Captivating plot and well-developed characters.'),
    ('B004', NULL , 3, 'Expected more twists and turns.'),
    ('B005', 'C005', 4, 'Solid read. Looking forward to more from this author.'),
    ('B006', 'C006', 5, 'Beautifully written. Highly recommend!'),
    ('B007', 'C007', 2, 'Disappointed. The ending was unsatisfying.'),
    ('B008', 'C008', 4, 'Great book for a weekend escape.'),
    ('B009', NULL, 3, 'Good, but not my favorite genre.'),
    ('B010', 'C010', 5, 'A must-read! Couldn\'t get enough.');




