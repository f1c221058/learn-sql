SELECT
  salary
FROM
  employees
ORDER BY
  salary DESC;


SELECT *
FROM
  employees
ORDER BY
  first_name
LIMIT
  5;


SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
ORDER BY
  first_name
LIMIT
  5;

SELECT
  employee_id,
  first_name,
  last_name
FROM
  employees
ORDER BY
  first_name
LIMIT
  5
OFFSET
  3;
