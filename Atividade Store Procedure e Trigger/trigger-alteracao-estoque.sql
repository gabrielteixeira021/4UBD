DELIMITER $$

CREATE TRIGGER trg_log_saida 
AFTER UPDATE ON produto 
FOR EACH ROW 
BEGIN
    -- Verifica se houve diminuição no estoque
    IF NEW.estoque < OLD.estoque THEN
        -- Insere no log_estoque
        INSERT INTO log_estoque (
            id_produto, 
            quantidade_alterada, 
            tipo_movimentacao
        )
        VALUES (
            NEW.id_produto, 
            OLD.estoque - NEW.estoque, 
            'SAÍDA'
        );
    END IF;
END $$

DELIMITER ;