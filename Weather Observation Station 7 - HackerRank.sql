-- Solution - 1 : OR chaining

SELECT DISTINCT(CITY) FROM STATION WHERE 
CITY LIKE '%a' OR
CITY LIKE '%e' OR
CITY LIKE '%i' OR
CITY LIKE '%o' OR
CITY LIKE '%u';

-- Solution - 2 : Extract last character using SUBSTR

SELECT DISTINCT(CITY) FROM STATION WHERE SUBSTR(CITY, LENGTH(CITY), LENGTH(CITY)) IN ('a', 'e', 'i', 'o', 'u');

-- Solution - 3 : Extract last character using RIGHT

SELECT DISTINCT(CITY) FROM STATION WHERE RIGHT(CITY, 1) IN ('a', 'e', 'i', 'o', 'u');