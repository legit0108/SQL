-- Solution-1: Without sorting, check row by row

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.

     SELECT DISTINCT(SALARY) FROM EMPLOYEE AS EMP1
     WHERE N-1 = (
        SELECT COUNT(DISTINCT(SALARY)) FROM EMPLOYEE AS EMP2
        WHERE EMP2.SALARY > EMP1.SALARY
     )
  );
END


-- Solution-2: Sorting + LIMIT + OFFSET

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N-1; -- LIMIT cannot recognize expression with arithmetic operators, so cannot use N-1 in OFFSET (error) 
  
  RETURN (
      # Write your MySQL query statement below.
      
      SELECT DISTINCT(SALARY) FROM EMPLOYEE ORDER BY SALARY DESC LIMIT 1 OFFSET N -- return first record after skipping N-1 records
  );
END
