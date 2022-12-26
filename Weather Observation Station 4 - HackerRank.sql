-- Solution - 1 : Without GROUP BY 

SELECT COUNT(CITY) - COUNT(DISTINCT(CITY)) FROM STATION;

-- Solution - 2 : Using GROUP BY

SELECT SUM(TEMP) - COUNT(TEMP) FROM (SELECT COUNT(CITY) AS TEMP FROM STATION GROUP BY CITY) AS STATION_TABLE;

-- Inner query returns count of each city grouped by cities
-- Outer query operates on this query as such : it returns sum of result obtained from inner query minus total number of rows in the result, which is same as count of cities minus count of distinct cities

-- Note : You cannot use subqueries inside aggregate functions 
