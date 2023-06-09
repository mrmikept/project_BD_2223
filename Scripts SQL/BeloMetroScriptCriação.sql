-- ------------------------------
-- Schame BeloMetroDB
-- ------------------------------

-- Drop Schema BeloMetroDB;

Create Schema if not exists `BeloMetroDB`
	default charset=utf8mb4;
	Use BeloMetroDB;

-- ---------------------------
-- Tabela Clientes
-- ---------------------------

-- Drop Table `Cliente`
CREATE TABLE if not exists `BeloMetroDB`.`Cliente` (
	`Contribuinte` INT unsigned NOT NULL check (`Contribuinte` between 100000000 and 999999999),
	`Nome` varchar(75) NOT NULL,
    `DataNascimento` DATE,
    `Genero` char,
    `Rua` varchar(100) NOT NULL,
    `Localidade` varchar(30) NOT NULL,
    `CodigoPostal` varchar(8) NOT NULL,
    `email` varchar(100),
	primary key(`Contribuinte`)
    )
engine = InnoDB;

-- ---------------------------
-- Tabela ClienteContactos
-- ---------------------------

Create table if not exists `BeloMetroDB`.`ClienteContactos` (
	`Cliente` INT unsigned NOT NULL,
    `Contacto` Int unsigned unique NOT NULL check (`Contacto` between 100000000 and 999999999),
    Primary key(`Cliente`,`Contacto`),
    Index `fk_ClienteTelefone_Cliente_idx` (`Cliente` ASC),
    Constraint `fk_ClienteTelefone_Cliente`
		Foreign key (`Cliente`)
		References `BeloMetroDB`.`Cliente` (`Contribuinte`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
Engine = InnoDB;

-- ---------------------------
-- Tabela Estação
-- ---------------------------

-- Drop table `Estação`

Create Table If Not Exists `BeloMetroDB`.`Estação` (
	`IdEstação` Int unsigned auto_increment unique NOT NULL,
    `Nome` varchar(50) NOT NULL,
    `Longitude` Double NOT NULL,
    `Latitude` Double NOT NULL,
    `PontosInteresse` Varchar(150) NOT NULL,
    `Descrição` TEXT NOT NULL,
    Primary Key(`IdEstação`))
Engine = InnoDB;

-- ---------------------------
-- Tabela Funcionario
-- ---------------------------

-- Drop Table `Funcionario`

Create Table `BeloMetroDB`.`Funcionario` (
	`Contribuinte` INT unsigned NOT NULL check (`Contribuinte` between 100000000 and 999999999),
	`Nome` varchar(75) NOT NULL,
    `DataNascimento` DATE,
    `Genero` char,
    `Rua` varchar(100) NOT NULL,
    `Localidade` varchar(30) NOT NULL,
    `CodigoPostal` varchar(8) NOT NULL,
    `email` varchar(100),
    `cargo` INT NOT NULL check (`cargo` between 0 and 3),
    `Salario` DECIMAL(6,2) NOT NULL,
    `IBAN` varchar(25) NOT NULL,
    `Estação` Int unsigned Not NUll,
	primary key(`Contribuinte`),
    Constraint `fk_Funcionario_Estação`
		Foreign Key(`Estação`)
        references `BeloMetroDB`.`Estação` (`IdEstação`)
        On Delete No Action
        On Update No Action
    );
    
-- ---------------------------
-- Tabela FuncionarioContactos
-- ---------------------------

-- Drop table `FuncionarioContactos`

Create table if not exists `BeloMetroDB`.`FuncionarioContactos` (
	`Funcionario` INT unsigned NOT NULL,
    `Contacto` Int unsigned NOT NULL check (`Contacto` between 100000000 and 999999999),
    Primary key(`Funcionario`,`Contacto`),
    Index `fk_FuncionarioContacto_Funcionario_idx` (`Funcionario` ASC),
    Constraint `fk_FuncionarioContacto_Funcionario`
		Foreign key (`Funcionario`)
		References `BeloMetroDB`.`Funcionario` (`Contribuinte`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION)
Engine = InnoDB;

-- ---------------------------
-- Tabela Bilhete
-- ---------------------------

-- Drop table `Bilhete`

Create Table if not exists `BeloMetroDB`.`Bilhete` (
	`NrVenda` Int unsigned unique auto_increment NOT NULL,
    `FormaPagamento` int NOT NULL check (`FormaPagamento` between 0 and 1),
    `Tipo` int NOT NULL check (`Tipo` between 0 and 1),
    `DataVenda` DATE NOT NULL,
    `DataValidade` DATE NOT NULL,
    `Preço` DECIMAL(5,2) NOT NULL,
    `Funcionario` INT unsigned NOT NULL,
    `Cliente` INT unsigned NOT NULL,
    primary key(`NrVenda`),
    constraint `fk_Bilhete_Funcionario`
		foreign key(`Funcionario`)
        references `BeloMetroDB`.`Funcionario` (`Contribuinte`)
        On delete no action
        ON update no action,
	constraint `fk_Bilhete_Cliente`
		foreign key(`Cliente`)
        references `BeloMetroDB`.`Cliente` (`Contribuinte`)
        ON delete no action
        on update no action)
Engine = InnoDB;
	
-- ---------------------------
-- Tabela Viagem
-- ---------------------------
-- Drop table `Viagem`
Create Table If not Exists `BeloMetroDB`.`Viagem` (
	`IdViagem` Int unsigned auto_increment unique NOT NULL,
    `Bilhete` Int unsigned NOT NULL,
    `Origem` Int unsigned NOT NULL,
    `Destino` Int unsigned NOT NULL,
    `Data` DATE NOT NULL,
    primary key(`IdViagem`),
    Constraint `fk_Viagem_Bilhete`
		foreign Key(`Bilhete`)
        References `BeloMetroDB`.`Bilhete` (`NrVenda`)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	Constraint `fk_ViagemEstação_Origem`
		Foreign Key(`Origem`)
        References `BeloMetroDB`.`Estação` (`IdEstação`)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION,
	Constraint `fk_ViagemEstação_Destino`
		Foreign Key(`Destino`)
        References `BeloMetroDB`.`Estação` (`IdEstação`)
		ON DELETE NO ACTION
        ON UPDATE NO ACTION
	)
engine = InnoDB;

-- ---------------------------
-- Tabela ClienteRealizaViagem
-- ---------------------------

-- Drop table `ClienteRealizaViagem`

Create Table If Not Exists `BeloMetroDB`.`ClienteRealizaViagem` (
	`Cliente` Int unsigned NOT NULL,
    `Viagem` Int unsigned unique NOT NULL,
    Primary Key(`Cliente`,`Viagem`),
    constraint `fk_ClienteRealizaViagem_Cliente`
		foreign key (`Cliente`)
        references `BeloMetroDB`.`Cliente` (`Contribuinte`)
        On Delete No Action
        On Update No Action,
	Constraint `fk_ClienteRealizaViagem_Viagem`
		foreign key (`Viagem`)
        References `BeloMetroDB`.`Viagem` (`IdViagem`)
        On Delete No Action
        On Update No Action)
Engine = InnoDB;

-- ---------------------------
-- Tabela Veiculo
-- ---------------------------

-- Drop table `Veiculo`
    
Create Table If Not Exists `BeloMetroDB`.`Veiculo` (
	`IdVeiculo` varchar(20) Unique Not Null,
    `NrCarruagens` Int Unsigned Not Null,
    `NrLugares` Int Unsigned Not Null,
    Primary Key (`IdVeiculo`))
Engine = InnoDB;

-- ---------------------------
-- Tabela ViagemVeiculo
-- ---------------------------

-- Drop Table `ViagemVeiculo`

Create Table If Not Exists `BeloMetroDB`.`ViagemVeiculo`(
	`Viagem` Int unsigned NOT NULL,
    `Veiculo` varchar(20) NOT NULL,
    primary key (`Viagem`,`Veiculo`),
    constraint `fk_ViagemVeiculo_Viagem`
		foreign key (`Viagem`)
        References `BeloMetroDB`.`Viagem` (`IdViagem`)
        On Delete No action
        On Update No action,
	constraint `fk_ViagemVeiculo_Veiculo`
		foreign key(`Veiculo`)
        References `BeloMetroDB`.`Veiculo` (`IdVeiculo`)
        On Delete No Action
        On Update No Action)
Engine = InnoDB;

-- ---------------------------
-- Tabela EstaçãoVeiculo
-- ---------------------------

-- Drop Table `EstaçãoVeiculo`

Create Table If Not Exists `BeloMetroDB`.`EstaçãoVeiculo`(
	`Estação` Int unsigned NOT NULL,
    `Veiculo` varchar(20) NOT NULL,
    `Hora` DATETIME NOT NULL,
    primary key (`Estação`,`Veiculo`,`Hora`),
    constraint `fk_EstaçãoVeiculo_Estação`
		foreign key (`Estação`)
        References `BeloMetroDB`.`Estação` (`IdEstação`)
        On Delete No action
        On Update No action,
	constraint `fk_EstaçãoVeiculo_Veiculo`
		foreign key(`Veiculo`)
        References `BeloMetroDB`.`Veiculo` (`IdVeiculo`)
        On Delete No Action
        On Update No Action)
Engine = InnoDB;

-- ---------------------------
-- Tabela FuncionarioVeiculo
-- ---------------------------

-- Drop Table `FuncionarioVeiculo`

Create Table If Not Exists `BeloMetroDB`.`FuncionarioVeiculo`(
	`Funcionario` Int unsigned NOT NULL,
    `Veiculo` Varchar(20) NOT NULL,
    `Data` Date NOT NULL,
    `Observações` TEXT NOT NULL,
    primary key (`Funcionario`,`Veiculo`,`Data`),
    constraint `fk_FuncionarioVeiculo_Funcionario`
		foreign key (`Funcionario`)
        References `BeloMetroDB`.`Funcionario` (`Contribuinte`)
        On Delete No action
        On Update No action,
	constraint `fk_FuncionarioVeiculo_Veiculo`
		foreign key(`Veiculo`)
        References `BeloMetroDB`.`Veiculo` (`IdVeiculo`)
        On Delete No Action
        On Update No Action)
Engine = InnoDB;
