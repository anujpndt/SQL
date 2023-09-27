use classtest;

#Q1 -- Q1. Find the total number of rows in each table of the schema?
 Select Count(*) AS count from genre;
 Select Count(*) AS count from roles;
 Select Count(*) AS count from movies;
 Select Count(*) AS count from role_mapping;
 Select Count(*) AS count from director mapping;
 Select Count(*) AS count from rating;
 
#Q2 Find the total number of movies released each year? How does the trend look month wise?
SELECT year AS ReleaseYear, COUNT(*) AS MoviesReleased
FROM Movies
GROUP BY year
ORDER BY ReleaseYear;
#b
SELECT Month(date_published) AS month_n, COUNT(*) AS MoviesReleased
FROM Movies
GROUP BY month_n 
ORDER BY month_n;

#Q3  How many movies were produced in the USA or India in the year 2017??
SELECT COUNT(*) as Total_movies
FROM movies
WHERE (country = 'USA' OR country = 'India') AND YEAR = '2017'
group by country;
#Q4 Find the unique list of the genres present in the data set?
Select distinct genre from Genre;
#Q5 .Which genre had the highest number of movies produced overall?
SELECT genre, COUNT(*) AS movie_count
FROM genre
GROUP BY genre
ORDER BY movie_count DESC
LIMIT 1;

#Q6. How many movies belong to only one genre?
SELECT genre, COUNT(*) AS movie_count
FROM genre
GROUP BY genre
 LIMIT 1;
#Q7 What is the average duration of movies in each genre?
with cte as
(
select * from movies left join genre on movies.ï»¿id = genre.ï»¿movie_id
)
select genre, avg(duration) as avg_duration from cte group by genre;
#Q8 What is the rank of the ‘thriller’ genre of movies among all the genres in terms of number of movies produced?
SELECT genre, COUNT(*) AS movie_count,
       RANK() OVER (ORDER BY COUNT(*) DESC) AS genre_rank
FROM genre
GROUP BY genre
HAVING genre = 'thriller';

#Q9 Find the minimum and maximum values in  each column of the ratings table except the movie_id column?
/* Output format:
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
| min_avg_rating|	max_avg_rating	|	min_total_votes   |	max_total_votes 	 |min_median_rating|min_median_rating|
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+
|		0		|			5		|	       177		  |	   2000	    		 |		0	       |	8			 |
+---------------+-------------------+---------------------+----------------------+-----------------+-----------------+*/
SELECT Min(avg_rating)    AS MIN_AVG_RATING,
       Max(avg_rating)    AS MAX_AVG_RATING,
       Min(total_votes)   AS MIN_TOTAL_VOTES,
       Max(total_votes)   AS MAX_TOTAL_VOTES,
       Min(median_rating) AS MIN_MEDIAN_RATING,
       Max(median_rating) AS MAX_MEDIAN_RATING
FROM   rating; 
#Q10  How many movies released in each genre during March 2017 in the USA had more than 1,000 votes?
/* Output format:

+---------------+-------------------+
| genre			|	movie_count		|
+-------------------+----------------
|	thriller	|		105			|
|	.			|		.			|
|	.			|		.			|
+---------------+-------------------+ */
-- Type your code below:

-- Query to find 
-- 1. Number of movies released in each genre 
-- 2. During March 2017 
-- 3. In the USA  (LIKE operator is used for pattern matching)
-- 4. Movies had more than 1,000 votes
SELECT genre,
       Count(M.id) AS MOVIE_COUNT
FROM   movies AS M
       INNER JOIN genre AS G
               ON G.movies_id = M.id
       INNER JOIN rating AS R
               ON R.movies_id = M.id
WHERE  year = 2017
       AND Month(date_published) = 3
       AND country LIKE '%USA%'
       AND total_votes > 1000
GROUP  BY genre
ORDER  BY movie_count DESC; 