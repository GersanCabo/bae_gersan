
--1. Averigua el DNI de todos los clientes. 

SELECT dni FROM cliente;

--2. Consulta todos los datos de todos los programas. 

SELECT * FROM programa;

--3. Obtén un listado con los nombres de todos los programas. 

SELECT DISTINCT nombre FROM programa;

--4. Genera una lista con todos los comercios. 

SELECT * FROM comercio;

--5. Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza DISTINCT). 

SELECT DISTINCT ciudad FROM comercio, distribuye WHERE comercio.cif = distribuye.cif;

--6. Obtén una lista con los nombres de programas, sin que aparezcan valores duplicados (utiliza DISTINCT). 

SELECT DISTINCT nombre FROM programa;

--7. Obtén el DNI más 4 de todos los clientes.  

SELECT dni+4 FROM cliente;

--8. Haz un listado con los códigos de los programas multiplicados por 7. 

SELECT codigo*7 FROM programa;

--9 ¿Cuáles son los programas cuyo código es inferior o igual a 10? 

SELECT nombre, version FROM programa WHERE codigo<=10;

--10. ¿Cuál es el programa cuyo código es 11? 

SELECT nombre, version FROM programa WHERE codigo=11;

--11. ¿Qué fabricantes son de Estados Unidos? 

SELECT id_fab, nombre FROM fabricante WHERE pais='Estados Unidos';

--12. ¿Cuáles son los fabricantes no españoles? Utilizar el operador IN. 

SELECT id_fab, nombre FROM fabricante WHERE pais NOT IN ('Espaa');

--13. Obtén un listado con los códigos de las distintas versiones de Windows. 

SELECT codigo FROM programa WHERE nombre='Windows';

--14. ¿En qué ciudades comercializa programas El Corte Inglés? 

SELECT DISTINCT ciudad FROM comercio, distribuye WHERE comercio.cif = distribuye.cif AND comercio.nombre='El Corte Ingls';

--15. ¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN. 

SELECT nombre FROM comercio WHERE nombre NOT IN ('El Corte Ingls');

--16. Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador IN. 

SELECT codigo FROM programa WHERE nombre IN ('Windows','Access');

--17. Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN y otra sin BETWEEN.

SELECT nombre FROM cliente WHERE (edad BETWEEN 10 AND 25) OR edad>50;

--18. Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados. 

SELECT DISTINCT nombre FROM comercio WHERE ciudad IN ('Sevilla','Madrid');

--19. ¿Qué clientes terminan su nombre en la letra “o”? 

SELECT * FROM cliente WHERE nombre LIKE '%o';

--20. ¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años? 

SELECT * FROM cliente WHERE nombre LIKE '%o' AND edad>30;

--21. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W. 

SELECT * FROM programa WHERE version LIKE '%i' OR nombre LIKE 'A%' OR 'W%';

--22. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S. 

SELECT * FROM programa WHERE version LIKE '%i' OR nombre LIKE 'A%s';

--23. Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A. 

SELECT * FROM programa WHERE version LIKE '%i' AND  nombre NOT LIKE 'A%';

--24. Obtén una lista de empresas por orden alfabético ascendente. 

SELECT * FROM comercio ORDER BY nombre;

--25. Genera un listado de empresas por orden alfabético descendente. 

SELECT * FROM comercio ORDER BY nombre DESC;

--26. Obtén un listado de programas por orden de versión.

SELECT * FROM programa ORDER BY version;

--27. Genera un listado de los programas que desarrolla Oracle. 

SELECT programa.nombre, programa.version FROM fabricante, desarrolla, programa WHERE fabricante.nombre="Oracle" AND fabricante.id_fab=desarrolla.id_fab AND desarrolla.codigo=programa.codigo;

--28. ¿Qué comercios distribuyen Windows? 

SELECT comercio.nombre FROM comercio, distribuye, programa WHERE programa.nombre="Windows" AND programa.codigo=distribuye.codigo AND distribuye.cif=comercio.cif;

--29. Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.

SELECT programa.nombre, programa.version, distribuye.cantidad FROM programa, distribuye, comercio WHERE comercio.nombre="El Corte Ingls" AND comercio.cif=distribuye.cif AND distribuye.codigo=programa.codigo;

--30. ¿Qué fabricante ha desarrollado Freddy Hardest? 

SELECT fabricante.nombre FROM fabricante, desarrolla, programa WHERE programa.nombre="Freddy Hardest" AND programa.codigo=desarrolla.codigo AND desarrolla.id_fab=fabricante.id_fab;

--31. Selecciona el nombre de los programas que se registran por Internet. 

SELECT programa.nombre FROM programa, registra WHERE registra.medio="Internet" AND registra.codigo=programa.codigo;
 
--32. ¿Qué medios ha utilizado para registrarse Pepe Pérez? 

SELECT registra.medio FROM registra, cliente WHERE cliente.nombre="Pepe Prez" AND cliente.dni=registra.dni;

--33. ¿Qué usuarios han optado por Internet como medio de registro? 

SELECT cliente.dni, cliente.nombre FROM cliente, registra WHERE registra.medio="Internet" AND registra.dni=cliente.dni;

--34. ¿Qué programas han recibido registros por tarjeta postal? 

SELECT programa.nombre, programa.version FROM programa, registra WHERE registra.medio="Tarjeta postal" AND registra.codigo=programa.codigo;

--35. ¿En qué localidades se han vendido productos que se han registrado por Internet? 

SELECT comercio.ciudad FROM comercio, registra WHERE registra.medio="Internet" AND registra.cif=comercio.cif;

--36. Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro. 

SELECT cliente.nombre, programa.nombre FROM cliente, registra, programa WHERE registra.medio="Internet" AND registra.dni=cliente.dni AND registra.codigo=programa.codigo;

--37. Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

SELECT cliente.dni, cliente.nombre, programa.nombre, programa.version, registra.medio, comercio.cif, comercio.nombre FROM cliente, programa, registra, comercio WHERE registra.dni=cliente.dni AND 

--38. Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle. 



--39. Obtén el nombre de los usuarios que han registrado Access XP. 


--40. Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ. (Subconsulta). 


--41. Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta). 


--42. Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta). 


--43. Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta). 


--44. Obtener el número de programas que hay en la tabla programas. 46 Calcula el número de clientes cuya edad es mayor de 40 años. 


--45. Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1. 


--46. Calcula la media de programas que se venden cuyo código es 7.  


--47. Calcula la mínima cantidad de programas de código 7 que se ha vendido 


--48. Calcula la máxima cantidad de programas de código 7 que se ha vendido.


--49. ¿En cuántos establecimientos se vende el programa cuyo código es 7? 


--50. Calcular el número de registros que se han realizado por Internet.  


--51. Obtener el número total de programas que se han vendido en ʻSevillaʼ. 


--52. Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ. 


--53. Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la cadena nombre. 


--54. Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA. 
