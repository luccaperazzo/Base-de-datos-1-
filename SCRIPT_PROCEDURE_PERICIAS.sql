--INSERT
CREATE PROCEDURE InsertPersonal3
    @PK_ID_Personal int,
    @Nombre varchar(100),
    @Apellido varchar(100),
    @Legajo varchar(100),
    @Jerarquia varchar(100),
    @Area varchar(100),
    @Email varchar(100),
    @Telefono varchar(100),
    @Usuario varchar(100),
    @Contraseña varchar(100),
    @Permisos varchar(100)
AS
BEGIN
    INSERT INTO dbo.Personal (PK_ID_Personal, Nombre, Apellido, Legajo, Jerarquia, Area, Email, Telefono, Usuario, Contraseña, Permisos)
    VALUES (@PK_ID_Personal, @Nombre, @Apellido, @Legajo, @Jerarquia, @Area, @Email, @Telefono, @Usuario, @Contraseña, @Permisos);
END;

--INSERT
EXEC InsertPersonal3
    @PK_ID_Personal = 32,
    @Nombre = 'John',
    @Apellido = 'Doe',
    @Legajo = 'L001',
    @Jerarquia = 'Manager',
    @Area = 'Informatica',
    @Email = 'john.doe@example.com',
    @Telefono = '123-456-7890',
    @Usuario = 'john_doe',
    @Contraseña = 'password123',
    @Permisos = 'Coordinador';

--UPDATE
CREATE PROCEDURE UpdatePersonal
    @PK_ID_Personal int,
    @Nombre varchar(100),
    @Apellido varchar(100),
    @Legajo varchar(100),
    @Jerarquia varchar(100),
    @Area varchar(100),
    @Email varchar(100),
    @Telefono varchar(100),
    @Usuario varchar(100),
    @Contraseña varchar(100),
    @Permisos varchar(100)
AS
BEGIN
    UPDATE dbo.Personal
    SET
        Nombre = @Nombre,
        Apellido = @Apellido,
        Legajo = @Legajo,
        Jerarquia = @Jerarquia,
        Area = @Area,
        Email = @Email,
        Telefono = @Telefono,
        Usuario = @Usuario,
        Contraseña = @Contraseña,
        Permisos = @Permisos
    WHERE PK_ID_Personal = @PK_ID_Personal;
END;

--UPDATE
EXEC UpdatePersonal 
    @PK_ID_Personal = 32,
    @Nombre = 'UpdatedName',
    @Apellido = 'UpdatedLastName',
    @Legajo = 'UpdatedL001',
    @Jerarquia = 'UpdatedManager',
    @Area = 'Informatica',
    @Email = 'updated.email@example.com',
    @Telefono = '555-555-5555',
    @Usuario = 'updated_user',
    @Contraseña = 'updated_password',
    @Permisos = 'Coordinador';

--BORRADO
CREATE PROCEDURE DeletePersonal
    @PK_ID_Personal int
AS
BEGIN
    DELETE FROM dbo.Personal
    WHERE PK_ID_Personal = @PK_ID_Personal;
END;

-BORRADO
EXEC DeletePersonal @PK_ID_Personal = 32;

CREATE PROCEDURE InsertarPreventora
    @Nombre varchar(100),
    @Telefono varchar(100)
AS
BEGIN
    INSERT INTO Preventora (Nombre, Telefono)
    VALUES (@Nombre, @Telefono);
END

CREATE PROCEDURE InsertarMagistrado
    @Nombre varchar(100),
    @Secretaria varchar(100),
    @Email varchar(100),
    @Direccion varchar(100),
    @Fuero varchar(100),
    @Telefono varchar(100)
AS
BEGIN
    INSERT INTO Magistrado (Nombre, Secretaria, Email, Direccion, Fuero, Telefono)
    VALUES (@Nombre, @Secretaria, @Email, @Direccion, @Fuero, @Telefono);
END;

CREATE PROCEDURE InsertarMaterial
    @PK_ID_Material int,
    @Observaciones varchar(100)
AS
BEGIN
    INSERT INTO Material (PK_ID_Material, Observaciones)
    VALUES (@PK_ID_Material, @Observaciones);
END;

