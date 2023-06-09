Use belometroDB;

-- Criação de indices em funcionario
Create Index index_Func On Funcionario (Cargo);

-- Criação de indices em Bilhete
Create Index index_Bilhete On Bilhete (tipo);

-- Criação de indices em Viagens
Create Index index_viagem On Viagem (Data);

