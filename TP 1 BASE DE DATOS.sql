CREATE table documentos
(cod_documentos INT PRIMARY KEY,
descripcion VARCHAR (40));

-- DELETE FROM documentos
INSERT INTO documentos VALUE (01,"lavarropas");
INSERT INTO documentos VALUE (02,"microondas");
INSERT INTO documentos VALUE (03,"secarropas");
INSERT INTO documentos VALUE (04,"tostadora");
INSERT INTO documentos VALUE (05,"cafetera");
INSERT INTO documentos VALUE (06,"horno electrico");
INSERT INTO documentos VALUE (07,"aire acondicionado");
INSERT INTO documentos VALUE (08,"licuadora");
INSERT INTO documentos VALUE (09,"smart");
INSERT INTO documentos VALUE (010,"proyector");

CREATE table oficinas 
(cod_oficinas INT PRIMARY KEY,
codigo_director INT,
descripcion VARCHAR (40));

-- para borrar campos DELETE FROM oficinas

INSERT INTO oficinas VALUE (1, 101,"Sucursal Centro");
INSERT INTO oficinas VALUE (2, 102,"Sucursal Norte");
INSERT INTO oficinas VALUE (3, 103,"Sucursal Sur");
INSERT INTO oficinas VALUE (4, 104,"Sucursal Oeste");
INSERT INTO oficinas VALUE (5, 105,"Depósito Central");
INSERT INTO oficinas VALUE (6, 106,"Sucursal Shopping Mall");
INSERT INTO oficinas VALUE (7, 107,"Sucursal Aeropuerto");
INSERT INTO oficinas VALUE (8, 108,"Sucursal Barrio Industrial");
INSERT INTO oficinas VALUE (9, 109,"Sucursal Costanera");
INSERT INTO oficinas VALUE (10, 110,"Depósito Secundario");
 
CREATE TABLE empleados 
(cod_empleados INT PRIMARY KEY,
apellido VARCHAR (20),
nombre VARCHAR (20),
fecha_nacimiento DATE, 
num_doc VARCHAR (20),
cod_jefe INT, 
cod_oficinas INT,
cod_documentos INT, 
FOREIGN KEY (cod_jefe) REFERENCES Empleados(cod_empleados), 
FOREIGN KEY (cod_oficinas)REFERENCES oficinas (cod_oficinas),
FOREIGN KEY (cod_documentos) REFERENCES documentos (cod_documentos));

INSERT INTO Empleados VALUE (101, "Gómez", "Laura",	  "1985-04-12", 23456789, NULL,	1,	1);
INSERT INTO Empleados VALUE (102, "Rodríguez","Martín", "1980-09-23", 22119888,	101,	2,	1);
INSERT INTO Empleados VALUE (103, "Fernández","Carla",  "1990-11-30", 31245678,	101,	3,	1);
INSERT INTO Empleados VALUE (104, "Méndez","Julián",    "1987-02-17", 27984561,	101,	4,	1);
INSERT INTO Empleados VALUE (105, "Vargas",	"Sofía",   "1982-08-10", 30895461,	NULL,	5,	2);
INSERT INTO Empleados VALUE (106, "Herrera", "Diego",   "1993-01-05", 29876543,	105,	6,	1);
INSERT INTO Empleados VALUE (107, "Díaz", "Valeria",    "1988-06-14", 28643211,	105,	7,	1);
INSERT INTO Empleados VALUE (108, "Suárez",	"Ricardo", "1991-12-22", 29004567, 105,	8,	1);
INSERT INTO Empleados VALUE (109, "Ortega",	"Natalia", "1995-03-09", 31099876, 105,	9,	1);
INSERT INTO Empleados VALUE (110, "Cabrera", "Emiliano","1983-07-28", 30123456, 105,	10,2);


-- DROP TABLE Detalle_pedidos;
-- DROP TABLE Pedidos;
-- DROP TABLE contratos;
-- DROP TABLE Empleados;


CREATE TABLE contratos
(cod_empleados INT PRIMARY KEY,
fecha_contrato DATE,
cuotas VARCHAR (60),
ventas VARCHAR (1000),
FOREIGN KEY (cod_empleados) REFERENCES Empleados (cod_empleados));

-- DELETE FROM contratos 
INSERT INTO contratos VALUE (101,"2015-03-01",11,264);
INSERT INTO contratos VALUE (102,"2016-07-15",25,345);
INSERT INTO contratos VALUE (103,"2018-01-10",34,578);
INSERT INTO contratos VALUE (104,"2019-05-20",4,125);
INSERT INTO contratos VALUE (105,"2014-09-01",0,0);
INSERT INTO contratos VALUE (106,"2020-11-25",21,545);
INSERT INTO contratos VALUE (107,"2017-06-05",9,578);
INSERT INTO contratos VALUE (108,"2021-03-18",34,571);
INSERT INTO contratos VALUE (109,"2022-08-01",45,246);
INSERT INTO contratos VALUE (110,"2016-12-12",0, 0);


CREATE TABLE Fabricantes
(Cod_fabricante INT PRIMARY KEY,
razon_social VARCHAR (100));

