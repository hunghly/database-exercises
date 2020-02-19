USE employees;

DESCRIBE employees;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

SELECT * FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

SELECT * FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;

SELECT hire_date FROM employees;

SELECT * FROM employees
WHERE hire_date > '1990' AND hire_date < '2000';

SELECT * FROM employees
WHERE birth_date LIKE '%-12-25';

SELECT * FROM employees
WHERE last_name LIKE '%q%';

SELECT * FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT * FROM employees
WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';

SELECT * FROM employees
WHERE last_name LIKE 'E%'
   OR last_name LIKE '%E';

SELECT * FROM employees
WHERE last_name LIKE 'E%'
  AND last_name LIKE '%E';

SELECT * FROM employees
WHERE (hire_date > '1990' AND hire_date < '2000')
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;

SELECT * FROM employees
WHERE last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%';