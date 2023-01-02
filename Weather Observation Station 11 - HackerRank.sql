-- Solution-1: Using AND, OR

SELECT DISTINCT(CITY) FROM STATION WHERE(
-- Do not start with vowels

(CITY NOT LIKE 'a%' AND
 CITY NOT LIKE 'e%' AND
 CITY NOT LIKE 'i%' AND
 CITY NOT LIKE 'o%' AND
 CITY NOT LIKE 'u%')
 OR
-- Do not end with vowels

(CITY NOT LIKE '%a' AND
 CITY NOT LIKE '%e' AND
 CITY NOT LIKE '%i' AND
 CITY NOT LIKE '%o' AND
 CITY NOT LIKE '%u'));


-- Solution-2: Using SUBSTR

SELECT DISTINCT(CITY) FROM STATION WHERE
SUBSTR(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR
SUBSTR(CITY, LENGTH(CITY), LENGTH(CITY)) NOT IN ('a', 'e', 'i', 'o', 'u');


-- Solution-3: Using LEFT, RIGHT

SELECT DISTINCT(CITY) FROM STATION WHERE 
LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR
RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');