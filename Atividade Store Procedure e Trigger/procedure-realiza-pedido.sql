DELIMITER $$

CREATE PROCEDURE realiza_pedido (
    IN p_id_cliente INT, 
    IN p_id_produto INT, 
    IN p_quantidade INT
)
BEGIN 
    DECLARE v_preco_unitario DECIMAL(10,2);
    DECLARE v_estoque_atual INT;
    DECLARE v_id_pedido INT;
    
    -- Obter estoque e preço do produto
    SELECT estoque, preco INTO v_estoque_atual, v_preco_unitario 
    FROM produto 
    WHERE id_produto = p_id_produto;
    
    -- Verificar se há estoque suficiente
    IF v_estoque_atual < p_quantidade THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Estoque insuficiente';
    ELSE 
        -- Criar novo pedido
        INSERT INTO pedido (id_cliente) VALUES (p_id_cliente);
        SET v_id_pedido = LAST_INSERT_ID();
        
        -- Adicionar item ao pedido (CORREÇÃO: use os parâmetros corretos)
        INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) 
        VALUES (v_id_pedido, p_id_produto, p_quantidade, v_preco_unitario);
        
        -- Atualizar estoque do produto
        UPDATE produto 
        SET estoque = estoque - p_quantidade 
        WHERE id_produto = p_id_produto;
    END IF; 
END $$

DELIMITER ;