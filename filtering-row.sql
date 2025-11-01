-- ini adalah penggunaakn WHERE 

SELECT
  employee_id,
  first_name,
  last_name,
  salary
FROM
  employees
WHERE
  salary > 14000
ORDER BY
  salary DESC;

SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
WHERE
  last_name = 'Chen';


SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  hire_date >= '1999-01-01'
ORDER BY
  hire_date DESC;


SELECT
  first_name,
  last_name,
  hire_date
FROM
  employees
WHERE
  EXTRACT(YEAR FROM hire_date) = 1999
ORDER BY
  hire_date DESC;
