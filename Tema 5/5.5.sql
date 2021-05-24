DROP DATABASE IF EXISTS club;
CREATE DATABASE IF NOT EXISTS club;
USE club;
/*
1-Elimine las 3 tablas, si existen.
*/
DROP TABLE IF EXISTS socios, deportes, inscritos;

/*
2-Cree las tablas:
*/
CREATE TABLE socios (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30),
    domicilio VARCHAR(30),
    PRIMARY KEY (documento)
);

CREATE TABLE deportes (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(15),
    profesor VARCHAR(30),
    PRIMARY KEY (codigo)
);

CREATE TABLE inscritos (
    documento CHAR(8) NOT NULL,
    codigodeporte VARCHAR(20) NOT NULL,
    ao YEAR NOT NULL,
    cuota CHAR(1),
    PRIMARY KEY (documento,codigodeporte,ao)
);

/*
3-Ingrese los siguientes registros para las tablas socios, deportes e inscritos:
*/
INSERT INTO socios VALUES (22333444,"Juan Perez","Colon 123");
INSERT INTO socios VALUES (23333444,"Ana Lopez","Caseros 984");
INSERT INTO socios VALUES (24333444,"Marcelo Morales","Sucre 356");
INSERT INTO socios VALUES (25333444,"Susana Juarez","Sarmiento 723");

INSERT INTO deportes VALUES (1,"tenis","Tadeo Torres");
INSERT INTO deportes VALUES (2,"natacion","Natalia Nores");
INSERT INTO deportes VALUES (3,"basquet","Bautista Pereyra");
INSERT INTO deportes VALUES (4,"paddle","Bautista Pereyra");

INSERT INTO inscritos VALUES (22333444,1,2015,"s");
INSERT INTO inscritos VALUES (22333444,1,2016,"n");
INSERT INTO inscritos VALUES (22333444,2,2015,"s");
INSERT INTO inscritos VALUES (23333444,1,2015,"s");
INSERT INTO inscritos VALUES (23333444,1,2016,"s");
INSERT INTO inscritos VALUES (23333444,2,2016,"s");
INSERT INTO inscritos VALUES (24333444,1,2016,"s");
INSERT INTO inscritos VALUES (24333444,3,2016,"n");

/*
4-Se desea saber la cantidad de alumnos inscritos en cada deporte cada año, sin considerar los deportes para los cuales no hay inscritos:
*/
SELECT d.nombre,i.ao,COUNT(i.documento) AS numero_alumnos FROM inscritos AS i JOIN deportes AS d ON d.codigo = i.codigodeporte GROUP BY i.ao, d.nombre;

/*
5-El club quiere almacenar esa información en una tabla llamada inscritospordeporteporaño. Elimine la tabla, si existe.
*/
DROP TABLE IF EXISTS inscritospordeporteporaño;

/*
6-Cree la tabla con la siguiente estructura:
*/
CREATE TABLE inscritospordeporteporaño (
    deporte VARCHAR(15),
    ao YEAR,
    cantidad TINYINT UNSIGNED
);

/*
7-Ingrese registros en la tabla creada anteriormente, a partir de la consulta del punto 4:
*/
INSERT INTO inscritospordeporteporaño
    SELECT d.nombre,i.ao,COUNT(i.documento) AS numero_alumnos FROM inscritos AS i JOIN deportes AS d ON d.codigo = i.codigodeporte GROUP BY i.ao, d.nombre;

/*
8-Muestre el nombre del socio, el nombre del deporte y el año de inscripción de todas las inscripciones con cuota impaga:
*/
SELECT s.nombre, d.nombre, i.ao FROM ((inscritos AS i JOIN deportes AS d ON d.codigo = i.codigodeporte) JOIN socios AS s ON s.documento = i.documento) WHERE i.cuota = "n";

/*
9-Elimine la tabla socios deudores si existe.
*/
DROP TABLE IF EXISTS sociosdeudores;

/*
10-Cree la tabla:
*/
CREATE TABLE sociosdeudores (
    socio VARCHAR(30),
    deporte VARCHAR(15),
    ao YEAR
);

/*
11-Intente ingresar en la tabla anteriormente creada los registros resultado de la consulta del punto 8, colocando los campos socio y deporte en la lista de campos a cargar:
*/
INSERT INTO sociosdeudores (socio,deporte)
    SELECT s.nombre, d.nombre FROM ((inscritos AS i JOIN deportes AS d ON d.codigo = i.codigodeporte) JOIN socios AS s ON s.documento = i.documento) WHERE i.cuota = "n";

/*
12-Ingrese en la tabla anteriormente creada los registros resultado de la consulta del punto 8, correctamente:
*/
INSERT INTO sociosdeudores
    SELECT s.nombre, d.nombre, i.ao FROM ((inscritos AS i JOIN deportes AS d ON d.codigo = i.codigodeporte) JOIN socios AS s ON s.documento = i.documento) WHERE i.cuota = "n";

/*
13-Vea los registros de sociosdeudores.
*/
SELECT * FROM sociosdeudores;

/*
14-Agrupe por nombre del profesor y deporte y cuente la cantidad de alumnos por profesor y deporte, considerando los deportes para los que no haya inscritos:
*/
SELECT d.profesor,d.nombre,COUNT(i.documento) AS numero_alumnos FROM deportes AS d LEFT JOIN inscritos AS i ON i.codigodeporte = d.codigo GROUP BY d.nombre, d.profesor; 

/*
15-Elimine la tabla alumnosporprofesor si existe.
*/
DROP TABLE IF EXISTS alumnosporprofesor;

/*
16-Cree la tabla alumnosporprofesor
*/
CREATE TABLE alumnosporprofesor (
    profesor VARCHAR(30),
    deporte VARCHAR(15),
    cantidad TINYINT UNSIGNED
);

/*
17-Ingrese en la tabla creada en el punto anterior con el resultado de la consulta del punto 14:
*/
INSERT INTO alumnosporprofesor
    SELECT d.profesor,d.nombre,COUNT(i.documento) AS numero_alumnos FROM deportes AS d LEFT JOIN inscritos AS i ON i.codigodeporte = d.codigo GROUP BY d.nombre, d.profesor;

/*
18-Muestre todos los registros de la nueva tabla
*/
SELECT * FROM alumnosporprofesor;