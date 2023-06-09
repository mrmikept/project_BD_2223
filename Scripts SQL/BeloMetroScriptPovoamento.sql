-- Esquema: "BeloMetroDB"
USE `BeloMetroDB`;

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

-- Povoamento da Tabela `Estação`

-- Select * FROM Estação
-- Delete from Estação

INSERT INTO Estação
	(Nome, Longitude, Latitude, PontosInteresse, Descrição)
    Values
		("Estação do Rossio", "-9.141814", "38.714330", "Arquitetura, História", "A Estação do Rossio, também conhecida como Estação Ferroviária de Lisboa, é uma das estações mais emblemáticas da cidade. Sua arquitetura deslumbrante e história rica atraem visitantes de todo o mundo."),
		("Estação de São Bento", -8.611997, 41.145862, "Azulejos, Patrimônio", "A Estação de São Bento é famosa por seus magníficos painéis de azulejos, que retratam cenas históricas de Portugal. É considerada uma das mais belas estações de trem do mundo."),
        ("Estação de Campanhã", -8.585926, 41.148643, "Modernidade, Conexões", "A Estação de Campanhã é uma estação ferroviária moderna e movimentada, que serve como um importante hub de transporte na região do Porto. Possui várias conexões para outras cidades e países."),
        ("Estação do Cais do Sodré", -9.145870, 38.705398, "Vista para o rio, Transporte marítimo", "Localizada perto do Rio Tejo, a Estação do Cais do Sodré oferece uma bela vista para o rio. Além dos trens, também é um importante ponto de partida para viagens de barco."),
        ("Estação do Oriente", -9.098002, 38.767738, "Arquitetura futurista, Comércio", "Projetada pelo renomado arquiteto Santiago Calatrava, a Estação do Oriente é um exemplo impressionante de arquitetura moderna. É parte de um complexo que inclui um grande centro comercial."),
        ("Estação de Santa Apolónia", -9.116125, 38.712793, "História, Terminal de cruzeiros", "A Estação de Santa Apolónia é uma das estações de trem mais antigas de Lisboa, com uma história que remonta ao século XIX. Também serve como terminal de cruzeiros para navios que visitam a cidade."),
        ("Estação de Entrecampos", -9.155891, 38.746857, "Conexões, Próximo ao campus universitário," , "A Estação de Entrecampos é uma importante estação de trem em Lisboa, com várias conexões para outras partes da cidade e do país. Também está localizada perto do campus universitário."),
        ("Estação de Sete Rios", -9.170247, 38.737826, "Parque Zoológico, Terminal de autocarros", "A Estação de Sete Rios é conhecida por abrigar o Parque Zoológico de Lisboa. Além dos trens, também serve como um terminal de ônibus para rotas intermunicipais e internacionais."),
        ("Estação do Marquês de Pombal", -9.149510, 38.727659, "Praça do Marquês, Comércio", "Localizada perto da Praça do Marquês de Pombal, essa estação é um importante ponto de acesso ao centro de Lisboa. Também está rodeada de lojas e comercio!")
        ;

-- Povoamento da Tabela `Cliente`

-- Select * FROM Cliente
-- Delete from Cliente

