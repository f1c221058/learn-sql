SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
ORDER BY
  first_name;


SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
ORDER BY
  first_name,
  last_name DESC;

SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM
  employees
ORDER BY
  salary DESC;

SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
ORDER BY
  hire_date;

SELECT
  first_name,
  phone_number
FROM
  employees
ORDER BY
  phone_number NULLS FIRST;
