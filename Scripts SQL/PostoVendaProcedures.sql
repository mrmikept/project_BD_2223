Use belometrodb

-- Informação de um cliente atráves do seu Contribuinte
delimiter $$
Create Procedure PVClientePorNif(In Nif_Cliente INT)
BEGIN
	select C.Contribuinte, C.Nome, C.DataNascimento As 'Data Nascimento',
    Case C.Genero
		When 0 Then 'Masculino'
        When 1 Then 'Feminino'
	End As 'Genero', concat(C.Rua, ', ', C.Localidade, ', ', C.CodigoPostal) As Morada, C.Email
    FROM Cliente As C
		Where C.Contribuinte = Nif_Cliente;
end $$
delimiter ;

-- Ver Contactos de um Cliente
delimiter $$
Create Procedure PVContactoCliente(In Nif_Cliente INT)
BEGIN
	Select C.Contribuinte AS 'Contribuinte', C.Nome AS 'Nome', F.Contacto AS 'Contacto'
    FROM clientecontactos AS F Right outer join Cliente AS C
		ON C.Contribuinte = F.Cliente
    Where F.Cliente = Nif_Cliente
	order by C.Nome ASC;
end $$
delimiter ;

-- Identificar quem vendeu e para qual cliente um bilhete foi vendido através do número de venda do bilhete.
delimiter $$
create Procedure FPInfoBilhete(In NrVenda_Bilhete INT)
Begin
	Select B.NrVenda AS 'Numero Venda Bilhete', 
		Case B.Tipo
			When 0 Then 'Bilhete Diario'
            When 1 Then 'Bilhete Mensal'
		End As 'Tipo Bilhete',
		Case B.FormaPagamento
			When 0 Then 'Dinheiro'
            When 1 Then 'Multibanco'
		End As 'Forma de Pagamento', C.Contribuinte AS 'Contribuinte Cliente' ,
		C.Nome AS 'Nome Cliente', F.Contribuinte AS 'Contribuinte Funcionario' ,F.Nome AS 'Nome Funcionario'
		From Bilhete As B Right outer Join Cliente as C
			On B.Cliente = C.Contribuinte
			Right Outer Join Funcionario as F
				On B.Funcionario = F.Contribuinte
				where B.Funcionario IS NOT NULL AND B.Cliente IS NOT NULL AND B.NrVenda = NrVenda_Bilhete
				order by C.Nome ASC, F.Nome ASC;
end $$
delimiter ;

-- Ver quais horas passaram veiculos numa Estação
delimiter $$
Create Procedure FPVerHoraVeiculo(In Id_Estacao int)
Begin
	Select E.IDEstação AS 'Id Estação', E.NOME AS 'Nome Estação', F.HORA AS 'Hora', F.Veiculo AS 'Veiculo'
		From Estação AS E Right outer Join EstaçãoVeiculo As F
			On E.IDEstação = F.Estação
            Where F.Estação = Id_Estacao AND F.HORA IS NOT NULL
            order by F.HORA DESC;
end $$
delimiter ;

-- Ver Informacao de uma Estação
delimiter $$
Create Procedure FPVerEstacao(In Id_Estacao int)
Begin
	select * FROM estação
    where estação.IdEstação = Id_Estacao;
end $$
delimiter $$

-- Saber qual o tipo de bilhete que um cliente possui introduzindo o seu NIF.

delimiter $$
Create Procedure tipoBilheteCliente(In Nif_Cliente INT)
begin
	Select C.Contribuinte As 'Contribuinte do Cliente', C.Nome As 'Nome do Cliente', B.NrVenda As 'Numero de Venda Bilhete',
		Case B.Tipo
			When 0 Then 'Bilhete Diario'
			When 1 Then 'Bilhete Mensal'
		End AS 'Tipo de Bilhete', B.DataVenda as 'Data de Venda', B.DataValidade as 'Data de Validade'
		From Bilhete as B Right outer Join Cliente as C
			On B.Cliente = C.Contribuinte
			Where B.NrVenda Is Not Null and C.Contribuinte = 749384625
			Order by B.DataVenda DESC;
end $$
delimiter ;

-- saber qual foi o cliente que realizou uma viagem e qual a origem e destino do cliente introduzindo o ID da viagem.
delimiter $$
Create Procedure infoViagem(In Id_Viagem Int)
Begin
	Select V.IdViagem as 'Id Viagem', C.Contribuinte AS 'Contribuinte Cliente', C.Nome As 'Nome Cliente', 
    Origem.Nome As 'Origem', Destino.Nome As 'Destino', V.Data As 'Data Realização'
		From Viagem V
		Join Estação Origem On V.Origem = Origem.IdEstação
			Join Estação Destino On V.Destino = Destino.IdEstação
				Inner Join clienteRealizaViagem On clienteRealizaViagem.Viagem = V.IdViagem
					Inner Join cliente As C On C.Contribuinte = clienterealizaviagem.Cliente
		Where V.IdViagem = Id_Viagem;
End $$
delimiter ;
