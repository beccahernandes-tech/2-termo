-- Parte A — Básico Fundamento
-- 1. Crie vw_produtos_ativos .
CREATE VIEW vw_produtos_ativos AS 
SELECT id_produto, nome, preco, id_categoria
FROM produto 
WHERE ativo = TRUE; 

-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
SELECT * FROM vw_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;
-- 3. Liste todas as views do banco.
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();
-- 4. Exiba a definição de vw_produtos_ativos .
SHOW CREATE VIEW vw_produtos_categoria; 
-- Parte B — Relacionamentos Intermediário
-- 5. Crie vw_produtos_categorias usando INNER JOIN.
CREATE VIEW vw_produtos_categoria AS SELECT p.id_produto, p.nome AS produto, ca.nome AS categoria, p.preco 
FROM produto AS p 
INNER JOIN categoria as ca
ON ca.id_categoria = p.id_categoria; 
-- 6. Crie vw_pedidos_clientes .
CREATE VIEW vw_pedidos_clientes AS 
SELECT p.id_pedido, p.data_pedido, p.status, c.id_cliente, c.nome AS cliente 
FROM pedido AS p 
INNER JOIN cliente AS c 
ON c.id_cliente = p.id_cliente;
-- 7. Consulte somente pedidos FINALIZADOS pela view.
SELECT * FROM vw_pedidos_clientes
WHERE status = 'FINALIZADOS';
-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.
CREATE VIEW vw_itens_pedidos AS
SELECT 
    pe.id_pedido, 
    pe.data_pedido, 
    c.nome AS cliente, 
    pr.nome AS produto, 
    ip.quantidade, 
    ip.preco_unitario, 
    ip.quantidade * ip.preco_unitario AS subtotal
FROM pedido AS pe
INNER JOIN cliente AS c ON c.id_cliente = pe.id_cliente
INNER JOIN item_pedido AS ip ON ip.id_pedido = pe.id_pedido
INNER JOIN produto AS pr ON pr.id_produto = ip.id_produto;
-- Parte C — Relatórios Intermediário/
-- Avançado
-- 9. Crie vw_vendas_por_produto com SUM e GROUP BY.
CREATE VIEW vw_vendas_por_produto AS
SELECT 
    pr.id_produto, 
    pr.nome AS produto, 
    SUM(ip.quantidade) AS unidades_vendidas, 
    SUM(ip.quantidade * ip.preco_unitario) AS faturamento
FROM produto AS pr
INNER JOIN item_pedido AS ip ON ip.id_produto = pr.id_produto
INNER JOIN pedido AS pe ON pe.id_pedido = ip.id_pedido
GROUP BY pr.id_produto, pr.nome;
-- 10. Liste os produtos pelo maior faturamento.
SELECT * FROM vw_vendas_por_produto 
ORDER BY faturamento DESC; 
-- 11. Crie uma view que apresente todos os clientes e a quantidade de
-- pedidos, inclusive zero.
SELECT * FROM vw_clientes_resumo 
WHERE quantidade_pedidos = 0; 
-- 12. Descubra, pela view anterior, clientes que nunca compraram.

-- Parte D — Manutenção
-- 13. Use CREATE OR REPLACE para acrescentar id_categoria em uma
-- view.
CREATE OR REPLACE VIEW vw_produto_ativos AS
SELECT id_produto, nome, preco, id_categoria 
FROM produto 
WHERE ativo = TRUE; 
-- 14. Crie uma view simples e teste uma atualização permitida pelo SGBD.
UPDATE vw_clientes_ativos
SET nome = 'Ana Francis'
WHERE id_cliente = 2; 
-- 15. Crie uma view de produtos ativos com WITH CHECK OPTION e
-- analise seu efeito.
CREATE OR REPLACE VIEW vw_produtos_ativos AS 
SELECT id_produto, nome, preco, ativo, id_categoria
FROM produto 
WHERE ativo = TRUE 
WITH CHECK OPTION; 
-- 16. Remova uma view de teste com DROP VIEW IF EXISTS.
DROP VIEW vw_pedidos_clientes;
