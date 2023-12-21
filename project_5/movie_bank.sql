CREATE DATABASE MovieBank;

USE MovieBank;



-- make a primary genres table
CREATE TABLE genres(

    GENRE_ID VARCHAR (10),
    PRIMARY KEY (GENRE_ID)

);

-- Create a primary directors table
CREATE TABLE directors(

    DIRECTOR_ID VARCHAR (10),
    PRIMARY KEY (DIRECTOR_ID)

);

-- Create a primary rates table
CREATE TABLE rates(

    RATE_ID VARCHAR (25),
    PRIMARY KEY (RATE_ID)

);



/*
Movies Table:

    MovieID: Primary Key, unique identifier for each movie.
    Title: Name of the movie.
    ReleaseDate: Release date of the movie.
    Duration: Duration of the movie in minutes.
    GenreID: Foreign Key, referencing the Genres Table.
    DirectorID: Foreign Key, referencing the Directors Table.
    Description: Brief description or summary of the movie.
*/


CREATE TABLE movies(

    MOVIE_ID INT AUTO_INCREMENT,
    MOVIE_TITLE VARCHAR (100),
    RELEASE_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
    DURATION VARCHAR (10),
    GENRE_ID VARCHAR (10),
    DIRECTOR_ID VARCHAR (10),
    RATE_ID VARCHAR (25),
    DESCRIPTION_ VARCHAR (2000),
    PRIMARY KEY (MOVIE_ID),
    FOREIGN KEY (GENRE_ID) REFERENCES genres(GENRE_ID),
    FOREIGN KEY (DIRECTOR_ID) REFERENCES directors(DIRECTOR_ID),
    FOREIGN KEY (RATE_ID) REFERENCES rates(RATE_ID)

);


-- Check the created tables
SELECT * FROM genres;
SELECT * FROM directors;
SELECT * FROM rates;
SELECT * FROM movies;




/*

Actors Table:

    ActorID: Primary Key, unique identifier for each actor.
    FirstName: First name of the actor.
    LastName: Last name of the actor.
    BirthDate: Date of birth of the actor.
    Nationality: the natrionality of the actor
    Website : url of their web page
    Biography: a short biography of actor

*/


CREATE TABLE actors(

    ACTOR_ID INT AUTO_INCREMENT,
    FIRST_NAME VARCHAR (50),
    LAST_NAME VARCHAR (50),
    BIRTH_DATE DATE,
    NATIONALITY VARCHAR (50),
    WEBSITE VARCHAR (1000),
    BIOGRAPHY VARCHAR (5000),
    PRIMARY KEY (ACTOR_ID)

);



-- Modify directors table

/*
Directors Table:

    DirectorID: Primary Key, unique identifier for each director.
    FirstName: First name of the director.
    LastName: Last name of the director.
    BirthDate: Date of birth of the director.
    Nationality: the nationality of the director.
    Website: url of the website of the director.
    Biography: a short biography of the director.
    Actor id: may a director also be an actor
*/

ALTER TABLE directors
ADD FIRST_NAME VARCHAR (50),
ADD LAST_NAME VARCHAR (50),
ADD BIRTH_DATE DATE,
ADD NATIONALITY VARCHAR (50),
ADD WEBSITE VARCHAR (1000),
ADD BIOGRAPHY VARCHAR (5000),
ADD ACTOR_ID INT,
ADD FOREIGN KEY (ACTOR_ID) REFERENCES actors(ACTOR_ID);


-- I forgot to add a column with the director's ID to the actors' table
--  in case some of the actors are also directors

ALTER TABLE actors
ADD DIRECTOR_ID VARCHAR (10),
ADD FOREIGN KEY (DIRECTOR_ID) REFERENCES directors(DIRECTOR_ID);


-- Modify genres table

/*
Genres Table:

    GenreID: Primary Key, unique identifier for each genre.
    GenreName: Name of the genre.
    Description: a short description of the genre
*/

ALTER TABLE genres
ADD GENRE_NAME VARCHAR (25),
ADD DESCRIPTION_ VARCHAR (2000);


-- Modify rates table

/*
Rates Table:
      Rate ID: Primary key, unique identifier for each rate
      Movie ID: Foreign key, referencing the movies table, not null
      Genre ID: Foreign key, referencing the genres table
      Director ID: Foreign key, referencing the directors table
*/

ALTER TABLE rates
ADD MOVIE_ID INT,
ADD GENRE_ID VARCHAR (10),
ADD DIRECTOR_ID VARCHAR (10),
ADD FOREIGN KEY (MOVIE_ID) REFERENCES movies(MOVIE_ID),
ADD FOREIGN KEY (GENRE_ID) REFERENCES genres(GENRE_ID),
ADD FOREIGN KEY (DIRECTOR_ID) REFERENCES directors(DIRECTOR_ID);



