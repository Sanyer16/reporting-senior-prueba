
/*
2. Realizar un procedimiento almacenado el cual reciba un parámetro proveniente de una  rdl, 
el cual trae información almacenada de un parámetro de selección múltiple. Y la respuesta debe devolver una consulta
con filtro de este parámetro.
*/


/*
Un archivo .RDL (Report Definition Language) es un archivo de definición de reportes
utilizado por Microsoft SQL Server Reporting Services (SSRS).

-Es un archivo XML que describe el diseño, la estructura y la lógica de un informe.

Contiene información como:
• Los campos del dataset (consultas SQL o procedimientos almacenados).
• La configuración de parámetros.
• El diseño visual: tablas, gráficos, textos, colores, agrupamientos, etc.
• Las fuentes de datos a las que se conecta.

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
('Goku', 'Son', 'Japón'),
('Vegeta', 'Prince', 'Colombia'),
('Naruto', 'Uzumaki', 'Japón'),
('Sakura', 'Haruno', 'México'),
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
EXEC sp_filtrar_por_paises @ListaPaises = 'Colombia,México';


--LO QUE SE DEBE DE HACER EN .rdl (SSRS)

/*
1. Crear un parámetro en SSRS
-Nombre: Paises
-Tipo: Text
-Permitir múltiples valores: activado

2. Modificar el dataset del reporte
EXEC sp_filtrar_por_paises @ListaPaises = @Paises

3. En la expresión del parámetro (código SSRS)
=Join(Parameters!Paises.Value, ",")

Resultado final
Cuando el usuario selecciona varios países en el reporte (checkboxes), SSRS:

-Une esos valores con coma,
-Llama a tu SP con ese texto,
-Y el SP filtra correctamente con STRING_SPLIT().

*/

/*################################################################################################################################*/
