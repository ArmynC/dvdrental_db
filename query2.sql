SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film;

SELECT MAX(replacement_cost), MIN(replacement_cost)
FROM FILM;

SELECT AVG(replacement_cost)
FROM FILM;

SELECT ROUND(AVG(replacement_cost),3)
FROM film;

SELECT SUM(replacement_cost)
FROM film;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount);

SELECT staff_id, customer_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

SELECT (payment_date)::DATE, SUM(amount) FROM payment
GROUP BY (payment_date)::DATE
ORDER BY SUM(amount) DESC;

SELECT staff_id, COUNT(rental_id)
FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost),3)
FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT store_id, COUNT(customer_id)
FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300;

SELECT customer_id, COUNT(rental_id)
FROM payment
GROUP BY customer_id
HAVING COUNT(rental_id) >= 40;

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;

SELECT customer_id
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110;

SELECT COUNT(*) FROM film
WHERE title LIKE 'J%';

SELECT first_name, last_name FROM customer
WHERE first_name LIKE 'E%'
AND customer_id < 500
ORDER BY customer_id DESC
LIMIT 1;