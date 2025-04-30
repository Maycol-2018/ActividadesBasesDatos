-- 1. Obtener vehículos disponibles en una ciudad específica:

SELECT v.* 
FROM Vehiculos v
JOIN Sucursales s ON v.sucursal_id = s.sucursal_id
WHERE v.estado = 'Disponible' AND s.ciudad = 'Barcelona';

-- 2. Listar alquileres activos con información del cliente y vehículo:

SELECT a.alquiler_id, c.nombre, c.apellido, v.marca, v.modelo, v.matricula, a.fecha_inicio, a.fecha_fin
FROM Alquileres a
JOIN Clientes c ON a.cliente_id = c.cliente_id
JOIN Vehiculos v ON a.vehiculo_id = v.vehiculo_id
WHERE a.estado = 'Activo';

-- 3. Calcular ingresos totales por sucursal (vehículos con +3 alquileres):

SELECT s.sucursal_id, s.nombre, SUM(p.monto) AS ingresos_totales
FROM Pagos p
JOIN Alquileres a ON p.alquiler_id = a.alquiler_id
JOIN Vehiculos v ON a.vehiculo_id = v.vehiculo_id
JOIN Sucursales s ON v.sucursal_id = s.sucursal_id
WHERE v.vehiculo_id IN (
    SELECT vehiculo_id
    FROM Alquileres
    GROUP BY vehiculo_id
    HAVING COUNT(*) > 3
)
GROUP BY s.sucursal_id, s.nombre;

-- 4. Filtrar vehículos con más de 5 alquileres:

SELECT v.*
FROM Vehiculos v
WHERE v.vehiculo_id IN (
    SELECT vehiculo_id
    FROM Alquileres
    GROUP BY vehiculo_id
    HAVING COUNT(*) > 5
);

-- Sumar montos de todos los pagos asociados:

SELECT SUM(monto) AS total_pagos
FROM Pagos;

