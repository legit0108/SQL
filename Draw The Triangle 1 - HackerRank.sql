-- Solution-1: Using INFORMATION_SCHEMA.TABLES

-- Important points: 

-- User-defined variables are prefixed with @ in MySQL
-- Instead of INFORMATION_SCHEMA.TABLES, we can use any table with 20 rows
-- Use LIMIT 20 to avoid white space
-- Since select requires a table, we are using INFORMATION_SCHEMA.TABLES as a dummy table
-- INFORMATION_SCHEMA
-- -> Database to store information about all other databases that the MySQL server maintains
-- -> TABLES table provides information about tables in the databases

SET @NUMBER = 21;
SELECT REPEAT('* ', @NUMBER := @NUMBER-1) FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;


-----X-----X-----X-----X-----X-----X-----X-----


-- Solution-2: Using loops

-- WHILE loop:

CREATE TABLE RESULT(STR VARCHAR(50));

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
   WHILE count >= 1 DO
      INSERT INTO RESULT(STR) VALUES (REPEAT('* ', count));
      SET count := count - 1;
   END WHILE;
END //
DELIMITER ;

CALL drawTriangle(20);

SELECT * FROM RESULT;

-- LOOP statement: 

CREATE TABLE RESULT(STR VARCHAR(50)); 

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
PRINT: LOOP
    IF count = 0 THEN LEAVE PRINT;
    END IF;
    INSERT INTO RESULT(STR) VALUES(REPEAT("* ", COUNT));
    SET count := count - 1;
   END LOOP;
END //
DELIMITER ;

CALL drawTriangle(20);

SELECT * FROM RESULT;

-- REPEAT UNTIL: 

CREATE TABLE RESULT(STR VARCHAR(50));

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
   REPEAT
    INSERT INTO RESULT(STR) VALUES (REPEAT('* ', count));
    SET count := count - 1;
   UNTIL COUNT = 0
   END REPEAT;
END //
DELIMITER ;

CALL drawTriangle(20);

SELECT * FROM RESULT;


-----X-----X-----X-----X-----X-----X-----X-----


-- Solution-3: Recursion

WITH RECURSIVE PRINT(N) AS
(
 SELECT 20
 UNION
 SELECT N-1 FROM PRINT WHERE N>1
)

SELECT REPEAT('* ', N) FROM PRINT;