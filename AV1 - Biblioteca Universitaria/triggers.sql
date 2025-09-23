-- Bloquear novo empréstimo se houver multas pendentes
-- Trigger que executa ANTES de inserir um novo empréstimo
CREATE TRIGGER tr_verifica_multas_antes_emprestimo BEFORE
INSERT
    ON EMPRESTIMO FOR EACH ROW BEGIN DECLARE v_multas_pendentes INT DEFAULT 0;

DECLARE v_valor_total_multas DECIMAL(10, 2) DEFAULT 0.00;

DECLARE v_nome_usuario VARCHAR(255);

DECLARE v_matricula VARCHAR(20);

DECLARE v_erro_msg VARCHAR(500);

-- Buscar informações do usuário
SELECT
    nome_completo,
    matricula INTO v_nome_usuario,
    v_matricula
FROM
    USUARIO
WHERE
    id_usuario = NEW.id_usuario;

-- Verificar se o usuário tem multas pendentes
SELECT
    COUNT(*),
    COALESCE(SUM(m.valor_atual), 0) INTO v_multas_pendentes,
    v_valor_total_multas
FROM
    MULTA m
    INNER JOIN EMPRESTIMO e ON m.id_emprestimo = e.id_emprestimo
WHERE
    e.id_usuario = NEW.id_usuario
    AND m.status = 'pendente';

-- Se há multas pendentes, bloquear o empréstimo
IF v_multas_pendentes > 0 THEN
SET
    v_erro_msg = CONCAT(
        'EMPRÉSTIMO BLOQUEADO! ',
        'Usuário: ',
        v_nome_usuario,
        ' (',
        v_matricula,
        ') ',
        'possui ',
        v_multas_pendentes,
        ' multa(s) pendente(s) ',
        'no valor total de R$ ',
        FORMAT(v_valor_total_multas, 2),
        '. ',
        'Quite as multas antes de realizar novos empréstimos.'
    );

SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = v_erro_msg;

END IF;

END;

-- Trigger complementar que atualiza o status do usuário quando há multas
CREATE TRIGGER tr_atualiza_status_usuario_multa
AFTER
INSERT
    ON MULTA FOR EACH ROW BEGIN DECLARE v_total_multas INT DEFAULT 0;

DECLARE v_id_usuario INT;

-- Buscar o usuário relacionado à multa
SELECT
    e.id_usuario INTO v_id_usuario
FROM
    EMPRESTIMO e
WHERE
    e.id_emprestimo = NEW.id_emprestimo;

-- Contar multas pendentes do usuário
SELECT
    COUNT(*) INTO v_total_multas
FROM
    MULTA m
    INNER JOIN EMPRESTIMO e ON m.id_emprestimo = e.id_emprestimo
WHERE
    e.id_usuario = v_id_usuario
    AND m.status = 'pendente';

-- Se há multas pendentes e o usuário está ativo, bloquear
IF v_total_multas > 0 THEN
UPDATE
    USUARIO
SET
    status = 'bloqueado'
WHERE
    id_usuario = v_id_usuario
    AND status = 'ativo';

END IF;

END; 

-- Trigger que reativa usuário quando todas as multas são pagas
CREATE TRIGGER tr_reativa_usuario_multa_paga
AFTER
UPDATE
    ON MULTA FOR EACH ROW BEGIN DECLARE v_multas_pendentes INT DEFAULT 0;

DECLARE v_id_usuario INT;

-- Executar apenas quando uma multa passa de 'pendente' para 'paga'
IF OLD.status = 'pendente'
AND NEW.status = 'paga' THEN -- Buscar o usuário relacionado à multa
SELECT
    e.id_usuario INTO v_id_usuario
FROM
    EMPRESTIMO e
WHERE
    e.id_emprestimo = NEW.id_emprestimo;

-- Verificar se ainda há multas pendentes
SELECT
    COUNT(*) INTO v_multas_pendentes
FROM
    MULTA m
    INNER JOIN EMPRESTIMO e ON m.id_emprestimo = e.id_emprestimo
WHERE
    e.id_usuario = v_id_usuario
    AND m.status = 'pendente';

-- Se não há mais multas pendentes, reativar usuário
IF v_multas_pendentes = 0 THEN
UPDATE
    USUARIO
SET
    status = 'ativo'
WHERE
    id_usuario = v_id_usuario
    AND status = 'bloqueado';

END IF;

END IF;

END;

-- Trigger adicional para verificar status do usuário antes do empréstimo
CREATE TRIGGER tr_verifica_status_usuario_emprestimo BEFORE
INSERT
    ON EMPRESTIMO FOR EACH ROW BEGIN DECLARE v_status_usuario VARCHAR(20);

DECLARE v_nome_usuario VARCHAR(255);

DECLARE v_matricula VARCHAR(20);

-- Buscar status e informações do usuário
SELECT
    status,
    nome_completo,
    matricula INTO v_status_usuario,
    v_nome_usuario,
    v_matricula
FROM
    USUARIO
WHERE
    id_usuario = NEW.id_usuario;

-- Bloquear se usuário não está ativo
IF v_status_usuario != 'ativo' THEN SIGNAL SQLSTATE '45000'
SET
    MESSAGE_TEXT = CONCAT(
        'EMPRÉSTIMO NEGADO! Usuário: ',
        v_nome_usuario,
        ' (',
        v_matricula,
        ') ',
        'possui status: ',
        v_status_usuario,
        '. ',
        'Apenas usuários com status ATIVO podem realizar empréstimos.'
    );

END IF;

END;