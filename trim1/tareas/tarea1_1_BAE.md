## Tarea 1.1 Introducción a las bases de datos

1. **¿Qué es un archivo o fichero?**

    Es un conjunto de información relacionada, tratada como un todo y organizada de forma estructurada. Aunque también se puede definir como una secuencia de dígitos binarios que organiza información relacionada con un mismo aspecto.

2. **Tipos de ficheros.**

  - **Permanentes:** Estos contienen los datos necesarios para el funcionamiento de la aplicación y tienen un periodo de permanencia en el sistema amplio. Los hay de tres tipos:

    - **Maestros:** Son la parte central de la aplicación y contienen el estado actual de los datos que pueden modificarse desde la aplicación.

    - **Constantes:** Son aquellos que incluyen datos fijos para la aplicación. No suelen ser modificados y se accede a ellos para realización de consultas.

    - **Históricos:** Contienen datos que fueron considerados como actuales en un período o situación anterior. Se utilizan para la reconstrucción de situaciones.

  - **Temporales:** Almacenan información útil para una parte de la aplicación y son generados a partir de los ficheros permanentes. Tienen un corto periodo de existencia. Los hay de tres tipos:

    - **Intermedios:** Almacenan datos de una aplicación que serán utilizados por otra.

    - **De maniobras:** Almacenan datos de una aplicación que no pueden ser mantenidos en memoria principal por falta de espacio.

    - **De resultados:** Almacenan datos que van a ser transferidos a un dispositivo de salida.

3. **Define brevemente los conceptos de registro y campo.**

  - **Registros:** Es un conjunto de atributos que contienen los datos que pertenecen a una misma entidad.

  - **Campos:** Donde se almacenan los atributos de cada registro.

4. **¿Qué es una base de datos?**

  Es un conjunto estructurado de datos que representa entidades y sus interrelaciones, almacenados con la mínima redundancia y posibilitando el acceso a ellos de forma eficiente por parte de varias aplicaciones y usuarios.

5. **Diferencias entre un sistema convencional de archivos y un Sistema Gestor de Base de Datos.**

  El *SGBD* tiene bastantes ventajas respercto a un sistema convencional de archivos, ellas son:

    - Proporcionan al usuario una visión abstracta de los datos, ocultando parte de la complejidad relacionada con cómo se almacenan y mantienen los datos.

    - Ofrecen independencia física, es decir, la visión que tiene de la información el usuario, y la manipulación de los datos almacenados en la base de datos, es independiente de cómo estén almacenados físicamente.

    - Disminuyen la redundancia y la inconsistencia de datos.

    - Aseguran la integridad de los datos.

    - Facilitan el acceso a los datos, aportando rapidez y evitando la pérdida de datos.

    - Aumentan la seguridad y privacidad de los datos.

    - Mejoran la eficiencia.

    - Permiten compartir datos y accesos concurrentes.

    - Facilitan el intercambio de datos entre distintos sistemas.

    - Incorporan mecanismos de copias de seguridad y recuperación para restablecer la información en caso de fallos en el sistema.

6. **Componentes de un Sistema Gestor de Base de Datos.**

  - **Lenguaje de la base de datos:** Gracias a él podemos especificar los datos que componen la base de datos, su estructura, relaciones, reglas de integridad, control de acceso, características físicas y vistas externas de los usuarios.

  - **Diccionario de la base de datos:** Es el lugar donde se ubica la información sobre la totalidad de los datos que forman la base de datos.

  - **Gestor de la base de datos:** Es la parte del software encargada de asegurar el correcto, seguro, íntegro y eficiente acceso y almacenamiento de datos.

  - **Usuarios de la base de datos:** Son los distintos perfiles de usuario que tienen acceso a  la base de datos, cada uno de ellos  goza de permisos diferentes.

  - **Herramientas de la base de datos:** Conjunto de aplicaciones que permiten a los administradores la gestión de la base de datos, de los usuarios y permisos, generadores de formularios, informes, interfaces gráficas, generadores de aplicaciones, etc.

7. **Tipos de usuarios de las bases de datos, funciones y características de cada uno de ellos.**

  **Administradores:** Se encargan del diseño físico de la misma, implementación y mantenimiento de la base de datos.

  **Diseñadores:** Se encarga de identificar los datos, las relaciones entre los datos y las restricciones sobre los datos y sus relaciones.

  **Programadores:** Son los que programan las aplicaciones que interactúan con las bases de datos, con su contenido y con el entorno que las rodea. Estas aplicaciones servirán para que los usuarios finales puedan consultar datos, insertarlos, actualizarlos y eliminarlos.

  **Usuarios finales:** Son los clientes de la base de datos, hacen uso de ella sin conocer en absoluto su funcionamiento y organización interna.

8. **Organización de una base de datos.**

Existen distintas formas de organizar los *ficheros* en la *memoria*, pero los más conocidos son:

