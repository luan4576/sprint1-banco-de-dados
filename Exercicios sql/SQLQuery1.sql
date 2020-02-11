--comando para criar banco de dados
--DDL linguagem de definiçao de dados
CREATE DATABASE Roteirolivros;

USE Roteirolivros;

CREATE TABLE Generos (
	IdGenero INT PRIMARY KEY IDENTITY,
	Nome	VARCHAR(200) NOT NULL
	);

CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	NomeAutor VARCHAR(200)
	);

	CREATE TABLE Livros (
	IdLivro  INT PRIMARY KEY IDENTITY,
	Titulo   VARCHAR(255),
	IdGenero INT FOREIGN KEY REFERENCES Generos (IdGenero),
	IdAutor  INT FOREIGN KEY REFERENCES Autores (IdAutor)
	);


	--DQL comando de consulta
	SELECT * FROM Autores;
	SELECT * FROM Generos;
	SELECT * FROM Livros;

	--alteracao adicionar coluna NOVA

	ALTER TABLE Generos
	ADD DataNascimento DATE;

	--alteracao para modificar coluna
	ALTER TABLE Generos
	ALTER COLUMN Nome CHAR;

	--ALTERAR COLUNA APAGAR

	ALTER TABLE Generos
	DROP COLUMN Nome;

	--apagar
	DROP TABLE Generos