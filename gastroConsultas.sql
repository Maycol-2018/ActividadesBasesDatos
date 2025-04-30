-- 1. Obtener el nombre y apellido de los clientes que hayan consumido un platillo específico

SELECT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Nombre = 'Trucha frita';

-- 2. Obtener el nombre y apellido de los clientes que hayan consumido arroz a la marinera

SELECT c.Nombre, c.Apellido
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Nombre = 'Arroz a la marinera';

-- 3. Listar el nombre del mesero y la fecha en la que atendió una mesa 10 que se 
-- encuentra ubicada en el segundo piso del restaurante

SELECT m.Nombre, m.Apellido1, f.fecha_factura
FROM Mesero m
JOIN Factura f ON m.id_mesero = f.id_mesero
JOIN Mesa me ON f.id_mesa = me.id_mesa
WHERE me.id_mesa = 10 AND me.Ubicacion = 'Segundo piso';

-- 4. Mostrar el nombre de los clientes junto con los nombres de las bebidas que 
-- consumieron en sus facturas

SELECT c.Nombre AS nombre_cliente, c.Apellido AS apellido_cliente, b.Nombre AS bebida
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Bebida b ON f.id_bebida = b.id_bebida;

-- 5. Consultar todas las facturas que incluyan platillos con un importe mayor a 
-- $30000, incluyendo el nombre del cliente y del platillo

SELECT f.id_factura, c.Nombre AS nombre_cliente, p.Nombre AS platillo, p.Importe
FROM Factura f
JOIN Cliente c ON f.id_cliente = c.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
WHERE p.Importe > 30000;

-- 6. Listar el total de consumo (importe de platillos y bebidas) del cliente 
-- llamado Manuel Pedroza Gonzalez

SELECT c.Nombre, c.Apellido, 
       SUM(p.Importe + b.Importe) AS total_consumo
FROM Cliente c
JOIN Factura f ON c.id_cliente = f.id_cliente
JOIN Platillo p ON f.id_platillo = p.id_platillo
JOIN Bebida b ON f.id_bebida = b.id_bebida
WHERE c.Nombre = 'Manuel' AND c.Apellido = 'Pedroza'
GROUP BY c.id_cliente, c.Nombre, c.Apellido;

-- 7. Liste las mesas que han sido utilizadas al menos una vez, indicando su 
-- ubicación y el número de comensales

SELECT DISTINCT m.id_mesa, m.Ubicacion, m.num_comensales
FROM Mesa m
JOIN Factura f ON m.id_mesa = f.id_mesa
ORDER BY m.id_mesa;




