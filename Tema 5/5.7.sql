DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

/*
1- Elimine la tabla clientes y provincias, si existen:
*/
DROP TABLE IF EXISTS clientes, provincias;

/*
2- Créelas con las siguientes estructuras:
*/
CREATE TABLE clientes (
    codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    ciudad VARCHAR(20),
    codigoprovincia TINYINT UNSIGNED,
    telefono VARCHAR(11),
    PRIMARY KEY (codigo)
);

CREATE TABLE provincias (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20),
    PRIMARY KEY (codigo)
);

/*
3- Ingrese algunos registros para ambas tablas
*/
INSERT INTO clientes VALUES (1,"Lopez Marcos","Colon III","Cordoba",1,null);
INSERT INTO clientes VALUES (2,"Perez Ana","San Martin 222","Cruz del Eje",1,4578585);
INSERT INTO clientes VALUES (3,"Garcia Juan","Rivadavia 333","Villa Maria",1,4578445);
INSERT INTO clientes VALUES (4,"Perez Luis","Sarmiento 444","Rosario",2,NULL);
INSERT INTO clientes VALUES (5,"Pereyra Lucas","San Martin 555","Cruz del Eje",1,4253685);
INSERT INTO clientes VALUES (6,"Gomez Ines","San Martin 666","Santa Fe",2,0345252525);
INSERT INTO clientes VALUES (7,"Torres Fabiola","Alem 777","Villa del Rosario",1,4554455);
INSERT INTO clientes VALUES (8,"Lopez Carlos","Irigoyen 888","Cruz del Eje",1,NULL);
INSERT INTO clientes VALUES (9,"Ramos Betina","San Martin 999","Cordoba",1,4223366);
INSERT INTO clientes VALUES (10,"Lopez Lucas","San Martin 1010","Posadas",4,0457858745);

INSERT INTO provincias VALUES (1,"Cordoba");
INSERT INTO provincias VALUES (2,"Santa Fe");
INSERT INTO provincias VALUES (3,"Corrientes");
INSERT INTO provincias VALUES (4,"Misiones");
INSERT INTO provincias VALUES (5,"Salta");
INSERT INTO provincias VALUES (6,"Buenos Aires");
INSERT INTO provincias VALUES (7,"Neuquen");

/*
4- Se quiere cambiar el código correspondiente a la provincia Cordoba por 10 y modificar todos los 
    códigos de provincia de los clientes de Cordoba en una sola sentencia:
*/
UPDATE provincias AS p JOIN clientes AS c ON p.codigo = c.codigoprovincia SET p.codigo=10, c.codigoprovincia=10 WHERE p.codigo=1;

/*
5- Verifique el cambio en ambas tablas:
*/
SELECT * FROM clientes WHERE codigoprovincia = 10;
SELECT * FROM provincias WHERE codigo = 10;