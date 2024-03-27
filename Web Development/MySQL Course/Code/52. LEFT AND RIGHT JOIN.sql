USE SHOPPING;

SELECT * FROM CUSTOMERS;
SELECT * FROM orders;

-- LEFT JOIN

-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
-- The result is 0 records from the right side, if there is no match.

SELECT * FROM customers
LEFT JOIN orders ON orders.customer_id = customers.id;

-- THE LEFT SIDE WILL BE THE FROM TABLE ADN RIGHT SIDE WILL BE THE JOIN TABLE


-- RIGHT JOIN

-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records from the left table (table1). 
-- The result is 0 records from the left side, if there is no match.

SELECT * FROM customers
RIGHT JOIN orders ON orders.customer_id = customers.id;

