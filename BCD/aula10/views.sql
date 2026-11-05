-- Active: 1788435082275@@127.0.0.1@3306@smartcoffe_dml_rebecca
-- Views ou Visões - transformar determinadas consultas em visões reutilízaveis 
 
-- Como posso disponibilizar uma consulta como se ela fosse uma tabela? 
-- Resposta: Wiews

-- EX 1: View - Como consultar um visão lógica 
-- INICIAR O PROCESSO DE CRIAÇÃO
-- vw_produtos_ativos É COMO SE PUXASSE TD OQUE EU QUERO DE UMA VEZ SO 
CREATE VIEW vw_produtos_ativos AS SELECT id_produto, nome, preco 
FROM produto 
WHERE ativo = TRUE; 

-- VIZUALIZAR A CONSULTA CRIADA ATRAVES DA VIEW 
SELECT * FROM vw_produtos_ativos 

-- OBS: VIEW GUARDA A DEFINIÇÃO DA CONSULTA. EM UMA VIEW COMUM OS DADOS CONTINUAM PERTENCENDO AS TABELAS DE ORIGEM 

-- TABELA- ARMAZENA REGISTROS 
-- VIEW - REPRESENTA O RESULTADO LOGICO DA CONSULTA 

-- PORQUE UTILIZAR?
-- PORQUE DESEJOB SIMPLIFICAR A MINHA CONSULTA 
-- REUTILIZAR LÓGICA ONDE A CONSULTA GANHA UM NOME 
-- PADRONIZAÇÃO DE RELATORIOS 
-- RESTRIÇÃO DE EXPOSIÇÃO DA MINHA LÓGICA 

-- RESUMO 1:
-- UMA CONSULTA ORIGINAL OU INICIAL  
SELECT id_produto, nome, preco 
FROM produto
WHERE ativo = TRUE; 

-- TRANSFORMAR EM UMA VIEW 
CREATE VIEW vw_produtos_ativos AS SELECT id_produto, nome, preco 
FROM produto 
WHERE ativo = TRUE; 

-- COMO UTILIZAR 
SELECT * FROM vw_produtos_ativos; 

-- EX 2: UTILIZAR FILTROS NAS VIEWS 
SELECT id_produto, nome, preco 
FROM produto
WHERE preco >= 10.00
ORDER BY preco DESC;

SELECT * FROM vw_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;
-- OBS: VIEW NÃO ELIMINA A POSSIBILIDADE DE USAR O WHERE, ORDER BY E OUTRAS CLÁUSULAS 

-- EX 3 : VIEW COM JOINS - MOSTRAR PRODUTOS E CATEGORIAS
-- CONSULTA ORIGINAL
SELECT p.id_produto, p.nome AS produto, ca.nome AS categoria, p.preco 
FROM produto AS p 
INNER JOIN categoria as ca
ON ca.id_categoria = p.id_categoria; 

-- CRIANDO EM VIEW 
CREATE VIEW vw_produtos_categoria AS SELECT p.id_produto, p.nome AS produto, ca.nome AS categoria, p.preco 
FROM produto AS p 
INNER JOIN categoria as ca
ON ca.id_categoria = p.id_categoria; 
-- RESULTADO FINAL POR VIEW 
SELECT * FROM vw_produtos_categoria
ORDER BY categoria, produto;

-- EX 4 : VIEW COM VÁRIAS TABELAS - RELÁTORIO DE PEDIDOS 
CREATE VIEW vw_pedidos_clientes AS 
SELECT p.id_pedido, p.data_pedido, p.status, c.id_cliente, c.nome AS cliente 
FROM pedido AS p 
INNER JOIN cliente AS c 
ON c.id_cliente = p.id_cliente;

-- RESULTADO 
SELECT * FROM vw_pedidos_clientes
WHERE status = 'ABERTO';

-- APAGAR VIEWS 
DROP VIEW vw_pedidos_clientes;

