-- Create the customer-order database.
CREATE DATABASE customer_order_lab;

-- Select the customer-order database.
USE customer_order_lab;

-- Create the customers table.
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  city VARCHAR(60),
  region VARCHAR(30),
  signup_date DATE,
  customer_status VARCHAR(20) DEFAULT 'Active',
  CHECK (
    customer_status IN ('Active', 'Inactive', 'Pending')
  )
);

-- Create the orders table.
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT NOT NULL,
  order_date DATE NOT NULL,
  order_status VARCHAR(30) NOT NULL,
  region VARCHAR(30),
  order_total DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

-- Create the delivery_status table.
CREATE TABLE delivery_status (
  delivery_id INT PRIMARY KEY,
  order_id INT NOT NULL UNIQUE,
  promised_date DATE NOT NULL,
  delivered_date DATE NULL,
  delivery_status VARCHAR(30),
  issue_type VARCHAR(60),
  last_updated DATE,
  FOREIGN KEY (order_id) REFERENCES orders (order_id)
);

-- Create the products table.
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(60),
  unit_price DECIMAL(10, 2) NOT NULL CHECK (unit_price >= 0)
);

-- seed customers
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (101, 'Aarav Kumar', 'aarav.kumar@example.com', 'Chennai', 'South', '2027-01-16', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (102, 'Meera Iyer', 'meera.iyer@example.com', 'Coimbatore', 'South', '2027-01-27', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (103, 'Rohan Das', 'rohan.das@example.com', 'Hyderabad', 'South', '2027-02-07', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (104, 'Ananya Rao', 'ananya.rao@example.com', 'Bengaluru', 'South', '2027-02-18', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (105, 'Vikram Shah', 'vikram.shah@example.com', 'Mumbai', 'West', '2027-03-01', 'Inactive');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (106, 'Priya Nair', 'priya.nair@example.com', 'Kochi', 'South', '2027-03-12', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (107, 'Kabir Singh', 'kabir.singh@example.com', 'Delhi', 'North', '2027-03-23', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (108, 'Isha Patel', 'isha.patel@example.com', 'Ahmedabad', 'West', '2027-04-03', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (109, 'Dev Menon', 'dev.menon@example.com', 'Pune', 'West', '2027-04-14', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (110, 'Sara Khan', 'sara.khan@example.com', 'Jaipur', 'North', '2027-04-25', 'Inactive');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (111, 'Arjun Reddy', 'arjun.reddy@example.com', 'Vijayawada', 'South', '2027-05-06', 'Active');
INSERT INTO customers (customer_id, customer_name, email, city, region, signup_date, customer_status) VALUES (112, 'Diya Bose', 'diya.bose@example.com', 'Kolkata', 'East', '2027-05-17', 'Active');

-- seed orders
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1001, 108, '2026-07-04', 'Delivered', 'West', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1002, 103, '2026-07-07', 'Delivered', 'South', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1003, 110, '2026-07-10', 'Delivered', 'North', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1004, 105, '2026-07-13', 'Delivered', 'West', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1005, 112, '2026-07-16', 'Delivered', 'East', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1006, 107, '2026-07-19', 'Delivered', 'North', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1007, 102, '2026-07-22', 'Delivered', 'South', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1008, 109, '2026-07-25', 'Delivered', 'West', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1009, 104, '2026-07-28', 'In Transit', 'South', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1010, 111, '2026-07-31', 'Delivered', 'South', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1011, 106, '2026-08-03', 'Delivered', 'South', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1012, 101, '2026-08-06', 'Delivered', 'South', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1013, 108, '2026-08-09', 'Delivered', 'West', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1014, 103, '2026-08-12', 'Delivered', 'South', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1015, 110, '2026-08-15', 'Delivered', 'North', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1016, 105, '2026-08-18', 'Delivered', 'West', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1017, 112, '2026-08-21', 'Delivered', 'East', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1018, 107, '2026-08-24', 'Delayed', 'North', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1019, 102, '2026-08-27', 'Delivered', 'South', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1020, 109, '2026-08-30', 'Delivered', 'West', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1021, 104, '2026-09-02', 'Delivered', 'South', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1022, 111, '2026-09-05', 'Delivered', 'South', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1023, 106, '2026-09-08', 'Delivered', 'South', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1024, 101, '2026-09-11', 'Delivered', 'South', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1025, 108, '2026-09-14', 'Delivered', 'West', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1026, 103, '2026-09-17', 'Delivered', 'South', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1027, 110, '2026-09-20', 'In Transit', 'North', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1028, 105, '2026-09-23', 'Delivered', 'West', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1029, 112, '2026-09-26', 'Delivered', 'East', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1030, 107, '2026-07-01', 'Delivered', 'North', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1031, 102, '2026-07-04', 'Delivered', 'South', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1032, 109, '2026-07-07', 'Delivered', 'West', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1033, 104, '2026-07-10', 'Delivered', 'South', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1034, 111, '2026-07-13', 'Delivered', 'South', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1035, 106, '2026-07-16', 'Delivered', 'South', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1036, 101, '2026-07-19', 'Delayed', 'South', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1037, 108, '2026-07-22', 'Delivered', 'West', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1038, 103, '2026-07-25', 'Delivered', 'South', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1039, 110, '2026-07-28', 'Delivered', 'North', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1040, 105, '2026-07-31', 'Delivered', 'West', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1041, 112, '2026-08-03', 'Delivered', 'East', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1042, 107, '2026-08-06', 'Delivered', 'North', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1043, 102, '2026-08-09', 'Delivered', 'South', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1044, 109, '2026-08-12', 'Delivered', 'West', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1045, 104, '2026-08-15', 'In Transit', 'South', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1046, 111, '2026-08-18', 'Delivered', 'South', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1047, 106, '2026-08-21', 'Delivered', 'South', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1048, 101, '2026-08-24', 'Delivered', 'South', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1049, 108, '2026-08-27', 'Delivered', 'West', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1050, 103, '2026-08-30', 'Delivered', 'South', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1051, 110, '2026-09-02', 'Delivered', 'North', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1052, 105, '2026-09-05', 'Delivered', 'West', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1053, 112, '2026-09-08', 'Delivered', 'East', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1054, 107, '2026-09-11', 'Delayed', 'North', '799.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1055, 102, '2026-09-14', 'Delivered', 'South', '2998.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1056, 109, '2026-09-17', 'Delivered', 'West', '6597.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1057, 104, '2026-09-20', 'Delivered', 'South', '12499.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1058, 111, '2026-09-23', 'Delivered', 'South', '3798.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1059, 106, '2026-09-26', 'Delivered', 'South', '9897.00');
INSERT INTO orders (order_id, customer_id, order_date, order_status, region, order_total) VALUES (1060, 101, '2026-07-01', 'Delivered', 'South', '799.00');

-- seed delivery_status
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2001, 1001, '2026-07-07', '2026-07-07', 'Delivered', 'Address issue', '2026-07-08');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2002, 1002, '2026-07-11', '2026-07-12', 'Delivered', 'Warehouse delay', '2026-07-13');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2003, 1003, '2026-07-15', '2026-07-17', 'Delivered', 'Carrier delay', '2026-07-18');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2004, 1004, '2026-07-19', '2026-07-23', 'Delivered', 'None', '2026-07-24');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2005, 1005, '2026-07-18', '2026-07-24', 'Delivered', 'Weather', '2026-07-25');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2006, 1006, '2026-07-22', '2026-07-22', 'Delivered', 'Address issue', '2026-07-23');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2007, 1007, '2026-07-26', '2026-07-29', 'Delivered', 'Warehouse delay', '2026-07-30');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2008, 1008, '2026-07-30', '2026-07-29', 'Delivered', 'Carrier delay', '2026-07-30');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2009, 1009, '2026-08-03', NULL, 'In Transit', 'None', '2026-08-04');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2010, 1010, '2026-08-02', '2026-08-03', 'Delivered', 'Weather', '2026-08-04');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2011, 1011, '2026-08-06', '2026-08-08', 'Delivered', 'Address issue', '2026-08-09');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2012, 1012, '2026-08-10', '2026-08-14', 'Delivered', 'Warehouse delay', '2026-08-15');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2013, 1013, '2026-08-14', '2026-08-20', 'Delivered', 'Carrier delay', '2026-08-21');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2014, 1014, '2026-08-18', '2026-08-18', 'Delivered', 'None', '2026-08-19');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2015, 1015, '2026-08-17', '2026-08-20', 'Delivered', 'Weather', '2026-08-21');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2016, 1016, '2026-08-21', '2026-08-20', 'Delivered', 'Address issue', '2026-08-21');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2017, 1017, '2026-08-25', '2026-08-25', 'Delivered', 'Warehouse delay', '2026-08-26');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2018, 1018, '2026-08-29', NULL, 'Delayed', 'Carrier delay', '2026-08-30');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2019, 1019, '2026-09-02', '2026-09-04', 'Delivered', 'None', '2026-09-05');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2020, 1020, '2026-09-01', '2026-09-05', 'Delivered', 'Weather', '2026-09-06');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2021, 1021, '2026-09-05', '2026-09-11', 'Delivered', 'Address issue', '2026-09-12');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2022, 1022, '2026-09-09', '2026-09-09', 'Delivered', 'Warehouse delay', '2026-09-10');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2023, 1023, '2026-09-13', '2026-09-16', 'Delivered', 'Carrier delay', '2026-09-17');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2024, 1024, '2026-09-17', '2026-09-16', 'Delivered', 'None', '2026-09-17');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2025, 1025, '2026-09-16', '2026-09-16', 'Delivered', 'Weather', '2026-09-17');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2026, 1026, '2026-09-20', '2026-09-21', 'Delivered', 'Address issue', '2026-09-22');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2027, 1027, '2026-09-24', NULL, 'In Transit', 'Warehouse delay', '2026-09-25');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2028, 1028, '2026-09-28', '2026-10-02', 'Delivered', 'Carrier delay', '2026-10-03');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2029, 1029, '2026-10-02', '2026-10-08', 'Delivered', 'None', '2026-10-09');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2030, 1030, '2026-07-03', '2026-07-03', 'Delivered', 'Weather', '2026-07-04');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2031, 1031, '2026-07-07', '2026-07-10', 'Delivered', 'Address issue', '2026-07-11');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2032, 1032, '2026-07-11', '2026-07-10', 'Delivered', 'Warehouse delay', '2026-07-11');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2033, 1033, '2026-07-15', '2026-07-15', 'Delivered', 'Carrier delay', '2026-07-16');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2034, 1034, '2026-07-19', '2026-07-20', 'Delivered', 'None', '2026-07-21');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2035, 1035, '2026-07-18', '2026-07-20', 'Delivered', 'Weather', '2026-07-21');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2036, 1036, '2026-07-22', NULL, 'Delayed', 'Address issue', '2026-07-23');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2037, 1037, '2026-07-26', '2026-08-01', 'Delivered', 'Warehouse delay', '2026-08-02');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2038, 1038, '2026-07-30', '2026-07-30', 'Delivered', 'Carrier delay', '2026-07-31');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2039, 1039, '2026-08-03', '2026-08-06', 'Delivered', 'None', '2026-08-07');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2040, 1040, '2026-08-02', '2026-08-01', 'Delivered', 'Weather', '2026-08-02');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2041, 1041, '2026-08-06', '2026-08-06', 'Delivered', 'Address issue', '2026-08-07');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2042, 1042, '2026-08-10', '2026-08-11', 'Delivered', 'Warehouse delay', '2026-08-12');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2043, 1043, '2026-08-14', '2026-08-16', 'Delivered', 'Carrier delay', '2026-08-17');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2044, 1044, '2026-08-18', '2026-08-22', 'Delivered', 'None', '2026-08-23');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2045, 1045, '2026-08-17', NULL, 'In Transit', 'Weather', '2026-08-18');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2046, 1046, '2026-08-21', '2026-08-21', 'Delivered', 'Address issue', '2026-08-22');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2047, 1047, '2026-08-25', '2026-08-28', 'Delivered', 'Warehouse delay', '2026-08-29');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2048, 1048, '2026-08-29', '2026-08-28', 'Delivered', 'Carrier delay', '2026-08-29');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2049, 1049, '2026-09-02', '2026-09-02', 'Delivered', 'None', '2026-09-03');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2050, 1050, '2026-09-01', '2026-09-02', 'Delivered', 'Weather', '2026-09-03');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2051, 1051, '2026-09-05', '2026-09-07', 'Delivered', 'Address issue', '2026-09-08');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2052, 1052, '2026-09-09', '2026-09-13', 'Delivered', 'Warehouse delay', '2026-09-14');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2053, 1053, '2026-09-13', '2026-09-19', 'Delivered', 'Carrier delay', '2026-09-20');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2054, 1054, '2026-09-17', NULL, 'Delayed', 'None', '2026-09-18');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2055, 1055, '2026-09-16', '2026-09-19', 'Delivered', 'Weather', '2026-09-20');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2056, 1056, '2026-09-20', '2026-09-19', 'Delivered', 'Address issue', '2026-09-20');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2057, 1057, '2026-09-24', '2026-09-24', 'Delivered', 'Warehouse delay', '2026-09-25');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2058, 1058, '2026-09-28', '2026-09-29', 'Delivered', 'Carrier delay', '2026-09-30');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2059, 1059, '2026-10-02', '2026-10-04', 'Delivered', 'None', '2026-10-05');
INSERT INTO delivery_status (delivery_id, order_id, promised_date, delivered_date, delivery_status, issue_type, last_updated) VALUES (2060, 1060, '2026-07-03', '2026-07-07', 'Delivered', 'Weather', '2026-07-08');

-- seed products
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (1, 'Wireless Mouse', 'Accessories', '799.00');
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (2, 'Keyboard', 'Accessories', '1499.00');
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (3, 'USB-C Hub', 'Accessories', '2199.00');
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (4, 'Monitor', 'Displays', '12499.00');
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (5, 'Laptop Stand', 'Accessories', '1899.00');
INSERT INTO products (product_id, product_name, category, unit_price) VALUES (6, 'Webcam', 'Video', '3299.00');

