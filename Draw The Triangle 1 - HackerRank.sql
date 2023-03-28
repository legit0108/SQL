-- Solution-1: Using INFORMATION_SCHEMA.TABLES

-- Important points: 

-- User-defined variables are prefixed with @ in MySQL
-- Instead of INFORMATION_SCHEMA.TABLES, we can use any table with 20 rows
-- Use LIMIT 20 to avoid white space
-- Since select requires a table, we are using INFORMATION_SCHEMA.TABLES as a dummy table
-- INFORMATION_SCHEMA
-- -> Database to store information about all other databased that MySQL server maintains
-- -> TABLES table provides information about tables in the databases

SET @NUMBER = 21;
SELECT REPEAT('* ', @NUMBER := @NUMBER-1) FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;


-----X-----X-----X-----X-----X-----X-----X-----


-- Solution-2: Using loops
-- Run the mysql client with --skip-column-names

-- WHILE loop:

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
   WHILE count >= 1 DO
      SELECT REPEAT('* ', count) AS "";
      SET count := count - 1;
   END WHILE;
END //
DELIMITER ;

CALL drawTriangle(20);


-- LOOP statement: 

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
PRINT: LOOP
    IF count = 0 THEN LEAVE PRINT;
    END IF;
    SELECT REPEAT('* ', count) AS "";
    SET count := count - 1;
   END LOOP;
END //
DELIMITER ;

CALL drawTriangle(20);


-- REPEAT UNTIL: 

DELIMITER //
CREATE PROCEDURE  drawTriangle(count INT)
BEGIN
   REPEAT
    SELECT REPEAT('* ', count) AS "";
    SET count := count - 1;
   UNTIL COUNT = 0
   END REPEAT;
END //
DELIMITER ;

CALL drawTriangle(20);