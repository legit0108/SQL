-- Solution-1: Using CASE

SELECT CASE
         WHEN A+B>C AND B+C>A AND A+C>B THEN
           CASE  
             WHEN A=B AND B=C THEN 'Equilateral'
             WHEN A=B OR B=C OR C=A THEN 'Isosceles'
             ELSE 'Scalene'
           END 
         ELSE 'Not A Triangle'
       END
FROM TRIANGLES;
         

-- Solution-2: Using IF()

SELECT
  IF(A+B>C AND B+C>A AND C+A>B, 
    IF(A=B AND B=C, 'Equilateral', 
    IF(A=B OR B=C OR C=A, 'Isosceles','Scalene')),
    'Not A Triangle')
FROM TRIANGLES;
         
        