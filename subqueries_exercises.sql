SHOW databases;
Use employees;
SHOW tables;


# Find all the current employees with the same hire date as employee 101010 using a subquery.



SELECT e.emp_no, e.hire_date, de.to_date
FROM employees as e
JOIN dept_emp as de
	on de.emp_no = e.emp_no
WHERE de.to_date > NOW() 
	and e.hire_date =
	(
SELECT  hire_date
	FROM employees
where emp_no = 101010
);





    



# Find all the titles ever held by all current employees with the first name Aamod.
DESCRIBE titles;
DESCRIBE employees;

SELECT *
FROM titles;

SELECT first_name
FROM employees 
where first_name = 'Aamod';


SELECT distinct t.title, t.to_date, e.first_name  
FROM employees as e
JOIN titles as t 
	ON e.emp_no = t.emp_no
WHERE 
	t.to_date > NOW() and
	e.first_name = (
    
		SELECT distinct first_name
        FROM employees 
        WHERE first_name = 'Aamod'
			);




# How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
-- 59,900 employees

describe employees;
DESCRIBE dept_emp;


SELECT *
FROM dept_emp
WHERE to_date < Now()
;

SELECT count(*) as cnt
FROM employees
WHERE emp_no not in (

		SELECT emp_no
		FROM dept_emp
			WHERE to_date > Now()
            )
;








# Find all the current department managers that are female. List their names in a comment in your code.
DESCRIBE employees;
DESCRIBE dept_manager;


SELECT *
FROM employees 
WHERE gender = 'F';

SELECT *
FROM dept_manager as dm
WHERE dm.to_date > NOW();

SELECT CONCAT(e.first_name, ' ', e.last_name) as "Department Manager", dm.to_date, e.gender
FROM employees as e 
JOIN dept_manager as dm
	ON dm.emp_no = e.emp_no
WHERE 
	dm.to_date > NOW() and 
    e.gender =(
		SELECT distinct gender
		FROM employees 
		WHERE gender = 'F');
		
	


# Find all the employees who currently have a higher salary than the companie's overall, historical average salary.
-- $154,543 

describe employees;
describe salary;

SELECT round(avg(salary), 2)
FROM salaries
;


SELECT count(*)
FROM salaries
WHERE to_date > now()
	and salary > (
    
		SELECT round(avg(salary), 2)
FROM salaries)
;




/* How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built-in function to calculate the standard deviation.) What percentage of all salaries is this?
Hint You will likely use multiple subqueries in a variety of ways
Hint It's a good practice to write out all of the small queries that you can. 
Add a comment above the query showing the number of rows returned. You will use this number (or the query that produced it)
in other, larger queries. */
-- 83 salaries
-- 0.03465

DESCRIBE salaries;

SELECT count(*)
FROM salaries 
WHERE to_date > NOW();

SELECT 83/240124 * 100;



SELECT std(salary)
FROM salaries
WHERE to_date > now();

SELECT max(salary)
FROM salaries
where to_date > now() ;

SELECT (max(salary) - std(salary)) as cutoff
FROM salaries 
WHERE to_date > now()
;


SELECT count(*)
FROM salaries
WHERE salary >=
	( SELECT (max(salary) - std(salary)) as cutoff
FROM salaries 
WHERE to_date > now()
    )
    AND to_date > now()
    ;
  
  
SELECT(  
   SELECT count(*)
FROM salaries
WHERE salary >=
	( SELECT (max(salary) - std(salary)) as cutoff
FROM salaries 
WHERE to_date > now()
    )
    AND to_date > now())
    /
    (SELECT count(*)
FROM salaries 
WHERE to_date > NOW()
) 
* 100;
    
    
    
    

