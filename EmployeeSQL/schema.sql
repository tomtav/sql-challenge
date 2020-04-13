DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	emp_no SERIAL Primary KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR(45) NOT NULL,
	last_name VARCHAR(60) NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE DEFAULT ('now'::text)::date NOT NULL
);
CREATE INDEX first_name_idx ON employees((lower(first_name)));
CREATE INDEX last_name_idx ON employees ((lower(last_name)));

CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(60) UNIQUE NOT NULL
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL REFERENCES employees,
	dept_no VARCHAR(4) NOT NULL REFERENCES departments,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL REFERENCES departments,
	emp_no INT NOT NULL REFERENCES employees,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE salaries (
	emp_no INT NOT NULL REFERENCES employees,
	salary NUMERIC NOT NULL,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL
);

CREATE TABLE titles (
	emp_no INT NOT NULL REFERENCES employees,
	title VARCHAR(255) NOT NULL,
	from_date DATE DEFAULT ('now'::text)::date NOT NULL,
	to_date DATE NOT NULL
);

