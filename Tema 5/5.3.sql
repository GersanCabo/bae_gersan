DROP DATABASE IF EXISTS club_clases;
CREATE DATABASE IF NOT EXISTS club_clases;
USE club_clases;

-- 1. Elimine las tablas, si existen.
DROP TABLE socios;
DROP TABLE inscritos;

-- 2. Cree las tablas socios e inscritos:
CREATE TABLE socios (
    numero INT UNSIGNED NOT NULL AUTO_INCREMENT,
    documento CHAR(8) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    domicilio VARCHAR(30),
    PRIMARY KEY (numero)
);

CREATE TABLE inscritos (
    numerosocio INT UNSIGNED NOT NULL,
    deporte VARCHAR(20) NOT NULL,
    ao YEAR NOT NULL,
    cuota CHAR(1),
    PRIMARY KEY (numerosocio,deporte,ao)
);

-- 3. Ingrese los siguientes registros en las tablas socios e inscritos:
INSERT INTO socios VALUES (23,22333444,"Juan Perez","Colon 123");
INSERT INTO socios VALUES (56,23333444,"Ana Garcia","Sarmiento 984");
INSERT INTO socios VALUES (102,24333444,"Hector Fuentes","Sucre 293");
INSERT INTO socios VALUES (150,25333444,"Agustin Perez","Avellaneda 1234");
INSERT INTO socios VALUES (230,26333444,"Maria Perez","Urquiza 283");
INSERT INTO socios VALUES (231,29333444,"Agustin Perez","Urquiza 283");

INSERT INTO inscritos VALUES (23,"natacion",2015,"s");
INSERT INTO inscritos VALUES (23,"tenis",2015,"s");
INSERT INTO inscritos VALUES (23,"tenis",2016,"s");
INSERT INTO inscritos VALUES (102,"natacion",2016,"s");
INSERT INTO inscritos VALUES (102,"tenis",2015,"s");

/*
4. El socio con documento "23333444" quiere inscribirse en "basquet" 
este año, pero no recuerda su número de socio. Inscriba al socio en 
la tabla "inscritos" buscando en la tabla "socios" el número de socio 
a partir del número de documento:
*/
INSERT INTO inscritos (numerosocio,deporte,ao,cuota)
    SELECT numero,"basquet",2021,"s" 
    FROM socios 
    WHERE documento="23333444";

/*
5. Intente inscribir una persona cuyo número de documento no exista 
en la tabla "socios":
*/
INSERT INTO inscritos (numerosocio,deporte,ao,cuota)
    SELECT numero,"basquet",2021,"s" 
    FROM socios 
    WHERE documento="1";
    /*
    No se inserta la persona en la tabla inscritos al no encontrarse 
    ningun numero de documento igual al que pedimos
    */

/*
6. La madre de los socios "Perez" quiere inscribir a su hijo "Agustín" 
en "basquet" este año, pero no recuerda su número de socio ni su documento. 
Si se busca el número de socio a partir del nombre ("Agustin Perez"), 
la consulta retornará 2 registros, porque hay 2 socios llamados "Agustin Perez". 
Obtendremos como resultado, la inscripción a "basquet" este año, de ambos 
socios. Si localizamos el número de socio a partir del domicilio 
("Urquiza 283"), también obtendremos 2 inscripciones, porque hay 2 socios 
con ese domicilio. Ingrese la inscripción del socio, localizando su número 
de socio con el nombre y domicilio:
*/
INSERT INTO inscritos (numerosocio,deporte,ao,cuota)
    SELECT numero,"basquet",2021,"s" 
    FROM socios 
    WHERE nombre="Agustin Perez" AND domicilio="Urquiza 283";

/*
7. La madre de los socios "Perez" quiere inscribir a ambos hijos "natacion" 
este año, pero no recuerda sus números de socio ni sus documentos. Inscriba 
a ambos localizando sus números de socio con el domicilio:
*/
INSERT INTO inscritos (numerosocio,deporte,ao,cuota)
    SELECT numero,"natacion",2021,"s" 
    FROM socios 
    WHERE nombre LIKE "%Perez" AND domicilio="Urquiza 283";

-- 8. Vea si las inscripcioens anteriores se cargaron
SELECT * FROM inscritos;