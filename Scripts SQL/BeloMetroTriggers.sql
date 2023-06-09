Use belometrodb;

-- Trigger para ao adicionar uma viagem, adicionar cliente e viagem à tabela clienterealizaviagem
-- Drop Trigger insereClienteViagem
delimiter $$
Create Trigger insereClienteViagem
	After Insert
    On Viagem
    For each row
Begin
    Declare flag Int;
	Declare Nif_Cliente INT;
    
    Set flag = (Select count(*) From Viagem Where IdViagem = new.IdViagem);
    
    if(flag = 1) then
		Set Nif_Cliente = (Select Cliente From Bilhete where NrVenda = New.Bilhete);
        Insert into clienterealizaviagem(Viagem,Cliente)
			values(new.idViagem,Nif_Cliente);
	end if;
end $$
delimiter ;

