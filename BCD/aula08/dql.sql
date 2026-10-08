-- Active: 1788435082275@@127.0.0.1@3306@smartcoffe_dml_rebecca
-- DQL - DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)

-- ANTES DE INICIAR 
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Ana Flavia', 'anaf@gamil.com', '1999555599', 'Campinas', TRUE);

-- ex 1: SELECT SEMPLES OU CONSULTA SIMPLES 
-- ESTRURURA SELECT COMO EXEMPLO
-- SELECT coluna
-- FROM tabela; 
SELECT *
FROM cliente;
-- CONSULTAR TODAS AS COLUNAS 

SELECT nome, telefone
FROM cliente; 
-- CONSULTAR COLUNAS ESPECIFICAS 

-- EX 2 : AS COMO APELIDO OU UM NOVO NOME PARA COLUNAS 
SELECT nome AS Nome_Cliente
FROM cliente;

SELECT email AS Email_Cliente, telefone AS Zap
FROM cliente; 

-- EX 3: DISTINCT - ELIMINANDO REPETIÇÕES 
SELECT DISTINCT cidade
FROM cliente; 
-- SEM DISTINCT O RESULTADO IRA SE REPETIR MAIS VEZES 
-- COM O DISTINCT O RESULTADO IRÁ APARECER UMA VEZ 

-- EX 4 : WHERE - FILTRI POR REGISTROS 
-- IREMOS DEFINIR CONDIÇÕES 

-- = IGUAL 
-- <> OU ! = DIFERENTE
-- > MAIOR QUE 
-- >= MAIOR OU IGUAL
-- < MENOR
-- <= MENOR OU IGUAL
SELECT nome, preco 
FROM produto 
WHERE preco > 10.00;
-- CONSULTA PARA VALORES ACIMA DE 10 REAIS 

SELECT nome, preco, ativo AS Status 
FROM produto 
WHERE ativo = TRUE;
-- CONSULTA STATUS DE CLIENTES SE ESTA ATIVO OU INATIVO

SELECT id_pedido, data_pedido, valor_total
FROM pedido 
WHERE valor_total >= 25.00;
-- CONSULTA PEDIDOS ACIMA DE DETREMINADO VALOR

-- EX 5: USO DO AND, OR E NOT 
-- AND TODAS AS CONDIÇÕES VERDADEIRAS 
SELECT nome, preco 
FROM produto
WHERE preco >= 8.00 AND preco <= 25.00;

-- OR PELO MENOS UMA CONDIÇÃO VERDADEIRA 
SELECT nome, cidade 
FROM cliente 
WHERE cidade = 'LIMEIRA' OR cidade = 'PIRACICABA';

-- NOT NÃO IRA BUSCAR OU CONSULTAR O VALOR DESEJADO 
SELECT nome, cidade 
FROM cliente 
WHERE NOT cidade ='LIMEIRA';

-- EXTRA - UTILIZANDO O AND E OR JUNTOS SEPARAR POR () 
SELECT nome, cidade, ativo  
FROM cliente 
WHERE ativo = TRUE 
AND (cidade = 'LIMEIRA' OR cidade = 'PIRACICABA');

-- EX 6: BETWEEN - ENTRE DOIS VALORES 
-- LIMITE INICIAL E FINAL 
SELECT nome, preco 
FROM produto 
WHERE preco BETWEEN 8.00 AND 15.00;
-- CONSULTA POR VALORES ENTRE 8.00 E 15.00 

SELECT id_pedido, data_pedido, valor_total 
FROM pedido 
WHERE data_pedido BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:28:59'
-- CONSULTAR POR INTERVALO DE DATAS 

-- EX 7: IN VARIAS POSSIBILIDADES 
SELECT nome, cidade 
FROM cliente 
WHERE cidade IN ('Limeira', 'Campinas', 'Americana', 'Piracicaba');
-- CONSULTA COM VARIAS CONDIÇÕES E DIMINUINDO O USO DE OR 

