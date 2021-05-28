DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

/*
1- Eliminamos la tabla, si existe y la creamos.
*/
DROP TABLE IF EXISTS empledos;

CREATE TABLE empleados (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(20),
    apellido VARCHAR(20),
    sueldo DECIMAL(6,2),
    cantidadhijos INT,
    seccion VARCHAR(20),
    PRIMARY KEY (documento)
);

/*
2- Ingrese algunos registros.
*/
INSERT INTO empleados VALUES ("2222222","Juan","Perez",300,2,"Contaduria");
INSERT INTO empleados VALUES ("2233333","Luis","Lopez",300,1,"Contaduria");
INSERT INTO empleados VALUES ("2244444","Maria","Perez",500,1,"Sistemas");
INSERT INTO empleados VALUES ("2255555","Susana","Garcia",400,2,"Secretaria");
INSERT INTO empleados VALUES ("2266666","Jose Maria","Morales",400,3,"Secretaria");

/*
3- Elimine el procedimiento llamado pa_empleados_sueldo si existe.
*/
DROP PROCEDURE IF EXISTS pa_empleados_sueldo;

/*
4- Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres.
*/
DELIMITER //
CREATE PROCEDURE pa_empleados_sueldo()
BEGIN
    SELECT nombre FROM empleados;
END //
DELIMITER ;

/*
5- Ejecute el procedimiento creado anteriormente.
*/
CALL pa_empleados_sueldo();

/*
6- Elimine el procedimiento llamado pa_empleados_hijos si existe.
*/
DROP PROCEDURE IF EXISTS pa_empleados_hijos;

/*
7- Cree un procedimiento almacenado llamado pa_empleados_hijos que seleccione los nombres apellidos y cantidad de hijos de los empleados con hijos.
*/
DELIMITER //
CREATE PROCEDURE pa_empleados_hijos()
BEGIN
    SELECT nombre, apellido, cantidadhijos FROM empleados WHERE cantidadhijos > 0;
END //
DELIMITER ;

/*
8- Ejecute el procedimiento creado anteriormente.
*/
CALL pa_empleados_hijos();

/*
9- Actualice la cantidad de hijos de algún empleado con hijos y vuelva a ejecutar el procedimiento para verificar que ahora no aparece en la lista.
*/
UPDATE empleados SET cantidadhijos = 0 WHERE documento = "2233333";
CALL pa_empleados_hijos();