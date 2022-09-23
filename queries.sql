-- Create Tables -- 

CREATE TABLE titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	UNIQUE (title_id),
	PRIMARY KEY (title_id, title)
);

CREATE TABLE departments(
	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE (dept_name)
);

CREATE TABLE employees(
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date DATE NOT NULL, 
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id),
	PRIMARY KEY (emp_no)
);

CREATE TABLE salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

CREATE TABLE dept_mgr(
	dept_no VARCHAR (4) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR(6) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

-- Data Analysis | SQL Queries -- 

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary. -- 

SELECT 
	employees.emp_no,
	employees.last_name,
	employees.first_name, 
	employees.gender,
	salaries.salary
FROM employees
RIGHT JOIN salaries ON employees.emp_no =
salaries.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT 
	first_name,
	last_name,
	hire_date 
FROM employees
WHERE extract(year from hire_date) = 1986

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

SELECT 
	departments.dept_no,
	departments.dept_name,
	dept_mgr.emp_no, 
	employees.first_name,
	employees.last_name
FROM 
	departments,
	dept_mgr,
	employees

-- 4. List the department of each employee with the following information:
-- employee number,last name, first name, and department name.

SELECT 
	dept_emp.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT 
	employees.first_name,
	employees.last_name,
	employees.gender
FROM employees
WHERE first_name = 'Hercules'
AND last_name Like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT 
	departments.dept_name,
	employees.last_name,
	employees.first_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including
-- their employee number, last name, first name, and department name.

SELECT
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees, departments
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';

-- 8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;