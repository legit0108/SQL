-- Median 
--  -> For odd number of records, the middle element is the median
--  -> For even number of records, the average of two middle elements is the median    


-- Solution-1: MySQL, using CASE, OVER()

SELECT
  CASE
    WHEN (SELECT COUNT(LAT_N)%2 FROM STATION) = 0
      THEN
        (SELECT ROUND(
          (SELECT ROUND(LAT_N, 4) FROM(
            SELECT ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS ROW_NUM, LAT_N FROM STATION
          )AS TEMP1 WHERE ROW_NUM = (SELECT COUNT(*)/2 FROM STATION))
          
          +
          
          (SELECT ROUND(LAT_N, 4) FROM(
            SELECT ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS ROW_NUM, LAT_N FROM STATION
          )AS TEMP2 WHERE ROW_NUM = (SELECT 1+COUNT(*)/2 FROM STATION))
          
          /2
      ,4))
    ELSE
        (SELECT ROUND(LAT_N, 4) FROM(
          SELECT ROW_NUMBER() OVER(ORDER BY LAT_N ASC) AS ROW_NUM, LAT_N FROM STATION
        )AS TEMP WHERE ROW_NUM = (SELECT ROUND(COUNT(*)/2) FROM STATION))
  END


-- Solution-2: Oracle, using MEDIAN()

SELECT ROUND(MEDIAN(LAT_N), 4) FROM STATION;
