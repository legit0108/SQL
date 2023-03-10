-- Use MAX and MIN aggregate functions

SELECT ROUND(((MAX(LONG_W) - MIN(LONG_W)) + (MAX(LAT_N) - MIN(LAT_N))), 4) 
AS MANHATTAN_DISTANCE 
FROM STATION;  