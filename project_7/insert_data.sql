USE ECommerce;



-- Inserting sample data into the users table
INSERT INTO users (USER_NAME, FIRST_NAME, MIDDLE_NAME, LAST_NAME, PASSCODE, EMAIL, ADDRESS, PHONE_NUMBER, DESCRIPTION_)
VALUES
  ('john_doe', 'John', 'A', 'Doe', 'hashed_password_1', 'john.doe@example.com', '123 Main St, Cityville', '555-1234', 'A regular user.'),
  ('jane_smith', 'Jane', NULL, 'Smith', 'hashed_password_2', 'jane.smith@example.com', '456 Oak St, Townsville', '555-5678', 'Another user.'),
  ('bob_jones', 'Bob', 'B', 'Jones', 'hashed_password_3', 'bob.jones@example.com', '789 Pine St, Villageton', '555-9876', 'Yet another user.'),
  -- Add 7 more entries as needed
  ('user_4', 'User', 'M', 'Four', 'hashed_password_4', 'user4@example.com', '456 Elm St, Hamletville', '555-4321', 'Description for user 4.'),
  ('user_5', 'User', NULL, 'Five', 'hashed_password_5', 'user5@example.com', '789 Birch St, Villageville', '555-8765', 'Description for user 5.'),
  ('user_6', 'User', 'N', 'Six', 'hashed_password_6', 'user6@example.com', '123 Maple St, Townlet', '555-1234', 'Description for user 6.'),
  ('user_7', 'User', 'O', 'Seven', 'hashed_password_7', 'user7@example.com', '456 Pine St, Villageshire', '555-5678', 'Description for user 7.'),
  ('user_8', 'User', 'P', 'Eight', 'hashed_password_8', 'user8@example.com', '789 Oak St, Citytown', '555-9876', 'Description for user 8.'),
  ('user_9', 'User', 'Q', 'Nine', 'hashed_password_9', 'user9@example.com', '123 Birch St, Villagelet', '555-4321', 'Description for user 9.'),
  ('user_10', 'User', 'R', 'Ten', 'hashed_password_10', 'user10@example.com', '456 Maple St, Townville', '555-8765', 'Description for user 10.');



-- Inserting sample data into the categories table
INSERT INTO categories (CATEGORY_NAME, DESCRIPTION_)
VALUES
  ('Electronics', 'Devices and gadgets powered by electronic components.'),
  ('Mobile Phones', 'Smartphones and feature phones for communication.'),
  ('Audio', 'Headphones, speakers, and other audio accessories.'),
  ('Gaming', 'Consoles, games, and accessories for gaming enthusiasts.'),
  ('Cameras', 'Digital cameras and accessories for photography.'),
  ('Wearables', 'Smartwatches and fitness trackers for health and style.'),
  ('Tablets', 'Portable tablets for work and entertainment.'),
  ('Speakers', 'Audio speakers for home and on-the-go use.'),
  ('Fitness', 'Devices to track fitness activities and health metrics.'),
  ('Storage', 'External hard drives and storage solutions for data.');

SELECT * FROM categories;




  -- Inserting sample data into the products table
INSERT INTO products (PRODUCT_NAME, CATEGORY_ID, PRICE_$, STOCK_QUANTITY, DESCRIPTION_)
VALUES
  ('Laptop', 1, 1200, 50, 'High-performance laptop with SSD storage.'),
  ('Smartphone', 2, 500, 100, 'Latest model with dual cameras and large display.'),
  ('Headphones', 3, 80, 200, 'Over-ear headphones with noise cancellation.'),
  ('Gaming Console', 4, 400, 30, 'Next-gen gaming console for immersive gaming.'),
  ('Camera', 5, 600, 20, 'Digital camera with advanced photography features.'),
  ('Smartwatch', 6, 150, 80, 'Fitness tracking and smart features.'),
  ('Tablet', 7, 300, 40, 'Portable tablet for work and entertainment.'),
  ('Wireless Speaker', 8, 50, 150, 'Bluetooth-enabled speaker for wireless audio.'),
  ('Fitness Tracker', 9, 70, 120, 'Track your fitness activities and health metrics.'),
  ('External Hard Drive', 10, 100, 60, 'Expand your storage with a reliable external hard drive.');


  SELECT * FROM products;


  -- Inserting sample data into the product_category table
INSERT INTO product_category (PRODUCT_ID, CATEGORY_ID)
VALUES
  (11, 1),  -- Laptop belongs to Electronics category
  (12, 2),  -- Smartphone belongs to Mobile Phones category
  (13, 3),  -- Headphones belong to Audio category
  (14, 4),  -- Gaming Console belongs to Gaming category
  (15, 5);  -- Camera belongs to Cameras category







-- Inserting sample data into the orders table
INSERT INTO orders (USER_ID, TOTAL_PRICE, STATUS_, DESCRIPTION_)
VALUES
  (1, 150.50, 'Pending', 'Order for electronics accessories'),
  (2, 200.00, 'Shipped', 'Order for clothing items'),
  (3, 75.25, 'Delivered', 'Order for home appliances'),
  (4, 500.80, 'Pending', 'Large order for office supplies'),
  (5, 100.00, 'Shipped', 'Small order for books'),
  (6, 300.45, 'Delivered', 'Order for sports equipment'),
  (7, 50.75, 'Pending', 'Order for gardening tools'),
  (8, 180.20, 'Shipped', 'Order for kitchen appliances'),
  (9, 90.90, 'Delivered', 'Order for pet supplies'),
  (10, 120.30, 'Pending', 'Order for beauty and cosmetics');






-- Inserting sample data into the order_items table
INSERT INTO order_items (ORDER_ID, PRODUCT_ID, QUANTITY, SUB_TOTAL, DESCRIPTION_)
VALUES
  (1, 11, 2, 300.00, 'Two laptops for the office'),
  (2, 13, 1, 80.00, 'One pair of headphones for personal use'),
  (3, 15, 3, 180.00, 'Three cameras for photography club'),
  (4, 12, 5, 250.00, 'Five smartphones for team members'),
  (5, 17, 1, 40.00, 'One tablet for customer'),
  (6, 14, 2, 800.00, 'Two gaming consoles for gaming event'),
  (7, 16, 4, 600.00, 'Four smartwatches for fitness program'),
  (8, 18, 2, 100.00, 'Two wireless speakers for home use'),
  (9, 20, 3, 300.00, 'Three external hard drives for backup');







-- Inserting sample data into the reviews table
INSERT INTO reviews (USER_ID, PRODUCT_ID, RATING, COMMENT_)
VALUES
  (1, 11, 4.5, 'Great laptop, fast and reliable.'),
  (2, 13, 3.0, 'Headphones are decent, but could be better.'),
  (3, 15, 5.0, 'Excellent camera, love the features.'),
  (4, 12, 4.0, 'Smartphone is good, value for money.'),
  (5, 17, 2.5, 'Tablet has some issues, not satisfied.'),
  (6, 14, 4.8, 'Gaming console is amazing, smooth graphics.'),
  (7, 16, 4.2, 'Smartwatch is helpful for fitness tracking.'),
  (8, 18, 3.5, 'Wireless speakers are average, not very loud.'),
  (9, 20, 4.7, 'External hard drive is reliable, good for backups.'),
  (10, 19, 3.0, 'Fitness tracker is okay, but lacks some features.');


