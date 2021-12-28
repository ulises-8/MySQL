-- Ulises Marian

USE restaurant;

/* 
Query 1:
Write the CREATE TABLE statement for the International Foods Restaurant
global locations table. Define the constraints at the column level.
*/

CREATE TABLE global_locations (
    id INT(4) PRIMARY KEY,
    loc_name VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20),
    zip_postal_code VARCHAR(20),
    phone VARCHAR(15),
    email VARCHAR(15) UNIQUE,
    manager_id INT(4),
    emergency_contact VARCHAR(20)
);

/* 
Query 2:
Rewrite the CREATE TABLE statement for the International Foods Restaurant
locations table to define the UNIQUE constraints at the table level.
Do not execute this statement.
*/

-- CREATE TABLE global_locations (
-- 	   id INT(4),
--     loc_name VARCHAR(20),
--     address VARCHAR(20),
--     city VARCHAR(20),
--     zip_postal_code VARCHAR(20),
--     phone VARCHAR(15),
--     email VARCHAR(15),
--     manager_id INT(4),
--     emergency_contact VARCHAR(20),
--     PRIMARY KEY(id),
--     UNIQUE (email)
-- );


/* 
Query 3:
Alter the global_locations table
to add a column that stores the date of open location.
*/

ALTER TABLE global_locations
ADD date_opened DATE;


-- Query 4: Display column names and datatypes for the global_locations table.

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='global_locations';


-- Query 5: Delete the date_opened column from the global_locations table.

ALTER TABLE global_locations
DROP COLUMN date_opened;


-- Query 6: Rename the global_locations table as global_locations_backup.

ALTER TABLE global_locations
RENAME TO global_locations_backup;


/* Query 7:
Write an INSERT statement that adds this row to the customers table:

customer_ID: 60
first_name: brian
last_name: rogers
phone_number: 01654564898'
address: 820 Bounty Drive
city: Palo Alto
state: CA
zip: 94342
*/

INSERT INTO customers
  (customer_id, first_name, last_name, phone_number, address,
   city, state, zip)
VALUES
  (60, 'brian', 'rogers', 01654564898, '820 Bounty Drive',
   'Palo Alto', 'CA', 94342);


-- Query 8: Create the three o_tables (jobs, employees, and departments)

CREATE TABLE o_jobs AS
SELECT *
FROM jobs;

CREATE TABLE o_staff AS
SELECT staff_id, first_name, last_name, email, hire_date, job_id
FROM staff;

CREATE TABLE o_departments AS
SELECT *
FROM departments;


/*
Query 9:
Write an INSERT statement that adds
the Human Resources job to the o_jobs table:
*/

INSERT INTO o_jobs (job_id, job_title, min_salary, max_salary)
VALUES ('hr_man', 'human resources manager', 4500, 5500);


-- Query 10: Rename the o_jobs table to o_job_description.

ALTER TABLE o_jobs
RENAME TO o_job_description;


-- Query 11: Add three new employees to the o_staff table

INSERT INTO o_staff
  (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES
  (210, 'Ramon', 'Sanchez', 'RSANCHEZ', CURDATE(), 'HR_MAN');
 
INSERT INTO o_staff
  (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES
  (211, 'Tai', 'Sugita', 'TSUGITA', CURDATE(), 'HR_MAN');
 
INSERT INTO o_staff
  (staff_id, first_name, last_name, email, hire_date, job_id)
VALUES
  (212, 'Alina', 'Arcos', 'AARCOS', CURDATE(), 'HR_MAN');



/* Query 12: 
Create a copy of the staff table and call it your_initials_emp.
Add a column to the new table called department_name,
and make this column the same data type and length
as the department_name column in the departments table.
Display the names of the tables in your current database:
*/

CREATE TABLE um_emp
LIKE staff;

INSERT INTO um_emp
SELECT *
FROM staff;

ALTER TABLE um_emp
ADD department_name VARCHAR(30);

SHOW TABLES;


/*
Query 13:
Remove the global_locations_backup table from the database.
Display the names of the tables in your current database.
*/

DROP TABLE global_locations_backup;
SHOW TABLES;
