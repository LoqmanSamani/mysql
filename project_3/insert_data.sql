USE InventoryManagementSystem; -- active the data base



-- first enter the first row 
INSERT INTO category
VALUES (100,'Electronics', 150, 'Electronic devices and accessories'); 





 
-- Enter the next rows, because the category_id is entered automatically, there is no need to define it.
INSERT INTO category (CATEGORY_NAME, NUMBER_OF_PRODUCT, DESCRIPTION_)
VALUES
  ('Clothing', 200, 'Fashionable apparel for all ages'),
  ('Home and Garden', 100, 'Furniture, decor, and gardening supplies'),
  ('Books', 75, 'Wide range of books for all genres'),
  ('Sports and Outdoors', 120, 'Equipment and gear for various sports'),
  ('Toys', 50, 'Fun and educational toys for kids'),
  ('Beauty', 80, 'Cosmetics and skincare products'),
  ('Automotive', 90, 'Car parts and accessories'),
  ('Music Instruments', 40, 'Instruments for musicians'),
  ('Pet Supplies', 60, 'Supplies for pets and pet owners');
  
  
  SELECT * FROM category;
  
  





-- enter 10 rows of data into customer table

INSERT INTO customer (FIRST_NAME, LAST_NAME, PHONE_NUMBER, EMAIL, ADDRESS)
VALUES
  ('John', 'Doe', '+1234567890', 'john.doe@email.com', '123 Main St'),
  ('Alice', 'Smith', NULL, 'alice.smith@email.com', '456 Oak St'),
  ('Robert', 'Johnson', '+3456789012', NULL, '789 Pine St'),
  ('Emily', 'Brown', '+4567890123', 'emily.brown@email.com', '101 Elm St'),
  ('Daniel', 'Miller', '+5678901234', 'daniel.miller@email.com', '202 Cedar St'),
  ('Olivia', 'Jones', '+6789012345', 'olivia.jones@email.com', '303 Birch St'),
  ('Michael', 'Davis', '+7890123456', 'michael.davis@email.com', '404 Maple St'),
  ('Sophia', 'Taylor', NULL, 'sophia.taylor@email.com', '505 Walnut St'),
  ('James', 'Wilson', '+9012345678', 'james.wilson@email.com', '606 Spruce St'),
  ('Emma', 'Anderson', '+0123456789', NULL, NULL);
  
  
  SELECT * FROM customer;
  
  
  
 
-- enter the first row 
INSERT INTO supplier
VALUES (1000, 'TechCorp', 'John Tech', '+9876543210', 'info@techcorp.com');



-- enter the rest of the input information
INSERT INTO supplier (SUPPLIER_NAME, CONTACT_PERSON, CONTACT_NUMBER, EMAIL)
VALUES
  
  ('FashionHub', 'Alice Fashion', '+8765432109', 'info@fashionhub.com'),
  ('FurnitureMasters', 'Robert Furniture', '+7654321098', 'info@furnituremasters.com'),
  ('BookWonders', 'Emily Books', '+6543210987', 'info@bookwonders.com'),
  ('SportsGear', 'Daniel Sports', '+5432109876', 'info@sportsgear.com'),
  ('ToyWorld', 'Olivia Toys', '+4321098765', 'info@toyworld.com'),
  ('BeautyEmpire', 'Michael Beauty', '+3210987654', 'info@beautyempire.com'),
  ('AutoParts', 'Sophia Auto', '+2109876543', 'info@autoparts.com'),
  ('MusicHarbor', 'James Music', '+1098765432', 'info@musicharbor.com'),
  ('PetCare', 'Emma Pets', '+0987654321', 'info@petcare.com');
  
  
  
  SELECT * FROM supplier;






INSERT INTO product
VALUES
  ('P000000001', 'Smartphone', 100, 1000, 50, 599.99, 'Latest model with advanced features'),
  ('P000000002', 'T-Shirt', 101, 1002, 100, 19.99, 'Comfortable cotton T-shirt'),
  ('P000000003', 'Coffee Table', 102, 1003, 20, 129.99, 'Modern design for your living room'),
  ('P000000004', 'Science Fiction Book', 103, 1000, 30, 12.99, 'Classic sci-fi novels collection'),
  ('P000000005', 'Soccer Ball', 109, 1000, 40, 24.99, 'Official size and weight for soccer enthusiasts'),
  ('P000000006', 'Toy Car', 106, 1009, 60, 9.99, 'Remote-controlled toy car for kids'),
  ('P000000007', 'Lipstick', 100, 1004, 80, 14.99, 'Assorted colors for every occasion'),
  ('P000000008', 'Car Battery', 108, 1000, 30, 89.99, 'Long-lasting battery for various vehicles'),
  ('P000000009', 'Electric Guitar', 104, 1009, 15, 349.99, 'Perfect for aspiring musicians'),
  ('P000000010', 'Dog Food', 100, 1000, 50, 29.99, 'Healthy and nutritious food for dogs');
  
  
  
  SELECT * FROM product;
  




INSERT INTO sale (PRODUCT_ID, QUANTITY_SOLD, TOTAL_AMOUNT, CUSTOMER_ID)
VALUES
  ('P000000001', 5, 299.95, 1),
  ('P000000002', 3, 59.97, 2),
  ('P000000003', 1, 129.99, 3),
  ('P000000004', 2, 25.98, 4),
  ('P000000005', 4, 99.96, 5),
  ('P000000006', 6, 59.94, 6),
  ('P000000007', 2, 29.98, 7),
  ('P000000008', 1, 89.99, 8),
  ('P000000009', 3, 314.97, 9),
  ('P000000010', 5, 149.95, 10);
