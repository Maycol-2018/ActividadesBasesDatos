-- 1. Tabla Sucursales
CREATE TABLE Sucursales (
    sucursal_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    CHECK (email ~* '^[^@]+@[^@]+\.[^@]+$')
);

-- 2. Tabla Clientes
CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    dni VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    fecha_registro DATE NOT NULL DEFAULT CURRENT_DATE,
    CHECK (email ~* '^[^@]+@[^@]+\.[^@]+$')
);

-- 3. Tabla Vehiculos
CREATE TABLE Vehiculos (
    vehiculo_id SERIAL PRIMARY KEY,
    sucursal_id INT NOT NULL,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    año INT NOT NULL CHECK (año BETWEEN 2000 AND 2025),
    color VARCHAR(30) NOT NULL,
    tipo_combustible VARCHAR(20) NOT NULL CHECK (tipo_combustible IN ('Gasolina', 'Diésel', 'Eléctrico', 'Híbrido')),
    capacidad INT NOT NULL CHECK (capacidad > 0),
    precio_dia DECIMAL(10,2) NOT NULL CHECK (precio_dia > 0),
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible' CHECK (estado IN ('Disponible', 'Alquilado', 'Mantenimiento')),
    CONSTRAINT fk_vehiculo_sucursal FOREIGN KEY (sucursal_id) 
        REFERENCES Sucursales(sucursal_id) ON UPDATE CASCADE
);

-- 4. Tabla Alquileres
CREATE TABLE Alquileres (
    alquiler_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    vehiculo_id INT NOT NULL,
    sucursal_origen_id INT NOT NULL,
    sucursal_destino_id INT,
    fecha_inicio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_fin TIMESTAMP NOT NULL,
    fecha_devolucion TIMESTAMP,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo' CHECK (estado IN ('Activo', 'Finalizado', 'Cancelado')),
    total_pagar DECIMAL(10,2) NOT NULL CHECK (total_pagar >= 0),
    CONSTRAINT fk_alquiler_cliente FOREIGN KEY (cliente_id) 
        REFERENCES Clientes(cliente_id) ON DELETE CASCADE,
    CONSTRAINT fk_alquiler_vehiculo FOREIGN KEY (vehiculo_id) 
        REFERENCES Vehiculos(vehiculo_id),
    CONSTRAINT fk_alquiler_sucursal_origen FOREIGN KEY (sucursal_origen_id) 
        REFERENCES Sucursales(sucursal_id),
    CONSTRAINT fk_alquiler_sucursal_destino FOREIGN KEY (sucursal_destino_id) 
        REFERENCES Sucursales(sucursal_id),
    CONSTRAINT chk_fechas CHECK (fecha_fin > fecha_inicio)
);

-- 5. Tabla Pagos
CREATE TABLE Pagos (
    pago_id SERIAL PRIMARY KEY,
    alquiler_id INT NOT NULL,
    fecha_pago TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monto DECIMAL(10,2) NOT NULL CHECK (monto > 0),
    metodo_pago VARCHAR(20) NOT NULL CHECK (metodo_pago IN ('Tarjeta', 'Efectivo', 'Transferencia')),
    estado VARCHAR(20) NOT NULL DEFAULT 'Completado' CHECK (estado IN ('Completado', 'Pendiente', 'Rechazado')),
    CONSTRAINT fk_pago_alquiler FOREIGN KEY (alquiler_id) 
        REFERENCES Alquileres(alquiler_id) ON DELETE CASCADE
);
