--PARA LAS MÚLTIPLES PRUEBAS
DROP DATABASE jocelyngutierrez CASCADE;
CREATE DATABASE jocelyngutierrez;
USE jocelyngutierrez;

SHOW TABLES;
SELECT * FROM FACTURA;
--###############################

--PARA CREAR TABLA FACTURA
CREATE TABLE IF NOT EXISTS FACTURA (
    numfactura int,
    rutcliente string,
    rutvendedor string,
    fecha string,
    f_vencimiento string,
    neto int,
    iva int, 
    total int,
    codbanco float,
    codpago int,
    num_docto_pago string,
    estado string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/FACTURA_DATA_TABLE.csv' OVERWRITE INTO TABLE FACTURA; 

-- PARA CREAR TABLA FORMA DE PAGO
CREATE TABLE IF NOT EXISTS FORMA_PAGO(
    codpago int,
    descripcion string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/FORMA_PAGO_DATA_TABLE.csv' OVERWRITE INTO TABLE FORMA_PAGO; 

-- PARA CREAR LA TABLA DE BANCO
CREATE TABLE IF NOT EXISTS BANCO(
    codbanco int,
    descripcion string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/BANCO_DATA_TABLE.csv' OVERWRITE INTO TABLE BANCO; 

--PARA CREAR LA TABLA DE CLIENTE
CREATE TABLE IF NOT EXISTS CLIENTE(
    rutcliente string,
    nombre string, 
    direccion string,
    codcomuna float,
    telefono int,
    estado string,
    mail string,
    credito int,
    saldo int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/CLIENTE_DATA_TABLE.csv' OVERWRITE INTO TABLE CLIENTE;

-- PARA CREAR LA TABLA CORRESPONDIENTE A VENDEDOR
CREATE TABLE IF NOT EXISTS VENDEDOR(
    rutvendedor string,
    nombre string,
    direccion string,
    codcomuna int,
    telefono int, 
    mail string,
    sueldo_base int,
    comision float
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/VENDEDOR_DATA_TABLE.csv' OVERWRITE INTO TABLE VENDEDOR;

-- PARA CREAR LA TABLA CORRESPONDIENTE A PROMOCION
CREATE TABLE IF NOT EXISTS PROMOCION(
    cod_promocion int, 
    descri_prom string,
    fecha_desde string,
    fecha_hasta string,
    codproducto int,
    porc_dscto_prod int,
    codproducto_rel int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/PROMOCION_DATA_TABLE.csv' OVERWRITE INTO TABLE PROMOCION;

-- PARA CREAR LA TABLA CORRESPONDIENTE A PRODUCTO
CREATE TABLE IF NOT EXISTS PRODUCTO(
    codproducto int,
    descripcion string,
    codunidad string,
    codcategoria string,
    vunitario int, 
    valorcomprapeso float,
    valorcompradolar float,
    totalstock float,
    stkseguridad float,
    procedencia string,
    codpais string,
    codproducto_rel int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/PRODUCTO_DATA_TABLE.csv' OVERWRITE INTO TABLE PRODUCTO;
-- PARA CREAR LA TABLA CORRESPONDIENTE A DETALLE_FACTURA
CREATE TABLE IF NOT EXISTS DETALLE_FACTURA(
    numfactura int,
    codproducto int,
    vunitario int, 
    cod_promocion float,
    descri_nom string,
    descuento int,
    cantidad int, 
    totallinea int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/DETALLE_FACTURA_DATA_TABLE.csv' OVERWRITE INTO TABLE  DETALLE_FACTURA;

-- PARA CREAR LA TABLA CORRESPONDIENTE A PAIS
CREATE TABLE IF NOT EXISTS PAIS(
    codpais int,
    nompais string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/PAIS_DATA_TABLE.csv' OVERWRITE INTO TABLE PAIS;
-- PARA CREAR LA TABLA CORRESPONDIENTE A UNIDAD_MEDIDA
CREATE TABLE IF NOT EXISTS UNIDAD_MEDIDA(
    codunidad string,
    descripcion string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/UNIDAD_MEDIDA_DATA_TABLE.csv' OVERWRITE INTO TABLE UNIDAD_MEDIDA;

-- PARA CREAR LA TABLA CORRESPONDIENTE A COMUNA 
CREATE TABLE IF NOT EXISTS COMUNA(
    codcomuna int, 
    descripcion string, 
    codciudad int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/COMUNA_DATA_TABLE.csv' OVERWRITE INTO TABLE COMUNA;
-- PARA CREAR LA TABLA CORRESPONDIENTE A CIUDAD
CREATE TABLE IF NOT EXISTS CIUDAD(
    codciudad int,
    descripcion string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/CIUDAD_DATA_TABLE.csv' OVERWRITE INTO TABLE CIUDAD;
-- PARA CREAR LA TABLA CORRESPONDIENTE A BOLETA
CREATE TABLE IF NOT EXISTS BOLETA(
    numboleta int,
    rutcliente string,
    rutvendedor string,
    fecha string,
    total int,
    codpago int, 
    codbanco float,
    num_docto_pago string,
    estado string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/BOLETA_DATA_TABLE.csv' OVERWRITE INTO TABLE BOLETA;
-- PARA CREAR LA TABLA CORRESPONDIENTE A DETALLE_BOLETA
CREATE TABLE IF NOT EXISTS DETALLE_BOLETA(
    numboleta int, 
    codproducto int, 
    vunitario int, 
    cod_promocion float,
    descri_prom string,
    descuento int,
    cantidad int, 
    totallinea int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ("separatorChar" = ",", "escapeChar" = "\n") 
STORED AS TEXTFILE
tblproperties("skip.header.line.count"="1");
LOAD DATA INPATH '/user/practica/Jocelyn_Gutierrez/data/DETALLE_BOLETA_DATA_TABLE.csv' OVERWRITE INTO TABLE DETALLE_BOLETA;




--CONSULTAS
--el vendedor que tiene más ventas en facturas
SELECT f.rutvendedor AS rut,
       v.nombre as nombre,
       count(f.rutvendedor) AS cantidad_ventas,
       sum(f.total) as total
FROM factura f
JOIN vendedor v ON v.rutvendedor= f.rutvendedor
GROUP BY f.rutvendedor, v.nombre
HAVING sum(f.total) IN (SELECT MAX(suma)
                        FROM (SELECT SUM(total) as suma
                                FROM factura
                                GROUP BY rutvendedor) t);

--El vendedor que tiene más ventas en boletas
SELECT b.rutvendedor AS rut,
       v.nombre as nombre,
       count(b.rutvendedor) AS cantidad_ventas,
       sum(b.total) as total
FROM boleta b
JOIN vendedor v ON v.rutvendedor = b.rutvendedor
GROUP BY b.rutvendedor, v.nombre
HAVING sum(f.total) IN (SELECT MAX(suma)
                        FROM (SELECT SUM(total) as suma
                                FROM boleta
                                GROUP BY rutvendedor) t);



-- detalle de ventas en boletas y facturas
--JGL

--JGL
SELECT f.numfactura AS NUMDOCUMENTO,
       v.nombre AS NOMBRE,
       t.cuenta,
       f.total AS TOTAL
FROM FACTURA f
JOIN VENDEDOR v ON v.rutvendedor = f.rutvendedor
JOIN (
  SELECT COUNT(*) as cuenta,
         rutvendedor
  FROM factura
  GROUP BY rutvendedor
  ) t ON t.rutvendedor = f.rutvendedor
GROUP BY f.numfactura, v.nombre, f.total, t.cuenta
UNION ALL
SELECT b.numboleta AS NUMDOCUMENTO,
       v.nombre as NOMBRE,
       t.cuenta,
       b.total AS TOTAL
FROM BOLETA b
JOIN VENDEDOR v ON v.rutvendedor = b.rutvendedor
JOIN (
  SELECT COUNT(*) as cuenta,
         rutvendedor
  FROM boleta
  GROUP BY rutvendedor
  ) t ON t.rutvendedor = b.rutvendedor
GROUP BY b.numboleta, v.nombre, b.total, t.cuenta


--Cliente con más compras 

SELECT c.rutcliente as RUT_CLIENTE,
       c.nombre as NOMBRE,
       t.cuenta as Cantidad_Compras,
       SUM(f.total + b.total) as Total_Comprado
FROM cliente c
JOIN factura f ON (c.rutcliente = f.rutcliente)
JOIN boleta b ON (c.rutcliente = b.rutcliente)
JOIN
(SELECT c.rutcliente,
       SUM(b.cb + f.cf) AS cuenta
FROM cliente c
JOIN(SELECT rutcliente,
       count(*) as cb
FROM boleta 
GROUP BY rutcliente) b ON b.rutcliente = c.rutcliente
JOIN(SELECT rutcliente,
       count(*) as cf
FROM factura 
GROUP BY rutcliente) f ON f.rutcliente = c.rutcliente
GROUP BY c.rutcliente) t ON t.rutcliente = c.rutcliente

GROUP BY c.rutcliente, c.nombre, t.cuenta
ORDER BY Total_Comprado desc
LIMIT 3;