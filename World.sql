USE [master];
GO

CREATE DATABASE World;

USE World;
GO

CREATE SCHEMA World;

IF OBJECT_ID('World.Country') IS NOT NULL
	IF OBJECT_ID('World.FK_Continent_IdContinent') IS NOT NULL
		ALTER TABLE World.Country
			DROP CONSTRAINT FK_Continent_IdContinent;
GO

IF OBJECT_ID('World.[State]') IS NOT NULL
	IF OBJECT_ID('World.FK_Country_IdCountry') IS NOT NULL
		ALTER TABLE World.[State]
			DROP CONSTRAINT FK_Country_IdCountry;
GO

IF OBJECT_ID('World.City') IS NOT NULL
	IF OBJECT_ID('World.FK_State_IdState') IS NOT NULL
		ALTER TABLE World.City
			DROP CONSTRAINT FK_State_IdState;
GO

IF OBJECT_ID('World.Colony') IS NOT NULL
	IF OBJECT_ID('World.FK_City_IdCity') IS NOT NULL
		ALTER TABLE World.Colony
			DROP CONSTRAINT FK_City_IdCity;
GO

IF OBJECT_ID('World.Continent') IS NOT NULL
	DROP TABLE World.Continent;

CREATE TABLE World.Continent (
     Id         INT IDENTITY (1,1) NOT NULL
    ,[Name]     VARCHAR      (100) NOT NULL
    ,CreateUser INT                    NULL
	,CreateDate DATETIME               NULL
	,EditUser   INT                    NULL
	,EditDate   DATETIME               NULL
    ,Active     BIT                    NULL
    ,CONSTRAINT Pk_Continent_Id PRIMARY KEY (Id)
);

IF OBJECT_ID('World.Country') IS NOT NULL
	DROP TABLE World.Country;

CREATE TABLE World.Country (
     Id          INT IDENTITY (1,1) NOT NULL
    ,IdContinent INT                NOT NULL
    ,[Name]      VARCHAR      (100) NOT NULL
    ,CreateUser  INT                    NULL
	,CreateDate  DATETIME               NULL
	,EditUser    INT                    NULL
	,EditDate    DATETIME               NULL
    ,Active      BIT                    NULL
    ,CONSTRAINT  Pk_Country_Id PRIMARY KEY (Id)
    ,CONSTRAINT  FK_Continent_IdContinent FOREIGN KEY (IdContinent) REFERENCES World.Continent (Id)
);

IF OBJECT_ID('World.[State]') IS NOT NULL
	DROP TABLE World.[State];

CREATE TABLE World.[State] (
     Id         INT IDENTITY (1,1) NOT NULL
    ,IdCountry  INT                NOT NULL
    ,[Name]     VARCHAR      (100) NOT NULL
    ,CreateUser INT                    NULL
	,CreateDate DATETIME               NULL
	,EditUser   INT                    NULL
	,EditDate   DATETIME               NULL
    ,Active     BIT                    NULL
    ,CONSTRAINT Pk_State_Id PRIMARY KEY (Id)
    ,CONSTRAINT FK_Country_IdCountry FOREIGN KEY (IdCountry) REFERENCES World.Country (Id)
);

IF OBJECT_ID('World.City') IS NOT NULL
	DROP TABLE World.City;

CREATE TABLE World.City (
     Id         INT IDENTITY (1,1) NOT NULL
    ,IdState    INT                NOT NULL
    ,[Name]     VARCHAR      (100) NOT NULL
    ,CreateUser INT                    NULL
	,CreateDate DATETIME               NULL
	,EditUser   INT                    NULL
	,EditDate   DATETIME               NULL
    ,Active     BIT                    NULL
    ,CONSTRAINT Pk_City_Id PRIMARY KEY (Id)
    ,CONSTRAINT FK_State_IdState FOREIGN KEY (IdState) REFERENCES World.[State] (Id)
);

IF OBJECT_ID('World.Colony') IS NOT NULL
	DROP TABLE World.Colony;

CREATE TABLE World.Colony (
     Id         INT IDENTITY (1,1) NOT NULL
    ,IdCity     INT                NOT NULL
    ,[Name]     VARCHAR      (100) NOT NULL
    ,CreateUser INT                    NULL
	,CreateDate DATETIME               NULL
	,EditUser   INT                    NULL
	,EditDate   DATETIME               NULL
    ,Active     BIT                    NULL
    ,CONSTRAINT Pk_Colony_Id PRIMARY KEY (Id)
    ,CONSTRAINT FK_City_IdCity FOREIGN KEY (IdCity) REFERENCES World.City (Id)
);

