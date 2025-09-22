-- POPULAÇÃO DO BANCO DE DADOS - DADOS DE TESTE

-- 1. Inserir Parâmetros de Multa
INSERT INTO PARAMETRO_MULTA (id_parametro, valor_por_dia, data_inicio_vigencia, data_fim_vigencia, descricao) VALUES
(1, 2.00, '2024-01-01', NULL, 'Valor padrão para atrasos na devolução'),
(2, 1.50, '2023-01-01', '2023-12-31', 'Valor antigo vigente em 2023');

-- 2. Inserir Autores
INSERT INTO AUTOR (id_autor, nome, nacionalidade, data_nascimento) VALUES
(1, 'Machado de Assis', 'Brasileira', '1839-06-21'),
(2, 'Clarice Lispector', 'Brasileira', '1920-12-10'),
(3, 'J.K. Rowling', 'Britânica', '1965-07-31'),
(4, 'George Orwell', 'Britânica', '1903-06-25'),
(5, 'J.R.R. Tolkien', 'Britânica', '1892-01-03'),
(6, 'Stephen King', 'Americana', '1947-09-21'),
(7, 'Carlos Drummond de Andrade', 'Brasileira', '1902-10-31'),
(8, 'Isaac Asimov', 'Russa', '1920-01-02');

-- 3. Inserir Estoque (vazio inicialmente)
INSERT INTO ESTOQUE_OBRA (id_estoque_obra, quantidade_reservada, quantidade_emprestada, quantidade_total, quantidade_disponivel) VALUES
(1, 0, 0, 3, 3),
(2, 0, 0, 2, 2),
(3, 0, 0, 5, 5),
(4, 0, 0, 4, 4),
(5, 0, 0, 3, 3),
(6, 0, 0, 2, 2),
(7, 0, 0, 1, 1),
(8, 0, 0, 3, 3);

-- 4. Inserir Obras
INSERT INTO OBRA (id_obra, isbn, titulo, edicao, ano_publicacao, id_estoque_obra) VALUES
(1, '9788535914843', 'Dom Casmurro', 1, 1899, 1),
(2, '9788532526213', 'A Hora da Estrela', 5, 1977, 2),
(3, '9788532530784', 'Harry Potter e a Pedra Filosofal', 1, 1997, 3),
(4, '9788535914844', '1984', 3, 1949, 4),
(5, '9788533613379', 'O Senhor dos Anéis: A Sociedade do Anel', 2, 1954, 5),
(6, '9788532530791', 'O Iluminado', 1, 1977, 6),
(7, '9788535926083', 'Claro Enigma', 1, 1951, 7),
(8, '9788535914845', 'Fundação', 1, 1951, 8);

-- 5. Inserir Relacionamento Obra-Autor
INSERT INTO OBRA_AUTOR (id_obra, id_autor) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7), (8, 8);

-- 6. Inserir Exemplares
INSERT INTO EXEMPLAR (id_exemplar, codigo_patrimonio, status, data_aquisicao, localizacao, id_obra) VALUES
-- Dom Casmurro (3 exemplares)
(1, 'BIB-2024-001', 'Disponível', '2024-01-15', 'Prateleira A1, Corredor 1', 1),
(2, 'BIB-2024-002', 'Disponível', '2024-01-15', 'Prateleira A1, Corredor 1', 1),
(3, 'BIB-2024-003', 'Disponível', '2024-01-15', 'Prateleira A1, Corredor 1', 1),

-- A Hora da Estrela (2 exemplares)
(4, 'BIB-2024-004', 'Disponível', '2024-02-10', 'Prateleira A2, Corredor 1', 2),
(5, 'BIB-2024-005', 'Disponível', '2024-02-10', 'Prateleira A2, Corredor 1', 2),

-- Harry Potter (5 exemplares)
(6, 'BIB-2024-006', 'Disponível', '2024-03-05', 'Prateleira B1, Corredor 2', 3),
(7, 'BIB-2024-007', 'Disponível', '2024-03-05', 'Prateleira B1, Corredor 2', 3),
(8, 'BIB-2024-008', 'Disponível', '2024-03-05', 'Prateleira B1, Corredor 2', 3),
(9, 'BIB-2024-009', 'Disponível', '2024-03-05', 'Prateleira B1, Corredor 2', 3),
(10, 'BIB-2024-010', 'Disponível', '2024-03-05', 'Prateleira B1, Corredor 2', 3),

