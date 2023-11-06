-- Inserindo dados na tabela instituicao
INSERT INTO instituicao (nomeInstitucional, cnpj, email, telefone, cep, numeroEndereco, complemento, fkParametrosMonitoramento)
VALUES ('Instituicao 1', '12345678901234', 'instituicao1@example.com', '1234567890', '12345678', '123', 'Complemento 1', 1);

-- Inserindo dados na tabela usuario
INSERT INTO usuario (fkInstitucional, nome, email, senha, telefone)
VALUES (2, 'Enzo Stane', 'enzin@gmail.com', '2207', '987654321');

-- Inserindo dados na tabela acessoUsuario
INSERT INTO acessoUsuario (fkUsuario, fkInstitucional, fkAcesso, dataAcessoUsuario)
VALUES (2, 2, 2, '2023-11-02'), (2, 2, 3, '2023-11-02');

-- Inserindo dados na tabela laboratorio
INSERT INTO laboratorio (fkInstitucional, nomeSala, numeroSala, fkResponsavel)
VALUES (2, 'Laboratorio 1', '101', 2), (2, 'Laboratorio 2', '102', 2), (2, 'Laboratorio 3', '103', 2), (2, 'Laboratorio 4', '104', 2), (2, 'Laboratorio 5', '105', 1);

-- Inserindo dados na tabela maquina
INSERT INTO maquina (numeroDeSerie, ipMaquina, sistemaOperacional, status, dataCadastro, fkLaboratorio, fkInstitucional)
VALUES ('123456789012', '192.168.1.1', 'Windows 10', 1, '2023-11-02', 1, 2),
       ('234567890123', '192.168.1.2', 'Ubuntu 20.04', 1, '2023-11-02', 2, 2),
       ('345678901234', '192.168.1.3', 'Windows Server 2019', 1, '2023-11-02', 3, 2),
       ('456789012345', '192.168.1.4', 'macOS Big Sur', 1, '2023-11-02', 4, 2),
       ('567890123456', '192.168.1.5', 'Linux Mint 20', 1, '2023-11-02', 5, 2);

-- Inserindo dados na tabela componenteMonitorado
INSERT INTO componenteMonitorado (fkMaquina, componente, tipo, descricaoAdicional, modelo, marca, capacidadeTotal, unidadeMedida)
VALUES (1, 'CPU', 'Processador', 'Intel Core i5', 'i5-9600K', 'Intel', 8.0, 'GB'),
       (2, 'Memória', 'RAM', 'HyperX', 'HyperX Fury', 'Kingston', 16.0, 'GB'),
       (3, 'Disco', 'SSD', 'Samsung', '860 EVO', 'Samsung', 500.0, 'GB'),
       (4, 'CPU', 'Processador', 'Apple', 'M1', 'Apple', 8.0, 'GB'),
       (5, 'Memória', 'RAM', 'Corsair', 'Vengeance LPX', 'Corsair', 32.0, 'GB');

-- Inserindo dados na tabela medicoes
INSERT INTO medicoes (fkMaquina, fkComponente, valorConsumido, dataHora)
VALUES (1, 1, 20.0, '2023-11-02 10:00:00'),
       (2, 2, 10.0, '2023-11-02 10:05:00'),
       (3, 3, 30.0, '2023-11-02 10:10:00'),
       (4, 4, 15.0, '2023-11-02 10:15:00'),
       (5, 5, 25.0, '2023-11-02 10:20:00');

-- Inserindo dados na tabela Alertas
INSERT INTO Alertas (tipo, lido, fkMonitoramento, fkComponente, fkMaquina)
VALUES ('atenção', 0, 1, 1, 1),
       ('urgente', 0, 2, 2, 2),
       ('urgente', 0, 3, 3, 3),
       ('atenção', 0, 4, 4, 4),
       ('urgente', 0, 5, 5, 5);