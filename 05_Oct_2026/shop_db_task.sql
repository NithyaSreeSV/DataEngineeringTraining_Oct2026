-- Basics and CRUD task

/* 1. Create a database named shop_db.
2. Create a table named products with:
        o Product ID
        o Product Name
        o Category
        o Price
        o Stock Quantity
3. Make Product ID the primary key.
4. Insert at least 6 products from different categories.
5. Display all products.
6. Display only Product Name and Price.
7. Insert a new product named Wireless Mouse.
8. Change the price of one product using its Product ID.
9. Increase the price of all products in the Electronics category by 10%.
10. Reduce the stock quantity of one product after a sale.
11. Change the category of one product.
12. Display products costing more than ₹1,000.
13. Display products whose stock quantity is less than 10.
14. Display only Electronics products.
15. Sort products from highest price to lowest price.
16. Delete one product using its Product ID.
17. Delete products whose stock quantity is 0.
18. Display all remaining products. */

CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE products
(
    product_id INT,
    product_name VARCHAR(25),
    category VARCHAR(20),
    price DECIMAL(10,2),
    stock_quantity INT
);

ALTER TABLE products ADD CONSTRAINT PRIMARY KEY products(product_id);

INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(101, 'Smartphone X', 'Electronics', 15000.00, 25),
(102, 'Laptop Pro', 'Electronics', 55000.00, 8),
(103, 'Running Shoes', 'Footwear', 1200.00, 15),
(104, 'Coffee Maker', 'Appliances', 2500.00, 5),
(105, 'Desk Lamp', 'Home Decor', 850.00, 0),
(106, 'Fiction Novel', 'Books', 450.00, 40);

SELECT * FROM products;

SELECT product_name, price FROM products;

INSERT INTO products (product_id, product_name, category, price, stock_quantity) VALUES
(107, 'Wireless Mouse', 'Electronics', 600.00, 30);

UPDATE products
SET price = 1400.00
WHERE product_id = 103;

UPDATE products
SET price = price + (0.10*price)
WHERE category = 'Electronics';

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 101;

UPDATE products
SET category = 'Office Supplies'
WHERE product_id = 105;

SELECT * FROM products where price > 1000.00;

SELECT * FROM products where stock_quantity < 10;

SELECT * FROM products where category = 'Electronics';

SELECT * FROM products ORDER BY price DESC;

DELETE FROM products 
WHERE product_id = 104;

DELETE FROM products 
WHERE stock_quantity = 0;

SELECT * FROM products;
