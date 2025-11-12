 Crear la base de datos
CREATE DATABASE GimnasioDos_DB;
GO

USE GimnasioDos_DB;
GO

-- ==========================
-- TABLA: Socio
-- ==========================
CREATE TABLE Socio (
    IdSocio INT IDENTITY(1,1) PRIMARY KEY,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo VARCHAR(100),
    Telefono VARCHAR(20),
	  Direccion VARCHAR(100),
    Barrio VARCHAR(50),
    Estado BIT NOT NULL DEFAULT 1  -- 1 = activo, 0 = inactivo
);
GO

-- ==========================
-- TABLA: Membresia
-- ==========================
CREATE TABLE Membresia (
    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,  --POR si se quiere agregar una nueva membresia
    Nombre VARCHAR(50) NOT NULL,
    DuracionDias INT NOT NULL,
    PrecioBase DECIMAL(10,2) NOT NULL
);
GO

-- ==========================
-- TABLA: ActividadExtra
-- ==========================
CREATE TABLE ActividadExtra (
    IdActividad INT IDENTITY(1,1) PRIMARY KEY,
    NombreActividad VARCHAR(50) NOT NULL,
    PrecioExtra DECIMAL(10,2) NOT NULL,
    Descripcion VARCHAR(200)
);
GO

-- ==========================
-- TABLA: Inscripcion
-- ==========================
CREATE TABLE Inscripcion (
    IdInscripcion INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    IdMembresia INT NOT NULL,
    FechaInscripcion DATE NOT NULL,
    FechaVencimiento DATE NOT NULL,
    Estado BIT NOT NULL DEFAULT 1,  -- 1 = activa, 0 = vencida o cancelada
    CONSTRAINT FK_Inscripcion_Socio FOREIGN KEY (IdSocio) REFERENCES Socio(IdSocio),
    CONSTRAINT FK_Inscripcion_Membresia FOREIGN KEY (IdMembresia) REFERENCES Membresia(IdMembresia)
);
GO

-- ==========================
-- TABLA: Pago
-- ==========================
CREATE TABLE Pago (
    IdPago INT IDENTITY(1,1) PRIMARY KEY,
    IdSocio INT NOT NULL,
    IdInscripcion INT NOT NULL,
    FechaPago DATE NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    MetodoPago VARCHAR(50),
    CONSTRAINT FK_Pago_Socio FOREIGN KEY (IdSocio) REFERENCES Socio(IdSocio),
    CONSTRAINT FK_Pago_Inscripcion FOREIGN KEY (IdInscripcion) REFERENCES Inscripcion(IdInscripcion)
);
GO

-- ==========================
-- TABLA: InscripcionActividad (tabla puente)
-- ==========================
CREATE TABLE InscripcionActividad (
    IdInscripcionActividad INT IDENTITY(1,1) PRIMARY KEY,
    IdInscripcion INT NOT NULL,
    IdActividad INT NOT NULL,
    PrecioFinal DECIMAL(10,2) NULL,
    CONSTRAINT FK_InscripcionActividad_Inscripcion FOREIGN KEY (IdInscripcion) REFERENCES Inscripcion(IdInscripcion),
    CONSTRAINT FK_InscripcionActividad_Actividad FOREIGN KEY (IdActividad) REFERENCES ActividadExtra(IdActividad)
);
GO
-- ==================================================================================================================================
-- INSERT
-- ==================================================================================================================================

 -- INSERT
-- ==========================
-- SOCIOS
-- ==========================
INSERT INTO Socio (DNI, Nombre, Apellido, Correo, Telefono, Direccion, Barrio, Estado) VALUES
('40123456', 'Juan', 'Pérez', 'juanperez@gmail.com', '1165891234', 'Av. Corrientes 3200', 'Villa Crespo', 1),
('40234567', 'Lucía', 'Gómez', 'luciagomez@gmail.com', '1145678912', 'Calle Malabia 1500', 'Palermo', 1),
('40345678', 'Martín', 'López', 'martinlopez@gmail.com', '1134567891', 'Av. San Martín 4500', 'Chacarita', 1);
GO


-- ==========================
-- MEMBRESÍA (única)
-- ==========================
INSERT INTO Membresia (Nombre, DuracionDias, PrecioBase) VALUES
('Pase libre', 30, 36000.00);
GO

-- ==========================
-- ACTIVIDADES EXTRA
-- ==========================
INSERT INTO ActividadExtra (NombreActividad, PrecioExtra, Descripcion) VALUES
('Sin actividad extra', 0.00, 'Pase libre'),
('GAP', 2500.00, 'Entrenamiento enfocado en glúteos, abdominales y piernas'),
('Karate', 3500.00, 'Clase de artes marciales con técnicas de defensa personal'),
('Yoga', 2000.00, 'Clase de estiramiento, equilibrio y respiración');
GO

-- ==========================
-- INSCRIPCIONES
-- ==========================
-- Todos los socios tienen la misma membresía (IdMembresia = 1)
INSERT INTO Inscripcion (IdSocio, IdMembresia, FechaInscripcion, FechaVencimiento, Estado) VALUES
(1, 1, '2025-11-01', '2025-11-30', 1), 
(2, 1, '2025-11-03', '2025-12-02', 1),
(3, 1, '2025-11-05', '2025-12-04', 1);
GO

-- ==========================
-- INSCRIPCIÓN - ACTIVIDAD (tabla puente)
-- ==========================
-- Juan (IdInscripcion 1) toma Zumba y GAP
INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
(1, 1, 3000.00),  -- Zumba
(1, 2, 2500.00);  -- GAP

-- Lucía (IdInscripcion 2) toma solo Yoga
INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
(2, 4, 2000.00);  -- Yoga

-- Martín (IdInscripcion 3) toma Karate
INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
(3, 3, 3500.00);  -- Karate
GO

SELECT SUM(m.PrecioBase + ISNULL(ia.TotalExtras, 0)) AS TotalIngresos FROM Pago p INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN ( SELECT IdInscripcion, SUM(PrecioFinal) AS TotalExtras  FROM InscripcionActividad GROUP BY IdInscripcion ) ia ON i.IdInscripcion = ia.IdInscripcion WHERE p.FechaPago = '2025-11-11';  -- 🔹 Día específico

SELECT SUM(m.PrecioBase + ISNULL(ia.TotalExtras, 0)) AS TotalIngresos 
FROM Pago p 
INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion 
INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia 
LEFT JOIN (
    SELECT IdInscripcion, SUM(PrecioFinal) AS TotalExtras  
    FROM InscripcionActividad 
    GROUP BY IdInscripcion
) ia ON i.IdInscripcion = ia.IdInscripcion 
WHERE CAST(p.FechaPago AS date) = '2025-11-11'

SELECT FechaPago FROM Pago;