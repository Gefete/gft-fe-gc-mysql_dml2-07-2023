/*4.1*/
Select nombre from peliculas;

/*4.2*/
Select distinct CALIFICACIONEDAD from peliculas;

/*4.3*/
Select * from peliculas
where CALIFICACIONEDAD is null;

/*4.4*/
Select * from salas
where PELICULA is null;

/*4.5*/
Select * from salas s 
left join peliculas p on s.PELICULA = p.CODIGO;

/*4.6*/
Select * from peliculas p
left join salas s on s.PELICULA = p.CODIGO;

/*4.7*/
Select p.nombre from peliculas p 
left join salas s on  p.CODIGO = s.PELICULA
where s.PELICULA is null ;

/*4.8*/
INSERT peliculas values (10, 'Uno, Dos, Tres', 'mayores de 7');

/*4.9*/
/* PG-13 – Parents Strongly Cautioned
Algunos materiales pueden ser inapropiados para niños menores 
de 13 años. Los padres deben ser cautelosos. 
Puede ser inapropiado para pre-adolescentes. */
UPDATE peliculas 
set CALIFICACIONEDAD = 'PG-13' 
where CALIFICACIONEDAD is null;

/*4.10*/
/*G – General Audiences
Admitido para todas las edades. 
Nada que pudiera ofender a los padres si lo vieran sus hijos.*/
DELETE from salas where pelicula in 
(select codigo from peliculas where CALIFICACIONEDAD = 'G');