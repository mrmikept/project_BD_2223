Use belometrodb;

-- Adiciona um utilizador à base de dados.
-- Drop Procedure addCliente
delimiter $$
Create Procedure addCliente(In Nif_Cliente Int, In Nome_Cliente Varchar(75),
							In Nasc_Cliente Date, in Genero_Cliente char(1),
                            In Rua_Cliente Varchar(100), In Localidade_Cliente Varchar(30),
                            In CP_Cliente Varchar(8), In Email_Cliente Varchar(100),
                            In Contacto_Cliente int)
Begin
Start Transaction;
    Set autocommit = 0;
    
    -- Criar o cliente
    Insert Into Cliente(Contribuinte, Nome, DataNascimento, Genero, Rua, Localidade, CodigoPostal, Email)
		values (Nif_Cliente, Nome_Cliente, Nasc_Cliente, Genero_Cliente, Rua_Cliente, Localidade_Cliente, CP_Cliente, Email_Cliente);
	-- Adicionar Contacto
    Insert Into ClienteContactos(Cliente, Contacto)
		Values (Nif_Cliente, Contacto_Cliente);
        
	Commit;
end $$
delimiter ;

-- Remove um Cliente do sistema
-- Drop procedure removeCliente
delimiter $$
Create Procedure removeCliente(In Nif_Cliente Int)
Begin
Start Transaction;
	 Set autocommit = 0;
     Delete from clientecontactos
		where Cliente = Nif_Cliente;
     Delete from Cliente
		Where Contribuinte = Nif_Cliente;
	commit;
end $$
delimiter ;

-- Adiciona um contacto a um utilizador
-- Drop Procedure addClienteContacto
delimiter $$
Create Procedure addClienteContacto(In Nif_Cliente int, In Contacto_Cliente int)
Begin
	Start Transaction;
	Set autocommit = 0;
		Insert Into clientecontactos(Cliente,Contacto)
			Values (Nif_Cliente, Contacto_Cliente);
	Commit;
End $$
delimiter ;

-- Regista uma manutenção a um veiculo
-- Drop Procedure registaManutencaoVeiculo
delimiter $$
Create Procedure registaManutencaoVeiculo(In Id_Veiculo Varchar(20), In Data_Manutencao DATE, In Id_Func Int, In Observ TEXT)
Begin
    Start Transaction;
    Set autocommit = 0;
		Insert Into funcionarioveiculo(Funcionario, Veiculo, Data, Observações)
			Values (Id_Func, Id_Veiculo, Data_Manutencao, Observ);
    commit;
end $$
delimiter ;

-- Adiciona uma estação
-- Drop Procedure addEstação;
delimiter $$
Create Procedure addEstação(In Nome_Estacao VARCHAR(50),in Longitude_Estacao double,in Latitude_Estacao double,in Pontos_Estacao Varchar(150),in Descricao_Estacao Text)
Begin
Start Transaction;
set autocommit = 0;
Insert into Estação(Nome, Longitude, Latitude, PontosInteresse, Descrição)
	Values(Nome_Estacao, Longitude_Estacao, Latitude_Estacao, Pontos_Estacao, Descricao_Estacao);
commit;
End $$
delimiter ;

-- Remove uma estação
-- Drop Procedure removeEstação
delimiter $$
Create Procedure removeEstação(In Id_Estação int)
Begin
Start Transaction;
set autocommit = 0;
Delete from Estação Where IdEstação = Id_Estação;
commit;
end $$
delimiter ;

-- Regista a passagem de um veiculo numa estação
-- Drop Procedure registaPassagemEstação;
delimiter $$
Create Procedure registaPassagemEstação(In Id_Estacao Int, in Id_Veiculo Varchar(20), in Hora_Passagem DateTime)
Begin
Start Transaction;
set autocommit = 0;
	Insert into estaçãoveiculo(Estação, Veiculo, Hora)
		values(Id_Estacao, Id_Veiculo, Hora_Passagem);
commit;
end $$
delimiter ;

-- Adiciona uma venda
-- Drop procedure registaVenda
delimiter $$ 
Create Procedure registaVenda(In tipo_bilhete INT, In Pagamento_Bilhete int, In Preço_Bilhete decimal(5,2), In Func_Bilhete Int, In Cliente_Bilhete Int, In DataVenda_Bilhete Date)
Begin
	Declare data_validade DATE;
Start Transaction;
Set autocommit = 0;

if(tipo_bilhete = 0) then
	set data_validade = addDate(DataVenda_bilhete, 1);
else set data_validade = addDate(DataVenda_bilhete, 30);
end if;

