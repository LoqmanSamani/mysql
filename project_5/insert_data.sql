USE MovieBank;


SELECT * FROM actors;

-- insert data into sctors table

INSERT INTO actors (FIRST_NAME, LAST_NAME, BIRTH_DATE, NATIONALITY, WEBSITE, BIOGRAPHY)
VALUES
    ('John', 'Doe', '1990-05-15', 'American', 'http://www.johndoe.com', 'Award-winning actor with a diverse portfolio.'),
    ('Alice', 'Smith', '1985-12-20', 'British', 'http://www.alicesmith.com', 'Known for her versatile roles in drama and comedy.'),
    ('Robert', 'Johnson', '1978-08-03', 'Canadian', 'http://www.robertjohnson.com', NULL),
    ('Emily', 'Brown', NULL, 'Australian', 'http://www.emilybrown.com', 'Rising star with a unique approach to character portrayal.'),
    ('Daniel', 'Miller', '1982-07-25', 'French', 'http://www.danielmiller.com', 'International actor known for multilingual performances.'),
    ('Olivia', 'Jones', '1989-04-18', 'German', 'http://www.oliviajones.com', 'Critically acclaimed actress with a flair for intense roles.'),
    ('Michael', 'Davis', '1992-11-30', 'Japanese', 'http://www.michaeldavis.com', 'Versatile actor with a strong background in theater arts.'),
    ('Sophia', 'Taylor', '1980-09-08', 'Mexican', 'http://www.sophiataylor.com', 'Known for her compelling performances in historical dramas.'),
    ('James', 'Wilson', '1997-03-22', 'Russian', 'http://www.jameswilson.com', 'Young talent making waves in the film industry.'),
    ('Emma', 'Anderson', '1987-06-10', 'Chinese', NULL, 'Experienced actress recognized for her impactful roles.');


SELECT * FROM actors;


-- insert data in directors table

INSERT INTO directors
VALUES
    ('D11111', 'John', 'Doe', '1990-05-15', 'American', 'http://www.johndoe.com', 'Renowned director known for mind-bending narratives.', 1),
    ('D11112', 'Quentin', 'Tarantino', '1963-03-27', 'American', 'http://www.quentintarantino.com', 'Iconic filmmaker with a unique style and vision.', NULL),
    ('D11113', 'Sofia', 'Coppola', '1971-05-14', 'American', 'http://www.sofiacoppola.com', 'Acclaimed director and screenwriter with a focus on intimate dramas.', NULL),
    ('D11114', 'Martin', 'Scorsese', '1942-11-17', 'American', 'http://www.martinscorsese.com', 'Legendary director with a career spanning decades and diverse genres.', NULL),
    ('D11115','Ava', 'DuVernay', '1972-08-24', 'American', 'http://www.avaduvernay.com', 'Pioneering director known for promoting diversity in filmmaking.', NULL),
    ('D11116', 'Bong', 'Joon-ho', '1969-09-14', 'South Korean', 'http://www.bongjoonho.com', 'Oscar-winning director celebrated for his unique storytelling.', NULL),
    ('D11117', 'Greta', 'Gerwig', '1983-08-04', 'American', 'http://www.gretagerwig.com', 'Talented director and actress recognized for her indie films.', NULL),
    ('D11118', 'Ang Lee', 'Lee', '1954-10-23', 'Taiwanese', 'http://www.anglee.com', 'Oscar-winning director known for his versatility and visual storytelling.', NULL),
    ('D11119', 'Denis', 'Villeneuve', '1967-10-03', 'Canadian', 'http://www.denisvilleneuve.com', 'Visionary director with a knack for thought-provoking science fiction.', NULL),
    ('D11110' , 'Aneesh', 'Chaganty', '1991-05-09', 'Indian-American', 'http://www.aneeshchaganty.com', 'Emerging director recognized for his innovative storytelling techniques.', NULL);

SELECT * FROM directors;


UPDATE actors
SET DIRECTOR_ID = "D11111"
WHERE ACTOR_ID = 1;



-- insert in genres table

