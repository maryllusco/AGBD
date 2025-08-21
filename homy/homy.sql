CREATE TABLE payment(
payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
bank VARCHAR(50) NOT NULL
);

CREATE TABLE card (
card_id INTEGER PRIMARY KEY AUTOINCREMENT,
card_name VARCHAR(50) NOT NULL,
payment_id INTEGER
);

CREATE TABLE products(
products_id INTEGER PRIMARY KEY AUTOINCREMENT,
products_name VARCHAR(50) NOT NULL,
price DECIMAL(8,2),
unit INTEGER,
payment_id INTEGER NOT NULL
);

CREATE TABLE receipt (
receipt_id INTEGER PRIMARY KEY AUTOINCREMENT,
date CURRENT_TIMESTAMP,
products_id INTEGER,
amount  
payment_id INTEGER,
customers_id INTEGER
);

CREATE TABLE category(
category_id INTEGER PRIMARY KEY AUTOINCREMENT,
products_id VARCHAR(50) NOT NULL,
category_name VARCHAR(50) NOT NULL,
FOREIGN KEY(products_id) REFERENCES "products"(products_id)
); 

CREATE TABLE customers (
customers_id INTEGER PRIMARY KEY AUTOINCREMENT,
customers_name VARCHAR(50) NOT NULL,
customers_lastname VARCHAR(50) NOT NULL,
customers_email VARCHAR(50) NOT NULL,
customers_address VARCHAR(50) NOT NULL,
receipt_id INTEGER,
FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id));

CREATE TABLE inventory (
inventory_id INTEGER PRIMARY KEY AUTOINCREMENT,
products_id INTEGER,
stock VARCHAR(50),
location VARCHAR(50),
status_id VARCHAR(50),
FOREIGN KEY (products_id) REFERENCES products(products_id)
);

CREATE TABLE intermediate (
intermediate_id INTEGER PRIMARY KEY,
products_id INTEGER NOT NULL,
category_id INTEGER NOT NULL,
FOREIGN KEY (products_id) REFERENCES products(products_id),
FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE shipping (
shipping_id INTEGER PRIMARY KEY AUTOINCREMENT,
shipping_date DATETIME DEFAULT CURRENT_TIMESTAMP,
receipt_id INTEGER,
status_id INTEGER,
FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id),
FOREIGN KEY (status_id) REFERENCES status (status_id)
);

CREATE TABLE status (
status_id INTEGER PRIMARY KEY AUTOINCREMENT,
status_name VARCHAR(50) NOT NULL,
description TEXT ,
shipping_id INTEGER ,
inventory_id INTEGER ,
FOREIGN KEY (shipping_id) REFERENCES shipping(shipping_id),
FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id));