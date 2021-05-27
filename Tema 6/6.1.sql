DROP DATABASE IF EXISTS empresa;
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
DROP TABLE IF EXISTS secciones, empleados;

/*
1.Creamos las tablas.
*/
CREATE TABLE secciones (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    sueldo DECIMAL(5,2),
    PRIMARY KEY (codigo)
);

CREATE TABLE empleados (
    legajo INT NOT NULL AUTO_INCREMENT,
    documento CHAR(8),
    sexo CHAR(1),
    apellido VARCHAR(40),
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    seccion INT NOT NULL,
    cantidadhijos INT,
    estadocivil CHAR(10),
    fechaingreso DATE,
    PRIMARY KEY (legajo)
);

/*
2. Ingresamos algunos registros
*/
INSERT INTO secciones VALUES (1,"Administracion",300);
INSERT INTO secciones VALUES (2,"Contaduria",400);
INSERT INTO secciones VALUES (3,"Sistemas",500);

INSERT INTO empleados VALUES (1,"22222222","f","Lopez","Ana","Colon 123",1,2,"casado",'1990-10-10');
INSERT INTO empleados VALUES (2,"23333333","m","Lopez","Luis","Sucre 235",1,0,"soltero",'1990-02-10');
INSERT INTO empleados VALUES (3,"24444444","m","Garcia","Marcos","Sarmiento 1234",2,3,"divorciado",'1998-07-12');
INSERT INTO empleados VALUES (4,"25555555","m","Gomez","Pablo","Bulnes 321",3,2,"casado",'1998-10-09');
INSERT INTO empleados VALUES (5,"26666666","f","Perez","Laura","Peru 1254",3,3,"casado",'2000-05-09');

/*
3. Eliminamos la vista vista_empleados si existe.
*/
DROP VIEW IF EXISTS vista_empleados;

/*
4. Creamos la vista vista_empleados, que es resultado de una combinación en la cual se muestran 4 campos.
*/
CREATE VIEW vista_empleados AS 
    SELECT e.documento, e.nombre, e.apellido, s.nombre AS seccion FROM empleados AS e JOIN secciones AS s ON e.seccion = s.codigo;

/*
5. Vemos la información de la vista.
*/
SELECT * FROM vista_empleados;

/*
6. Realizamos una consulta a la vista como si se tratara de una tabla.
*/
SELECT nombre, apellido FROM vista_empleados WHERE seccion = "Administracion";

/*
7. Eliminamos la vista vista_empleados_ingreso si existe.
*/
DROP VIEW IF EXISTS vista_empleados_ingreso;

/*
8. Creamos otra vista de empleados denominada vista_empleados_ingreso que almacena la cantidad de empleados por año.
*/
CREATE VIEW vista_empleados_ingreso AS
    SELECT extract(year from fechaingreso) AS anio, COUNT(documento) AS empleados_ingresados FROM empleados GROUP BY anio;

/*
9. Vemos la informacion que suministra la vista.
*/
SELECT * FROM vista_empleados_ingreso;