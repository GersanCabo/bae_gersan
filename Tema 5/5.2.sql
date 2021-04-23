DROP DATABASE IF EXISTS club;
CREATE DATABASE IF NOT EXISTS club;
USE club;

-- 1. Elimine las 3 tablas, si existen.
DROP TABLE IF EXISTS socios, deportes, inscritos;

-- 2. Cree las tablas: socios, deportes, inscritos
CREATE TABLE socios (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (documento)
);

CREATE TABLE deportes (
    codigo TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY (codigo)
);

CREATE TABLE inscritos (
    documento CHAR(8) NOT NULL,
    codigodeporte TINYINT UNSIGNED NOT NULL,
    ao YEAR NOT NULL,
    cuota CHAR(1),
    PRIMARY KEY (documento, codigodeporte, ao)
);

-- 3. Ingrese los siguientes registros en las tablas socios, deportes, inscritos 
INSERT INTO socios VALUES (22333444,"Juan Perez");
INSERT INTO socios VALUES (23333444,"Ana Garcia");
INSERT INTO socios VALUES (24333444,"Hector Fuentes");
INSERT INTO socios VALUES (25333444,"Marta Molina");

INSERT INTO deportes VALUES (1,"tenis");
INSERT INTO deportes VALUES (2,"natacion");
INSERT INTO deportes VALUES (3,"basquet");
INSERT INTO deportes VALUES (4,"voley");

INSERT INTO inscritos VALUES (22333444,1,2015,"s");
INSERT INTO inscritos VALUES (22333444,1,2016,"s");
INSERT INTO inscritos VALUES (22333444,2,2015,"s");
INSERT INTO inscritos VALUES (24333444,1,2015,"s");
INSERT INTO inscritos VALUES (24333444,2,2016,"s");
INSERT INTO inscritos VALUES (25333444,1,2015,"s");
INSERT INTO inscritos VALUES (25333444,1,2016,"s");
INSERT INTO inscritos VALUES (25333444,3,2016,"s");

/*
4. El club desea saber cuántos socios se han inscrito en cada deporte cada año, 
considerando sólo los deportes que tienen inscripciones:
*/
SELECT i.ao, d.nombre, COUNT(i.documento) AS numerosocios FROM deportes AS d 
JOIN inscritos AS i ON d.codigo = i.codigodeporte GROUP BY i.ao, d.nombre;

/*
5. El club quiere almacenar esa información en una tabla. Elimine la tabla 
inscritospordeporteporaño si existe.
*/
DROP TABLE IF EXISTS inscritospordeporteporaño;

-- 6. Cree la tabla utilizando la sentencia del punto 4:
CREATE TABLE inscritospordeporteporaño 
    SELECT i.ao, d.nombre, COUNT(i.documento) AS numerosocios FROM deportes AS d 
    JOIN inscritos AS i ON d.codigo = i.codigodeporte GROUP BY i.ao, d.nombre;
ALTER TABLE inscritospordeporteporaño ADD PRIMARY KEY(ao,nombre);

-- 7. Muestre todos los registros de la nueva tabla.
SELECT * FROM inscritospordeporteporaño;

-- 8. El club desea saber cuántas veces se ha inscrito un socio en algún deporte:
SELECT i.documento, d.nombre, COUNT(*) AS vecesinscrito FROM inscritos AS i 
JOIN deportes AS d ON d.codigo = i.codigodeporte GROUP BY i.documento, d.nombre;

-- 9. Elimine la tabla sociosdeporte si existe.
DROP TABLE IF EXISTS sociosdeporte;

-- 10. Guarde la información del punto 8 en una tabla, creándola a partir de esa consulta.
CREATE TABLE sociosdeporte 
    SELECT i.documento, d.nombre, COUNT(*) AS vecesinscrito FROM inscritos AS i 
    JOIN deportes AS d ON d.codigo = i.codigodeporte GROUP BY i.documento, d.nombre;
ALTER TABLE sociosdeporte ADD PRIMARY KEY(documento,nombre);