-- 1984 (4 exemplares)
(11, 'BIB-2024-011', 'Disponível', '2024-04-20', 'Prateleira B2, Corredor 2', 4),
(12, 'BIB-2024-012', 'Disponível', '2024-04-20', 'Prateleira B2, Corredor 2', 4),
(13, 'BIB-2024-013', 'Disponível', '2024-04-20', 'Prateleira B2, Corredor 2', 4),
(14, 'BIB-2024-014', 'Disponível', '2024-04-20', 'Prateleira B2, Corredor 2', 4),

-- O Senhor dos Anéis (3 exemplares)
(15, 'BIB-2024-015', 'Disponível', '2024-05-12', 'Prateleira C1, Corredor 3', 5),
(16, 'BIB-2024-016', 'Disponível', '2024-05-12', 'Prateleira C1, Corredor 3', 5),
(17, 'BIB-2024-017', 'Disponível', '2024-05-12', 'Prateleira C1, Corredor 3', 5),

-- O Iluminado (2 exemplares)
(18, 'BIB-2024-018', 'Disponível', '2024-06-08', 'Prateleira C2, Corredor 3', 6),
(19, 'BIB-2024-019', 'Disponível', '2024-06-08', 'Prateleira C2, Corredor 3', 6),

-- Claro Enigma (1 exemplar)
(20, 'BIB-2024-020', 'Disponível', '2024-07-01', 'Prateleira D1, Corredor 4', 7),

-- Fundação (3 exemplares)
(21, 'BIB-2024-021', 'Disponível', '2024-07-15', 'Prateleira D2, Corredor 4', 8),
(22, 'BIB-2024-022', 'Disponível', '2024-07-15', 'Prateleira D2, Corredor 4', 8),
(23, 'BIB-2024-023', 'Disponível', '2024-07-15', 'Prateleira D2, Corredor 4', 8);

-- 7. Inserir Usuários
INSERT INTO USUARIO (id_usuario, matricula, email_institucional, senha_hash, nome_completo, tipo_usuario, status, telefone, data_nascimento, data_cadastro) VALUES
-- Alunos
(1, '2024001', 'aluno.silva@universidade.edu', 'hash123', 'João Silva', 'aluno', 'ativo', '(11) 9999-1111', '2000-05-15', '2024-01-10'),
(2, '2024002', 'maria.santos@universidade.edu', 'hash456', 'Maria Santos', 'aluno', 'ativo', '(11) 9999-2222', '2001-08-22', '2024-01-12'),
(3, '2024003', 'pedro.oliveira@universidade.edu', 'hash789', 'Pedro Oliveira', 'aluno', 'ativo', '(11) 9999-3333', '1999-12-03', '2024-01-15'),

-- Professores
(4, 'PROF001', 'carlos.mendes@universidade.edu', 'hash101', 'Carlos Mendes', 'professor', 'ativo', '(11) 9999-4444', '1975-03-10', '2023-08-01'),
(5, 'PROF002', 'ana.costa@universidade.edu', 'hash102', 'Ana Costa', 'professor', 'ativo', '(11) 9999-5555', '1980-11-25', '2023-08-01'),

-- Administradores
(6, 'ADM001', 'admin.biblioteca@universidade.edu', 'hash103', 'Roberto Alves', 'administrador', 'ativo', '(11) 9999-6666', '1985-07-14', '2023-07-15'),
(7, 'ADM002', 'suporte.biblioteca@universidade.edu', 'hash104', 'Fernanda Lima', 'administrador', 'ativo', '(11) 9999-7777', '1990-02-28', '2023-09-20');

-- 8. Inserir Dados Específicos dos Usuários
INSERT INTO ALUNO (id_usuario, curso, semestre, turno, data_ingresso) VALUES
(1, 'Engenharia de Software', 4, 'noturno', '2024-01-10'),
(2, 'Ciência da Computação', 2, 'matutino', '2024-01-12'),
(3, 'Sistemas de Informação', 6, 'vespertino', '2024-01-15');

INSERT INTO PROFESSOR (id_usuario, departamento, titulacao, regime_trabalho, data_contratacao) VALUES
(4, 'Tecnologia da Informação', 'doutorado', '40h', '2023-08-01'),
(5, 'Ciências Exatas', 'mestrado', 'DE', '2023-08-01');

INSERT INTO ADMINISTRADOR (id_usuario, setor, nivel_acesso, funcao, data_admissao) VALUES
(6, 'Biblioteca Central', 'gerente', 'Coordenador de Acervo', '2023-07-15'),
(7, 'Biblioteca Central', 'operador', 'Atendimento ao Público', '2023-09-20');

