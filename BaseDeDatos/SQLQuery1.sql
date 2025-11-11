-- Crear la base de datos
--CREATE DATABASE Gimnasio_DB;
--GO

--USE Gimnasio_DB;
--GO

---- ==========================
---- TABLA: Socio
---- ==========================
--CREATE TABLE Socio (
--    IdSocio INT IDENTITY(1,1) PRIMARY KEY,
--    DNI VARCHAR(15) NOT NULL UNIQUE,
--    Nombre VARCHAR(50) NOT NULL,
--    Apellido VARCHAR(50) NOT NULL,
--    Correo VARCHAR(100),
--    Telefono VARCHAR(20),
--	  Direccion VARCHAR(100),
--    Barrio VARCHAR(50),
--    Estado BIT NOT NULL DEFAULT 1  -- 1 = activo, 0 = inactivo
--);
--GO

---- ==========================
---- TABLA: Membresia
---- ==========================
--CREATE TABLE Membresia (
--    IdMembresia INT IDENTITY(1,1) PRIMARY KEY,  --POR si se quiere agregar una nueva membresia
--    Nombre VARCHAR(50) NOT NULL,
--    DuracionDias INT NOT NULL,
--    PrecioBase DECIMAL(10,2) NOT NULL
--);
--GO

---- ==========================
---- TABLA: ActividadExtra
---- ==========================
--CREATE TABLE ActividadExtra (
--    IdActividad INT IDENTITY(1,1) PRIMARY KEY,
--    NombreActividad VARCHAR(50) NOT NULL,
--    PrecioExtra DECIMAL(10,2) NOT NULL,
--    Descripcion VARCHAR(200)
--);
--GO

---- ==========================
---- TABLA: Inscripcion
---- ==========================
--CREATE TABLE Inscripcion (
--    IdInscripcion INT IDENTITY(1,1) PRIMARY KEY,
--    IdSocio INT NOT NULL,
--    IdMembresia INT NOT NULL,
--    FechaInscripcion DATE NOT NULL,
--    FechaVencimiento DATE NOT NULL,
--    Estado BIT NOT NULL DEFAULT 1,  -- 1 = activa, 0 = vencida o cancelada
--    CONSTRAINT FK_Inscripcion_Socio FOREIGN KEY (IdSocio) REFERENCES Socio(IdSocio),
--    CONSTRAINT FK_Inscripcion_Membresia FOREIGN KEY (IdMembresia) REFERENCES Membresia(IdMembresia)
--);
--GO

---- ==========================
---- TABLA: Pago
---- ==========================
--CREATE TABLE Pago (
--    IdPago INT IDENTITY(1,1) PRIMARY KEY,
--    IdSocio INT NOT NULL,
--    IdInscripcion INT NOT NULL,
--    FechaPago DATE NOT NULL,
--    Monto DECIMAL(10,2) NOT NULL,
--    MetodoPago VARCHAR(50),
--    CONSTRAINT FK_Pago_Socio FOREIGN KEY (IdSocio) REFERENCES Socio(IdSocio),
--    CONSTRAINT FK_Pago_Inscripcion FOREIGN KEY (IdInscripcion) REFERENCES Inscripcion(IdInscripcion)
--);
--GO

---- ==========================
---- TABLA: InscripcionActividad (tabla puente)
---- ==========================
--CREATE TABLE InscripcionActividad (
--    IdInscripcionActividad INT IDENTITY(1,1) PRIMARY KEY,
--    IdInscripcion INT NOT NULL,
--    IdActividad INT NOT NULL,
--    PrecioFinal DECIMAL(10,2) NULL,
--    CONSTRAINT FK_InscripcionActividad_Inscripcion FOREIGN KEY (IdInscripcion) REFERENCES Inscripcion(IdInscripcion),
--    CONSTRAINT FK_InscripcionActividad_Actividad FOREIGN KEY (IdActividad) REFERENCES ActividadExtra(IdActividad)
--);
--GO
---- ==================================================================================================================================
---- INSERT
---- ==================================================================================================================================

-- -- INSERT
---- ==========================
---- SOCIOS
---- ==========================
--INSERT INTO Socio (DNI, Nombre, Apellido, Correo, Telefono, Direccion, Barrio, Estado) VALUES
--('40123456', 'Juan', 'Pérez', 'juanperez@gmail.com', '1165891234', 'Av. Corrientes 3200', 'Villa Crespo', 1),
--('40234567', 'Lucía', 'Gómez', 'luciagomez@gmail.com', '1145678912', 'Calle Malabia 1500', 'Palermo', 1),
--('40345678', 'Martín', 'López', 'martinlopez@gmail.com', '1134567891', 'Av. San Martín 4500', 'Chacarita', 1);
--GO


---- ==========================
---- MEMBRESÍA (única)
---- ==========================
--INSERT INTO Membresia (Nombre, DuracionDias, PrecioBase) VALUES
--('Pase libre', 30, 36000.00);
--GO

