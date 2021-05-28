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
INSERT INTO empleados VALUES ("2233333","Luis","Lopez",300,0,"Contaduria");
INSERT INTO empleados VALUES ("2244444","Maria","Perez",500,1,"Sistemas");
INSERT INTO empleados VALUES ("2255555","Susana","Garcia",400,2,"Secretaria");
INSERT INTO empleados VALUES ("2266666","Jose Maria","Morales",400,3,"Secretaria");

/*
3- Elimine el procedimiento llamado pa_empleados_sueldo si existe.
*/
DROP PROCEDURE IF EXISTS pa_empleados_sueldo;

/*
4- Cree un procedimiento almacenado llamado pa_empleados_sueldo que seleccione los nombres,
apellidos y sueldos de los empleados que tengan un sueldo superior o igual al enviado como
parámetro.
*/
DELIMITER //
CREATE PROCEDURE pa_empleados_sueldo (
    in sueldo_minimo DECIMAL(6,2)
)
BEGIN
    SELECT nombre, apellido, sueldo  FROM empleados WHERE sueldo >= sueldo_minimo;
END //
DELIMITER ;

/*
5- Ejecute el procedimiento creado anteriormente con distintos valores:
*/
CALL pa_empleados_sueldo(400);

CALL pa_empleados_sueldo(400.01);

/*
6- Intente ejecute el procedimiento almacenado pa_empleados_sueldo sin parámetros.
Muestra mensaje de error.

ERROR 1318 (42000): Incorrect number of arguments for PROCEDURE empresa.pa_empleados_sueldo; expected 1, got 0
*/

/*
7- Elimine el procedimiento almacenado pa_empleados_actualizar_sueldo si existe.
*/
DROP PROCEDURE IF EXISTS pa_empleados_actualizar_sueldo

/*
8- Cree un procedimiento almacenado llamado pa_empleados_actualizar_sueldo que actualice los
sueldos iguales al enviado como primer parámetro con el valor enviado como segundo parámetro.
*/
DELIMITER //
CREATE PROCEDURE pa_empleados_actualizar_sueldo (
    in sueldo_antiguo DECIMAL (6,2),
    in sueldo_nuevo DECIMAL (6,2)
)
BEGIN
    UPDATE empleados SET sueldo = sueldo_nuevo WHERE sueldo = sueldo_antiguo;
END //
DELIMITER ;

/*
9- Ejecute el procedimiento creado anteriormente y verifique si se ha ejecutado correctamente.
*/
CALL pa_empleados_actualizar_sueldo(300,1200);

SELECT * FROM empleados;

/*
10- Ejecute el procedimiento pa_empleados_actualizar_sueldo enviando un solo parámetro.

ERROR 1318 (42000): Incorrect number of arguments for PROCEDURE empresa.pa_empleados_actualizar_sueldo; expected 2, got 1
*/