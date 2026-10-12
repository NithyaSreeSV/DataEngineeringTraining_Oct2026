-- Create the supply-chain database.
CREATE DATABASE supply_chain_lab;

-- Select the supply-chain database.
USE supply_chain_lab;

-- Create the suppliers table.
CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(100) NOT NULL,
  country VARCHAR(50),
  risk_tier VARCHAR(20),
  contact_email VARCHAR(150) UNIQUE
);

-- Create the products table.
CREATE TABLE products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  unit_cost DECIMAL(10, 2) NOT NULL CHECK (unit_cost >= 0),
  reorder_level INT NOT NULL CHECK (reorder_level >= 0)
);

-- Create the inventory table.
CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  warehouse_name VARCHAR(100),
  quantity_on_hand INT NOT NULL CHECK (quantity_on_hand >= 0),
  reorder_level INT NOT NULL,
  last_counted DATE,
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);

-- Create the orders table.
CREATE TABLE orders (
  shipment_id INT PRIMARY KEY,
  supplier_id INT NOT NULL,
  product_id INT NOT NULL,
  warehouse_id INT NOT NULL,
  order_date DATE NOT NULL,
  expected_date DATE NOT NULL,
  actual_date DATE NULL,
  quantity INT NOT NULL CHECK (quantity > 0),
  shipment_status VARCHAR(30),
  FOREIGN KEY (supplier_id) REFERENCES suppliers (supplier_id),
  FOREIGN KEY (product_id) REFERENCES products (product_id)
);


-- seed suppliers
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (1, 'Aster Components', 'India', 'Low', 'ops@aster.example');
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (2, 'BluePeak Supply', 'India', 'Medium', 'service@bluepeak.example');
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (3, 'Cedar Industrial', 'Malaysia', 'High', 'orders@cedar.example');
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (4, 'Delta Wholesale', 'India', 'Low', 'sales@delta.example');
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (5, 'Evergreen Imports', 'Singapore', 'Medium', 'team@evergreen.example');
INSERT INTO suppliers (supplier_id, supplier_name, country, risk_tier, contact_email) VALUES (6, 'Futura Logistics', 'India', 'High', 'ship@futura.example');

-- seed products
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (1, 'USB Cable', 'Accessories', '120.00', 50);
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (2, 'Power Adapter', 'Power', '450.00', 30);
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (3, 'Sensor Module', 'Electronics', '850.00', 20);
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (4, 'Router', 'Networking', '2400.00', 15);
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (5, 'Battery Pack', 'Power', '1100.00', 25);
INSERT INTO products (product_id, product_name, category, unit_cost, reorder_level) VALUES (6, 'Control Board', 'Electronics', '1800.00', 12);

