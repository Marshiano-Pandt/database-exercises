SHOW databases;

USE employees;
SELECT database();
SHOW tables;

SELECT * FROM employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY  first_name
;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY  first_name, last_name
;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya','Maya')
ORDER BY  last_name, first_name
;

SELECT emp_no ,first_name, last_name 
FROM employees
WHERE last_name Like '%E'
	AND last_name LIKE 'E%' 
ORDER BY  first_name, last_name
;


SELECT emp_no ,first_name, last_name, hire_date
FROM employees
WHERE last_name Like '%E'
	AND last_name LIKE 'E%' 
ORDER BY  hire_date desc
;

SELECT *
FROM employees
WHERE hire_date between '1990-01-01' and '1999-12-31'
	AND birth_date like '%12-25'
ORDER BY birth_date asc, hire_date desc
;

/*

# Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
In your comments, answer: What was the first and last name in the first row of the results? What was the first and 
last name of the last person in the table?
-- Irena Reutenauer and Vidya Simmen


# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name
  and then last name. In your comments, answer: What was the first and last name in the first row of the results? 
  What was the first and last name of the last person in the table?
 -- Irena Acton and Vidya Zweizig

# Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and 
  then first name. In your comments, answer: What was the first and last name in the first row of the results? 
  What was the first and last name of the last person in the table?
  -- Irena Acton and Maya Zyada

# Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
 Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last
 employee number with their first and last name.
 -- AAmod Erde and Zvonko Erde

# Write a query to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, 
  so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the 
  newest employee, and the name of the oldest employee.
  -- Teiji Eldridge and Sergi Erde

# Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last 
  is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired 
  last, and the name of the youngest employee who was hired first.
-- Khun Bernini and Douadi Pettis
*/