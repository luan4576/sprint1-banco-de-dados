-- Cria o banco de dados com o nome Gufi
CREATE DATABASE Gufi_Manha;
GO

-- Define o banco de dados que será utilizado
USE Gufi_Manha;
GO

-- Criação das tabelas
CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY
	,TituloTipoUsuario VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE TipoEvento (
	IdTipoEvento INT PRIMARY KEY IDENTITY
	,TituloTipoEvento VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Instituicao (
	IdInstituicao INT PRIMARY KEY IDENTITY
	,CNPJ CHAR(14) NOT NULL UNIQUE
	,NomeFantasia VARCHAR (255) NOT NULL UNIQUE
	,Endereco VARCHAR (255) NOT NULL UNIQUE
);
GO

CREATE TABLE Usuario (
	IdUsuario INT PRIMARY KEY IDENTITY
	,Nome VARCHAR (255) NOT NULL
	,Email VARCHAR (255) NOT NULL UNIQUE
	,Senha VARCHAR (255) NOT NULL
	,DataCadastro DATETIME2 
	,Genero VARCHAR (255)
	,IdTipousuario INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);
GO

CREATE TABLE Evento (
	IdEvento INT PRIMARY KEY IDENTITY
	,NomeEvento VARCHAR (255) NOT NULL
	,DataEvento DATETIME2 NOT NULL
	,Descricao VARCHAR (255) NOT NULL
	,AcessoLivre BIT DEFAULT (1) NOT NULL
	,IdInstituicao INT FOREIGN KEY REFERENCES Instituicao (IdInstituicao)
	,IdTipoEvento INT FOREIGN KEY REFERENCES TipoEvento (IdTipoEvento)
);
GO

CREATE TABLE Presenca (
	IdPresenca INT PRIMARY KEY IDENTITY
	,IdUsuario INT FOREIGN KEY REFERENCES Usuario (IdUsuario)
	,IdEvento INT FOREIGN KEY REFERENCES Evento (IdEvento)
	,Situacao VARCHAR (255) NOT NULL
);
GO




INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES
		('Administrador'),
		('Comum');

INSERT INTO TipoEvento (TituloTipoEvento)
VALUES 
		('C#'),
		('React'),
		('Sql');

INSERT INTO Instituicao(CNPJ,NomeFantasia,Endereco)
VALUES
		('11111111111111','Escola-Sena-de-informatica','Alameda-Barao-de-Limeira-538');

INSERT INTO Usuario(IdTipousuario,Nome,Email,Senha,DataCadastro,Genero,IdTipousuario)
VALUES
		('Administrador','adm@adm.com','adm123','06/02/2020','Nao Informado',1),
		('Carol','carol@email.com','carol123','06/02/2020','Feminino',2),
		('Saulo','saulo@email.com','saulo123','06/02/2020','Masculino',2);

INSERT INTO Evento(NomeEvento,DataEvento,Descricao,AcessoLivre,IdInstituicao,IdTipoEvento)
VALUES
		('Orientaçao a Objeto','07/02/2020','concceitos sobre pilares da proramaçao',1,1,1),
		('Ciclo de vida','08/02/2020','como usar react',0,1,2),
		('Introduçao a sql','09/02/2020','comandos basicos sql',1,1,3);

INSERT INTO Presenca(Situacao,IdUsuario,IdEvento)
VALUES
		('Confirmada',2,2),
		('Nao confirmada',2,3),
		('Confirmada',3,1);
