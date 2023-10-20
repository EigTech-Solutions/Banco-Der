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
  maxQtdDispositivosConectados INT NOT NULL,
  minLatenciaRede FLOAT NOT NULL,
  maxLatenciaRede FLOAT NOT NULL
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
  numeroDeSerie CHAR(12) NOT NULL,
  ipMaquina VARCHAR(12) NOT NULL,
  sistemaOperacional VARCHAR(30) NOT NULL,
  tipoDisco VARCHAR(45) NOT NULL,
  capacidadeMemoriaDisco VARCHAR(45) NOT NULL,
  capacidadeMemoriaRam VARCHAR(45) NOT NULL,
  processador VARCHAR(45) NOT NULL,
  status VARCHAR(45) NOT NULL,
  dataCadastro VARCHAR(45) NOT NULL,
  dataDesativamento VARCHAR(45) NULL,
  fkLaboratorio INT,
  fkInstitucional INT NOT NULL,
  FOREIGN KEY (fkLaboratorio) REFERENCES laboratorio (idLaboratorio),
  FOREIGN KEY (fkInstitucional) REFERENCES laboratorio (fkInstitucional)
);

-- Tabela dados_monitoramento
CREATE TABLE IF NOT EXISTS dados_monitoramento (
  idMonitoramento INT AUTO_INCREMENT,
  fkMaquina INT NOT NULL,
  cpu FLOAT NOT NULL,
  disco FLOAT NOT NULL,
  memoriaRam FLOAT NOT NULL,
  latenciaRede FLOAT NOT NULL,
  uploadRede FLOAT NOT NULL,
  downloadRede VARCHAR(45) NOT NULL,
  qtdDispositivosConectados INT NOT NULL,
  fonteEnergia TINYINT NOT NULL, CONSTRAINT chk_fonteEnergia CHECK (fonteEnergia IN (0, 1)),
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
  FOREIGN KEY (fkUsuario) REFERENCES usuario (idUsuario),
  FOREIGN KEY (fkInstitucional) REFERENCES usuario (fkInstitucional),
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
  lido TINYINT  NOT NULL, CONSTRAINT chk_lido CHECK (lido IN (0, 1)),
  PRIMARY KEY (idAlertas, fkMonitoramento, fkMaquina),
  FOREIGN KEY (fkMonitoramento) REFERENCES dados_monitoramento (idMonitoramento),
  FOREIGN KEY (fkMaquina) REFERENCES dados_monitoramento (fkMaquina)
); 