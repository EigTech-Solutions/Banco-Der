CREATE DATABASE IF NOT EXISTS dataguard DEFAULT CHARACTER SET utf8;

USE dataguard;

-- Tabela parametros_monitoramento
CREATE TABLE IF NOT EXISTS parametros_monitoramento (
  idParametrosMonitoramento INT PRIMARY KEY AUTO_INCREMENT,
  minCpu FLOAT NOT NULL,
  maxCpu FLOAT NOT NULL,
  minDisco FLOAT NOT NULL,
  maxDisco FLOAT NOT NULL,
  minRam FLOAT NOT NULL,
  maxRam FLOAT NOT NULL,
  minQtdDispositivosConectados INT NOT NULL,
  maxQtdDispositivosConectados INT NOT NULL
);

-- Tabela instituicao
CREATE TABLE IF NOT EXISTS instituicao (
  idInstitucional INT PRIMARY KEY AUTO_INCREMENT,
  nomeInstitucional VARCHAR(50) NOT NULL,
  cnpj CHAR(14) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(14) NOT NULL,
  cep CHAR(8) NOT NULL,
  numeroEndereco VARCHAR(10) NOT NULL,
  complemento VARCHAR(50) NULL,
  fkParametrosMonitoramento INT NOT NULL,
  FOREIGN KEY (fkParametrosMonitoramento) REFERENCES parametros_monitoramento (idParametrosMonitoramento)
);

-- Tabela usuario
CREATE TABLE IF NOT EXISTS usuario (
  idUsuario INT AUTO_INCREMENT,
  fkInstitucional INT NOT NULL,
  nome VARCHAR(30) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(30) NOT NULL,
  telefone VARCHAR(14) NULL,
  PRIMARY KEY (idUsuario, fkInstitucional),
  FOREIGN KEY (fkInstitucional) REFERENCES instituicao (idInstitucional)
);

-- Tabela laboratorio
CREATE TABLE IF NOT EXISTS laboratorio (
  idLaboratorio INT AUTO_INCREMENT,
  fkInstitucional INT NOT NULL,
  nomeSala VARCHAR(30) NOT NULL,
  numeroSala VARCHAR(3) NOT NULL,
  fkResponsavel INT NOT NULL,
  PRIMARY KEY (idLaboratorio, fkInstitucional),
  FOREIGN KEY (fkInstitucional) REFERENCES instituicao (idInstitucional),
  FOREIGN KEY (fkResponsavel) REFERENCES usuario (idUsuario)
);

-- Tabela maquina
CREATE TABLE IF NOT EXISTS maquina (
  idMaquina INT PRIMARY KEY AUTO_INCREMENT,
  numeroDeSerie CHAR(8) NOT NULL,
  ipMaquina VARCHAR(12) NOT NULL,
  sistemaOperacional VARCHAR(30) NOT NULL,
  tipoDisco VARCHAR(45) NOT NULL,
  capacidadeMemoriaDisco VARCHAR(45) NOT NULL,
  capacidadeMemoriaRam VARCHAR(45) NOT NULL,
  processador VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  dataCadastro VARCHAR(45) NOT NULL,
  dataDesativamento VARCHAR(45) NULL,
  fkLaboratorio INT NOT NULL,
  fkInstitucional INT NOT NULL,
  FOREIGN KEY (fkLaboratorio, fkInstitucional) REFERENCES laboratorio (idLaboratorio, fkInstitucional)
);

-- Tabela dados_monitoramento
CREATE TABLE IF NOT EXISTS dados_monitoramento (
  idMonitoramento INT AUTO_INCREMENT,
  fkMaquina INT NOT NULL,
  cpu FLOAT NOT NULL,
  disco FLOAT NOT NULL,
  memoriaRam FLOAT NOT NULL,
  pingRede FLOAT NOT NULL,
  uploadRede FLOAT NOT NULL,
  downloadRede VARCHAR(45) NOT NULL,
  qtdDispositivosConectados INT NOT NULL,
  fonteEnergia TINYINT NOT NULL,
  dataHora DATETIME NOT NULL,
  PRIMARY KEY (idMonitoramento, fkMaquina),
  FOREIGN KEY (fkMaquina) REFERENCES maquina (idMaquina)
);

-- Tabela acesso
CREATE TABLE IF NOT EXISTS acesso (
  idAcesso INT PRIMARY KEY AUTO_INCREMENT,
  tipoAcesso ENUM('Admin', 'Técnico') NOT NULL
);

