-- Ulises Marian

USE restaurant;

-- Question : List the food item number, description, and price for all food items.
SELECT item_number, description, price
FROM food_items;


-- Question : List all details of all items. Order the output by food item number within price.
SELECT *
FROM food_items
ORDER BY price, item_number;


-- Question : List all rows and columns for the complete orders table.
SELECT *
FROM orders;


-- Question : List the order number for each order placed by customer ID 30 on 07/03/2020.
SELECT order_number
FROM orders
WHERE cust_id = 30 AND order_date = '2020-07-03';


-- Question : Display the order number and date of all orders placed before 05/28/2020.
SELECT order_number AS "order number", order_date AS "order date"
FROM orders
WHERE order_date < '2020-05-28';


-- Question : Display the customer ID from the orders table. Display each customer number only once.
SELECT DISTINCT cust_id
FROM orders;


-- Question : Return the customer’s last name and a mailing address.
SELECT last_name, address
FROM customers;


-- Question : Display the customer ID, first name, last name, and phone number of each customer.
SELECT customer_id, first_name, last_name, phone_number
FROM customers;


-- Question : Display the customer ID, first name, and last name for all customers who live in San Francisco.
SELECT customer_id, first_name, last_name
FROM customers
WHERE city = 'San Francisco';


-- Question : Display the customer’s last name, first name, ID, and phone number, where customer ID column is 36.
SELECT last_name, first_name, customer_id, phone_number
FROM customers
WHERE customer_id = 36;
