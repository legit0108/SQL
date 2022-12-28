-- Solution - 1 : OR chaining

SELECT DISTINCT(CITY) FROM STATION WHERE 
CITY LIKE 'a%' OR 
CITY LIKE 'e%' OR 
CITY LIKE 'i%' OR 
CITY LIKE 'o%' OR 
CITY LIKE 'u%';  

-- Solution - 2 : Extract first character using SUBSTR

SELECT DISTINCT(CITY) FROM STATION WHERE SUBSTR(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u');