CREATE PROCEDURE InsertarPericiasEstadoActiva
    @PK_ID_ESTADO_ACTIVA int,
    @ID_ESTADO_TIPO varchar(100),
    @Observaciones varchar(100)
AS
BEGIN
    INSERT INTO Pericias_Estado_Activa (PK_ID_ESTADO_ACTIVA, ID_ESTADO_TIPO, Observaciones)
    VALUES (@PK_ID_ESTADO_ACTIVA, @ID_ESTADO_TIPO, @Observaciones);
END;

CREATE PROCEDURE InsertarEstadoTipoFinalizada
    @PK_ESTADO_FINALIZADO int,
    @ID_ESTADO_TIPO varchar(100),
    @Observaciones varchar(100),
    @Archivo varchar(100)
AS
BEGIN
    INSERT INTO Estado_Tipo_Finalizada (PK_ESTADO_FINALIZADO, ID_ESTADO_TIPO, Observaciones, Archivo)
    VALUES (@PK_ESTADO_FINALIZADO, @ID_ESTADO_TIPO, @Observaciones, @Archivo);
END;

CREATE PROCEDURE InsertarRecepcion
    @FK_Personal int,
    @FK_Pericia int,
    @FK_Material int
AS
BEGIN
    INSERT INTO Recepcion (FK_Personal, FK_Pericia, FK_Material)
    VALUES (@FK_Personal, @FK_Pericia, @FK_Material);
END;

CREATE PROCEDURE InsertarPericia
    @PK_ID_Pericia int,
    @Area varchar(100),
    @Fecha_Ingreso date,
    @Causa varchar(100),
    @Ubicacion varchar(100),
    @Caratula varchar(100),
    @Fecha_Finalizacion date,
    @FK_ID_Personal int,
    @FK_ID_Estado_Activo INT,
    @FK_ID_Magistrado int,
    @FK_ID_Preventora int,
    @FK_ID_Estado_Finalizado INT
AS
BEGIN
    INSERT INTO Pericia (PK_ID_Pericia, Area, Fecha_Ingreso, Causa, Ubicacion, Caratula, Fecha_Finalizacion, FK_ID_Personal, FK_ID_Estado_Activo, FK_ID_Magistrado, FK_ID_Preventora, FK_ID_Estado_Finalizado)
    VALUES (@PK_ID_Pericia, @Area, @Fecha_Ingreso, @Causa, @Ubicacion, @Caratula, @Fecha_Finalizacion, @FK_ID_Personal, @FK_ID_Estado_Activo, @FK_ID_Magistrado, @FK_ID_Preventora, @FK_ID_Estado_Finalizado);
END;
-- Execute Insert Procedure for Preventora
EXEC InsertarPreventora 'Preventora3', '123-456-7890'

EXEC InsertarMagistrado 'Magistrado1', 'Secretaria1', 'magistrado1@example.com', 'Direccion1', 'Federal', '111-222-3333';

EXEC InsertarMaterial 12,'Material1';

EXEC InsertarPericiasEstadoActiva 7, 'S/ material', 'Observacion1';

EXEC InsertarEstadoTipoFinalizada 3, 'A la espera de recibo', 'Observacion3', 'Archivo1';
EXEC InsertarRecepcion @FK_Personal = 1, @FK_Pericia = 2, @FK_Material = 3;

EXEC InsertarPericia 
    @PK_ID_Pericia = 253, 
    @Area = 'Informatica', 
    @Fecha_Ingreso = '2024-02-25', 
    @Causa = 'Causa123', 
    @Ubicacion = 'Ubicacion123', 
    @Caratula = 'Caratula123', 
    @Fecha_Finalizacion = '2024-03-01', 
    @FK_ID_Personal = 1, 
    @FK_ID_Estado_Activo = 1, 
    @FK_ID_Magistrado = 1, 
    @FK_ID_Preventora = 1, 
    @FK_ID_Estado_Finalizado = 1;

-- Update data in Preventora table
CREATE PROCEDURE ActualizarPreventora
    @PK_Preventora int,
    @Nombre varchar(100),
    @Telefono varchar(100)
AS
BEGIN
    UPDATE Preventora
    SET Nombre = @Nombre,
        Telefono = @Telefono
    WHERE PK_Preventora = @PK_Preventora;
END;

