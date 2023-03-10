-- Solution-1: Without sorting

SELECT ROUND(MIN(LAT_N), 4) AS MIN_LAT_N FROM STATION WHERE LAT_N>38.7780;


-- Solution-2: Sort by LAT_N

SELECT ROUND(LAT_N, 4) AS MIN_LAT_N FROM STATION 
WHERE LAT_N > 38.7780
ORDER BY LAT_N LIMIT 1;