-- DATE AND TIME

-- DATE CAN BE STORED IN THE FORMAT YYYY-MM-DD (SEPERATED BY HYPEN)
-- TIME CAN BE STORED IN THE FORMAT HH:MM:SS (SEPERATRED BY COLONS)
-- WE CAN ALSO STORE NEGATIVE AMOUNT OF TIME

-- DATETIME HAS FORMAT - 'YYYY-MM-DD HH:MM:SS'
CREATE TABLE DATETIMETABLE(
	BIRTHDATE DATE,
	BIRTHTIME TIME,
	COMBINED DATETIME
); DESC DATETIMETABLE;
INSERT INTO DATETIMETABLE VALUES('2000-01-02', '2:21:3','2000-01-02 2:21:3');
SELECT *
FROM datetimetable;

-- ----------------------------------------------------------------------

-- CURDATE() - RETURNS CURRENT DATE
-- CURTIME() - RETURNS CURRENT TIME
-- NOW() - RETURNS CURRENT DATETIME
INSERT INTO DATETIMETABLE VALUES(CURDATE(), CURTIME(), NOW());

-- ----------------------------------------------------------------------

-- functions like DAY(), DAYOFWEEK(), DAYOFMONTH(), DAYOFYEAR()
-- 1 == SUNDAY 
-- 7 == SATURDAY
SELECT BIRTHDATE, DAY(BIRTHDATE), DAYOFWEEK(BIRTHDATE), DAYOFMONTH(BIRTHDATE), DAYOFYEAR(BIRTHDATE)
FROM datetimetable;


-- MONTHNAME() 
SELECT BIRTHDATE,MONTHNAME(BIRTHDATE) FROM datetimetable;

-- YEAR()
SELECT BIRTHDATE,YEAR(BIRTHDATE) FROM datetimetable;

-- --------------------------------------------------------------------

-- TIME FUNCTIONS
SELECT BIRTHTIME, HOUR(BIRTHTIME), MINUTE(BIRTHTIME), SECOND(BIRTHTIME) FROM datetimetable;

-- --------------------------------------------------------------------

-- EXTRACTING DATE AND TIME FROM THE DATETIME FUNCTION
SELECT COMBINED, DATE(COMBINED), TIME(COMBINED) FROM datetimetable;

-- --------------------------------------------------------------------

-- DATE_FORMAT() - Formats the date value according to the format string.
-- DATE_FORMAT('DATE' OR 'DATETIME', ARGUMENTS) 


-- Specifier	Description
-- %a	Abbreviated weekday name (Sun..Sat)
-- %b	Abbreviated month name (Jan..Dec)
-- %c	Month, numeric (0..12)
-- %D	Day of the month with English suffix (0th, 1st, 2nd, 3rd, …)
-- %d	Day of the month, numeric (00..31)
-- %e	Day of the month, numeric (0..31)
-- %f	Microseconds (000000..999999)
-- %H	Hour (00..23)
-- %h	Hour (01..12)
-- %I	Hour (01..12)
-- %i	Minutes, numeric (00..59)
-- %j	Day of year (001..366)
-- %k	Hour (0..23)
-- %l	Hour (1..12)
-- %M	Month name (January..December)
-- %m	Month, numeric (00..12)
-- %p	AM or PM
-- %r	Time, 12-hour (hh:mm:ss followed by AM or PM)
-- %S	Seconds (00..59)
-- %s	Seconds (00..59)
-- %T	Time, 24-hour (hh:mm:ss)
-- %U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
-- %u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
-- %V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
-- %v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
-- %W	Weekday name (Sunday..Saturday)
-- %w	Day of the week (0=Sunday..6=Saturday)
-- %X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
-- %x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
-- %Y	Year, numeric, four digits
-- %y	Year, numeric (two digits)
-- %%	A literal % character
-- %x	x, for any “x” not listed above

SELECT DATE_FORMAT(BIRTHDATE, '%b') FROM datetimetable;