INSERT INTO Fabricantes VALUE (1,	"LG Electronics S.A.");
INSERT INTO Fabricantes VALUE (2,	"Samsung Corp.");
INSERT INTO Fabricantes VALUE (3,	"Philips Argentina S.A.");
INSERT INTO Fabricantes VALUE (4,	"Midea Group Co. Ltd.");
INSERT INTO Fabricantes VALUE (5,	"Sony Electronics S.A.");
INSERT INTO Fabricantes VALUE (6,	"Oster Latinoamérica S.A.");
INSERT INTO Fabricantes VALUE (7,	"Atma Electrodomésticos S.R.L.");
INSERT INTO Fabricantes VALUE (8,	"Electrolux S.A.");
INSERT INTO Fabricantes VALUE (9,	"De Longhi GROUP");
INSERT INTO Fabricantes VALUE (10,  "Whirlpool Corporation");


CREATE TABLE Lista 
(cod_lista INT PRIMARY KEY, 
descripcion VARCHAR (100),
ganancias VARCHAR  (50));

INSERT INTO Lista VALUE (1,"Lista Minorista",	30);
INSERT INTO Lista VALUE (2,"Lista Mayorista",	20);
INSERT INTO Lista VALUE (3,"Lista Promocional", 10);
INSERT INTO Lista VALUE (4,"Lista Premium",	   40);
INSERT INTO Lista VALUE (5,"Lista Liquidación", 5);
 
 CREATE TABLE Productos 
 (cod_productos INT PRIMARY KEY,
 descripcion VARCHAR (100),
 precio INT, 
 cantidad_stock INT, 
 punto_reposicion INT,
 cod_fabricante INT, 
 FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante));
 
INSERT INTO Productos VALUE (1,"lavarropas",35000,12,3,1);
INSERT INTO Productos VALUE (2,"microondas",1800,8,4,2);
INSERT INTO Productos VALUE (3,"secarropa",9500,20,5,3);
INSERT INTO Productos VALUE (4,"tostadora",45000,6,2,4);
INSERT INTO Productos VALUE (5,"cafetera",52000,10,3,5);
INSERT INTO Productos VALUE (6,"horno electrico",4500,25,7,3);
INSERT INTO Productos VALUE (7,"aire acondicionado",3000,18,5,6);
INSERT INTO Productos VALUE (8,"licuadora",12000,9,3,7);
INSERT INTO Productos VALUE (9,"smart",1100,11,4,8);
INSERT INTO Productos VALUE (10,"proyector",1500,14,4,9);
 
 
 CREATE TABLE Precios
 (cod_productos INT,
  cod_lista INT,
  precio INT,
  PRIMARY KEY (cod_productos, cod_lista),
  FOREIGN KEY (cod_productos) REFERENCES productos (cod_productos),
  FOREIGN KEY (cod_lista) REFERENCES lista (cod_lista));

INSERT INTO precios VALUE (1,1,45500);
INSERT INTO precios VALUE (1,5,45500);
INSERT INTO precios VALUE (2,2,4200);
INSERT INTO precios VALUE (2,4,4200);
INSERT INTO precios VALUE (3,3,38500);
INSERT INTO precios VALUE (4,4,600);
INSERT INTO precios VALUE (5,5,33000);

  CREATE TABLE clientes 
  (cod_cliente INT PRIMARY KEY,
  cod_lista INT,
  razon_social VARCHAR(100),
 FOREIGN KEY (cod_lista) REFERENCES lista (cod_lista));


INSERT INTO clientes VALUE (1,1,	"Electro Hogar S.A.");
INSERT INTO clientes VALUE (2,2,	"Mayoristas del Sur SRL");
INSERT INTO clientes VALUE (3,3,	"Casa Central Equipamiento");
INSERT INTO clientes VALUE (4,1,	"Hogar y Más SRL");
INSERT INTO clientes VALUE (5,2,	"Distribuciones Nova S.A.");
INSERT INTO clientes VALUE (6,4, "LG Electronics S.A.");
INSERT INTO clientes VALUE (7,3, "Electrolux S.A.");


 CREATE TABLE Pedidos
  (cod_pedidos INT PRIMARY KEY,
  fecha_pedidos DATE,
  cod_empleados INT,
  cod_cliente INT,
  FOREIGN KEY (cod_empleados) REFERENCES empleados(cod_empleados),
  FOREIGN KEY (cod_cliente) REFERENCES clientes(cod_cliente));
  
 -- DELETE FROM pedidos 
