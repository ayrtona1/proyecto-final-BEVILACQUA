-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS hotel_bevi_confort;
USE hotel_bevi_confort;

-- Crear tablas

-- Tabla Clientes
CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    Direccion VARCHAR(100)
);

-- Tabla Habitaciones
CREATE TABLE Habitaciones (
    ID_Habitacion INT PRIMARY KEY AUTO_INCREMENT,
    Numero INT,
    Tipo VARCHAR(50),
    Piso INT,
    PrecioPorNoche DECIMAL(10, 2),
    Disponible BOOLEAN
);

-- Tabla Servicios
CREATE TABLE Servicios (
    ID_Servicio INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    Precio DECIMAL(10, 2)
);

-- Tabla Reservas (transaccional)
CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY AUTO_INCREMENT,
    ID_Cliente INT,
    ID_Habitacion INT,
    FechaEntrada DATE,
    FechaSalida DATE,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitaciones(ID_Habitacion)
);

-- Tabla Reservas_Servicios (transaccional)
CREATE TABLE Reservas_Servicios (
    ID_Reserva_Servicio INT PRIMARY KEY AUTO_INCREMENT,
    ID_Reserva INT,
    ID_Servicio INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio)
);

-- Tabla Facturas (tabla de hechos)
CREATE TABLE Facturas (
    ID_Factura INT PRIMARY KEY AUTO_INCREMENT,
    ID_Reserva INT,
    FechaEmision DATE,
    MontoTotal DECIMAL(10, 2),
    MetodoPago VARCHAR(50),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    ID_Empleado INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    Direccion VARCHAR(100),
    Posicion VARCHAR(50),
    Salario DECIMAL(10, 2)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(100),
    Direccion VARCHAR(100)
);

-- Tabla Compras
CREATE TABLE Compras (
    ID_Compra INT PRIMARY KEY AUTO_INCREMENT,
    ID_Proveedor INT,
    Fecha DATE,
    MontoTotal DECIMAL(10, 2),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

-- Tabla Productos
CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Descripcion TEXT,
    Precio DECIMAL(10, 2),
    Stock INT
);

-- Tabla Compras_Productos
CREATE TABLE Compras_Productos (
    ID_Compra_Producto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Compra INT,
    ID_Producto INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (ID_Compra) REFERENCES Compras(ID_Compra),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);

-- Tabla Habitaciones_Servicios
CREATE TABLE Habitaciones_Servicios (
    ID_Habitacion_Servicio INT PRIMARY KEY AUTO_INCREMENT,
    ID_Habitacion INT,
    ID_Servicio INT,
    FOREIGN KEY (ID_Habitacion) REFERENCES Habitaciones(ID_Habitacion),
    FOREIGN KEY (ID_Servicio) REFERENCES Servicios(ID_Servicio)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    ID_Pago INT PRIMARY KEY AUTO_INCREMENT,
    ID_Factura INT,
    FechaPago DATE,
    MontoPagado DECIMAL(10, 2),
    FOREIGN KEY (ID_Factura) REFERENCES Facturas(ID_Factura)
);

-- Tabla Roles
CREATE TABLE Roles (
    ID_Rol INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50)
);

-- Tabla Empleados_Roles
CREATE TABLE Empleados_Roles (
    ID_Empleado_Rol INT PRIMARY KEY AUTO_INCREMENT,
    ID_Empleado INT,
    ID_Rol INT,
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado),
    FOREIGN KEY (ID_Rol) REFERENCES Roles(ID_Rol)
);
-- Inserciones de datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Telefono, CorreoElectronico, Direccion) VALUES
('Juan', 'Perez', '123456789', 'juan.perez@example.com', 'Calle 123, Ciudad'),
('Maria', 'Gonzalez', '987654321', 'maria.gonzalez@example.com', 'Avenida Principal, Pueblo'),
('Pedro', 'Martinez', '555555555', 'pedro.martinez@example.com', 'Avenida Central, Ciudad'),
('Laura', 'Diaz', '444444444', 'laura.diaz@example.com', 'Calle 123, Pueblo'),
('Carlos', 'Lopez', '111111111', 'carlos.lopez@example.com', 'Avenida Norte, Ciudad'),
('Ana', 'Sanchez', '222222222', 'ana.sanchez@example.com', 'Calle Sur, Pueblo'),
('Diego', 'Rodriguez', '333333333', 'diego.rodriguez@example.com', 'Avenida Oeste, Ciudad'),
('Elena', 'Fernandez', '666666666', 'elena.fernandez@example.com', 'Calle Este, Pueblo'),
('Santiago', 'Gomez', '999999999', 'santiago.gomez@example.com', 'Avenida Este, Ciudad'),
('Paula', 'Ramirez', '777777777', 'paula.ramirez@example.com', 'Calle Norte, Pueblo');

