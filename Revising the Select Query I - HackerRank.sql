-- Solution - 1 : Using AND

SELECT * FROM CITY WHERE COUNTRYCODE='USA' AND POPULATION>100000;

-- Solution - 2 : Using HAVING

SELECT * FROM CITY WHERE COUNTRYCODE='USA' HAVING POPULATION>100000;