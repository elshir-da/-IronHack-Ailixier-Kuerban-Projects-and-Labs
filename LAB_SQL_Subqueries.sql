USE sakila;

SELECT COUNT(inventory.inventory_id) AS number_of_copies
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE film.title = 'Hunchback Impossible';

SELECT title, length
FROM film
WHERE length > (
    SELECT AVG(length) 
    FROM film
)
ORDER BY length DESC;

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM film_actor
    JOIN film ON film_actor.film_id = film.film_id
    WHERE film.title = 'Alone Trip'
);

SELECT film.title
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE category.name = 'Family';

SELECT customer.first_name, customer.last_name, customer.email
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Canada';

SELECT first_name, last_name, email
FROM customer
WHERE address_id IN (
    SELECT address_id FROM address WHERE city_id IN (
	   SELECT city_id FROM city WHERE country_id IN (
		  SELECT country_id FROM country WHERE country = 'Canada'
        )
    )
);

SELECT title
FROM film
WHERE film_id IN (
    SELECT film_id
    FROM film_actor
    WHERE actor_id = (
        SELECT actor_id
        FROM film_actor
        GROUP BY actor_id
        ORDER BY COUNT(film_id) DESC
        LIMIT 1
    )
);

SELECT DISTINCT film.title
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
WHERE rental.customer_id = (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    ORDER BY SUM(amount) DESC
    LIMIT 1
);

SELECT customer_id, SUM(amount) AS total_amount_spent
FROM payment
GROUP BY customer_id
HAVING total_amount_spent > (
    SELECT AVG(total_spent)
    FROM (
        SELECT SUM(amount) AS total_spent
        FROM payment
        GROUP BY customer_id
    ) AS subquery
);