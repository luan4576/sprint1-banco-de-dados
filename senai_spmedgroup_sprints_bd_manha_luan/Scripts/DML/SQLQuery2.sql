CREATE DATABASE SpMedGroup_Manha;

USE SpMedGroup_Manha;

CREATE TABLE Enderecos (
		IdEndereco INT PRIMARY KEY IDENTITY,
		Cep CHAR (8) NOT NULL,
		Estado CHAR (2) NOT NULL,
		Rua VARCHAR (200),
		Numero CHAR (10)
		);

CREATE TABLE Especialidades(
		IdEspecialidade INT PRIMARY KEY IDENTITY,
		TipoEspecialidade VARCHAR (200)
		);

CREATE TABLE Situacoes(
		IdSituacao INT PRIMARY KEY IDENTITY,
		TipoSituacao CHAR (3)
		);

CREATE TABLE TipoUsuarios(
		IdTipoUsuario INT PRIMARY KEY IDENTITY,
		TituloTipoUsuario CHAR (3) NOT NULL
		);

CREATE TABLE Clinicas(
		IdClinica INT PRIMARY KEY IDENTITY,
		CNPJ CHAR (14) NOT NULL,
		HorarioFuncionamento VARCHAR (200),
		NomeFantasia VARCHAR (200),
		RazaoSocial VARCHAR (200),
		IdEndereco INT FOREIGN KEY REFERENCES Enderecos (IdEndereco)
		);

CREATE TABLE Usuarios(
		IdUsuario INT PRIMARY KEY IDENTITY,
		Email VARCHAR (200) UNIQUE,
		Senha VARCHAR (200),
		IdTipoUsuario INT FOREIGN KEY REFERENCES TipoUsuarios (IdTipoUsuario)
		);

CREATE TABLE Prontuarios(
		IdProntuario INT PRIMARY KEY IDENTITY,
		NomePaciente VARCHAR (200),
		RG CHAR (9) UNIQUE,
		CPF CHAR (11) UNIQUE,
		Endereco VARCHAR (200),
		DataNascimento DATE ,
		Telefone VARCHAR (200),
		IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario)
		);

CREATE TABLE Medicos(
		IdMedico INT PRIMARY KEY IDENTITY,
		CRM CHAR (10)UNIQUE,
		IdEspecialidade INT FOREIGN KEY REFERENCES Especialidades (IdEspecialidade),
		NomeMedico VARCHAR (200),
		IdClinica INT FOREIGN KEY REFERENCES Clinicas(Idclinica),
		IdUsuario INT FOREIGN KEY REFERENCES Usuarios(IdUsuario)
		);

		CREATE TABLE Consultas(
		IdConsulta INT PRIMARY KEY IDENTITY,
		Descricao VARCHAR (200),
		IdProntuario INT FOREIGN KEY REFERENCES Prontuarios (IdProntuario),
		IdMedico INT FOREIGN KEY REFERENCES Medicos (IdMedico),
		IdSituacao INT FOREIGN KEY REFERENCES Situacoes (IdSituacao)
		);

		INSERT INTO Enderecos(Cep,Estado,Rua,Numero)
		VALUES (11111111,'SP','Alameda Barao de Limeira','539');

		INSERT INTO Especialidades(TipoEspecialidade)
		VALUES ('Acupuntura'),
			   ('Anestesiologia'),
			    ('Angiologia'),
				 ('Cardiologia'),
				  ('Cirurgia Cardiovascular'),
				   ('Cirurgia da Mão'),
				    ('Cirurgia do Aparelho Digestivo'),
					 ('Cirurgia Geral'),
					  ('Cirurgia Pediátrica'),
					   ('Cirurgia Plástica'),
					    ('Cirurgia Torácica'),
						 ('Cirurgia Vascular'),
						  ('Dermatologia'),
						   ('Radioterapia'),
						    ('Urologia'),
							 ('Pediatria'),
							  ('Psiquiatria');

	INSERT INTO Situacoes(TipoSituacao)
	VALUES	('Realizado'),
			('Agendado'),
			('Cancelado');

	INSERT INTO TipoUsuarios(TituloTipoUsuario)
	VALUES	('Administrador'),
			('Medico'),
			('Usuario');

	INSERT INTO Clinicas(CNPJ,HorarioFuncionamento,NomeFantasia,RazaoSocial,IdEndereco)
	VALUES	('11111111'),
			('Medico'),
			('Usuario');


							   

