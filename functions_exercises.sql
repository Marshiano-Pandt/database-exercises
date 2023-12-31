SHOW databases;

USE employees;
SELECT database();
SHOW tables;

SELECT * FROM employees;

SELECT CONCAT ( first_name,' ',   last_name)
FROM employees
WHERE last_name like '%E'
AND last_name like 'E%'
;

SELECT UPPER(CONCAT( first_name,' ',  last_name))
FROM employees
WHERE last_name like '%E'
AND last_name like 'E%'
;

SELECT COUNT(UPPER(CONCAT( first_name, last_name)))
FROM employees
WHERE last_name like '%E'
AND last_name like 'E%'
;


SELECT *, now(), datediff(now(), hire_date)
FROM employees
WHERE birth_date like '%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'

;


USE employees;
SELECT database();

SHOW tables; 

SELECT *
FROM salaries;

SELECT MIN(salary), MAX(salary)
FROM salaries;



USE employees;
SELECT database();
SHOW tables;

SELECT * FROM employees;


SELECT 
*,  LOWER(CONCAT(
 SUBSTR(first_name, 1, 1), 
 SUBSTR(last_name,1, 4),
 ' ' ,
 SUBSTR(birth_date, 6, 2), 
 SUBSTR(birth_date, 3, 2))) as username,
 first_name, 
 last_name, 
 birth_date
 FROM employees;




/*

# You may choose to copy the order by exercises and save it as functions_exercises.sql,
  to save time as you will be editing the queries to answer your functions exercises.

# Write a query to find all employees whose last name starts and ends with 'E'. 
  Use concat() to combine their first and last name together as a single column named full_name.
 -- Result Grid: Result 7 

# Convert the names produced in your last query to all uppercase.
-- Result Grid: Result 8

# Use a function to determine how many results were returned from your previous query.
-- 899

# Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have
  been working at the company (Hint: You will also need to use NOW() or CURDATE()),
  -- Result Grid: Result 26

# Find the smallest and largest current salary from the salaries table.
-- Smallest (38623), Largest (158220)

# Use your knowledge of built in SQL functions to generate a username for all of the employees.
  A username should be all lowercase, and consist of the first character of the employees first name, 
  the first 4 characters of the employees last name, an underscore, the month the employee was born, 
  and the last two digits of the year that they were born. Below is an example of what the first 10 rows will look like:
-- Result Grid: Result 48

  
  
  */
  