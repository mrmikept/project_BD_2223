-- Queries
-- Caso de Estudo: BeloMetroDB

USE `BeloMetroDB`;

-- Numero de Bilhete Vendidos em um dia
-- drop function NrBilhetesVendidosDia
delimiter $$
Create Function NrBilhetesVendidosDia(Data_Dia DATE) returns int deterministic
begin
	declare num int;
    set num = (Select COUNT(*) As 'Total de Bilhetes Vendidos'
		FROM Bilhete
		Where DataVenda = Data_Dia);
        return num;
end $$
delimiter ;

-- VALOR AUFERIDO NA VENDA DE BILHETE EM UM DIA
-- drop function ValorAuferidoDia
delimiter $$
Create Function ValorAuferidoDia(Data_Dia DATE) returns int deterministic
begin
	declare num int;
    set num = (Select SUM(Preço) AS 'Total Auferido'
		FROM Bilhete
		Where DataVenda = Data_Dia);
        return num;
end $$
delimiter ;


