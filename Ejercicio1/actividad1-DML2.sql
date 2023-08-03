/*1.1*/
SELECT nombre from articulos;

/*1.2*/
SELECT nombre, precio from articulos;

/*1.3*/
SELECT nombre from articulos where precio <= 200;

/*1.4*/
SELECT nombre from articulos where precio between 60 and 200;

/*1.5*/
SELECT nombre, (precio*166.386) as pesetas from articulos;

/*1.6*/
SELECT avg(precio) as precio_medio  from articulos;

/*1.7*/
SELECT avg(precio) as precio_medio_Fab_2  from articulos where fabricante=2;

/*1.8*/
SELECT count(*)  from articulos where precio>=180;

/*1.9*/
SELECT nombre, precio  from articulos where precio>=180
order by precio desc, nombre asc;

/*1.10*/
SELECT * from articulos a
JOIN fabricantes f
	on a.fabricante = f.codigo;
    
/*1.11*/
SELECT a.nombre, a.precio, f.nombre from articulos a
JOIN fabricantes f
	on a.fabricante = f.codigo;
    
/*1.12*/
SELECT f.codigo, AVG(a.precio) as precio_medio from articulos a
JOIN fabricantes f
	on a.fabricante = f.codigo
group by f.codigo;

/*1.13*/
SELECT fabricante, AVG(precio) as precio_medio from articulos 
group by fabricante;

/*1.14*/
SELECT f.nombre as precio_medio from articulos a
JOIN fabricantes f
	on a.fabricante = f.codigo
group by f.nombre
having AVG(a.precio) >= 150;

/*1.15*/
SELECT nombre, precio from articulos 
where precio = (Select min(precio) from articulos);

/*1.16*/
SELECT a.nombre, a.precio, f.nombre from articulos a
JOIN fabricantes f
	on a.fabricante = f.codigo
where precio = (select max(precio) from articulos aa where aa.fabricante = f.codigo);

/*1.17*/
insert into articulos (codigo, nombre, precio, fabricante) values (11, 'altavoces', 70, 2);

/*1.18*/
UPDATE articulos set nombre='Impresora Laser' where codigo=8;

/*1.19*/
UPDATE articulos set precio=precio*0.9;

/*1.20*/
UPDATE articulos set precio=precio-10 where precio >= 120;
