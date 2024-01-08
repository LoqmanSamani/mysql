USE SocialMediaDatabase;


-- In each case the passcode is hashed
INSERT INTO users (USER_NAME, PASSCODE, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, ADDRESS, IS_ADMIN, DESCRIPTION_)
VALUES
      ('john_doe', SHA2('password123', 256), 'John', 'Doe', 'john.doe@email.com', '1234567890', '123 Main St', 1, 'Administrator'),

      ('alice_smith', SHA2('pass123', 256), 'Alice', 'Smith', 'alice.smith@email.com', '9876543210', '456 Oak St', 0, 'Regular user'),

      ('bob_jones', SHA2('qwerty', 256), 'Bob', 'Jones', 'bob.jones@email.com', '5556667777', '789 Pine St', 0, 'Another user'),

      ('emma_wilson', SHA2('abc123', 256), 'Emma', 'Wilson', 'emma.wilson@email.com', '9998887777', '321 Elm St', 0, 'Yet another user'),

      ('samuel_brown', SHA2('passpass', 256), 'Samuel', 'Brown', 'samuel.brown@email.com', '1112223333', '654 Birch St', 0, 'New user'),

      ('linda_jackson', SHA2('linda123', 256), 'Linda', 'Jackson', 'linda.jackson@email.com', '7778889999', '987 Cedar St', 0, 'Active user'),

      ('charlie_harris', SHA2('charliepass', 256), 'Charlie', 'Harris', 'charlie.harris@email.com', '3334445555', '543 Maple St', 0, 'Frequent user');
      
      
  
SELECT * FROM users;


INSERT INTO accounts (ACCOUNT_ID, USER_ID, ACCOUNT_TYPE, DESCRIPTION_)
VALUES
('A000000001', 1, 'Savings', 'Primary savings account for John Doe'),

('A000000002', 2, 'Checking', 'Primary checking account for Alice Smith'),

('A000000003', 3, 'Investment', 'Investment account for Bob Jones'),

('A000000004', 4, 'Savings', 'Emergency savings account for Emma Wilson'),

('A000000005', 5, 'Checking', 'Primary checking account for Samuel Brown'),

('A000000006', 6, 'Savings', 'Savings account for Linda Jackson'),

('A000000007', 7, 'Checking', 'Primary checking account for Charlie Harris'),

('A000000008', 1, 'Investment', 'Investment account for Sophie Martin'),

('A000000009', 5, 'Checking', 'Secondary checking account for John Doe'),

('A000000010', 3, 'Savings', 'Savings account for Alice Smith');

SELECT * FROM accounts;



INSERT INTO posts (POST_ID, USER_ID, CONTENT, POST_DATE, POST_TYPE)
VALUES
(1, 1, 'Excited about my new job!', '2023-11-09 08:30:00', 'Status'),

(2, 2, 'Just finished reading a great book!', '2023-11-09 10:15:00', 'Book'),

(3, 3, 'Exploring new hiking trails this weekend.', '2023-11-09 12:45:00', 'Adventure'),

(4, 4, 'Working on a new coding project.', '2023-11-09 14:20:00', 'Code'),

(5, 1, 'Enjoying a relaxing day at the beach.', '2023-11-09 16:00:00', 'Travel'),

(6, 6, 'Trying out a new recipe in the kitchen.', '2023-11-09 18:30:00', 'Food'),

(7, 7, 'Excited about the upcoming concert!', '2023-11-09 20:15:00', 'Music'),

(8, 2, 'Just adopted a new pet!', '2023-11-09 22:00:00', 'Pets'),

(9, 7, 'Attending a virtual conference on AI.', '2023-11-10 08:45:00', 'Tech'),

(10, 3, 'Sharing my latest artwork.', '2023-11-10 11:00:00', 'Art');



INSERT INTO comments (COMMENT_ID, POST_ID, USER_ID, COMMENT_TEXT, COMMENT_DATE)
VALUES
('C1', 1, 2, 'Congrats on the new job!', '2023-11-09 09:00:00'),

('C2', 3, 4, 'Looks like a beautiful trail. Enjoy your hike!', '2023-11-09 13:00:00'),

('C3', 5, 6, 'What recipe are you trying out? Share it with us!', '2023-11-09 19:00:00'),

('C4', 7, 3, 'Who is performing at the concert? I might join too!', '2023-11-09 21:30:00'),

('C5', 9, 4, 'Which virtual conference are you attending? Exciting!', '2023-11-10 09:30:00'),

('C6', 2, 3, 'What book did you read? I need recommendations.', '2023-11-10 12:00:00'),

('C7', 4, 5, 'Tell us more about your coding project!', '2023-11-10 15:00:00'),

('C8', 6, 7, 'Adopting a pet is wonderful. Share some pictures!', '2023-11-10 18:45:00'),

('C9', 8, 1, 'The beach sounds relaxing. Which one are you at?', '2023-11-10 22:00:00');

SELECT * FROM comments;



