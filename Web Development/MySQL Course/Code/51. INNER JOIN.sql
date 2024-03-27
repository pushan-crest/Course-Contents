SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

-- CROSS JOIN || CARTISIAN JOIN
-- THIS IS NOT USED BCOZ IT JUST TAKES EVERY ENTRY OF FIRST TABLE WITH EACH ENTRY OF OTHER TABLE


SELECT *
FROM customers
INNER JOIN orders
ON orders.customer_id = customers.id;

-- inner join can also implemented in reverse manner

SELECT *
FROM orders
INNER JOIN customers
ON customers.id = ORDERS.customer_id

-- we dont specify the type of join bcoz by default it is inner join