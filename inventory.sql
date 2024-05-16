/*
This file contains a script of PL/SQL commands for creating, populating, and querying the 'inventory' database.
Assumptions:
1. The database is named 'inventory'.
2. The database already exists.
Details:
1. Creates a 'categories' table and a referentially related table 'products'.
2. Populates the 'categories' table with data.
3. Populates the 'products' table with data.
4. Create stored procedures to query the 'products' table based on category and product name.
*/

-- set the default database to 'inventory'
USE inventory;

-- create the 'categories' table if it does not exist
CREATE TABLE IF NOT EXISTS categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- create the 'products' table if it does not exist
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category_id INT,
    -- add a timestamp column to track the date and time of product creation and modification
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- populate the 'categories' table with data
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Books'),
(4, 'Home & Kitchen'),
(5, 'Sports & Outdoors');

-- populate the 'products' table with data
INSERT INTO products (product_id, product_name, category_id) VALUES
(1, 'Laptop', 1),
(2, 'T-shirt', 2),
(3, 'Novel', 3),
(4, 'Cookware Set', 4),
(5, 'Yoga Mat', 5);

-- create a stored procedure to query products by category
DELIMITER //
CREATE PROCEDURE getProductsByCategory(IN categoryName VARCHAR(50))
BEGIN
    SELECT p.product_id, p.product_name, c.category_name
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE c.category_name = categoryName;
END //
DELIMITER ;

-- create a stored procedure to query products by name
DELIMITER //
CREATE PROCEDURE getProductsByName(IN productName VARCHAR(50))
BEGIN
    SELECT p.product_id, p.product_name, c.category_name
    FROM products p
    JOIN categories c ON p.category_id = c.category_id
    WHERE p.product_name = productName;
END //
DELIMITER ;

