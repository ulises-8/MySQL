-- Ulises Marian

USE restaurant;


/* 
Query 1: Display the food item number and description of all food items with
a name that begins with ‘S’. Use an appropriate alias for your column heading
*/

SELECT item_number AS "item id", description AS "item name"
FROM food_items
WHERE description LIKE 'S%';


/*
Query 2: Use the IN operator to list the food item number and description
of each item where description is Hamburger or Chicken McNuggets
*/

SELECT item_number, description 
FROM food_items
WHERE description IN ('Hamburger', 'Chicken McNuggets');


/* 
Query 3: Use a search pattern to find all food item names with 'p' as the
second letter and 'c' as the fourth letter. List each food item number,
price, and description. Sort the list by food item number in descending order
*/
 
SELECT item_number, description, price 
FROM food_items
WHERE description LIKE '_p_c%'
ORDER BY item_number DESC;


-- Query 4: List the item number and description of each food item that is not in item number 81
SELECT item_number, description
FROM food_items
WHERE item_number NOT IN (81);


/* 
Query 5: List the food item number and description of all food items that are
in item number 82 or 83 and contain the word “Chicken” in the description
*/

SELECT item_number, description
FROM food_items
WHERE item_number IN (82, 83) AND description LIKE '%Chicken%';


/*
Query 6: Display the first name, last name, and salary of all International
Foods Restaurant staff whose salary is between $1000.00 and $3000.00 per month
*/
 
SELECT first_name, last_name, salary
FROM staff
WHERE salary BETWEEN 1000.00 AND 3000.00;


-- Query 7: Display the last names of all employees who have 'e' and 'n' in their last names
SELECT last_name
FROM staff
WHERE last_name LIKE '%e%' AND last_name LIKE '%n%';


/*
Query 8: Display the last names of all employees who make a 
monthly salary that is more than $4,000 and their job ID is not S_MGR
*/

SELECT last_name
FROM staff
WHERE salary > 4000.00 AND job_id != 'S_MGR';


/*
Query 9: Display all employees whose last names start with 'R'
and have 'a' and 'e' anywhere in their last name
*/

SELECT last_name
FROM staff
WHERE last_name LIKE 'R%a%e%';


/* 
Query 10: Display all employees who DO NOT earn exactly $3400, $3000, or $6000
and whose first name begins with the letter 'S'
*/

SELECT first_name, last_name, salary
FROM staff
WHERE salary NOT IN (3400.00, 3000.00, 6000.00) AND first_name LIKE 'S%';


-- Query 11: Display the rows where the customer number is between 15 and 25
SELECT last_name, first_name, customer_id
FROM customers
WHERE customer_id BETWEEN 15 AND 25;