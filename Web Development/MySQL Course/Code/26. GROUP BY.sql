-- GROUP BY CLAUSE
SELECT * FROM books;

-- IT WILL GROUP SIMILAR ENTRIES

-- FIND ALL AUTHORS AND THE NUMBER OF BOOKS THEY PUBLISHED
SELECT AUTHOR_LNAME, COUNT(*) FROM books GROUP BY AUTHOR_LNAME;

-- FIND ALL AUTHORS AND THE NUMBER OF BOOKS THEY PUBLISHED GOUPUP BY SOECIFIC YEAR
SELECT RELEASED_YEAR, COUNT(*) FROM books GROUP BY RELEASED_YEAR ORDER BY 2 DESC;


-- GROUP BY clause is used with the SELECT statement.
-- In the query, the GROUP BY clause is placed after the WHERE clause.
-- In the query, the GROUP BY clause is placed before the ORDER BY clause if used.
-- In the query, the Group BY clause is placed before the Having clause.
-- Place condition in the having clause.