Insert into Bilhete(FormaPagamento, Tipo, DataVenda, DataValidade, Preço, Funcionario, Cliente)
	values(Pagamento_Bilhete, tipo_bilhete, DataVenda_Bilhete, data_validade, Preço_Bilhete, Func_Bilhete, Cliente_Bilhete);

commit;
end $$
delimiter ;

-- Cancela a venda de um bilhete, se este não possuir nenhuma viagem
-- Drop Procedure cancelaVenda;
delimiter $$
Create Procedure cancelaVenda(In Id_Bilhete Int)
begin
Declare existe_Viagem Int;
Start Transaction;
Set autocommit = 0;
Set existe_Viagem = (Select count(*) From Viagem Where Bilhete = Id_Bilhete);
If(existe_Viagem = 0) then
	Delete From Bilhete
		Where NrVenda = Id_Bilhete;
end if;
commit;
end $$
delimiter ;

-- Adiciona uma viagem ao sistema
-- Drop Procedure addViagem;
delimiter $$
Create Procedure addViagem(In Bilhete_Viagem Int, In Origem_Viagem Int, In Destino_Viagem Int, In Data_Viagem Date)
Begin
Start Transaction;
set autocommit = 0;
    Insert into Viagem(Bilhete,Origem,Destino,Data)
		values(Bilhete_Viagem,Origem_Viagem,Destino_Viagem,Data_Viagem);
commit;
end $$
delimiter ;


-- Adiciona Funcionario
-- Drop Procedure addFuncionario;
delimiter $$
Create Procedure addFuncionario(In Nif_Func int, In Nome_Func Varchar(75), In Nasc_Func Date, In Genero_Func char(1), In Rua_Func Varchar(100),
								In Local_Func Varchar(30), In CP_Func Varchar(8), In Email_Func Varchar(100), In cargo_Func Int, In Salario_Func decimal(6,2),
                                In IBAN_Func Varchar(25), In Estacao_Func int, In contacto_Func INT)
Begin
Start Transaction;
	Set autocommit = 0;
		Insert into Funcionario(Contribuinte, Nome, DataNascimento, Genero, Rua, Localidade, CodigoPostal, email, cargo, Salario, IBAN, Estação)
			value(Nif_Func, Nome_Func, Nasc_Func, Genero_Func, Rua_Func, Local_Func, CP_Func, Email_Func, cargo_Func, Salario_Func, IBAN_Func, Estacao_Func);
        Insert into funcionariocontactos(Funcionario,Contacto)
			value(Nif_Func,contacto_Func);
commit;
End $$
delimiter ;

-- Remove um Funcionario do sistema
-- Drop Procedure removeFuncionario
delimiter $$
Create Procedure removeFuncionario(In Nif_Func Int)
Begin
Start Transaction;
Delete From FuncionarioContactos
	Where Funcionario = Nif_Func;
Delete From Funcionario
	Where Contribuinte = Nif_Func;
commit;
end $$
delimiter ;

-- Adiciona um contacto a um funcionario
-- Drop Procedure addFuncionarioContacto
delimiter $$
Create Procedure addFuncionarioContacto(In Nif_Func int, In Contacto_Func int)
Begin
	Start Transaction;
	Set autocommit = 0;
	Insert Into funcionariocontactos(Funcionario,Contacto)
		Values (Nif_Func, Contacto_Func);
	Commit;
End $$
delimiter ;

-- Adiciona um veiculo a uma viagem
-- Drop Procedure addVeiculoViagem
delimiter $$
create Procedure addVeiculoViagem(In Id_Viagem int, In Id_Veiculo varchar(20))
begin
Start Transaction;
Insert into viagemveiculo(Viagem,Veiculo)
	value(Id_Viagem,Id_Veiculo);
end $$
delimiter ;

-- Adiciona um veiculo ao sistema.
-- Drop Procedure addVeiculo
delimiter $$
Create Procedure addVeiculo(In Id_Veiculo Varchar(20), In Carruagens_Veiculo Int, In Lugares_Veiculo Int)
Begin
Start transaction;
Set autocommit = 0;
Insert into Veiculo(IdVeiculo, NrCarruagens, NrLugares)
	Value(Id_Veiculo, Carruagens_Veiculo, Lugares_Veiculo);
commit;
end $$
delimiter ;

-- Remove um veiculo do sistema.
-- Drop Procedure removeVeiculo
delimiter $$
Create Procedure removeVeiculo(In Id_Veiculo Varchar(20))
Begin
Start transaction;
set autocommit = 0;
	Delete From Veiculo Where IdVeiculo = Id_Veiculo;
commit;
End $$
delimiter ;