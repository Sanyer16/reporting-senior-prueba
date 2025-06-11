
/*

4.	Realice una query con un update donde actualice un campo de la tabla a tomando un campo de la tabla b

*/


UPDATE A
SET A.CAMPO_DESTINO = B.CAMPO_ORIGEN
FROM TablaA AS A
JOIN TablaB AS B ON A.ID = B.ID


/*//*/*/ EJEMPLO

-- Supongamos estas tablas:

-- Tabla ALUMNO:
-- ID_ALUMNO | NOMBRE  | PAIS
--     1     |  Goku   | NULL

-- Tabla PAISES:
-- ID_ALUMNO | NUEVO_PAIS
--     1     | Japón

-- UPDATE:
UPDATE A
SET A.PAIS = B.NUEVO_PAIS
FROM ALUMNO AS A
JOIN PAISES AS B ON A.ID_ALUMNO = B.ID_ALUMNO;

--Busca coincidencias por ID_ALUMNO y Actualiza el campo PAIS de ALUMNO con el valor de NUEVO_PAIS desde PAISES.

/*################################################################################################################################*/
