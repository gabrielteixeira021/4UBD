-- Indices servem para aumentar a performance do banco de dados
CREATE INDEX idx_emprestimo_usuario ON EMPRESTIMO(id_usuario);
CREATE INDEX idx_emprestimo_exemplar ON EMPRESTIMO(id_exemplar);
CREATE INDEX idx_emprestimo_status ON EMPRESTIMO(status);
CREATE INDEX idx_exemplar_obra ON EXEMPLAR(id_obra);
CREATE INDEX idx_exemplar_status ON EXEMPLAR(status);
CREATE INDEX idx_reserva_usuario_obra ON RESERVA(id_usuario, id_obra);