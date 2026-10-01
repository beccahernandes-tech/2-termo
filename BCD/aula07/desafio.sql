-- Active: 1788435082275@@127.0.0.1@3306@smartcoffe_dml_rebecca
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: _______________________________________________
-- Turma: ______________________ Data: _________________
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('ANTHONY', 'anthony@gmail.com', '65888999900', 'Limeira', TRUE),
('murilo', 'murilo@gmail.com', '19935053254', 'Americana', TRUE);

SELECT * FROM cliente; 
-- 2. Cadastre a categoria 'Especiais da Casa'.

INSERT INTO categoria (nome) VALUES 
('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.

SELECT id_categoria from categoria; 

-- VER OQUE TEM DENTRO DO ID 

SET @categoria_especial = SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa'

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Cupcake', 8.00, TRUE, 14),
('Musse de Chocolate', 12.00, TRUE, 14),
('Fondue', 14.00, TRUE, 14);

insert into PRODUTO (nome. preco. ativo, id_categoria) VALUES 
('Sorvete fit', 8.00, TRUE, @categoria_especial);
-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES 
('bruno', 'bruno@gmail.com', 'NOT NULL', 'São Paulo', TRUE);

-- 5. Crie um novo pedido para um dos clientes cadastrados.
SET @cliente_atividade = (Select id_cliente from cliente where email = 'luana.a09@email.com');

INSERT INTO pedido (data_pedido, status_pedido, valor_total, id_cliente) 
VALUES 
(NOW(), 'ABERTO', 0.00, cliente_atividade);

SELECT * FROM item_pedido;
-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
-- 1. Insere o pedido ajustando os nomes das colunas conforme sua tabela
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
VALUES (@pedido_atividade, 4,1,13.00), (@pedido_atividade,9,2,9.00);
-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:

SELECT * FROM cliente WHERE email = 'luana.a09@gmail.com';

-- UPDATE:

UPDATE cliente 
SET telefone = '112512345789'
WHERE id_cliente = 121
-- SELECT final:
SELECT * FROM cliente WHERE email = 'luana.a09@gmail.com'

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

UPDATE cliente 
SET telefone = '1111155552',
    cidade = 'São Paulo'
WHERE id_categoria = 121;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = @categoria_especial;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido 
SET status = 'PREPARANDO'
WHERE id_pedido = @pedido_atividade; 

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
-- 1)
SELECT SUM (quantidade*preco_unitario) AS total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido 
SET valor_total = (SELECT SUM(quantiddade*preco_unitario) FROM item_pedido WHERE id_pedido = @pedido_atividade )

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

SELECT * FROM produto WHERE nome = 'Croissant Especial';

UPDATE produto 

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

INSERT INTO cliente (nome,email,cidade)
VALUES ('Cliente Temporario', 'temporario.a09@email.com', 'Limeira');

SELECT * FROM clente WHERE email = 'temporario.a09@email.com';

DELETE * FROM cliente WHERE email = 'temporario.a09@email.com';

SELECT * FROM cliente WHERE email = 'temporario.a09@email.com';

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:

DELETE FROM cliente WHERE id_cliente = @pedido_atividade;

-- O erro foi: Ao deletar não foi possivel pois a chave estrangeira depende de um vinculo de relação com outra tabela 

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:
-- Pois possui dependencias em outra tabela e possui dados com informações 

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

INSERT INTO categoria (nome) VALUES
('Excluir Depois');

DELETE from categoria
WHERE nome = 'Excluir Depois';
