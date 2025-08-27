/*creamos tablas*/
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

/*insertamos*/
INSERT INTO payment(bank)
VALUES('Galicia'),
('BNA'),
('Sanco Hipotecario'),
('Cencopay Crédito'),
('SUPERVIELLE'),
('Banco Ciudad'),
('NaranjaX'),
('BPN'),
('Patagonia 365'),
('Club La Nacion'),
('Club Río Negro'),
('Club LosAndes pass'),
('Club LaVoz'),
('Santander'),
('Macro'),
('ICBC'),
('BBVA'),
('Cencosud');

INSERT INTO card (payment_id,card_name)
VALUES('Visa',1),
('Mastercad',2),
('American Express',3);

INSERT INTO products (products_name, price, payment_id) /*oficina*/
VALUES ('Escritorio con Cajon-Wood' 400265, 1),
('Biblioteca Liverpool Cruz', 1091075, 2), 
('Biblioteca Net', 378177, 3), 
('Escritorio Hamburgo', 765734, 1),
('Escritorio Quebec', 398843, 2), 
('Escritorio Oxford-Signarute', 842214, 3),
('Escritorio Esquinero Vacho/natural/blanco', 176330, 1),
('Escritorio Reine blanco/natural', 164940, 1),
('Escritorio Eve blanco/natural', 88200, 2),
('Biblioteca Mini 6 Estantes/blanca', 87200, 3), 
('Biblioteca Gamer Negro', 60000, 1),
('Biblioteca Industrial Doble Atakama', 147900, 2),
('Biblioteca Industrial Simple', 112000, 3), 
('Biblioteca 5 Estantes Roble Kendal', 122000, 1), 
('Silla Escritorio con Brazos', 113400, 2), 
('Silla Ejecutivo 2013 negro', 103200, 3), 
('Silla Pc Bistro blanca', 71996, 1), 
('Silla Gamer negro/rojo', 13900, 2),
('Silla de Escritorio Ajustable negro', 89900, 3),
('Silla Ejecutiva Ventura negro', 149000, 1), 
('Silla Pc Tulip rosa', 99990, 2); 

INSERT INTO products (products_name, price, payment_id) /*baño*/
VALUES ('Vanitory Hawai blanco', 490080, 1),
('Vanitory de Vidrio con Pedestal', 128340, 2),
('Vanitory 2 Puertas Mesa de Loza', 476500, 3), 
('Vanitory con Bacha Pentas', 266300, 1), 
('Vanitory 3 Agujeros Mesa Loza Alux Wengue', 949600, 2),
('Vanitory Aysen', 274560, 3), 
('Vanitory de Colgar Melamina Blanca', 138500, 1), 
('Espejo Led Frame Antifog', 193440, 2), 
('Espejo Led con Zoom', 98223, 3), 
('Espejo Led Anti Empañante', 85074, 1), 
('Espejo con Repisa Ole Biselado', 69630, 2), 
('Espejo Redondo Black', 52600, 3), 
('Espejo con Marco beige natural', 28900, 1), 
('Espejo Rectangular Biselado', 64800, 2), 
('Botiquin Trento', 132440, 3), 
('Alacena con Estante Inferior', 77400, 1), 
('Alacena Puerta Vidriada blanca', 221500, 2), 
('Alacena Lateral de Espejo', 54600, 3), 
('Repisa Vidrio Rectangular', 16600, 1), 
('Botiquin Repisa y luz', 320400, 2); 
