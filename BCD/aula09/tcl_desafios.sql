-- ATIVIDADE PRATICA - AULA 10
-- Aluno(a): _________________________________________________
-- Regra: valide sempre antes de COMMIT.

-- 01. Consulte produto 2 e seu preço.

SELECT preco FROM produto where id_produto = 2;
-- 02. START TRANSACTION e aumente produto 2 em R$3,00.
START TRANSACTION;
UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2;
-- 03. Consulte dentro da transação.
SELECT preco FROM produto WHERE id_produto = 2;
-- 04. ROLLBACK.
ROLLBACK 
-- 05. Consulte e comprove retorno.
SELECT preco FROM produto WHERE id_produto = 2;
-- 06. Repita a alteração e finalize com COMMIT.
START TRANSACTION;
UPDATE produto
SET preco = preco + 3.00
WHERE id_produto = 2;
commit;
-- 07. START TRANSACTION e aumente produto 3 em 10%.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.1
WHERE id_produto = 3;
-- 08. SAVEPOINT ajuste_produto3.
SAVEPOINT ajuste_produto3;
-- 09. Aumente produto 4 em 50%.
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.1
WHERE id_produto = 4;
-- 10. Consulte os dois.
SELECT preco FROM produto WHERE id_produto = 3;
SELECT preco FROM produto WHERE id_produto = 4;
-- 11. ROLLBACK TO SAVEPOINT ajuste_produto3.
START TRANSACTION;
SAVEPOINT ajuste_produto3;
UPDATE produto SET preco = preco * 1.1 WHERE id_produto = 4;
ROLLBACK TO SAVEPOINT ajuste_produto3;
COMMIT;

-- A ALTERAÇÃO ACONTECEU PQ O VALOR MUDOU ADICIONOU 10% 

-- 13. START TRANSACTION.
START TRANSACTION;
-- 14. Crie pedido para cliente 1 e salve o id em @novo_pedido.
INSERT INTO pedido (id_cliente, data_pedido, status_pedido) VALUES (1, NOW(), 'ABERTO');
SET @novo_pedido = LAST_INSERT_ID();
-- 15. Insira dois itens válidos.
INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (@novo_pedido, 5,978, 10.00), (@novo_pedido, 7,998, 50.00);
-- 16. Registre pagamento válido.
INSERT INTO pagamento (id_pedido, valor, id_forma_pagamento) VALUES (@pedido, 23.00,2);
-- 17. Consulte pedido, itens e pagamento.
SELECT * FROM pedido;
SELECT * FROM item_pedido;
SELECT * FROM pagamento;
-- 18. COMMIT.
COMMIT;
-- 19. START TRANSACTION e crie pedido para cliente 2.
START TRANSACTION;
INSERT INTO pedido (id_cliente, data_pedido, status_pedido) VALUES (2, NOW(), 'ABERTO');
-- 20. Salve o id em @pedido_com_erro.
SET @pedido_com_erro = LAST_INSERT_ID();
-- 21. Tente inserir item com id_produto inexistente.
INSERT INTO item_pedido (id_pedido, id_produto. quantidade, preco_unitario) VALUES (@pedido, 1,999, 9.00), (@pedido, 1,999, 11.00);
-- 22. Após observar a FK, ROLLBACK.
ROLLBACK;
-- 23. Consulte @pedido_com_erro e comprove que não permaneceu.
SELECT * FROM @pedido_com_erro
-- 24. Tente excluir uma categoria que possui produtos.
-- Explique em comentário por que foi bloqueado.


-- 25. Crie em uma transação um pedido temporário com dois itens,
-- exclua o pedido e observe ON DELETE CASCADE.
-- Finalize com ROLLBACK para preservar a base.

-- DESAFIO EXTRA - CAIXA DO SMARTCOFFEE
-- Em UMA transação:
-- a) pedido; b) 3 itens; c) baixa de estoque;
-- d) SAVEPOINT; e) pagamento; f) status FINALIZADO;
-- g) consultas; h) COMMIT.