-- Update data in Magistrado table
CREATE PROCEDURE ActualizarMagistrado
    @PK_ID_Magistrado int,
    @Nombre varchar(100),
    @Secretaria varchar(100),
    @Email varchar(100),
    @Direccion varchar(100),
    @Fuero varchar(100),
    @Telefono varchar(100)
AS
BEGIN
    UPDATE Magistrado
    SET Nombre = @Nombre,
        Secretaria = @Secretaria,
        Email = @Email,
        Direccion = @Direccion,
        Fuero = @Fuero,
        Telefono = @Telefono
    WHERE PK_ID_Magistrado = @PK_ID_Magistrado;
END;

-- Update data in Material table
CREATE PROCEDURE ActualizarMaterial
    @PK_ID_Material int,
    @Observaciones varchar(100)
AS
BEGIN
    UPDATE Material
    SET Observaciones = @Observaciones
    WHERE PK_ID_Material = @PK_ID_Material;
END;


-- Update data in Pericias_Estado_Activa table
CREATE PROCEDURE ActualizarPericiasEstadoActiva
    @PK_ID_ESTADO_ACTIVA int,
    @ID_ESTADO_TIPO varchar(100),
    @Observaciones varchar(100)
AS
BEGIN
    UPDATE Pericias_Estado_Activa
    SET ID_ESTADO_TIPO = @ID_ESTADO_TIPO,
        Observaciones = @Observaciones
    WHERE PK_ID_ESTADO_ACTIVA = @PK_ID_ESTADO_ACTIVA;
END;

-- Update data in Estado_Tipo_Finalizada table
CREATE PROCEDURE ActualizarEstadoTipoFinalizada
    @PK_ESTADO_FINALIZADO int,
    @ID_ESTADO_TIPO varchar(100),
    @Observaciones varchar(100),
    @Archivo varchar(100)
AS
BEGIN
    UPDATE Estado_Tipo_Finalizada
    SET ID_ESTADO_TIPO = @ID_ESTADO_TIPO,
        Observaciones = @Observaciones,
        Archivo = @Archivo
    WHERE PK_ESTADO_FINALIZADO = @PK_ESTADO_FINALIZADO;
END;

-- Update data in Recepcion table
CREATE PROCEDURE ActualizarRecepcion
    @PK_ID_Recepcion int,
    @FK_Personal int,
    @FK_Pericia int,
    @FK_Material int
AS
BEGIN
    UPDATE Recepcion
    SET FK_Personal = @FK_Personal,
        FK_Pericia = @FK_Pericia,
        FK_Material = @FK_Material
    WHERE PK_ID_Recepcion = @PK_ID_Recepcion;
END;

-- Update data in Pericia table
CREATE PROCEDURE ActualizarPericia
    @PK_ID_Pericia int,
    @Area varchar(100),
    @Fecha_Ingreso date,
    @Causa varchar(100),
    @Ubicacion varchar(100),
    @Caratula varchar(100),
    @Fecha_Finalizacion date,
    @FK_ID_Personal int,
    @FK_ID_Estado_Activo INT,
    @FK_ID_Magistrado int,
    @FK_ID_Preventora int,
    @FK_ID_Estado_Finalizado INT
AS
BEGIN
    UPDATE Pericia
    SET Area = @Area,
        Fecha_Ingreso = @Fecha_Ingreso,
        Causa = @Causa,
        Ubicacion = @Ubicacion,
        Caratula = @Caratula,
        Fecha_Finalizacion = @Fecha_Finalizacion,
        FK_ID_Personal = @FK_ID_Personal,
        FK_ID_Estado_Activo = @FK_ID_Estado_Activo,
        FK_ID_Magistrado = @FK_ID_Magistrado,
        FK_ID_Preventora = @FK_ID_Preventora,
        FK_ID_Estado_Finalizado = @FK_ID_Estado_Finalizado
    WHERE PK_ID_Pericia = @PK_ID_Pericia;
END;

EXEC ActualizarPreventora 
    @PK_Preventora = 208, 
    @Nombre = 'random', 
    @Telefono = '0000000000';
EXEC ActualizarMagistrado 
    @PK_ID_Magistrado = 51, 
    @Nombre = 'NuevoNombre', 
    @Secretaria = 'NuevaSecretaria',
    @Email = 'NuevoEmail',
    @Direccion = 'NuevaDireccion',
    @Fuero = 'Federal',
    @Telefono = 'NuevoTelefono';

