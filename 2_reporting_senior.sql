
/*
2. Realizar un procedimiento almacenado el cual reciba un parametro proveniente de una  rdl, 
el cual trae informacion almacenada de un parametro de seleccion multiple. Y la respuesta debe devolver una consulta
con filtro de este parametro.
*/


/*
Un archivo .RDL (Report Definition Language) es un archivo de definicion de reportes
utilizado por Microsoft SQL Server Reporting Services (SSRS).

-Es un archivo XML que describe el diseno, la estructura y la logica de un informe.

Contiene informacion como:
- Los campos del dataset (consultas SQL o procedimientos almacenados).
- La configuracion de parametros.
- El diseno visual: tablas, graficos, textos, colores, agrupamientos, etc.
- Las fuentes de datos a las que se conecta.

*/

--CREAR TABLA ALUMNO

CREATE TABLE ALUMNO (
    ID_ALUMNO INT PRIMARY KEY IDENTITY(1,1), -- autoincremental
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    PAIS VARCHAR(50) NOT NULL
);

--INSERTAR DATOS

INSERT INTO ALUMNO (NOMBRE, APELLIDO, PAIS) VALUES
('Goku', 'Son', 'Japon'),
('Vegeta', 'Prince', 'Colombia'),
('Naruto', 'Uzumaki', 'Japon'),
('Sakura', 'Haruno', 'Mexico'),
('Ichigo', 'Kurosaki', 'Chile'),
('Luffy', 'Monkey D.', 'Colombia');


--CREAR PROCEDIMIENTO sp_filtrar_por_paises

CREATE OR ALTER PROCEDURE sp_filtrar_por_paises
    @ListaPaises NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM ALUMNO
    WHERE PAIS IN (
        SELECT TRIM(value)
        FROM STRING_SPLIT(@ListaPaises, ',')
    );
END;

--EJECUTAR SP
EXEC sp_filtrar_por_paises @ListaPaises = 'Colombia,Mexico';


--LO QUE SE DEBE DE HACER EN .rdl (SSRS)

/*
1. Crear un parametro en SSRS
-Nombre: Paises
-Tipo: Text
-Permitir multiples valores: activado

2. Modificar el dataset del reporte
EXEC sp_filtrar_por_paises @ListaPaises = @Paises

3. En la expresion del parametro (codigo SSRS)
=Join(Parameters!Paises.Value, ",")

Resultado final
Cuando el usuario selecciona varios paises en el reporte (checkboxes), SSRS:

-Une esos valores con coma,
-Llama a tu SP con ese texto,
-Y el SP filtra correctamente con STRING_SPLIT().

*/

/*################################################################################################################################*/
