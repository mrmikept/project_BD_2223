Use Belometrodb

-- Informação de um funcionario atráves do seu Contribuinte

delimiter $$
create Procedure REFuncionarioPorNif(In Nif_Funcionario INT)
Begin
	Select * FROM funcionario
		Where Funcionario.Contribuinte = Nif_Funcionario;
end $$
delimiter ;

-- Ver Contactos de um funcionario atráves do seu Contribuinte

delimiter $$
create procedure REContactoFuncionario(In Nif_Funcionario INT)
Begin
	Select F.Nome, Case F.Cargo
			When 0 Then 'Funcionario Posto Venda'
			When 1 Then 'Responsavel Estação'
			When 2 Then 'Tecnico de Manutenção'
			When 3 then 'Administrador'
		END AS 'Cargo', E.Nome, C.Contacto
    From Funcionario as F inner Join FuncionarioContactos AS C
    On F.Contribuinte = C.Funcionario
		inner Join Estação as E
        On E.IdEstação = F.Estação
        where F.Contribuinte = Nif_Funcionario;
End $$
delimiter ;


-- Ver os funcionarios de uma estação atraves do ID da estação
delimiter $$
Create Procedure REFuncPorEstacao(In Id_Estacao INT)
Begin
	Select F.Contribuinte As 'Contribuinte Funcionario', F.Nome As 'Nome Funcionario', 
		Case F.Cargo
			When 0 Then 'Funcionario Posto Venda'
			When 1 Then 'Responsavel Estação'
			When 2 Then 'Tecnico de Manutenção'
			When 3 then 'Administrador'
		END AS 'Cargo', E.IdEstação As 'Id Estação' , E.Nome As 'Nome da Estação'
		From Funcionario as F Right outer Join Estação as E
			On F.Estação = E.IdEstação
			where E.IdEstação = Id_Estacao
			Order by F.Cargo desc, F.Nome ASC;
End $$
delimiter ;
