CREATE DATABASE OptusManha;

USE OptusManha

CREATE TABLE Artistas (
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL
	);

	CREATE TABLE Estilos(
	IdEstilo INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL
	);

	CREATE TABLE ALBUNS(
	IdAlbum INT PRIMARY KEY IDENTITY,
	Nome VARCHAR (200),
	IdArtista INT FOREIGN KEY REFERENCES Artistas(IdArtista),
	DataLancamento	DATE,
	IdEstilo INT FOREIGN KEY REFERENCES Estilos(IdEstilo),
	QtdMinutos INT,
	Visualizacao VARCHAR (200)
	);


	CREATE TABLE TiposUsuario(
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo VARCHAR (200)
	);

	CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200),
	Email          VARCHAR(250),
    Senha          VARCHAR(250), 
    Permissao      VARCHAR(200),
	IdTipoUsuario INT FOREIGN KEY REFERENCES TiposUsuario(IdTipoUsuario)
	);

	INSERT INTO Artistas (Nome)
	VALUES ('LuanPj'),
	('DjGuga'),
	('ManoBrow'),
	('Rodolfinho'),
	('Lon');

	INSERT INTO Estilos(Nome)
	VALUES ('Funk'),
	('Rap'),
	('Samba'),
	('Pagode'),
	('Pop');


	INSERT INTO ALBUNS(Nome,IdArtista,DataLancamento,IdEstilo,QtdMinutos,Visualizacao)
	VALUES ('Loko',1,'31/01/2020',1,'9','10'),
	('Zika',2,'31/01/2020',1,'11','9'),
	('Man',3,'13/03/2020',3,'13','8'),
	('Loko',4,'16/05/2020',4,'15','7'),
	('Treze',5,'19/07/2020',5,'16','16');


	INSERT INTO TiposUsuario(Titulo)
	VALUES ('Usuario'),
	('Administrador');


	INSERT INTO Usuarios (Nome,Email,Senha,Permissao,IdTipoUsuario)
	VALUES ('Comum','urubu@123','1234567','usuario',1),
	('Admin','admin@123','123456','admin',2);
	
	UPDATE Artistas
	SET Nome = 'DjMandrake'
	WHERE IdArtista = 2;

	UPDATE TiposUsuario
	SET IdTipoUsuario = 'Comum2'
	WHERE IdTipoUsuario = 1;

	truncate table Artistas


	


	--DQL LINGUAGEM DE CONSULTA DE DADOS



	SELECT * FROM Artistas;
	 
	SELECT Nome FROM Artistas;

	--Operaçoes <> =

	SELECT * FROM ALBUNS WHERE IdAlbum =1;

	SELECT * FROM ALBUNS WHERE IdAlbum  > 1;

	-- OR OU

	--VER SE NAO TEM NADA NULO
	SELECT Nome , QtdMinutos FROM ALBUNS
	WHERE (DataLancamento IS NULL) OR (Visualizacao IS NULL);

	/*COMENTARIO DE BLOCO*/

	-- FILTRO DE TEXTO

	SELECT IdArtista,Nome FROM Artistas
	WHERE Nome LIKE 'LuanPj%'; 
	--luanpj% acha a primeira palavra de uma frase
	--%luanPj acha a ultima palavra
	-- %luanpj% acha os dois ou no meio da frase

	--Ordenaçao

	SELECT IdAlbum,Nome,QtdMinutos FROM ALBUNS
	ORDER BY QtdMinutos;

	--ordenaçao invertida

	SELECT IdAlbum,Nome,QtdMinutos FROM ALBUNS
	ORDER BY QtdMinutos	 DESC;

	--COUNT 

	SELECT COUNT (IdAlbum) FROM ALBUNS;




	SELECT * FROM ALBUNS WHERE IdArtista = 1;

	SELECT * FROM ALBUNS WHERE DataLancamento = '31/01/2020';

	SELECT * FROM ALBUNS WHERE IdEstilo;

	SELECT IdAlbum,IdArtista from ALBUNS
		ORDER BY DataLancamento	 DESC;

	
