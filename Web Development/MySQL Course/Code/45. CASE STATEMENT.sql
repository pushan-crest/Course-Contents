/*
The CASE expression goes through conditions and returns a value when the first condition is met (like an if-then-else statement). So, once a condition is true, it will stop reading and return the result. If no conditions are true, it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.
*/


-- CASE
--     WHEN condition1 THEN result1
--     WHEN condition2 THEN result2
--     WHEN conditionN THEN resultN
--     ELSE result
-- END;


USE BOOK_STORE; SHOW TABLES;
SELECT
	*
FROM
	books; 
	
	
-- MAKE A NEW FIELD NAMED GENERE WHERE IF THE BOOK IS RELEASED AFTER 2000 IT IS CALLED 'MODERN LIT' ELSE IT IS CALLED '20TH CENTURY LIT'
SELECT
	TITLE,
	RELEASED_YEAR, CASE 
	WHEN RELEASED_YEAR > 2000 THEN 'MODERN LIT' 
	ELSE '20TH CENTURY LIT' 
	END AS GENERE
FROM
	books;
	
	
-- WHEN STOCK BETWEEN 0 AND 50 DO '*' THEN BETWEEN 50 TO 100 DO '**' AND ELSE DO '***'
SELECT 
	TITLE,
	STOCK_QUANTITY,
	CASE WHEN STOCK_QUANTITY BETWEEN 0 AND 50 THEN '*'
	WHEN STOCK_QUANTITY BETWEEN 51 AND 100 THEN '**'
	ELSE '***'
	END AS STOCK
FROM books;