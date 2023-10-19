SHOW databases;

USE employees;

SELECT database();

SHOW tables;

SELECT *
FROM titles;

SELECT COUNT(DISTINCT title)
FROM titles;

SHOW databases;

use employees;

SHOW tables;

SELECT * 
FROM employees;

SELECT last_name
FROM employees
WHERE 
	last_name like '%E'
AND last_name like 'E%'    
GROUP BY 
	last_name
;

SELECT first_name, last_name
FROM employees
WHERE 
	last_name like '%E'
AND last_name like 'E%'
GROUP BY 
	first_name, last_name
    ;

SELECT last_name, COUNT(last_name)
FROM employees
WHERE 
	last_name like '%Q%'
AND last_name not like '%QU%'
GROUP BY 
	last_name
    ;

SELECT first_name, gender, COUNT(first_name)
FROM employees
WHERE 
	first_name in ('Irena', 'Vidya', 'Maya')
GROUP BY 
	first_name, gender
ORDER BY first_name
    ;

SELECT 
  LOWER(CONCAT(
 SUBSTR(first_name, 1, 1), 
 SUBSTR(last_name,1, 4),
 ' ' ,
 SUBSTR(birth_date, 6, 2), 
 SUBSTR(birth_date, 3, 2))) as username,
 COUNT(*) as cnt
 FROM employees
 GROUP BY username
 ;

SELECT 
  LOWER(CONCAT(
 SUBSTR(first_name, 1, 1), 
 SUBSTR(last_name,1, 4),
 ' ' ,
 SUBSTR(birth_date, 6, 2), 
 SUBSTR(birth_date, 3, 2))) as username,
 COUNT(*) as cnt
 FROM employees
 GROUP BY username
 HAVING cnt > 1
 ORDER BY cnt DESC
 ;

SHOW tables;

SELECT emp_no, round(AVG(salary),1) as avg_sal
FROM salaries
group by emp_no
;

select dept_no
from dept_emp
where to_date = '9999-01-01'
group by dept_no
;

select dept_no, count(*) as cnt
from dept_emp
where to_date = '9999-01-01'
group by dept_no
;

select emp_no, count(*) as cnt 
from salaries
group by emp_no
;

select  emp_no, 
max(salary) as max_sal, 
min(salary) as min_sal, 
count(salary) as cnt_sal
from salary
group by emp_no
;

/* 
Create a new file named group_by_exercises.sql

# In your script, use DISTINCT to find the unique titles in the titles table. How many unique titles have there ever been?
  Answer that in a comment in your SQL file.
-- Senior Engineer, Staff, Engineer, Senior Staff, Assistant Engineer, Technique Leader, and Manager


# Write a query to find a list of all unique last names that start and end with 'E' using GROUP BY.
-- 
SELECT last_name
FROM employees
WHERE 
	last_name like '%E'
AND last_name like 'E%'    
GROUP BY 
	last_name
;

# Write a query to to find all unique combinations of first and last names of all employees whose last names 
  start and end with 'E'.
-- 
 SELECT first_name, last_name
FROM employees
WHERE 
	last_name like '%E'
AND last_name like 'E%'
GROUP BY 
	first_name, last_name
    ;

# Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
--Chieq, Lindqvist, and Qiwen


# Add a COUNT() to your results for exercise 5 to find the number of employees with the same last name.
-- Chleq(189), Lindqvist(190), and Qiwen(168)


# Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find 
  the number of employees with those names for each gender.
 -- Result Grid: Result 28

# Using your query that generates a username for all employees, generate a count of employees with each unique username.
-- Result Grid: Result 29

# From your previous query, are there any duplicate usernames? What is the highest number of times a username shows up? 
Bonus: How many duplicate usernames are there?
Yes there are duplicates, 6 is the highest number of times a username shows up.




*/