INSERT INTO posts (USER_ID, CONTENT, POST_TYPE)
VALUES
(1, 'Excited to start my new job next week!', 'Job Update'),

(2, 'Just finished reading an amazing book. Highly recommend!', 'Recommend'),

(3, 'Exploring new hiking trails this weekend. Nature is beautiful!', 'Outdoor');




INSERT INTO likes 
VALUES
(1, 1, 2, '2023-11-09 09:15:00'),

(2, 3, 4, '2023-11-09 13:30:00'),

(3, 5, 6, '2023-11-09 19:15:00'),

(4, 7, 5, '2023-11-09 21:45:00'),

(5, 9, 5, '2023-11-10 09:45:00'),

(6, 2, 3, '2023-11-10 12:15:00'),

(7, 4, 5, '2023-11-10 15:15:00'),

(8, 6, 7, '2023-11-10 19:00:00'),

(9, 8, 1, '2023-11-10 22:15:00'),

(10, 10, 1, '2023-11-11 10:30:00');




INSERT INTO friendship 
VALUES
(1, 1, 2, '2023-11-09 09:15:00'),

(2, 3, 4, '2023-11-09 13:30:00'),

(3, 5, 6, '2023-11-09 19:15:00'),

(4, 7, 6, '2023-11-09 21:45:00'),

(5, 5, 1, '2023-11-10 09:45:00'),

(6, 2, 3, '2023-11-10 12:15:00');



INSERT INTO messages
VALUES
(1, 1, 2, 'Hello, how are you?', '2023-11-09 09:30:00', 1),

(2, 3, 4, 'Meeting at 2 PM tomorrow.','2023-11-09 12:45:00', 0),

(3, 5, 6, 'I saw that movie, it was great!','2023-11-09 18:20:00', 1),

(4, 7, 4, 'Are you coming to the party on Friday?','2023-11-09 20:55:00', 1),

(5, 6, 1, 'Happy Birthday!','2023-11-10 08:00:00', 0),

(6, 2, 3, "Let's grab lunch today.", '2023-11-10 11:30:00', 1),

(7, 4, 5, 'Do you have the report ready?', '2023-11-10 14:45:00', 0),

(8, 6, 7, 'I need your help with something.', '2023-11-10 19:10:00', 1),

(9, 3, 2, 'Congratulations on your promotion!', '2023-11-11 09:15:00', 1),

(10, 2, 1, "Thanks for the gift, it's awesome!", '2023-11-11 12:30:00', 1);




INSERT INTO notifications
VALUES
(1, 1, 'You have a new follower.', '2023-11-09 10:00:00', 1),

(2, 2, 'Your post has been liked 5 times.', '2023-11-09 12:30:00', 0),

(3, 3, 'Upcoming event: Team building on Saturday.', '2023-11-09 15:45:00', 1),

(4, 4, 'New message from a friend.', '2023-11-09 18:20:00', 1),

(5, 5, 'Reminder: Complete your tasks for the day.', '2023-11-10 08:30:00', 1),

(6, 6, "You've been mentioned in a post.", '2023-11-10 11:15:00', 0),

(7, 7, "Congratulations! You've earned a badge.", '2023-11-10 14:40:00', 1),

(8, 6, 'Event invitation: Networking meetup.', '2023-11-10 17:55:00', 1),

(9, 1, 'New job opportunities available.', '2023-11-11 09:10:00', 0),

(10, 5, 'Your friend posted a new photo.', '2023-11-11 12:25:00', 1);





-- Insert data into groups_ table

INSERT INTO groups_ 
VALUES
(1, 'Tech Enthusiasts', 3, '2023-11-09 14:00:00'),
(2, 'Book Club', 5, '2023-11-09 15:30:00'),
(3, 'Fitness Fanatics', 2, '2023-11-10 09:45:00'),
(4, 'Travel Explorers', 7, '2023-11-10 11:20:00'),
(5, 'Photography Lovers', 4, '2023-11-10 13:55:00'),
(6, 'Music Junkies', 2, '2023-11-11 08:10:00'),
(7, 'Foodies Paradise', 1, '2023-11-11 10:35:00'),
(8, 'Art & Creativity', 6, '2023-11-11 12:55:00'),
(9, 'Gaming Guild', 6, '2023-11-11 14:30:00'),
(10, 'Career Development', 6, '2023-11-12 09:00:00');



-- Sample data for admins table
INSERT INTO admins (ADMIN_ID, USER_ID, GROUP_ID)
VALUES
(1, 3, 1),  -- User 3 is an admin for Group 1
(2, 5, 2),  -- User 5 is an admin for Group 2
(3, 2, 3),  -- User 2 is an admin for Group 3
(4, 7, 4);  -- User 7




-- Sample data for group_members table
INSERT INTO group_members (GROUP_MEMBER_ID, GROUP_ID, USER_ID)
VALUES
(1, 1, 3),  -- User 3 joined Group 1
(2, 2, 5),  -- User 5 joined Group 2
(3, 3, 2),  -- User 2 joined Group 3
(4, 4, 7);  -- User 7 joined Group 4



