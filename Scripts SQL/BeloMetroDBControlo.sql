USE belometrodb;

-- Criação de grupo de privilégios

-- Drop Role `Administrador`;
CREATE ROLE if not exists Administrador;

-- Drop Role `PostoVenda`;
CREATE ROLE if not exists PostoVenda;

-- Drop Role RespEstacao;
Create Role if not exists RespEstacao;

-- Drop Role TecnicoManutencao;
Create Role if not exists TecnicoManutencao;

-- Drop Role Cliente;
Create Role if not exists Cliente;

-- Privilegios do grupo de Administradores

-- Show grants for Administrador;
Grant all privileges 
	on `belometrodb`.*
    to Administrador
    with grant option;

-- Privilegios do grupo de PostoVenda

-- Show grants for PostoVenda;
Grant Select
	on `belometrodb`.Verclientes
    to PostoVenda;

Grant Select
	on `belometrodb`.verclientecontacto
    to PostoVenda;

Grant Select
	on `belometrodb`.verbilhetes
    to PostoVenda;
    
Grant Select
	On `belometrodb`.verpassagemveiculo
    To PostoVenda;
    
grant execute on procedure `belometrodb`.FPInfoBilhete to PostoVenda;
grant execute on procedure `belometrodb`.FPVerEstacao to PostoVenda;
grant execute on procedure `belometrodb`.FPVerHoraVeiculo to PostoVenda;
grant execute on procedure `belometrodb`.infoViagem to PostoVenda;
grant execute on procedure `belometrodb`.PVClientePorNif to PostoVenda;
grant execute on procedure `belometrodb`.PVContactoCliente to PostoVenda;
grant execute on procedure `belometrodb`.tipoBilheteCliente to PostoVenda;
grant execute on procedure `belometrodb`.addCliente to PostoVenda;
grant execute on procedure `belometrodb`.addClienteContacto to PostoVenda;
grant execute on procedure `belometrodb`.registaVenda to PostoVenda;
grant Select on belometrodb.verEstações to PostoVenda;

-- Privilegios do grupo RespEstacao
-- Show grants for RespEstacao;

Grant execute on procedure `belometrodb`.REFuncPorEstacao to RespEstacao;
Grant execute on procedure `belometrodb`.REContactoFuncionario to RespEstacao;
Grant execute on procedure `belometrodb`.REFuncionarioPorNif to RespEstacao;
Grant execute on procedure `belometrodb`.addEstação to RespEstacao;
Grant execute on procedure `belometrodb`.cancelaVenda to RespEstacao;
Grant execute on procedure `belometrodb`.removeCliente to RespEstacao;
Grant Select on `belometrodb`.verfuncionarios to RespEstacao;
Grant Select on `belometrodb`.verfuncionariocontacto to RespEstacao;
grant Select on belometrodb.verEstações to RespEstacao;

-- Privilegios do grupo TecnicoManutencao
-- Show grants for TecnicoManutencao

grant execute on procedure `belometrodb`.`registaManutencaoVeiculo` to TecnicoManutencao;
grant execute on procedure `belometrodb`.addVeiculo to TecnicoManutencao;
grant execute on procedure `belometrodb`.removeVeiculo to TecnicoManutencao;
grant execute on procedure `belometrodb`.registaPassagemEstação to TecnicoManutencao;
grant execute on procedure `belometrodb`.VerManutencaoVeiculo to TecnicoManutencao;

-- Privilegios do grupo Cliente
-- Show grants for Cliente

grant Select on belometrodb.verpassagemveiculo to Cliente;
grant Select on belometrodb.verEstações to Cliente;

-- Criação de Utilizadores

-- Show grants for 'administrador1'@'localhost' USING Administrador;
-- Drop user 'administrador1'@'localhost';
Create user if not exists 'administrador1'@'localhost'
	identified by '1234'
    default role Administrador;

-- Show grants for 'postovenda'@'localhost' USING PostoVenda;
-- Drop user 'postovenda'@'localhost';
Create user if not exists 'postovenda'@'localhost'
	identified by '1234'
    default role PostoVenda;

-- Show grants for 'respEstacao'@'localhost' USING RespEstacao, PostoVenda;
-- Drop user 'respEstacao'@'localhost';
Create user if not exists 'respEstacao'@'localhost'
	identified by '1234'
    default role RespEstacao, PostoVenda;

-- Show grants for 'tecnicomanutencao'@'localhost' Using TecnicoManutencao;
-- Drop user 'tecnicomanutencao'@'localhost';
Create user if not exists 'tecnicomanutencao'@'localhost'
	identified by '1234'
    default role TecnicoManutencao;

-- Show grats for 'cliente'@'localhost' Using Cliente;
-- Drop user 'cliente'@'localhost';
Create user if not exists 'cliente'@'localhost'
	identified by '1234'
    default role Cliente;

flush privileges;

-- Remover grupo de privilegio a utilizadores

-- Revoke 'Administrador' from 'administrador1'@'localhost'
-- Revoke 'PostoVenda' from 'postovenda'@'localhost'
-- Revoke 'RespEstacao' from 'respEstacao'@'localhost'
-- Revoke 'PostoVenda' from 'respEstacao'@'localhost'
-- Revoke 'Cliente' from 'cliente'@'localhost'