INSERT INTO Cliente
    (Contribuinte, Nome, DataNascimento, Genero, Rua, Localidade, CodigoPostal, Email)
    VALUES 
        (987654321, "Joao Silva","1985-05-12", "M", "Rua das Flores", "Lisboa", "1000-001", "joao.silva@example.com"),
        (373954712, "Ana Santos", "1992-09-23", "F", "Rua do Carmo", "Porto", "4000-002", "ana.santos@example.com"),
        (837264726, "Pedro Almeida", "1978-11-05", "M", "Avenida da Liberdade", "Braga", "4700-003", "pedro.almeida@example.com"),
        (138274928, "Sofia Pereira", "1989-06-19", "F", "Rua da Boavista", "Coimbra", "3000-004", "sofia.pereira@example.com"),
        (938372948, "Ricardo Costa", "1995-03-30", "M", "Rua do Comércio", "Faro", "8000-005", "ricardo.costa@example.com"),
        (482719283, "Beatriz Ferreira", "1983-08-14", "F", "Avenida da República", "Setúbal", "2900-006", "beatriz.ferreira@example.com"),
        (749384625, "André Santos", "1976-12-02", "M", "Rua de Santa Catarina", "Évora", "7000-007", "andre.santos@example.com"),
        (583927846, "Mariana Oliveira", "1990-07-25", "F", "Rua das Figueiras", "Viseu", "3500-008", "mariana.oliveira@example.com"),
        (383748739, "Miguel Pereira", "1982-04-10", "M", "Avenida dos Aliados", "Guimarães", "4800-009", "miguel.pereira@example.com"),
        (498303948,  "Carolina Silva", "1998-01-08", "F", "Rua do Sol", "Portimão", "8500-010", "carolina.silva@example.com"),
        (948393848, "Tiago Rodrigues", "1987-09-17", "M", "Rua dos Cedros", "Aveiro", "3800-011", "tiago.rodrigues@example.com"),
        (859393847, "Inês Costa", "1993-06-21", "F", "Avenida da Boavista", "Bragança", "5300-012", "ines.costa@example.com")
    ;

-- Povoamento da Tabela `ClienteContactos`

-- Select * FROM `ClienteContactos`
-- Delete FROM `ClienteContactos`

INSERT INTO clientecontactos
	(Cliente, Contacto)
    Values
		(987654321,  '912345678'),
        (987654321,  '917733488'),
		(373954712,  '931234567'),
        (837264726,  '961234567'),
        (138274928,  '922345678'),
        (938372948,  '925678901'),
        (938372948,  '253856829'),
        (938372948,  '210495824'),
        (482719283,  '934567890'),
        (749384625,  '935678901'),
        (583927846,  '961098765'),
		(383748739,  '918765432'),
        (498303948,  '919876543'),
		(948393848,  '936543210'),
		(859393847,  '966543210')
    ;
-- Povoamento Tabela Funcionario

-- Select * FROM `Funcionario`
-- Delete FROM `Funcionario`

