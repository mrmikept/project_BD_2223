Use belometrodb;

-- drop view Verclientes
create view Verclientes as
	Select C.Contribuinte, C.Nome, C.DataNascimento, C.Genero, concat(C.Rua, ', ', C.Localidade, ', ', C.CodigoPostal) as Morada, C.Email
    from Cliente As C
    order by C.Nome Asc;
    
-- drop view VerClienteContacto
create view VerClienteContacto as
	Select C.Contribuinte, C.Nome, F.Contacto
    From Cliente as C
		Inner Join clientecontactos as F
        On C.Contribuinte = F.Cliente
        order by C.Nome Asc;

-- drop view VerFuncionarios
create view VerFuncionarios as
	Select F.Contribuinte, F.Nome, F.DataNascimento, F.Genero, concat(F.Rua, ', ', F.Localidade, ', ', F.CodigoPostal) as Morada, F.email,
		Case F.Cargo
			When 0 then 'Funcionario Posto Venda'
            When 1 then 'Responsavel Estação'
            When 2 then 'Técnico de manutenção'
            When 3 then 'Administrador'
		End As 'Cargo' , E.Nome As 'Estação Desnignada'
        From Funcionario As F
			Inner Join Estação As E
            On F.Estação = E.IdEstação
            Order by F.Nome Asc;

-- drop view VerFuncionarioContacto
create view VerFuncionarioContacto as
	Select C.Contribuinte, C.Nome, F.Contacto
    From Funcionario as C
		Inner Join funcionariocontactos as F
        On C.Contribuinte = F.Funcionario
        order by C.Nome Asc;

-- drop view VerVeiculos
create view VerVeiculos as
	Select V.IdVeiculo as 'Identificador', V.NrCarruagens as 'Nr. Carruagens', V.NrLugares as 'Nr. Lugares'
		From Veiculo as V
        Order by V.NrLugares;
        
-- drop view VerVeiculosManutencao
create view VerVeiculosManutencao as
	Select F.Nome as 'Tecnico', V.Veiculo as 'Identificador Veiculo', V.Data as 'Data Realização', V.Observações
    From funcionarioveiculo as V
		Inner Join Funcionario as F
        On V.Funcionario = F.Contribuinte
        order by V.Data Desc;

-- drop view VerBilhetes
Create View VerBilhetes as
	Select B.NrVenda As 'Nr. Venda',
    Case B.FormaPagamento
		When 0 Then 'Dinheiro'
        When 1 Then 'Multibanco'
	End As 'Forma Pagamento', 
    Case B.Tipo
		When 0 Then 'Diario'
        When 1 Then 'Mensal'
	End As 'Tipo Bilhete', B.DataVenda As 'Data Venda', B.DataValidade As 'Data Validade', B.Preço as 'Preço',
    C.Contribuinte As 'NIF Cliente', C.Nome As 'Nome Cliente',  F.Contribuinte As 'Nif Funcionario', F.Nome as 'Nome Funcionario'
	From Bilhete As B Inner Join Cliente As C
		On C.Contribuinte = B.Cliente
        Inner Join Funcionario As F
        On F.Contribuinte = B.Funcionario
	Order by B.DataVenda DESC;

-- drop view VerPassagemVeiculo
Create View VerPassagemVeiculo As
	select E.Nome As 'Nome Estação', V.IdVeiculo As 'Veiculo', F.Hora As 'Hora passagem'
    From EstaçãoVeiculo as F
		Inner Join Estação as E
        On E.IdEstação = F.Estação
			Inner Join Veiculo V
            On V.IdVeiculo = F.Veiculo
	Order by F.Hora DESC;
    
-- drop view VerEstações
Create View VerEstações as
	Select Nome As 'Estação', concat(Longitude, ', ', Latitude) as 'Localização', PontosInteresse as 'Pontos de Interesse', Descrição as 'Descrição'
		From Estação
	Order by Nome Asc;

	