-- Inserciones de datos en la tabla Habitaciones
INSERT INTO Habitaciones (Numero, Tipo, Piso, PrecioPorNoche, Disponible) VALUES
(101, 'Suite', 1, 200.00, TRUE),
(102, 'Doble', 1, 120.00, TRUE),
(103, 'Individual', 2, 80.00, TRUE),
(104, 'Suite', 2, 220.00, TRUE),
(105, 'Doble', 2, 130.00, TRUE),
(106, 'Individual', 3, 90.00, TRUE),
(107, 'Suite', 3, 240.00, TRUE),
(108, 'Doble', 3, 140.00, TRUE),
(109, 'Individual', 4, 100.00, TRUE),
(110, 'Suite', 4, 260.00, TRUE);

-- Inserciones de datos en la tabla Servicios
INSERT INTO Servicios (Nombre, Descripcion, Precio) VALUES
('Desayuno', 'Desayuno continental', 10.00),
('Lavanderia', 'Servicio de lavado y planchado de ropa', 15.00),
('SPA', 'Masajes y tratamientos de relajación', 50.00),
('Room Service', 'Servicio de comidas y bebidas en la habitación', 20.00),
('Wi-Fi', 'Conexión a internet de alta velocidad', 5.00),
('Gimnasio', 'Acceso al gimnasio y clases de ejercicio', 30.00),
('Transporte', 'Servicio de transporte privado', 40.00),
('Tour Guiado', 'Excursiones y tours por la ciudad', 25.00),
('Servicio de Concierge', 'Asistencia personalizada 24/7', 35.00),
('Eventos y Conferencias', 'Salas equipadas para eventos y reuniones', 100.00);

-- Inserciones de datos en la tabla Reservas
INSERT INTO Reservas (ID_Cliente, ID_Habitacion, FechaEntrada, FechaSalida) VALUES
(1, 101, '2024-05-01', '2024-05-03'),
(2, 102, '2024-06-10', '2024-06-15'),
(3, 103, '2024-07-05', '2024-07-10'),
(4, 104, '2024-08-20', '2024-08-25'),
(5, 105, '2024-09-15', '2024-09-20'),
(6, 106, '2024-10-10', '2024-10-15'),
(7, 107, '2024-11-05', '2024-11-10'),
(8, 108, '2024-12-20', '2024-12-25'),
(9, 109, '2025-01-15', '2025-01-20'),
(10, 110, '2025-02-10', '2025-02-15');

-- Inserciones de datos en la tabla Reservas_Servicios
INSERT INTO Reservas_Servicios (ID_Reserva, ID_Servicio, Cantidad, PrecioUnitario) VALUES
(1, 1, 2, 20.00),
(2, 2, 1, 15.00),
(3, 3, 3, 45.00),
(4, 4, 2, 40.00),
(5, 5, 1, 25.00),
(6, 6, 2, 60.00),
(7, 7, 3, 120.00),
(8, 8, 2, 50.00),
(9, 9, 1, 35.00),
(10, 10, 1, 100.00);

