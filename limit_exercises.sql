USE employees;

SHOW TABLES;

describe titles;

SELECT DISTINCT title from titles;

SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
LIMIT 10;

SELECT first_name, last_name FROM employees
WHERE (hire_date > '1990' AND hire_date < '2000')
AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC
LIMIT 5;

SELECT first_name, last_name FROM employees
WHERE (hire_date > '1990' AND hire_date < '2000')
  AND birth_date LIKE '%-12-25'
ORDER BY birth_date ASC, hire_date DESC;
# LIMIT 5 OFFSET 45;
-- The relationship between offset, limit, and page number is that
-- page number = (offset / limit) + 1.
