CREATE DATABASE LocadoraDDL;

USE LocadoraDDL

CREATE TABLE Marcas (
IdMarca INT PRIMARY KEY IDENTITY,
Nome VARCHAR(200) NOT NULL
);

CREATE TABLE Modelos (
IdModelo INT PRIMARY KEY IDENTITY,
NomeModelo VARCHAR (200),
IdMarca INT FOREIGN KEY REFERENCES Marcas(IdMarca)
);

CREATE TABLE Veiculos (
IdVeiculo INT PRIMARY KEY IDENTITY,
Placa VARCHAR (200),
IdEmpresa INT FOREIGN KEY REFERENCES Empresas(IdEmpresa),
IdModelo INT FOREIGN KEY REFERENCES Modelos (IdModelo)
);

CREATE TABLE Empresas (
IdEmpresa INT PRIMARY KEY IDENTITY,
Nome VARCHAR (200)
);

CREATE TABLE Alugueis (
IdAluguel INT PRIMARY KEY IDENTITY,
DataInicio DATE,
IdCliente INT FOREIGN KEY REFERENCES Clientes(IdCliente),
DataFim DATE,
IdVeiculo INT FOREIGN KEY REFERENCES Veiculos (IdVeiculo)
);

CREATE TABLE Clientes (
IdCliente INT PRIMARY KEY IDENTITY,
Nome VARCHAR (200),
CPF INT
);


INSERT INTO Marcas(Nome)
VALUES
('Ford'),
('gm');

INSERT INTO Modelos(NomeModelo,IdMarca)
VALUES
('Fiesta',1),
('Onix',2);

INSERT INTO Veiculos(Placa,IdEmpresa,IdModelo)
VALUES
('ABC1234',1,1),
('DEF5678',2,2);

INSERT INTO Empresas(Nome)
VALUES
('Unidas'),
('Localiza');

INSERT INTO Alugueis(DataInicio,IdCliente,DataFim,IdVeiculo)
VALUES
('03/02/2020',1,'09/03/2020',1),
('04/02/2020',2,'10/03/2020',2);

INSERT INTO Clientes(Nome,CPF)
VALUES
('Luan',09876543),
('Lucas',09876578);


