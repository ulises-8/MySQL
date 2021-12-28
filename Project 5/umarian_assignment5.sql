-- Ulises Marian

USE restaurant;

/*
Query 1:
For each order, display the order ID and order date
along with the customer ID, first name, and last name
of the customer for which the order was created.
*/

SELECT o.order_number, o.order_date, c.customer_id, c.first_name, c.last_name
FROM orders o
JOIN customers c ON (c.customer_id = o.cust_id);


/*
Query 2:
For each order placed on 04/24/2020, write a SQL statement that lists
the order number, customer ID, first name, and last name
of the customer for which the order was created.
*/

SELECT order_number, customer_id, first_name, last_name
FROM customers
JOIN orders ON (customer_id = cust_id)
WHERE order_date = '2020-04-24';


/* 
Query 3:
For each order, list the item number, order date, order ID,
quantity ordered, and price for each food item that makes up an order.
*/

SELECT o.order_number, o.order_date, f.item_number, l.quantity, f.price
FROM orders AS o
JOIN order_lines AS l ON (o.order_number = l.order_number)
JOIN food_items AS f ON (f.item_number = l.item_number)
ORDER BY o.order_number;


/* 
Query 4:
For each order, list the food item number, order date, order number,
and description for each food item that makes up an order.
Order the rows by category and then by order number.
*/

SELECT o.order_number, o.order_date, f.item_number, f.description
FROM orders AS o
JOIN order_lines AS l ON (o.order_number = l.order_number)
JOIN food_items AS f ON (f.item_number = l.item_number)
ORDER BY f.category_id, o.order_number;


/* 
Query 5: 
List the order number and order date for each order
that contains the food item description 'Chicken Sandwich'
*/
 
SELECT o.order_number, o.order_date
FROM orders AS o
JOIN order_lines AS l ON (o.order_number = l.order_number)
JOIN food_items AS f ON (f.item_number = l.item_number)
WHERE f.description LIKE '%Chicken Sandwich%';


/*
Query 6:
Write a SQL statement that lists the order number and order date
for each order that was created for Philip Dennis but
does not contain the food item description 'Shack Burger'.
*/

SELECT o.order_number, o.order_date
FROM orders AS o
JOIN customers AS c ON (o.cust_id = c.customer_id)
JOIN order_lines AS l ON (o.order_number = l.order_number)
JOIN food_items AS f ON (f.item_number = l.item_number)
WHERE c.first_name LIKE '%Philip%' AND c.last_name LIKE '%Dennis%'
AND f.description NOT LIKE '%Shack Burger%';


/*
Query 7:
Return the first name, last name, and department name for all
employees including those employees not assigned to a department.
*/

SELECT s.first_name, s.last_name, d.department_name
FROM staff AS s
LEFT JOIN departments as d ON (d.department_id = s.dept_id);


/*
Query 8:
Return the first name, last name, and department name for all employees
including those departments that do not have an employee assigned to them.
*/

SELECT s.first_name, s.last_name, d.department_name
FROM staff AS s
RIGHT JOIN departments as d ON (d.department_id = s.dept_id);


/* Query 9:
Show all shift descriptions and shift assignment dates
(even if there is no date assigned for each shift description).
*/

-- PRINTS 8 
SELECT description, shift_assign_date
FROM shifts AS s
LEFT JOIN shift_assignments AS a ON (s.code = a.code);


/*
Query 10:
Produce a report for International Foods Restaurant
showing customers and orders. A customer must be included
on the report even if the customer has had no orders.
*/

SELECT c.customer_id, c.first_name, c.last_name, o.order_number, o.order_date
FROM customers AS c
LEFT JOIN orders AS o ON (c.customer_id = o.cust_id);


/*
Query 11:
Create a query of the database that shows employee last names,
department IDs, and department names.
Include all employees even if they are not assigned to a department.
*/

SELECT s.last_name, s.dept_id, d.department_name
FROM staff AS s
LEFT JOIN departments as d ON (s.dept_id = d.department_id);