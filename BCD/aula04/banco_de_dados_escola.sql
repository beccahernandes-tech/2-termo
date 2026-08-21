-- COMANDO PARA CRIAR BANCO DE DADOS 
create database ESCOLA_REBECCA;
create database ESCOLA_REBECCA2;

-- COMANDO PARA APAGAR BANCO DE DADOS 
drop database ESCOLA_REBECCA2;

-- COMANDO PARA ATIVAR BANCO DE DADOS 
use ESCOLA_REBECCA;

-- COMANDO PARA CRIAR TABELAS 
create table clientes (
id_cliente int auto_increment primary key,
NOME varchar(60) not null,
CPF varchar(14) not null unique,
EMAIL varchar(60),
IDADE int not null, 
TELEFONE varchar(14),
DATA_NASCIMENTO timestamp default current_timestamp
);

CREATE TABLE TURMA (
id_turma int auto_increment primary key,
NUMERO_DA_SALA varchar(5) not null, 
ANO year not null,
TURNO varchar(5) not null,
HORARIO_INICIO time,
HORARIO_FIM time
);

CREATE TABLE DISCIPLINA (
id_disciplina int auto_increment primary key,
NOME varchar (50),
CARGA_HORARIA varchar(50),
PROFESSOR varchar(50),
DIAS_DA_SEMANA varchar(30),
AREA_CONHECIMENTO varchar(40)
);

CREATE TABLE AVALIAÇÃO (
id_avaliação int auto_increment primary key,
DATA date,
DURAÇÃO varchar(5),
TIPO_DE_PROVA varchar(10),
PESO varchar(1),
NOTA_BOLETIM varchar (2) not null
);
CREATE TABLE PROFESSOR (
id_professor int auto_increment primary key,
NOME varchar (50),
CPF varchar(14) not null unique,
MATERIA date not null,
DATA_DE_ADMISSÃO datetime
)

-- COMANDO PARA APAGAR TABELAS 
DROP TABLE FUNCIONARIOS;










