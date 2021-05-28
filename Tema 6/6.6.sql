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
INSERT INTO empleados VALUES ("2233333","Luis","Lopez",700,0,"Contaduria");
INSERT INTO empleados VALUES ("2244444","Maria","Perez",500,1,"Sistemas");
INSERT INTO empleados VALUES ("2255555","Susana","Garcia",400,2,"Secretaria");
INSERT INTO empleados VALUES ("2266666","Jose Maria","Morales",1200,3,"Secretaria");

/*
3- Elimine el procedimiento llamado pa_empleados_sueldo si existe.
*/
DROP PROCEDURE IF EXISTS pa_seccion;

/*
4- Cree un procedimiento almacenado llamado pa_seccion al cual le enviamos el 
nombre de una sección y que nos retorne el promedio de sueldos de todos los 
empleados de esa sección y el valor mayor de sueldo (de esa sección)
*/
DELIMITER //
CREATE PROCEDURE pa_seccion (
    in nombre_seccion VARCHAR(20),
    out media_sueldos DECIMAL(6,2),
    out maximo_sueldo DECIMAL(6,2)
)
BEGIN
    SELECT AVG(sueldo) FROM empleados WHERE seccion = nombre_seccion;
    SELECT MAX(sueldo) FROM empleados WHERE seccion = nombre_seccion;
END //
DELIMITER ;

/*
5- Ejecute el procedimiento creado anteriormente con distintos valores.
*/
CALL pa_seccion("Secretaria",@media,@maximo);