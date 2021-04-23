DROP DATABASE IF EXISTS comercio;
CREATE DATABASE IF NOT EXISTS comercio;
USE comercio;

-- 1-Elimine la tabla si existe
DROP TABLE IF EXISTS facturas;

-- 2-Cree la tabla con la siguiente estructura:
CREATE TABLE facturas (
    numero INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    numeroitem SMALLINT UNSIGNED NOT NULL,
    descripcion VARCHAR(30),
    precioporunidad DECIMAL(5,2) UNSIGNED,
    cantidad TINYINT UNSIGNED,
    PRIMARY KEY (numero, numeroitem)
);

-- 3-Ingrese algunos registros:
INSERT INTO facturas VALUES (0000000100,1,'escuadra 20 cm.',2.50,20);
INSERT INTO facturas VALUES (0000000100,2,'escuadra 50 cm.',5.00,30);
INSERT INTO facturas VALUES (0000000100,3,'gama lapiz-tinta',0.35,100);
INSERT INTO facturas VALUES (0000000102,1,'lapices coloresx6',4.40,50);
INSERT INTO facturas VALUES (0000000102,2,'lapices coloresx12',8.00,60);
INSERT INTO facturas VALUES (0000000255,1,'lapices coloresx24',12.35,100);
INSERT INTO facturas VALUES (0000000567,1,'compas plastico',12.00,50);
INSERT INTO facturas VALUES (0000000567,2,'compas metal',18.90,80);

/* 
    4-Se quiere guardar la siguiente información en una tabla denominada montofacturas:

    numero: número de factura,
    total: total en dinero de todos los items de cada factura (precioporunidad x cantidad).
*/
CREATE TABLE montofacturas (
    numero INT(10),
    total DECIMAL(6,2)
);

-- 5-Elimine la tabla montofacturas si existe.
DROP TABLE IF EXISTS montofacturas;

/*
6-Realice una consulta de la tabla facturas, agrupando por numero, en la cual aparezca el 
número de factura y el monto total de todos sus items.
*/
SELECT numero, SUM(cantidad * precioporunidad) AS total FROM facturas GROUP BY numero;

-- 7-Cree la tabla montofacturas a partir de la consulta anterior.
CREATE TABLE montofacturas 
    SELECT numero, SUM(cantidad * precioporunidad) AS total FROM facturas GROUP BY numero;
ALTER TABLE montofacturas ADD PRIMARY KEY(numero);

-- 8-Muestre todos los registros de la tabla montofacturas.
SELECT * FROM montofacturas;

-- 9-Visualice la estructura de la nueva tabla creada.
DESCRIBE montofacturas;