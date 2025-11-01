
.headers on 
.mode box 
.mode table


SELECT * FROM employees;

SELECT 
    first_name, 
    last_name, 
    salary, 
    salary * 1.05
FROM
    employees;

SELECT 
    first_name, 
    last_name, 
    salary, 
    salary * 1.05 AS new_salary
FROM
    employees;

/*fungsinya untuk mengalikan pada kolom tabl/


