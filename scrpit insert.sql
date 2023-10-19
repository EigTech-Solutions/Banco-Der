
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
(null , 1 , 'laboratorio de codigos' , '3', 1 ),
(null , 2 , 'informática' , '2', 2 ),
(null , 1 , 'laboratorio' , '1', 3 ),
(null , 3 , 'laboratorio de estudos' , '7', 4 ),
(null , 4 , 'laboratorio de codigos' , '7', 1 ),
(null , 2 , 'sala de estudos' , '5', 2 ),
(null , 3 , 'laboratorio' , '8', 5 ),
(null , 4 , 'laboratorio de estudos' , '10', 6 );
      

  
    -- insert na tabela maquina --
insert into maquina values
(null , '12345678' , '123173125123' , 'windows' , 'SSD' , '8GB' , '16GB' , 'intel 9' , 'ativado' , '2023-09-21' , null , 1 , 1 ),
(null , '87654321' , '323131211242' , 'windows' , 'SSD' , '4GB' , '8GB' , 'intel 7' , 'ativado' , '2023-10-11' , null , 1 , 2 ),
(null , '12121212' , '123182312112' , 'windows' , 'HD' , '8GB' , '4GB' , 'intel 5' , 'inativado' , '2023-07-10' , '2023-10-01' , 2 , 2 ),
(null , '01010101' , '723193120126' , 'windows' , 'SSD' , '4GB' , '16GB' , 'intel 5' , 'inativado' , '2023-10-09' , '2023-12-25' , 1 ,3 ),
(null , '12345671' , '923103128127' , 'windows' , 'HD' , '16GB' , '8GB' , 'intel 5' , 'ativado' , '2023-05-02' , null , 2 , 1 ),
(null , '12345672' , '423103129128' , 'windows' , 'HD' , '8GB' , '16GB' , 'intel 7' , 'ativado' , '2023-10-22' , null , 2 , 2 );




    -- insert na tabela dados_monitoramento  --
insert into dados_monitoramento values
(null , 1 , 77.7 , 45.5 , 87.2 , 798 , 550 , 473 , 2 ,true , '2023-05-08 10:00:00' ),
(null , 2 , 57.2 , 47.9 , 80.5 , 995 , 500 , 470 , 1 ,true , '2023-05-08 10:00:00' ),
(null , 1 , 88.9 , 33.7 , 85.4 , 298 , 505 , 480 , 2 ,true , '2023-05-08 10:00:00' ),
(null , 3 , 45.0 , 48.2 , 82.7 , 992 , 700 , 475 , 3 ,false , '2023-05-08 10:00:00' ),
(null , 4 , 57.2 , 63.9 , 87.2 , 898 , 400 , 470 , 2 ,false , '2023-05-08 10:00:00' );



 -- insert na tabela acesso  --
insert into acesso values
(null , 'Admin'),
(null , 'Técnico');



 -- insert na tabela acessoUsuario --
 insert into acessoUsuario values
(null , 1 , 1 , 1 , '2023-05-08'),
(null , 1 , 1 , 2 , '2023-05-08'),
(null , 2 , 2 , 1 , '2023-05-08'),
(null , 3 , 3 , 2 , '2023-05-08'),
(null , 4 , 4 , 2 , '2023-05-08'),
(null , 5 , 2 , 1 , '2023-05-08'),
(null , 6 , 1 , 2 , '2023-05-08');



 -- insert na tabela alertas --
 insert into Alertas values
(null , 'urgente' , 'CPU' , 95.7 , '2023-05-08 10:00:01' , 1 , 1),
(null , 'urgente' , 'CPU' , 95.7 , '2023-10-08 10:00:01' , 1 , 1),
(null , 'atenção' , 'disco' , 90 , '2023-05-08 04:00:40' , 1 , 2),
(null , 'urgente' , 'CPU' , 98.2 , '2023-05-09 20:30:00' , 2 , 1),
(null , 'atenção' , 'ram' , 87.1 , '2023-05-09 10:00:00' , 3 , 3),
(null , 'urgente' , 'CPU' , 95.5 , '2023-05-09 20:10:00' , 2 , 2);
 