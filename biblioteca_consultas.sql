-- Usuarios ( nombre ) que no han toamdo prestado un libro

select Usuarios.nombre 
from Usuarios 
where not exists ( select * from  relacion_Usuarios_Ejemplares where relacion_Usuarios_Ejemplares.foranea_codigo_usuario = Usuarios.codigo);

-- Cantidad de libros que ha tomado prestado cada usuario ( nombre ) ordenados por cantidad de mayor a menor

select Usuarios.nombre,count(*) as Cantidad
from Usuarios
join relacion_Usuarios_Ejemplares on relacion_Usuarios_Ejemplares.foranea_codigo_usuario = Usuarios.codigo
group by Usuarios.nombre
order by Cantidad DESC;

-- Libro mas prestado ( nombre ) y cantidad de veces prestado

select first 1 titulo,count(*) as Cantidad
from 
(
select *
	from relacion_Usuarios_Ejemplares
	join Ejemplares on relacion_Usuarios_Ejemplares.foranea_codigo_ejemplar = Ejemplares.codigo
	join Libros on Libros.codigo = Ejemplares.foranea_codigo_libro ) as tmp
group by titulo
order by Cantidad desc
	

-- Libros con una cantidad de paginas mayor al promedio

select titulo
from Libros 
where paginas > ( select avg(paginas) from Libros)

-- Libro ( Titulo ) y Usuario (nombre) de Prestamos realizados en Agosto de 2018

select *
	from relacion_Usuarios_Ejemplares 
	join Ejemplares on foranea_codigo_ejemplar = Ejemplares.codigo
	join Libros on Libros.codigo = Ejemplares.foranea_codigo_libro
where fecha_prestamo < TO_DATE('01-01-2013','%m-%d-%Y');
