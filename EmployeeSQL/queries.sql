--1.)List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT E.emp_no, E.last_name, E.first_name, E.gender, S.salary
FROM employees E
JOIN salaries S ON E.emp_no = S.emp_no;

--2.)List employees who were hired in 1986.

SELECT emp_no, first_name, last_name, hire_date
FROM employees
WHERE (EXTRACT(YEAR FROM hire_date)) = 1986;

--3.)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT D.dept_no, D.dept_name, DM.emp_no, E.first_name, E.last_name, DM.from_date, DM.to_date
FROM dept_manager DM
LEFT JOIN employees E ON DM.emp_no = E.emp_no
INNER JOIN departments D ON DM.dept_no = D.dept_no;

--4.)List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT DE.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp DE
LEFT JOIN employees E ON DE.emp_no = E.emp_no
LEFT JOIN departments D ON DE.dept_no = D.dept_no;

--5.)List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6.)List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp DE
LEFT JOIN employees E ON DE.emp_no = E.emp_no
LEFT JOIN departments D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

--7.)List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT E.emp_no, E.last_name, E.first_name, D.dept_name
FROM dept_emp DE
LEFT JOIN employees E ON DE.emp_no = E.emp_no
LEFT JOIN departments D ON DE.dept_no = D.dept_no
WHERE (D.dept_name = 'Sales' OR D.dept_name = 'Development');

--8.)In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT COUNT(emp_no), last_name
FROM employees
GROUP BY (last_name)
ORDER BY COUNT(emp_no) DESC;