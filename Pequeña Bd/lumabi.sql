CREATE TABLE drinks (
drinks_id INTEGER PRIMARY KEY AUTOINCREMENT,
drinks_name VARCHAR(50) NOT NULL
);

CREATE TABLE category (
category_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_id INTEGER NOT NULL, 
drinks_id INTEGER NOT NULL,
FOREIGN KEY (drinks_id) REFERENCES drinks(drinks_id),
FOREIGN KEY (meals_id) REFERENCES meals(meals_id)
);

CREATE TABLE meals (
meals_id INTEGER PRIMARY KEY AUTOINCREMENT,
meals_name VARCHAR(50) NOT NULL,
price DECIMAL(8,2),
payment_id INTEGER NOT NULL,
FOREIGN KEY(payment_id) REFERENCES payment (payment_id)
);