-- =============================================
-- POPULAÇÃO DO SISTEMA BIBLIOTECÁRIO
-- =============================================

-- 1. POPULANDO PARÂMETROS DE MULTA
INSERT INTO PARAMETRO_MULTA (valor_por_dia, data_inicio_vigencia, data_fim_vigencia, descricao) VALUES
(2.50, '2024-01-01', NULL, 'Multa padrão para atraso na devolução'),
(1.50, '2023-01-01', '2023-12-31', 'Multa vigente em 2023'),
(3.00, '2024-06-01', NULL, 'Multa aumentada devido à inflação');

-- 2. POPULANDO AUTORES
INSERT INTO AUTOR (nome, nacionalidade, data_nascimento) VALUES
('Machado de Assis', 'Brasileira', '1839-06-21'),
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('Jorge Amado', 'Brasileira', '1912-08-10'),
('George Orwell', 'Britânica', '1903-06-25'),
('J.K. Rowling', 'Britânica', '1965-07-31'),
('J.R.R. Tolkien', 'Britânica', '1892-01-03'),
('Agatha Christie', 'Britânica', '1890-09-15'),
('Stephen King', 'Americana', '1947-09-21'),
('Isaac Asimov', 'Russa', '1920-01-02'),
('Carlos Drummond de Andrade', 'Brasileira', '1902-10-31');

-- 3. POPULANDO ESTOQUE DE OBRAS
INSERT INTO ESTOQUE_OBRA (quantidade_reservada, quantidade_emprestada, quantidade_total, quantidade_disponivel) VALUES
(2, 3, 5, 2),
(1, 2, 3, 1),
(0, 1, 2, 1),
(3, 4, 10, 6),
(0, 0, 3, 3),
(1, 1, 5, 3),
(0, 2, 4, 2),
(2, 5, 8, 3),
(1, 0, 2, 1),
(0, 1, 3, 2);

-- 4. POPULANDO OBRAS
INSERT INTO OBRA (isbn, titulo, edicao, ano_publicacao, id_estoque_obra) VALUES
('978-85-359-0277-4', 'Dom Casmurro', 1, 1899, 1),
('978-85-325-0124-8', 'A Hora da Estrela', 3, 1977, 2),
('978-85-359-0580-5', 'Capitães da Areia', 2, 1937, 3),
('978-85-7232-227-1', '1984', 1, 1949, 4),
('978-85-7542-122-6', 'Harry Potter e a Pedra Filosofal', 1, 1997, 5),
('978-85-359-0902-5', 'O Senhor dos Anéis: A Sociedade do Anel', 2, 1954, 6),
('978-85-273-0123-4', 'Assassinato no Expresso Oriente', 1, 1934, 7),
('978-85-7650-123-4', 'O Iluminado', 3, 1977, 8),
('978-85-359-0789-2', 'Fundação', 1, 1951, 9),
('978-85-7232-456-5', 'Claro Enigma', 2, 1951, 10);

-- 5. POPULANDO EXEMPLARES
INSERT INTO EXEMPLAR (codigo_patrimonio, status, data_aquisicao, localizacao, id_obra) VALUES
-- Exemplares para Dom Casmurro (5 exemplares)
('PAT-001', 'Disponível', '2023-01-15', 'Estante A, Prateleira 1', 1),
('PAT-002', 'Emprestado', '2023-01-15', 'Estante A, Prateleira 1', 1),
('PAT-003', 'Reservado', '2023-02-20', 'Estante A, Prateleira 1', 1),
('PAT-004', 'Disponível', '2023-03-10', 'Estante A, Prateleira 1', 1),
('PAT-005', 'Emprestado', '2023-03-10', 'Estante A, Prateleira 1', 1),

-- Exemplares para outras obras
('PAT-006', 'Disponível', '2023-04-05', 'Estante B, Prateleira 2', 2),
('PAT-007', 'Emprestado', '2023-04-05', 'Estante B, Prateleira 2', 2),
('PAT-008', 'Danificado', '2023-04-05', 'Estante B, Prateleira 2', 2),

('PAT-009', 'Disponível', '2023-05-12', 'Estante C, Prateleira 3', 3),
('PAT-010', 'Emprestado', '2023-05-12', 'Estante C, Prateleira 3', 3),

('PAT-011', 'Disponível', '2023-06-18', 'Estante D, Prateleira 1', 4),
('PAT-012', 'Disponível', '2023-06-18', 'Estante D, Prateleira 1', 4),
('PAT-013', 'Reservado', '2023-07-22', 'Estante D, Prateleira 1', 4);

-- 6. POPULANDO USUÁRIOS
INSERT INTO USUARIO (matricula, email_institucional, senha_hash, nome_completo, tipo_usuario, status, telefone, data_nascimento) VALUES
-- Alunos
('2023001', 'aluno.silva@academico.edu.br', 'hash_senha_001', 'João da Silva', 'aluno', 'ativo', '(11) 99999-0001', '2000-05-15'),
('2023002', 'maria.santos@academico.edu.br', 'hash_senha_002', 'Maria Santos', 'aluno', 'ativo', '(11) 99999-0002', '2001-08-22'),
('2023003', 'pedro.oliveira@academico.edu.br', 'hash_senha_003', 'Pedro Oliveira', 'aluno', 'ativo', '(11) 99999-0003', '1999-12-10'),
('2023004', 'ana.costa@academico.edu.br', 'hash_senha_004', 'Ana Costa', 'aluno', 'bloqueado', '(11) 99999-0004', '2002-03-30'),

