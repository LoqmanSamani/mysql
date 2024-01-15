CREATE DATABASE EventManagement;

USE EventManagement;

-- predefined venues table

CREATE TABLE venues (

  VENUE_ID INT PRIMARY KEY
  AUTO_INCREMENT

);


-- predefined organizers table

CREATE TABLE organizers (

  ORGANIZER_ID INT PRIMARY KEY
  AUTO_INCREMENT

);

/*
Events Table:

    event_id (Primary Key)
    event_name
    description
    start_date
    end_date
    venue_id (Foreign Key referencing Venues table)
    organizer_id (Foreign Key referencing Organizers table)
*/

CREATE TABLE events_(

  EVENT_ID INT AUTO_INCREMENT,
  EVENT_NAME VARCHAR (100),
  START_DATE DATETIME,
  END_DATE DATETIME,
  VENUE_ID INT,
  ORGANIZER_ID INT,
  DESCRIPTION_ VARCHAR (2000),
  PRIMARY KEY (EVENT_ID),
  FOREIGN KEY (VENUE_ID) REFERENCES venues (VENUE_ID),
  FOREIGN KEY (ORGANIZER_ID) REFERENCES organizers (ORGANIZER_ID)

);

SELECT * FROM events_;


/*
Organizers Table:

    organizer_id (Primary Key)
    organizer_name
    email
    phone_number
*/



-- modify organizers table

ALTER TABLE organizers
ADD COLUMN ORGANIZER_NAME VARCHAR (100);


ALTER TABLE organizers
ADD COLUMN EMAIL VARCHAR (100);

ALTER TABLE organizers
ADD PHONE_NUMBER VARCHAR (15);

ALTER TABLE organizers
ADD ADDRESS VARCHAR (500);

ALTER TABLE organizers
ADD DESCRIPTION_ VARCHAR (2000);


SELECT * FROM organizers;

/*
Venues Table:

    venue_id (Primary Key)
    venue_name
    address
    capacity
*/


-- modify venue table

ALTER TABLE venues
ADD COLUMN VENUE_NAME VARCHAR (100),
ADD COLUMN ADDRESS VARCHAR (500),
ADD COLUMN CAPACITY INT,
ADD COLUMN DESCRIPTION_ VARCHAR (2000);

SELECT * FROM venues;


/*
Participants Table:

    attendee_id (Primary Key)
    event_id (Foreign Key referencing Events table)
    full_name
    email
    phone_number
*/

CREATE TABLE participants(

  PARTICIPANT_ID INT AUTO_INCREMENT,
  FIRST_NAME VARCHAR (50),
  MIDDLE_NAME VARCHAR (50),
  LAST_NAME VARCHAR (50),
  EVENT_ID INT,
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  PRIMARY KEY (PARTICIPANT_ID),
  FOREIGN KEY (EVENT_ID) REFERENCES events_ (EVENT_ID)

);


-- modify participants table
ALTER TABLE participants
ADD COLUMN DESCRIPRION_ VARCHAR (2000);

SELECT * FROM participants;

/*
EventCategories Table:

    category_id (Primary Key)
    category_name
*/

CREATE TABLE event_categories(

  CATEGORY_ID INT AUTO_INCREMENT PRIMARY KEY,
  CATEDORY_NAME VARCHAR (100),
  DESCRIPTION_ VARCHAR (2000)

);

/*
EventCategoryMapping Table (Associative table to represent many-to-many relationship between events and categories):

    event_id (Foreign Key referencing Events table)
    category_id (Foreign Key referencing EventCategories table)
*/

CREATE TABLE event_category_mapping(

  EVENT_ID INT,
  CATEGORY_ID INT,
  FOREIGN KEY (EVENT_ID)
  REFERENCES events_ (EVENT_ID),
  FOREIGN KEY (CATEGORY_ID)
  REFERENCES event_categories (CATEGORY_ID)

);

ALTER TABLE event_category_mapping
ADD COLUMN DESCRIPRION_ VARCHAR (2000);

/*
EventSpeakers Table:

    speaker_id (Primary Key)
    speaker_name
    email
    phone_number
*/

CREATE TABLE event_speakers(

  SPEAKER_ID INT AUTO_INCREMENT,
  SPEAKER_NAME VARCHAR (50),
  EMAIL VARCHAR (50),
  PHONE_NUMBER VARCHAR (15),
  PARTICIPANT_ID INT,
  PRIMARY KEY (SPEAKER_ID),
  FOREIGN KEY (PARTICIPANT_ID)
  REFERENCES participants (PARTICIPANT_ID)

);

ALTER TABLE event_speakers
ADD COLUMN DESCRIPTION_ VARCHAR (2000);


/*
EventSpeakerMapping Table (Associative table to represent many-to-many relationship between events and speakers):

    event_id (Foreign Key referencing Events table)
    speaker_id (Foreign Key referencing EventSpeakers table)
*/


CREATE TABLE event_speaker_maping(

  EVENT_ID INT,
  SPEAKER_ID INT,
  FOREIGN KEY (EVENT_ID) REFERENCES events_ (EVENT_ID),
  FOREIGN KEY (SPEAKER_ID) REFERENCES event_speakers (SPEAKER_ID),
  DESCRIPTION_ VARCHAR(2000)

);


/*
EventAttendeesMapping Table (Associative table to represent many-to-many relationship between events and attendees):

    event_id (Foreign Key referencing Events table)
    attendee_id (Foreign Key referencing Attendees table)
*/

CREATE TABLE event_participants_mapping(

  EVENT_ID INT,
  PARTICIPANT_ID INT,
  FOREIGN KEY (EVENT_ID) REFERENCES events_ (EVENT_ID),
  FOREIGN KEY (PARTICIPANT_ID) REFERENCES participants (PARTICIPANT_ID)

);


RENAME TABLE event_participants_mapping TO event_participant_mapping;


ALTER TABLE event_participant_mapping
ADD COLUMN DESCRIPTION_ VARCHAR (2000);




/*
    EventFeedback Table:

    feedback_id (Primary Key)
    event_id (Foreign Key referencing Events table)
    attendee_id (Foreign Key referencing Attendees table)
    rating
    comment
    feedback_date
*/

CREATE TABLE event_feedback(

  FEEDBACK_ID INT AUTO_INCREMENT,
  EVENT_ID INT,
  PARTICIPANT_ID INT,
  RATING DECIMAL (5, 2),
  COMMENT_ VARCHAR (2000),
  FEEDBACK_DATE DATETIME DEFAULT NOW(),
  PRIMARY KEY (FEEDBACK_ID),
  FOREIGN KEY (EVENT_ID)
  REFERENCES events_ (EVENT_ID),
  FOREIGN KEY (PARTICIPANT_ID)
  REFERENCES participants (PARTICIPANT_ID),
  DESCRIPTION_ VARCHAR (2000)


);