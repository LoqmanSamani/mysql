USE MovieBank;


-- 1) Retrieve all movie titles released after the year 2020.
SELECT * FROM movies;

SELECT MOVIE_TITLE FROM movies
AS RELEASED_AFTER_2020
WHERE RELEASE_DATE > 2020;



-- 2) List the names of actors who have participated in more than three movies.

SELECT * FROM movie_actor;

SELECT DISTINCT CONCAT(FIRST_NAME, " ", LAST_NAME)
AS ACTORS FROM actors
JOIN movie_actor ON actors.ACTOR_ID = movie_actor.ACTOR_ID
GROUP BY actors.ACTOR_ID
HAVING COUNT(movie_actor.ACTOR_ID) > 3;




-- 3) Find the total number of movies in each genre. Display the genre name and the corresponding count.


SELECT *  FROM genres;
SELECT * FROM movies;

SELECT genres.GENRE_NAME, COUNT(movies.GENRE_ID)
AS GENRE_COUNT FROM genres
JOIN movies ON genres.GENRE_ID = movies.GENRE_ID
GROUP BY genres.GENRE_NAME;



-- 4) Retrieve the top 5 movies with the highest ratings. Include the movie title and its rating.


SELECT * FROM rates;
SELECT * FROM movies;

SELECT movies.MOVIE_TITLE, rates.RATE FROM movies
JOIN rates ON movies.MOVIE_ID = rates.MOVIE_ID
ORDER BY RATE DESC
LIMIT 5;



-- 5) Find the average duration of movies directed by each director. Display the director's name and the average duration.

SELECT * FROM movies;
SELECT * FROM directors;

SELECT CONCAT(directors.FIRST_NAME, " ", directors.LAST_NAME)
AS DIRECTOR_NAME, AVG(movies.DURATION) AS AVG_DURATION
FROM directors
JOIN movies ON directors.DIRECTOR_ID = movies.DIRECTOR_ID
GROUP BY directors.DIRECTOR_ID;




-- 6) List the actors who have not participated in any movie.

SELECT CONCAT(actors.FIRST_NAME, " ", actors.LAST_NAME) AS ACTOR
FROM actors
LEFT JOIN movie_actor ON actors.ACTOR_ID = movie_actor.ACTOR_ID
WHERE movie_actor.MOVIE_ID IS NULL;