-- Inserciones de datos en la tabla Facturas
INSERT INTO Facturas (ID_Reserva, FechaEmision, MontoTotal, MetodoPago) VALUES
(1, '2024-05-03', 400.00, 'Tarjeta de crédito'),
(2, '2024-06-15', 480.00, 'Efectivo'),
(3, '2024-07-10', 585.00, 'Transferencia bancaria'),
(4, '2024-08-25', 720.00, 'Tarjeta de débito'),
(5, '2024-09-20', 525.00, 'Efectivo'),
(6, '2024-10-15', 740.00, 'Transferencia bancaria'),
(7, '2024-11-10', 960.00, 'Tarjeta de crédito'),
(8, '2024-12-25', 630.00, 'Efectivo'),
(9, '2025-01-20', 400.00, 'Tarjeta de crédito'),
(10, '2025-02-15', 1000.00, 'Transferencia bancaria');

-- Inserciones de datos en la tabla Empleados
INSERT INTO Empleados (Nombre, Apellido, Telefono, CorreoElectronico, Direccion, Posicion, Salario) VALUES
-- Continuación de inserciones de datos en la tabla Empleados
('Carlos', 'Garcia', '555444333', 'carlos.garcia@example.com', 'Calle Principal, Ciudad', 'Recepcionista', 2000.00),
('Luisa', 'Lopez', '999888777', 'luisa.lopez@example.com', 'Avenida Central, Pueblo', 'Limpieza', 1800.00),
('Roberto', 'Martinez', '777666555', 'roberto.martinez@example.com', 'Calle Norte, Ciudad', 'Chef', 3000.00),
('Sofia', 'Sanchez', '111222333', 'sofia.sanchez@example.com', 'Avenida Sur, Pueblo', 'Camarera', 1500.00),
('Julio', 'Gomez', '444555666', 'julio.gomez@example.com', 'Calle Este, Ciudad', 'Conserje', 2200.00),
('Laura', 'Rodriguez', '888777666', 'laura.rodriguez@example.com', 'Avenida Oeste, Pueblo', 'Gerente', 4000.00),
('Ana', 'Perez', '333222111', 'ana.perez@example.com', 'Calle Central, Ciudad', 'Contador', 3500.00),
('Diego', 'Fernandez', '666777888', 'diego.fernandez@example.com', 'Avenida Principal, Pueblo', 'Mantenimiento', 1900.00),
('Monica', 'Diaz', '222333444', 'monica.diaz@example.com', 'Calle Norte, Ciudad', 'Recepcionista', 2000.00),
('Javier', 'Ramirez', '555666777', 'javier.ramirez@example.com', 'Avenida Este, Pueblo', 'Cocinero', 2800.00);

-- Inserciones de datos en la tabla Proveedores
INSERT INTO Proveedores (Nombre, Telefono, CorreoElectronico, Direccion) VALUES
('Distribuidora A', '111222333', 'distribuidoraA@example.com', 'Calle Principal, Ciudad'),
('Distribuidora B', '444555666', 'distribuidoraB@example.com', 'Avenida Central, Pueblo'),
('Distribuidora C', '777888999', 'distribuidoraC@example.com', 'Calle Norte, Ciudad'),
('Distribuidora D', '333444555', 'distribuidoraD@example.com', 'Avenida Sur, Pueblo'),
('Distribuidora E', '666777888', 'distribuidoraE@example.com', 'Calle Este, Ciudad'),
('Distribuidora F', '999000111', 'distribuidoraF@example.com', 'Avenida Oeste, Pueblo'),
('Distribuidora G', '222333444', 'distribuidoraG@example.com', 'Calle Central, Ciudad'),
('Distribuidora H', '555666777', 'distribuidoraH@example.com', 'Avenida Principal, Pueblo'),
('Distribuidora I', '888999000', 'distribuidoraI@example.com', 'Calle Norte, Ciudad'),
('Distribuidora J', '111222333', 'distribuidoraJ@example.com', 'Avenida Este, Pueblo');

-- Inserciones de datos en la tabla Compras
INSERT INTO Compras (ID_Proveedor, Fecha, MontoTotal) VALUES
(1, '2024-05-01', 500.00),
(2, '2024-06-10', 800.00),
(3, '2024-07-05', 1200.00),
(4, '2024-08-20', 700.00),
(5, '2024-09-15', 900.00),
(6, '2024-10-10', 1500.00),
(7, '2024-11-05', 600.00),
(8, '2024-12-20', 1000.00),
(9, '2025-01-15', 450.00),
(10, '2025-02-10', 2000.00);

