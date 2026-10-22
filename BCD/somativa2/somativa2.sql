-- Active: 1788435082275@@127.0.0.1@3306@biblioteca_som2
-- 1)
create database biblioteca_som2;

use biblioteca_som2;
-- 2)
create table USUARIO (
    id_usuario int primary key auto_increment,
    nome VARCHAR(100) not NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);
-- 3)
create table livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT NOT NULL,
    quantidade_disponivel INT DEFAULT 0 CHECK (quantidade_disponivel >= 0)
);
--  4)
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
-- 5)
ALTER TABLE USUARIO add editora VARCHAR(100);

-- 6)
INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES 
('rebecca', 'becca@hotmail.com','19992296545', TRUE),
('vinicius', 'vini@hotmail.com', '155422878885', TRUE),
('rennan', 'rennanvieira@hotmail.com', '15444228779', TRUE),
('otavio', 'otaviocorreira@hotmail.com', NULL, TRUE);

-- 7)
INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) VALUES 
('é assim que acaba', 'collen hover', '020000212', '2015', '15'),
('é assim que comeca', 'collen hover', '255006644', '2017', '16'),
('valerity', 'collen hover', '257888442', '2019', '22'),
('a culpa é das estrelas', 'john green', '65448858', '2019', '32'),
('o lado feio do amor', 'collen hover', '154589845', '2011', '45'),
('a assistente do vilao', 'owen cooper', '154598786', '2011', '17');

-- 8)
INSERT INTO EMPRESTIMO (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES 
(105, 1, '2026-10-22 20:00', '2026-10-25', '2026-11-01', 'ABERTO'),
(107, 2,'2026-10-23 12:50', '2026-10-27', '2026-11-10', 'ABERTO'),
(108, 3, '2026-10-24 15:00', '2026-10-30', '2026-11-12', 'ABERTO'),
(108, 3, '2026-10-25 15:00', '2026-10-31', '2026-11-21', 'DEVOLVIDO');

-- 9)
SELECT nome 
FROM USUARIO 
WHERE nome LIKE 'rebecca';

UPDATE USUARIO 
SET telefone = 222223333
WHERE id_usuario = 105

select * from USUARIO

-- 10)
UPDATE LIVRO 
SET quantidade_disponivel = quantidade_disponivel + 2 
WHERE ano_publicacao >= 2020

-- 11)
INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('bruno', 'bruno@hotmail.com','12225545865', TRUE);

DELETE from USUARIO
WHERE nome = 'bruno';

DELETE from USUARIO
WHERE nome = 'vinicius';

DROP TABLE EMPRESTIMO

-- 12)
SELECT titulo, autor, quantidade_disponivel 
FROM livros

-- 13)
SELECT quantidade_disponivel 
FROM livros 
WHERE quantidade_disponivel > 2;

-- 14)
SELECT titulo 
FROM livros 
WHERE titulo LIKE '%estrelas';

-- 15)
SELECT titulo, ano_publicacao 
FROM livros 
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16)
SELECT 
    COUNT(*) AS quantidade_disponivel,
    AVG(quantidade_disponivel) AS media_mensal,
    MIN(quantidade_disponivel) AS MENOR_ESTOQUE, 
    MAX(quantidade_disponivel) AS MAIOR_ESTOQUE,
    SUM(quantidade_disponivel) AS Faturamento_Mensal 
FROM livros; 

-- 17)
SELECT E.id_emprestimo, E.id_usuario, E.id_livro, E.data_prevista, E.status_emprestimo
FROM EMPRESTIMO AS E
INNER JOIN USUARIO AS U 

-- 18)
SELECT data_emprestimo, id_usuario  
FROM emprestimo 
WHERE status_emprestimo = 'ABERTO';

-- 19)
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM usuario AS U
LEFT JOIN emprestimo AS E ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome ORDER BY QUANTIDADE DESC;

-- 20)
SELECT U.id_usuario, U.nome, COUNT(E.id_emprestimo) AS Quantidade
FROM Usuario AS U
LEFT JOIN Emprestimo AS E ON E.id_usuario = U.id_usuario
GROUP BY U.id_usuario, U.nome;

-- 21)
START TRANSACTION;

INSERT INTO EMPRESTIMO (id_usuario, id_livro, data_emprestimo, data_prevista, data_devolucao, status_emprestimo) VALUES 
(107, 4, '2026-10-30 21:00', '2026-10-27', '2026-11-08', 'DEVOLVIDO');
UPDATE livro SET quantidade_disponivel = 1 WHERE id_livro = 4;
SELECT * FROM livro;
COMMIT;

-- 22)
START TRANSACTION;
UPDATE livro SET quantidade_disponivel = 10000 WHERE id_livro = 5;
SELECT * FROM livro;
ROLLBACK;
SELECT * FROM livro;

-- 23)
START TRANSACTION;
UPDATE livro SET quantidade_disponivel = 10 WHERE id_livro = 3;
SAVEPOINT quantidades_livros;
UPDATE livro SET quantidade_disponivel = 100000000000 WHERE id_livro = 10
ROLLBACK TO SAVEPOINT reajuste_cafes;
COMMIT;

-- 24)
START TRANSACTION
SELECT * FROM emprestimo;
UPDATE emprestimo
SET status_emprestimo = 'FECHADO',
data_devolucao = NOW()
WHERE id_emprestimo = 5;
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel + 1
WHERE id_livro = 1;
COMMIT;
SELECT * FROM emprestimo;

-- 25)
-- A) UNIQUE PARA SER UNICOS 
-- B) USAR O UNIQUE 
-- C) USAR O CHECK
-- D) USAR O INSERT INTO
-- E) DELETE 
-- F) COMMIT 
-- G) CHECK = 0 

