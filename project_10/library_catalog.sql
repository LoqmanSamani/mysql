CREATE DATABASE LibraryCatalog;


USE LibraryCatalog;



CREATE TABLE authors(

  AUTHOR_ID INT AUTO_INCREMENT
  PRIMARY KEY

);



CREATE TABLE genres(

  GENRE_ID INT AUTO_INCREMENT
  PRIMARY KEY

);


/*
Books Table:

    book_id (Primary Key)
    title
    author_id (Foreign Key referencing Authors table)
    genre_id (Foreign Key referencing Genres table)
    published_date
    isbn (International Standard Book Number)
    available_copies
    total_copies
*/

CREATE TABLE books(

  BOOK_ID INT AUTO_INCREMENT,
  TITLE VARCHAR (200),
  AUTHOR_ID INT,
  GENRE_ID INT,
  PUBLISHED_DATE DATE,
  ISBN VARCHAR (100),
  AVAILABLE_COPIES INT,
  TOTAL_COPIES INT,
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (BOOK_ID),
  FOREIGN KEY (AUTHOR_ID)
  REFERENCES authors (AUTHOR_ID),
  FOREIGN KEY (GENRE_ID)
  REFERENCES genres (GENRE_ID)

);



/*
Authors Table:

    author_id (Primary Key)
    author_name
    birth_date
    nationality
*/

ALTER TABLE authors
ADD COLUMN FIRST_NAME VARCHAR (50),
ADD COLUMN MIDDLE_NAME VARCHAR (50),
ADD COLUMN  LAST_NAME VARCHAR (50),
ADD COLUMN  BIRTH_DATE DATE,
ADD COLUMN  NATIONALITY VARCHAR (50),
ADD COLUMN  BIOGRAPHY VARCHAR (2000),
ADD COLUMN  DESCRIPTION_ VARCHAR (2000);


SELECT * FROM authors;


/*
Genres Table:

    genre_id (Primary Key)
    genre_name
*/

ALTER TABLE genres
ADD COLUMN GENRE_NAME VARCHAR (50),
ADD COLUMN DESCRIPTION_ VARCHAR (2000);


/*
Members Table:

    member_id (Primary Key)
    member_name
    email
    phone_number
    address
*/

CREATE TABLE members(

  MEMBER_ID INT AUTO_INCREMENT,
  FIRST_NAME VARCHAR (50),
  MIDDLE_NAME VARCHAR (50),
  LAST_NAME VARCHAR (50),
  ENROLLMENT_DATE DATETIME DEFAULT NOW(),
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  ADDRESS VARCHAR (200),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (MEMBER_ID)

);


/*
BorrowedItems Table:

    transaction_id (Primary Key)
    book_id (Foreign Key referencing Books table)
    member_id (Foreign Key referencing Members table)
    borrow_date
    due_date
    return_date
*/

CREATE TABLE borrow(

  TRANSACTION_ID INT AUTO_INCREMENT,
  BOOK_ID INT,
  MEMBER_ID INT,
  BORROW_DATE DATETIME DEFAULT NOW(),
  DUE_DATE DATETIME,
  RETURN_DATE DATETIME,
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (TRANSACTION_ID),
  FOREIGN KEY (MEMBER_ID)
  REFERENCES members (MEMBER_ID),
  FOREIGN KEY (BOOK_ID)
  REFERENCES books (BOOK_ID)

);

/*
Librarians Table:

    librarian_id (Primary Key)
    librarian_name
    email
    phone_number
*/

CREATE TABLE librarians(

  LIBRARIAN_ID INT AUTO_INCREMENT,
  FIRST_NAME VARCHAR (50),
  MIDDLE_NAME VARCHAR (50),
  LAST_NAME VARCHAR (50),
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  ADDRESS VARCHAR (200),
  DESCRIPTION_ VARCHAR (200),
  PRIMARY KEY (LIBRARIAN_ID)

);


/*
Transactions Table:

    transaction_id (Primary Key)
    book_id (Foreign Key referencing Books table)
    member_id (Foreign Key referencing Members table)
    librarian_id (Foreign Key referencing Librarians table)
    transaction_date
    transaction_type (e.g., Borrow, Return, Renew)
*/

CREATE TABLE transactions(

  TRANSACTION_ID INT AUTO_INCREMENT,
  BOOK_ID INT,
  MEMBER_ID INT,
  LIBRARIAN_ID INT,
  TRANSACTION_DATE DATETIME DEFAULT NOW(),
  TRANSACTION_TYPE VARCHAR (25),
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (TRANSACTION_ID),
  FOREIGN KEY (BOOK_ID)
  REFERENCES books (BOOK_ID),
  FOREIGN KEY (MEMBER_ID)
  REFERENCES members (MEMBER_ID),
  FOREIGN KEY (LIBRARIAN_ID)
  REFERENCES librarians (LIBRARIAN_ID)

);


/*
BookReviews Table:

    review_id (Primary Key)
    book_id (Foreign Key referencing Books table)
    member_id (Foreign Key referencing Members table)
    rating
    comment
    review_date
*/


CREATE TABLE book_reviews(

  REVIEW_ID INT AUTO_INCREMENT PRIMARY KEY,
  BOOK_ID INT REFERENCES books.BOOK_ID,
  MEMBER_ID INT REFERENCES members.MEMBER_ID,
  RATING DECIMAL (5, 2),
  COMMENT_ VARCHAR (2000),
  REVIEW_DATE DATETIME DEFAULT NOW(),
  DESCRIPTION_ VARCHAR (2000)

);





