drop database vendas;
create database vendas;
use vendas;

create table cliente(
id_cliente int auto_increment primary key,
nome_cliente varchar(50) not null,
cpf char(11) not null,
email varchar(100),
telefone char(15)
);

create table produto(
id_produto int auto_increment primary key,
nome_produto varchar(50) not null,
preco decimal(10,2),
estoque int
 );

create table vendedor(
id_vendedor int auto_increment primary key,
nome_vendedor varchar(50) not null,
 email varchar(100),
 salario decimal(10,2)
 );
 
 create table venda(
 id_venda int auto_increment primary key,
 id_cliente int,
 id_vendedor int,
 data_venda date,
 tipo_pedido varchar(30) not null,
 total decimal(10,2),
 foreign key (id_cliente) references cliente(id_cliente),
 foreign key (id_vendedor) references vendedor(id_vendedor)
);

create table item_venda(
id_item int primary key,
id_venda int,
id_produto int,
quantidade int,
preco_unitario decimal(10,2),
foreign key (id_venda) references venda(id_venda),
foreign key (id_produto) references produto(id_produto)
);

insert into cliente
(nome_cliente, cpf, email, telefone)
values 
('João Silva', '12345678900', 'joao.silva@email.com', '(11) 98765-4321'),
('Maria Souza', '23456789011', 'maria.souza@email.com', '(21) 91234-5678'),
('Carlos Lima', '34567890122', 'carlos.lima@email.com', '(31) 99876-5432'),
('Ana Costa', '45678901233', 'ana.costa@email.com', '(41) 98765-4321'),
('Fernanda Dias', '56789012344', 'fernanda.dias@email.com', '(51) 95678-1234');

insert into produto
(nome_produto, preco, estoque) 
values 
('Notebook Lenovo', 3200.00, 15),
('Mouse', 150.00, 50),
('Teclado Mecânico', 420.00, 20),
('Monitor 27 Polegadas', 1300.00, 10),
('Headset Bluetooth', 299.90, 35); 

insert into vendedor
(nome_vendedor, email, salario)
values 
('Pedro Santos', 'pedro.santos@email.com', 3200.00),
('Laura Alves', 'laura.alves@email.com', 3400.00),
('Rafael Costa', 'rafael.costa@email.com', 3100.00),
('Juliana Freitas', 'juliana.freitas@email.com', 3300.00),
('Marcos Paulo', 'marcos.paulo@email.com', 3000.00);

insert into venda 
(id_cliente, id_vendedor,  data_venda,  total)
values 
(1, 1, '2024-04-15', 3500.00, 'Venda'),
(2, 2, '2024-04-16', 800.00, 'Venda'),
(3, 3, '2024-04-17', 1800.00, 'Venda'),
(4, 4, '2024-04-18', 2200.00, 'Venda'),
(5, 5, '2024-04-19', 2750.00, 'Venda');

-- 1 
select * from cliente;

-- 2
select nome_produto from produto;

-- 3
select * from produto
where preco > 100;

-- 4
select nome_cliente from cliente;

-- 5
select c.nome_cliente as cliente, p.nome_produto as produto
from cliente c
cross join produto p;

-- 6
select count(*) as total_cliente from cliente;

-- 7
select count(*) as total_produto from produto;

-- 8
select count(*) as total_pedidos_2024
from venda
where year(data_venda) = 2024;

-- 9
select sum(total) as valor_total_vendas
from venda;

-- 10
select sum(total) as vendas_funcionario_5
from venda
where id_vendedor = 5;

-- 11
select count(*) as pedidos_joao_silva
from venda v
join cliente c on c.id_cliente = v.id_venda
where c.nome_cliente = "João Silva";

-- 12
select sum(total) as soma_vendas
from venda
where tipo_pedido = "Venda";

-- 13
select count(*) as vendedor_mais_3000
from vendedor
where salario > 3000;

-- 14
select count(*) as produto_acima_100
from produto
where preco > 100;

-- 15
select sum(total) as soma_pedidos_cliente_2
from venda
where id_cliente = 2;