INSERT INTO Funcionario
	(Contribuinte, Nome, DataNascimento, Genero, Cargo, Salario, IBAN, Rua, Localidade, CodigoPostal, Email, Estação)
    VALUES
		(849398594, "Abilio Inacio", "1966-03-14", "M", 3, 8500.00, "PT50000033994959030495849", "Praça dos Transportes", "Vila Bela", "5000-285", "abilio.inacio@example.com", 1),
        (748309385, "Miguel Teixeira", "1983-02-27", "M", 3, 4540.50 , "PT5000330405929495040309", "Praceta da Imaginação", "Braga", "4715-288", "miTeixeira@example.com", 1),
		(536512321, "António Pereira", "1980-08-10", "M", 1, 2500.00, "PT50002700000001234567893", "Rua da Liberdade", "Porto", "4000-001", "antonio.pereira@example.com", 1),
		(325876932, "Maria Silva", "1992-03-25", "F", 0, 1800.50, "PT50002700000009876543210", "Rua dos Lírios", "Lisboa", "1000-002", "maria.silva@example.com", 1),
		(867854211, "Manuel Santos", "1985-11-12", "M", 2, 3000.75, "PT50002700000024681357901", "Avenida Central", "Coimbra", "3000-003", "manuel.santos@example.com", 1),
		(436876565, "Sofia Ferreira", "1990-06-05", "F", 1, 3500.25, "PT50002700000013579246802", "Praça da República", "Braga", "4700-004", "sofia.ferreira@example.com", 2),
		(349712867, "Carlos Oliveira", "1988-09-28", "M", 0, 2200.00, "PT50002700000056789012345", "Rua do Comércio", "Faro", "8000-005", "carlos.oliveira@example.com", 3),
		(457682430, "Ana Martins", "1995-02-15", "F", 0, 1950.75, "PT50002700000090123456789", "Avenida da Liberdade", "Évora", "7000-006", "ana.martins@example.com", 2),
		(657045312, "João Sousa", "1983-07-20", "M", 2, 3200.50, "PT50002700000031415926536", "Rua das Flores", "Guimarães", "4800-007", "joao.sousa@example.com", 2),
		(768906656, "Teresa Rodrigues", "1991-04-08", "F", 2, 3750.25, "PT50002700000027182818273", "Avenida dos Aliados", "Viseu", "3500-008", "teresa.rodrigues@example.com", 3),
		(456679111, "Miguel Almeida", "1987-09-18", "M", 1, 2350.00, "PT50002700000077777777712", "Rua do Carmo", "Setúbal", "2900-009", "miguel.almeida@example.com", 3),
		(256732490, "Inês Costa", "1993-12-06", "F", 0, 2050.75, "PT50002700000088888888829", "Avenida da Boavista", "Aveiro", "3800-010", "ines.costa@example.com", 4),
		(876462100, "André Pereira", "1982-05-22", "M", 2, 3150.50, "PT50002700000099999999948", "Rua dos Cedros", "Portimão", "8500-011", "andre.pereira@example.com", 4),
		(454798008, "Carolina Fernandes", "1999-01-12", "F", 1, 3800.25, "PT50002700000055555555567", "Rua Auria", "Faro", "2678-289", "carol@example.com", 4),
		(839274947, "Pedro Santos", "1984-05-02", "M", 1, 2800.00, "PT50002700000012345678911", "Rua das Oliveiras", "Vila Nova de Gaia", "4400-003", "pedro.santos@example.com", 5),
		(294847192, "Sofia Costa", "1991-09-15", "F", 2, 3200.50, "PT50002700000098765432120", "Avenida dos Girassóis", "Matosinhos", "4450-004", "sofia.costa@example.com", 5),
		(246813579, "Miguel Ferreira", "1986-12-08", "M", 0, 2400.75, "PT50002700000024681357939", "Rua da Fonte", "Braga", "4700-005", "miguel.ferreira@example.com", 5),
		(135792468, "Ana Rodrigues", "1993-06-25", "F", 1, 3800.25, "PT50002700000013579246848", "Avenida Central", "Coimbra", "3000-006", "ana.rodrigues@example.com", 6),
		(567890123, "Diogo Oliveira", "1989-03-19", "M", 1, 2200.00, "PT50002700000056789012357", "Rua das Flores", "Porto", "4000-007", "diogo.oliveira@example.com", 7),
		(638263747, "Mariana Silva", "1996-08-10", "F", 2, 3100.75, "PT50002700000090123456766", "Avenida da Liberdade", "Lisboa", "1000-008", "mariana.silva@example.com", 6),
        (234567890, "Ana Santos", "1990-03-14", "F", 0, 2500.00, "PT50002700000023456789044", "Rua das Azáleas", "Sintra", "2710-009", "ana.santos@example.com", 6),
		(987654321, "Carlos Silva", "1985-08-27", "M", 0, 3200.50, "PT50002700000098765432111", "Avenida dos Lírios", "Cascais", "2750-002", "carlos.silva@example.com", 7),
		(456789012, "Sofia Pereira", "1992-05-02", "F", 2, 2900.75, "PT50002700000045678901233", "Rua do Parque", "Porto", "4000-005", "sofia.pereira@example.com", 7),
		(329585474, "Pedro Almeida", "1988-12-19", "M", 0, 2200.25, "PT50002700000012345678922", "Avenida Central", "Braga", "4700-004", "pedro.almeida@example.com", 8),
		(789012345, "Marta Fernandes", "1995-06-05", "F", 2, 2800.00, "PT50002700000078901234566", "Rua das Flores", "Coimbra", "3000-007", "marta.fernandes@example.com", 8),
		(345678901, "Ricardo Santos", "1991-09-18", "M", 1, 2600.75, "PT50002700000034567890155", "Avenida da Liberdade", "Lisboa", "1000-003", "ricardo.santos@example.com", 8),
		(901234567, "Inês Carvalho", "1987-02-25", "F", 1, 3500.50, "PT50002700000090123456799", "Rua dos Girassóis", "Faro", "8000-006", "ines.carvalho@example.com", 9),
		(678901234, "André Ferreira", "1994-07-08", "M", 0, 2000.25, "PT50002700000067890123488", "Avenida Central", "Guimarães", "4800-001", "andre.ferreira@example.com", 9),
		(432109876, "Beatriz Oliveira", "1989-11-15", "F", 2, 2900.00, "PT50002700000043210987677", "Rua da Fonte", "Setúbal", "2900-004", "beatriz.oliveira@example.com", 9)
        ;

