SHOW ALL;
SHOW TIMEZONE;

SELECT NOW();
SELECT TIMEOFDAY();

SELECT CURRENT_TIME;
SELECT CURRENT_DATE;

SELECT EXTRACT(YEAR FROM payment_date)
AS year
FROM payment;

SELECT EXTRACT(MONTH FROM payment_date)
AS pay_month
FROM payment;

SELECT EXTRACT(QUARTER FROM payment_date)
AS quarter
FROM payment;

SELECT AGE(payment_date)
FROM payment;

SELECT TO_CHAR(payment_date,'MONTH-YYYY')
FROM payment;

SELECT TO_CHAR(payment_date,'YYYY    MONTH')
FROM payment;

SELECT DISTINCT(TO_CHAR(payment_date,'MONTH'))
FROM payment;

SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1;

SELECT ROUND(rental_rate/replacement_cost,4) * 100
AS percent_cost
FROM film;

SELECT 0.1 * replacement_cost
AS depsosit
FROM film;

SELECT LENGTH(first_name) FROM customer;

SELECT upper(first_name) || ' - ' || upper(last_name)
AS full_name
FROM customer;

SELECT LOWER(LEFT(first_name,1)) || LOWER(last_name) || '@gmail.com'
AS custom_email
FROM customer;

SELECT title, rental_rate
FROM film
WHERE rental_rate > (SELECT AVG(rental_rate) FROM film);

SELECT * FROM rental
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30';

SELECT film_id, title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON inventory.inventory_id = rental.inventory_id
WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30')
ORDER BY title;

SELECT first_name, last_name
FROM customer
AS c
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11);

SELECT f1.title, f2.title, f1.length
FROM film AS f1
INNER JOIN film AS f2 ON
f1.film_id != f2.film_id
AND f1.length = f2.length;