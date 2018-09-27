DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Proveedores;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Relacion_Productos_Clientes;

CREATE TABLE Proveedores (
        codigo SERIAL PRIMARY KEY NOT NULL CONSTRAINT codigo_proveedor_valido,
        nombre varchar(50) NOT NULL CONSTRAINT nombre_proveedor_valido,
        apellido varchar(50) NOT NULL CONSTRAINT apellido_proveedor_valido,
        telefono INT NOT NULL CHECK ( telefono > 99000000 AND telefono < 99999999) CONSTRAINT proveedores_telefono_valido
);

CREATE TABLE Productos (
        codigo SERIAL PRIMARY KEY NOT NULL CONSTRAINT Codigo_valido,
        descripcion varchar(200) NOT NULL CONSTRAINT Descripcionvalida,
        stock INT NOT NULL CONSTRAINT stock_valido,
        precio INT NOT NULL Check( precio > 0 ) CONSTRAINT precio_valido,
        foranea_codigo_proveedor INT REFERENCES Proveedores ( codigo ) CONSTRAINT cod_pro_valido
);

CREATE TABLE Clientes (
        codigo SERIAL PRIMARY KEY NOT NULL CONSTRAINT codigo_cliente_valido,
        nombre varchar(50) NOT NULL CONSTRAINT nombre_cliente_valido,
        apellido varchar(50) NOT NULL CONSTRAINT apellido_cliente_valido,
        telefono INT CHECK ( telefono > 99000000 and telefono < 99999999)
);

CREATE TABLE Relacion_Productos_Clientes (
        codigo SERIAL PRIMARY KEY CONSTRAINT relacion_productos_cliente_clave_valida,
        foranea_codigo_producto INT REFERENCES Productos (codigo) CONSTRAINT foranea_codigo_producto,
        foranea_codigo_cliente INT REFERENCES Clientes (codigo) CONSTRAINT foranea_codigo_cliente
);


-- INSERT INTO Proveedores

INSERT INTO Proveedores (nombre,apellido,telefono)
VALUES("Juan","Perez",99336456);

INSERT INTO Proveedores (nombre,apellido,telefono)
VALUES("Peperino","Pomoro",99122345);

INSERT INTO Proveedores (nombre,apellido,telefono)
VALUES("Bombita","Rodriguez",99336456);

INSERT INTO Proveedores (nombre,apellido,telefono)
VALUES("Artaud","Garcia",99388809);

INSERT INTO Proveedores (nombre,apellido,telefono)
VALUES("Peluca","Martinez",99100299);

-- INSERT INTO Clientes

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Peluca","Martinez",99322100);

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Stevie","Wonder",99322432);

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Pato","McPato",99221444);

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Alice","Wonderland",99877432);

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Salsi","Puedes",99123299);

INSERT INTO Clientes (nombre,apellido,telefono)
VALUES("Peter","Capusoto",99777543);


-- INSERT INTO Productos

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Muñeca Barbie",10,99,1);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Spiderman Chico",32,120,2);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Spiderman Grande",5,240,2);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Tambor",22,250,3);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Piano",14,450,3);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Maraca",42,55,3);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Auto a bateria",4,500,4);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Helicoptero RC",7,860,4);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Set Dinosaurios",52,150,5);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Set Animales Selva",42,150,5);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Set Avengers",72,400,5);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Dinosaurio Goma",22,100,5);

INSERT INTO Productos(descripcion,stock,precio,foranea_codigo_proveedor)
VALUES ("Jirafa Goma",43,100,5);

-- INSERT INTO Relacion_Productos_Clientes

INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (2,5);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (1,3);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (1,4);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (5,5);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (3,4);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (7,1);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (7,3);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (9,1);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (2,3);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (1,3);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (8,4);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (6,4);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (10,3);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (1,1);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (2,1);
INSERT INTO Relacion_Productos_Clientes (foranea_codigo_producto,foranea_codigo_cliente)
VALUES (3,4);


