drop database espaco;
create database espaco;
use espaco;

create table funcionarios(
id_funcionario int auto_increment primary key,
nome_funcionario varchar(50) not null,
email varchar(100),
salario decimal(10,2)
 );
 
insert into funcionarios
(nome_funcionario, email, salario)
values
("Luiza Andrade", "luiza.andrade@gmail.com", 4000.00),
("Jorge Luiz", "jorge.luiz@gmail.com", 3500),
("Juliana Freitas", "juliana.freitas@gmail.com", 3900.00),
("Laura Alves", "laura.alves@gmail.com", 3000.00),
("Bianca Andrade", "bianca.andrade@gmail.com", 5300.00),
("Pedro Santos", "pedro.santos@gmail.com", 4500.00);

-- exercicio 1
delimiter // 
create procedure listar_funcionarios()
begin
	select id_funcionario, nome_funcionario, email, salario
    from funcionarios;
end //
delimiter 

call listar_funcionarios();

-- execicio 2
delimiter // 
create function calcular_salario_anual(salario decimal(10,2))
returns decimal(10,2)
deterministic
begin
	return salario * 12;
end //
delimiter 

select calcular_salario_anual(4000);

-- execicio 3
delimiter //
create procedure inserir_funcionarios(
    in nome_funcionario varchar(50),
    in email varchar(100),
    in salario decimal(10,2)
)
begin
    insert into funcionarios (nome_funcionario, email, salario)
    values (nome_funcionario, email, salario);
end //
delimiter ;

call inserir_funcionarios("Lucas Ferreira", "lucas.ferreira@gmail.com", 3700.00);

-- execicio 4
create view vw_listar_funcionarios as 
select id_funcionario, nome_funcionario, salario
from funcionarios;

create view vw_funcionarios_salario as
select id_funcionario, nome_funcionario, salario
from funcionarios;

select * from vw_listar_funcionarios;
select * from vw_funcionarios_salario;





