-- Perform two joins, one to get package of student and another to 
-- get package of friend

SELECT Students.Name FROM 
Students JOIN Friends 
ON Students.ID = Friends.ID
JOIN Packages AS Package_Student
ON Students.ID = Package_Student.ID
JOIN Packages AS Package_Friend
ON Friends.Friend_ID = Package_Friend.ID
WHERE Package_Friend.Salary > Package_Student.Salary
ORDER BY Package_Friend.Salary;