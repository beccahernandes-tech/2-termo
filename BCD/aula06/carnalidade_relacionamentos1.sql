-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
id_cliente int auto increment primary key PRIMARY KEY,
nome_cliente varchar (50)
)

CREATE TABLE PEDIDO (
id_pedido int auto increment primary key PRIMARY KEY,
data_pedido datetime not null,
id_cliente int auto increment primary key,
FOREIGN KEY(id_cliente) REFERENCES CLIENTE (id_cliente)
)

CREATE TABLE ESTOQUE (
id _produto int auto increment primary key,
nome_produto varchar(100) not null,
id_estoque int auto increment primary key,
quantidade int not null,
PRIMARY KEY(id _produto,id_estoque)
)

CREATE TABLE FORNECEDOR (
id_fornecedor int auto increment primary key PRIMARY KEY,
razao_social varchar (100) not nuill
)

CREATE TABLE PRODUTO (
id_produto int auto increment primary key PRIMARY KEY,
nome_produto varchar(100) not null
)

CREATE TABLE Relação_3+item_produto (
id_produto int not null,
id_fornecedor int not null,
id_item int auto increment primary key PRIMARY KEY,
valor decimal (10,2)/*falha: chave estrangeira*//*falha: chave estrangeira*/
)

