CREATE DATABASE SocialMediaDatabase;


USE SocialMediaDatabase;




/*

Users Table:

    UserID (Primary Key)
    Username
    Passcode
    FirstName
    MiddleName
    LastName
    Email
    PhoneNumber
    Address
    RegistrationDate
    Description
*/


CREATE TABLE users(

  USER_ID INT AUTO_INCREMENT,
  USER_NAME VARCHAR (50) UNIQUE NOT NULL,
  PASSCODE VARCHAR (100) NOT NULL,  -- should be hashed during insert data
  FIRST_NAME VARCHAR (50) NOT NULL,
  MIDDLE_NAME VARCHAR (50) DEFAULT "_",
  LAST_NAME VARCHAR (50) NOT NULL,
  EMAIL VARCHAR (50) NOT NULL,
  PHONE_NUMBER VARCHAR (15),
  ADDRESS VARCHAR (200),
  REGESTRATION_DATE DATETIME DEFAULT NOW(),
  DESCRIPTION_ VARCHAR (1000),
  PRIMARY KEY (USER_ID)
);


-- Add is admin column to the users table
ALTER TABLE users
ADD COLUMN IS_ADMIN BOOLEAN
AFTER REGESTRATION_DATE;

SELECT * FROM users;


/*

Account Table 
  Account Id (primary key)
  User Id (foreign key refers to users table)
  Account Type
  Description
*/


CREATE TABLE accounts(

  ACCOUNT_ID VARCHAR(10),
  USER_ID INT,
  ACCOUNT_TYPE VARCHAR(15) NOT NULL,
  DESCRIPTION_ varchar(1000),
  PRIMARY KEY (ACCOUNT_ID),
  FOREIGN KEY (USER_ID) REFERENCES users (USER_ID)
  
);



/*

Comments Table:

    CommentID (Primary Key)
    PostID (Foreign Key referencing Posts table)
    UserID (Foreign Key referencing Users table)
    CommentText
    CommentDate

*/


CREATE TABLE comments(

  COMMENT_ID VARCHAR (10),
  POST_ID INT,
  USER_ID INT,
  COMMENT_TEXT VARCHAR (2000),
  COMMENT_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (COMMENT_ID),
  FOREIGN KEY (POST_ID)
  REFERENCES posts (POST_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID)
  
);




/*

Posts Table:

    PostID (Primary Key)
    UserID (Foreign Key referencing Users table)
    Content
    PostDate
    PostType

*/


CREATE TABLE posts(

  POST_ID INT AUTO_INCREMENT,
  USER_ID INT,
  CONTENT VARCHAR(10000),
  POST_DATE DATETIME DEFAULT NOW(),
  POST_TYPE VARCHAR(15),
  PRIMARY KEY (POST_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID)

);


/*

Likes Table:

    LikeID (Primary Key)
    PostID (Foreign Key referencing Posts table)
    UserID (Foreign Key referencing Users table)
    LikeDate

*/

CREATE TABLE likes(

  LIKE_ID INT,
  POST_ID INT,
  USER_ID INT,
  LIKE_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (LIKE_ID),
  FOREIGN KEY (POST_ID)
  REFERENCES posts (POST_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES posts (POST_ID)

);


-- Modify a spelling mistake
ALTER TABLE likes
DROP FOREIGN KEY likes_ibfk_2;

ALTER TABLE likes
DROP COLUMN USER_ID;

ALTER TABLE likes
ADD COLUMN USER_ID INT
AFTER POST_ID;

ALTER TABLE likes
ADD CONSTRAINT like_users_ibfk
FOREIGN KEY (USER_ID)
REFERENCES users (USER_ID);

SELECT * FROM likes;





/*

Friendships Table:

    FriendshipID (Primary Key)
    UserID1 (Foreign Key referencing Users table)
    UserID2 (Foreign Key referencing Users table)
    FriendshipDate

*/

CREATE TABLE friendship(

  FRIENDSHIP_ID INT,
  USER_ID1 INT,
  USER_ID2 INT,
  FRIENDSHIP_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (FRIENDSHIP_ID),
  FOREIGN KEY (USER_ID1)
  REFERENCES users (USER_ID),
  FOREIGN KEY (USER_ID2)
  REFERENCES users (USER_ID)

);



/*

Messages Table:

    MessageID (Primary Key)
    SenderID (Foreign Key referencing Users table)
    ReceiverID (Foreign Key referencing Users table)
    MessageText
    MessageDate
    IsRead (Boolean indicating whether the message is read or not)

*/


CREATE TABLE messages(

  MESSAGE_ID INT,
  SENDER_ID INT,
  RECEIVER_ID INT,
  TEXT_ VARCHAR (5000),
  MESSAGE_DATE DATETIME DEFAULT NOW(),
  IS_READ BOOLEAN,
  PRIMARY KEY (MESSAGE_ID),
  FOREIGN KEY (SENDER_ID)
  REFERENCES users (USER_ID),
  FOREIGN KEY (RECEIVER_ID)
  REFERENCES users (USER_ID)

);


/*

Notifications Table:

    NotificationID (Primary Key)
    UserID (Foreign Key referencing Users table)
    NotificationText
    NotificationDate
    IsRead (Boolean indicating whether the notification is read or not)

*/


CREATE TABLE notifications(

  NOTIFICATION_ID INT,
  USER_ID INT,
  NOTIFICATION_TEXT VARCHAR (2000),
  NOTIFICATION_DATE DATETIME DEFAULT NOW(),
  IS_READ BOOLEAN,
  PRIMARY KEY (NOTIFICATION_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID)

);



/*

Groups Table:

    GroupID (Primary Key)
    GroupName
    GroupCreatorID (Foreign Key referencing Users table)
    GroupCreationDate
  
*/

CREATE TABLE groups_(

  GROUP_ID INT,
  GROUP_NAME VARCHAR (100) NOT NULL,
  CREATURE_ID INT,
  CREATION_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (GROUP_ID),
  FOREIGN KEY (CREATURE_ID)
  REFERENCES users (USER_ID)

);


/*

Admins Table:

   Admin Id 
   User Id
   Group Id

*/

CREATE TABLE admins (

  ADMIN_ID INT,
  USER_ID INT,
  GROUP_ID INT,
  PRIMARY KEY (ADMIN_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID),
  FOREIGN KEY (GROUP_ID)
  REFERENCES groups_ (GROUP_ID)

);



/*

GroupMembers Table:

    GroupMemberID (Primary Key)
    GroupID (Foreign Key referencing Groups table)
    UserID (Foreign Key referencing Users table)
    JoinDate

*/

CREATE TABLE group_members (

  GROUP_MEMBER_ID INT,
  GROUP_ID INT,
  USER_ID INT,
  JOIN_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (GROUP_MEMBER_ID),
  FOREIGN KEY (GROUP_ID)
  REFERENCES groups_ (GROUP_ID),
  FOREIGN KEY (USER_ID)
  REFERENCES users (USER_ID)

);





