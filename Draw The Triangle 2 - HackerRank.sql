-- Solution-1: Using INFORMATION_SCHEMA.TABLES

SET @COUNT:=0;

SELECT REPEAT("* ", @COUNT:=@COUNT+1) 
FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;


-----X-----X-----X-----X-----X-----X-----X-----


-- Solution-2: Using loops

-- WHILE loop: 

CREATE TABLE RESULT(PATTERN VARCHAR(50));

DELIMITER //

CREATE PROCEDURE printPattern(count INT)
 BEGIN
 
  DECLARE iteration INT DEFAULT 1;
  
  WHILE iteration <= count DO
  INSERT INTO RESULT(PATTERN) VALUES(REPEAT("* ", iteration));
  SET iteration := iteration+1;
  END WHILE;
 
 END //

DELIMITER ;

CALL printPattern(20);

SELECT * FROM RESULT;

--LOOP Statement: 

CREATE TABLE RESULT(PATTERN VARCHAR(50));

DELIMITER //

CREATE PROCEDURE printPattern(count INT)
 BEGIN
 
  DECLARE iteration INT DEFAULT 1;
  
  print: LOOP
  
  IF iteration>count THEN LEAVE print;
  END IF;
  INSERT INTO RESULT(PATTERN) VALUES(REPEAT("* ", iteration));
  SET iteration := iteration+1;
  
  END LOOP;
 
 END //

DELIMITER ;

CALL printPattern(20);

SELECT * FROM RESULT;

-- REPEAT UNTIL: 

CREATE TABLE RESULT(PATTERN VARCHAR(50));

DELIMITER //

CREATE PROCEDURE printPattern(count INT)
 BEGIN
 
  DECLARE iteration INT DEFAULT 1;
  
  REPEAT
    INSERT INTO RESULT(PATTERN) VALUES(REPEAT("* ", iteration));
    SET iteration := iteration+1;
  UNTIL iteration>count
  END REPEAT;
 
 END //

DELIMITER ;

CALL printPattern(20);

SELECT * FROM RESULT;


-----X-----X-----X-----X-----X-----X-----X-----


-- Solution-3: Recursion

WITH RECURSIVE print(n) AS
(
 SELECT 1
 UNION
 SELECT n+1 FROM print WHERE n<20
)

SELECT REPEAT("* ", n) FROM print;