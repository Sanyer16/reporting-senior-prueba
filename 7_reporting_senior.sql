

/*

7.	 Indicar el codigo para ejecutar una consulta por un indice especifico. With 

*/


/*
R:

Permite forzar el uso de un indice especifico en una consulta, en lugar de dejar que SQL Server decida automaticamente.

*/

SELECT 
	columnas
FROM nombre_tabla 
WITH (INDEX(nombre_del_indice))
WHERE condiciones;

--EJEMPLO

CREATE TABLE ALUMNO2 (
    ID_ALUMNO INT PRIMARY KEY,
    NOMBRE VARCHAR(50),
    APELLIDO VARCHAR(50),
    PAIS VARCHAR(50)
);

--CREAR INDICE POR PAIS
CREATE NONCLUSTERED INDEX idx_pais ON ALUMNO2(PAIS);

--USAR INDICE PARA LA CONSULTA

SELECT 
*
FROM ALUMNO2 
WITH (INDEX(idx_pais))
WHERE PAIS = 'Colombia';

/*################################################################################################################################*/