---- ==========================
---- ACTIVIDADES EXTRA
---- ==========================
--INSERT INTO ActividadExtra (NombreActividad, PrecioExtra, Descripcion) VALUES
--('Sin actividad extra', 0.00, 'Pase libre'),
--('GAP', 2500.00, 'Entrenamiento enfocado en glúteos, abdominales y piernas'),
--('Karate', 3500.00, 'Clase de artes marciales con técnicas de defensa personal'),
--('Yoga', 2000.00, 'Clase de estiramiento, equilibrio y respiración');
--GO

---- ==========================
---- INSCRIPCIONES
---- ==========================
---- Todos los socios tienen la misma membresía (IdMembresia = 1)
--INSERT INTO Inscripcion (IdSocio, IdMembresia, FechaInscripcion, FechaVencimiento, Estado) VALUES
--(1, 1, '2025-11-01', '2025-11-30', 1), 
--(2, 1, '2025-11-03', '2025-12-02', 1),
--(3, 1, '2025-11-05', '2025-12-04', 1);
--GO

---- ==========================
---- INSCRIPCIÓN - ACTIVIDAD (tabla puente)
---- ==========================
---- Juan (IdInscripcion 1) toma Zumba y GAP
--INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
--(1, 1, 3000.00),  -- Zumba
--(1, 2, 2500.00);  -- GAP

---- Lucía (IdInscripcion 2) toma solo Yoga
--INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
--(2, 4, 2000.00);  -- Yoga

---- Martín (IdInscripcion 3) toma Karate
--INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) VALUES
--(3, 3, 3500.00);  -- Karate
--GO

---- ==========================
---- PAGOS
---- ==========================
---- Juan paga la membresía el 1/11 y luego agrega GAP el 15/11
--INSERT INTO Pago (IdSocio, IdInscripcion, FechaPago, Monto, MetodoPago) VALUES
--(1, 1, '2025-11-01', 12000.00, 'Efectivo'),   -- Pago base membresía
--(1, 1, '2025-11-15', 2500.00, 'Efectivo');    -- Pago por actividad GAP

---- Lucía paga todo junto (membresía + Yoga)
--INSERT INTO Pago (IdSocio, IdInscripcion, FechaPago, Monto, MetodoPago) VALUES
--(2, 2, '2025-11-03', 14000.00, 'Transferencia'); -- 12000 + 2000

---- Martín paga su membresía + Karate
--INSERT INTO Pago (IdSocio, IdInscripcion, FechaPago, Monto, MetodoPago) VALUES
--(3, 3, '2025-11-05', 15500.00, 'Débito'); -- 12000 + 3500
--GO

select IdSocio, DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono, Estado from Socio 

select  DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono  from Socio where IdSocio = 3

select * from Socio

-- Historial de pago
SELECT s.Nombre , s.Apellido,  m.Nombre AS Membresia, p.FechaPago, p.Monto, p.MetodoPago FROM Pago p INNER JOIN Socio s ON p.IdSocio = s.IdSocio INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia;

-- Historial pago de un socio
SELECT s.Nombre , s.Apellido,  m.Nombre AS Membresia, p.FechaPago, p.Monto, p.MetodoPago FROM Pago p INNER JOIN Socio s ON p.IdSocio = s.IdSocio INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia WHERE S.IdSocio = @id;



SELECT s.Nombre + ' ' + s.Apellido AS Socio,m.Nombre AS Membresia, a.NombreActividad AS ActividadExtra, p.FechaPago, p.Monto, p.MetodoPago FROM Pago p INNER JOIN Socio s ON p.IdSocio = s.IdSocio INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad ORDER BY s.Nombre, p.FechaPago;


SELECT S.IdSocio ,S.Nombre, S.Apellido,S.Correo ,I.FechaInscripcion,I.FechaVencimiento, I.Estado FROM Socio S INNER JOIN Inscripcion I ON S.IdSocio = I.IdSocio WHERE I.Estado = 1;

--UPDATE Inscripcion
--SET FechaVencimiento = '2025-11-08'
--WHERE IdSocio = 1;



SELECT COUNT(*) AS CantidadSociosActivos
FROM Socio S
INNER JOIN Inscripcion I ON S.IdSocio = I.IdSocio
WHERE I.Estado = 1;


SELECT SUM(M.PrecioBase + ISNULL(IA.PrecioFinal, 0)) AS TotalIngresos, MONTH(I.FechaInscripcion) AS Mes, YEAR(I.FechaInscripcion) AS Anio FROM Inscripcion I INNER JOIN Membresia M ON I.IdMembresia = M.IdMembresia LEFT JOIN InscripcionActividad IA ON I.IdInscripcion = IA.IdInscripcion WHERE MONTH(I.FechaInscripcion) = 11 AND YEAR(I.FechaInscripcion) = 2025 GROUP BY YEAR(I.FechaInscripcion), MONTH(I.FechaInscripcion);

