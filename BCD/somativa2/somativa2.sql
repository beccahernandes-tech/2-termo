-- Active: 1788435082275@@127.0.0.1@3306@biblioteca_som2
create database biblioteca_som2;

use biblioteca_som2;

create table USUARIO (
    id_usuario int primary key auto_increment,
    nome VARCHAR(100) not NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

create table livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)
);

create table EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL, 
    id_livro INT NOT NULL, 
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE NOT NULL, 
    status_emprestimo VARCHAR(20) DEFAULT 'ABERTO' CHECK (status_emprestimo IN ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
    CONSTRAINT fk_EMPRESTIMO_USUARIO FOREIGN KEY (id_usuario)
    REFERENCES USUARIO (id_usuario),
    CONSTRAINT fk_EMPRESTIMO_LIVRO FOREIGN KEY (id_livro)
    REFERENCES livro (id_livro)
);

ALTER TABLE USUARIO add editora VARCHAR(100);

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES 
('rebecca', 'becca@hotmail.com','19992296545', TRUE),
('vinicius', 'vini@hotmail.com', '155422878885', TRUE),
('rennan', 'rennanvieira@hotmail.com', '15444228779', TRUE),
('otavio', 'otaviocorreira@hotmail.com', NULL, TRUE);

INSERT INTO LIVROS (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES 
('é assim que acaba', 'collen hover', '020000212', '2015', '15'),
('é assim que comeca', 'collen hover', '255006644', '2017', '16'),
('valerity', 'collen hover', '257888442', '2019', '22'),
('a culpa é das estrelas', 'john green', '65448858', '2019', '32'),
('o lado feio do amor', 'collen hover', '154589845', '2011', '45'),
('a assistente do vilao', 'owen cooper', '154598786', '2011', '17');

INSERT INTO EMPRESTIMO (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES 
(105, 1, '2026-10-22 20:00', '2026-10-25', '2026-11-01', 'ABERTO'),
(107, 2,'2026-10-23 12:50', '2026-10-27', '2026-11-10', 'ABERTO'),
(108, 3, '2026-10-24 15:00', '2026-10-30, 2026-11-12', 'ABERTO');

SELECT nome 
FROM USUARIO 
WHERE nome LIKE 'rebecca';

UPDATE USUARIO 
SET telefone = 222223333
WHERE id_usuario = 105

select * from USUARIO

UPDATE LIVRO 
SET quantidade_disponivel = quantidade_disponivel + 2 
WHERE ano_publicacao >= 2020

INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('bruno', 'bruno@hotmail.com','12225545865', TRUE);

DELETE from USUARIO
WHERE nome = 'bruno';

DELETE from USUARIO
WHERE nome = 'vinicius';

DROP TABLE EMPRESTIMO

SELECT titulo, autor, quantidade_disponivel 
FROM livros

SELECT quantidade_disponivel 
FROM livros 
WHERE quantidade_disponivel > 2;

SELECT titulo 
FROM livros 
WHERE titulo LIKE '%estrelas';

SELECT titulo, ano_publicacao 
FROM livros 
WHERE preco BETWEEN 8.00 AND 15.00;