-- Povoamento da Tabela `FuncionarioContactos`
-- Select * FROM `FuncionarioContactos`
-- Delete FROM `FuncionarioContactos`

INSERT INTO FuncionarioContactos
    (Funcionario, Contacto)
    VALUES 
        (536512321,  '927654321'),
        (325876932,  '968765432'),
        (867854211,  '937654321'),
        (436876565,  '966789012'),
        (349712867,  '938901234'),
        (457682430,  '929012345'),
        (657045312,  '917654321'),
        (768906656,  '969012345'),
        (456679111,  '938765432'),
        (256732490,  '966789012'),
        (876462100,  '937654321'),
        (454798008,  '925678901'),
        (987654321,  '913456789'),
		(246813579,  '926543210'),
		(135792468,  '927654321'),
		(567890123,  '915678901'),
		(901234567,  '938901234'),
		(234567890,  '926789012'),
		(987654321,  '914567890'),
		(456789012,  '919876543'),
		(789012345,  '936543210'),
		(345678901,  '935678901'),
		(901234567,  '939012345'),
		(678901234,  '927890123'),
		(432109876,  '935678901'),
		(839274947,  '931234567'),
		(329585474,  '936543210')
    ;

-- Povoamento da Tabela `Veiculo`

-- Select * FROM `Veiculo`
-- Delete FROM `Veiculo`

INSERT INTO Veiculo
	(IdVeiculo, NrCarruagens, NrLugares)
    Values
		("A-001", 120, 6),
        ("B-002", 80, 4),
        ("C-003", 200, 8),
        ("D-004", 150, 6),
		("E-005", 100, 5),
		("F-006", 180, 7),
		("G-007", 90, 4),
		("H-008", 130, 6),
		("I-009", 160, 8),
		("J-010", 110, 5),
		("K-011", 140, 7),
		("L-012", 170, 6)
        ;

-- Povoamento da Tabela `Bilhete`

-- Select * FROM `Bilhete`veiculo
-- Delete FROM `Bilhete`

