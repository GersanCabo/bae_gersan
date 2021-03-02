DROP DATABASE IF EXISTS consecionario;
CREATE DATABASE IF NOT EXISTS consecionario CHAR SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE consecionario;

CREATE TABLE coche (
	matricula VARCHAR(7) PRIMARY KEY,
	marca VARCHAR(50) NOT NULL,
	color ENUM('verde','rojo','azul') NOT NULL,
	pvp FLOAT NOT NULL
);

CREATE TABLE cliente (
	cod_cli INT AUTO_INCREMENT PRIMARY KEY,
	matricula VARCHAR(7),
	nif VARCHAR(9),
	nombre VARCHAR(50),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50),
	direccion VARCHAR(250),
	ciudad VARCHAR(50),
	FOREIGN KEY (matricula) REFERENCES coche(matricula)
);

CREATE TABLE cliente_tlf (
	cod_cli INT PRIMARY KEY,
	telefono INT(9),
	FOREIGN KEY (cod_cli) REFERENCES cliente(cod_cli)
);

CREATE TABLE revision (
	cod_rev INT AUTO_INCREMENT PRIMARY KEY,
	matricula VARCHAR(7),
	fecha DATE,
	FOREIGN KEY (matricula) REFERENCES cliente(matricula)
);

CREATE TABLE operacion (
	cod_op INT AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(500),
	horas FLOAT
);

CREATE TABLE material (
	cod_nat INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(150),
	precio FLOAT
);

CREATE TABLE consta (
	cod_rev INT,
	cod_op INT,
	PRIMARY KEY (cod_rev, cod_op),
	FOREIGN KEY (cod_rev) REFERENCES revision(cod_rev),
	FOREIGN KEY (cod_op) REFERENCES operacion(cod_op)
);
