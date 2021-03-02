DROP DATABASE IF EXISTS tienda;

CREATE DATABASE tienda;
USE tienda;

CREATE TABLE fabricantes (
	clave_fabricante INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30)
);

CREATE TABLE articulos (
	clave_articulo INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(30),
	precio INT,
	clave_fabricante INT,
	FOREIGN KEY (clave_fabricante) REFERENCES fabricantes(clave_fabricante)
);

INSERT INTO fabricantes VALUES 
('1','Kingston'),
('2','Adata'),
('3','Logitech'),
('4','Lexar'),
('5','Seagate');

INSERT INTO articulos VALUES 
('1','Teclado','100','3'),
('2','Disco duro','500','5'),
('3','Mouse','80','3'),
('4','Memoria USB','140','4'),
('5','Memoria RAM','290','1'),
('6','Disco duro extraible 250Gb','650','5'),
('7','Memoria USB','279','1'),
('8','DVD Rom','450','2'),
('9','CD Rom','200','2'),
('10','Tarjeta de red','180','3');

--a) Obtener todos los datos de los productos de la tienda.

SELECT * FROM articulos;

--b) Obtener los nombres de los productos de la tienda.

SELECT nombre FROM articulos;

--c) Obtener los nombres y precio de los productos de la tienda.

SELECT nombre, precio FROM articulos;

--d) Obtener los nombres de los artículos sin repeticiones.

SELECT DISTINCT nombre FROM articulos;

--e) Obtener todos los datos del artículo cuya clave de producto es ‘5’.

SELECT * FROM articulos WHERE clave_articulo = 5;

--f) Obtener todos los datos del artículo cuyo nombre del producto es ‘’Teclado”.

SELECT * FROM articulos WHERE nombre="Teclado";

--g) Obtener todos los datos de la Memoria RAM y memorias USB.

SELECT * FROM articulos WHERE nombre IN ("Memoria RAM","Memoria USB");

--h) Obtener todos los datos de los artículos que empiezan con ‘M’.

SELECT * FROM articulos WHERE nombre LIKE "M%";

--i) Obtener el nombre de los productos donde el precio sea 100.

SELECT nombre FROM articulos WHERE precio=100;

--j) Obtener el nombre de los productos donde el precio sea mayor a 200.

SELECT nombre FROM articulos WHERE precio>200;

--k) Obtener todos los datos de los artículos cuyo precio este entre 100 y 350.



--l) Obtener el precio medio de todos los productos.

--m) Obtener el precio medio de los artículos cuyo código de fabricante sea 2.

--n) Obtener el nombre y precio de los artículos ordenados por Nombre.

--o) Obtener todos los datos de los productos ordenados descendentemente por Precio.

--p) Obtener el nombre y precio de los artículos cuyo precio sea mayor a 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre.

--q) Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante.

--r) Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta.

--s) Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre del producto.

--t) Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendentemente por precio.

--u) Añade un nuevo producto: Clave del producto 11, Altavoces de 120 del fabricante 2.

--v) Cambia el nombre del producto 6 a ‘Impresora Laser’.

--w) Aplicar un descuento del 10% a todos los productos.

--x) Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 300.

--y) Borra el producto numero 6.
