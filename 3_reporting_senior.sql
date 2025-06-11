

/*
3.	Escriba la estructura de un Merge.
*/

/*
Un MERGE es un comando que sirve para comparar dos tablas y según esa comparación, actualizar, insertar o eliminar datos de una de ellas.

¿Cuándo se usa?

-Tienes una tabla con datos nuevos o actualizados (por ejemplo, una tabla temporal o una importación).
-Quieres que SQL decida automáticamente si debe actualizar, insertar o borrar en la tabla principal, todo en una sola sentencia.
*/

MERGE INTO TABLA_DESTINO AS D
USING TABLA_ORIGEN AS O
ON D.ID = O.ID  -- CONDICION PARA COINCIDENCIA

WHEN MATCHED THEN
    UPDATE SET
        D.CAMPO_1 = O.CAMPO_1,
        D.CAMPO_2 = O.CAMPO_2

WHEN NOT MATCHED BY TARGET THEN
    INSERT (CAMPO_1, CAMPO_1)
    VALUES (O.CAMPO_2, O.CAMPO_2)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

/*
| Parte                        | Explicación                                                                |
| ---------------------------- | -------------------------------------------------------------------------- |
| `MERGE INTO TABLA_DESTINO`   | Especifica la tabla que quieres modificar (actualizar, insertar o borrar). |
| `USING TABLA_ORIGEN`         | La tabla con los nuevos datos a comparar.                                  |
| `ON D.ID = O.ID`             | Condición para encontrar coincidencias.                                    |
| `WHEN MATCHED THEN UPDATE`   | Si hay coincidencia: actualiza.                                            |
| `WHEN NOT MATCHED BY TARGET` | Si hay en la fuente pero no en el destino: inserta.                        |
| `WHEN NOT MATCHED BY SOURCE` | Si hay en el destino pero no en la fuente: elimina.                        |

*/

/*
EJEMPLO
*/

MERGE INTO Clientes AS C
USING Clientes_Actualizados AS CA
ON C.ID_Cliente = CA.ID_Cliente

WHEN MATCHED THEN
    UPDATE SET 
        C.Nombre = CA.Nombre,
        C.Correo = CA.Correo

WHEN NOT MATCHED BY TARGET THEN
    INSERT (ID_Cliente, Nombre, Correo)
    VALUES (CA.ID_Cliente, CA.Nombre, CA.Correo)

WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

/*################################################################################################################################*/
