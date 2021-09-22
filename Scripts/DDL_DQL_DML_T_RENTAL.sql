CREATE DATABASE T_RENTAL;
GO

USE T_RENTAL;
GO

------------------------------------------DDL--------------------------------------
CREATE TABLE EMPRESA(
 idEmpresa SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeEmpresa VARCHAR(30) NOT NULL
);
GO

CREATE TABLE MARCA(
 idMarca SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeMarca VARCHAR(20) NOT NULL
);
GO

CREATE TABLE MODELO(
 idModelo SMALLINT PRIMARY KEY IDENTITY(1,1),
 idMarca SMALLINT FOREIGN KEY REFERENCES MARCA(idMarca),
 nomeModelo VARCHAR(25) NOT NULL
);
GO

CREATE TABLE VEICULO(
 idVeiculo SMALLINT PRIMARY KEY IDENTITY(1,1),
 idModelo SMALLINT FOREIGN KEY REFERENCES MODELO(idModelo),
 idEmpresa SMALLINT FOREIGN KEY REFERENCES EMPRESA(idEmpresa),
 placa VARCHAR(10) NOT NULL
);
GO

CREATE TABLE CLIENTE(
 idCLiente SMALLINT PRIMARY KEY IDENTITY(1,1),
 nomeCliente VARCHAR(25) NOT NULL,
 sobrenomeCliente VARCHAR(25) NOT NULL,
 cnhCliente VARCHAR(10) NOT NULL UNIQUE
);
GO

drop table cliente
drop table ALUGUEL


CREATE TABLE ALUGUEL(
 idAluguel SMALLINT PRIMARY KEY IDENTITY(1,1),
 idVeiculo SMALLINT FOREIGN KEY REFERENCES VEICULO(idVeiculo),
 idCliente SMALLINT FOREIGN KEY REFERENCES CLIENTE(idCliente),
 dataInicio DATETIME NOT NULL,
 dataFim DATETIME NOT NULL
);
GO

------------------------------------------DML---------------------------------------
INSERT INTO EMPRESA (nomeEmpresa)
VALUES ('Localiza'), ('Unidas')
GO

INSERT INTO MARCA (nomeMarca)
VALUES ('CHEVROLET'), ('FIAT')
GO

INSERT INTO MODELO (idMarca, nomeModelo)
VALUES (1, 'Cruze'), (1, 'Trail Blazer'), (2,'Toro'), (2,'Uno')
GO

INSERT INTO VEICULO (idModelo, idEmpresa, placa)
VALUES (1, 1, '445566'), (4, 2,'778899')
GO


INSERT INTO CLIENTE (nomeCliente, sobrenomeCliente, cnhCliente)
VALUES ('Lucas','Lopes','4731489989'),('Saulo','Santos','4531989589')
GO

INSERT INTO ALUGUEL (idVeiculo, idCliente, dataInicio, dataFim)
VALUES (1, 1, '12/05/2021 09:00','1/08/2022 09:00' ),(2, 2, '2/09/2021 15:00','23/12/2021 15:00')
GO

------------------------------------------DQL---------------------------------------
SELECT * FROM EMPRESA;
GO
SELECT * FROM MARCA;
GO
SELECT * FROM MODELO;
GO
SELECT * FROM VEICULO;
GO
SELECT * FROM CLIENTE;
GO
SELECT * FROM ALUGUEL;
GO

SELECT ALUGUEL.dataFim, ALUGUEL.dataFim, CLIENTE.nomeCliente, MODELO.nomeModelo FROM ALUGUEL
INNER JOIN CLIENTE
ON ALUGUEL.idCliente = CLIENTE.idCLiente
INNER JOIN VEICULO
ON ALUGUEL.idVeiculo = VEICULO.idVeiculo
INNER JOIN MODELO
ON MODELO.idModelo = VEICULO.idModelo;
GO

SELECT ALUGUEL.dataFim, ALUGUEL.dataFim, CLIENTE.nomeCliente, MODELO.nomeModelo FROM ALUGUEL
INNER JOIN CLIENTE
ON ALUGUEL.idCliente = CLIENTE.idCLiente
INNER JOIN VEICULO
ON ALUGUEL.idVeiculo = VEICULO.idVeiculo
INNER JOIN MODELO
ON MODELO.idModelo = VEICULO.idModelo
WHERE CLIENTE.nomeCliente = 'Lucas';
GO
