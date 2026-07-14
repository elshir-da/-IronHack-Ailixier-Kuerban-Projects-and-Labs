USE sakila;

SHOW FULL TABLES;

SELECT COUNT(*) FROM film;

SELECT COUNT(*) FROM film_text;

SELECT *
FROM actor;

SELECT *
FROM film;

SELECT *
FROM customer;

SELECT title
FROM film;

SELECT name AS language
FROM language;

SELECT first_name
FROM staff;

SELECT release_year
FROM film;

SELECT COUNT(*) AS number_of_stores
FROM store;

SELECT COUNT(*) AS number_of_employees
FROM staff;

SELECT 
    (SELECT COUNT(*) FROM inventory) AS available_films_total,
    (SELECT COUNT(*) FROM rental) AS films_rented_total;
    
SELECT DISTINCT last_name
FROM actor;

SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

SELECT *
FROM actor
WHERE first_name = 'SCARLETT';

SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%'
  AND length > 100;