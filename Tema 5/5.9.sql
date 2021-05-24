DROP DATABASE IF EXISTS club;
CREATE DATABASE IF NOT EXISTS club;
USE club;

/*
1- Elimine las tablas, si existen.
*/
DROP TABLE IF EXISTS deportes, profesores, inscritos;

/*
2- Cree las tablas:
*/
CREATE TABLE deportes (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    profesor TINYINT UNSIGNED,
    PRIMARY KEY (codigo)
);

CREATE TABLE profesores (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    PRIMARY KEY (codigo)
);

CREATE TABLE inscritos (
    numerosocio INT UNSIGNED NOT NULL,
    deporte TINYINT UNSIGNED NOT NULL,
    ao YEAR NOT NULL,
    cuota CHAR(1),
    PRIMARY KEY (numerosocio,deporte,ao)
);

/*
3- Ingrese los siguientes registros:
*/
INSERT INTO deportes VALUES (1,"tenis",1);
INSERT INTO deportes VALUES (2,"natacion",2);
INSERT INTO deportes VALUES (3,"basquet",3);
INSERT INTO deportes VALUES (4,"futbol",1);

INSERT INTO profesores VALUES (1,"Alfredo Perez","Sarmiento 984");
INSERT INTO profesores VALUES (2,"Betina Molina","Sucre 356");
INSERT INTO profesores VALUES (3,"Carlos Garcia","Urquiza 209");
INSERT INTO profesores VALUES (4,"Daniel Morales","Salta 1234");

INSERT INTO inscritos VALUES (102,1,2016,"s");
INSERT INTO inscritos VALUES (102,2,2016,"s");
INSERT INTO inscritos VALUES (104,2,2016,"s");
INSERT INTO inscritos VALUES (104,3,2016,"s");
INSERT INTO inscritos VALUES (106,1,2016,"s");
INSERT INTO inscritos VALUES (109,2,2016,"s");

/*
4- Se quiere eliminar de la tabla deportes aquellos deportes para los cuales no hay inscritos:
*/
DELETE deportes FROM deportes LEFT JOIN inscritos ON deportes.codigo = inscritos.deporte WHERE inscritos.deporte IS NULL;

/*
5- se quiere eliminar de la tabla profesores a aquellos profesores que no dictan ningún deporte, es decir, que no están en la tabla deportes:
*/
DELETE profesores FROM profesores LEFT JOIN deportes ON profesores.codigo = deportes.profesor WHERE deportes.profesor IS NULL;

