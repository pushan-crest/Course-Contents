CREATE DATABASE BOOK_STORE;

USE BOOK_STORE;

CREATE TABLE books (
    book_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(100),
    author_fname VARCHAR(100),
    author_lname VARCHAR(100),
    released_year INT,
    stock_quantity INT,
    pages INT,
    PRIMARY KEY (book_id)
);

DESC BOOKS;

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT 
    *
FROM
    BOOKS;


-- -------------------------------------------------

-- CONCAT FUNCTION - TO CONCAT MULTIPLE STRING
SELECT CONCAT('ABC', 'DEF');

-- CONCATINATING FIRST NAME AND LAST NAME AND NAME IT AS FULLNAME
SELECT 
    CONCAT(author_fname, ' ', author_lname) AS AUTHOR_NAME
FROM
    BOOKS;

-- CONCAT_WS
-- IT IS CONCAT WITH SEPERATOR
SELECT CONCAT_WS(' - ', 'ABC', 'PQR');

SELECT 
    CONCAT_WS('-', title, author_fname, author_lname)
FROM
    BOOKS;

-- ------------------------------------------------------------------

SELECT SUBSTRING('HELLO!!! NAMASKAR', 10, 8);

-- IF WE DONT PROVIDE THE LENGTH IT WILL ASSUME TILL THE END
SELECT SUBSTRING('HELLO!!! NAMASKAR', 10);

-- WE CAN USE NEGATIVE NUMBERS AS STARTING INDEX
SELECT SUBSTRING('HELLO!!! NAMASKAR', - 3);


-- WE CAN USE SUBSTR() INSTEAD OF SUBSTRING() AS THEY ARE THE SAME
SELECT 
    SUBSTRING(author_lname, 1, 1), AUTHOR_LNAME
FROM
    BOOKS;

-- --------------------------------------------------------

-- CONCAT() - JOINS MULTIPLE STRING
SELECT 
    CONCAT(SUBSTRING(TITLE, 1, 10), '...') AS SHORT_TITLE
FROM
    BOOKS;

-- PRINT THE INITIALS OF THE AUTHOR
SELECT 
    CONCAT_WS('.',
            SUBSTRING(AUTHOR_FNAME, 1, 1),
            SUBSTRING(AUTHOR_LNAME, 1, 1)) AS INITIALS,
    AUTHOR_FNAME,
    AUTHOR_LNAME
FROM
    BOOKS;

-- ---------------------------------------------------

-- REPLACE()
-- THIS METHOD DOESNT REPLACE THE DATA IN THE TABLE BUT REPLACES THE DATA THAT IS FETCHED FROM THE TABLE
-- REPLACE ('STRING' , 'STRING WE WANT TO REPLACE', 'STRING WE WANT TO REPLACE IT WITH');

SELECT REPLACE('THIS IS A NICE COURSE' , 'NICE', 'WONDERFULL');

-- THE ARGUMENTS TO THE FUNCTIONS ARE CASE SENSITIVE SO WE CANNOT CHANGE THE CASE AS INPUT TO THE FUNCTION
SELECT REPLACE(TITLE, ' ', '-' ) FROM BOOKS;

-- ---------------------------------------------------------------

-- REVERSE()
-- IT SIMPLY REVERSES THE STRING PROVIDED AS ARGUEMENT

-- MAKING PLAINDEROME FROM EVERY AUTHOR'S FIRST NAME 
SELECT 
    CONCAT(AUTHOR_FNAME, REVERSE(AUTHOR_FNAME)) AS PALINDROME
FROM
    BOOKS;

-- ----------------------------------------------------------

-- CHAR_LENGTH() - THIS FUNCTION RETURN THE LENGTH OF THE STRING
SELECT CHAR_LENGTH('HELLO WORLD');

-- LENGTH() - THIS RETURNS THE SIZE OF STRING
SELECT LENGTH('HELLO'); -- 6 BCOZ 1 CHAR == 1 BYTE
SELECT LENGTH('हिन्दी'); -- 18 BCOZ HINDI LETTER TAKE MORE BYTES

-- -------------------------------------------------------------

-- UCASE() OR UPPER() - CONVERT TO UPPERCASE
SELECT UCASE('jksbnkjdfbsdjkbf');
SELECT UPPER('jksbnkjdfbsdjkbf');

-- LCASE() OR LOWER() - CONVERT TO  LOWERCASE
SELECT LCASE('SDJKFGAJKFNSDJKGB');
SELECT LOWER('SDJKFGAJKFNSDJKGB');

-- 'I LOVE' + TITLE + ' !!!'
SELECT 
    CONCAT('I LOVE ', UPPER(TITLE), ' !!!') AS STRINGS
FROM
    BOOKS;

-- -------------------------------------------------------------

-- INSERT() - INSERT A STRING INTO OTHER STRING
-- INSERT('STRING', START_INDEX, LENGTH, 'NEW_STRING')
SELECT INSERT('HELLO WORLD', 7, 3, 'NEW');

-- ------------------------------------------------------------

-- LEFT() - SELECT LEFT MOST CHARACTEWR FROM THE STRING
SELECT LEFT('HELLO WORLD',4);

-- RIGHT() - SELECT RIGHT MOST CHARACTEWR FROM THE STRING
SELECT RIGHT('HELLO WORLD',4);

-- --------------------------------------------------------------

-- REPEAR('STRING', X) - REPEAT THE STRING X NUMBER OF TIMES
SELECT REPEAT('HA',4);

-- --------------------------------------------------------------
T
-- TRIM( [ {BOTH | LEADING | TRAILING} [remstr] FROM str) 
SELECT TRIM(LEADING '.' FROM '................HELLO');
SELECT TRIM(TRAILING '.' FROM 'HELLO...................');
SELECT TRIM('.' FROM '................HELLO....................');