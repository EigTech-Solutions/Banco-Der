Create database dataguard;

USE dataguard;



-- Tabela parametros_monitoramento
CREATE TABLE  parametrosMonitoramento (
  idParametrosMonitoramento INT PRIMARY KEY Identity (1,1),
  minCpu FLOAT NOT NULL,
  maxCpu FLOAT NOT NULL,
  minDisco FLOAT NOT NULL,
  maxDisco FLOAT NOT NULL,
  minRam FLOAT NOT NULL,
  maxRam FLOAT NOT NULL,
  minQtdDispositivosConectados INT NOT NULL,
  maxQtdDispositivosConectados INT NOT NULL,
  minLatenciaRede FLOAT NOT NULL,
  maxLatenciaRede FLOAT NOT NULL
);

-- Tabela instituicao
CREATE TABLE instituicao (
  idInstitucional INT PRIMARY KEY Identity,
  nomeInstitucional VARCHAR(50) NOT NULL,
  cnpj CHAR(14) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  cep CHAR(8) NOT NULL,
  numeroEndereco VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) NULL,
  fkParametrosMonitoramento INT NOT NULL,
  FOREIGN KEY (fkParametrosMonitoramento) REFERENCES parametrosMonitoramento (idParametrosMonitoramento)
);

-- Tabela usuario
CREATE TABLE  usuario (
  idUsuario INT IDENTITY,
  fkInstitucional INT ,
  nome VARCHAR(30) NOT NULL ,
  email VARCHAR(100) unique,
  senha VARCHAR(30) NOT NULL,
  telefone VARCHAR(14) NULL,
  PRIMARY KEY (idUsuario, fkInstitucional),
  FOREIGN KEY (fkInstitucional) REFERENCES instituicao (idInstitucional)
);


CREATE TABLE  acesso (
  idAcesso INT PRIMARY KEY IDENTITY ,
  tipoAcesso VARCHAR(20) NOT NULL -- Removido o CHECK
);


-- Tabela acessoUsuario
-- Tabela acessoUsuario
CREATE TABLE acessoUsuario (
  idAcessoUsuario INT IDENTITY,
  fkUsuario INT NOT NULL,
  fkInstitucional INT NOT NULL,
  fkAcesso INT NOT NULL,
  dataAcessoUsuario DATE NOT NULL,
  PRIMARY KEY (idAcessoUsuario),
  FOREIGN KEY (fkUsuario, fkInstitucional) REFERENCES usuario (idUsuario, fkInstitucional),
  FOREIGN KEY (fkAcesso) REFERENCES acesso (idAcesso)
);

-- Tabela laboratorio
CREATE TABLE laboratorio (
  idLaboratorio INT IDENTITY,
  fkInstitucional INT NOT NULL,
  nomeSala VARCHAR(30) NOT NULL,
  numeroSala VARCHAR(3) NOT NULL,
  fkResponsavel INT NOT NULL,
  PRIMARY KEY (idLaboratorio, fkInstitucional),
  FOREIGN KEY (fkInstitucional) REFERENCES instituicao (idInstitucional),
  FOREIGN KEY (fkResponsavel, fkInstitucional) REFERENCES usuario (idUsuario, fkInstitucional)
);




-- Tabela maquina
CREATE TABLE  maquina (
  idMaquina INT PRIMARY KEY Identity,
  numeroDeSerie VARCHAR(30) UNIQUE,
  ipMaquina VARCHAR(12) NOT NULL,
  sistemaOperacional VARCHAR(30) NOT NULL,
  status TINYINT DEFAULT 1 NOT NULL, CONSTRAINT chk_status CHECK (status IN (0, 1)),
  dataCadastro VARCHAR(45) NOT NULL,
  dataDesativamento VARCHAR(45) NULL,
  fkLaboratorio INT,
  fkInstitucional INT NOT NULL,
  FOREIGN KEY (fkLaboratorio, fkInstitucional) REFERENCES laboratorio (idLaboratorio, fkInstitucional)
);


-- Tabela componentes 
CREATE TABLE  componenteMonitorado (
	idComponente INT Identity,
    fkMaquina INT,
    componente VARCHAR(50) NOT NULL, 
    tipo VARCHAR(50), 
    descricaoAdicional VARCHAR(50), 
    modelo VARCHAR(50), 
    marca VARCHAR(50), 
    capacidadeTotal FLOAT NOT NULL, 
	unidadeMedida VARCHAR(10) NOT NULL CHECK (unidadeMedida IN ('GB', 'MB', 'MS', 'GHz', 'INT')),
	FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina),
    PRIMARY KEY (idComponente, fkMaquina)
);

-- Tabela medicoes
CREATE TABLE  medicoes (
  idMonitoramento INT Identity,
  fkMaquina INT NOT NULL,
  fkComponente INT NOT NULL,
  valorConsumido FLOAT NOT NULL,
  dataHora DATETIME NOT NULL,
  PRIMARY KEY (idMonitoramento, fkMaquina, fkComponente), -- Chave primária composta
  FOREIGN KEY (fkComponente, fkMaquina) REFERENCES componenteMonitorado (idComponente, fkMaquina)
);


-- Tabela Alertas
CREATE TABLE  Alertas (
  idAlertas INT Identity,
  tipo VARCHAR(45) NOT NULL,
  lido TINYINT  NOT NULL, CONSTRAINT chk_lido CHECK (lido IN (0, 1)),
  fkMonitoramento INT NOT NULL,
  fkComponente INT NOT NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (idAlertas),
  FOREIGN KEY (fkMonitoramento, fkComponente, fkMaquina) REFERENCES medicoes (idMonitoramento, fkMaquina, fkComponente)
);

 -- Insert na tabela acesso  --
INSERT INTO acesso VALUES
	( 'AdminEigtech'),
	( 'Admin'),
	('Técnico');    

-- Inserindo dados na tabela parametrosMonitoramento
INSERT INTO parametrosMonitoramento (minCpu, maxCpu, minDisco, maxDisco, minRam, maxRam, minQtdDispositivosConectados, maxQtdDispositivosConectados, minLatenciaRede, maxLatenciaRede)
VALUES (75.0, 90.0, 75.0, 90.0, 75.0, 90.0, 3, 5, 100.0, 300.0);

-- Insert da nossa instituição (Eigtech) ao sistema
INSERT INTO instituicao VALUES
	( 'Eigtech' , '00000000000000' , 'eigtechsolutions@gmail.com' , '11912345678' , '01414001' , '595' , '5 minutos da estação Consolação' , 1);
    
INSERT INTO usuario VALUES
( 1 , 'Admim Eigtech' , 'eigtechsolutions@gmail.com' , '2023' , '11912345678');

INSERT INTO acessoUsuario VALUES
	( 1, 1, 1, '2023-11-01');

-- Selecionar dados
SELECT * FROM instituicao;
SELECT * FROM acesso;
