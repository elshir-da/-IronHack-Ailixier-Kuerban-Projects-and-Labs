USE sakila;

SELECT
     MAX(length) AS max_duration,
     MIN(length) AS min_duration
FROM film;

SELECT
     FLOOR(AVG(length) / 60) AS hours,
     ROUND(AVG(length) % 60) AS minutes
FROM film;

SELECT 
DATEDIFF(MAX(rental_date), MIN(rental_date)) AS number_of_days
FROM rental;

SELECT *,
       MONTHNAME(rental_date) AS rental_month,
       DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT title, IFNULL(rental_duration, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;

SELECT COUNT(*)
FROM film;

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating;

SELECT rating, COUNT(*) AS film_count
FROM film
GROUP BY rating
ORDER BY film_count DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
ORDER BY mean_duration DESC;

SELECT 
    rating, 
    ROUND(AVG(length), 2) AS mean_duration
FROM film
GROUP BY rating
HAVING mean_duration > 120
ORDER BY mean_duration DESC;