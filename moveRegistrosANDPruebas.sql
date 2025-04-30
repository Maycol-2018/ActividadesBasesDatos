
-- Prueba de ON DELETE CASCADE --------------------------------------------------------------------


-- 1. Insertar datos de prueba
INSERT INTO Sucursales (nombre, direccion, ciudad, telefono, email) 
VALUES ('Sucursal Central', 'Av. Principal 123', 'Madrid', '912345678', 'central@rentacar.com');

INSERT INTO Clientes (dni, nombre, apellido, telefono, email) 
VALUES ('12345678A', 'Juan', 'Pérez', '600111222', 'juan@email.com');

INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) 
VALUES (1, 'M-1234-ABC', 'Toyota', 'Corolla', 2020, 'Rojo', 'Gasolina', 5, 50.00);

INSERT INTO Alquileres (cliente_id, vehiculo_id, sucursal_origen_id, fecha_fin, total_pagar) 
VALUES (1, 1, 1, DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY), 350.00);

-- Verificar que los datos se insertaron correctamente
SELECT * FROM Clientes WHERE cliente_id = 1;
SELECT * FROM Alquileres WHERE cliente_id = 1;

-- 2. Eliminar el cliente (debería eliminar automáticamente el alquiler asociado)
DELETE FROM Clientes WHERE cliente_id = 1;

-- Verificar que el cliente y su alquiler se eliminaron
SELECT * FROM Clientes WHERE cliente_id = 1; -- No debería devolver resultados
SELECT * FROM Alquileres WHERE cliente_id = 1; -- No debería devolver resultados


-- Prueba de ON UPDATE CASCADE  --------------------------------------------------------------------

-- 1. Insertar una nueva sucursal
INSERT INTO Sucursales (nombre, direccion, ciudad, telefono, email) 
VALUES ('Sucursal Norte', 'Calle Norte 456', 'Barcelona', '932222333', 'norte@rentacar.com');

-- Insertar un vehículo asociado a la sucursal 1
INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) 
VALUES (1, 'B-5678-XYZ', 'Honda', 'Civic', 2021, 'Azul', 'Gasolina', 5, 55.00);

-- Verificar el sucursal_id actual del vehículo
SELECT vehiculo_id, matricula, sucursal_id FROM Vehiculos WHERE matricula = 'B-5678-XYZ';

-- 2. Actualizar el ID de la sucursal (debería actualizarse en el vehículo)
UPDATE Sucursales SET sucursal_id = 3 WHERE sucursal_id = 1;

-- Verificar que el vehículo ahora tiene el nuevo sucursal_id
SELECT vehiculo_id, matricula, sucursal_id FROM Vehiculos WHERE matricula = 'B-5678-XYZ'; -- Debería mostrar sucursal_id = 3


-- Prueba de Restricción CHECK (año del vehículo)  --------------------------------------------------------------------

-- Intentar insertar un vehículo con año 1999 (debería fallar)
INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) 
VALUES (1, 'M-9999-ERR', 'Ford', 'Fiesta', 1999, 'Verde', 'Gasolina', 4, 30.00);

-- Ver mensaje de error (debería ser algo como: "Check constraint 'Vehiculos_chk_1' is violated")

-- Insertar un vehículo con año válido (debería funcionar)
INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) 
VALUES (1, 'M-2000-OK', 'Ford', 'Fiesta', 2000, 'Verde', 'Gasolina', 4, 30.00);

-- Verificar que solo se insertó el vehículo con año válido
SELECT * FROM Vehiculos WHERE marca = 'Ford';


