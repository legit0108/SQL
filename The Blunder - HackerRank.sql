-- Use CEIL() to round the result up to the next integer and REPLACE() to replace all the zeros

SELECT CEIL((AVG(SALARY) - AVG(REPLACE(SALARY, '0', '')))) FROM EMPLOYEES; 