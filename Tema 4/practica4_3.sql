-- Se dispone de la "personas" con los datos de los empleados que trabajan en una seir de hospitales. Realiza las siguientes consultas en SQL.

-- 1. Mostrar todos los datos de todas las personas.

SELECT * FROM personas;

-- 2. Obtén el DNI, apellidos y función de todas las personas.

SELECT dni, apellidos, funcion FROM personas;

-- 3. Mostrar los apellidos de las personas que vivan en LORCA.

SELECT apellidos FROM personas WHERE localidad='LORCA';

-- 4. Mostrar los apellidos de las personas que vivan en MURCIA o LORCA

SELECT apellidos FROM personas WHERE localidad=('LORCA' OR 'MURCIA');

-- 5. Seleccionar los datos de aquellas personas que vivan en MURCIA y tengan un salario superior a los 1500 euros.

SELECT * FROM personas WHERE localidad='MURCIA' AND salario>1500;

-- 6. Mostrar los datos de las personas que vivan en MURCIA, tengan un salario superior a los 1500 euros y sean DIRECTORES.

SELECT * FROM personas WHERE localidad='MURCIA' AND salario>1500 AND funcion='DIRECTOR';

-- 7. Mostrar los datos de las personas cuya función sea MÉDICO ordenados por apellidos descendentemente.

SELECT * FROM personas WHERE funcion='MEDICO' ORDER BY apellidos DESC;

-- 8. Mostrar los datos de todas las localidades que hay en la tabla personas sin repeticiones (debes emplear la cláusula DISTINCT)

SELECT DISTINCT localidad FROM personas;

-- 9. Mostrar los datos de las personas que tengan un salario superior a 1500 euros y sean médicos. Ordenar la salida por salario descendentemente.

SELECT * FROM personas WHERE funcion='MEDICO' AND salario>1500 ORDER BY salario DESC;

-- 10. Seleccionar aquellas personas cuyo apellido comience por M.

SELECT * FROM personas WHERE apellidos LIKE 'M%';

-- 11. Mostrar los datos de las personas que tengan una M en el apellido y cuya función sea CONSERJE.

SELECT * FROM personas WHERE apellidos LIKE 'M%' AND funcion='CONSERJE';

-- 12. Mostrar aquellas personas que tengan un salario entre 1500 y 2000 euros.

SELECT * FROM personas WHERE salario BETWEEN 1500 AND 2000;

-- 13. Seleccionar los datos de aquellas personas cuya función sea MÉDICO o DIRECTOR (utilizar el operador IN)

SELECT * FROM personas WHERE funcion IN ('MEDICO', 'DIRECTOR');

-- 14. Obtener los datos de aquellas personas cuya función no sea CONSERJE (utilizar el operador NOT IN) y tengan un salario superior a los 1500 euros, ordenados por apellido descendentemente.

SELECT * FROM personas WHERE funcion NOT IN ('CONSERJE') AND salario>1500 ORDER BY apellidos DESC;

-- 15. Mostrar los datos de las personas que sean de MURCIA o CARTAGENA y que pertenezcan al hospital número 1.

SELECT * FROM personas WHERE localidad IN ('MURCIA', 'CARTAGENA') AND cod_hospital=1;

-- 16. Obtén los apellidos en mayúsculas de las personas que trabajen en el hospital número 1.

SELECT UPPER(apellidos) FROM personas WHERE cod_hospital=1;

-- 17. Con una consulta devuelve los apellidos de todas las personas. Al lado debe aparecer la longitud de cada apellido.

SELECT apellidos, CHAR_LENGTH(apellidos) AS numero_de_letras FROM personas; 

-- 18. Obtener los apellidos y localidad en minúscula de todas aquellas personas que no trabajen en el hospital número 1.

SELECT LOWER(apellidos), LOWER(localidad) FROM personas WHERE cod_hospital<>1;

-- 19. Obtener los datos de las personas que trabajen en los hospitales 1 ó 2 y tengan un salario superior a 1500 euros.

SELECT * FROM personas WHERE cod_hospital IN (1, 2) AND salario>1500;

-- 20. Visualizar los datos de aquellas personas que no trabajen en el hospital número 2 y que sean de MURCIA.

SELECT * FROM personas WHERE cod_hospital<>2 AND localidad='MURCIA';


