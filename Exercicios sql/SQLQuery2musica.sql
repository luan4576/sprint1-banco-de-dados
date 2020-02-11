--DDL linguagem de definiçao de dados
CREATE DATABASE RoteiroMusica;

USE RoteiroMusica

--criar tabela
CREATE TABLE EstilosMusicais (
	IdMusicas INT PRIMARY KEY IDENTITY,
	Nome	VARCHAR(200) NOT NULL
	);



	CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome	VARCHAR(200) NOT NULL,
	IdMusicas INT FOREIGN KEY REFERENCES EstilosMusicais (IdMusicas)
	);


	SELECT * FROM EstilosMusicais;
	SELECT * FROM Artistas

	--alteracao adicionar coluna NOVA

	ALTER TABLE Artistas
	ADD DataNascimento DATE;

	--alteracao para modificar coluna
	ALTER TABLE Artistas
	ALTER COLUMN Nome CHAR;

	--ALTERAR COLUNA APAGAR

	ALTER TABLE Artistas
	DROP COLUMN Nome;

	--apagar
	DROP TABLE Artistas;

	--alterar adicionar novo atributo

	ALTER TABLE EstilosMusicais
	ADD Descricao VARCHAR(200)

	--excluir banco de dados
	--DROP DATABASE RoteiroMusica;

	--USE MASTER;




	--DML linguagem de manipulaçao de dados

	--comando de inserir dados

	INSERT INTO EstilosMusicais(Nome, Descricao)
	VALUES ('Samba','Estilo Musical'),
		   ('Jazz','Estlos top'),
		   ('Pop','Estilo popular');

		   --inserir dados dentro da chave estrangeira

		   INSERT INTO Artistas (Nome,IdMusicas)
		   VALUES ('Zeca Pagodinho',2),
				  ('Frank',3);


	 --update alterar dados de dentro da tabela
	 UPDATE Artistas
	 SET Nome = 'Alcione'
	 WHERE IdArtista = 1;

	 UPDATE Artistas
	 SET IdMusicas = 1
	 WHERE IdArtista = 2;

	 --delete apagar dados

	 DELETE FROM Artistas
	 WHERE IdArtista = 1;

	 --apaga todos os dados da tabela

	 TRUNCATE TABLE Artistas