-- 1. Create a new database
CREATE DATABASE training_db;

-- 2. Select that database
USE training_db;

-- 3. Create a Employee TABLE
CREATE TABLE employees
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50)
);

-- 4. Insert values into Employees
INSERT INTO employees
VALUES
(1, 'Amit Sharma', 'IT', 60000, 'Hyderabad'),
(2, 'Sara Khan', 'HR', 50000, 'Bangalore'),
(3, 'Rahul Verma', 'Finance', 55000, 'Hyderabad'),
(4, 'Neha Singh', 'IT', 65000, 'Pune'),
(5, 'Arjun Mehta', 'Sales', 45000, 'Mumbai');

-- 5. Check the insertion operation
SELECT * FROM employees;

-- 6. Update Operation
UPDATE employees 
SET emp_name = "Rahul Varma"
WHERE emp_id = 3;

-- 7. Delete Operation
Delete FROM employees
WHERE emp_id = 4;


