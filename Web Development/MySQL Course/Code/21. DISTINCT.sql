SELECT 
    *
FROM
    BOOKS;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT 
    *
FROM
    BOOKS; -- RETURNS 19 ROWS
    
-- ----------------------------------------------------------------

-- DISTINCT KEYWORD
-- IT FINDS ALL THE UNIQUE FIELDS
SELECT DISTINCT AUTHOR_LNAME FROM BOOKS;  -- REUTURNS 11 ROWS
    
-- IF WE WANT TO FIND UNIQUE AUTHOR NAMES
SELECT DISTINCT CONCAT(AUTHOR_FNAME, ' ', AUTHOR_LNAME) FROM BOOKS; -- 12 ROWS

-- WE CAN ASLO USE DIRECTLY BCOZ DISTINCT IS APPLIED TO ALL THE INNER FIELDS AS THESE COMBINATION IS DISTINCT
SELECT DISTINCT AUTHOR_FNAME, AUTHOR_LNAME FROM BOOKS; -- 12 ROWS

