/*CREAMOS TABLAS*/

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

CREATE TABLE customers (
customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
address_id INTEGER,
email VARCHAR(50),
phone VARCHAR(50),
FOREIGN KEY (address_id) REFERENCES address(address_id));

CREATE TABLE city (
city_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_name VARCHAR(50) NOT NULL);


CREATE TABLE address (
address_id INTEGER PRIMARY KEY AUTOINCREMENT,
city_id INTEGER,
address_name VARCHAR(50),
FOREIGN KEY (city_id) REFERENCES city (city_id));

CREATE TABLE employees(
employees_id INTEGER PRIMARY KEY AUTOINCREMENT,
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15) NOT NULL,
address_id INTEGER NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (address_id) REFERENCES address(address_id)
);

CREATE TABLE metodos_pago(
metodos_id INTEGER PRIMARY KEY AUTOINCREMENT,
pago_name VARCHAR(15) NOT NULL, ---referencio que metodo quiere elegir (mp, tarjeta credito o debito)
employees_id INTEGER NOT NULL,
payment_id INTEGER NOT NULL,
FOREIGN KEY (employees_id) REFERENCES employees(employees_id),
FOREIGN KEY (payment_id) REFERENCES payment(payment_id));


CREATE TABLE payment (
payment_id INTEGER PRIMARY KEY AUTOINCREMENT,
employees_id INTEGER,
customer_id INTEGER NOT NULL,
payment VARCHAR(15),
FOREIGN KEY (employees_id) REFERENCES employees(employees_id)
);

/* INSERTAMOS*/
INSERT INTO city (city_name)
VALUES ('Buenos Aires');

INSERT INTO address (city_id, address_name)
VALUES(1, 'Canada 2454'),
(1, 'Ordoñez 6537'),
(1, 'Av Fernandez de la Cruz 6953'),
(1, 'Troilo 132'),
(1, 'Madre Selva 645'),
(1, 'Canada 1720'),
(1, 'Manuela Garandilla 7891'),
(1, 'Comodoro Ceferino Ramirez 5524'), 
(1, 'Cafayate 5986'),
(1, 'Chilavert 4879');

INSERT INTO employees (first_name, last_name, address_id, email)
VALUES ('Federico', 'Villavisencio',1,  'fede@gmailcom'),
('Tomas', 'Mayorga',3 ,'tomas@gmail.com'), 
('Julian', 'Impelluso', 4, 'julian@gmail.com'), 
('Andres', 'Navarro', 5, 'andres@gmail.com'), 
('Mauricio', 'Uribe', 6, 'mauri@gmail.com'), 
('Natan', 'Jaibe', 7, 'natan@gmail.com'), 
('Eduardo' ,'Mestrovich', 8, 'edu@gmailcom'), 
('Alejandro', 'Salomon', 9, 'ale@gmail.com'), 
('Enrico', 'Provoletta', 10, 'provoletta@gmail.com'), 
('Adrian', 'Corvalan', 11, 'adri@gmail.com');

INSERT INTO payment (employees_id, customer_id, payment)
VALUES(1, 1, 'Mercado Pago'), 
(3, 3, 'Efectivo'), 
(4, 4, 'Tarjeta de Credito'), 
(5, 5, 'Tarjeta de Debito'), 
(6, 6, 'Tarjeta UALA'), 
(7, 7, 'Tarjeta Naranja');

INSERT INTO meals(meals_name, price, payment_id)
VALUES('Fideos con Bolognesa', 11000, 2), 
('Risoto', 9500, 3),
('Milanesa (pollo/carne) a la Napolitana', 17000, 4),
('Hamburguesa completa con papas', 15000, 5), 
('Empanadas (variedad)', 1200, 6 ), 
('Porcion de papas', 5500, 1), 
('Pizza Muzzarella', 8000, 2), 
('Pizza Fugazzata', 9500, 3), 
('BurgerPizza (especial de la Casa)', 19000, 4)