-- Inserciones de datos en la tabla Productos
INSERT INTO Productos (Nombre, Descripcion, Precio, Stock) VALUES
('Producto A', 'Descripción del Producto A', 50.00, 100),
('Producto B', 'Descripción del Producto B', 30.00, 150),
('Producto C', 'Descripción del Producto C', 70.00, 80),
('Producto D', 'Descripción del Producto D', 40.00, 200),
('Producto E', 'Descripción del Producto E', 60.00, 120),
('Producto F', 'Descripción del Producto F', 80.00, 90),
('Producto G', 'Descripción del Producto G', 90.00, 110),
('Producto H', 'Descripción del Producto H', 100.00, 70),
('Producto I', 'Descripción del Producto I', 120.00, 50),
('Producto J', 'Descripción del Producto J', 150.00, 30);

-- Inserciones de datos en la tabla Compras_Productos
INSERT INTO Compras_Productos (ID_Compra, ID_Producto, Cantidad, PrecioUnitario) VALUES
(1, 1, 5, 50.00),
(2, 2, 10, 30.00),
(3, 3, 15, 70.00),
(4, 4, 8, 40.00),
(5, 5, 12, 60.00),
(6, 6, 20, 80.00),
(7, 7, 6, 90.00),
(8, 8, 10, 100.00),
(9, 9, 4, 120.00),
(10, 10, 2, 150.00);

-- Inserciones de datos en la tabla Habitaciones_Servicios
INSERT INTO Habitaciones_Servicios (ID_Habitacion, ID_Servicio) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

-- Inserciones de datos en la tabla Pagos
INSERT INTO Pagos (ID_Factura, FechaPago, MontoPagado) VALUES
(1, '2024-05-03', 400.00),
(2, '2024-06-15', 480.00),
(3, '2024-07-10', 585.00),
(4, '2024-08-25', 720.00),
(5, '2024-09-20', 525.00),
(6, '2024-10-15', 740.00),
(7, '2024-11-10', 960.00),
(8, '2024-12-25', 630.00),
(9, '2025-01-20', 400.00),
(10, '2025-02-15', 1000.00);

-- Inserciones de datos en la tabla Clientes
INSERT INTO Clientes (Nombre, Apellido, Telefono, CorreoElectronico, Direccion) VALUES
('Juan', 'Perez', '123456789', 'juan.perez@example.com', 'Calle 123, Ciudad'),
('Maria', 'Gonzalez', '987654321', 'maria.gonzalez@example.com', 'Avenida Principal, Pueblo'),
('Pedro', 'Martinez', '555555555', 'pedro.martinez@example.com', 'Avenida Central, Ciudad'),
('Laura', 'Diaz', '444444444', 'laura.diaz@example.com', 'Calle 123, Pueblo'),
('Carlos', 'Lopez', '111111111', 'carlos.lopez@example.com', 'Avenida Norte, Ciudad'),
('Ana', 'Sanchez', '222222222', 'ana.sanchez@example.com', 'Calle Sur, Pueblo'),
('Diego', 'Rodriguez', '333333333', 'diego.rodriguez@example.com', 'Avenida Oeste, Ciudad'),
('Elena', 'Fernandez', '666666666', 'elena.fernandez@example.com', 'Calle Este, Pueblo'),
('Santiago', 'Gomez', '999999999', 'santiago.gomez@example.com', 'Avenida Este, Ciudad'),
('Paula', 'Ramirez', '777777777', 'paula.ramirez@example.com', 'Calle Norte, Pueblo');

-- Inserciones de datos en la tabla Habitaciones
INSERT INTO Habitaciones (Numero, Tipo, Piso, PrecioPorNoche, Disponible) VALUES
(101, 'Suite', 1, 200.00, TRUE),
(102, 'Doble', 1, 120.00, TRUE),
(103, 'Individual', 2, 80.00, TRUE),
(104, 'Suite', 2, 220.00, TRUE),
(105, 'Doble', 2, 130.00, TRUE),
(106, 'Individual', 3, 90.00, TRUE),
(107, 'Suite', 3, 240.00, TRUE),
(108, 'Doble', 3, 140.00, TRUE),
(109, 'Individual', 4, 100,00, TRUE)

