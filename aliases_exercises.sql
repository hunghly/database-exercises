USE employees;

SELECT CONCAT(emp_no, ' - ', last_name, ' ', first_name) AS full_name, birth_date AS DOB
FROM employees
LIMIT 10;

SELECT emp.first_name, emp.last_name, title.title, sal.salary
FROM employees AS emp
JOIN titles AS title ON emp.emp_no = title.emp_no
JOIN salaries AS sal ON emp.emp_no = sal.emp_no
ORDER BY salary DESC;