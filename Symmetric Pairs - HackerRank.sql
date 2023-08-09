-- Solution-1: JOIN + GROUP BY + HAVING

SELECT Table1.X, Table1.Y 
FROM Functions as Table1 JOIN Functions as Table2
ON Table1.X=Table2.Y AND Table1.Y = Table2.X
GROUP BY Table1.X, Table1.Y
HAVING COUNT(Table1.X) > 1 
OR Table1.X<Table1.Y
ORDER BY Table1.X;


-- Solution-2: Using WHERE EXISTS

SELECT X, Y FROM Functions AS Table1
WHERE EXISTS (
  SELECT * FROM Functions AS Table2
  WHERE Table1.X = Table2.Y AND Table2.X = Table1.Y
  AND Table1.X < Table1.Y
  AND Table2.X!=Table2.Y
)
UNION
SELECT X, Y FROM Functions AS Table1
WHERE X=Y AND (
  (SELECT COUNT(*) FROM Functions AS Table2
  WHERE Table1.X = Table2.X AND Table1.Y = Table2.Y) > 1
)
ORDER BY X
