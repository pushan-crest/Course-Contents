-- ON DELETE CASCADE

-- IF WE DELETE ONE ENTRY OF THE TABLE THEN IT WONT ALLOW AS THERE IS FOREIGN KEY LINK BETWEEEN THEM. 
-- SO WE NEED TO ADD A CONSTRAINT 'ON DELETE CASCADE' TO FOREIGN KEY

-- INCASE NEEDED
DROP TABLE ORDERS;
DROP TABLE CUSTOMERS;

CREATE TABLE customers (
id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(50),
last_name VARCHAR(50) ,
email VARCHAR(50)
);

CREATE TABLE orders (
id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
amount DECIMAL(8,2),
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
);


INSERT INTO customers (first_name, last_name,email)
VALUES ('Boy' ,'George', 'george@gmail.com'),
( 'George', 'Michael', 'gm@gmail.com'),
( 'David', 'Bowie', 'david@gmail.com'),
('Blue' , 'Steele', 'blue@gmail.com'),
( 'Bette', 'Davis', 'bette@aol.com');



INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016-02-10',99.99,1),
( '2017-11-11',35.50,1),
( '2014-12-12',800.67,2),
('2015-01-03',12.50, 2),
( '1999-04-11', 450.25,5);


SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;


DELETE FROM CUSTOMERS WHERE FIRST_NAME = 'BOY';

-- HERE WE CAN SEE THAT THE CORRESPONDING ORDERS WILL ALSO BE DELETED
SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