-- seed inventory
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (1, 1, 1, 'Chennai WH', 35, 50, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (2, 2, 1, 'Chennai WH', 22, 30, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (3, 3, 1, 'Chennai WH', 65, 20, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (4, 4, 1, 'Chennai WH', 48, 15, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (5, 5, 1, 'Chennai WH', 65, 25, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (6, 6, 1, 'Chennai WH', 22, 12, '2026-10-02');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (7, 1, 2, 'Coimbatore WH', 14, 50, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (8, 2, 2, 'Coimbatore WH', 35, 30, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (9, 3, 2, 'Coimbatore WH', 8, 20, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (10, 4, 2, 'Coimbatore WH', 22, 15, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (11, 5, 2, 'Coimbatore WH', 35, 25, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (12, 6, 2, 'Coimbatore WH', 22, 12, '2026-10-03');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (13, 1, 3, 'Bengaluru WH', 65, 50, '2026-10-04');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (14, 2, 3, 'Bengaluru WH', 90, 30, '2026-10-04');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (15, 3, 3, 'Bengaluru WH', 35, 20, '2026-10-04');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (16, 4, 3, 'Bengaluru WH', 65, 15, '2026-10-04');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (17, 5, 3, 'Bengaluru WH', 90, 25, '2026-10-04');
INSERT INTO inventory (inventory_id, product_id, warehouse_id, warehouse_name, quantity_on_hand, reorder_level, last_counted) VALUES (18, 6, 3, 'Bengaluru WH', 48, 12, '2026-10-04');

-- seed orders
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3001, 6, 3, 2, '2026-07-03', '2026-07-07', '2026-07-07', 11, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3002, 5, 5, 3, '2026-07-05', '2026-07-10', '2026-07-11', 12, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3003, 4, 1, 1, '2026-07-07', '2026-07-13', '2026-07-15', 13, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3004, 3, 3, 2, '2026-07-09', '2026-07-12', '2026-07-17', 14, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3005, 2, 5, 3, '2026-07-11', '2026-07-15', '2026-07-18', 15, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3006, 1, 1, 1, '2026-07-13', '2026-07-18', '2026-07-17', 16, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3007, 6, 3, 2, '2026-07-15', '2026-07-21', '2026-07-21', 17, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3008, 5, 5, 3, '2026-07-17', '2026-07-20', NULL, 18, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3009, 4, 1, 1, '2026-07-19', '2026-07-23', '2026-07-25', 19, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3010, 3, 3, 2, '2026-07-21', '2026-07-26', '2026-07-31', 20, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3011, 2, 5, 3, '2026-07-23', '2026-07-29', '2026-08-01', 21, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3012, 1, 1, 1, '2026-07-25', '2026-07-28', '2026-07-27', 22, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3013, 6, 3, 2, '2026-07-27', '2026-07-31', '2026-07-31', 23, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3014, 5, 5, 3, '2026-07-29', '2026-08-03', '2026-08-04', 24, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3015, 4, 1, 1, '2026-07-31', '2026-08-06', '2026-08-08', 25, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3016, 3, 3, 2, '2026-08-02', '2026-08-05', NULL, 26, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3017, 2, 5, 3, '2026-08-04', '2026-08-08', '2026-08-11', 27, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3018, 1, 1, 1, '2026-08-06', '2026-08-11', '2026-08-10', 28, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3019, 6, 3, 2, '2026-08-08', '2026-08-14', '2026-08-14', 29, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3020, 5, 5, 3, '2026-08-10', '2026-08-13', '2026-08-14', 30, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3021, 4, 1, 1, '2026-08-12', '2026-08-16', '2026-08-18', 31, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3022, 3, 3, 2, '2026-08-14', '2026-08-19', '2026-08-24', 32, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3023, 2, 5, 3, '2026-08-16', '2026-08-22', '2026-08-25', 33, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3024, 1, 1, 1, '2026-08-18', '2026-08-21', NULL, 34, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3025, 6, 3, 2, '2026-08-20', '2026-08-24', '2026-08-24', 35, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3026, 5, 5, 3, '2026-08-22', '2026-08-27', '2026-08-28', 36, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3027, 4, 1, 1, '2026-08-24', '2026-08-30', '2026-09-01', 37, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3028, 3, 3, 2, '2026-08-26', '2026-08-29', '2026-09-03', 38, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3029, 2, 5, 3, '2026-08-28', '2026-09-01', '2026-09-04', 39, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3030, 1, 1, 1, '2026-08-30', '2026-09-04', '2026-09-03', 40, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3031, 6, 3, 2, '2026-09-01', '2026-09-07', '2026-09-07', 41, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3032, 5, 5, 3, '2026-09-03', '2026-09-06', NULL, 42, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3033, 4, 1, 1, '2026-09-05', '2026-09-09', '2026-09-11', 43, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3034, 3, 3, 2, '2026-09-07', '2026-09-12', '2026-09-17', 44, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3035, 2, 5, 3, '2026-09-09', '2026-09-15', '2026-09-18', 45, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3036, 1, 1, 1, '2026-09-11', '2026-09-14', '2026-09-13', 46, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3037, 6, 3, 2, '2026-09-13', '2026-09-17', '2026-09-17', 47, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3038, 5, 5, 3, '2026-09-15', '2026-09-20', '2026-09-21', 48, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3039, 4, 1, 1, '2026-09-17', '2026-09-23', '2026-09-25', 49, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3040, 3, 3, 2, '2026-09-19', '2026-09-22', NULL, 10, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3041, 2, 5, 3, '2026-09-21', '2026-09-25', '2026-09-28', 11, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3042, 1, 1, 1, '2026-09-23', '2026-09-28', '2026-09-27', 12, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3043, 6, 3, 2, '2026-09-25', '2026-10-01', '2026-10-01', 13, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3044, 5, 5, 3, '2026-09-27', '2026-09-30', '2026-10-01', 14, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3045, 4, 1, 1, '2026-07-01', '2026-07-05', '2026-07-07', 15, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3046, 3, 3, 2, '2026-07-03', '2026-07-08', '2026-07-13', 16, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3047, 2, 5, 3, '2026-07-05', '2026-07-11', '2026-07-14', 17, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3048, 1, 1, 1, '2026-07-07', '2026-07-10', NULL, 18, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3049, 6, 3, 2, '2026-07-09', '2026-07-13', '2026-07-13', 19, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3050, 5, 5, 3, '2026-07-11', '2026-07-16', '2026-07-17', 20, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3051, 4, 1, 1, '2026-07-13', '2026-07-19', '2026-07-21', 21, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3052, 3, 3, 2, '2026-07-15', '2026-07-18', '2026-07-23', 22, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3053, 2, 5, 3, '2026-07-17', '2026-07-21', '2026-07-24', 23, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3054, 1, 1, 1, '2026-07-19', '2026-07-24', '2026-07-23', 24, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3055, 6, 3, 2, '2026-07-21', '2026-07-27', '2026-07-27', 25, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3056, 5, 5, 3, '2026-07-23', '2026-07-26', NULL, 26, 'Delayed');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3057, 4, 1, 1, '2026-07-25', '2026-07-29', '2026-07-31', 27, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3058, 3, 3, 2, '2026-07-27', '2026-08-01', '2026-08-06', 28, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3059, 2, 5, 3, '2026-07-29', '2026-08-04', '2026-08-07', 29, 'Received');
INSERT INTO orders (shipment_id, supplier_id, product_id, warehouse_id, order_date, expected_date, actual_date, quantity, shipment_status) VALUES (3060, 1, 1, 1, '2026-07-31', '2026-08-03', '2026-08-02', 30, 'Received');
