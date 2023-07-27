/* YOUR QUERY GOES HERE
   Example: SELECT * FROM EMPLOYEE; 
*/

SELECT CONCAT(Students.Name, ",", Date) AS Offers FROM
Students JOIN Departments
ON Students.DepartmentId = Departments.DepartmentId
INNER JOIN Jobs
ON Students.Id = Jobs.Id
ORDER BY Departments.DepartmentName;