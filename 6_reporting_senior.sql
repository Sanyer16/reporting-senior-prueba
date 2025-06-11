

/*
6.	Encuentre el error en el siguiente código:
create table ##op as
(
id int,
campo1 varchar(100),
campo2 int,
)

select * from ##op where campo2 = ('4021')

*/

create table ##op as --AL CREAR UNA TABLA NO SE PUEDE USAR ALIAS 'AS'
(
id int,
campo1 varchar(100),
campo2 int,         --COMO ES EL ULTIMO CAMPO NO PUEDE HABER UNA COMA ,
)

select * from ##op where campo2 = ('4021') -- SE ESTA COMPARANDO DOS TIPOS DE DATOS DIFERENTES


---CODIGO CORREGIDO:

CREATE TABLE ##op (
    id INT,
    campo1 VARCHAR(100),
    campo2 INT
);


SELECT * FROM ##op WHERE campo2 = 4021;

--EJEMPLO CON DATOS, INSERTAMOS DATOS DE PRUEBA

INSERT INTO ##op (id, campo1, campo2) VALUES
(1, 'Dato A', 4021),
(2, 'Dato B', 3000),
(3, 'Dato C', 4021),
(4, 'Dato D', 1000);


SELECT 
	* 
FROM ##op 
WHERE campo2 = 4021;

/*################################################################################################################################*/