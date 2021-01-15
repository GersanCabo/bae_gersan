
-- Realizar las siguientes consultas:

--1 Mostrar el apellido, oficio y número de departamento de cada empleado.

SELECT apellido, oficio, dept_no FROM emple;

--2 Mostrar el número, nombre y localización de cada departamento.

SELECT dept_no, dnombre, loc FROM depart;

--3 Mostrar todos los datos de todos los empleados.

SELECT * FROM emple;

--4 Datos de los empleados ordenados por apellidos.

SELECT * FROM emple ORDER BY apellido;

--5 Datos de los empleados ordenados por número de departamento descendentemente.

SELECT * FROM emple ORDER BY dept_no DESC;

--6 Datos de los empleados ordenados por número de departamento descendentemente y dentro de cada departamento ordenados por apellido ascendentemente.

SELECT * FROM emple ORDER BY dept_no DESC, apellido ASC;

--8 Mostrar los datos de los empleados cuyo salario sea mayor que 2000000. 

SELECT * FROM emple WHERE salario>2000000;

--9 Mostrar los datos de los empleados cuyo oficio sea ʻANALISTAʼ.

SELECT * FROM emple WHERE oficio='ANALISTA';
   
--10 Seleccionar el apellido y oficio de los empleados del departamento número 20.

SELECT apellido, oficio FROM emple WHERE dept_no=20;

--11 Mostrar todos los datos de los empleados ordenados por apellido.

SELECT * FROM emple ORDER BY apellido;

--12 Seleccionar los empleados cuyo oficio sea ʻVENDEDORʼ. Mostrar los datos ordenados por apellido.

SELECT * FROM emple WHERE oficio='VENDEDOR' ORDER BY apellido;

--13 Mostrar los empleados cuyo departamento sea 10 y cuyo oficio sea ʻANALISTAʼ. Ordenar el resultado por apellido.

SELECT * FROM emple WHERE dept_no=10 AND oficio='ANALISTA' ORDER BY apellido;

--14 Mostrar los empleados que tengan un salario mayor que 200000 o que pertenezcan al departamento número 20.

SELECT * FROM emple WHERE salario>200000 OR dept_no=20;

--15 Ordenar los empleados por oficio, y dentro de oficio por apellido.

SELECT * FROM emple ORDER BY oficio, apellido;

--16 Seleccionar de la tabla EMPLE los empleados cuyo apellido empiece por ʻAʼ.

SELECT * FROM emple WHERE apellido LIKE 'A%';

--17 Seleccionar de la tabla EMPLE los empleados cuyo apellido termine por ʻZʼ.

SELECT * FROM emple WHERE apellido LIKE '%Z';

--18 Seleccionar de la tabla EMPLE aquellas filas cuyo APELLIDO empiece por ʻAʼ y el OFICIO tenga una ʻEʼ en cualquier posición.

SELECT * FROM emple WHERE apellido LIKE 'A%' AND oficio LIKE '%E%';

--19 Seleccionar los empleados cuyo salario esté entre 100000 y 200000. Utilizar el operador BETWEEN.

SELECT * FROM emple WHERE salario BETWEEN 100000 AND 200000;


--20 Obtener los empleados cuyo oficio sea ʻVENDEDORʼ y tengan una comisión superior a 100000.

SELECT * FROM emple WHERE oficio='VENDEDOR' AND comision>100000;


--21 Seleccionar los datos de los empleados ordenados por número de departamento, y dentro de cada departamento ordenados por apellido.

SELECT * FROM emple ORDER BY dept_no, apellido;


--22 Número y apellidos de los empleados cuyo apellido termine por ʻZʼ y tengan un salario superior a 300000.

SELECT emp_no, apellido FROM emple WHERE apellido LIKE '%Z' AND salario>300000;

--23. Datos de los departamentos cuya localización empiece por ʻBʼ.

SELECT * FROM depart WHERE loc LIKE 'B%';

--24. Datos de los empleados cuyo oficio sea ʻEMPLEADOʼ, tengan un salario superior a 100000 y pertenezcan al departamento número 10.

SELECT * FROM emple WHERE oficio='EMPLEADO' AND salario>100000 AND dept_no=10;

--25. Mostrar los apellidos de los empleados que no tengan comisión.

SELECT apellido FROM emple WHERE comision=0;


--26. Mostrar los apellidos de los empleados que no tengan comisión y cuyo apellido empiece por ʻJʼ.

SELECT apellido FROM emple WHERE comision=0 AND apellido LIKE 'J%';

--27. Mostrar los apellidos de los empleados cuyo oficio sea ʻVENDEDORʼ, ʻANALISTAʼ o ʻEMPLEADOʼ.

SELECT apellido FROM emple WHERE oficio IN ('VENDEDOR','ANALISTA','EMPLEADO');

 
--28. Mostrar los apellidos de los empleados cuyo oficio no sea ni ʻANALISTAʼ ni ʻEMPLEADOʼ, y además tengan un salario mayor de 200000.

SELECT apellido FROM emple WHERE oficio!='ANALISTA' AND oficio!='EMPLEADO' AND salario>200000;


--29 Seleccionar de la tabla EMPLE los empleados cuyo salario esté entre 2000000 y 3000000 (utilizar BETWEEN).

SELECT * FROM emple WHERE salario BETWEEN 2000000 AND 3000000;

--30 Seleccionar el apellido, salario y número de departamento de los empleados cuyo salario sea mayor que 200000 en los departamentos 10 ó 30.

SELECT apellido, salario, dept_no FROM emple WHERE salario>200000 AND dept_no IN (10, 30);