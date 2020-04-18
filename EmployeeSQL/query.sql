/*
 * 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
 */
SELECT 
	e.emp_no "Employee Number",
	last_name "Last Name",
	first_name "First Name",
	gender "Gender",
	TO_CHAR(salary, '9G999G999D99') "Salary"
FROM employees e
JOIN salaries s ON s.emp_no = e.emp_no
ORDER BY last_name, first_name
;

/*
 * 2. List employees who were hired in 1986.
 */
SELECT 
	emp_no "Employee Number",
	last_name "Last Name",
	first_name "First Name",
	gender "Gender",
	hire_date "Date Hired"
FROM employees
WHERE extract('year' from hire_date) = 1986
ORDER BY hire_date, last_name, first_name
;

/*
 * 3. List the manager of each department with the following information: 
 * department number, department name, the manager's employee number, last name, 
 * first name, and start and end employment dates.
 */
SELECT 
	d.dept_no "Department Number",
	d.dept_name "Department Name",
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	e.hire_date "Start Date",
	s.to_date "End Date"
FROM dept_manager dm
INNER JOIN departments d ON d.dept_no = dm.dept_no
INNER JOIN employees e ON e.emp_no = dm.emp_no
-- UNCOMMENT THE JOIN BELOW TO GET A LIST OF LASTEST MANAGERS
-- INNER JOIN mgr_dept_date mdd ON mdd.dept_no = dm.dept_no and mdd.date = dm.to_date
INNER JOIN salaries s ON s.emp_no = dm.emp_no
ORDER BY d.dept_name, e.hire_date, e.last_name, e.first_name
;

/*
 * 4. List the department of each employee with the following information: employee number, 
 * last name, first name, and department name.
 */
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	dept_name "Department Name"
FROM dept_emp de
INNER JOIN employees e ON e.emp_no = de.emp_no
INNER JOIN departments d ON d.dept_no = de.dept_no
-- UNCOMMENT THE JOIN BELOW TO GET A LIST OF LASTEST DEPARTMENTS (REMOVE DUPLICATES)
-- INNER JOIN emp_dept_date edd ON edd.emp_no = de.emp_no and edd.date = de.to_date
ORDER BY e.last_name, e.first_name
;

/*
 * 5. List all employees whose first name is "Hercules" and last names begin with "B."
 */
SELECT 
	emp_no "Employee Number",
	last_name "Last Name",
	first_name "First Name"
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%'
ORDER BY last_name, first_name
;

/*
 * 6. List all employees in the Sales department, including their employee number, 
 * last name, first name, and department name.
 */
SELECT
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_no,
	d.dept_name "Department Name"
FROM dept_emp de
INNER JOIN departments d ON d.dept_no = de.dept_no and d.dept_name = 'Sales'
INNER JOIN employees e ON e.emp_no = de.emp_no
-- UNCOMMENT THE JOIN BELOW TO GET LASTEST LIST (REMOVE DUPLICATES)
-- INNER JOIN emp_dept_date edd ON edd.emp_no = de.emp_no and edd.date = de.to_date
ORDER BY e.last_name, e.first_name
;

/*
 * 7. List all employees in the Sales and Development departments,
 * including their employee number, last name, first name, and department name.
 */
SELECT 
	e.emp_no "Employee Number",
	e.last_name "Last Name",
	e.first_name "First Name",
	d.dept_name "Department Name"
FROM dept_emp de
INNER JOIN departments d ON d.dept_no = de.dept_no AND d.dept_name IN ('Sales','Development')
INNER JOIN employees e ON e.emp_no = de.emp_no
-- UNCOMMENT THE JOIN BELOW TO GET A LIST OF EMPLOYEES WHO'S LAST OR CURRENT DEPT IS SALES OR DEVELOPMENT
-- INNER JOIN emp_dept_date edd ON edd.emp_no = de.emp_no and edd.date = de.to_date
ORDER BY e.last_name, e.first_name
;

/*
 * 8. In descending order, list the frequency count of employee last names, 
 * i.e., how many employees share each last name.
 */
SELECT 
	last_name "Last Name", 
	COUNT(last_name) "Count"
FROM employees
GROUP BY last_name
ORDER BY 2 DESC
;