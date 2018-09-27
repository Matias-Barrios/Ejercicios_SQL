drop table if exists Autores;
drop table if exists Libros;
drop table if exists Ejemplares;
drop table if exists Usuarios;
drop table if exists relacion_Usuarios_Ejemplares;
drop table if exists relacion_Libros_Autores;

create table Autores (
	codigo serial primary key constraint autores_clave_primaria_valida,
	nombre varchar(200) not null constraint autores_nombre_valido
);

create table Libros (
	codigo serial primary key constraint libros_clave_primaria_valida,
	titulo varchar(100) not null constraint libros_titulo_valido,
	isbn varchar(50) not null constraint libros_isbn_valido,
	editorial varchar(50) not null constraint libros_editorial_valida,
	paginas int check( paginas > 0 ) constraint libros_paginas_valido
);

create table Ejemplares (
	codigo serial primary key constraint ejemplares_clave_primaria_valida,
	localizacion char not null constraint ejemplares_localizacion_valida,
	foranea_codigo_libro int references Libros( codigo ) constraint ejemplares_clave_foranea_codigo_libro_valida 
);

create table Usuarios (
	codigo serial primary key constraint usuarios_clave_primaria_valida,
	nombre varchar(50) not null constraint usuarios_nombre_valido,
	telefono int check ( telefono > 9999999) constraint usuarios_telefono_valido,
	direccion varchar(100) not null constraint usuarios_direccion_valida
);

create table relacion_Usuarios_Ejemplares (
	codigo serial primary key constraint relacion_Usuarios_Ejemplares_clave_primaria_valida,
	foranea_codigo_usuario int references Usuarios ( codigo ) constraint relacion_Usuarios_Ejemplares_foranea_codigo_usuario_valido,
	foranea_codigo_ejemplar int references Ejemplares ( codigo ) constraint relacion_Usuarios_Ejemplares_foranea_codigo_ejemplar_valido,
	fecha_prestamo date not null constraint relacion_Usuarios_Ejemplares_fecha_prestamo_valida,
	fecha_devolucion date not null constraint relacion_Usuarios_Ejemplares_fecha_devolucion_valida	
);

create table relacion_Libros_Autores (
	foranea_codigo_autor int references Autores ( codigo ) constraint  relacion_Libros_Autores_foranea_codigo_autor_valido,
	foranea_codigo_libro int references Libros ( codigo ) constraint relacion_Libros_Autores_foranea_codigo_libro,
	primary key (foranea_codigo_autor,foranea_codigo_libro) constraint relacion_Libros_Autores_clave_primaria_valida
);



-- insert into Autores

insert into Autores (nombre) values ("Jodi Picoult");
insert into Autores (nombre) values ("Richard Dawkins");
insert into Autores (nombre) values ("Sam Harris");
insert into Autores (nombre) values ("Oriana Fallaci");
insert into Autores (nombre) values ("Truman Capote");
insert into Autores (nombre) values ("Lisa Lutz");
insert into Autores (nombre) values ("David Hayward");
insert into Autores (nombre) values ("William Shakespeare");


-- insert into Libros

insert into Libros (titulo,isbn,editorial,paginas) values ("Por la vida de mi hermana",9781416576402,"Atria",432);
insert into Libros (titulo,isbn,editorial,paginas) values ("El espejismo de Dios",9788467024784,"Bantam Press",560);
insert into Libros (titulo,isbn,editorial,paginas) values ("El paisaje moral",9780593064863 ,"Transworld Publishers Ltd",522);
insert into Libros (titulo,isbn,editorial,paginas) values ("Nada y asi sea",9788427908185 ,"Noguer",344);
insert into Libros (titulo,isbn,editorial,paginas) values ("A sangre fria",9788433971234 ,"Noguer",440);
insert into Libros (titulo,isbn,editorial,paginas) values ("Heads You Lose",9780425246849 ,"Berkley",300);
insert into Libros (titulo,isbn,editorial,paginas) values ("Obras Selectas",9788497941426 ,"Edimat",600);

-- insert into Ejemplares
-- Localizacion es un char que represneta una seccion de la libreria. Hay libros que estan en ambas secciones, 
-- otros estan solo en una seccion

insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",1);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",1);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",1);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",2);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",3);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",3);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",3);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",4);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",4);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",4);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",5);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",5);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",5);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",5);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",6);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",7);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",7);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("A",7);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",1);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",1);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",2);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",2);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",3);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",4);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",5);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",2);
insert into Ejemplares (localizacion,foranea_codigo_libro) values ("B",6);


-- insert into Usuarios

INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Matias Barrios",99322100,"Calle secreta 1234");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Peprino Pomoro",99443567,"Calle secreta 4321");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Pepe Grillo",99453321,"Quintana 2342");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Bombita Rodriguez",99000432,"Blvd. Artigas 4532");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Jaun Carlos Pelotudo",99554322,"Eduardo Acevedo 4560");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Alfredo Casero",99654435,"Solo trolls 3421");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Indio Solari",99345434,"Gral Flores 2312");
INSERT INTO Usuarios (nombre,telefono,direccion) VALUES("Maria Marta Sanchez Serralima",99110949,"8 de octubre 2390");

-- insert into relacion_Usuarios_Ejemplares

INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(1,4,26/09/2018,30/09/2018);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(2,2,10/08/2018,17/08/2018);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(3,3,07/08/2018,14/08/2018);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(4,1,11/06/2018,18/06/2018);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(5,2,19/05/2018,26/05/2018);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(6,7,24/02/2017,03/03/2017);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(7,5,13/03/2017,20/03/2017);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(8,4,11/02/2017,18/02/2017);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(1,2,11/05/2016,18/05/2016);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(1,5,20/11/2014,27/11/2014);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(8,4,22/04/2016,29/04/2016);
INSERT INTO relacion_Usuarios_Ejemplares (foranea_codigo_usuario,foranea_codigo_ejemplar,fecha_prestamo,fecha_devolucion) VALUES(2,3,12/02/2013,19/02/2013);


-- insert into relacion_Usuarios_Ejemplares

INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(1,1);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(2,2);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(3,3);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(4,4);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(5,5);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(6,6);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(7,6);
INSERT INTO relacion_Libros_Autores (foranea_codigo_autor,foranea_codigo_libro) VALUES(8,7);

