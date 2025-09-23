-- Atualizar status dos exemplares baseado nos empréstimos manualmente
UPDATE EXEMPLAR SET status = 'Emprestado' WHERE id_exemplar IN (2, 7, 10, 12);
UPDATE EXEMPLAR SET status = 'Reservado' WHERE id_exemplar IN (3, 13);


-- CONSULTAS DE VERIFICAÇÃO


-- Verificar contagem de registros por tabela
SELECT 
    'PARAMETRO_MULTA' as tabela, COUNT(*) as total FROM PARAMETRO_MULTA
UNION ALL SELECT 'AUTOR', COUNT(*) FROM AUTOR
UNION ALL SELECT 'ESTOQUE_OBRA', COUNT(*) FROM ESTOQUE_OBRA
UNION ALL SELECT 'OBRA', COUNT(*) FROM OBRA
UNION ALL SELECT 'EXEMPLAR', COUNT(*) FROM EXEMPLAR
UNION ALL SELECT 'USUARIO', COUNT(*) FROM USUARIO
UNION ALL SELECT 'ALUNO', COUNT(*) FROM ALUNO
UNION ALL SELECT 'PROFESSOR', COUNT(*) FROM PROFESSOR
UNION ALL SELECT 'ADMINISTRADOR', COUNT(*) FROM ADMINISTRADOR
UNION ALL SELECT 'EMPRESTIMO', COUNT(*) FROM EMPRESTIMO
UNION ALL SELECT 'MULTA', COUNT(*) FROM MULTA
UNION ALL SELECT 'RESERVA', COUNT(*) FROM RESERVA
UNION ALL SELECT 'OBRA_AUTOR', COUNT(*) FROM OBRA_AUTOR;

-- Consulta para ver os emprestimos ativos
SELECT 
    u.nome_completo as usuario,
    o.titulo as obra,
    e.codigo_patrimonio,
    emp.data_emprestimo,
    emp.data_prevista_devolucao
FROM EMPRESTIMO emp
JOIN USUARIO u ON emp.id_usuario = u.id_usuario
JOIN EXEMPLAR e ON emp.id_exemplar = e.id_exemplar
JOIN OBRA o ON e.id_obra = o.id_obra
WHERE emp.status = 'ativo' OR emp.status = 'atrasado';