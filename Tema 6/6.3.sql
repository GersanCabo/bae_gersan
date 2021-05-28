DROP DATABASE IF EXISTS colegio;
CREATE DATABASE IF NOT EXISTS colegio;
USE colegio;

/*
1. Borramos las tablas alumnos y profesores si existen.
*/
DROP TABLE IF EXISTS secciones, empleados;

/*
2. Creamos las tablas.
*/
CREATE TABLE alumnos (
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30),
    nota DECIMAL(4,2),
    codigoprofesor INT,
    PRIMARY KEY (documento)
);

CREATE TABLE profesores (
    codigo INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30),
    PRIMARY KEY (codigo)
);

/*
3. Insertamos algunas filas en las dos tablas.
*/
INSERT INTO alumnos VALUES ("30111111","Ana Algarbe",5.1,1);
INSERT INTO alumnos VALUES ("30222222","Bernardo Bustamante",3.2,1);
INSERT INTO alumnos VALUES ("30333333","Carolina Conte",4.5,1);
INSERT INTO alumnos VALUES ("30444444","Diana Dominguez",9.7,1);
INSERT INTO alumnos VALUES ("30555555","Fabian Fuentes",8.5,2);
INSERT INTO alumnos VALUES ("30666666","Gaston Gonzalez",9.7,2);

INSERT INTO profesores VALUES (1,"Maria Luque");
INSERT INTO profesores VALUES (2,"Jorje Dante");

/*
4. Borramos la vista si ya existe y luego la creamos.
*/
DROP VIEW IF EXISTS mejores_notas;

/*
5. Creamos una vista con los datos de todos los alumnos que tienen una nota mayor o igual a 7, 
    junto con el nombre del profesor que lo calificó
*/
CREATE VIEW mejores_notas AS
    SELECT alumnos.*, profesores.nombre AS nombre_profesor FROM alumnos JOIN profesores ON alumnos.codigoprofesor = profesores.codigo WHERE alumnos.nota >= 7;

/*
6. Mostramos el resultado de la vista.
*/
SELECT * FROM mejores_notas;

/*
7. Mediante la vista insertamos un nuevo alumno calificado por el profesor con código 1.
*/
INSERT INTO mejores_notas (documento,nombre,nota,codigoprofesor) VALUES ("30777777","Manolo Lamas",9.8,1);

/*
8. Mostramos la vista.
*/
SELECT * FROM mejores_notas;

/*
9. Consultamos la tabla base: alumnos, tenemos una nueva fila con el alumno insertado.
*/
SELECT * FROM alumnos;

/*
10. Modificamos la nota de un alumno aprobado mediante la vista.
*/
UPDATE mejores_notas SET nota = 7.5 WHERE documento = 30666666;

/*
11. Mostramos la tabla alumnos.
*/
SELECT * FROM alumnos;