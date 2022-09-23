-- Entity Relationship Model from QuickDBD: https://www.quickdatabasediagrams.com/

departments
-
dept_no PK VARCHAR
dept_name VARCHAR

employees
-
emp_no PK INT
emp_title_id VARCHAR
birth_date DATE
first_name VARCHAR
last_name VARCHAR
gender VARCHAR
hire_date DATE

salaries
-
emp_no PK INT FK >- employees.emp_no
salary INT

dept_mgr
-
dept_no PK VARCHAR FK >- departments.dept_no
emp_no PK INT FK >- employees.emp_no

dept_emp
-
emp_no PK INT FK >- employees.emp_no
dept_no PK VARCHAR FK >- departments.dept_no

titles
-
title_id PK VARCHAR FK >- employees.emp_title_id
title PK VARCHAR