SELECT 
    SUM(M.PrecioBase + ISNULL(IA.PrecioFinal, 0)) AS TotalIngresos,
    MONTH(I.FechaInscripcion) AS Mes,
    YEAR(I.FechaInscripcion) AS Anio
FROM Inscripcion I
INNER JOIN Membresia M ON I.IdMembresia = M.IdMembresia
LEFT JOIN InscripcionActividad IA ON I.IdInscripcion = IA.IdInscripcion
GROUP BY YEAR(I.FechaInscripcion), MONTH(I.FechaInscripcion)
ORDER BY Anio, Mes;



INSERT INTO Socio (DNI, Nombre, Apellido, Correo, Telefono, Direccion, Barrio, Estado) VALUES (@DNI, @Nombre, @Apellido, @Correo, @Telefono, @Direccion, @Barrio, 1)


---- ==========================
---- MEMBRESÍA (única)
---- ==========================
--INSERT INTO Membresia (Nombre, DuracionDias, PrecioBase) VALUES
--('Pase libre', 30, 36000.00);
select IdMembresia ,Nombre, DuracionDias, PrecioBase from Membresia

---- ==========================
---- ACTIVIDADES EXTRA
---- ==========================
--INSERT INTO ActividadExtra (NombreActividad, PrecioExtra, Descripcion) VALUES
--('Sin actividad extra', 0.00, 'Pase libre'),
--('GAP', 2500.00, 'Entrenamiento enfocado en glúteos, abdominales y piernas'),
--('Karate', 3500.00, 'Clase de artes marciales con técnicas de defensa personal'),
--('Yoga', 2000.00, 'Clase de estiramiento, equilibrio y respiración');
--GO
select IdActividad ,NombreActividad, PrecioExtra, Descripcion from ActividadExtra
select IdActividad ,NombreActividad, PrecioExtra, Descripcion from ActividadExtra

--Consuta para mostrar el pago preciomembrecia y precioExtra
SELECT 
    M.Nombre AS NombreMembresia,
    M.PrecioBase,
    A.NombreActividad,
    A.PrecioExtra
FROM Membresia M, ActividadExtra A
WHERE M.IdMembresia = @idMembresia
  AND A.IdActividad = @idActividad;
 

SELECT 
    i.IdInscripcion,
    m.Nombre AS NombreMembresia,
    i.FechaInscripcion,
    i.FechaVencimiento,
    i.Estado
FROM Inscripcion i
INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia
WHERE i.IdSocio = 1;

SELECT 
    i.IdInscripcion,
    s.Nombre AS NombreSocio,
    s.Apellido AS ApellidoSocio,
    m.Nombre AS NombreMembresia,
    m.PrecioBase,
    a.NombreActividad,
    a.Descripcion,
    a.PrecioExtra,
    ia.PrecioFinal,
    i.FechaInscripcion,
    i.FechaVencimiento,
    i.Estado
FROM Inscripcion i
INNER JOIN Socio s ON i.IdSocio = s.IdSocio
INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia
LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion
LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad
where s.IdSocio = 1;

SELECT  m.Nombre AS NombreMembresia, a.NombreActividad,  a.Descripcion FROM Inscripcion i INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad where i.IdSocio = 1 ORDER BY i.IdInscripcion ASC, a.Descripcion ASC;
SELECT  m.Nombre AS NombreMembresia, a.NombreActividad,  a.Descripcion, i.FechaInscripcion, i.FechaVencimiento FROM Inscripcion i INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad where i.IdSocio = 6 ORDER BY i.IdInscripcion DESC, a.Descripcion DESC;


-- 2️⃣ Buscar la última inscripción del socio
SELECT TOP 1  IdInscripcion = 12
FROM Inscripcion
WHERE IdSocio = 6
ORDER BY IdInscripcion DESC;

-- 3️⃣ Borrar primero los pagos asociados a esa inscripción
DELETE FROM Pago
WHERE IdInscripcion = 12;

-- 4️⃣ Luego borrar las actividades extras asociadas
DELETE FROM InscripcionActividad
WHERE IdInscripcion = 12;

-- 5️⃣ Por último, borrar la inscripción misma
DELETE FROM Inscripcion
WHERE IdInscripcion = 12;


SELECT 
    m.Nombre AS NombreMembresia,
    m.PrecioBase,
    a.NombreActividad,
    a.Descripcion,
    a.PrecioExtra,
    ia.PrecioFinal,
    i.FechaInscripcion,
    i.FechaVencimiento,
    i.Estado
FROM Inscripcion i
INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia
LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion
LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad
WHERE i.IdSocio = 1;