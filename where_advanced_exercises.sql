SHOW databases;

USE employees;
SELECT database();
SHOW tables;

SELECT * FROM employees;

SELECT emp_no, first_name, hire_date 
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
;

SELECT emp_no, first_name, hire_date 
FROM employees
WHERE first_name = 'Irena' 
OR first_name = 'Vidya'
OR first_name = 'Maya'
;

SELECT emp_no, first_name, hire_date, gender
FROM employees
WHERE gender = 'M'
AND first_name = 'Irena' 
OR first_name = 'Vidya'
AND gender = 'M'
OR first_name = 'Maya'
AND gender = 'M'
;

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE 'E%'
;

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE 'E%' 
AND last_name LIKE 'E%'
OR last_name LIKE '%E'
;


SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E'
;

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE '%E'
AND last_name NOT LIKE 'E%'
;

SELECT emp_no, hire_date
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
;

SELECT emp_no, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25%'
AND birth_date BETWEEN '1900-12-25' AND '2023-12-25'
;

SELECT emp_no, hire_date, birth_date
FROM employees
WHERE birth_date LIKE '%-12-25%'
AND birth_date BETWEEN '1900-12-25' AND '2023-12-25'
AND hire_date BETWEEN '1900-01-01' AND '2000-01-01'
;

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE '%q%'
;

SELECT emp_no, last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
;

/* 
# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. 
What is the employee number of the top three results? 
-- 10200, 10397, 10610.

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, 
but use OR instead of IN. What is the employee number of the top three results? Does it match the previous question?
-- The answer matches from the previous a question.

# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. 
What is the employee number of the top three results?
-- 10200, 10397, 10821

# Find all unique last names that start with 'E'.
-- Result Grid, saved pin: employees 19

# Find all unique last names that start or end with 'E'.
-- Result Grid, saved pin: employee 20.

# Find all unique last names that end with E, but does not start with E?
-- Result Grid, saved pin: employee 21.

# Find all unique last names that start and end with 'E'.
-- Result Grid, saved pin: employee 22.

# Find all current or previous employees hired in the 90s. Enter a comment with the top three employee numbers.
-- 11697, 10684, 11754

# Find all current or previous employees born on Christmas. Enter a comment with the top three employee numbers.
-- 10078, 10115, 10261

# Find all current or previous employees hired in the 90s and born on Christmas. 
Enter a comment with the top three employee numbers.
-- 10078, 10115, 10261

# Find all unique last names that have a 'q' in their last name.
-- Result Grid, saved pin: employee 26.

# Find all unique last names that have a 'q' in their last name but not 'qu'.
-- Result Grid, saved pin: employee 27.
*/