-- Professores
('PROF001', 'carlos.mendes@academico.edu.br', 'hash_senha_101', 'Carlos Mendes', 'professor', 'ativo', '(11) 99999-0101', '1975-11-08'),
('PROF002', 'juliana.fernandes@academico.edu.br', 'hash_senha_102', 'Juliana Fernandes', 'professor', 'ativo', '(11) 99999-0102', '1980-04-17'),

-- Administradores
('ADM001', 'admin.sistema@academico.edu.br', 'hash_senha_201', 'Administrador do Sistema', 'administrador', 'ativo', '(11) 99999-0201', '1985-07-25'),
('ADM002', 'supervisor.biblio@academico.edu.br', 'hash_senha_202', 'Supervisor Biblioteca', 'administrador', 'ativo', '(11) 99999-0202', '1978-09-14');

-- 7. POPULANDO TABELAS ESPECIALIZADAS DE USUÁRIOS
INSERT INTO ALUNO (id_usuario, curso, semestre, turno, data_ingresso) VALUES
(1, 'Engenharia de Software', 4, 'noturno', '2023-01-15'),
(2, 'Ciência da Computação', 2, 'matutino', '2023-01-15'),
(3, 'Sistemas de Informação', 6, 'vespertino', '2022-01-15'),
(4, 'Administração', 3, 'noturno', '2023-01-15');

INSERT INTO PROFESSOR (id_usuario, departamento, titulacao, regime_trabalho, data_contratacao) VALUES
(5, 'Tecnologia da Informação', 'doutorado', '40h', '2015-03-01'),
(6, 'Letras', 'mestrado', '40h', '2018-08-15');

INSERT INTO ADMINISTRADOR (id_usuario, setor, nivel_acesso, funcao, data_admissao) VALUES
(7, 'TI', 'gerente', 'Administrador de Sistemas', '2020-01-10'),
(8, 'Biblioteca', 'supervisor', 'Supervisor de Acervo', '2019-06-20');

-- 8. POPULANDO EMPRÉSTIMOS
INSERT INTO EMPRESTIMO (data_emprestimo, data_prevista_devolucao, data_devolucao, status, id_exemplar, id_usuario) VALUES
-- Empréstimos ativos
('2024-01-10', '2024-01-24', NULL, 'ativo', 2, 1),
('2024-01-12', '2024-01-26', NULL, 'ativo', 7, 2),
('2024-01-15', '2024-01-29', NULL, 'ativo', 10, 3),

-- Empréstimos concluídos
('2023-12-01', '2023-12-15', '2023-12-14', 'concluído', 5, 1),
('2023-12-05', '2023-12-19', '2023-12-18', 'concluído', 9, 2),

-- Empréstimos em atraso
('2023-12-20', '2024-01-03', NULL, 'atrasado', 12, 4);

-- 9. POPULANDO MULTAS
INSERT INTO MULTA (id_emprestimo, valor_original, valor_atual, data_criacao, data_pagamento, status, id_parametro_multa) VALUES
(6, 15.00, 30.00, '2024-01-04', NULL, 'pendente', 1),  -- Multa pendente (em atraso)
(4, 5.00, 5.00, '2023-12-16', '2023-12-20', 'paga', 2), -- Multa paga
(5, 3.00, 3.00, '2023-12-20', '2023-12-22', 'paga', 2); -- Multa paga

-- 10. POPULANDO RESERVAS
INSERT INTO RESERVA (id_usuario, id_obra, data_reserva, status, data_expiracao) VALUES
(1, 1, '2024-01-08 10:30:00', 'ativa', '2024-01-15'),
(3, 4, '2024-01-10 14:15:00', 'concluída', '2024-01-17'),
(2, 6, '2024-01-12 09:00:00', 'expirada', '2024-01-19'),
(1, 8, '2024-01-14 16:45:00', 'ativa', '2024-01-21');

-- 11. POPULANDO RELACIONAMENTO OBRA-AUTOR
INSERT INTO OBRA_AUTOR (id_obra, id_autor) VALUES
(1, 1),   -- Dom Casmurro - Machado de Assis
(2, 2),   -- A Hora da Estrela - Clarice Lispector
(3, 3),   -- Capitães da Areia - Jorge Amado
(4, 4),   -- 1984 - George Orwell
(5, 5),   -- Harry Potter - J.K. Rowling
(6, 6),   -- Senhor dos Anéis - Tolkien
(7, 7),   -- Assassinato no Expresso Oriente - Agatha Christie
(8, 8),   -- O Iluminado - Stephen King
(9, 9),   -- Fundação - Isaac Asimov
(10, 10); -- Claro Enigma - Drummond