Insert Into Bilhete
	(FormaPagamento, Tipo, DataVenda, DataValidade, Preço, Funcionario, Cliente)
    values
		(1, 0, "2023-01-15", "2023-01-16", 25.50, 325876932, 383748739),
		(0, 1, "2023-02-10", "2023-03-10", 30.80, 325876932, 987654321),
		(1, 1, "2023-03-05", "2023-04-05", 12.75, 325876932, 859393847),
		(1, 0, "2023-04-20", "2023-04-21", 18.90, 457682430, 749384625),
		(0, 0, "2023-05-12", "2023-05-13", 9.99, 457682430, 498303948),
		(1, 0, "2023-06-30", "2023-07-01", 42.30, 457682430, 482719283),
		(1, 1, "2023-07-17", "2023-08-17", 35.25, 349712867, 837264726),
		(0, 1, "2023-08-22", "2023-09-22", 27.60, 349712867, 383748739),
		(1, 0, "2023-09-08", "2023-09-09", 19.95, 349712867, 948393848),
		(0, 0, "2023-10-05", "2023-10-06", 15.60, 256732490, 948393848),
		(1, 1, "2023-11-18", "2023-12-18", 50.20, 256732490, 383748739),
		(1, 0, "2023-12-25", "2023-12-26", 28.70, 256732490, 948393848),
		(0, 1, "2024-01-04", "2024-02-04", 32.90, 246813579, 837264726),
		(1, 1, "2024-02-19", "2024-03-19", 14.35, 246813579, 373954712),
		(1, 0, "2024-03-10", "2024-03-11", 21.80, 246813579, 498303948),
		(0, 0, "2024-04-14", "2024-04-15", 10.50, 234567890, 859393847),
		(1, 0, "2024-05-27", "2024-05-28", 16.75, 234567890, 383748739),
		(1, 1, "2024-06-02", "2024-07-02", 38.90, 234567890, 859393847),
		(0, 1, "2024-07-07", "2024-08-07", 29.20, 987654321, 583927846),
		(1, 0, "2024-08-14", "2024-08-15", 24.99, 987654321, 948393848),
		(0, 0, "2024-09-09", "2024-09-10", 11.80, 987654321, 837264726),
		(1, 1, "2024-10-22", "2024-11-22", 45.60, 329585474, 373954712),
		(1, 0, "2024-11-30", "2024-12-01", 31.25, 329585474, 482719283),
		(0, 1, "2025-01-08", "2025-02-08", 34.70, 329585474, 383748739),
		(1, 1, "2025-02-12", "2025-03-12", 17.85, 678901234, 482719283),
		(0, 0, "2025-03-25", "2025-03-26", 13.60, 678901234, 583927846),
		(1, 0, "2025-04-18", "2025-04-19", 20.45, 678901234, 383748739),
		(0, 0, "2025-05-11", "2025-05-12", 18.80, 234567890, 383748739),
		(1, 1, "2025-06-24", "2025-07-24", 40.25, 349712867, 373954712),
		(1, 0, "2025-07-01", "2025-07-02", 26.90, 987654321, 859393847),
		(0, 1, "2025-08-05", "2025-09-05", 31.40, 246813579, 948393848),
		(1, 1, "2025-09-10", "2025-10-10", 15.75, 457682430, 948393848)
        ;

-- Povoamento da Tabela `Viagem`

-- Select * FROM `Viagem`
-- Delete FROM `Viagem`

Insert Into Viagem
	(Data, Bilhete, Origem, Destino)
    Values
		("2023-01-15", 1, 2, 4),
		("2023-01-16", 1, 7, 9),
		("2023-02-10", 2, 3, 4),
		("2023-02-11", 2, 5, 9),
		("2023-02-12", 2, 1, 3),
		("2023-02-13", 2, 6, 3),
		("2023-02-14", 2, 1, 5),
		("2023-02-15", 2, 4, 9),
		("2023-03-05", 3, 2, 1),
		("2023-03-06", 3, 7, 8),
		("2023-04-20", 4, 9, 8),
		("2023-04-21", 4, 3, 2),
		("2023-05-12", 5, 1, 2),
		("2023-05-13", 5, 7, 8),
		("2023-06-30", 6, 3, 1),
		("2023-07-01", 6, 2, 3),
		("2023-07-17", 7, 5, 3),
		("2023-07-18", 7, 9, 1),
		("2023-08-22", 8, 1, 2),
		("2023-08-23", 8, 9, 1),
		("2023-09-08", 9, 3, 1),
		("2023-09-09", 9, 6, 5),
		("2023-10-05", 10, 4, 3),
		("2023-10-06", 10, 2, 1),
		("2023-11-18", 11, 3, 5),
		("2023-11-19", 11, 7, 9),
		("2023-12-25", 12, 2, 5),
		("2023-12-26", 12, 1, 4),
		("2024-01-04", 13, 7, 8),
		("2024-01-05", 13, 9, 1),
		("2024-02-19", 14, 5, 2),
		("2024-02-20", 14, 4, 7),
		("2024-03-10", 15, 7, 9),
		("2024-03-11", 15, 1, 9),
		("2024-04-14", 16, 8, 2),
		("2024-04-15", 16, 7 ,3),
		("2024-05-27", 17, 6, 4),
		("2024-05-28", 17, 5, 3),
		("2024-06-02", 18, 1, 2),
		("2024-06-03", 18, 3, 4),
		("2024-07-07", 19, 5, 6),
		("2024-07-08", 19, 7, 8),
		("2024-08-14", 20, 9, 1),
		("2024-08-15", 20, 9, 2),
		("2024-09-09", 21, 8, 3),
		("2024-09-10", 21, 5, 4),
		("2024-10-22", 22, 6, 2),
		("2024-10-23", 22, 1, 3),
		("2024-11-30", 23, 5, 6),
		("2024-12-01", 23, 8, 2),
		("2025-01-08", 24, 9, 1),
		("2025-01-09", 24, 7, 6),
		("2025-02-12", 25, 3, 5),
		("2025-02-13", 25, 4, 7),
		("2025-03-25", 26, 3, 7),
		("2025-03-26", 26, 4, 9),
		("2025-04-18", 27, 3, 9),
		("2025-04-19", 27, 7, 2),
		("2025-05-11", 28, 8, 1),
		("2025-05-12", 28, 9, 3),
		("2025-06-24", 29, 7, 5),
		("2025-06-25", 29, 6, 8),
		("2025-07-01", 30, 8, 2),
		("2025-07-02", 30, 1, 2),
		("2025-08-05", 31, 1, 9)
        ;

