

/*

5.	Defina un Cross Join 

*/

/*
R:
Un CROSS JOIN es un tipo de combinación entre tablas que devuelve todas las combinaciones posibles de filas entre dos tablas.

¿Cuándo se usa?
-Cuando necesitas probar todas las combinaciones posibles entre elementos de dos listas.
-Por ejemplo, para combinar colores y tallas, productos y regiones, fechas y recursos, etc.

*/

--EJEMPLO

SELECT 
	A.NOMBRE
	C.NOMBRE_CURSO
FROM ALUMNO A
CROSS JOIN CURSO C


