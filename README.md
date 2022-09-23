# SQL: Employee Database

## Background

It’s a beautiful spring day, and it’s been two weeks since you were hired as a new data engineer at Pewlett Hackard. Your first major task is a research project on employees of the corporation from the 1980s and 1990s. All that remains of the database of employees from that period are six CSV files.

In this assignment, you will design the tables to hold data in the CSVs, import the CSVs into a SQL database, and answer questions about the data. In other words, you will perform **data modeling**, **data engineering**, and **data analysis**.

## Performed in this assignment:

 - Data Modeling 
 - Data Engineering 
 - Data Analysis

#### Data Modeling

CSVs inspected inorder to sketch out an ERD of the tables via:
[http://www.quickdatabasediagrams.com](http://www.quickdatabasediagrams.com).

![ERD](https://user-images.githubusercontent.com/108673720/190660326-ae644732-e623-484c-8098-99e303a5c331.png)

#### Data Engineering

#### Instructions 

* Use the provided information to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.

  * For the primary keys, verify that the column is unique. Otherwise, create a [composite key](https://en.wikipedia.org/wiki/Compound_key), which takes two primary keys to uniquely identify a row.

  * Be sure to create tables in the correct order to handle foreign keys.

* Import each CSV file into the corresponding SQL table. 

  > **Hint:** To avoid errors, be sure to import the data in the same order that the tables were created. Also remember to account for the headers when importing.

#### Tables created 

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

#### Data Analysis

Once you have a complete database, perform these steps:

1. List the following details of each employee: employee number, last name, first name, sex, and salary.
![1](https://user-images.githubusercontent.com/108673720/191905749-48a35c00-4a68-48d2-9872-fdb53584c1ed.png)

2. List first name, last name, and hire date for employees who were hired in 1986.
![2](https://user-images.githubusercontent.com/108673720/191905767-d6e3df4d-7a86-4d6d-92c3-428e0aead3f2.png)

3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

![3](https://user-images.githubusercontent.com/108673720/191905780-6da6db75-0eb0-468a-a2f6-48fe3d0f04ba.png)

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
![4](https://user-images.githubusercontent.com/108673720/191905790-57d3d70b-4bc1-4c0c-bf17-2bbd7bd4b9cf.png)

5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
![5](https://user-images.githubusercontent.com/108673720/191905799-5a3f7953-f557-49f3-bab1-72f663855544.png)

6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
![6](https://user-images.githubusercontent.com/108673720/191905806-24d20e62-439a-48ad-b442-a0551274bd8b.png)

7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

![7](https://user-images.githubusercontent.com/108673720/191905817-f208e82a-3f70-4cb2-925b-7cdd2262f711.png)

8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
![8](https://user-images.githubusercontent.com/108673720/191905825-ab14388c-4eb9-4402-b21e-5a544de9ce2d.png)