INSERT INTO genres
VALUES
    ('Genre 1', 'Action', 'High-intensity and fast-paced films with thrilling sequences.'),
    ('Genre 2', 'Drama', 'Character-driven narratives exploring human emotions and relationships.'),
    ('Genre 3','Comedy', 'Light-hearted and humorous films designed to entertain and amuse.'),
    ('Genre 4','Sci-Fi', 'Exploration of futuristic and speculative concepts in a scientific context.'),
    ('Genre 5','Fantasy', 'Imaginary worlds, magical elements, and fantastical creatures.'),
    ('Genre 6','Horror', 'Intended to evoke fear, suspense, and shock in the audience.'),
    ('Genre 7','Romance', 'Focus on romantic relationships and love stories.'),
    ('Genre 8','Mystery', 'Intricate plots with suspenseful elements and hidden truths.'),
    ('Genre 9','Documentary', 'Non-fictional films presenting factual information and real events.'),
    ('Genre 10','Animation', 'Artistic and creative films using animated characters and visuals.');


SELECT * FROM genres;


-- insert in movies

INSERT INTO movies (MOVIE_TITLE, DURATION, GENRE_ID, DIRECTOR_ID,  DESCRIPTION_)
VALUES
    ('Inception', '2h 28m', 'Genre 8', 'D11111', 'A mind-bending heist thriller directed by Christopher Nolan.'),
    ('The Shawshank Redemption', '2h 22m', 'Genre 2', 'D11112', 'A powerful drama directed by Frank Darabont, based on Stephen King\'s novella.'),
    ('The Dark Knight', '2h 32m', 'Genre 1', 'D11116', 'A superhero film directed by Christopher Nolan, featuring Batman and The Joker.'),
    ('The Matrix', '2h 16m', 'Genre 1', 'D11114', 'A sci-fi action film directed by Lana and Lilly Wachowski.'),
    ('The Godfather', '2h 55m', 'Genre 3', 'D11113', 'A classic crime film directed by Francis Ford Coppola.'),
    ('Avatar', '2h 42m', 'Genre 4', 'D11114', 'An epic science fiction film directed by James Cameron.'),
    ('Forrest Gump', '2h 22m', 'Genre 5', 'D11115', 'A heartwarming drama directed by Robert Zemeckis.'),
    ('Pulp Fiction', '2h 34m', 'Genre 3', 'D11116', 'A Quentin Tarantino film known for its nonlinear narrative.');


SELECT * FROM movies;



-- insert into rates table

INSERT INTO rates (RATE_ID, MOVIE_ID, GENRE_ID, DIRECTOR_ID, RATE)
VALUES
    ('R000000001', 9, 'Genre 1', 'D11111', 4.5),
    ('R000000002', 10, 'Genre 3', 'D11113', 4.8),
    ('R000000003', 11, 'Genre 4', 'D11114', 3.7),
    ('R000000004', 12, 'Genre 5', 'D11115', 4.2),
    ('R000000005', 13, 'Genre 3', 'D11116', 4.0),
    ('R000000006', 14, 'Genre 6', 'D11117', 4.6),
    ('R000000007', 15, 'Genre 2', 'D11118', 3.9),
    ('R000000008', 16, 'Genre 1', 'D11119', 4.1);



    SELECT * FROM rates;




-- insert into movie_actor

INSERT INTO movie_actor (MOVIE_ID, ACTOR_ID)
VALUES
    (9, 1),
    (10, 2),
    (11, 3),
    (12, 4),
    (13, 5),
    (13, 6),
    (14, 7),
    (14, 8),
    (15, 9),
    (15, 10);


SELECT * FROM movie_actor;



SELECT * FROM rates;
SELECT * FROM movies;

UPDATE movies
SET RATE_ID = "R000000001"
WHERE MOVIE_ID = 9;

UPDATE movies
SET RATE_ID = "R000000002"
WHERE MOVIE_ID = 10;

UPDATE movies
SET RATE_ID = "R000000003"
WHERE MOVIE_ID = 11;

UPDATE movies
SET RATE_ID = "R000000004"
WHERE MOVIE_ID = 12;

UPDATE movies
SET RATE_ID = "R000000005"
WHERE MOVIE_ID = 13;

UPDATE movies
SET RATE_ID = "R000000006"
WHERE MOVIE_ID = 14;

UPDATE movies
SET RATE_ID = "R000000007"
WHERE MOVIE_ID = 15;

UPDATE movies
SET RATE_ID = "R000000008"
WHERE MOVIE_ID = 16;


SELECT * FROM movies;