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

-- Datos de ejemplo
INSERT INTO Socios (DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono)
VALUES 
('12345678', 'Juan', 'Pérez', 'juan.perez@email.com', 'Palermo', 'Av. Santa Fe 1234', '1123456789'),
('87654321', 'María', 'González', 'maria.gonzalez@email.com', 'Recoleta', 'Callao 567', '1198765432');
GO

select * from Socios