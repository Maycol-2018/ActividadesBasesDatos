--  Insertar datos de prueba
INSERT INTO Sucursales (nombre, direccion, ciudad, telefono, email) 
VALUES ('Sucursal Central', 'Av. Principal 123', 'Madrid', '912345678', 'central@rentacar.com');

INSERT INTO Clientes (dni, nombre, apellido, telefono, email) 
VALUES ('12345678A', 'Juan', 'Pérez', '600111222', 'juan@email.com');

INSERT INTO Vehiculos (sucursal_id, matricula, marca, modelo, año, color, tipo_combustible, capacidad, precio_dia) 
VALUES (1, 'M-1234-ABC', 'Toyota', 'Corolla', 2020, 'Rojo', 'Gasolina', 5, 50.00);

INSERT INTO Alquileres (cliente_id, vehiculo_id, sucursal_origen_id, fecha_fin, total_pagar) 
VALUES (1, 1, 1, DATE_ADD(CURRENT_DATE, INTERVAL 7 DAY), 350.00);