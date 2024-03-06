create database parcial_real
go

use parcial_real
go

CREATE TABLE dbo.Personal
(
    PK_ID_Personal int PRIMARY KEY,
    Nombre varchar(100) NOT NULL,
    Apellido varchar(100) NOT NULL,
    Legajo varchar(100) NOT NULL,
    Jerarquia varchar(100) NOT NULL,
    Area varchar(100) CHECK (Area IN ('Informatica','Electronica','Transcripciones')) NOT NULL,
    Email varchar(100) NOT NULL,
    Telefono varchar(100) NULL,
    Usuario varchar(100) NOT NULL,
    Contraseña varchar(100) NOT NULL,
    Permisos varchar(100) CHECK (Permisos IN ('Coordinador','Perito','Jefes')) NOT NULL
);

CREATE TABLE dbo.Pericia
(
    PK_ID_Pericia int PRIMARY KEY,
	Area varchar(100) CHECK(Area IN('Informatica','Electronica','Transcripciones')),
	Fecha_ingreso date NOT NULL,
	Causa varchar(100) NOT NULL,
	Ubicacion varchar(100) NOT NULL,
	Caratula varchar(100) NOT NULL,
	Fecha_finalizacion date,
	FK_ID_Personal int,
	FK_ID_Estado_Activo INT NULL,
	FK_ID_Magistrado int,
    FK_ID_Preventora int,
	FK_ID_Estado_Finalizado INT NULL
);

CREATE TABLE dbo.Magistrado
(
    PK_ID_Magistrado int identity (1,1) PRIMARY KEY,
    Nombre varchar(100) NOT NULL,
	Secretaria varchar(100),
    Email varchar(100) NULL,
    Direccion varchar(100) NOT NULL,
    Fuero varchar(100) CHECK ( Fuero IN('Federal','Ordinario')) NOT NULL,
    Telefono varchar(100) NULL
);

CREATE TABLE dbo.Preventora
(
    PK_Preventora int IDENTITY (1,1) PRIMARY KEY,
    Nombre varchar(100) NOT NULL,
    Telefono varchar(100) NOT NULL,
);


CREATE TABLE dbo.Recepcion
(
    PK_ID_Recepcion int identity(1,1) PRIMARY KEY,
    FK_Personal int NOT NULL,
    FK_Pericia int NOT NULL,
    FK_Material int NOT NULL,
);


CREATE TABLE dbo.Material
(
    PK_ID_Material int PRIMARY KEY,
    Observaciones varchar(100) NOT NULL
);

CREATE TABLE dbo.Pericias_Estado_Activa
(
    PK_ID_ESTADO_ACTIVA int PRIMARY KEY NOT NULL,
    ID_ESTADO_TIPO varchar(100) CHECK(ID_ESTADO_TIPO IN('S/ material','S/ puntos de pericia','S/ material y puntos',
									 'C/Fecha guardia A','C/ fecha guardia B','Asignada a perito')) NOT NULL,
    Observaciones varchar(100) NOT NULL
);

CREATE TABLE dbo.Estado_Tipo_Finalizada
(
    PK_ESTADO_FINALIZADO int PRIMARY KEY NOT NULL,
	ID_ESTADO_TIPO varchar(100) CHECK(ID_ESTADO_TIPO IN('A la espera de recibo','Finalizada')) NOT NULL,
    Observaciones varchar(100) NOT NULL,
	Archivo varchar(100) NOT NULL
);


-- Creación de las restricciones de clave externa

-- Agregar clave foránea a la tabla Pericia que referencia a la tabla Personal
ALTER TABLE dbo.Pericia
ADD CONSTRAINT FK_Pericia_Personal FOREIGN KEY (FK_ID_Personal)
REFERENCES dbo.Personal(PK_ID_Personal);

-- Agregar clave foránea a la tabla Pericia que referencia a la tabla Magistrado
ALTER TABLE dbo.Pericia
ADD CONSTRAINT FK_Pericia_Magistrado FOREIGN KEY (FK_ID_Magistrado)
REFERENCES dbo.Magistrado(PK_ID_Magistrado);

-- Agregar clave foránea a la tabla Pericia que referencia a la tabla Pericias_Estado_Activa
ALTER TABLE dbo.Pericia
ADD CONSTRAINT FK_Pericia_Pericias_Estado_Activa FOREIGN KEY (FK_ID_Estado_Activo)
REFERENCES dbo.Pericias_Estado_Activa(PK_ID_ESTADO_ACTIVA)

-- Agregar clave foránea a la tabla Pericia que referencia a la tabla Estado_Tipo_Finalizada
ALTER TABLE dbo.Pericia
ADD CONSTRAINT FK_Pericia_Estado_Tipo_Finalizada FOREIGN KEY (FK_ID_Estado_Finalizado)
REFERENCES dbo.Estado_Tipo_Finalizada(PK_ESTADO_FINALIZADO);

-- Agregar clave foránea a la tabla Preventora que referencia a la tabla Pericia
ALTER TABLE dbo.Pericia
ADD CONSTRAINT FK_Preventora_Pericia FOREIGN KEY (FK_ID_Preventora)
REFERENCES dbo.Preventora(PK_Preventora);

-- Agregar clave foránea a la tabla Recepcion que referencia a la tabla Personal
ALTER TABLE dbo.Recepcion
ADD CONSTRAINT FK_Recepcion_Personal FOREIGN KEY (FK_Personal)
REFERENCES dbo.Personal(PK_ID_Personal);

-- Agregar clave foránea a la tabla Recepcion que referencia a la tabla Pericia
ALTER TABLE dbo.Recepcion
ADD CONSTRAINT FK_Recepcion_Pericia FOREIGN KEY (FK_Pericia)
REFERENCES dbo.Pericia(PK_ID_Pericia);

-- Agregar clave foránea a la tabla Recepcion que referencia a la tabla Material
ALTER TABLE dbo.Recepcion
ADD CONSTRAINT FK_Recepcion_Material FOREIGN KEY (FK_Material)
REFERENCES dbo.Material(PK_ID_Material);