-- Active: 1788435082275@@127.0.0.1@3306@smartcoffe_dml_rebecca
-- BANCO DE DADOS - SMARTCOFFE - DML 

DROP DATABASE IF EXISTS SMATCOFFE_DML_REBECCA

CREATE DATABASE IF NOT EXISTS SMARTCOFFE_DML_REBECCA;

USE SMARTCOFFE_DML_REBECCA;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR (120) UNIQUE,
    telefone VARCHAR(15),
    cidade VARCHAR (60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE  
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria)
);

CREATE TABLE pedido(
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status_pedido ENUM("ABERTO", "PREPARANDO", "FINALIZADO", "CANCELADO") NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR (150)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
    REFERENCES pedido (id_pedido),
    CONSTRAINT fk_pagamento_forma_pagamento FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento (id_forma_pagamento)
);

-- INSERINDO DADOS NO BD 
 
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES 
('Luis Felipe', 'luisfelipe@hotmail.com', '19939995', 'Limeira', TRUE ),
('Maria', 'maria@email.com', '19999905', 'Limeira', TRUE), 
('Mateus', 'mateus@email.com', '19999906', 'Limeira', TRUE),
('Mateus Oricolli', 'matheus@email.com', '19999903', 'Limeira', TRUE),
('Nicolas', 'nicolas@email.com', '19999908', 'Limeira', TRUE),
('Otavio Correia', 'otavio@email.com', '19999904', 'Conchal', TRUE),
('Rafael Vieira', 'rafael@email.com', '19999907', 'Limeira', TRUE),
('Rebecca', 'becca.hernandes@hotmail.com', '19935053254', 'Limeira', TRUE ),
('Renann Campos', 'rennan@email.com', '199999044', 'Limeira', TRUE),
('Samira Daloxto', 'dalosto@email.com', 'null', 'Limeira', FALSE),
('Sophia Carolina', 'sophia@email.com', '19999901', 'TAUBATE', TRUE),
('Vanessa Queiroz', 'vanessa@email.com', '19999912', 'Limeira', TRUE),
('Vinicius Henrique', 'viniciusH@email.com', '199999014', 'Limeira', TRUE),
('Vinicius Santos', 'viniciussants@email.com', 'null', 'Chicago', TRUE);

SELECT * FROM cliente; 

INSERT INTO categoria (nome) VALUES 
('Cafe'), ('Bebidas Quentes'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combo');

SELECT * FROM categoria;

SELECT * FROM produto;

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('cafe expresso', 16.00, TRUE, 1),
('cafe gelado', 18.00, TRUE, 1),
('capuccino', 20.00, TRUE, 1),
('cafe com leite', 14.00, TRUE, 1),
('cafe cremoso', 13.00, TRUE, 1),
('cafe americano', 20.00, TRUE, 1);

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('CHÁ', 12.00, TRUE, 2),
('CHOCOLATE QUENTE', 11.00, TRUE, 2),
('CHÁ LATTE', 10.00, TRUE, 2),
('MOCACCINO', 16.00, TRUE, 2),
('CAPPUCINO', 13.00, TRUE, 2),
('MATE', 20.00, TRUE, 2);

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('SORVETE', 16.00, TRUE, 3),
('COCA COLA', 18.00, TRUE, 3),
('MILK SHAKE', 20.00, TRUE, 3),
('SODA ITALIANA', 14.00, TRUE, 3),
('SUCOS', 13.00, TRUE, 3),
('ICED COFFE', 20.00, TRUE, 3);

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('PALHA ITALIANA', 17.00, TRUE, 4),
('DOCE DE MORANGO', 20.00, TRUE, 4),
('MORANGO CRAVEJADO', 20.00, TRUE, 4),
('DOCE DE LEITE', 12.00, TRUE, 4),
('BOLO', 13.00, TRUE, 4),
('BRIGADEIRO', 02.00, TRUE, 4);

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('TORTA DE FRANGO', 16.00, TRUE, 5),
('CARNE DE GATO', 18.00, TRUE, 5),
('PANQUECA', 20.00, TRUE, 5),
('BARQUINHA', 14.00, TRUE, 5),
('MAIONESE', 13.00, TRUE, 5),
('PAO DE QUEIJO', 20.00, TRUE, 5);

INSERT INTO produto (nome, preco, ativo, id_categoria) 
VALUES 
('SALGADO E SUCO', 16.00, TRUE, 6),
('PANQUECA E SALADA', 20.00, TRUE, 6),
('SUCO E PANQUECA', 20.00, TRUE, 6),
('BOLO E GUARANA', 19.00, TRUE, 6),
('PAO DE QUEIJO E CAFE', 16.00, TRUE, 6),
('MAIONESE E BARQUINHA', 20.00, TRUE, 6);

SELECT * FROM pedido;

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) VALUES 
(NOW(),'ABERTO', 0.00,1),
('2026-10-02 09:35:00', 'FINALIZADO', 0.00,1),
(NOW(), 'ABERTO', 0.00,1);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) 
VALUES 
(1, 2, 4, 16.00, NULL),
(2, 26, 9, 9.00, 'SEM AÇUCAR'),
(3, 18, 2, 35.00, NULL),
(4, 47, 7, 07.00, 'PARA LEVAR'),
(5, 2, 15, 36.00, NULL),
(6, 8, 5, 08.00, NULL);

SELECT * FROM item_pedido;

INSERT INTO forma_pagamento (descricao) VALUES 
('Dinheiro'), ('Cartão de Crédito'), ('Cartão de Débito'), ('Pix');

SELECT * FROM forma_pagamento;

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(2, 2, 19.50, '2026-09-10 09:25:00'),
(2, 4, 0.00, NOW()),
(3, 4, 15.00, NULL);
 
SELECT * FROM pagamento; 

-- EXEMPLO NOVO DE INSERÇÃO DE DADOS PÓREM COM RECUPERAÇÃO DO ÚLTIMO ID 
INSERT INTO (data_pedido, status_pedido, valor_total, id_cliente) VALUES (NOW(), 'ABERTO', '0.00,1');
SET @pedido = LAST_INSERT_ID();
SELECT @pedido;

-- ATUALIZAÇÕES E MODIFICAÇÕES DE DADOS 
-- EX 01
UPDATE cliente
SET telefone = '1999988801'
WHERE id_cliente = 10;

-- EX 02UPDATE produto
SET preco = 1.00;
-- NUNCA REALIZAR UM UPDATE SEM --- WHERE

-- EX 03
UPDATE cliente
SET telefone = '1999988801',
    cidade = 'Valinhos'
WHERE id_cliente = 10;

-- EX 04 AJUSTE DE VALORES
UPDATE produto
SET preco - preco * 1.05
WHERE id_categoria = 1;

-- EX 05 AJUSTES DE ATUALIZAÇÕES CONDICIONAIS 
UPDATE produto
SET preco = CASE
    WHEN preco < 10 THEN preco * 1.10
    ELSE preco * 1.05
END 
WHERE ativo = TRUE;
