-- Please write a DELETE statement and DO NOT write a SELECT statement.
-- Write your MySQL query statement below


/* 
 Solution-1: Using subquery

 If we are doing an update/insert/delete on a table,
 to refer to that table in the inner query you must create a temporary table to refer to
 else you get an error, this is done to avoid running the inner query on the updated table 
*/

DELETE FROM PERSON 
WHERE ID NOT IN 
(SELECT MIN(ID) FROM 
 (SELECT * FROM PERSON) AS TEMP_PERSON 
GROUP BY EMAIL);


/* 
 Solution-2: Using cross join

 Join the table with itself to obtain a result having PERSON1.EMAIL = PERSON2.EMAIL
AND PERSON1.ID > PERSON2.ID;
 
 Remove all rows of PERSON1 (PERSON1.*) where the above condition is satisfied to obtain minimal id row for an email
*/

DELETE PERSON1.*
FROM PERSON AS PERSON1, PERSON AS PERSON2
WHERE PERSON1.EMAIL = PERSON2.EMAIL
AND PERSON1.ID > PERSON2.ID;