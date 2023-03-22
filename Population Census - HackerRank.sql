-- Using INNER JOIN

SELECT SUM(CITY.POPULATION) FROM CITY INNER JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE WHERE COUNTRY.CONTINENT = 'ASIA';


-- Without INNER JOIN

SELECT SUM(POPULATION) FROM CITY WHERE COUNTRYCODE IN(
 SELECT CODE FROM COUNTRY WHERE CONTINENT = 'Asia'
);