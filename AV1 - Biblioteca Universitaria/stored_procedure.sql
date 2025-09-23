-- Stored Procedure CalcularMultaAtraso (com parâmetro OUT)
CREATE DEFINER = "avnadmin"@"%" PROCEDURE CalcularMultaAtraso(
    IN p_id_emprestimo INT,
    OUT p_valor_multa DECIMAL(10, 2)
)
BEGIN 
    DECLARE v_dias_atraso INT;
    DECLARE v_valor_dia DECIMAL(10, 2);
    DECLARE v_data_devolucao DATE;
    DECLARE v_data_prevista DATE;
    DECLARE v_data_emprestimo DATE;
    DECLARE v_data_fim_periodo DATE;

    -- Buscar datas do empréstimo
    SELECT
        data_emprestimo,
        data_prevista_devolucao,
        data_devolucao 
    INTO v_data_emprestimo, v_data_prevista, v_data_devolucao
    FROM EMPRESTIMO
    WHERE id_emprestimo = p_id_emprestimo;

    -- Determinar a data final do período a ser considerado
    SET v_data_fim_periodo = COALESCE(v_data_devolucao, CURDATE());

    -- Calcular dias de atraso
    SET v_dias_atraso = DATEDIFF(v_data_fim_periodo, v_data_prevista);

    -- Se não há atraso, retornar zero
    IF v_dias_atraso <= 0 THEN
        SET p_valor_multa = 0.00;
    ELSE
        -- Buscar o valor da multa que estava vigente durante o período de atraso
        SELECT valor_por_dia 
        INTO v_valor_dia
        FROM PARAMETRO_MULTA
        WHERE 
            -- O parâmetro deve estar vigente durante algum dia do período de atraso
            (
                (data_inicio_vigencia <= v_data_fim_periodo)
                AND (
                    COALESCE(data_fim_vigencia, v_data_fim_periodo) >= v_data_prevista
                )
            )
        ORDER BY
            -- Priorizar o parâmetro que estava vigente na data de início do atraso
            CASE
                WHEN v_data_prevista BETWEEN data_inicio_vigencia AND COALESCE(data_fim_vigencia, v_data_prevista) THEN 1
                ELSE 2
            END,
            data_inicio_vigencia DESC
        LIMIT 1;

        -- Se não encontrou parâmetro, usar um valor padrão de segurança
        IF v_valor_dia IS NULL THEN
            SET v_valor_dia = 2.00; -- Valor padrão caso não encontre parâmetro
        END IF;

        -- Calcular multa
        SET p_valor_multa = v_dias_atraso * v_valor_dia;
    END IF;
END$$

DELIMITER ;

-- Exemplo 1: Calcular multa para empréstimo ID 1
CALL CalcularMultaAtraso(1, @valor_multa);
SELECT @valor_multa AS 'Valor da Multa Empréstimo 1';
