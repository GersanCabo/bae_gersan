           /*INSERCIONES, ACTUALIZACIONES Y BORRADOS*/

/*1. Inserta una oficina con sede en Fuenlabrada.*/

INSERT INTO Oficinas VALUES ('FUE-ES','Fuenlabrada','España','Madrid','28940','+34678901277','Calle calle, Nº6','Planta 2');

/*2. Inserta un empleado (código 400) para la oficina de Fuenlabrada que sea
representante de ventas.*/

INSERT INTO Empleados VALUES (400,'Pepe','Botella','Dorada','39999','pepe@gmail.com','FUE-ES',3,'Representante de ventas');

/*3. Inserta un cliente (con el código 288) del representante de ventas
insertado en el punto 2.*/

INSERT INTO Clientes VALUES (288,'Michi Flowers','Sara','Socas','+34677097233','+34677097234','Avenida Perez, Nº98','Planta 7','Bilbao','Pais Vasco','España','67900',400,67000);

/*4. Inserta un pedido del cliente anterior (con su detalle) de al menos 2
productos. (es decir, un into para pedidos y dos into para detallepedidos con
dos productos diferentes).*/

INSERT INTO Pedidos VALUES (129,'2021-04-12','2021-04-25',NULL,'Pendiente','hola',288);
INSERT INTO DetallePedidos VALUES (129,'AR-008',3,10,2);
INSERT INTO DetallePedidos VALUES (129,'OR-241',5,14,3);

/*5. Actualiza el código del cliente insertado, el código 288 por el código 290
y averigua si hubo cambios en las tablas relacionadas.*/

/*No es posible modificar la clave primaria, ya que otra tabla depende de ella, 
aun asi podemos realizarlo del siguiente modo*/
ALTER TABLE Pedidos DROP CONSTRAINT Pedidos_Cliente;
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_Cliente FOREIGN KEY (CodigoCliente) REFERENCES Clientes (CodigoCliente) ON UPDATE CASCADE;
UPDATE Clientes SET CodigoCliente=290 WHERE CodigoCliente=288;
SELECT * FROM Pedidos WHERE CodigoPedido=129;
/*Se ha actualizado CodigoCliente de la tabla Pedidos, ya que hemos establecido que,
 en caso de cambio en la PK, las modificaciones se haran en cascada, es decir, se 
 aplicara también a sus FK*/ 

/*6. Borra el cliente y verifica si hubo cambios.*/

ALTER TABLE Pedidos DROP CONSTRAINT Pedidos_Cliente;
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_Cliente FOREIGN KEY (CodigoCliente) REFERENCES Clientes (CodigoCliente) ON DELETE CASCADE;
ALTER TABLE Pedidos DROP CONSTRAINT Pedidos_Cliente;
DELETE FROM Clientes WHERE CodigoCliente=290;
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_Cliente FOREIGN KEY (CodigoCliente) REFERENCES Clientes (CodigoCliente);


             /*ACTUALIZACIONES Y BORRADOS CON SUBCONSULTAS*/

/*Usa subconsultas en los filtros y realiza las siguientes actualizaciones y
borrados:*/


/*1. Borra los clientes que no tengan pedidos.*/



/*2. Incrementa en un 20% el precio de los productos que no tengan pedidos.*/



/*3. Borra los pagos del cliente con menos límite de crédito.*/



/*4. Establece a 0 el límite de crédito del cliente que menos unidades pedidas
tenga del producto “OR-179”.*/
