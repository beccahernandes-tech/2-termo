-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE CLIENTE (
id_cliente int auto increment primary key PRIMARY KEY,
nome_cliente varchar (50)
)

CREATE TABLE PEDIDO (
id_pedido int auto increment primary key PRIMARY KEY,
data_pedido datetime not null,
id_cliente int not null/*falha: chave estrangeira*/
)

CREATE TABLE PRODUTO+ESTOQUE (
id _produto int auto increment primary key,
nome_produto varchar(100) not null,
id_estoque int primary key unique,
quantidade int not null,
PRIMARY KEY(id _produto,id_estoque)
)

