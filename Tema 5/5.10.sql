DROP DATABASE IF EXISTS clinica;
CREATE DATABASE IF NOT EXISTS clinica;
USE clinica;

/*
1- Elimine las tablas si existen.
*/
DROP TABLE IF EXISTS pacientes, obrassociales;

/*
2- Cree las tablas:
*/
CREATE TABLE pacientes (
    documento CHAR(8),
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    codigoobrasocial TINYINT UNSIGNED
);

CREATE TABLE obrassociales (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(15),
    domicilio VARCHAR(30),
    PRIMARY KEY (codigo)
);

/*
3- Ingrese algunos registros:
*/
INSERT INTO pacientes VALUES ("22333444","Juan Lopez","Guemes 235",1);
INSERT INTO pacientes VALUES ("23444555","Analia Juarez","Avellaneda 367",1);
INSERT INTO pacientes VALUES ("24555666","Juan Lopez","Guemes 235",2);
INSERT INTO pacientes VALUES ("25666777","Jose Ferrero","Urquiza 312",3);
INSERT INTO pacientes VALUES ("26777888","Hector Garcia","Caseros 411",3);
INSERT INTO pacientes VALUES ("27888999","Susana Duarte","Peru 211",3);

INSERT INTO obrassociales VALUES (1,"PAMI","Colon 345");
INSERT INTO obrassociales VALUES (2,"IPAM","Sucre 98");
INSERT INTO obrassociales VALUES (3,"OSDOP","Avellaneda 267");

/*
4- La clínica ya no atiende a pacientes de la obra social PAMI. Se quiere eliminar 
de la tabla obrassociales a dicha obra social y de la tabla pacientes a todos los pacientes que de PAMI:
*/
DELETE pacientes, obrassociales FROM pacientes JOIN obrassociales ON pacientes.codigoobrasocial = obrassociales.codigo WHERE obrassociales.nombre = "PAMI";

/*
5- Verifique las eliminaciones.
*/
SELECT * FROM obrassociales;
SELECT * FROM pacientes;