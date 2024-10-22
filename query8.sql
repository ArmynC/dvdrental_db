SELECT customer_id,
CASE
    WHEN (customer_id <= 100) THEN 'Premium'
    WHEN (customer_id BETWEEN 100 and 200) THEN 'Plus'
    ELSE 'Normal'
END AS customer_class
FROM customer;

SELECT customer_id,
CASE customer_id
    WHEN 2 THEN 'Winner'
    WHEN 5 THEN 'Second PLace'
    ELSE 'Normal'
END AS raffle_results
FROM customer;

SELECT
SUM(CASE rental_rate
    WHEN 0.99 THEN 1
    ELSE 0
END) AS bargains,
SUM(CASE rental_rate
    WHEN 2.99 THEN 1
    ELSE 0
END) AS regular,
    SUM(CASE rental_rate
    WHEN 4.99 THEN 1
    ELSE 0
END) AS premium
FROM film;

SELECT
SUM(CASE rating
    WHEN 'R' THEN 1
    ELSE 0
END) AS r,
SUM(CASE rating
    WHEN 'PG' THEN 1
    ELSE 0
END) AS pg,
SUM(CASE rating
    WHEN 'PG-13' THEN 1
    ELSE 0
END) AS pg13
FROM film;

SELECT CAST('5' AS INTEGER) as new_int;
SELECT CAST('five' AS INTEGER); --invalid
SELECT '5'::INTEGER;

SELECT CAST(inventory_id AS VARCHAR) FROM rental;
SELECT CHAR_LENGTH(inventory_id) FROM rental; --invalid
SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR)) FROM rental;

-- learning_host
CREATE TABLE depts(
    first_name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO depts(
    first_name,
    department
)
VALUES
('Vinton','A'),
('Lauren','A'),
('Claire','B');

SELECT * FROM depts;

SELECT (
SUM(CASE WHEN department = 'A' THEN 1 ELSE 0 END)/
NULLIF(SUM(CASE WHEN department = 'B' THEN 1 ELSE 0 END),0)
) AS department_ratio
FROM depts;

DELETE FROM depts
WHERE department = 'B';
SELECT * FROM depts;
--

CREATE VIEW customer_info AS
SELECT first_name,last_name,address FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

CREATE OR REPLACE VIEW customer_info AS
SELECT first_name,last_name,address,district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

ALTER VIEW customer_info RENAME to c_info;

SELECT * FROM c_info;

DROP VIEW c_info;