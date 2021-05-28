DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

/*
1. Borramos las tablas si existen y procedemos a crearlas.
*/
DROP TABLE IF EXISTS clientes, provincias;

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
2. Cargamos una serie de registros en las tablas.
*/
INSERT INTO clientes VALUES (1,"Lopez Marcos","Colon 111","Cordoba",1,null);
INSERT INTO clientes VALUES (2,"Perez Ana","San Martin 222","Cruz del Eje",1,4578585);
INSERT INTO clientes VALUES (3,"Garcia Juan","Rivadavia 333","Villa Maria",1,4578445);
INSERT INTO clientes VALUES (4,"Perez Luis","Sarmiento 444","Rosario",2,NULL);
INSERT INTO clientes VALUES (5,"Pereyra Lucas","San Martin 555","Cruz del Eje",1,4253685);
INSERT INTO clientes VALUES (6,"Gomez Ines","San Martin 666","Santa Fe",2,0345252525);
INSERT INTO clientes VALUES (7,"Torres Fabiola","Alem 777","Villa del Rosario",1,4554455);
INSERT INTO clientes VALUES (8,"Lopez Carlos","Irigoyen 888","Cruz del Eje",1,NULL);
INSERT INTO clientes VALUES (9,"Ramos Betina ","San Martin 999","Cordoba",1,4223366);
INSERT INTO clientes VALUES (10,"Lopez Lucas","San Martin 1010","Posadas",4,0457858745);

INSERT INTO provincias VALUES (1,"Cordoba");
INSERT INTO provincias VALUES (2,"Santa Fe");
INSERT INTO provincias VALUES (3,"Corrientes");
INSERT INTO provincias VALUES (4,"Misiones");
INSERT INTO provincias VALUES (5,"Salta");
INSERT INTO provincias VALUES (6,"Buenos Aires");
INSERT INTO provincias VALUES (7,"Neuquen");

/*
3. Crearemos un procedimiento almacenado que le enviemos como parámetro los nombres de dos 
provincias y genere como resultado la cantidad de clientes que tenemos en cada una de dichas 
provincias. Dentro del procedimiento almacenado definimos dos variables locales llamadas 
'canti1' y 'canti2' que almacenan en forma temporal la cantidad de clientes que hay en cada 
una de las dos provincias consultadas.
*/
DROP PROCEDURE IF EXISTS cantidad_clientes;

DELIMITER //
CREATE PROCEDURE cantidad_clientes (
    in provincia1 VARCHAR(20),
    in provincia2 VARCHAR(20),
    out canti1 INT,
    out canti2 INT,
    out resultado INT
)
BEGIN
    declare canti1, canti2, suma int;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia1 into canti1;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia2 into canti2;
    set suma = canti1 + canti2;
    SELECT suma;
END //
DELIMITER ;

CALL cantidad_clientes("Cordoba","Santa Fe",@canti1,@canti2,@resultado);

/*
4. Llamamos luego al procedimiento almacenado pasando dos provincias que queremos conocer la cantidad de clientes en forma independiente.
*/
DROP PROCEDURE IF EXISTS cantidad_clientes_individual;

DELIMITER //
CREATE PROCEDURE cantidad_clientes_individual (
    in provincia1 VARCHAR(20),
    in provincia2 VARCHAR(20),
    out canti1 INT,
    out canti2 INT
)
BEGIN
    declare canti1, canti2, suma int;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia1 into canti1;
    SELECT COUNT(clientes.codigo) FROM clientes JOIN provincias ON clientes.codigoprovincia = provincias.codigo WHERE provincias.nombre = provincia2 into canti2;
    SELECT canti1;
    SELECT canti2;
END //
DELIMITER ;

CALL cantidad_clientes_individual("Cordoba","Santa Fe",@canti1,@canti2);