ALTER TABLE rates
ADD RATE DECIMAL (2, 1);


/*
MovieActors Table (Linking Table):

    MovieID: Foreign Key, referencing the Movies Table.
    ActorID: Foreign Key, referencing the Actors Table.
*/


CREATE TABLE movie_actor (

    MOVIE_ID INT,
    ACTOR_ID INT,
    FOREIGN KEY (MOVIE_ID) REFERENCES movies(MOVIE_ID),
    FOREIGN KEY (ACTOR_ID) REFERENCES actors(ACTOR_ID)

);




/*
Table Structure:


1) actors table

CREATE TABLE `actors` (
  `ACTOR_ID` int NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `NATIONALITY` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(1000) DEFAULT NULL,
  `BIOGRAPHY` varchar(5000) DEFAULT NULL,
  `DIRECTOR_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ACTOR_ID`),
  KEY `DIRECTOR_ID` (`DIRECTOR_ID`),
  CONSTRAINT `actors_ibfk_1` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `directors` (`DIRECTOR_ID`)
)

2) directors table

CREATE TABLE `directors` (
  `DIRECTOR_ID` varchar(10) NOT NULL,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `NATIONALITY` varchar(50) DEFAULT NULL,
  `WEBSITE` varchar(1000) DEFAULT NULL,
  `BIOGRAPHY` varchar(5000) DEFAULT NULL,
  `ACTOR_ID` int DEFAULT NULL,
  PRIMARY KEY (`DIRECTOR_ID`),
  KEY `ACTOR_ID` (`ACTOR_ID`),
  CONSTRAINT `directors_ibfk_1` FOREIGN KEY (`ACTOR_ID`) REFERENCES `actors` (`ACTOR_ID`)
)

3) genres table

CREATE TABLE `genres` (
  `GENRE_ID` varchar(10) NOT NULL,
  `GENRE_NAME` varchar(25) DEFAULT NULL,
  `DESCRIPTION_` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`GENRE_ID`)


4) movie_actor table

CREATE TABLE `movie_actor` (
  `MOVIE_ID` int DEFAULT NULL,
  `ACTOR_ID` int DEFAULT NULL,
  KEY `MOVIE_ID` (`MOVIE_ID`),
  KEY `ACTOR_ID` (`ACTOR_ID`),
  CONSTRAINT `movie_actor_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movies` (`MOVIE_ID`),
  CONSTRAINT `movie_actor_ibfk_2` FOREIGN KEY (`ACTOR_ID`) REFERENCES `actors` (`ACTOR_ID`)
)


5) movies table

CREATE TABLE `movies` (
  `MOVIE_ID` int NOT NULL AUTO_INCREMENT,
  `MOVIE_TITLE` varchar(100) DEFAULT NULL,
  `RELEASE_DATE` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `DURATION` varchar(10) DEFAULT NULL,
  `GENRE_ID` varchar(10) DEFAULT NULL,
  `DIRECTOR_ID` varchar(10) DEFAULT NULL,
  `RATE_ID` varchar(25) DEFAULT NULL,
  `DESCRIPTION_` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`MOVIE_ID`),
  KEY `GENRE_ID` (`GENRE_ID`),
  KEY `DIRECTOR_ID` (`DIRECTOR_ID`),
  KEY `RATE_ID` (`RATE_ID`),
  CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`GENRE_ID`) REFERENCES `genres` (`GENRE_ID`),
  CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `directors` (`DIRECTOR_ID`),
  CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`RATE_ID`) REFERENCES `rates` (`RATE_ID`)
)


6) rates table

CREATE TABLE `rates` (
  `RATE_ID` varchar(25) NOT NULL,
  `MOVIE_ID` int DEFAULT NULL,
  `GENRE_ID` varchar(10) DEFAULT NULL,
  `DIRECTOR_ID` varchar(10) DEFAULT NULL,
  `RATE` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`RATE_ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  KEY `GENRE_ID` (`GENRE_ID`),
  KEY `DIRECTOR_ID` (`DIRECTOR_ID`),
  CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movies` (`MOVIE_ID`),
  CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`GENRE_ID`) REFERENCES `genres` (`GENRE_ID`),
  CONSTRAINT `rates_ibfk_3` FOREIGN KEY (`DIRECTOR_ID`) REFERENCES `directors` (`DIRECTOR_ID`)

*/



