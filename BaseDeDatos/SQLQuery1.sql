CREATE DATABASE Gimnasio;
GO

 Usar la base de datos recién creada
USE Gimnasio;
GO


CREATE TABLE Socios (
    IdSocio INT IDENTITY(1,1) PRIMARY KEY,
    DNI CHAR(8) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Barrio VARCHAR(50) NULL,
    Direccion VARCHAR(100) NULL,
    Telefono VARCHAR(20) NULL,
    Estado BIT NOT NULL DEFAULT 1,
    FechaRegistro DATE NOT NULL DEFAULT GETDATE()
);
CREATE TABLE TipoMembresia (
    IdTipoMembresia INT IDENTITY(1,1) PRIMARY KEY,
    NombreTipo VARCHAR(50) NOT NULL,
    DuracionDias INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Beneficios VARCHAR(200)
);

CREATE TABLE Membresia (
    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    IdTipoMembresia INT NOT NULL,
    FechaPago DATE NOT NULL DEFAULT GETDATE(),
    FechaVencimiento AS DATEADD(DAY, 30, FechaPago) PERSISTED, -- se calcula automáticamente
    Estado VARCHAR(15) NOT NULL DEFAULT 'Activa',
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio),
    FOREIGN KEY (IdTipoMembresia) REFERENCES TipoMembresia(IdTipoMembresia)
);

CREATE TABLE Pago (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    IdMembresia INT NOT NULL,
    FechaPago DATE NOT NULL DEFAULT GETDATE(),
    Monto DECIMAL(10,2) NOT NULL,
    MetodoPago VARCHAR(30),
    FOREIGN KEY (IdSocio) REFERENCES Socios(IdSocio),
    FOREIGN KEY (IdMembresia) REFERENCES Membresia(IdMembresia)
);




-- Datos de ejemplo
INSERT INTO Socios (DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono)
VALUES 
('12345678', 'Juan', 'Pérez', 'juan.perez@email.com', 'Palermo', 'Av. Santa Fe 1234', '1123456789'),
('87654321', 'María', 'González', 'maria.gonzalez@email.com', 'Recoleta', 'Callao 567', '1198765432');
GO

INSERT INTO TipoMembresia (NombreTipo, DuracionDias, Precio, Beneficios)
VALUES
('Básica', 30, 15000, 'Acceso a gimnasio'),
('Premium', 30, 25000, 'Gimnasio + yoga');

INSERT INTO Membresia (IdSocio, IdTipoMembresia)
VALUES
(1, 1), 
(2, 2);
INSERT INTO Pago (IdSocio, IdMembresia, Monto, MetodoPago)
VALUES
(1, 1, 15000, 'Tarjeta'),
(2, 2, 25000, 'Transferencia');


-- Ver todos los socios
SELECT * FROM Socios;

-- Ver todas las membresías
SELECT m.IdMembresia, s.Nombre, s.Apellido, t.NombreTipo, m.FechaPago, m.FechaVencimiento, m.Estado
FROM Membresia m
INNER JOIN Socios s ON m.IdSocio = s.IdSocio
INNER JOIN TipoMembresia t ON m.IdTipoMembresia = t.IdTipoMembresia;

-- Ver pagos
SELECT p.IdPago, s.Nombre, s.Apellido, t.NombreTipo, p.Monto, p.MetodoPago, p.FechaPago
FROM Pago p
INNER JOIN Socios s ON p.IdSocio = s.IdSocio
INNER JOIN Membresia m ON p.IdMembresia = m.IdMembresia
INNER JOIN TipoMembresia t ON m.IdTipoMembresia = t.IdTipoMembresia;
