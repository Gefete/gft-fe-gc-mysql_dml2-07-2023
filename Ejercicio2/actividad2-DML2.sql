/*2.1*/
SELECT apellidos from empleados;

/*2.2*/
SELECT distinct(apellidos) from empleados;

/*2.3*/
SELECT * from empleados where apellidos = 'Smith';

/*2.4*/
SELECT * from empleados where apellidos in ('Smith', 'Rogers');

/*2.5*/
SELECT * from empleados where departamento=14;

/*2.6*/
SELECT * from empleados where departamento in (37,77);

/*2.7*/
SELECT * from empleados where apellidos like 'P%';

/*2.8*/
SELECT sum(presupuesto) from departamentos;

/*2.9*/
SELECT DEPARTAMENTO, count(*) as num_empleados 
from empleados group by departamento;

/*2.10*/
SELECT * from empleados e 
join departamentos d on e.departamento=d.CODIGO;

/*2.11*/
SELECT e.nombre, e.apellidos, d.nombre, d.PRESUPUESTO 
from empleados e 
join departamentos d on e.departamento=d.CODIGO;

/*2.12*/
SELECT e.nombre, e.apellidos
from empleados e 
join departamentos d on e.departamento=d.CODIGO
where d.PRESUPUESTO > 60000;

/*2.13*/
SELECT * from departamentos 
where presupuesto > (
	select avg(presupuesto) from departamentos
);

/*2.14*/
SELECT d.nombre from departamentos d
join empleados e on e.DEPARTAMENTO=d.CODIGO
group by d.nombre
having count(e.nombre) > 2;

/*2.15*/
INSERT into departamentos (codigo, nombre, presupuesto) 
values(11, 'Calidad', 40.000);
INSERT into empleados (dni, nombre, apellidos, departamento)
values (89267109, 'Esther', 'Vázquez', 11);

/*2.16*/
UPDATE departamentos set presupuesto=presupuesto*0.9;

/*2.17*/
UPDATE empleados set departamento=14 where departamento=77;

/*2.18*/
DELETE from empleados where departamento=14;

/*2.19*/
DELETE from empleados where departamento in
(select codigo from departamentos where PRESUPUESTO > 60000);

/*2.20*/
DELETE from empleados;