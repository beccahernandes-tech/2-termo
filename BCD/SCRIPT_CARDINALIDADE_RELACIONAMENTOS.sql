-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
id_cliente int auto increment primary key PRIMARY KEY,
nome_cliente varchar (60) not null
);

CREATE TABLE PEDIDO (
id_pedido int auto increment primary key PRIMARY KEY,
data_pedido datetime not null,
id_cliente int not null
);

CREATE TABLE PRODUTO (
id _produto int auto increment primary key,
nome_produto varchar(100) not null,
quantidade int not null,
PRIMARY KEY(id _produto,id_estoque)
);

CREATE TABLE estoque (
id_estoque int auto_increment primary key,
id_produto int not null unique,
quantidade int not null,
FOREIGN key (id_produto) references produto (id_produto)
);

