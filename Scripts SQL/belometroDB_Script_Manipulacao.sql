-- Queries
-- Caso de Estudo: BeloMetroDB

USE `BeloMetroDB`;

-- Numero de Bilhete Vendidos em um dia

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

-- DROP FUNCTION ValorAuferidoDia

-- VALOR AUFERIDO NA VENDA DE BILHETE EM UM DIA
delimiter $$
Create Function ValorAuferidoDia(Data_Dia DATE) returns double deterministic
begin
	declare num double;
    set num = (Select SUM(Preço) AS 'Total Auferido'
		FROM Bilhete
		Where DataVenda = Data_Dia);
        return num;
end $$
delimiter ;


-- DROP FUNCTION GastosCliente
-- Total gasto por um Cliente em bilhetes
delimiter $$
Create Function GastosCliente(NIF int) returns double deterministic
begin
	declare num double;
    set num = (select SUM(Preço) AS 'Gastos'
		From bilhete
        where Cliente = NIF);
        return num;
end $$
delimiter ;

-- DROP FUNCTION MediaGanhosEntreDatas
-- Media de ganhos do belometro entre datas
DELIMITER $$
CREATE FUNCTION MediaGanhosEntreDatas(data_inicio DATE, data_fim DATE) RETURNS DOUBLE DETERMINISTIC
BEGIN
    DECLARE num double;
    DECLARE dias INT;

    SET num = (SELECT SUM(Preço) AS 'Ganhos'
               FROM bilhete
               WHERE DataVenda BETWEEN data_inicio AND data_fim);
    
    SET dias = DATEDIFF(data_fim, data_inicio) + 1;
    
    RETURN num / dias;
END $$
DELIMITER ;

DELIMITER $$
create function MaisViagensPorDia(data_escolhida date) returns varchar(255) deterministic
BEGIN
	Declare nome varchar(255);
    
    set nome = (SELECT c.Nome
    From cliente as c
		Inner Join clienterealizaviagem as r 
        On c.Contribuinte = r.Cliente
			Inner Join Viagem as V
            on V.IdViagem = r.viagem
            where V.Data = data_escolhida
            group by c.Nome
            order by COUNT(V.IdViagem) DESC
            limit 1);
            
	Return nome;
END $$
DELIMITER ;

-- DROP FUNCTION VeiculoPassaEstacao
DELIMITER $$
Create Function VeiculoPassaEstacao() returns varchar(255) deterministic
BEGIN
	declare estacao_nome varchar(255);
    
    Select e.Nome into estacao_nome
    from estaçãoveiculo ev
    Inner join estação e On ev.Estação = e.IdEstação
    group by ev.Estação
    order by COUNT(ev.Veiculo) DESC
    limit 1;
    
    return estacao_nome;

END $$
DELIMITER ;