-- Povoamento da Tabela `EstaçãoVeiculo`

-- Select * FROM `EstaçãoVeiculo`
-- Delete FROM `EstaçãoVeiculo`

Insert Into EstaçãoVeiculo
	(Hora, Veiculo, Estação)
	Values
		('2023-01-15 22:12:13', 'A-001', 2),
    ('2023-01-16 00:48:39', 'A-001', 4),
    ('2023-01-16 10:54:46', 'E-005', 7),
    ('2023-01-16 14:12:43', 'E-005', 9),
    ('2023-02-10 21:54:49', 'J-010', 3),
    ('2023-02-11 02:27:45', 'J-010', 4),
    ('2023-02-11 02:15:01', 'G-007', 5),
    ('2023-02-11 06:44:34', 'G-007', 9),
    ('2023-02-12 23:20:43', 'B-002', 1),
    ('2023-02-13 01:14:54', 'B-002', 3),
    ('2023-02-13 13:54:07', 'D-004', 6),
    ('2023-02-13 17:59:31', 'D-004', 3),
    ('2023-02-14 23:37:05', 'I-009', 1),
    ('2023-02-15 00:51:16', 'I-009', 5),
    ('2023-02-15 05:11:41', 'C-003', 4),
    ('2023-02-15 09:41:13', 'C-003', 9),
    ('2023-03-05 03:27:23', 'H-008', 2),
    ('2023-03-05 07:38:27', 'H-008', 1),
    ('2023-03-06 09:37:47', 'F-006', 7),
    ('2023-03-06 10:44:14', 'F-006', 8),
    ('2023-04-20 14:22:13', 'L-012', 9),
    ('2023-04-20 19:07:19', 'L-012', 8),
    ('2023-04-21 00:19:31', 'K-011', 3),
    ('2023-04-21 04:29:52', 'K-011', 2),
    ('2023-05-12 23:14:56', 'A-001', 1),
    ('2023-05-13 01:40:26', 'A-001', 2),
    ('2023-05-13 09:23:54', 'I-009', 7),
    ('2023-05-13 13:24:56', 'I-009', 8),
    ('2023-06-30 04:50:33', 'E-005', 3),
    ('2023-06-30 06:58:18', 'E-005', 1),
    ('2023-07-01 13:38:29', 'C-003', 2),
	('2025-07-01 07:07:44', 'J-010', 8),
	('2025-07-01 10:01:21', 'J-010', 2),
	('2025-07-02 06:56:37', 'G-007', 1),
	('2025-07-02 11:04:13', 'G-007', 2),
	('2025-08-05 05:40:56', 'B-002', 1),
	('2025-08-05 08:04:07', 'B-002', 9)
	;

-- Povoamento da Tabela `FuncionarioVeiculo`

-- Select * FROM `FuncionarioVeiculo`
-- Delete FROM `FuncionarioVeiculo`

Insert Into FuncionarioVeiculo
	(Funcionario, Veiculo, data, observações)
