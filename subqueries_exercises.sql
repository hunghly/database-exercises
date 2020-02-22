USE employees;

-- IN is like a function callback
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
    );

