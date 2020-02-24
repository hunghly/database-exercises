USE employees;

-- IN is like a function callback
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = '101010'
);

SELECT dept_name
FROM departments
WHERE dept_no IN (SELECT dept_no
                  FROM dept_manager
                  WHERE to_date = '9999-01-01'
                    AND emp_no IN (SELECT emp_no FROM employees WHERE gender = 'F'));

SELECT first_name, last_name
FROM employees
WHERE gender = 'F'
  AND emp_no IN
      (SELECT emp_no
       FROM dept_manager
       WHERE to_date = '9999-01-1');



SELECT first_name, last_name
FROM employees
WHERE emp_no IN (SELECT emp_no FROM salaries WHERE salary = (SELECT MAX(salary) FROM salaries));