-- EX 5: VIEW PARA UM RALATÓRIO COMPLETO 
-- ON PRECISA DECLARAR AS CHAVES PRIMARIAS E AS CHAVES ESTRANGEIRAS 
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

-- RESULTADO 
SELECT * FROM vw_itens_pedidos 
WHERE id_pedido = 3;

-- EX 6: VIEW COM FUNÇÕES DE AGREGAÇÃO 
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

-- RESULTADO: CONSULTA GERENCIAL 
SELECT * FROM vw_vendas_por_produto 
ORDER BY faturamento DESC; 

-- EX 7 : VIEW COM LEFT JOIN - QUEREMOS OS CLIENTES INCLUSIVE QUEM NUNCA REALIZOU PEDIDOS 
CREATE VIEW vw_clientes_resumo AS 
SELECT c.id_cliente, c.nome AS cliente, COUNT(p.id_pedido) AS quantidade_pedidos 
FROM cliente AS c 
LEFT JOIN pedido AS p 
ON p.id_cliente = c.id_cliente 
GROUP BY c.id_cliente, c.nome;

-- RESULTADO 
SELECT * FROM vw_clientes_resumo 
WHERE quantidade_pedidos = 0; 

-- EX 8: NOMEANDO VIEWS 
-- ALIASES TORNAM AS VIEWS MAIS CLARAS AS 

CREATE VIEW vw_precos_produtos AS 
SELECT id_produto, nome AS produto, preco AS preco_atual 
FROM produto; 

SELECT * FROM vw_precos_produtos; 

-- EX 9 : VIZUALIZAR AS VIEWS EXISTENTES 
-- VISUALIZAR O RESULTADO DE TODAS AS VIEWS CRIADAS  

SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW';

-- PODEMOS CONSULTAR O CATÁLOGO 
SELECT TABLE_NAME FROM information_schema.VIEWS
WHERE TABLE_SCHEMA = DATABASE();

-- EX 10: VIZUALIZANDO DEFINIÇÕES 
SHOW CREATE VIEW vw_produtos_categoria; 

-- EX 11: CREATE OR REPLATE VIEW 
CREATE OR REPLACE VIEW vw_produto_ativos AS
SELECT id_produto, nome, preco, id_categoria 
FROM produto 
WHERE ativo = TRUE; 
-- OBS: IRÁ SUBSTITUIR OU ALTERAR UMA VIEW JA CRIADA COM SUAS INFORMAÇÕES 

-- EX 12: VIEW ATUALIZAVEL 
CREATE VIEW vw_clientes_ativos AS 
SELECT id_cliente, nome, email, ativo 
FROM cliente 
WHERE ativo = TRUE; 

-- ATUALIZAR A TABELA CLIENTES 
UPDATE vw_clientes_ativos
SET nome = 'Ana Francis'
WHERE id_cliente = 2; 

-- EX 13: VIEW NÃO ATUALIZAVEL 
UPDATE vw_vendas_por_produto
SET faturamento = 1000
WHERE id_produto = 1 

-- OBS: O CAMPO É CALCULADO. SIMPLESMENTE NÃO É POSSIVEL RECEBER 1000. 

-- EX 14: WITH CHECK OPTION - VIEW QUE MOSTRA APENAS PRODUTOS ATIVOS 
CREATE OR REPLACE VIEW vw_produtos_ativos AS 
SELECT id_produto, nome, preco, ativo, id_categoria
FROM produto 
WHERE ativo = TRUE 
WITH CHECK OPTION; 

SELECT * FROM vw_produtos_ativos;
-- OBS: O WITH CHECK OPTION AJUDA A IMPEDIR ALTERAÇÕES REALIZADAS PELA VIEW QUE FARIAM O REGISTRO  

-- EX 15: PADRÃO DEFINIÇÃO DE NOMENCLATURA 
-- vw - views 
-- nome - complementar a tabela ou consultar que deseja realizar
-- vw_nome_desejo
-- vw_nome_da_finalidade 
-- vw_produtos_ativos


-- APAGAR VIEWS 
DROP VIEW vw_vendas_por_produto; 

