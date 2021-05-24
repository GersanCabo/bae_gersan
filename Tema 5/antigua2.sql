DROP DATABASE IF EXISTS EMPRESA;
CREATE DATABASE IF NOT EXISTS EMPRESA;
USE EMPRESA;

CREATE TABLE EMPLEADOS (
    DNI INT(8),
    NOMBRE VARCHAR(10),
    APELLIDO1 VARCHAR(15),
    APELLIDO2 VARCHAR(15),
    DIRECC1 VARCHAR(25),
    DIRECC2 VARCHAR(20),
    CIUDAD VARCHAR(20),
    PROVINCIA VARCHAR(20),
    COD_POSTAL VARCHAR(5),
    SEXO VARCHAR(1),
    FECHA_NAC DATE
);

CREATE TABLE DEPARTAMENTOS (
    DPTO_COD INT(5),
    NOMBRE_DPTO VARCHAR(30),
    DPTO_PADRE INT(5),
    PRESUPUESTO INT,
    PRES_ACTUAL INT
);

CREATE TABLE ESTUDIOS (
    EMPLEADO_DNI INT(8),
    UNIVERSIDAD INT(5),
    ANIO INT,
    GRADO VARCHAR(3),
    ESPECIALIDAD VARCHAR(20)
);

CREATE TABLE HISTORIAL_LABORAL (
    EMPLEADO_DNI INT(8),
    TRABAJO_COD INT(5),
    FECHA_INICIO DATE,
    FECHA_FIN DATE,
    DPTO_COD INT(5),
    SUPERVISOR_DNI INT(8)
);

CREATE TABLE UNIVERSIDADES (
    UNIV_COD INT(5),
    NOMBRE_UNIV VARCHAR(25),
    CIUDAD VARCHAR(20),
    MUNICIPIO VARCHAR(2),
    COD_POSTAL VARCHAR(5)
);

CREATE TABLE HISTORIAL_SALARIAL (
    EMPLEADO_DNI INT(8),
    SALARIO FLOAT,
    FECHA_COMIENZO DATE,
    FECHA_FIN DATE
);

CREATE TABLE TRABAJOS (
    TRABAJO_COD INT(5),
    NOMBRE_TRAB VARCHAR(20),
    SALARIO_MIN INT(2),
    SALARIO_MAX INT(2)
);

--CONTROLAR LAS SIGUIENTES RESTRICCIONES:

    -- 1. Los siguientes atributos son obligatorios:

            --NOMBRE (en todas las tablas).
            ALTER TABLE EMPLEADOS MODIFY NOMBRE VARCHAR(10) NOT NULL;
            ALTER TABLE DEPARTAMENTOS MODIFY NOMBRE_DPTO VARCHAR(30) NOT NULL;
            ALTER TABLE UNIVERSIDADES MODIFY NOMBRE_UNIV VARCHAR(25) NOT NULL;
            ALTER TABLE TRABAJOS MODIFY NOMBRE_TRAB VARCHAR(20) NOT NULL;
            --APELLIDO1 en EMPLEADOS.
            ALTER TABLE EMPLEADOS MODIFY APELLIDO1 VARCHAR(15) NOT NULL;
            --PRESUPUESTO en DEPARTAMENTOS.
            ALTER TABLE DEPARTAMENTOS MODIFY PRESUPUESTO INT NOT NULL;
            --SALARIO en HISTORIAL_SALARIAL.
            ALTER TABLE HISTORIAL_SALARIAL MODIFY SALARIO INT NOT NULL;
            --SALARIO_MIN y SALARIO_MAX en TRABAJOS.
            ALTER TABLE TRABAJOS MODIFY SALARIO_MIN INT(2) NOT NULL;
            ALTER TABLE TRABAJOS MODIFY SALARIO_MAX INT(2) NOT NULL;

    -- 2. El atributo SEXO en EMPLEADOS sólo puede tomar los valores H para hombre y M para mujer.

            ALTER TABLE EMPLEADOS ADD CONSTRAINT ck_sexo CHECK (SEXO IN('H','M'));

    -- 3. Dos DEPARTAMENTOS no de llaman igual. Dos TRABAJOS tampoco.

            ALTER TABLE DEPARTAMENTOS MODIFY NOMBRE_DPTO VARCHAR(30) UNIQUE;
            ALTER TABLE TRABAJOS MODIFY NOMBRE_TRAB VARCHAR(20) UNIQUE;

    -- 4. Cada empleado tiene un solo salario en cada momento. También, cada empleado tendrá asignado un solo trabajao en cada momento.


    -- 5. Se ha de mantener la regla de integridad de referencia y pensar una clave primaria para cada tabla y las claves ajenas correspondientes.




-- REALIZAR LAS SIGUIENTES OPERACIONES:

    -- 1. Insertar dos filas en cada tabla, rellenando todos sus atributos y haciendo cumplir las restricciones de integridad anteriores.


    -- 2. Inserte las siguientes filas ( las columnas que no aparecen se considerarán nulas ). ¿ Qué está ocurriendo ? (ver las imágenes en el esnunciado del campus)


    -- 3. ¿Qué ocurre si se modifica esta última fila de historial_laboral asignándole al empleado 111222 un supervisor que no existe en la tabla de empleados?.


    -- 4 .Borre una universidad de la tabla de UNIVERSIDADES ¿Qué le sucede a la restricción de clave ajena de la tabla ESTUDIOS? Altere la definición de la tabla para que se mantenga la restricción aunque se borre una universidad.


    -- 5. Añada un nuevo atributo VALORACIÓN en la tabla de EMPLEADOS que indique de 1 a 10 la valoración que obtuvo el empleado en su entrevista de trabajo al iniciar su andadura en la empresa. Ponga el valor por defecto 5 para ese campo.


    -- 6. Elimine la restricción de que el atributo NOMBRE de la tabla EMPLEADOS no puede ser nulo.


    -- 7. Modificar el tipo de datos de DIREC1 de la tabla EMPLEADOS a cadena de caracteres de 40 como máximo.


    -- 8 .Cambiar la clave primaria de EMPLEADOS al NOMBRE y los dos APELLIDOS.


    -- 9. Crear una nueva tabla llamada INFORMACIÓN UNIVERSITARIA que tenga el NOMBRE y los dos APELLIDOS (en un solo atributo) de todos los EMPLEADOS junto con la UNIVERSIDAD donde estudiaron. Cárguela con los datos correspondientes de forma automática.


    -- 10. Borrar todas las tablas. ¿Hay que tener en cuenta las claves ajenas a la hora de borrar las tablas? Explica el proceso.