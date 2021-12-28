-- Ulises Marian

USE restaurant;

/* 
Query 1:
Write a SELECT statement that finds the average salary for
International Foods Restaurant (IFR) employees whose manager ID is 200.
*/

SELECT AVG(salary) AS Average
FROM staff
WHERE manager_id = 200;

/*
Query 2:
Write a SELECT statement that finds the lowest salary,
the last name who is first in an alphabetical list of employees,
and the last name who is last of an alphabetical list of employees.
Select only employees who are in departments 30 or 60.
*/

SELECT MIN(salary) AS Salary, MIN(last_name), MAX(last_name)
FROM staff
WHERE dept_id IN (30, 60);


/* Query 3:
Write a SELECT statement that finds what
the most recent hire date of an IFR employee was.
*/

SELECT MAX(hire_date)
FROM staff;


/* Query 4:
Write a SQL statement that creates a list including
each employee's first name concatenated to a space
as well as the employee's last name, and the salary
of all employees whose last name contains the string 'ar'.
*/

SELECT CONCAT(first_name, ' ', last_name) AS "employee name", salary
FROM staff
WHERE last_name LIKE '%ar%';


/*
Query 5:
Write a SQL statement that lists the item number
and item description for all items.
The item descriptions should appear in uppercase letters
*/

SELECT item_number, UPPER(description) AS item_desc
FROM food_items;


/*
QUERY 6:
IFR is running a promotion that is valid for up to 20 days after
an order is placed. Write a SQL statement that lists the
order ID, customer ID, first name, and last name.
The promotion date is 20 days after the order was placed.
*/

SELECT o.order_number, c.customer_id, c.first_name, c.last_name,
  o.order_date, ADDDATE(o.order_date, INTERVAL 20 DAY) AS promotion_date
FROM orders o
JOIN customers c on o.cust_id = c.customer_id;


/*
Query 7:
List the last names and birthdays of IFR employees.
Convert the birth dates to character data.
*/

SELECT last_name, DATE_FORMAT(birthdate, '%W %M %D %Y') AS Birthday
from staff;


/*
Query 8:
Layla Justin is an employee who has received a $2,000 raise.
Display her first name, last name, current salary, and new salary.
Display both salaries with a $ and two decimal places.
Label his new salary column AS New Salary.
*/

SELECT first_name, last_name, CONCAT('$',salary) AS "Current Salary",
  CONCAT('$',(salary + 2000.00)) AS "New Salary"
FROM staff
WHERE first_name = 'Layla' and last_name = 'Justin';


/*
Query 9:
Create a report listing the first and last names
and month of hire for all employees in the staff table.
*/

SELECT CONCAT(first_name, ' ', last_name) AS "Name",
  MONTH(hire_date) AS 'Anniversary Month'
FROM staff;


/*
Query 10:
Write a SELECT statement that displays the item number
and the number of orders placed for each item.
Show the results in decreasing order and label result column NumOrders.
*/

SELECT item_number, COUNT(QUANTITY) AS NumOrders
FROM order_lines
GROUP BY item_number
ORDER BY NumOrders DESC;


/*
Query 11:
 Write a SQL statement that creates a list of monthly salaries
 from the staff table where the salary is between $700 and $3,000.
 The salaries should be formatted to include a $-sign
 and have two decimal points like: $9999.99.
 */
 
 SELECT staff_id, CONCAT('$', salary) AS "monthly salary"
 FROM staff
 WHERE salary BETWEEN 700.00 AND 3000.00;


DESC order_lines;
DESC orders;
DESC food_items;
DESC staff;

USE library;

DESC book_loans;