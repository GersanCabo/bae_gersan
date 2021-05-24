DROP DATABASE IF EXISTS pubs;
CREATE DATABASE IF NOT EXISTS pubs;
USE pubs;

CREATE TABLE pub (
    cod_pub VARCHAR(10),
    nombre VARCHAR(50),
    licencia_fiscal VARCHAR(100),
    domicilio VARCHAR(500),
    fecha_apertura DATE,
    horario VARCHAR(10),
    cod_localidad INT
);

CREATE TABLE titular (
    dni_titular VARCHAR(9),
    nombre VARCHAR(50),
    domicilio VARCHAR(500),
    cod_pub VARCHAR(10)
);

CREATE TABLE empleado (
    dni_empleado VARCHAR(9),
    nombre VARCHAR(50),
    domicilio VARCHAR(500)
);

CREATE TABLE existencias (
    cod_articulo VARCHAR(10),
    nombre VARCHAR(50),
    cantidad INT,
    precio INT,
    cod_pub VARCHAR(10)
);

CREATE TABLE localidad (
    cod_localidad INT,
    nombre VARCHAR(50)
);

CREATE TABLE pub_empleado (
    cod_pub VARCHAR(10),
    dni_empleado VARCHAR(9),
    funcion VARCHAR(50)
);

DROP DATABASE IF EXISTS PUBS;

CREATDATABASE IF NOT EXISTS  PUBS;

USE PUBS;

CREATE TABLE PUB(
    cod_pub VARCHAR(50),
    nombre VARCHAR(50),
    licencia_fiscal VARCHAR(50),
    domicilio VARCHAR(50),
    fecha_apertura DATE,
    horario VARCHAR(50),
    cod_localidad INT(5)     

);

CREATE TABLE TITULAR(
    dni_titular VARCHAR(50),
    nombre VARCHAR(50),

    
    cod_pub VARCHAR(50)   
);

CREATE TABLE EMPLEADO(
    dni_empleado VARCHAR(50),
    nombre VARCHAR(50),
    domicilio VARCHAR(50)   
);

CREATE TABLE EXISTENCIAS(
    cod_articulo VARCHAR(50),
    nombre VARCHAR(50),
    cantidad VARCHAR(50),
    precio VARCHAR(50),
    cod_pub VARCHAR(50)     
);

CREATE TABLE LOCALIDAD
    cod_localidad INT(50),
    nombre VARCHAR(50)  
);

CREATE TABLE PUB_EMPLEADO(
    cod_pub VARCHAR(50),
    dni_empleado VARCHAR(50),
    funcion VARCHAR(50)   
);


-- ESTABLECEMOS LAS RESTRICCIONES
-- CLAVES PRIMARIAS
alter table PUB add constraint pk_pub PRIMARY KEY (cod_pub);

ALTER TABLE TITULAR ADD CONSTRAINT pk_titular PRIMARY KEY (dni_titular);

ALTER TABLE EXISTENCIAS ADD CONSTRAINT pk_existencias PRIMARY KEY(cod_articulo);

ALTER TABLE LOCALIDAD ADD  CONSTRAINT pk_localidad PRIMARY KEY (cod_localidad);

ALTER TABLE PUB_EMPLEADO ADD CONSTRAINT pk_pub_empleado PRIMARY KEY (cod_pub, dni_empleado, funcion);


 
 -- CLAVES FORANEAS
 
 
 ALTER TABLE PUB ADD CONSTRAINT fk_pub_localidad FOREIGN KEY (cod_localidad) REFERENCES LOCALIDAD (cod_localidad);


 Alter table PUB_EMPLEADO add constraint fk_pub_empleado_Empleado FOREIGN KEY(dni_empleado) references EMPLEADO(dni_empleado);

ALTER TABLE PUB ADD CONSTRAINT ck_horario CHECK (horario IN ("HOR1", "HOR2", "HOR3")); --Ruben G

ALTER TABLE EXISTENCIAS ADD CONSTRAINT comprobar_precio CHECK (precio > 0); --listo ridel

 
 
 ALTER TABLE PUB_EMPLEADO CHANGE funcion funcion ENUM('CAMARERO','SEGURIDAD','LIMPIEZA'); --GERSAN