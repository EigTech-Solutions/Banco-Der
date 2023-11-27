-- Inserindo dados na tabela instituicao
INSERT INTO instituicao (nomeInstitucional, cnpj, email, telefone, cep, numeroEndereco, complemento, fkParametrosMonitoramento, dataCadastro)
VALUES ('Instituicao 1', '12345678901234', 'instituicao1@example.com', '1234567890', '12345678', '123', 'Complemento 1', 1, now());

-- Inserindo dados na tabela usuario
INSERT INTO usuario (fkInstitucional, nome, email, senha, telefone)
VALUES (2, 'Enzo Stane', 'enzin@gmail.com', '2207', '987654321');

-- Inserindo dados na tabela acessoUsuario
INSERT INTO acessoUsuario (fkUsuario, fkInstitucional, fkAcesso, dataAcessoUsuario)
VALUES (2, 2, 2, '2023-11-02'), (2, 2, 3, '2023-11-02');

-- Inserindo dados na tabela laboratorio
INSERT INTO laboratorio (fkInstitucional, nomeSala, numeroSala, fkResponsavel)
VALUES (2, 'Laboratorio 1', '101', 2), (2, 'Laboratorio 2', '102', 2), (2, 'Laboratorio 3', '103', 2), (2, 'Laboratorio 4', '104', 2), (2, 'Laboratorio 5', '105', 2);

-- Inserindo dados na tabela maquina
INSERT INTO maquina (numeroDeSerie, ipMaquina, sistemaOperacional, status, dataCadastro, fkLaboratorio, fkInstitucional)
VALUES ('123456789012', '192.168.1.1', 'Windows 10', 1, '2023-11-02', 1, 2),
       ('123456789018', '192.168.1.6', 'Windows 10', 1, '2023-11-02', 1, 2),
       ('234567890123', '192.168.1.2', 'Ubuntu 20.04', 1, '2023-11-02', 2, 2),
       ('345678901234', '192.168.1.3', 'Windows Server 2019', 1, '2023-11-02', 3, 2),
       ('456789012345', '192.168.1.4', 'macOS Big Sur', 1, '2023-11-02', 4, 2),
       ('567890123456', '192.168.1.5', 'Linux Mint 20', 1, '2023-11-02', 5, 2);

-- Inserindo dados na tabela componenteMonitorado
INSERT INTO componenteMonitorado (fkMaquina, componente, tipo, descricaoAdicional, modelo, marca, capacidadeTotal, unidadeMedida)
VALUES (1, 'CPU', 'Processador', 'Intel Core i5', 'i5-9600K', 'Intel', 8.0, 'GB'),
       (2, 'Memoria', 'RAM', 'HyperX', 'HyperX Fury', 'Kingston', 16.0, 'GB'),
       (3, 'Disco Rigido', 'SSD', 'Samsung', '860 EVO', 'Samsung', 500.0, 'GB'),
       (4, 'CPU', 'Processador', 'Apple', 'M1', 'Apple', 8.0, 'GB'),
       (5, 'Memoria', 'RAM', 'Corsair', 'Vengeance LPX', 'Corsair', 32.0, 'GB');

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

