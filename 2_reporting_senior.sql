
/*
2. Realizar un procedimiento almacenado el cual reciba un par�metro proveniente de una  rdl, 
el cual trae informaci�n almacenada de un par�metro de selecci�n m�ltiple. Y la respuesta debe devolver una consulta
con filtro de este par�metro.
*/


/*
Un archivo .RDL (Report Definition Language) es un archivo de definici�n de reportes
utilizado por Microsoft SQL Server Reporting Services (SSRS).

-Es un archivo XML que describe el dise�o, la estructura y la l�gica de un informe.

Contiene informaci�n como:
� Los campos del dataset (consultas SQL o procedimientos almacenados).
� La configuraci�n de par�metros.
� El dise�o visual: tablas, gr�ficos, textos, colores, agrupamientos, etc.
� Las fuentes de datos a las que se conecta.

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
('Goku', 'Son', 'Jap�n'),
('Vegeta', 'Prince', 'Colombia'),
('Naruto', 'Uzumaki', 'Jap�n'),
('Sakura', 'Haruno', 'M�xico'),
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
EXEC sp_filtrar_por_paises @ListaPaises = 'Colombia,M�xico';


--LO QUE SE DEBE DE HACER EN .rdl (SSRS)

/*
1. Crear un par�metro en SSRS
-Nombre: Paises
-Tipo: Text
-Permitir m�ltiples valores: activado

2. Modificar el dataset del reporte
EXEC sp_filtrar_por_paises @ListaPaises = @Paises

3. En la expresi�n del par�metro (c�digo SSRS)
=Join(Parameters!Paises.Value, ",")

Resultado final
Cuando el usuario selecciona varios pa�ses en el reporte (checkboxes), SSRS:

-Une esos valores con coma,
-Llama a tu SP con ese texto,
-Y el SP filtra correctamente con STRING_SPLIT().

*/

/*################################################################################################################################*/
