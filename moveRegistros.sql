

-- Insertar datos en Sucursales
INSERT INTO Sucursales (nombre, direccion, ciudad, telefono, email) VALUES
('Sucursal Centro Madrid', 'Gran Vía 1', 'Madrid', '910000001', 'centro@rentacar.com'),
('Sucursal Norte Barcelona', 'Diagonal 500', 'Barcelona', '930000002', 'norte@rentacar.com'),
('Sucursal Sur Valencia', 'Colón 20', 'Valencia', '960000003', 'valencia@rentacar.com'),
('Sucursal Aeropuerto MAD', 'Terminal 4', 'Madrid', '910000004', 'aeropuerto@rentacar.com'),
('Sucursal Playa Málaga', 'Paseo Marítimo 5', 'Málaga', '950000005', 'playa@rentacar.com');


-- Insertar datos en clientes
INSERT INTO Clientes (dni, nombre, apellido, direccion, telefono, email) VALUES
('11111111A', 'Carlos', 'Gómez', 'Calle Mayor 10', '611111111', 'carlos@email.com'),
('22222222B', 'Ana', 'López', 'Avenida Libertad 25', '622222222', 'ana@email.com'),
('33333333C', 'Miguel', 'Sánchez', 'Plaza España 3', '633333333', 'miguel@email.com'),
('44444444D', 'Laura', 'Martín', 'Calle Sol 15', '644444444', 'laura@email.com'),
('55555555E', 'David', 'Fernández', 'Gran Vía 40', '655555555', 'david@email.com');

-- Insertar datos en vehiculos
INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) VALUES
(1, 'M-1234-AB', 'Toyota', 'Corolla', 2020, 'Rojo', 'Gasolina', 5, 45.00),
(2, 'B-5678-CD', 'Volkswagen', 'Golf', 2021, 'Azul', 'Diésel', 5, 50.00),
(3, 'V-9012-EF', 'Renault', 'Clio', 2022, 'Blanco', 'Gasolina', 4, 35.00),
(1, 'M-3456-GH', 'Peugeot', '308', 2023, 'Negro', 'Híbrido', 5, 55.00),
(2, 'B-7890-IJ', 'Seat', 'León', 2021, 'Gris', 'Diésel', 5, 48.00);


-- Insertar datos en Alquileres
INSERT INTO Alquileres (cliente_id, vehiculo_id, sucursal_origen_id, sucursal_destino_id, fecha_inicio, fecha_fin, fecha_devolucion, estado, total_pagar) VALUES
(1, 1, 1, NULL, '2023-11-01 10:00:00', '2023-11-08 10:00:00', NULL, 'Activo', 315.00),
(2, 2, 2, 1, '2023-11-05 09:00:00', '2023-11-12 09:00:00', '2023-11-12 09:30:00', 'Finalizado', 350.00),
(3, 3, 3, NULL, '2023-11-10 08:00:00', '2023-11-17 08:00:00', NULL, 'Activo', 245.00),
(1, 4, 1, 2, '2023-10-20 14:00:00', '2023-10-27 14:00:00', '2023-10-27 14:15:00', 'Finalizado', 385.00),
(4, 5, 2, NULL, '2023-11-15 11:00:00', '2023-11-22 11:00:00', NULL, 'Activo', 336.00),
(5, 1, 1, NULL, '2023-09-01 10:00:00', '2023-09-08 10:00:00', '2023-09-08 10:00:00', 'Finalizado', 315.00),
(5, 1, 1, NULL, '2023-09-01 10:00:00', '2023-09-08 10:00:00', '2023-09-08 10:00:00', 'Finalizado', 315.00),
(3, 1, 1, NULL, '2023-10-01 10:00:00', '2023-10-08 10:00:00', '2023-10-08 10:00:00', 'Finalizado', 315.00),
(2, 1, 1, NULL, '2023-08-01 10:00:00', '2023-08-08 10:00:00', '2023-08-08 10:00:00', 'Finalizado', 315.00),
(4, 1, 1, NULL, '2023-07-01 10:00:00', '2023-07-08 10:00:00', '2023-07-08 10:00:00', 'Finalizado', 315.00),
(5, 2, 2, NULL, '2023-09-05 09:00:00', '2023-09-12 09:00:00', '2023-09-12 09:00:00', 'Finalizado', 350.00);

-- Insertar datos en Pagos
INSERT INTO Pagos (alquiler_id, fecha_pago, monto, metodo_pago, estado) VALUES
(1, '2023-11-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(2, '2023-11-05 09:05:00', 350.00, 'Tarjeta', 'Completado'),
(3, '2023-11-10 08:05:00', 245.00, 'Transferencia', 'Completado'),
(4, '2023-10-20 14:05:00', 385.00, 'Efectivo', 'Completado'),
(5, '2023-11-15 11:05:00', 336.00, 'Tarjeta', 'Completado'),
(6, '2023-09-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(6, '2023-09-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(7, '2023-10-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(8, '2023-08-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(9, '2023-07-01 10:05:00', 315.00, 'Tarjeta', 'Completado'),
(10, '2023-09-05 09:05:00', 350.00, 'Tarjeta', 'Completado');