INSERT INTO instituicao (nomeInstitucional, cnpj, email, telefone, cep, numeroEndereco, complemento, fkParametrosMonitoramento, dataCadastro)
VALUES 
  ('ETEC Ômega', '01234567890123', 'etec_omega@example.com', '(26) 0123-4567', '01234567', '123', 'Bloco D', 1, '2023-01-01'),
  ('ETEC Sigma', '12345678901234', 'etec_sigma@example.com', '(27) 1234-5678', '12345678', '456', 'Sala 103', 1, '2023-02-02'),
  ('ETEC Teta', '23456789012345', 'etec_teta@example.com', '(28) 2345-6789', '23456789', '789', 'Andar 4', 1, '2023-03-03'),
  ('ETEC Ípsilon', '34567890123456', 'etec_ypsilon@example.com', '(29) 3456-7890', '34567890', '012', 'Bloco E', 1, '2023-04-04'),
  ('ETEC Delta', '45678901234567', 'etec_delta2@example.com', '(30) 4567-8901', '45678901', '345', 'Laboratório 3', 1, '2023-01-05'),
  ('ETEC Zeta', '56789012345678', 'etec_zeta2@example.com', '(31) 5678-9012', '56789012', '678', 'Biblioteca 2', 1, '2023-01-06'),
  ('ETEC Omega', '67890123456789', 'etec_omega2@example.com', '(32) 6789-0123', '67890123', '901', 'Quadra Coberta', 1, '2023-01-07'),
  ('ETEC Kappa', '78901234567890', 'etec_kappa2@example.com', '(33) 7890-1234', '78901234', '234', 'Pátio Central', 1, '2023-01-08'),
  ('ETEC Lambda', '89012345678901', 'etec_lambda2@example.com', '(34) 8901-2345', '89012345', '567', 'Auditório Principal', 1, '2023-01-09'),
  ('ETEC Mu', '90123456789012', 'etec_mu2@example.com', '(35) 9012-3456', '90123456', '890', 'Sala de Professores', 1, '2023-01-10'),
  ('ETEC Alpha Prime', '01234567890123', 'etec_alpha_prime@example.com', '(36) 0123-4567', '01234567', '123', 'Bloco F', 1, '2023-06-11'),
  ('ETEC Beta Plus', '12345678901234', 'etec_beta_plus@example.com', '(37) 1234-5678', '12345678', '456', 'Sala 104', 1, '2023-06-12'),
  ('ETEC Gamma Pro', '23456789012345', 'etec_gamma_pro@example.com', '(38) 2345-6789', '23456789', '789', 'Andar 5', 1, '2023-07-13'),
  ('ETEC Delta Max', '34567890123456', 'etec_delta_max@example.com', '(39) 3456-7890', '34567890', '012', 'Bloco G', 1, '2023-03-14'),
  ('ETEC Epsilon Ultra', '45678901234567', 'etec_epsilon_ultra@example.com', '(40) 4567-8901', '45678901', '345', 'Laboratório 4', 1, '2023-01-15'),
  ('ETEC Theta Mega', '56789012345678', 'etec_theta_mega@example.com', '(41) 5678-9012', '56789012', '678', 'Biblioteca 3', 1, '2023-05-16'),
  ('ETEC Iota Master', '67890123456789', 'etec_iota_master@example.com', '(42) 6789-0123', '67890123', '901', 'Quadra Descoberta', 1, '2023-04-17'),
  ('ETEC Kappa Supreme', '78901234567890', 'etec_kappa_supreme@example.com', '(43) 7890-1234', '78901234', '234', 'Pátio Lateral', 1, '2023-03-18'),
  ('ETEC Lambda Elite', '89012345678901', 'etec_lambda_elite@example.com', '(44) 8901-2345', '89012345', '567', 'Auditório Secundário', 1, '2023-02-19'),
  ('ETEC Mu Superior', '90123456789012', 'etec_mu_superior@example.com', '(45) 9012-3456', '90123456', '890', 'Sala de Reuniões Executivas', 1, '2023-01-20'),
  ('ETEC Delta Prime', '01234567890123', 'etec_delta_prime@example.com', '(56) 0123-4567', '01234567', '123', 'Bloco J', 1, '2023-09-21'),
  ('ETEC Sigma Plus', '12345678901234', 'etec_sigma_plus@example.com', '(57) 1234-5678', '12345678', '456', 'Sala 106', 1, '2023-11-22'),
  ('ETEC Teta Pro', '23456789012345', 'etec_teta_pro@example.com', '(58) 2345-6789', '23456789', '789', 'Andar 7', 1, '2023-07-23'),
  ('ETEC Ípsilon Max', '34567890123456', 'etec_ypsilon_max@example.com', '(59) 3456-7890', '34567890', '012', 'Bloco K', 1, '2023-02-24'),
  ('ETEC Delta Ultra', '45678901234567', 'etec_delta_ultra@example.com', '(60) 4567-8901', '45678901', '345', 'Laboratório 6', 1, '2023-08-25'),
  ('ETEC Zeta Mega', '56789012345678', 'etec_zeta_mega@example.com', '(61) 5678-9012', '56789012', '678', 'Biblioteca 5', 1, '2023-03-26'),
  ('ETEC Omega Master', '67890123456789', 'etec_omega_master@example.com', '(62) 6789-0123', '67890123', '901', 'Quadra Descoberta', 1, '2023-05-27');