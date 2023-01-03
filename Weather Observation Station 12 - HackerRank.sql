-- Solution-1: Using OR

SELECT DISTINCT(CITY) FROM STATION WHERE NOT
(
 -- starting with vowels 
 CITY LIKE 'a%' OR
 CITY LIKE 'e%' OR
 CITY LIKE 'i%' OR
 CITY LIKE 'o%' OR
 CITY LIKE 'u%'
    
 OR
    
 -- ending with vowels 
 CITY LIKE '%a' OR
 CITY LIKE '%e' OR
 CITY LIKE '%i' OR
 CITY LIKE '%o' OR
 CITY LIKE '%u'
);

-- Solution-2: Using SUBSTR

SELECT DISTINCT(CITY) FROM STATION WHERE 
SUBSTR(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND 
SUBSTR(CITY, LENGTH(CITY), LENGTH(CITY)) NOT IN ('a', 'e', 'i', 'o', 'u');

-- Solution-3: Using LEFT, RIGHT

SELECT DISTINCT(CITY) FROM STATION WHERE 
LEFT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
AND 
RIGHT(CITY, 1) NOT IN ('a', 'e', 'i', 'o', 'u');