-- 9. Inserir Empréstimos
INSERT INTO EMPRESTIMO (id_emprestimo, data_emprestimo, data_prevista_devolucao, data_devolucao, status, id_exemplar, id_usuario) VALUES
-- Empréstimos ativos
(1, '2024-10-01', '2024-10-15', NULL, 'ativo', 1, 1),
(2, '2024-10-02', '2024-10-16', NULL, 'ativo', 6, 2),

-- Empréstimos concluídos
(3, '2024-09-15', '2024-09-29', '2024-09-28', 'concluído', 4, 3),
(4, '2024-09-20', '2024-10-04', '2024-10-03', 'concluído', 11, 1),

-- Empréstimo em atraso
(5, '2024-09-25', '2024-10-09', NULL, 'atrasado', 15, 2);

-- 10. Inserir Multas
INSERT INTO MULTA (id_multa, id_emprestimo, valor_original, valor_atual, data_criacao, data_pagamento, status, id_parametro_multa) VALUES
(1, 5, 10.00, 12.00, '2024-10-10', NULL, 'pendente', 1),
(2, 3, 5.00, 5.00, '2024-09-30', '2024-10-01', 'paga', 1);

-- 11. Inserir Reservas
INSERT INTO RESERVA (id_reserva, id_usuario, id_obra, data_reserva, status, data_expiracao) VALUES
(1, 3, 3, '2024-10-10 10:00:00', 'ativa', '2024-10-17'),
(2, 1, 5, '2024-10-09 14:30:00', 'concluída', '2024-10-16'),
(3, 2, 4, '2024-10-11 09:15:00', 'ativa', '2024-10-18');

-- 12. Atualizar estoque baseado nos empréstimos e reservas atuais
UPDATE ESTOQUE_OBRA SET 
quantidade_emprestada = 1,
quantidade_disponivel = 2
WHERE id_estoque_obra = 1;  -- Dom Casmurro (1 emprestado, 2 disponíveis)

UPDATE ESTOQUE_OBRA SET 
quantidade_emprestada = 1,
quantidade_disponivel = 4
WHERE id_estoque_obra = 3;  -- Harry Potter (1 emprestado, 4 disponíveis)

UPDATE ESTOQUE_OBRA SET 
quantidade_emprestada = 1,
quantidade_disponivel = 3
WHERE id_estoque_obra = 4;  -- 1984 (1 emprestado, 3 disponíveis)

UPDATE ESTOQUE_OBRA SET 
quantidade_emprestada = 1,
quantidade_disponivel = 2
WHERE id_estoque_obra = 5;  -- Senhor dos Anéis (1 emprestado, 2 disponíveis)

UPDATE ESTOQUE_OBRA SET 
quantidade_reservada = 1,
quantidade_disponivel = 3
WHERE id_estoque_obra = 3;  -- Harry Potter (1 reserva)

UPDATE ESTOQUE_OBRA SET 
quantidade_reservada = 1,
quantidade_disponivel = 2
WHERE id_estoque_obra = 4;  -- 1984 (1 reserva)

-- 13. Atualizar status dos exemplares baseado nos empréstimos
UPDATE EXEMPLAR SET status = 'Emprestado' WHERE id_exemplar IN (1, 6, 15);
UPDATE EXEMPLAR SET status = 'Reservado' WHERE id_exemplar IN (7, 12);  -- Exemplares reservados

-- 14. Atualizar usuário com referência ao último empréstimo
UPDATE USUARIO SET id_emprestimo = 1 WHERE id_usuario = 1;
UPDATE USUARIO SET id_emprestimo = 2 WHERE id_usuario = 2;

-- Verificação final dos dados inseridos
SELECT 'População do banco concluída com sucesso!' as status;

-- Consultas para verificar os dados
SELECT 'Total de Obras:' as descricao, COUNT(*) as quantidade FROM OBRA
UNION ALL
SELECT 'Total de Exemplares:', COUNT(*) FROM EXEMPLAR
UNION ALL
SELECT 'Total de Usuários:', COUNT(*) FROM USUARIO
UNION ALL
SELECT 'Empréstimos Ativos:', COUNT(*) FROM EMPRESTIMO WHERE status = 'ativo'
UNION ALL
SELECT 'Reservas Ativas:', COUNT(*) FROM RESERVA WHERE status = 'ativa'
UNION ALL
SELECT 'Multas Pendentes:', COUNT(*) FROM MULTA WHERE status = 'pendente';