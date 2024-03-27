--  a view is a virtual table based on the result-set of an SQL statement.
-- A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.
-- A view is created with the CREATE VIEW statement. 


CREATE VIEW COMBINED AS
SELECT * FROM REVIEWS 
JOIN SERIES ON SERIES.ID = REVIEWS.SERIES_ID
JOIN REVIEWERS ON REVIEWERS.ID = REVIEWS.REVIEWERS_ID;

-- THIS WILL CREATE A VIRTUAL TABLE CALLED COMBINED THAT CAN BE USED AFTER WORDS

SHOW TABLES;

SELECT * FROM COMBINED;

-- WE CANNOT PERFORM TABLE OPERATIONS ON THE VIEWS AS THEY ARE CREATED VIRTUALLY

-- WE CAN CREATE A INSERTABLE, UPDATABLE, DELETBALE VIEW IF WE DONT USE AGGRIFATE FUNUCTION, ORDERBYU, JOIN,......

-- EXAMPLE
CREATE VIEW SIMPLE_VIEW AS 
SELECT * FROM SERIES;


-- ----------------------------------------------------------------------------------------------
-- 
-- For a view to be updatable, there must be a one-to-one relationship between the rows in the view and the rows in the underlying table. There are also certain other constructs that make a view nonupdatable. To be more specific, a view is not updatable if it contains any of the following:
-- 
-- Aggregate functions or window functions (SUM(), MIN(), MAX(), COUNT(), and so forth)
-- 
-- DISTINCT
-- 
-- GROUP BY
-- 
-- HAVING
-- 
-- UNION or UNION ALL
-- 
-- Subquery in the select list
-- 
-- Nondependent subqueries in the select list fail for INSERT, but are okay for UPDATE, DELETE. For dependent subqueries in the select list, no data change statements are permitted.
-- 
-- Certain joins (see additional join discussion later in this section)
-- 
-- Reference to nonupdatable view in the FROM clause
-- 
-- Subquery in the WHERE clause that refers to a table in the FROM clause
-- 
-- Refers only to literal values (in this case, there is no underlying table to update)
-- 
-- ALGORITHM = TEMPTABLE (use of a temporary table always makes a view nonupdatable)
-- 
-- Multiple references to any column of a base table (fails for INSERT, okay for UPDATE, DELETE)

-- ---------------------------------------------------------------------------------------

SELECT * FROM REVIEWS;
SELECT * FROM REVIEWERS;
SELECT * FROM SERIES;



-- CREATING OR REPLACING VIEW
CREATE VIEW GENRE_TABLE AS
SELECT * FROM SERIES ORDER BY GENRE;

SELECT * FROM GENRE_TABLE;

-- CREATE VIEW OR IF VIEW EXIST THEN UPDATE THE VIEW
CREATE OR REPLACE VIEW GENRE_TABLE AS 
SELECT * FROM SERIES ORDER BY GENRE DESC;

SELECT * FROM GENRE_TABLE;

-- ALTER VIEW 
ALTER VIEW GENRE_TABLE AS
SELECT * FROM REVIEWS ORDER BY RATING;

SELECT * FROM GENRE_TABLE;