-- Crear vistas

CREATE VIEW HabitacionesDisponibles AS
SELECT * FROM Habitaciones WHERE Disponible = TRUE;

CREATE VIEW FacturasDetalladas AS
SELECT f.ID_Factura, r.ID_Reserva, r.ID_Cliente, r.FechaEntrada, f.MontoTotal, f.MetodoPago
FROM Facturas f
JOIN Reservas r ON f.ID_Reserva = r.ID_Reserva;

CREATE VIEW ClientesConReservas AS
SELECT c.ID_Cliente, c.Nombre, c.Apellido, COUNT(r.ID_Reserva) AS NumeroReservas
FROM Clientes c
JOIN Reservas r ON c.ID_Cliente = r.ID_Cliente
GROUP BY c.ID_Cliente, c.Nombre, c.Apellido;

CREATE VIEW ServiciosPorReserva AS
SELECT r.ID_Reserva, s.Nombre, rs.Cantidad, rs.PrecioUnitario
FROM Reservas_Servicios rs
JOIN Servicios s ON rs.ID_Servicio = s.ID_Servicio
JOIN Reservas r ON rs.ID_Reserva = r.ID_Reserva;

CREATE VIEW HabitacionesConServicios AS
SELECT h.Numero, s.Nombre
FROM Habitaciones_Servicios hs
JOIN Habitaciones h ON hs.ID_Habitacion = h.ID_Habitacion
JOIN Servicios s ON hs.ID_Servicio = s.ID_Servicio;

-- Crear procedimientos almacenados

DELIMITER $$

CREATE PROCEDURE ActualizarEstadoReserva(IN p_ID_Reserva INT)
BEGIN
    UPDATE Reservas
    SET FechaSalida = DATE_ADD(FechaEntrada, INTERVAL 5 DAY)
    WHERE ID_Reserva = p_ID_Reserva;
END$$

CREATE PROCEDURE GenerarReporteMensual(IN p_Mes INT, IN p_Anio INT)
BEGIN
    SELECT 
        r.ID_Reserva, 
        c.Nombre, 
        c.Apellido, 
        r.FechaEntrada, 
        r.FechaSalida, 
        f.MontoTotal
    FROM 
        Reservas r
    JOIN 
        Clientes c ON r.ID_Cliente = c.ID_Cliente
    JOIN 
        Facturas f ON r.ID_Reserva = f.ID_Reserva
    WHERE 
        MONTH(r.FechaEntrada) = p_Mes AND YEAR(r.FechaEntrada) = p_Anio;
END$$

DELIMITER ;

-- Crear triggers

DELIMITER $$

CREATE TRIGGER ActualizarDisponibilidadHabitacion
AFTER INSERT ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Disponible = FALSE
    WHERE ID_Habitacion = NEW.ID_Habitacion;
END$$

CREATE TRIGGER RestaurarDisponibilidadHabitacion
AFTER DELETE ON Reservas
FOR EACH ROW
BEGIN
    UPDATE Habitaciones
    SET Disponible = TRUE
    WHERE ID_Habitacion = OLD.ID_Habitacion;
END$$

DELIMITER ;

-- Crear funciones

DELIMITER $$

CREATE FUNCTION CalcularDescuentoCliente(ID_Cliente INT) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE Descuento DECIMAL(10, 2);
    -- Lógica para calcular el descuento
    SET Descuento = 0.10; -- Por ejemplo, un 10% de descuento
    RETURN Descuento;
END$$

CREATE FUNCTION ObtenerPrecioServicio(ID_Servicio INT) RETURNS DECIMAL(10, 2)
READS SQL DATA
BEGIN
    DECLARE Precio DECIMAL(10, 2);
    SELECT s.Precio INTO Precio FROM Servicios s WHERE s.ID_Servicio = ID_Servicio;
    RETURN Precio;
END$$

DELIMITER ;


