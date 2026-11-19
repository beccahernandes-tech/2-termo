USE smartcoffee_procedures_becca;

-- 1. listar_clientes_ativos()
DELIMITER $$

CREATE PROCEDURE LISTAR_CLIENTES()
BEGIN
    SELECT ID_CLIENTE , nome , TELEFONE, ATIVO  
    FROM CLIENTE 
    WHERE ATIVO = TRUE
    ORDER BY NOME;
END
DELIMITER;
CALL LISTAR_CLIENTES();

-- 2. buscar_produto_por_nome(IN p_busca VARCHAR(100))

DELIMITER $$
CREATE PROCEDURE buscar_produto_por_nome(IN p_busca VARCHAR(100))
BEGIN
    SELECT * 
    FROM produtos
    WHERE nome LIKE CONCAT('%', p_busca, '%');
END $$
DELIMITER ;


-- 3. produtos_por_categoria(IN p_id_categoria INT)
DELIMITER $$

CREATE PROCEDURE BUSCAR_PRODUTOS_CATEGORIA( IN P_ID_CATEGORIA INT)
BEGIN 
    SELECT ID_PRODUTO AS CÓDIGO, NOME, PRECO 
    FROM PRODUTO
    WHERE ID_CATEGORIA = P_ID_CATEGORIA
    AND ATIVO = TRUE
    ORDER BY NOME;
END
DELIMITER ; 
CALL BUSCAR_PRODUTOS_CATEGORIA(2);

-- 4. total_clientes(OUT p_total INT)
DELIMITER $$
CREATE PROCEDURE total_clientes(OUT p_total INT)
BEGIN
    DECLARE V_PRECO DECIMAL(10,2);

    SELECT PRECO 
    INTO V_PRECO
    FROM produto
    WHERE ID_PRODUTO = P_ID_PRODUTO;

    SELECT V_PRECO AS PRECO_PRODUTO;
END $$
DELIMITER ; 
CALL total_clientes(3);

-- 5. consultar_estoque(IN p_id_produto INT) usando variável local
CREATE PROCEDURE consultar_estoque(IN p_id_produto INT)
BEGIN
    DECLARE V_PRECO DECIMAL(10,2);

    SELECT PRECO 
    INTO V_PRECO
    FROM produto
    WHERE ID_PRODUTO = P_ID_PRODUTO;

    SELECT V_PRECO AS PRECO_PRODUTO;
END $$
DELIMITER ; 
CALL CONSULTAR_PRECO(2);

-- 6. classificar estoque: 0 SEM ESTOQUE / <=5 BAIXO / >5 NORMAL

CREATE PROCEDURE CLASSIFICAR_ESTOQUE ( IN P_ID_PRODUTO INT )
BEGIN
    DECLARE V_QUANTIDADE INT;

    SELECT QUANTIDADE
    INTO V_QUANTIDADE
    FROM estoque
    WHERE ID_PRODUTO = P_ID_PRODUTO;

    IF V_QUANTIDADE = 0 THEN
        SELECT 'SEM ESTOQUE' AS SITUAÇÃO;
    ELSEIF V_QUANTIDADE <= 5 THEN 
        SELECT 'ESTOQUE BAIXO' AS SITUAÇÃO;
    ELSE 
        SELECT 'ESTOQUE NORMAL' AS SITUAÇÃO;
    END IF;
END $$
DELIMITER ;
CALL CLASSIFICAR_ESTOQUE(2);

-- 7. cadastrar_cliente(...) com três parâmetros IN

DELIMITER $$

CREATE PROCEDURE CADASTRAR_CLIENTE (
    IN P_NOME VARCHAR (100),
    IN P_EMAIL VARCHAR (120),
    IN P_TELEFONE VARCHAR(20)
),1

BEGIN 
    INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, ATIVO)
    VALUES (P_NOME, P_EMAIL, P_TELEFONE, TRUE);
END $$

DELIMITER ;

CALL CADASTRAR_CLIENTE ( 'BRUNO AUGUSTO', 'BRUNO@EMIAL.COM', '19999789877');

SELECT * FROM CLIENTE;
-- 8. alterar_preco(...) impedindo valor <= 0
DELIMITER $$

CREATE PROCEDURE ATUALIZAR_PRECO_PRODUTO (
    IN P_ID_PRODUTO INT,
    IN P_NOVO_PRECO DECIMAL(10,2)
)
BEGIN
    IF P_NOVO_PRECO > 0 THEN
        UPDATE produto
        SET PRECO = P_NOVO_PRECO
        WHERE ID_PRODUTO = P_ID_PRODUTO;

        SELECT 'PREÇO ATUALIZADO' AS MENSAGEM;
    ELSE
        SELECT 'PREÇO INVÁLIDO' AS MENSAGEM;
    END IF;
END $$

DELIMITER ;

CALL ATUALIZAR_PRECO_PRODUTO(2,14);

SELECT * FROM PRODUTO;

-- 9. criar_pedido(IN p_id_cliente INT, OUT p_id_pedido INT)
CREATE PROCEDURE criar_pedido (
    IN p_id_cliente INT,
    OUT p_id_pedido INT
)
BEGIN 
    START TRANSACTION;
    INSERT INTO PEDIDO (
        ID_CLIENTE,
        DATA_PEDIDO,
        STATUS_PEDIDO
    )

    VALUES (
        P_ID_CLIENTE, NOW(), 'ABERTO'
    );

    SET P_ID_PEDIDO = LAST_INSERT_ID();
    COMMIT;
END $$
DELIMITER;
CALL REGISTRAR_PEDIDO(1, @PEDIDO);
SELECT @PEDIDO;

-- 10. devolver ID com LAST_INSERT_ID()


-- 11. adicionar_item_pedido(...) buscando o preço atual


-- 12. Faça uma chamada inválida e explique o resultado.


-- 13. Use SHOW CREATE PROCEDURE.


-- 14. Remova uma procedure com DROP PROCEDURE IF EXISTS e recrie-a.


-- DESAFIO FINAL:
-- Crie uma procedure de negócio com:
-- - pelo menos 2 parâmetros;
-- - variável local;
-- - IF;
-- - pelo menos uma alteração no banco.