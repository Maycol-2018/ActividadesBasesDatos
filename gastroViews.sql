-- Vista para consumo de Clientes
CREATE VIEW vista_consumo_clientes AS
SELECT 
    c.id_cliente,
    c.Nombre AS nombre_cliente,
    c.Apellido AS apellido_cliente,
    p.Nombre AS platillo,
    p.Importe AS importe_platillo,
    b.Nombre AS bebida,
    b.Importe AS importe_bebida,
    f.fecha_factura,
    (p.Importe + b.Importe) AS total_consumo
FROM 
    Cliente c
JOIN 
    Factura f ON c.id_cliente = f.id_cliente
JOIN 
    Platillo p ON f.id_platillo = p.id_platillo
JOIN 
    Bebida b ON f.id_bebida = b.id_bebida
ORDER BY 
    c.Apellido, c.Nombre, f.fecha_factura;

-- Vista de meseros con facturas atendidas, fechas y mesas

CREATE VIEW vista_meseros_facturas AS
SELECT 
    m.id_mesero,
    m.Nombre AS nombre_mesero,
    m.Apellido1 AS apellido_mesero,
    f.id_factura AS numero_factura,
    f.fecha_factura,
    me.id_mesa AS numero_mesa,
    me.Ubicacion AS ubicacion_mesa
FROM 
    Mesero m
JOIN 
    Factura f ON m.id_mesero = f.id_mesero
JOIN 
    Mesa me ON f.id_mesa = me.id_mesa
ORDER BY 
    m.Apellido1, m.Nombre, f.fecha_factura;

-- Vista del valor total de compra por cliente

CREATE VIEW vista_total_compras_clientes AS
SELECT 
    c.id_cliente,
    c.Nombre AS nombre_cliente,
    c.Apellido AS apellido_cliente,
    SUM(p.Importe + b.Importe) AS total_compras,
    COUNT(f.id_factura) AS cantidad_facturas
FROM 
    Cliente c
JOIN 
    Factura f ON c.id_cliente = f.id_cliente
JOIN 
    Platillo p ON f.id_platillo = p.id_platillo
JOIN 
    Bebida b ON f.id_bebida = b.id_bebida
GROUP BY 
    c.id_cliente, c.Nombre, c.Apellido
ORDER BY 
    total_compras DESC;

-- Vista para la consulta 6 (Total consumo de Manuel Pedroza Gonzalez)

CREATE VIEW vista_total_manuel_pedroza AS
SELECT 
    c.Nombre, 
    c.Apellido, 
    SUM(p.Importe + b.Importe) AS total_consumo
FROM 
    Cliente c
JOIN 
    Factura f ON c.id_cliente = f.id_cliente
JOIN 
    Platillo p ON f.id_platillo = p.id_platillo
JOIN 
    Bebida b ON f.id_bebida = b.id_bebida
WHERE 
    c.Nombre = 'Manuel' AND c.Apellido = 'Pedroza'
GROUP BY 
    c.id_cliente, c.Nombre, c.Apellido;
	
-- Vista para la consulta 7 (Mesas utilizadas)

CREATE VIEW vista_mesas_utilizadas AS
SELECT DISTINCT 
    m.id_mesa, 
    m.Ubicacion, 
    m.num_comensales
FROM 
    Mesa m
JOIN 
    Factura f ON m.id_mesa = f.id_mesa
ORDER BY 
    m.id_mesa;

