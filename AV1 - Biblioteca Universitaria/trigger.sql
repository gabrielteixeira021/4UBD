-- Bloquear novo empréstimo se houver multas pendentes
DROP TRIGGER IF EXISTS VerificarMultaPendente;
CREATE TRIGGER IF NOT EXISTS VerificarMultaPendente
BEFORE INSERT ON EMPRESTIMO
FOR EACH ROW
BEGIN
    DECLARE v_multa_pendente INT;

    -- Verificar se usuário possui multa pendente
    SELECT COUNT(*) INTO v_multa_pendente
    FROM MULTA m
    JOIN EMPRESTIMO e ON m.id_emprestimo = e.id_emprestimo
    WHERE e.id_usuario = NEW.id_usuario
        AND m.status = 'pendente';

    -- Impedir empréstimo se houver multa pendente
    IF v_multa_pendente > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Usuário possui multa pendente. Empréstimo bloqueado.';
    END IF;
END;
