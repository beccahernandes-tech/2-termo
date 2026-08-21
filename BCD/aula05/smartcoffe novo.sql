-- PROJETO SMARCOFFE_REBECCA
CREATE DATABASE SMARTCOFFE_REBECCA;
create database if not exists SMARTCOFFE_REBECCA;

use SMARTCOFFE_REBECCA;

create table if not exists cliente(
id_cliente int auto_increment primary key,
nome varchar(50) not null,
CPF varchar(14) not null,
idade varchar(2) ,
nascimento date not null ,
cidade varchar(50) 
);

create table if not exists pedidos(
id_pedidos int auto_increment primary key,
nome varchar(50) not null,
data_do_pedido date not null,
preço varchar(4) ,
status_pedido enum ('ativo', 'inativo') default ('ativo')
);

create table if not exists categoria(
id_categoria int auto_increment primary key,
descrição varchar(50) not null,
tipo_categoria varchar(50) not null,
exibição varchar(30) ,
status_categoria enum ('no estoque', 'falta') default ('no estoque')
);

create table if not exists produtos(
id_produtos int auto_increment primary key,
nome varchar(50) not null,
codigo_de_barra varchar(50) not null,
descrição varchar(30) ,
quantidade varchar(10),
status_categoria enum ('no estoque', 'falta') default ('no estoque')
);






