# 📄 Prueba Técnica – Analista de Reporting Senior (SQL Server)

Este repositorio contiene los ejercicios solicitados en una **prueba técnica** para el rol de **Analista de Reporting Senior**, centrados en el manejo de SQL Server. El objetivo es demostrar habilidades en procedimientos almacenados, manipulación de datos, joins, uso de índices y exportación de resultados a Excel.

A continuación, se listan los puntos desarrollados:

---

## ✅ Puntos a realizar

1. **Realizar un procedimiento almacenado** que realice las siguientes peticiones:  
   a. Que reciba 3 parámetros: un entero, un texto y una fecha.  
   b. Con el parámetro de fecha se debe sacar año, día y mes como variables aparte.  
   c. Con la variable texto se debe obtener el largo de la información guardada en esta y, dependiendo del largo, se debe agregar un campo indicando si es mayor o menor que la variable tipo entero.  
   d. Después de esto se debe generar un código para que, las veces del número entero, imprima la variable texto.  
   e. Y al final devuelva una consulta con la suma del largo del texto.  

2. **Realizar un procedimiento almacenado** el cual reciba un parámetro proveniente de una `.rdl`, el cual trae información almacenada de un parámetro de selección múltiple. La respuesta debe devolver una consulta con filtro de este parámetro.

3. **Escribir la estructura de un `MERGE`** para sincronizar datos entre dos tablas, incluyendo condiciones para `INSERT`, `UPDATE` o `DELETE`.

4. **Realizar una query con un `UPDATE`**, donde se actualice un campo de la tabla **A** tomando un valor de un campo correspondiente de la tabla **B**.

5. **Definir un `CROSS JOIN`**, el cual devuelve el producto cartesiano entre dos tablas, es decir, combina todas las filas de una tabla con todas las filas de otra.

6. **Encontrar el error en el siguiente código:**
   ```sql
   create table ##op as
   (
       id int,
       campo1 varchar(100),
       campo2 int,
   )

   select * from ##op where campo2 = ('4021')

7. **Indicar el código para ejecutar una consulta usando un índice**
8. **Cómo se realiza una conexión de una query a un archivo de Excel:**






