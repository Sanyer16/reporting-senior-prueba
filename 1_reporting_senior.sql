

--Prueba para Reporting Senior


USE [bootcamp]  --Se usa cualquier base para que almacene sl SP

--1. Realizar un procedimiento almacenado que realice las siguientes peticiones:

ALTER PROCEDURE sp_reporting

--a.	Que reciba 3 par�metros un entero, un texto y una fecha:

    @entero INT,
    @texto  NVARCHAR(100),
    @fecha  DATE
AS
BEGIN
    DECLARE @anio INT, @mes INT, @dia INT, @largo INT, @comparacion NVARCHAR(20);
    DECLARE @contador INT = 1;

--b. Con el par�metro de fecha se debe sacar a�o, d�a y mes como variables aparte:

    SET @anio = YEAR(@fecha);
    SET @mes  = MONTH(@fecha);
    SET @dia  = DAY(@fecha);

	/*
	c.Con la variable texto se debe obtener el largo de la informaci�n guarda en esta y dependiendo del largo
	se debe agregar un campo indicando si es mayor a la variable tipo entero o menor.:
	*/

    -- Obtener largo del texto
    SET @largo = LEN(@texto);

    -- Comparar largo con entero
    IF @largo > @entero
        SET @comparacion = 'Mayor';
    ELSE
        SET @comparacion = 'Menor o Igual';

    -- Mostrar info resumen
    SELECT 
        @entero      AS Entero,
        @texto       AS Texto,
        @fecha       AS Fecha,
        @anio        AS Anio,
        @mes         AS Mes,
        @dia         AS Dia,
        @largo       AS Largo_Texto,
        @comparacion AS Comparacion;

--d. Despu�s de esto se debe generar un c�digo para que las veces del numero entero imprima la variable texto:

    WHILE @contador <= @entero
    BEGIN
        PRINT @texto;
        SET @contador = @contador + 1;
    END

--e. Y al final me devuelva una consulta de la suma del largo del texto:

    SELECT (@largo * @entero) AS Suma_Largo_Texto;

END;


-- Ejecutar sp (imprime lo que se ha ingresado):

EXEC sp_reporting @entero = 5, @texto = 'Sql Server', @fecha = '2025-05-29' ;

/*################################################################################################################################*/









