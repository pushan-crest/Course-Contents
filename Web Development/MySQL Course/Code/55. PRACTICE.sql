-- MANY TO MANY RELATIONSHIPS
CREATE DATABASE TV_SHOW; USE TV_SHOW;
CREATE TABLE REVIEWERS(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME VARCHAR(50) NOT NULL,
	LAST_NAME VARCHAR(50) NOT NULL
);
CREATE TABLE SERIES(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	TITLE VARCHAR(100),
	RELEASED_YEAR YEAR,
	GENRE VARCHAR(100)
);
CREATE TABLE REVIEWS(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	RATING DECIMAL(2,1),
	SERIES_ID INT,
	REVIEWERS_ID INT, FOREIGN KEY (SERIES_ID) REFERENCES SERIES(ID), FOREIGN KEY (REVIEWERS_ID) REFERENCES REVIEWERS(ID)
); DESC REVIEWS; DESC REVIEWERS; DESC SERIES;
INSERT INTO series (title, released_year, genre) VALUES
 ('Archer', 2009, 'Animation'),
 ('Arrested Development', 2003, 'Comedy'),
 ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks AND Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt AND Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
    
    
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
    
INSERT INTO reviews(series_id, reviewers_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);


SELECT * FROM SERIES;
SELECT * FROM REVIEWS;
SELECT * FROM REVIEWERS;

-- ---------------------------------------------------

-- SELECT TITLE AND RATING
SELECT TITLE, AVG(RATING) AS AVG_RATING 
FROM SERIES
JOIN REVIEWS ON REVIEWS.SERIES_ID = SERIES.ID
GROUP BY TITLE
ORDER BY AVG_RATING;


-- ---------------------------------------------------

-- MATH FUNCTION - ROUND()

-- ROUND(NUMBER, DIGIT)
SELECT TITLE, ROUND(AVG(RATING),1) AS AVG_RATING 
FROM SERIES
JOIN REVIEWS ON REVIEWS.SERIES_ID = SERIES.ID
GROUP BY TITLE
ORDER BY AVG_RATING;


-- ---------------------------------------------------

SELECT FIRST_NAME,LAST_NAME, RATING 
FROM REVIEWERS
JOIN REVIEWS 
ON REVIEWS.REVIEWERS_ID = REVIEWERS.ID;

-- ---------------------------------------------------

-- ER USE LEFT JOIN BCOZ IT WILL PROVIDE US THE FIELDS WITH NULL REVIEWS
SELECT TITLE, RATING FROM SERIES
LEFT JOIN REVIEWS ON REVIEWS.SERIES_ID = SERIES.ID
WHERE RATING IS NULL;

-- ---------------------------------------------------

SELECT GENRE, AVG(RATING) AS AVG_RATING
FROM SERIES
JOIN REVIEWS ON REVIEWS.SERIES_ID = SERIES.ID
GROUP BY GENRE;

-- ---------------------------------------------------

SELECT FIRST_NAME, LAST_NAME, COUNT(RATING), IFNULL(MIN(RATING),0), IFNULL(MAX(RATING),0),IFNULL(ROUND(AVG(RATING),1),0),  
CASE
WHEN COUNT(RATING) >= 10 THEN 'POWER USER'
	WHEN COUNT(RATING) > 0 THEN 'ACTIVE' 
	ELSE 'PASSIVE'
END AS STATUS
FROM REVIEWERS 
LEFT JOIN REVIEWS ON REVIEWS.REVIEWERS_ID = REVIEWERS.ID
GROUP BY FIRST_NAME, LAST_NAME;


-- ---------------------------------------------------

SELECT TITLE, RATING, CONCAT(FIRST_NAME,' ', LAST_NAME) AS REVIEWER FROM REVIEWS 
JOIN SERIES ON SERIES.ID = REVIEWS.SERIES_ID
JOIN REVIEWERS ON REVIEWERS.ID = REVIEWS.REVIEWERS_ID
ORDER BY TITLE;


