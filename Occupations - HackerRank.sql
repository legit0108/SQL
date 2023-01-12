-- Solution-1: Without using PIVOT (MySQL)

/*
 FLOW: Raw data -> Partitions (All actors together, singers together) -> Group by row number -> Result obtained

 Partition the table on occupation (partition into window frames)
 OVER() clause includes:
   -> PARTITION BY: Divide row or query result set into small partitions
   -> ORDER BY: Arrange row in ascending or descending order
 MAX or MIN is used because you cannot select directly in group by (can only select group by column or aggregate function in group by)   
*/

SELECT
MIN(IF(OCCUPATION='Doctor', NAME, NULL)) AS Doctor,
MIN(IF(OCCUPATION='Professor', NAME, NULL)) as Professor, 
MIN(IF(OCCUPATION='Singer', NAME, NULL)) as Singer,
MIN(IF(OCCUPATION='Actor', NAME, NULL)) as Actor
FROM
(SELECT NAME, OCCUPATION, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS ROW_NUM FROM OCCUPATIONS) AS SORTED_ORDER GROUP BY ROW_NUM;


-- Solution-2: Using PIVOT (Oracle)

/*
 FLOW: Raw data -> Partitions (All actors together, singers together) -> Pivot -> Result obtained

 The pivot column is the point around which the table will be rotated, 
 and the pivot column values will be transposed into columns in the output table. 
 The IN clause also allows you to specify an alias for each pivot value, 
 making it easy to generate more meaningful column names.

 -> Pivot internally works like group by, so we need to use aggregate functions when printing
 -> Using pivot, we transpose the data
 -> Semicolon required for order by when working in Oracle
*/

SELECT Doctor, Professor, Singer, Actor FROM
(SELECT NAME, OCCUPATION, ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) AS ROW_NUM FROM OCCUPATIONS)
PIVOT
(MAX(NAME) FOR OCCUPATION IN ('Doctor' AS Doctor, 'Professor' AS Professor, 'Singer' AS Singer, 'Actor' AS Actor)) ORDER BY ROW_NUM;