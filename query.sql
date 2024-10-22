SELECT first_name, last_name, email FROM customer;

SELECT * FROM film;

SELECT DISTINCT release_year FROM film;
SELECT DISTINCT(rental_rate) FROM film;
SELECT DISTINCT(rating) FROM film;

SELECT COUNT(*) FROM payment;
SELECT COUNT(amount) FROM payment;

SELECT DISTINCT amount FROM payment;
SELECT COUNT(DISTINCT(amount)) FROM payment;

SELECT * FROM customer
WHERE first_name = 'Jared';

SELECT COUNT(title) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating = 'R';

SELECT COUNT(*) FROM film
WHERE rating = 'R' or rating = 'PG-13';

SELECT * FROM film
WHERE rating != 'R';

SELECT email FROM customer
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';

SELECT * FROM customer
ORDER BY first_name DESC;

SELECT store_id, first_name, last_name FROM customer
ORDER by store_id DESC, first_name ASC;

SELECT * FROM payment
WHERE amount != 0.00
ORDER BY payment_date DESC
LIMIT 5;

SELECT customer_id FROM payment
ORDER BY payment_date
LIMIT 10;

SELECT title, length FROM film
ORDER BY length
LIMIT 5;

SELECT COUNT(title) FROM film
WHERE length <= 50;

SELECT * FROM payment
WHERE amount BETWEEN 8 and 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 and 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT * FROM payment
WHERE amount IN(0.99,1.98,1.99);

SELECT * FROM customer
WHERE first_name NOT IN('John','Jake','Julie');

SELECT * FROM customer
WHERE first_name LIKE 'J%' and last_name ILIKE 's%';

SELECT * FROM customer
WHERE first_name  LIKE '%er%';

SELECT * FROM customer
WHERE first_name  LIKE '_er%';

SELECT * FROM customer
WHERE first_name  NOT LIKE '_er%';

SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;

SELECT COUNT(amount) FROM payment
WHERE amount > 5.00;

SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

SELECT COUNT(DISTINCT(district))
FROM address;

SELECT DISTINCT(district) FROM address;

SELECT COUNT(*) FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 and 15;

SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';