/*CREAMOS TABLAS*/

CREATE TABLE drinks (
drinks_id INTEGER PRIMARY KEY AUTOINCREMENT,
drinks_name VARCHAR(50) NOT NULL
);

CREATE TABLE "category" (
	category_id	INTEGER,
	meals_id	INTEGER NOT NULL,
	drinks_id	INTEGER NOT NULL,
	meals_cat	INTEGER NOT NULL,
	drinks_cat	INTEGER NOT NULL,
	FOREIGN KEY("drinks_id") REFERENCES "drinks"("drinks_id"),
	PRIMARY KEY("category_id" AUTOINCREMENT),
	FOREIGN KEY("meals_id") REFERENCES "meals"("meals_id")
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
VALUES ('Federico', 'villavicencio',1,  'fede@gmailcom'),
('Tomas', 'Mayorga',2 ,'tomas@gmail.com'), 
('Julian', 'Impelluso', 3, 'julian@gmail.com'), 
('Andres', 'Navarro', 4, 'andres@gmail.com'), 
('Mauricio', 'Uribe', 5, 'mauri@gmail.com'), 
('Natan', 'Jaibe', 6, 'natan@gmail.com'), 
('Eduardo' ,'Mestrovich', 7, 'edu@gmailcom'), 
('Alejandro', 'Salomon', 8, 'ale@gmail.com'), 
('Enrico', 'Provoletta', 9, 'provoletta@gmail.com'), 
('Adrian', 'Corvalan', 10, 'adri@gmail.com');

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
('Pizza Fugazzeta', 9500, 3), 
('BurgerPizza (Especial de la Casa)', 19000, 4)

INSERT INTO drinks(drinks_id, drinks_name)
VALUES (1, 'Agua'), 
(2, 'Coca Cola'), 
(3, 'Sprite'), 
(4, 'Fanta'), 
(5, 'Agua Savorizada'), 
(6, 'Agua con gas'), 
(7, 'Limonada'), 
(8, 'Cerveza'), 
(9, 'Caipirinha'); 


INSERT INTO category (meals_id, drinks_id, meals_cat, drinks_cat)
VALUES (1, 1, 'Pastas', 'Agua'), 
(2, 2, 'Plato principal', 'Gaseosas'), 
(3, 3, 'Minuta', 'Gaseosas'), 
(4, 4, 'Minuta', 'Gaseosas'), 
(5, 5, 'Minuta', 'Jugos'), 
(6, 6, 'Guarniciones', 'Agua'), 
(7, 7, 'Pizzas', 'Jugos'), 
(8, 8, 'Pizzas', 'Bebidas Alcoholicas'), 
(9, 9, 'Especial de la Casa', 'Bebidas Alchoholicas'); 

INSERT INTO customers (first_name, last_name, address_id, email,phone)
VALUES ('Mary Luz', 'Llusco',1, 'mary@gmail.com', '1131175565'),
('Lucia','Acuña',2, 'luci@gmail.com', '1141719615'),
('Abril','Herbas',3, 'abril@gmail.com','1167377704'),
('Rocio','Albarracion',4, 'rocio@gmail.com','1136118005'),
('Valentin','Velazquez',5, 'valen@gmail.com','1161138645'),
('Dylan','Aragon',6, 'dylan@gmail.com','1152603980'),
('Thomas','Avila',7, 'thomas@gmail.com','1152297349'),
('Enzo','Materazzi',8, 'enzo@gmail.com','1123539461'),
('Ayelen','Quispe',9, 'ayelen@gmail.com','1140430201'),
('Ariana','Villa', 10 , 'ariana@gmail.com','1161929792');

/*ACTUALIZAR DATOS*/
SELECT customer_id, first_name, last_name FROM customers
WHERE first_name IN ('Enzo', 'Ayelen', 'Ariana'); 
UPDATE customers set first_name = 'Leonardo', last_name = 'DiCaprio' WHERE customer_id = 8;
UPDATE customers set first_name = 'Roberto', last_name = 'Martinez' WHERE customer_id = 9;
UPDATE customers set first_name = 'Bianca', last_name = 'Fernandez' WHERE customer_id = 10;

/*BORRAR DATOS*/
DELETE FROM customers WHERE customer_id IN (8, 9, 10);

/*INNER JOIN*/
SELECT m.meals_name, m.price, p.payment_id FROM meals m 
INNER JOIN payment p ON m.meals_id = p.payment_id

/*INNER JOIN*/
SELECT e.employees_id, e.first_name, e.last_name, e.email FROM employees e
INNER JOIN address a ON e.employees_id = a.address_id

