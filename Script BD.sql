create database EigTech;
drop database EigTech;
use EigTech;

-- tabela da instituição --

 create table instituição(
 idInstitucional int primary key auto_increment,
 nomeInstitucional varchar(45),
 CNPJ char(14),
 email varchar(35),
 telefone char(14),
 cep char(8),
 numeroEndereço int,
 complemento varchar(35)
 );
 
 
 -- tabela dos usuarios  --
 
  create table usuarios(
 idUsuario int primary key auto_increment,
 fkInstitucional int,
 constraint fkInstitucional foreign key (fkInstitucional) references instituição (idInstitucional),
 nome varchar(30), 
 email varchar(35),
 telefone char(14),
 senha varchar(15)
 );
 
 
  -- tabela dos acessos  --
  
  create table acesso(
  idAcesso int primary key auto_increment,
  tipoAcesso varchar(15),
  constraint chkAcesso check(tipoAcesso in ('administrador', 'técnico'))
  );
  
  
  -- tabela acesso/usuario --
 
  create table acessoUsuario(
 idAcessoUsuario int primary key auto_increment,
 fkUsuario int,
 constraint fkUsuario foreign key (fkUsuario) references usuarios (idUsuario),
 fkAcesso int,
 constraint fkAcesso foreign key (fkAcesso) references acesso (idAcesso),
 dataAcesso date
 );

 
 
  -- tabela laboratório  --
 
  
  create table laboratorio(
  idLaboratorio int primary key auto_increment,
  nomeSala varchar(20),
  numeroSala int,
  fkInstitucionalLab int,
  constraint fkInstitucionalLab foreign key (fkInstitucionalLab) references instituição (idInstitucional),
  fkResponsavel int,
  constraint fkResponsavel foreign key (fkResponsavel) references usuarios (idUsuario)
  );
 
 
   -- tabela maquina  --
   
   create table maquina(
   idMaquina int primary key auto_increment,
   numeroSerie char(8),
   ipMaquina varchar(12),
   sistemaOperacional varchar(30),
   capacidadeMemoria int,
   processador varchar(45),
   tipoDisco varchar(20),
   statusMaquina varchar(10),
   constraint chkStatusMaquina check (statusMaquina in('ativo' , 'inativo')),
   fkLaboratorio int,
  constraint fkLaboratorio foreign key (fkLaboratorio) references laboratorio (idLaboratorio)
   );
   
   
 -- tabela dados_monitoramento --
 
 create table dados_monitoramento(
   idMaquina int primary key auto_increment,
   dataHora datetime,
   dadoCPU float,
   dadoMemoria float,
   dadoDisco float,
   dadoRede float,
   dispositivosConectados int,
   fonteEnergia boolean
   );
   
   
 
 