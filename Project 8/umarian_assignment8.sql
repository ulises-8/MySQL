-- Ulises Marian

USE restaurant;

/* 
Query 1: 
Construct an inline view from the restaurant database
that lists the last name, salary, department ID,
and maximum salary for each department
*/

SELECT s.last_name, s.salary, d.dept_id, d.maxsal
FROM staff s,
       (SELECT dept_id, max(salary) maxsal
        FROM staff
		GROUP BY dept_id) d
WHERE s.dept_id = d.dept_id
AND s.salary = d.maxsal;


/* Query 2:
Create a new table called my_departments and add all columns
and all rows to it using a subquery from the departments table.
Do a SELECT statement to confirm that you have all the columns and rows.
Create or enable the department_id column as the primary key.
*/

CREATE TABLE my_departments AS
(SELECT *
FROM departments);

ALTER TABLE my_departments
ADD PRIMARY KEY (department_id);

SELECT *
FROM my_departments;


/* Query 3:
Create a view called view_my_departments that includes:
department_id and department_name.
*/

CREATE VIEW view_my_departments AS
SELECT department_id, department_name
FROM departments;

INSERT INTO view_my_departments (department_id, department_name)
VALUES (105, 'Advertising'),
       (120, 'Custodial'),
       (130, 'Planning');


/* Query 4:
Add the Human Resources department, department ID 220
to my_departments using view_my_departments.
*/

INSERT INTO view_my_departments (department_id, department_name)
VALUES (220, 'Human Resources');

SELECT *
FROM view_my_departments;


/* Query 5:
Create a view named item_ordered.
It consists of the food item number, item description, price,
order number, order date, quantity, and price
for all ordered food items currently on file.
*/

CREATE VIEW item_ordered AS
SELECT f.item_number, f.description, f.price, o.order_number,
  o.order_date, l.quantity
FROM food_items f, orders o, order_lines l
WHERE f.item_number = l.item_number
AND l.order_number = o.order_number;


/* Query 6:
 Write and execute the command to retrieve the item number, description,
 order number, and quoted price for all orders in the item_ordered
 view for food items with prices that exceed $5.
 */
 
SELECT item_number, description, order_number, QUOTE(price) AS price
FROM item_ordered
WHERE price > 5;


/* Query 7:
 Create a view named salary_view that returns the highest salary,
 lowest salary, average salary, and department name.
 */
 
CREATE VIEW salary_view (dept_name, max_salary, min_salary, avg_salary) AS
SELECT d.department_name, MAX(s.salary), MIN(s.salary), AVG(s.salary)
FROM staff s
JOIN departments d ON s.dept_id = d.department_id
GROUP BY d.department_name;


/* Query 8:
Create a view named dept_managers_view that returns a
listing of department names along with the
manager initial and surname for that department.
*/

CREATE VIEW dept_managers_view AS
SELECT d.department_name, SUBSTRING(s.first_name, 1, 1) AS initial,
  s.last_name AS last_name
FROM staff s
JOIN departments d
ON s.dept_id = d.department_id
WHERE (s.staff_id IN (SELECT manager_id FROM staff));

SELECT *
FROM dept_managers_view;