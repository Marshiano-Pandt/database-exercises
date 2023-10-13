SHOW databases;
USE albums_db;
SELECT database();
SHOW tables;
USE employees;
SELECT database();
SHOW tables;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
DESCRIBE employees;
DESCRIBE salaries;
DESCRIBE titles;

SHOW CREATE TABLE dept_manager;

# Which table(s) do you think contain a numeric type column? -- dept_manager, dept_emp, employees, salaries, and titles.

# Which table(s) do you think contain a string type column? -- department, dept_manager, dept_emp, employees, and titles.

# Which table(s) do you think contain a date type column? -- dept_emp, dept_manager, employees, salaries, and titles.

# What is the relationship between the employees and the departments tables? -- There is'nt a much of a relationship between employees and departments by just looking at the tables.

# 
