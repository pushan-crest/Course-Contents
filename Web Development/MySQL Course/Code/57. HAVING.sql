-- HAVING

-- WE CANNOT USE WHERE ON DATA THAT IS GROUPED SO WE NEED TO USE HAVING CLAUSE

-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

/*
SELECT expression1, expression2, ... expression_n,   
aggregate_function (expression)  
FROM tables  
[WHERE conditions]  
GROUP BY expression1, expression2, ... expression_n  
HAVING condition; 
*/

SELECT AVG(RELEASED_YEAR), GENRE FROM SERIES 
GROUP BY GENRE;

SELECT * FROM SERIES;

-- HERE IF WE WANT TO FIND THE  AVG YEAR > 2000 THEN
SELECT AVG(RELEASED_YEAR), GENRE FROM SERIES 
GROUP BY GENRE
HAVING AVG(RELEASED_YEAR) > 2000;