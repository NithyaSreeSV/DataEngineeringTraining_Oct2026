USE customer_order_lab;

-- Select all orders for an initial data check.
SELECT * FROM orders;

-- Insert a sample order for CRUD testing.
INSERT INTO orders
VALUES (9999, 101, '2026-10-05', 'Processing', 'South', 1999.00);

-- Cancel the sample order.
UPDATE orders 
SET order_status = 'Cancelled'
WHERE order_id = 9999;

-- Delete the sample order.
DELETE FROM orders
WHERE order_id = 9999;

-- Find orders with totals between 1000 and 5000.
SELECT order_id AS OrderNumber, order_total AS TotalAmount
FROM orders
WHERE order_total BETWEEN 1000 AND 5000;

-- List each distinct order region.
SELECT DISTINCT region
FROM orders;

-- Find delayed or in-transit orders outside the East region.
SELECT *
FROM orders
WHERE order_status IN ('Delayed', 'In Transit')
AND region <> 'East';

-- Find customers whose names start with A.
SELECT *
FROM customers
WHERE customer_name LIKE 'A%';

-- Format customer regions and calculate name lengths.
SELECT customer_name, UPPER(region) region_upper, LENGTH(customer_name) name_length
FROM customers;

-- Aggregate order count and revenue by region, keeping high-revenue regions.
SELECT region, COUNT(*) order_count, SUM(order_total) revenue, AVG(order_total) avg_order
FROM orders
GROUP BY region
HAVING SUM(order_total) > 10000
ORDER BY revenue DESC;

-- Logical query order: FROM/JOIN, WHERE, GROUP BY, HAVING, SELECT, ORDER BY, LIMIT.
