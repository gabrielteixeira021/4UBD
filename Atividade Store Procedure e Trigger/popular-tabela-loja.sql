-- Inserir dados na tabela CLIENTE
INSERT INTO CLIENTE (nome, email) VALUES
('João Silva', 'joao.silva@email.com'),
('Maria Santos', 'maria.santos@email.com'),
('Pedro Almeida', 'pedro.almeida@email.com'),
('Ana Costa', 'ana.costa@email.com'),
('Carlos Oliveira', 'carlos.oliveira@email.com'),
('Juliana Pereira', 'juliana.pereira@email.com'),
('Fernando Rodrigues', 'fernando.rodrigues@email.com'),
('Camila Souza', 'camila.souza@email.com'),
('Ricardo Lima', 'ricardo.lima@email.com'),
('Amanda Ferreira', 'amanda.ferreira@email.com');

-- Inserir dados na tabela PRODUTO
INSERT INTO PRODUTO (nome, preco, estoque) VALUES
('Notebook Dell i7', 3299.90, 15),
('Smartphone Samsung Galaxy S21', 1899.90, 25),
('Tablet Apple iPad 10.2', 2499.90, 12),
('Mouse Sem Fio Logitech', 89.90, 50),
('Teclado Mecânico RGB', 299.90, 20),
('Monitor LG 24"', 899.90, 18),
('Headphone Sony WH-1000XM4', 1299.90, 10),
('Webcam Logitech C920', 399.90, 30),
('Impressora HP LaserJet', 899.90, 8),
('HD Externo Seagate 1TB', 299.90, 22);

-- Inserir dados na tabela PEDIDO
INSERT INTO PEDIDO (id_cliente, data_pedido) VALUES
(1, '2023-10-01 09:15:00'),
(2, '2023-10-01 10:30:00'),
(3, '2023-10-02 11:45:00'),
(4, '2023-10-02 14:20:00'),
(1, '2023-10-03 16:10:00'),
(5, '2023-10-03 17:35:00'),
(6, '2023-10-04 09:50:00'),
(7, '2023-10-04 11:05:00'),
(8, '2023-10-05 13:40:00'),
(9, '2023-10-05 15:55:00'),
(10, '2023-10-06 10:25:00'),
(2, '2023-10-06 14:45:00'),
(3, '2023-10-07 16:30:00');

-- Inserir dados na tabela ITEM_PEDIDO
INSERT INTO ITEM_PEDIDO (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 1, 1, 3299.90),
(1, 4, 1, 89.90),
(2, 2, 2, 1899.90),
(3, 3, 1, 2499.90),
(3, 7, 1, 1299.90),
(4, 5, 1, 299.90),
(4, 6, 1, 899.90),
(5, 8, 2, 399.90),
(6, 10, 1, 299.90),
(7, 9, 1, 899.90),
(8, 2, 1, 1899.90),
(8, 4, 1, 89.90),
(9, 1, 1, 3299.90),
(9, 7, 1, 1299.90),
(10, 3, 1, 2499.90),
(11, 5, 2, 299.90),
(11, 6, 1, 899.90),
(12, 8, 1, 399.90),
(13, 10, 3, 299.90);

-- Inserir dados na tabela LOG_ESTOQUE
INSERT INTO LOG_ESTOQUE (id_produto, quantidade_alterada, tipo_movimentacao, data_log) VALUES
(1, 5, 'ENTRADA', '2023-09-25 08:30:00'),
(2, 10, 'ENTRADA', '2023-09-25 09:15:00'),
(3, 8, 'ENTRADA', '2023-09-25 10:20:00'),
(4, 20, 'ENTRADA', '2023-09-26 11:05:00'),
(5, 15, 'ENTRADA', '2023-09-26 13:40:00'),
(6, 10, 'ENTRADA', '2023-09-27 14:25:00'),
(7, 5, 'ENTRADA', '2023-09-27 15:50:00'),
(8, 15, 'ENTRADA', '2023-09-28 16:35:00'),
(9, 5, 'ENTRADA', '2023-09-28 17:20:00'),
(10, 12, 'ENTRADA', '2023-09-29 09:45:00'),
(1, -1, 'SAÍDA', '2023-10-01 09:15:00'),
(4, -1, 'SAÍDA', '2023-10-01 09:15:00'),
(2, -2, 'SAÍDA', '2023-10-01 10:30:00'),
(3, -1, 'SAÍDA', '2023-10-02 11:45:00'),
(7, -1, 'SAÍDA', '2023-10-02 11:45:00'),
(5, -1, 'SAÍDA', '2023-10-02 14:20:00'),
(6, -1, 'SAÍDA', '2023-10-02 14:20:00'),
(8, -2, 'SAÍDA', '2023-10-03 16:10:00'),
(10, -1, 'SAÍDA', '2023-10-03 17:35:00'),
(9, -1, 'SAÍDA', '2023-10-04 09:50:00'),
(2, -1, 'SAÍDA', '2023-10-04 11:05:00'),
(4, -1, 'SAÍDA', '2023-10-04 11:05:00'),
(1, -1, 'SAÍDA', '2023-10-05 13:40:00'),
(7, -1, 'SAÍDA', '2023-10-05 13:40:00'),
(3, -1, 'SAÍDA', '2023-10-05 15:55:00'),
(5, -2, 'SAÍDA', '2023-10-06 10:25:00'),
(6, -1, 'SAÍDA', '2023-10-06 10:25:00'),
(8, -1, 'SAÍDA', '2023-10-06 14:45:00'),
(10, -3, 'SAÍDA', '2023-10-07 16:30:00');