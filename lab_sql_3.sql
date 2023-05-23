use sakila;
-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS "different_last_names"
FROM actor;

-- 2. In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT COUNT(DISTINCT language_id) as "original_language"
FROM film;

-- or but then it shows 0
SELECT COUNT(DISTINCT original_language_id) as "original_language"
FROM film;

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(*) AS PG13_rating
FROM film
WHERE rating = "PG-13";

-- 4. Get 10 the longest movies from 2006.
SELECT title, length
FROM film
WHERE release_year = 2006
ORDER BY length DESC
LIMIT 10;

-- 5. How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(last_update), MIN(rental_date)) AS "operating"
FROM rental;

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT rental_id, rental_date, MONTH(rental_date) AS month, DAYNAME(rental_date) AS weekday
FROM rental
LIMIT 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, rental_date, MONTH(rental_date) AS month, DAYNAME(rental_date) AS weekday,
CASE
WHEN DAYNAME(rental_date) IN (5,6) THEN 'weekend'
ELSE 'workday'
END AS day_type
FROM rental
LIMIT 20;

-- 8. How many rentals were in the last month of activity?
SELECT COUNT(*) AS rental_count
FROM rental
WHERE MONTH(rental_date) IN (6);