SELECT nome, cidade 
FROM cliente 
WHERE cidade NOT IN ('Limeira', 'Piracicaba');
-- CONSULTA COM EXCESSÃO DOS VALORES ESPECIFICADOS 

-- EX 8 : LIKE - PESQUISAR POR TEXTOS 
-- CORNGAS 
-- % VARIOS CARACTERES 
-- _ EXATAMENTE UM CARACTER 

SELECT nome 
FROM produto 
WHERE nome LIKE 'Cafe%';
-- CONSULTA TODOS OS PRODUTOS QUE COMECAM COM A PALAVRA DESEJADA 

SELECT nome 
FROM produto 
WHERE nome LIKE '%chocolate%';
-- CONSULTA TODOS OS PRODUTOS QUE POSSUAM A PALAVRA DESEJADA 

SELECT nome 
FROM cliente 
WHERE nome LIKE '%Silva';
-- CONSULTA TODOS OS CLINETES QUE TERMINAM COM A PALAVRA DESEJADA 

SELECT nome 
FROM cliente 
WHERE nome LIKE '%Si_va';
-- CONSULTA ESPECIFICAMENTE O CARACTER QUE NÃO SE LEMBRA 

-- NULL - AUSENCIA DE VALORES 
SELECT nome, telefone 
FROM cliente 
WHERE telefone IS NULL;
-- CONSULTA CAMPOS QUE POSSUEM O NULL 

SELECT nome, telefone 
FROM cliente 
WHERE telefone IS NOT NULL;
-- CONSULTA CAMPOS QUE NÃO SÃO MAIS NULL 

-- EX 10: ORDER BY - ORDENANDO RESULTADOS 
-- ASC CRESCENTE 
-- DESC DECRESCENTE 
SELECT nome, preco 
FROM produto 
ORDER BY preco ASC;
-- CONSULTAR DADOS DE FORMA CRESCENTE 

SELECT nome, preco 
FROM produto 
ORDER BY preco DESC;
-- CONSULTAR DADOS DE FORMA DECRESCENTE 

SELECT cidade, nome 
FROM cliente 
ORDER BY cidade ASC, nome DESC;

SELECT cidade, nome 
FROM cliente 
ORDER BY cidade ASC, nome DESC;
-- CONSULTA POR MAIS DE UMA COLUNA 

-- EX 11: LIMIT - LIMITAR QUANTIDADE DE LINHAS 
SELECT nome, preco 
FROM produto 
ORDER BY preco DESC 
LIMIT 5;
-- CONSULTAR APENAS UMA QUANTIDADE ESPECIFICA DE LINHAS 

SELECT nome, preco 
FROM produto 
ORDER BY nome 
LIMIT 5 OFFSET 5; 
-- CONSULTAR COM LIMITE DE VALORES E LINHAS 

-- EX 12: CALCULO DE COLUNAS 
SELECT nome, preco, preco * 2 AS preco_ajustado 
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS Sub_Total 
FROM item_pedido;

-- EX 13: FUNÇÕES PARA CONSULTAS 
-- TEXTOS 
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email_Cliente 
FROM cliente; 

SELECT CONCAT(nome, '-----', cidade) AS Cidade_Clientes 
FROM cliente; 
-- CONCAT concatenaçõa de valores 

-- NUMEROS 
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto 
FROM produto;

-- DATAS 
SELECT id_pedido, data_pedido, DATE (data_pedido) AS Datas, MONTH(data_pedido) AS Mês, YEAR(data_pedido) AS Ano, DAY(data_pedido) AS Dia, TIME(data_pedido) AS Horario
FROM pedido; 

-- COALESCE - SUBSTITUIR A INFORMAÇÃO QUE DEIXAMOS EM NULL OU NÃO DEIXAMOS 
SELECT nome, COALESCE(telefone, 'Não Informado') AS telefone 
FROM cliente;