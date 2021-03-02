-- Empieza creando la base de datos.
DROP DATABASE IF EXISTS futbol;
CREATE DATABASE IF NOT EXISTS futbol;
USE futbol;

CREATE TABLE equipos (
	id_equipo INT(2) PRIMARY KEY,
	nombre VARCHAR(50),
	estadio VARCHAR(50),
	aforo INT(6),
	ano_fundacion DATE,
	ciudad VARCHAR(50)
);

CREATE TABLE jugadores (
	id_jugador INT(3) PRIMARY KEY,
	nombre VARCHAR(50),
	fecha_nac DATE,
	demarcacion VARCHAR(50),
	internacional INT(3),
	id_equipo INT(2),
	FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo)
);

CREATE TABLE partidos (
	id_equipo_casa INT(2),
	id_equipo_fuera INT(2),
	fecha DATE,
	goles_casa INT(2),
	goles_fuera INT(2),
	observaciones VARCHAR(200),
	PRIMARY KEY (id_equipo_casa, id_equipo_fuera, fecha)
);

CREATE TABLE goles (
	id_equipo_casa INT(2),
	id_equipo_fuera INT(2),
	minuto INT(2),
	id_jugador INT(3),
	descripcion VARCHAR(200),
	PRIMARY KEY (id_equipo_casa, id_equipo_fuera, minuto, id_jugador),
	FOREIGN KEY (id_equipo_casa, id_equipo_fuera) REFERENCES partidos(id_equipo_casa, id_equipo_fuera),
	FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador)
);



-- Una vez creada la base de datos resuelve las modicaciones siguientes:

-- Añadir una columna nueva a la tabla PARTIDOS que indique la hora de comienzo del partido.

ALTER TABLE partidos ADD hora TIME NOT NULL;

--Establecer las claves primarias (destacadas con negreita) correspondientes a cada tabla.



--Establecer las claves foráneas correspondiente en la tabla GOLES


-- Cambiar el nombre de la columna ano_fundacion de la tabla EQUIPOS por fundacion.

ALTER TABLE equipos CHANGE ano_fundacion fundacion DATE;

--Añadir una columna a la tabla EQUIPOS que almacene el anagrama de dicho equipo.

ALTER TABLE equipos ADD iniciales VARCHAR(3);

--Definir el campo o columna id_equipo en la tabla JUGADORES como clave foránea correspondiente a la clave primaria de la tabla EQUIPOS.



-- Fijar para todas las tablas el tipo de almacenamiento INNODB así como un charset de latin1 y valor collation latin1_spanish_c1



--Renombrar la tabla GOLES a RESULTADOS.

ALTER TABLE goles RENAME resultados;
