-- Retornar quantidade de livros emprestados por aluno

CREATE DEFINER = "avnadmin" @"%" FUNCTION "ObterQtdLivrosEmprestados" (p_id_usuario INT) RETURNS int READS SQL DATA DETERMINISTIC BEGIN DECLARE v_qtd_emprestimos INT;

SELECT
    COUNT(*) INTO v_qtd_emprestimos
FROM
    EMPRESTIMO
WHERE
    id_usuario = p_id_usuario
    AND status IN ('ativo', 'atrasado');

RETURN v_qtd_emprestimos;

END