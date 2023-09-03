#Criar database, tabelas e afins
CREATE DATABASE DB_CONSULTA_MEDICA;
USE DB_CONSULTA_MEDICA;

CREATE TABLE MEDICO
(
	COD_MEDICO INT NOT NULL,
	NOM_MEDICO VARCHAR(100) NOT NULL,
	PRIMARY KEY (COD_MEDICO)
);

CREATE TABLE CONSULTA
(
	COD_CONSULTA INT NOT NULL,
	DTA_CONSULTA DATE,
	VAL_CONSULTA DECIMAL(20,2) NOT NULL,
	COD_MEDICO INT NOT NULL,
	COD_PACIENTE INT NOT NULL,
	PRIMARY KEY (COD_CONSULTA)
);

CREATE TABLE MEDICO_ESPECIALIDADE
(
	COD_MEDICO_ESPECIALIDADE INT NOT NULL,
	COD_MEDICO INT NOT NULL,
	COD_ESPECIALIDADE SMALLINT NOT NULL,
	PRIMARY KEY (COD_MEDICO_ESPECIALIDADE)
);

CREATE TABLE PACIENTE
(
	COD_PACIENTE INT NOT NULL,
	NOM_PACIENTE VARCHAR(100) NOT NULL,
	PRIMARY KEY (COD_PACIENTE)
);

CREATE TABLE ESPECIALIDADE
(
	COD_ESPECIALIDADE SMALLINT NOT NULL,
	NOM_ESPECIALIDADE VARCHAR(100) NOT NULL,
	PRIMARY KEY (COD_ESPECIALIDADE)
);

# Adicionar FK ou Foreign Keys
ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_MEDICO FOREIGN KEY
(COD_MEDICO)
REFERENCES MEDICO (COD_MEDICO);

ALTER TABLE CONSULTA ADD CONSTRAINT FK_CONSULTA_PACIENTE FOREIGN KEY
(COD_PACIENTE)
REFERENCES PACIENTE (COD_PACIENTE);

ALTER TABLE MEDICO_ESPECIALIDADE ADD CONSTRAINT FK_ME_MEDICO FOREIGN KEY
(COD_MEDICO)
REFERENCES MEDICO (COD_MEDICO);

ALTER TABLE MEDICO_ESPECIALIDADE ADD CONSTRAINT FK_ME_ESPECIALIDADE FOREIGN KEY
(COD_ESPECIALIDADE)
REFERENCES ESPECIALIDADE (COD_ESPECIALIDADE);

#Inserts de dados na tabela
INSERT INTO MEDICO (COD_MEDICO, NOM_MEDICO)
VALUES (1, 'Julia Souza');

INSERT INTO PACIENTE (COD_PACIENTE, NOM_PACIENTE)
VALUES (1, 'João Vitor Souza');

INSERT INTO ESPECIALIDADE (COD_ESPECIALIDADE, NOM_ESPECIALIDADE)
VALUES (1, 'Cardiologia');

INSERT INTO MEDICO_ESPECIALIDADE (COD_MEDICO_ESPECIALIDADE, COD_MEDICO, COD_ESPECIALIDADE)
VALUES (1, 1, 1);

INSERT INTO CONSULTA (COD_CONSULTA, DTA_CONSULTA, VAL_CONSULTA, COD_MEDICO, COD_PACIENTE)
VALUES (1, '2022-07-11', 127.00, 1, 1);