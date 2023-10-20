show databaseS;
use join_example_db;
show tables;
describe roles;
describe users;

SELECT * FROM roles as r; 
SELECT * FROM users as u;

SELECT 
	u.id,
    u.name, 
    r.name as role
FROM users u
left join roles r           -- left join added all the users even though their role were null
	on r.id = u.role_id
;

SELECT 
	u.id,
    u.name, 
    r.name as role
FROM users u
join roles r               -- join did not add all the users because their roles were null.
	on r.id = u.role_id;


select
	r.name AS role,
    u.id,
    u.name 
FROM roles r
right join users u
	on r.id = u.role_id;   
    
    
select
    
    
    count(*) as cnt,
    r.name AS role
FROM roles r
right join users u
	on r.id = u.role_id
GROUP BY   role
ORDER BY role asc
;







-- Join Example Database --

# Use the join_example_db. Select all the records from both the users and roles tables.

# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. 
# Before you run each query, guess the expected number of results.

# Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
# Use count and the appropriate join type to get a list of roles along with the number of users that have the role. 
# Hint: You will also need to use group by in the query.

-- Employees Database --

# Use the employees database.
SHOW databases;
USE employees;
SHOW tables FROM employees;


/* 
Using the example in the Associative Table Joins section as a guide, write a query that shows each department along
with the name of the current manager for that department */
DESCRIBE departments;
DESCRIBE dept_manager;
DESCRIBE dept_emp;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

SELECT *
FROM employees
where emp_no between 110022 and 111939
;

SELECT dept_no, dept_name
FROM departments
order by dept_no asc;
show tables;
describe titles;
/*
departments
dept_emp
dept_manager
employees
salaries
titles
*/



SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Department Manager'
FROM employees as e 
JOIN dept_manager as dm
	on dm.emp_no = e.emp_no
JOIN departments as d
	on d.dept_no = dm.dept_no
WHERE 
	dm.to_date = '9999-01-01'
order by dept_name; 
   -- de.to_date > NOW()

# Find the name of all departments currently managed by women.

DESCRIBE employees;
Describe departments;
describe dept_manager;

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Manager Name'
FROM employees as e
JOIN dept_manager as dm
	on e.emp_no=dm.emp_no
JOIN departments as d 
	on d.dept_no = dm.dept_no
WHERE
	dm.to_date = '9999-01-01' AND
    e.gender = 'F'
ORDER BY d.dept_name 
;

# Find the current titles of employees currently working in the Customer Service department.
DESCRIBE titles;
DESCRIBE employees;
DESCRIBE dept_emp;
DESCRIBE departments;

select * 
from departments;

SELECT title as 'Title', count(e.emp_no) as 'Count'
FROM titles as t
JOIN employees as e
	on e.emp_no = t.emp_no
JOIN dept_emp as de 
	on de.emp_no = e.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE 
	t.to_date > NOW() and
	de.to_date > NOW() and
    d.dept_name = 'Customer Service'
GRoup by title    
ORDER BY title
;

# Find the current salary of all current managers.
DESCRIBE dept_manager;
DESCRIBE salaries;
describe employees;
DESCRIBE departments;

SELECT d.dept_name as 'Department Name', CONCAT(e.first_name, ' ', e.last_name) as 'Name', s.salary
FROM employees as e
JOIN salaries as s
	ON s.emp_no = e.emp_no
JOIN dept_manager as dm
	ON dm.emp_no = s.emp_no
JOIN departments as d 
	ON d.dept_no = dm.dept_no
WHERE 
	s.to_date > NOW() and 
	dm.to_date > NOW()
ORDER BY salary
;

# Find the number of current employees in each department
DESCRIBE employess;
DESCRIBE dept_emp;
DESCRIBE departments;

SELECT d.dept_no, d.dept_name, COUNT(e.emp_no) as num_employees
FROM dept_emp as de
JOIN employees as e
	ON de.emp_no = e.emp_no
JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE 
 	de.to_date > NOW()
GROUP BY d.dept_no, d.dept_name
ORDER BY d.dept_no, d.dept_name

;
    
# Which department has the highest average salary? Hint: Use current not historic information.
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE salaries;

SELECT  d.dept_name, ROUND(AVG(s.salary), 5) as 'average_salary'
FROM departments as d
JOIN dept_emp as de 
	on d.dept_no = de.dept_no
JOIN salaries as s
	on s.emp_no = de.emp_no
WHERE 
	s.to_date > NOW()
GROUP BY 
	d.dept_name
ORDER BY 
	s.salary DESC
    LIMIT 1
;

# Who is the highest paid employee in the Marketing department?
DESCRIBE salaries;
DESCRIBE employees;
DESCRIBE dept_emp;
DESCRIBE departments;

SELECT 
	d.dept_name 
	ROUND(AVG(s.salary),2) as average_salary
FROM employees as e
JOIN salaries as s
	ON s.emp_no = e.emp_no
JOIN dept_emp as de
	on de.emp_no = e.emp_no
JOIN departments as d 
	ON d.dept_no = de.dept_no
GROUP BY 
	d.dept_name
ORDER BY 
	average_salary DESC
    LIMIT 1

;

# Which current department manager has the highest salary?
DESCRIBE employees;
DESCRIBE dept_manager;
DESCRIBE departments;
DESCRIBE salary;


SELECT first_name, last_name, max(salary), dept_name
FROM employees as e
JOIN dept_manager as dm
	ON e.emp_no = dm.emp_no
JOIN salaries as s
	ON s.to_date = dm.to_date
JOIN departments as d 
	on d.dept_no = dm.dept_no
GROUP BY first_name, last_name, dept_name 
;


# Determine the average salary for each department. Use all salary information and round your results.
DESCRIBE salaries;
DESCRIBE dept_emp;
DESCRIBE departments;

SELECT dept_name,
	ROUND(AVG(s.salary),0) as average_salary
FROM salaries as s
JOIN dept_emp as de
	ON de.emp_no = s.emp_no
JOIN departments as d 
	on d.dept_no = de.dept_no
GROUP BY d.dept_name
ORDER BY average_salary desc;

;







