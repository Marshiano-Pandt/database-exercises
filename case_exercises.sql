SHOW databases;
use employees;
SHOW tables;
DESCRIBE employees;

SELECT *
FROM dept_emp;

SELECT emp_no , dept_no, from_date, to_date,
	CASE WHEN to_date > NOW() then 'is_current_employee' end as 'is_current_employee'
FROM dept_emp
GROUP BY emp_no, dept_no, from_date, to_date
;





# Write a query that returns all employees, their department number, their start date, their end date, and a new column 
# 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not. DO NOT WORRY ABOUT DUPLICATE 
# EMPLOYEES.

SELECT 
	emp_no , 
	dept_no, 
    from_date, 
    to_date,
	IF (to_date > NOW(), '1', '0') as 'is_current_employee'
    
FROM dept_emp
GROUP BY emp_no, dept_no, from_date, to_date
;


# Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 
# 'I-Q', or 'R-Z' depending on the first letter of their last name.
describe employees;
SELECT *
FROM employees
;


SELECT first_name, last_name, 
	CASE
		WHEN SUBSTR(last_name,1, 1) between 'A' and 'H' then 'A-H' 
		WHEN SUBSTR(last_name,1, 1) between 'I' and 'Q' then 'I-Q'  
		WHEN SUBSTR(last_name,1, 1) between 'R' and 'Z' then 'R-Z'
    end as 'alpha_group'
    FROM employees;
	





# How many employees (current or previous) were born in each decade?
DESCRIBE employees;

SELECT birth_date
FROM employees;

SELECT  COUNT(*),
	CASE
    
		
		WHEN birth_date between '1950-01-01' and '1959-12-01'  THEN '50s'
        WHEN birth_date between '1960-01-01' and '1969-12-01'  THEN '60s'
        ELSE 'other'
       
       
	END 'Decades'
FROM employees
GROUP BY Decades
;





# What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM,
# Finance & HR, Customer Service?

SELECT * from salaries limit 10;


SELECT *
from departments as d
	join dept_emp as de
		on de.dept_no = d.dept_no
	join salaries as s
		on s.emp_no = de.emp_no
	where s.to_date > now()
		and de.to_date > now()
;

Select 
case
	when dept_name in ('Research', 'Development') then 'R&D'
    when dept_name in ('Sales', 'Marketing') then 'Sales & Marketing'
    when dept_name in ('Production', 'Quality Management') then 'Prod & OM'
	when dept_name in ('Finance', 'Human Resource') then 'Finnace & HR'
    Else 'Costumer Service'
    end as dept_group 
    , round(avg(salary),2) as avg_salary
from departments as d
	join dept_emp as de
		on de.dept_no = d.dept_no
	join salaries as s
		on s.emp_no = de.emp_no
	where s.to_date > now()
		and de.to_date > now()
GROUP BY dept_group
;


Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',2)) as avg_salary from departments as d  join dept_emp as de   on de.dept_no = ' at line 9

