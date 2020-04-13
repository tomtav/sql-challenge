-- Import data from CVS files to tables
COPY employees FROM 'employees.csv' DELIMITER ',' CSV HEADER;
COPY departments FROM 'departments.csv' DELIMITER ',' CSV HEADER;
COPY dept_emp FROM 'dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY dept_manager FROM 'dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY salaries FROM 'salaries.csv' DELIMITER ',' CSV HEADER;
COPY titles FROM 'titles.csv' DELIMITER ',' CSV HEADER;

select * from employees;
select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;