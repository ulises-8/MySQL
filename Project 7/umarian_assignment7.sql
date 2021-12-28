-- Ulises Marian

USE restaurant;

/* 
Query 1: What are the names of the IFR employees whose salaries
are greater than that of employees whose ID is 125? Use a subquery.
*/

SELECT last_name, first_name, salary
FROM staff
WHERE salary > (SELECT salary
			    FROM staff
				WHERE staff_id = 125);
                
                
/*
Query 2: What are the names of the IFR employees whose staff job ID
is not the same as Nicolas Patrick? Use a subquery.
*/

SELECT first_name, last_name, job_id
FROM staff
WHERE job_id != (SELECT job_id
                 FROM staff
				 WHERE first_name = 'Nicolas'
                 AND last_name = 'Patrick');
                 
                 
/*
Query 3:
Which employees have the same department ID as the IT department?
Use a subquery.
*/

SELECT first_name, last_name
FROM staff
WHERE dept_id = (SELECT department_id
                 FROM departments
                 WHERE department_name = 'IT');


/*
Query 4:
Write a query that returns all employees whose salary is greater than
that of Lane (last name) and are in the same department as Zayn. Use a subquery.
*/

SELECT staff_id, first_name, last_name, email
FROM staff
WHERE salary > (SELECT salary
                FROM staff
				WHERE last_name = 'Lane')
AND dept_id = (SELECT dept_id
		       FROM staff
		       WHERE last_name = 'Zayn');


/* 
Query 5: Write a query that returns all employees who have 
the same job ID as Emilia Nasir and were hired after Baylor Collin.
Use a subquery.
*/

SELECT staff_id, first_name, last_name, salary, dept_id
FROM staff
WHERE job_id = (SELECT job_id
                FROM staff
                WHERE first_name = 'Emilia'
                AND last_name = 'Nasir')
AND hire_date > (SELECT hire_date
				 FROM staff
				 WHERE first_name = 'Baylor'
				 AND last_name = 'Collin');
                             

/*
Query 6:
What is the job ID for IFR jobs that have a salary greater
than those of any S_Cook job ID? Use a subquery.
*/

SELECT job_id, dept_id
FROM staff
WHERE salary > ANY (SELECT salary
                    FROM staff
					WHERE job_id = 'S_COOK');


/* 
Query 7: Write a query that returns a list of department IDs
and average salaries where the department’s average salary
is greater than Marcus Jeremy’s salary. Use a subquery.
*/

SELECT dept_id, AVG(salary) AS "Average"
FROM staff
GROUP BY dept_id
HAVING AVG(SALARY) > (SELECT salary
                     FROM staff
                     WHERE first_name = 'Marcus'
                     AND last_name = 'Jeremy')
ORDER BY dept_id;


/*
Query 8:
Write a query that returns a list of department IDs with employees
whose minimum salary is greater than the lowest salary of
employees whose department ID is not equal to 50. Use a subquery.
*/

SELECT dept_id, MIN(salary) AS "minimum salary"
FROM staff
WHERE salary > (SELECT MIN(salary)
                FROM staff
                WHERE dept_id != 50)
GROUP BY dept_id;


/*
Query 9:
Find the last names of all employees whose salaries are
the same as the minimum salary for any department. Use a subquery.
*/

SELECT last_name, first_name
FROM staff
WHERE salary = ANY (SELECT MIN(SALARY)
					FROM staff
                    GROUP BY dept_id);


/*
Query 10: The goal of the following query is to
display the minimum salary for each department that is
less than the lowest salary of the employees in department 30.
However, the subquery does not execute because it has five errors.
Find and correct them. Then, run the query.
*/

SELECT dept_id, MIN(salary) AS "minimum salary"
FROM staff
GROUP BY dept_id
HAVING MIN(salary) < (SELECT MIN(salary)
                      FROM staff
                      WHERE dept_id = 30);
  
  
/* 
Query 11: Write a non-pair-wise subquery that lists the last_name,
first_name, department_id, and manager_id for all employees with the 
same department_id and manager_id as employee 745. Use a subquery.
*/

SELECT last_name, first_name, dept_id, manager_id
FROM staff
WHERE dept_id IN (SELECT dept_id
                  FROM staff
                  WHERE staff_id = 745)
AND manager_id IN (SELECT manager_id
                   FROM staff
                   WHERE staff_id = 745);
                  
                  
/*
Query 12: Write a SQL statement that uses the IN operator
to find the customer ID, first name, and last name of each customer
who made an order on 05/09/2020. Use a subquery.
*/

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id IN (SELECT cust_id
                      FROM orders
                      WHERE order_date = '2020-05-09');


/*
Query 13: Write a SQL statement that displays the order ID and order date
for each order created for the customer Evita Hodcroft. Use a subquery.
*/

SELECT order_number, order_date
FROM orders
WHERE cust_id = (SELECT customer_id
                 FROM customers
                 WHERE first_name = 'Evita'
                 AND last_name = 'Hodcroft');


/* 
Query 14:
Write a SQL statement that lists the highest earners for each department.
Include the last name, department ID, and the salary for each employee.
*/

SELECT last_name, dept_id, salary
FROM staff
WHERE salary IN (SELECT MAX(salary)
				FROM staff
                GROUP BY dept_id)
ORDER BY dept_id;