USE employees;

select *
FROM dept_manager;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager'
FROM departments AS d
         LEFT JOIN dept_manager AS m ON d.dept_no = m.dept_no
         JOIN employees AS e ON m.emp_no = e.emp_no
WHERE m.to_date = '9999-01-1'
ORDER BY d.dept_name;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM departments AS d
         LEFT JOIN dept_manager AS m ON d.dept_no = m.dept_no
         JOIN employees AS e ON m.emp_no = e.emp_no
WHERE e.gender = 'F'
  AND m.to_date = '9999-01-1'
ORDER BY d.dept_name;

SELECT title AS 'Titles within Customer Service', COUNT(title) AS 'Count'
FROM titles AS t
         LEFT JOIN dept_emp AS de ON de.emp_no = t.emp_no
         JOIN departments AS d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Customer Service'
  AND de.to_date = '9999-01-1'
  AND t.to_date = '9999-01-1'
GROUP BY title;

SELECT d.dept_name AS 'Department Name', CONCAT(e.first_name, ' ', e.last_name) AS 'Name', s.salary AS 'Salary'
FROM salaries AS s
         LEFT JOIN employees AS e ON s.emp_no = e.emp_no
         JOIN dept_manager AS dm ON dm.emp_no = e.emp_no
         JOIN departments AS d ON d.dept_no = dm.dept_no
WHERE s.to_date = '9999-01-01'
  AND dm.to_date = '9999-01-1'
ORDER BY d.dept_name;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
       d.dept_name                            AS 'Department Name',
       CONCAT(m.first_name, ' ', m.last_name) AS 'Manager Name'
FROM employees AS e
         LEFT JOIN dept_emp AS de ON e.emp_no = de.emp_no
         JOIN departments AS d ON d.dept_no = de.dept_no
         JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
         JOIN employees AS m ON dm.emp_no = m.emp_no
WHERE de.to_date = '9999-01-1'
  AND dm.to_date = '9999-01-1'
ORDER BY d.dept_name;

