-- Important points: 

-- User-defined variables are prefixed with @ in MySQL
-- Instead of INFORMATION_SCHEMA.TABLES, we can use any table with 20 rows
-- Use LIMIT 20 to avoid white space
-- Can be also solved using a loop, but loops can only be used in stored procedures (too advanced)
-- Since select requires a table, we are using INFORMATION_SCHEMA.TABLES as a dummy table
-- INFORMATION_SCHEMA
-- -> Database to store information about all other databased that MySQL server maintains
-- -> TABLES table provides information about tables in the databases

SET @NUMBER = 21;
SELECT REPEAT('* ', @NUMBER := @NUMBER-1) FROM INFORMATION_SCHEMA.TABLES
LIMIT 20;