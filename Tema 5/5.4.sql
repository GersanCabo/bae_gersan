DROP DATABASE IF EXISTS comercio_ventas;
CREATE DATABASE IF NOT EXISTS comercio_ventas;
USE comercio_ventas;

-- 1-Elimine la tabla si existe.
DROP TABLE IF EXISTS facturas;

-- 2-Cree la tabla con la siguiente estructura:
CREATE TABLE facturas (
    numero INT(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    numeroitem SMALLINT UNSIGNED NOT NULL,
    descripcion VARCHAR(30),
    precioporunidad DECIMAL(5,2) UNSIGNED,
    cantidad TINYINT UNSIGNED
);
-- 3-Ingrese algunos registros:
INSERT INTO facturas VALUES (0000000100,1,"escuadra 20cm.",2.50,20);
INSERT INTO facturas VALUES (0000000100,2,"escuadra 50cm.",5.00,30);
INSERT INTO facturas VALUES (0000000100,3,"goma lapiz-tinta",0.35,100);
INSERT INTO facturas VALUES (0000000102,1,"lapices coloresx6",4.40,50);
INSERT INTO facturas VALUES (0000000102,2,"lapices coloresx12",8.00,60);
INSERT INTO facturas VALUES (0000000255,1,"lapices coloresx23",12.35,100);
INSERT INTO facturas VALUES (0000000567,1,"compas plastico",12.00,50);
INSERT INTO facturas VALUES (0000000567,2,"compas metal",18.90,80);

-- 4-Elimine la tabla montofacturas si existe.
DROP TABLE IF EXISTS montofacturas;

/*
5-Se quiere guardar en una tabla denominada montofacturas el número 
de factura y el monto total en dinero de todos los items de cada 
factura (precioporunidad x cantidad). Cree la tabla con la siguiente 
estructura:
*/


