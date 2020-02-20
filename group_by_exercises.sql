USE employees;

SELECT DISTINCT title
FROM titles;

SELECT last_name
FROM employees
WHERE (last_name LIKE '%E'
    AND last_name LIKE 'E%')
GROUP BY last_name;

SELECT first_name, last_name
FROM employees
WHERE (last_name LIKE '%E'
    AND last_name LIKE 'E%')
GROUP BY first_name, last_name;

SELECT last_name
FROM employees
WHERE (last_name LIKE '%q%'
    AND last_name NOT LIKE '%qu%')
GROUP BY last_name;

SELECT first_name, last_name, COUNT(*)
FROM employees
WHERE (first_name LIKE first_name
           AND last_name LIKE last_name)
GROUP BY first_name, last_name
ORDER BY COUNT(*) DESC;

SELECT first_name, last_name
FROM employees
WHERE first_name='rosalyn';

SELECT COUNT(*), gender
FROM employees
WHERE first_name='Irena' OR first_name='Vidya' OR first_name='Maya'
GROUP BY gender;