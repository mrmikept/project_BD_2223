Use belometroDB;

delimiter $$
Create Procedure TMinfoVeiculo(In Id_Veiculo Varchar(20))
Begin
	Select V.IdVeiculo As 'Identificador', V.NrCarruagens As 'Nr. Carruagens', V.NrLugares As 'Nr. Lugares'
		From Veiculo as V
        Where V.IdVeiculo = Id_Veiculo;
end $$
delimiter ;

delimiter $$
Create procedure VerManutencaoVeiculo(In Id_Veiculo Varchar(20))
Begin
	Select V.Veiculo As 'Veiulo', V.Data as 'Data Realização', V.Observações As 'Observações', F.Nome As 'Funcionario Responsavel'
		From funcionarioveiculo as V
			Inner Join Funcionario as F
            ON V.Funcionario = F.Contribuinte
				Where V.Veiculo = Id_Veiculo
                Order by V.DATE DESC;
end $$
delimiter ;