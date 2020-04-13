-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	e.gender "Gender",
	TO_CHAR(s.salary, '9G999G999D99') "Salary"
FROM employees e
INNER JOIN salaries s ON s.emp_no = e.emp_no
ORDER BY 2, 3
;

-- 2. List employees who were hired in 1986.
SELECT 
	emp_no "Employee Number",
	last_name "Last Name",
	first_name "First Name",
	gender "Gender",
	hire_date "Date Hired"
FROM employees
WHERE extract('year' from hire_date) = 1986
ORDER BY 2, 3
;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
SELECT 
	d.dept_no "Department Number",
	d.dept_name "Department Name",
	e.emp_no "Manager Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	e.hire_date "Hire Date",
	dm.from_date "Mgr Start Date",
	dm.to_date "Mgr End Date"
	,de.from_date "Dept Start",de.to_date "Dept End"
FROM dept_manager dm
INNER JOIN departments d ON d.dept_no = dm.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no
INNER JOIN dept_emp de ON de.emp_no = dm.emp_no AND de.dept_no = dm.dept_no
WHERE dm.to_date >= CURRENT_DATE
ORDER BY 2, 4, 5
;

select emp_no, count(emp_no) from dept_emp group by emp_no having (count(emp_no)>1);

select * from dept_manager;


-- 4. List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM dept_emp de
INNER JOIN employees e ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
WHERE de.to_date >= CURRENT_DATE
ORDER BY 2, 3
;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	emp_no "Employee Number",
	last_name "Last Name",
	first_name "First Name"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%'
ORDER BY 2, 3
;

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no AND de.to_date >= CURRENT_DATE
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales'
ORDER BY 2, 3
;

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no AND de.to_date >= CURRENT_DATE
INNER JOIN employees e ON e.emp_no = de.emp_no
WHERE d.dept_name IN ('Sales','Development')
ORDER BY 2, 3
;

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name "Last Name", COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC
;