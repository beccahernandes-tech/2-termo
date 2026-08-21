-- COMANDO PARA CRIAR BANCO DE DADOS 
-- 1)
create database escola_rebecca;
-- VERIFICAR BANCO E CRIAR
create database if not exists escola_rebecca;

-- ATIVAR O BD
use escola_rebecca;


-- TABELAS
create table if not exists alunos(
id_cadastro int auto_increment primary key,
nome varchar (50) not null,
CPF varchar (14) not null unique,
NASCIMENTO date,
idade varchar(2),
CIDADE enum ("LIMEIRA", "SAO PAULO") default 'LIMEIRA' -- DEFAULT : PARA NN DEIXAR VAZIO SE ELE NAO PREENCHER 
);

create table if not exists disciplina(
id_disciplina int auto_increment primary key,
NOME varchar (50) not null,
CARGA_HORARIA varchar(50),
PROFESSOR varchar(50),
DIAS_DA_SEMANA varchar(30),
AREA_CONHECIMENTO varchar(40)
);

create table if not exists avaliação(
id_avaliação int auto_increment primary key,
data_prova date not null,
duração varchar(20),
tipo_de_prova varchar(20),
peso varchar (10),
nota_boletim varchar(10)
);




-- VIZUALIZAR TABELAS 
-- 4)
show tables;

-- APAGAR BD 
drop database escola_rebecca;
-- APAGAR TABELAS
drop tables cadastro; -- apaga a tabela td com as informações e td 

-- COMANDOS PARA EXECUTAR CASO TENHA ESQUECIDO ALGO NAS TABELAS 
-- INSERIR CAMPOS
alter table cadastro add email varchar(100);

-- ALTERAR TIPO DE DADOS 
alter table cadastro modify nascimento datetime;

-- RENOMEAR TABELAS
rename table cadastro to alunos;

-- APAGAR DADOS DE UMA TABELA 
truncate table disciplina; -- apaga só as informações que estão dentro da tabela 

-- APAGAR COLUNA OU ATRIBUTO
alter table alunos drop column idade;

-- RENOMEAR TABELAS
rename table cadastro to alunos;

-- INSERINDO DADOS NA TABELA 
insert into disciplina  (id_disciplina, nome, carga_horaria, professor, dias_da_semana, area_conhecimento) 
values (1, 'rebecca','3', 'ricardo', 'quarta e sexta', 'matematica'),
(2, 'vinicius', '04:00', 'celso', 'sexta', 'historia'), 
(3, 'bubu', '05:00', 'bruno', 'segunda', 'artes');

-- CONSULTAR DADOS EM UMA TABELA 
select * from disciplina;

insert into avaliação (id_avaliação, data_prova, duração, tipo_de_prova, peso, nota_boletim) 
values (1, '2026-08-20', '05:00', 'pratica', 3, 10),
(2, '2026-08-19', '02:00', 'escrita', 6, 6),
(3, '2026-05-13', '08:00', 'experimento', 8, 9),
(4, '2026-08-19', '06:00', 'objetiva',5, 7),
(5, '2026-10-18', '04:00', 'dissertativa',2, 10);


select * from avaliação;

truncate table avaliação;