INSERT INTO World.Continent ([Name])
    VALUES ('Europa')
INSERT INTO World.Continent ([Name])
    VALUES ('Asia')
INSERT INTO World.Continent ([Name])
    VALUES ('África')
INSERT INTO World.Continent ([Name])
    VALUES ('América del Norte')
INSERT INTO World.Continent ([Name])
    VALUES ('América Central')
INSERT INTO World.Continent ([Name])
    VALUES ('América del Sur')
INSERT INTO World.Continent ([Name])
    VALUES ('Oceanía')
INSERT INTO World.Continent ([Name])
    VALUES ('Antártida')

INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Albania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Alemania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Andorra')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Austria')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Bélgica')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Bielorrusia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Bosnia-Herzegovina')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Bulgaria')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Chipre')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Croacia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Dinamarca')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Eslovaquia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Eslovenia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'España')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Estonia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Finlandia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Francia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Grecia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Hungría')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Irlanda')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Islandia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Italia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Kosovo')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Letonia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Liechtenstein')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Lituania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Luxemburgo')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Macedonia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Malta')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Moldavia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Mónaco')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Montenegro')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Noruega')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Países Bajos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Polonia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Portugal')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Reino Unido')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'República Checa')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Rumania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Rusia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'San Marino')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Serbia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Suecia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Suiza')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Ucrania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (1,'Vaticano')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Afganistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Arabia Saudita')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Armenia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Azerbaiyán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Bangladés')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Baréin')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Birmania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Brunéi')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Bután')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Camboya')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Catar')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'China')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Corea del Norte')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Corea del Sur')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Emiratos Árabes Unidos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Filipinas')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Georgia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'India')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Indonesia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Irak')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Irán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Israel')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Japón')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Jordania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Kazajistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Kirguistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Kuwait')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Laos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Líbano')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Malasia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Maldivas')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Mongolia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Nepal')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Omán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Pakistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Palestina')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Singapur')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Siria')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Sri Lanka')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Tailandia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Taiwán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Tayikistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Turkmenistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Turquía')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Uzbekistán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Vietnam')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (2,'Yemen')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Angola')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Argelia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Benín')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Botsuana')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Burkina Faso')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Burundi')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Cabo Verde')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Camerún')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Chad')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Comoras')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Congo')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Costa de Marfil')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Egipto')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Eritrea')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Etiopía')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Gabón')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Gambia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Ghana')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Guinea')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Guinea Ecuatorial')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Guinea-Bisáu')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Kenia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Lesoto')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Liberia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Libia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Madagascar')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Malaui')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Malí')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Marruecos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Mauricio')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Mauritania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Mozambique')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Namibia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Níger')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Nigeria')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'República Centroafricana')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'República Democrática del Congo')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Ruanda')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Santo Tomé y Príncipe')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Senegal')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Seychelles')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Sierra Leona')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Somalia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Suazilandia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Sudáfrica')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Sudán')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Sudán del Sur')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Tanzania')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Togo')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Túnez')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Uganda')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Yibuti')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Zambia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (3,'Zimbabue')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (4,'Canadá')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (4,'Estados Unidos de América')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (4,'Estados Unidos Mexicanos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Antigua y Barbuda')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Bahamas')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Barbados')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Belice')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Costa Rica')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Cuba')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Dominica')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'El Salvador')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Grenada')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Guatemala')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Haití')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Honduras')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Jamaica')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Nicaragua')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Panamá')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Puerto Rico')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'República Dominicana')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'San Cristóbal y Nevis')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'San Vicente y Granadinas')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Santa Lucía')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (5,'Trinidad y Tobago')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Argentina')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Bolivia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Brasil')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Chile')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Colombia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Ecuador')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Guyana')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Guayana Francesa')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Paraguay')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Perú')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Surinam')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Uruguay')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (6,'Venezuela')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Australia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Fiyi')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Islas Marshall')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Islas Salomón')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Kiribati')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Micronesia')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Nauru')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Nueva Zelanda')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Palaos')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Papúa Nueva Guinea')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Samoa')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Timor Oriental')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Tonga')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Tuvalu')
INSERT INTO World.Country (IdContinent,[Name])
    VALUES (7,'Vanuatu')