-- Tabela acessoUsuario
CREATE TABLE IF NOT EXISTS acessoUsuario (
  idAcessoUsuario INT AUTO_INCREMENT,
  fkUsuario INT NOT NULL,
  fkInstitucional INT NOT NULL,
  fkAcesso INT NOT NULL,
  dataAcessoUsuario DATE NOT NULL,
  PRIMARY KEY (idAcessoUsuario, fkUsuario, fkInstitucional, fkAcesso),
  FOREIGN KEY (fkUsuario, fkInstitucional) REFERENCES usuario (idUsuario, fkInstitucional),
  FOREIGN KEY (fkAcesso) REFERENCES acesso (idAcesso)
);

-- Tabela Alertas
CREATE TABLE IF NOT EXISTS Alertas (
  idAlertas INT AUTO_INCREMENT,
  tipo VARCHAR(45) NOT NULL,
  componente VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL,
  dataHora DATETIME NOT NULL,
  fkMonitoramento INT NOT NULL,
  fkMaquina INT NOT NULL,
  PRIMARY KEY (idAlertas, fkMonitoramento, fkMaquina),
  FOREIGN KEY (fkMonitoramento, fkMaquina) REFERENCES dados_monitoramento (idMonitoramento, fkMaquina)
);


-- fazendo insert nas tabelas --


-- insert na tabela parametros_monitoramento --
insert into parametros_monitoramento values
(null , 18.5 , 90 , 25 , 85 , 20 , 90 , 1 , 3 ),
(null , 20.5 , 80 , 31.5 , 85.5 , 21.7 , 92.2 , 2 , 3 ),
(null , 21.5 , 82 , 30 , 80.5 , 20.5 , 95 , 2 , 2 ),
(null , 18.5 , 90 , 25 , 85 , 20 , 90 , 1 , 3 ),
(null , 18 , 85 , 20 , 85.2 , 25 , 92.7 , 2 , 2 );




-- insert na tabela instituicao --
insert into instituicao values
(null , 'ETEC guaianases' , '84810704000110' , 'etec.guaianases@gmail.com' , '11933791155' , '02261000' , '598' , 'ao lado do mequi1000' , 1 ),
(null , 'ETEC tiradentes' , '74810704000111' , 'etec.tiradentes@gmail.com' , '11931791556' , '02362000' , '102' , 'na frente da praça' , 2 ),
(null , 'ETEC parada inglesa' , '64810704000112' , 'etec.paradaInglesa@gmail.com' , '11932791457' , '02465000' , '55' , 'ao lado do posto Shell' , 3 ),
(null , 'ETEC carandiru' , '54810704000113' , 'etec.carandiru@gmail.com' , '11934791358' , '02566000' , '22' , 'na esquina da av. zarki narchi' , 4 ),
(null , 'ETEC jorge street' , '44810704000114' , 'etec.jorgeStreet@gmail.com' , '11935791259' , '02668000' , '1298' , 'dentro do parque' , 5 );



-- insert na tabela usuario --
insert into usuario values
(null , 1 , 'enzo stane' , 'enzin@gmail.com' , '2207' , '11933791155'),
(null , 2 , 'joao noleto' , 'noleto@gmail.com' , '1234' , '11931791956'),
(null , 1 , 'pedro padro' , 'pedro@gmail.com' , '0000' , '11932791857'),
(null , 3 , 'caua ribeiro' , 'ribeiro@gmail.com' , '9876' , '11934791758'),
(null , 4 , 'khauany tenorio' , 'kakau@gmail.com' , '7777' , '11935791659'),
(null , 1 , 'inacio oliveira' , 'inacio@gmail.com' , '0101' , '11936791550');



-- insert na tabela laboratorio --
insert into laboratorio values
(null , 1 , 'laboratorio de codigos' , '3',1),
(null , 1 , 'laboratorio de codigos' , '3',1),
(null , 1 , 'laboratorio de codigos' , '3',1),
(null , 1 , 'laboratorio de codigos' , '3',1),

-- Tabela laboratorio
CREATE TABLE IF NOT EXISTS laboratorio (
  idLaboratorio INT AUTO_INCREMENT,
  fkInstitucional INT NOT NULL,
  nomeSala VARCHAR(30) NOT NULL,
  numeroSala VARCHAR(3) NOT NULL,
  fkResponsavel INT NOT NULL,
  PRIMARY KEY (idLaboratorio, fkInstitucional),
  FOREIGN KEY (fkInstitucional) REFERENCES instituicao (idInstitucional),
  FOREIGN KEY (fkResponsavel) REFERENCES usuario (idUsuario)
);