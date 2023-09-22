create database EigTech;
drop database EigTech;
use EigTech;

-- tabela da instituição --

 create table instituição(
 idInstitucional int primary key auto_increment,
 nomeInstitucional varchar(45),
 CNPJ char(14),
 email varchar(35),
 telefone char(11),
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
   fonteEnergia boolean,
   fkMaquina int,
  constraint fkMaquina foreign key (fkMaquina) references maquina (idMaquina)
   );
   
   
   
   -- insert tabela instituição --
   
   insert into instituição values
(null , 'ETEC Guaianases' , '27686188000120' , 'ETECGuaianases_01@gmail.com' , '11933791155' , '02268000' , 598 , 'ao lado do Burguer King' ),
(null , 'ETEC Cidade Tiradentes' , '27444188000110' , 'ETECcidadeTiradentes@gmail.com' , '11985791120' , '02238001' , 124 , 'ao lado do Burguer King' ),
(null , 'ETEC jorge Street' , '31683285000120' , 'ETECstreet@gmail.com' , '11952797706' , '03166020' , 652 , 'ao lado do Burguer King' ),
(null , 'ETEC Santa Efigênia' , '17626181000120' , 'ETECsantaEfi_01@gmail.com' , '11932170645' , '02123001' , 3011 , 'ao lado do Burguer King' ),
(null , 'ETEC Parada Inglesa' , '5763617700120' , 'ETECP.I.01@gmail.com' , '11931197690' , '07767000' , 22 , 'ao lado do Burguer King' ),
(null , 'ETEC Vila Guilherme' , '77606191000120' , 'ETECvilaGUi_01@gmail.com' , '11933001555' , '02245011', 179 , 'ao lado do Burguer King' );

   
   -- insert tabela usuario -- 
   
    insert into usuarios values
(null , 1, 'Inacio Oliveira' , 'InacioOliv_01@gmail.com' , '11912396600' , 'inacio0101' ),
(null , 2 , 'João Noleto' , 'jão@gmail.com' , '11954790731' , '123456' ),
(null , 3 , 'Kauany Tenorio' , 'kakau@gmail.com' , '11955590904' , 'kakau33' ),
(null , 1 , 'Enzo Stane' , 'enzin22@gmail.com' , '11933791155' , 'enzin2207' ),
(null , 6 , 'Pedro Prado' , 'PadroPedro@gmail.com' , '11946510999' , 'chocho' ),
(null , 4 , 'Cauã Ribeiro' , 'ribeiro007@gmail.com' , '11922791114' , 'ribeiro11' ),
(null , 5 , 'Emilly Oliveira' , 'milly1002@gmail.com' , '11953850082' , '10022022' );
 
 
  -- insert tabela acesso --
  
  insert into acesso values
(null , 'administrador' ),
(null ,'técnico' );


   -- insert tabela acessoUsuario --
   
    insert into acessoUsuario values
(null , 1 , 1 , '23-09-11' ),
(null , 2 , 2 , '23-09-15' ),
(null , 3 , 1 , '23-09-01' ),
(null , 4 , 2 , '23-06-04' ),
(null , 5 , 2 , '23-07-24' ),
(null , 6 , 1 , '23-08-21' );
   
   
    -- insert tabela laboratorio -- 
    
    insert into laboratorio values
(null ,'laboratório ', 6 ,1 ,1 ),
(null ,'sala de estudos', 1 ,2 ,2 ),
(null ,'laboratório ', 2 ,1 ,1 ),
(null ,'laboratório ', 2 , 3 ,3 ),
(null ,'sala de estudos', 10 , 4 ,4 ),
(null ,'laboratório ', 5 , 2 ,5 ),
(null ,'biblioteca', 4 , 5 ,6 );    
    
     -- insert tabela maquina --
     
     insert into maquina values
(null ,'14C456H1', '123452789123','linux' , 16 , 'intel core i5', 'SSD','ativo' , 1 ),
(null ,'15V152A3', '104451709177','Windows' , 8 , 'intel core i7', 'SSD','inativo' , 1 ),
(null ,'46N651S0', '427054789194','Windows' , 8 , 'intel core i5', 'HD','ativo' , 2 ),
(null ,'68Y854D9', '591456709111','linux' , 32 , 'intel core i5', 'SSD','ativo', 1 ),
(null ,'38C987F7', '278476759156','Windows' , 16 , 'intel core i3', 'HD','ativo', 3 ),
(null ,'90U058C3', '269480719132','Windows' , 8 , 'intel core i5', 'SSD','inativo', 3 ),
(null ,'82H539X3', '743496709133','linux' , 16 , 'intel core i7', 'HD','inativo' ,4 ),
(null ,'33F150X4', '913450781176','Windows' , 20 , 'intel core i3', 'HD','ativo', 1 ),
(null ,'24C416Z3', '123456784185','linux' , 16 , 'intel core i5', 'SSD','ativo',5 );

     
      -- insert tabela dados_monitoramento --
      
      insert into dados_monitoramento values
(null ,'2023-06-17 15:21:12', 71.75 , 32.2 , 13.51 , 44.10 , 1 , true ,1), 
(null ,'2023-06-17 06:44:44', 43.1 , 61.3 , 33.20 , 12.41 , 2 , true ,2), 
(null ,'2023-07-18 11:43:57', 22.9 , 73.9 , 15.45 , 93.03 , 2 , false ,1), 
(null ,'2023-06-18 19:34:04', 42.4 , 86.7 , 46.51 , 84.87 , 2 , true ,1), 
(null ,'2023-06-18 12:37:08', 17.3 , 17.3 , 87.73 , 46.54 , 2 , true ,3), 
(null ,'2023-08-18 04:38:19', 28.6 , 52.2 , 91.58 , 68.28 , 2 , true ,4), 
(null ,'2023-08-19 20:19:03', 19.70 , 29.7 , 49.15 , 21.34 , 1 , false ,2), 
(null ,'2023-06-19 11:40:13', 20.33, 30.9 , 27.50 , 31.76 , 3 , true ,3), 
(null ,'2023-08-20 09:30:01', 63.12 , 41.0 , 36.22 , 4.56 , 1 , true ,1);
      
      
      
      
      
      
      
      
      
      