/*3.1*/
select * from almacenes;

/*3.2*/
select * from cajas where valor>150;

/*3.3*/
select distinct(contenido) from cajas;

/*3.4*/
select avg(valor) from cajas;

/*3.5*/
select almacen, avg(valor) as valor_medio from cajas 
group by almacen;

/*3.6*/
select almacen, avg(valor) as valor_medio from cajas 
group by almacen
having avg(valor)>150;

/*3.7*/
select c.NUMREFERENCIA, a.lugar from cajas c
join almacenes a on c.ALMACEN=a.CODIGO;

/*3.8*/
select almacen, count(*) as num_cajas from cajas
group by almacen;

/*3.9*/
select codigo from almacenes
where capacidad < (select count(*) from cajas 
where almacen=codigo);

/*3.10*/
select NUMREFERENCIA from cajas
where almacen in (select codigo from almacenes 
where lugar='Bilbao');

/*3.11*/
INSERT almacenes values (6, 'Barcelona', 3);

/*3.12*/
INSERT cajas values ('H5RT', 'Papel', 200, 2);

/*3.13*/
UPDATE cajas set valor=valor*0.85;

/*3.14*/
/*Se ha tenido que hacer con una JOIN 
porque a mysql daba error en formato subconsulta*/
UPDATE cajas JOIN (
    SELECT AVG(valor) as a FROM cajas
) AS _query set valor= valor*0.80 where valor > _query.a;

/*3.15*/
DELETE from cajas where valor < 100;

/*3.16*/
DELETE FROM cajas
WHERE almacen IN (
    SELECT alm.codigo
    FROM (
        SELECT a.codigo
        FROM almacenes a
        LEFT JOIN cajas c ON a.codigo = c.almacen
        GROUP BY a.codigo, a.capacidad
        HAVING COUNT(c.numreferencia) > a.capacidad
    ) AS alm
);