Values
('867854211','C-003','2023-01-10','Verificar os freios traseiros'),
('657045312','J-010','2023-02-05','Trocar o óleo do motor'),
('768906656','F-006','2023-03-15','Revisar sistema elétrico'),
('876462100','B-002','2023-04-20','Substituir pneus dianteiros'),
('294847192','G-007','2023-05-25','Verificar os níveis de fluidos'),
('638263747','L-012','2023-06-10','Limpar os filtros de ar'),
('456789012','K-011','2023-07-15','Reparar a luz de emergência'),
('789012345','D-004','2023-08-20','Verificar a suspensão'),
('432109876','H-008','2023-09-25','Realizar manutenção do sistema de ar condicionado'),
('867854211','A-001','2023-10-10','Substituir as palhetas dos limpadores de para-brisa'),
('657045312','C-003','2023-11-05','Verificar os freios dianteiros'),
('768906656','J-010','2023-12-15','Trocar o filtro de combustível'),
('876462100','F-006','2024-01-20','Revisar sistema de tração'),
('294847192','B-002','2024-02-25','Verificar a iluminação interna'),
('638263747','G-007','2024-03-10','Reparar o sistema de som'),
('456789012','L-012','2024-04-15','Realizar manutenção dos assentos'),
('789012345','K-011','2024-05-20','Verificar o sistema de comunicação'),
('432109876','D-004','2024-06-25','Reparar os espelhos retrovisores'),
('867854211','H-008','2024-07-10','Verificar o sistema de frenagem'),
('657045312','A-001','2024-08-05','Realizar manutenção das portas'),
('768906656','C-003','2024-09-15','Trocar as pastilhas de freio'),
('876462100','J-010','2024-10-20','Verificar o sistema de arrefecimento'),
('294847192','F-006','2024-11-25','Reparar o sistema de iluminação externa'),
('638263747','B-002','2024-12-10','Realizar manutenção dos sistemas de segurança'),
('456789012','G-007','2025-01-15','Verificar o sistema de direção'),
('789012345','L-012','2025-02-20','Trocar o filtro de ar-condicionado')
;

-- Povoamento da Tabela `ViagemVeiculo`

-- Select * FROM `ViagemVeiculo`
-- Delete FROM `ViagemVeiculo`

Insert Into ViagemVeiculo
	(Viagem, Veiculo)
	Values
	(1, 'A-001'),
    (2, 'E-005'),
    (3, 'J-010'),
    (4, 'G-007'),
    (5, 'B-002'),
    (6, 'D-004'),
    (7, 'I-009'),
    (8, 'C-003'),
    (9, 'H-008'),
    (10, 'F-006'),
    (11, 'L-012'),
    (12, 'K-011'),
    (13, 'A-001'),
    (14, 'I-009'),
    (15, 'E-005'),
    (16, 'C-003'),
    (17, 'G-007'),
    (18, 'B-002'),
    (19, 'J-010'),
    (20, 'D-004'),
    (21, 'K-011'),
    (22, 'H-008'),
    (23, 'F-006'),
    (24, 'L-012'),
    (25, 'A-001'),
    (26, 'G-007'),
    (27, 'I-009'),
    (28, 'E-005'),
    (29, 'J-010'),
    (30, 'B-002'),
    (31, 'D-004'),
    (32, 'C-003'),
    (33, 'F-006'),
    (34, 'H-008'),
    (35, 'L-012'),
    (36, 'K-011'),
    (37, 'A-001'),
    (38, 'C-003'),
    (39, 'B-002'),
    (40, 'G-007'),
    (41, 'I-009'),
    (42, 'E-005'),
    (43, 'J-010'),
    (44, 'H-008'),
    (45, 'D-004'),
    (46, 'L-012'),
    (47, 'F-006'),
    (48, 'K-011'),
    (49, 'A-001'),
    (50, 'J-010'),
    (51, 'G-007'),
    (52, 'H-008'),
    (53, 'B-002'),
    (54, 'D-004'),
    (55, 'F-006'),
    (56, 'C-003'),
    (57, 'K-011'),
    (58, 'I-009'),
    (59, 'E-005'),
    (60, 'L-012'),
    (61, 'A-001'),
    (62, 'D-004'),
    (63, 'J-010'),
    (64, 'G-007'),
    (65, 'B-002')
	;