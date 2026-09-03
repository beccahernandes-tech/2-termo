create database OFICINA_REBECCA;

use OFICINA_REBECCA;
create table CLIENTES (
id_clientes int auto_increment primary key,
NOME varchar(60) not null,
CPF varchar(14) not null unique,
EMAIL varchar(50),
TELEFONE varchar(14),
cidade varchar(20)
);

create table FUNCIONARIOS (
id_funcionarios int auto_increment primary key,
NOME varchar(60) not null,
FUNÇÃO varchar(50),
EMAIL varchar(50),
TELEFONE varchar(14),
CPF varchar(14) not null unique
);

create table SERVIÇOS (
id_servicos int auto_increment primary key,
TEMPO time not null,
TIPO varchar(50) not null,
DATA_ENTREGA datetime,
VALOR decimal,
FUNCIONARIO varchar(50)
);

create table PEÇAS (
id_pecas int auto_increment primary key,
NOME varchar(60) not null,
LOCAL varchar(50),
PRECO decimal,
QUANTIDADE varchar(14) not null,
DIA_PEDIDO datetime
);

create table FORNECEDORES (
id_pecas int auto_increment primary key,
NOME varchar(60) not null,
cidade varchar(20),
CNPJ varchar(20) not null,
VALOR_DESCONTO decimal,
DATA_DE_FORNECIMENTO datetime
);

create table ORDEM_DE_SERVICO (
id_ordemserviço int auto_increment primary key,
NOME varchar(60) not null,
serviço varchar(100),
VALOR decimal,
FUNCIONARIO varchar(50),
PECAS_TROCADAS varchar(10) not null
);

create table PAGAMENTO (
id_pagamento int auto_increment primary key,
FORMA enum ("PIX", "BOLETO", "DEBITO", "CREDITO", "DINHEIRO") default 'BOLETO',
cidade varchar(20),
CPF varchar(14) not null unique,
DATA_PAGAMENTO datetime
);

create table VEICULOS (
id_veiculos int auto_increment primary key,
ano year,
motor enum ("MANUAL","ELETRICO") default 'MANUAL',
NOME varchar(60) not null,
TIPO enum ("CARRO", "CAMINHONETE") default 'CARRO',
PLACA varchar(50) not null
);

create table MARCA (
id_marca int auto_increment primary key,
ano year,
NOME varchar(60) not null,
FABRICAÇÃO datetime,
PAIS varchar(50),
ESTILO varchar(50) not null
);

create table MODELOS (
id_modelos int auto_increment primary key,
ano year,
COR varchar(50),
TIPO enum ("MANUAL","ELETRICO") default 'MANUAL',
PAIS varchar(50),
ESTILO varchar(50) not null
);
