
-- Tuplas en tabla Cliente
INSERT INTO Cliente (id_cliente, Nombre, Apellido, Observaciones) VALUES
(1, 'Juan', 'Perez', 'Cliente frecuente'),
(2, 'Maria', 'Gomez', 'Vegetariano'),
(3, 'Manuel', 'Pedroza', 'Gonzalez'),
(4, 'Carlos', 'Lopez', 'Alergico a mariscos'),
(5, 'Ana', 'Martinez', 'Prefiere mesas tranquilas'),
(6, 'Luis', 'Rodriguez', 'Celebración cumpleaños'),
(7, 'Sofia', 'Hernandez', 'VIP'),
(8, 'Pedro', 'Diaz', 'Reserva habitual los viernes'),
(9, 'Laura', 'Sanchez', 'Cliente nuevo'),
(10, 'Diego', 'Ramirez', 'Prefiere mesas al aire libre');

-- Tuplas en tabla Mesero
INSERT INTO Mesero (id_mesero, Nombre, Apellido1, Apellido2) VALUES
(1, 'Jorge', 'Gutierrez', 'Mendez'),
(2, 'Fernanda', 'Castro', 'Lopez'),
(3, 'Ricardo', 'Vargas', 'Solano'),
(4, 'Gabriela', 'Morales', 'Jimenez'),
(5, 'Oscar', 'Pinto', 'Rojas'),
(6, 'Daniela', 'Silva', 'Pereira'),
(7, 'Hector', 'Rios', 'Montes'),
(8, 'Valeria', 'Fuentes', 'Cordero'),
(9, 'Pablo', 'Mendoza', 'Salazar'),
(10, 'Camila', 'Navarro', 'Araya');

-- Tuplas en tabla Platillo
INSERT INTO Platillo (id_platillo, Nombre, Importe) VALUES
(1, 'Arroz a la marinera', 25000),
(2, 'Lomo saltado', 28000),
(3, 'Ceviche mixto', 30000),
(4, 'Aji de gallina', 22000),
(5, 'Pollo a la brasa', 35000),
(6, 'Tallarines verdes', 18000),
(7, 'Causa rellena', 15000),
(8, 'Anticuchos', 12000),
(9, 'Rocoto relleno', 20000),
(10, 'Trucha frita', 32000);

-- Tuplas en Bebida
INSERT INTO Bebida (id_bebida, Nombre, Importe) VALUES
(1, 'Pisco Sour', 12000),
(2, 'Chicha morada', 5000),
(3, 'Inca Kola', 4000),
(4, 'Cerveza Cusqueña', 8000),
(5, 'Jugo de maracuya', 6000),
(6, 'Agua mineral', 3000),
(7, 'Vino tinto', 15000),
(8, 'Mojito', 10000),
(9, 'Café', 3500),
(10, 'Té helado', 4000);

-- Tuplas en tabla Mesa
INSERT INTO Mesa (id_mesa, num_comensales, Ubicacion) VALUES
(1, 4, 'Primer piso'),
(2, 2, 'Terraza'),
(3, 6, 'Segundo piso'),
(4, 4, 'Segundo piso'),
(5, 8, 'Sala privada'),
(6, 2, 'Primer piso'),
(7, 4, 'Terraza'),
(8, 6, 'Segundo piso'),
(9, 10, 'Sala VIP'),
(10, 4, 'Segundo piso');


-- Tuplas en tabla Factura
INSERT INTO Factura (id_factura, fecha_factura, id_cliente, id_mesero, id_mesa, id_platillo, id_bebida) VALUES
(1, '2023-05-10', 1, 3, 2, 1, 2),
(2, '2023-05-11', 3, 5, 10, 5, 4),
(3, '2023-05-12', 2, 2, 4, 1, 3),
(4, '2023-05-13', 5, 7, 6, 3, 1),
(5, '2023-05-14', 3, 1, 8, 10, 7),
(6, '2023-05-15', 7, 4, 3, 2, 5),
(7, '2023-05-16', 3, 6, 10, 1, 8),
(8, '2023-05-17', 4, 9, 7, 4, 9),
(9, '2023-05-18', 6, 8, 5, 6, 6),
(10, '2023-05-19', 3, 10, 10, 1, 10);

