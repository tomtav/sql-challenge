DROP VIEW  IF EXISTS emp_title;
DROP VIEW  IF EXISTS mgr_dept_date;
DROP VIEW  IF EXISTS emp_dept_date;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(60) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE DEFAULT ('now'::text)::date NOT NULL
);

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INTEGER NOT NULL REFERENCES employees,
	dept_no VARCHAR(4) NOT NULL REFERENCES departments,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL REFERENCES departments,
	emp_no INTEGER NOT NULL REFERENCES employees,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary NUMERIC NOT NULL,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees
);

CREATE TABLE titles (
	id SERIAL,
	emp_no INTEGER NOT NULL,
	title VARCHAR(255) NOT NULL,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (id, emp_no),
	FOREIGN KEY (emp_no) REFERENCES employees
);


-- Create view for faster queries of last to_date by employee
CREATE VIEW emp_dept_date as (
	SELECT emp_no, MAX(to_date) as date
	FROM dept_emp
	GROUP BY emp_no
);

-- Create view for faster queries of last to_date by department
CREATE VIEW mgr_dept_date as (
	SELECT dept_no, MAX(to_date) as date
	FROM dept_manager
	GROUP BY dept_no
);

-- Create view for faster queries of last title by employee
CREATE VIEW emp_title as (
	SELECT emp_no, MAX(to_date) as date
	FROM titles
	GROUP BY emp_no
);