INSERT INTO pedidos VALUE (1,"2024-11-10",103,1);
INSERT INTO pedidos VALUE (2,"2024-12-02",106,2);
INSERT INTO pedidos VALUE (3,"2025-01-15",107,3);
INSERT INTO pedidos VALUE (4,"2025-02-05",102,4);
INSERT INTO pedidos VALUE (5,"2025-03-01",108,5);
INSERT INTO pedidos VALUE (6,"2025-03-15",103,2);
INSERT INTO pedidos VALUE (7,"2025-03-18",106,1);
INSERT INTO pedidos VALUE (8,"2025-04-02",104,4);
INSERT INTO pedidos VALUE (9,"2025-04-12",107,3);
INSERT INTO pedidos VALUE (10,"2025-04-25",108,5);

  CREATE TABLE Detalle_pedidos
   (cod_pedidos INT,
   numero_linea INT,
   cod_producto INT,
   cantidad INT,
   PRIMARY KEY (cod_pedidos,numero_linea),
   FOREIGN KEY (cod_pedidos) REFERENCES Pedidos(cod_pedidos),
   FOREIGN KEY (cod_producto) REFERENCES productos(cod_productos));
 
 
INSERT INTO detalle_pedidos VALUE (1,2,1,6);
INSERT INTO detalle_pedidos VALUE (2,4,3,1);
INSERT INTO detalle_pedidos VALUE (3,5,2,10);
INSERT INTO detalle_pedidos VALUE (4,1,4,2);
INSERT INTO detalle_pedidos VALUE (5,6,5,3);
INSERT INTO detalle_pedidos VALUE (6,10,6,3);
INSERT INTO detalle_pedidos VALUE (7,9,1,5);
INSERT INTO detalle_pedidos VALUE (8,3,7,2);
INSERT INTO detalle_pedidos VALUE (9,7,10,1);
INSERT INTO detalle_pedidos VALUE (10,8,9,7);ss
 
 
 
-- consultas siemples 

SELECT descripcion
FROM oficinas;


SELECT descripcion AS producto,
  precio AS precio_costo,
ROUND(precio * 1.21, 2) AS precio_con_iva
FROM Productos;
 
 
SELECT *
FROM Empleados
WHERE cod_jefe IS NOT NULL;


SELECT apellido, nombre
FROM Empleados
WHERE nombre = 'carla'
ORDER BY apellido;


SELECT cod_cliente, razon_social
FROM Clientes
WHERE razon_social LIKE 'L%'
ORDER BY cod_cliente;



SELECT *
FROM Pedidos
WHERE MONTH(fecha_pedido) = 3
ORDER BY fecha_pedido;


SELECT *
FROM Oficinas
WHERE codigo_director;


SELECT *
FROM Productos
ORDER BY precio ASC
LIMIT 4;


-- consulta tabla multibles

SELECT p.descripcion, f.razon_social, p.cantidad_stock
FROM Productos p, Fabricantes f
WHERE p.cod_fabricante = f.cod_fabricante
ORDER BY f.razon_social, p.descripcion;


SELECT p.cod_pedidos,p.fecha_pedidos,e.apellido AS empleado_apellido,
c.razon_social AS cliente_razon_social
FROM Pedidos p, Empleados e, Clientes c
WHERE p.cod_empleados = e.cod_empleados
  AND p.cod_cliente = c.cod_cliente;


SELECT e.apellido, dc.cuotas,o.descripcion AS oficina
FROM Empleados e, contratos dc, Oficinas o
WHERE e.cod_empleados = dc.cod_empleados
  AND e.cod_oficinas = o.cod_oficinas
ORDER BY dc.cuotas DESC;


SELECT razon_social AS RazonSocialCliente
FROM Clientes cl, Pedidos pe
WHERE cl.cod_cliente = pe.cod_cliente AND MONTH(pe.fecha_pedidos) = 4;

-- 5) Listar sin repetir los productos que fueron pedidos en Marzo.
SELECT pr.descripcion AS ProductoPedido
FROM Productos pr,Detalle_pedidos dp,Pedidos pe
WHERE pr.cod_producto = dp.cod_producto AND dp.cod_pedidos = pe.cod_pedidos AND MONTH(pe.fecha_pedidos) = 3;


SELECT cl.razon_social AS RazonSocialCliente
FROM Clientes cl, Lista li
WHERE cl.cod_lista = li.cod_lista AND  li.descripcion LIKE '%Mayorista%'
ORDER BY RazonSocialCliente;

-- 8) Obtener una lista sin repetir que indique qué productos compró cada cliente, ordenada por razón social y descripción.
SELECT razon_social AS RazonSocialCliente, descripcion AS ProductoComprado
FROM Clientes cl, Pedidos pe,  Detalle_pedidos dp,Productos pr
WHERE cl.cod_cliente = pe.cod_cliente AND pe.cod_pedidos = dp.cod_pedidos AND dp.cod_producto = pr.cod_producto
ORDER BY RazonSocialCliente, ProductoComprado;


SELECT p.descripcion AS producto,(p.punto_reposicion - p.cantidad_stock) AS cantidad_a_comprar,
  f.razon_social AS fabricante
FROM Productos p, Fabricantes f
WHERE p.cod_fabricante = f.cod_fabricante
  AND p.cantidad_stock < p.punto_reposicion
ORDER BY f.razon_social, p.descripcion;


SELECT em.apellido AS ApellidoEmpleado, em.nombre AS NombreEmpleado, cuotas AS CuotaAsignada
FROM Empleados em, contratos dc
WHERE em.cod_empleados = dc.cod_empleados AND (cuotas < 50000 OR cuotas > 100000);