EXEC ActualizarMaterial 
    @PK_ID_Material = 12, 
    @Observaciones = 'NuevasObservaciones';

EXEC ActualizarPericiasEstadoActiva 
    @PK_ID_ESTADO_ACTIVA = 7, 
    @ID_ESTADO_TIPO = 'S/ puntos de pericia', 
    @Observaciones = 'NuevasObservaciones';

EXEC ActualizarEstadoTipoFinalizada 
    @PK_ESTADO_FINALIZADO = 3, 
    @ID_ESTADO_TIPO = 'Finalizada', 
    @Observaciones = 'NuevasObservaciones',
    @Archivo = 'NuevoArchivo';

EXEC ActualizarRecepcion 
    @PK_ID_Recepcion = 995, 
    @FK_Personal = 2, 
    @FK_Pericia = 3,
    @FK_Material = 4;

EXEC ActualizarPericia 
    @PK_ID_Pericia = 253, 
    @Area = 'Informatica', 
    @Fecha_Ingreso = '2024-02-25', 
    @Causa = 'Causa123', 
    @Ubicacion = 'Ubicacion123', 
    @Caratula = 'Caratula123', 
    @Fecha_Finalizacion = '2024-03-01', 
    @FK_ID_Personal = 1, 
    @FK_ID_Estado_Activo = 1, 
    @FK_ID_Magistrado = 1, 
    @FK_ID_Preventora = 1, 
    @FK_ID_Estado_Finalizado = 1;
-- Delete data from Preventora table
CREATE PROCEDURE EliminarPreventora
    @PK_Preventora int
AS
BEGIN
    DELETE FROM Preventora
    WHERE PK_Preventora = @PK_Preventora;
END;
-- Delete data from Magistrado table
CREATE PROCEDURE EliminarMagistrado
    @PK_ID_Magistrado int
AS
BEGIN
    DELETE FROM Magistrado
    WHERE PK_ID_Magistrado = @PK_ID_Magistrado;
END;

-- Delete data from Material table
CREATE PROCEDURE EliminarMaterial
    @PK_ID_Material int
AS
BEGIN
    DELETE FROM Material
    WHERE PK_ID_Material = @PK_ID_Material;
END;

-- Delete data from Pericias_Estado_Activa table
CREATE PROCEDURE EliminarPericiasEstadoActiva
    @PK_ID_ESTADO_ACTIVA int
AS
BEGIN
    DELETE FROM Pericias_Estado_Activa
    WHERE PK_ID_ESTADO_ACTIVA = @PK_ID_ESTADO_ACTIVA;
END;

-- Delete data from Estado_Tipo_Finalizada table
CREATE PROCEDURE EliminarEstadoTipoFinalizada
    @PK_ESTADO_FINALIZADO int
AS
BEGIN
    DELETE FROM Estado_Tipo_Finalizada
    WHERE PK_ESTADO_FINALIZADO = @PK_ESTADO_FINALIZADO;
END;

-- Delete data from Recepcion table
CREATE PROCEDURE EliminarRecepcion
    @PK_ID_Recepcion int
AS
BEGIN
    DELETE FROM Recepcion
    WHERE PK_ID_Recepcion = @PK_ID_Recepcion;
END;

-- Delete data from Pericia table
CREATE PROCEDURE EliminarPericia
    @PK_ID_Pericia int
AS
BEGIN
    DELETE FROM Pericia
    WHERE PK_ID_Pericia = @PK_ID_Pericia;
END;

EXEC EliminarPreventora 
    @PK_Preventora = 208;

EXEC EliminarMagistrado 
    @PK_ID_Magistrado = 51;

EXEC EliminarMaterial 
    @PK_ID_Material = 12;

EXEC EliminarPericiasEstadoActiva 
    @PK_ID_ESTADO_ACTIVA = 7;

EXEC EliminarEstadoTipoFinalizada 
    @PK_ESTADO_FINALIZADO = 3;

EXEC EliminarRecepcion 
    @PK_ID_Recepcion =995;
EXEC EliminarPericia 
    @PK_ID_Pericia = 253;