- **Fichero secuenciales:**

  - Sus registros están almacenados de forma contigua.

  - La única forma de acceder a él, es leyendo un registro tras otro desde el principio hasta el final.

  - En los ficheros secuenciales suele haber una marca indicativa del fin del fichero, que suele denominarse *EOF*

  - Los registros almacenados se identifican por medio de una información ubicada en uno de sus campos, a este campo se le denomina *clave o llave*.

- **Ficheros de acceso directo**:

  - En este tipo de ficheros se puede acceder a un registro indicando la posición relativa del mismo dentro del archivo o través de una clave que forma parte del registro como un campo más.

  - **Campo clave:** Campo que permite identificar y localizar un  registro de una manera ágil y organizada.

  - No es necesario recorrer todo el fichero para encontrar un determinado registro.

  - A través de una transformación específica aplicada a la clave, se obtendrá la dirección física en la que se encuentra el registro.

  - Según la forma de realizar esta transformación, existen diferentes tipos de acceso:

  - **Ficheros indexados:**

    - Utilización de *índices*, que permiten el acceso a un registro del fichero de forma directa, sin tener que leer los anteriores.

    - Por tanto, existirá una zona de registros en la que se encuentran los datos del archivo y una zona de índices, que contiene una tabla con las claves de los registros y las posiciones donde se encuentran los mismos.

    - La tabla de índices estará ordenada por el campo clave.

  - **Ficheros secuenciales indexados:**

    - También llamados parcialmente indexados.

    - Existe una zona de índices y otra zona de registros de datos, pero esta última se encuentra dividida en segmentos ordenados.

    - Permite el acceso secuencial. Esto es muy interesante cuando la tasa de actividad es alta.

    - Permite el acceso directo a los registros.

  - **Ficheros de acceso calculado o hash:**

    - La técnica del acceso calculado o hash, permite accesos más rápidos, ya que en lugar de consultar una tabla, se utiliza una transformación o función matemática conocida, que a partir de la clave genera la dirección de cada registro del archivo.

    - **Colisión:** a partir de diferentes claves se obtiene la misma dirección al aplicar la función matemática o transformación.

    - **Sinónimos:** claves que generan la misma dirección.


9. **Modelos de bases de datos.**

Los más conocidos son estos *cuatro*:

- **Jerárquico:**

  - La información se organiza con una *jerarquía* en la que la relación entre las entidades de este modelo siempre es del tipo *padre/hijo*.

  - Existen *nodos* que contienen *atributos o campos* y que se relacionarán con sus nodos hijos, pudiendo tener cada nodo más de un hijo, pero ***un nodo siempre tendrá un sólo padre.***

  - Los datos de este modelo se almacenan en estructuras lógicas llamadas *segmentos*. Los segmentos se relacionan entre sí utilizando *arcos*.

  - Hoy en día, debido a sus limitaciones, el modelo jerárquico está en desuso.

- **En red:**

  - El modelo en red organiza la información en *registros (nodos)* y *enlaces*.

  - En los registros se almacenan los datos, mientras que los enlaces permiten relacionar estos datos.

  - Son parecidas a las jerárquicas sólo que en ellas puede haber ***más de un padre***.

  - En este modelo se pueden representar perfectamente cualquier tipo de relación entre los datos, pero hace muy complicado su manejo.

- Relacional:

  - En el modelo relacional la base de datos es percibida por el usuario como un *conjunto de tablas*.

  - Utiliza *tablas bidimensionales(relaciones)* para la representación lógica de los datos y las relaciones entre ellos.

  - Cada relación posee un nombre que es único y contiene un conjunto de columnas.

  - Se llamará *registro, entidad o tupla* a cada fila de la tabla y *campo o atributo* a cada columna de la tabla.

  - A los conjuntos de valores que puede tomar un determinado atributo, se le denomina *dominio*.

  - Una *clave* será un atributo o conjunto de atributos que identifique de forma única a una tupla.

  - Las tablas deben cumplir una serie de requisitos:

    - Todos los registros son del mismo tipo.

    - La tabla sólo puede tener un tipo de registro.

    - No existen campos o atributos repetidos.

    - No existen registros duplicados.

    - No existe orden en el almacenamiento de los registros.

    - Cada registro o tupla es identificada por una clave que puede estar formada por uno o varios campos o atributos.

- Orientado a objetos:

  - Define una base de datos en términos de *objetos*, sus propiedades y sus operaciones.

  - Los objetos con la misma estructura y comportamiento pertenecen a una *clase*, y las clases se organizan en *jerarquías*.

  - Las operaciones de cada clase se especifican en términos de procedimientos predefinidos denominados *métodos*.


10. **Tipos de archivos según su función en el tiempo**

  Se pueden dividir en dos grupos:

    - **Permanentes:** Estos contienen los datos necesarios para el funcionamiento de la aplicación y tienen un *periodo de permanencia en el sistema amplio*.

    - **Temporales:** Almacenan información útil para una parte de la aplicación y son generados a partir de los ficheros permanentes. Tienen un *corto periodo de existencia*.
