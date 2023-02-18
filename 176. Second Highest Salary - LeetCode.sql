-- Solution-1: Using MAX() aggregate function
-- IFNULL check not required since MAX() returns NULL for empty set  

SELECT MAX(SALARY) AS "SecondHighestSalary" FROM EMPLOYEE WHERE SALARY != (SELECT MAX(SALARY) FROM EMPLOYEE);


-- Solution-2: Using ORDER BY + LIMIT + OFFSET (return 1 record after skipping 1 record)
-- IFNULL check required to return NULL in case of empty set 

SELECT 
  IFNULL((SELECT DISTINCT(SALARY) FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 1 OFFSET 1), NULL)
AS "SecondHighestSalary";    
