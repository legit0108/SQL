-- Solution-1: Using SUBSTR

SELECT NAME FROM STUDENTS WHERE MARKS>75 ORDER BY SUBSTR(NAME, -3), ID;


-- Solution-2: Using RIGHT

SELECT NAME FROM STUDENTS WHERE MARKS>75 ORDER BY RIGHT(NAME, 3), ID;