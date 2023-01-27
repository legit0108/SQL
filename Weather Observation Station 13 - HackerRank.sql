-- It is better to use >, < operators than BETWEEN here since BETWEEN includes start and end values

SELECT TRUNCATE(SUM(LAT_N), 4) AS LAT_N_SUM 
FROM STATION 
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;