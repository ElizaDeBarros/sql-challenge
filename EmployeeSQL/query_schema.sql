SELECT DISTINCT COUNT(emp_no) FROM employees;
SELECT DISTINCT COUNT(emp_no) FROM salaries;
SELECT DISTINCT COUNT(emp_no) FROM dept_manager;
SELECT DISTINCT COUNT(dept_name) FROM departments;
SELECT * FROM employees
LIMIT 5;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

-- count rows of query above
SELECT COUNT(*)
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = 1986;

/*List the manager of each department with the following information: department number, department name, the
manager's employee number, last name, first name.*/

SELECT a.dept_no, a.dept_name, b.emp_no, b.last_name, b.first_name
FROM 
	(SELECT emp_no, departments.dept_no, dept_name
	FROM dept_manager
	INNER JOIN departments
	ON dept_manager.dept_no = departments.dept_no) AS a
INNER JOIN 
	(SELECT dept_manager.emp_no, last_name, first_name
	FROM employees
	INNER JOIN dept_manager
	ON dept_manager.emp_no = employees.emp_no) as b
ON a.emp_no = b.emp_no;

-- count rows of query above
SELECT COUNT(*)
FROM 
	(SELECT emp_no, departments.dept_no, dept_name
	FROM dept_manager
	INNER JOIN departments
	ON dept_manager.dept_no = departments.dept_no) AS a
INNER JOIN 
	(SELECT dept_manager.emp_no, last_name, first_name
	FROM employees
	INNER JOIN dept_manager
	ON dept_manager.emp_no = employees.emp_no) as b
ON a.emp_no = b.emp_no;

/* List the department of each employee with the following information: employee number, last name, first name, and 
department name.*/	
	
SELECT a.emp_no, a.last_name, a.first_name, b.dept_name
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
ORDER BY emp_no;

-- count rows of query above
SELECT COUNT(*)
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

-- count rows of query above
SELECT COUNT(*)
FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

/*List all employees in the Sales department, including their employee number, last name, first name,
and department name.*/	

SELECT a.emp_no, a.last_name, a.first_name, b.dept_name
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
WHERE dept_name = 'Sales'
ORDER BY emp_no;

-- count rows of query above
SELECT COUNT(*)
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
WHERE dept_name = 'Sales';

/*List all employees in the Sales and Development departments, including their employee number, last name, first name, 
and department name.*/

SELECT a.emp_no, a.last_name, a.first_name, b.dept_name
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development'
ORDER BY emp_no;

-- count rows of query above

SELECT COUNT(*)
FROM 
	(SELECT employees.emp_no, last_name, first_name,dept_no
	FROM employees
	INNER JOIN dept_emp
	ON dept_emp.emp_no = employees.emp_no) AS a
INNER JOIN departments AS b
ON a.dept_no = b.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name ,COUNT(last_name) AS frequency FROM employees
GROUP BY last_name
ORDER BY frequency DESC