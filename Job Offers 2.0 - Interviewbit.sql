/* 
 Soln-1: Using join
*/

SELECT SUM(DISTINCT(SALARY)) as Salary FROM 
Students JOIN Departments 
ON Students.DepartmentId = Departments.DepartmentId
JOIN Jobs
ON Students.Id = Jobs.Id
WHERE DepartmentName="CSE"
ORDER BY DepartmentName;


/*
 Soln-2: Without join, using nested queries
 Note: The EXISTS operator returns TRUE if the subquery returns one or more records
*/

SELECT SUM(DISTINCT(Salary)) AS Salary FROM Jobs 
WHERE Id IN (
SELECT Id FROM Students 
   WHERE EXISTS (
      SELECT DepartmentId from Departments 
      WHERE Departments.DepartmentId = Students.DepartmentId
      AND DepartmentName="CSE"
   )
);
