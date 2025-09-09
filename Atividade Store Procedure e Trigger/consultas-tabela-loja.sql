-- Listar todos os clientes
SELECT * FROM CLIENTE;

-- Listar todos os produtos
SELECT * FROM PRODUTO;

-- Listar pedidos com nomes de clientes
SELECT p.id_pedido, c.nome as cliente, p.data_pedido 
FROM PEDIDO p 
JOIN CLIENTE c ON p.id_cliente = c.id_cliente;

-- Listar itens de pedido com detalhes
SELECT ip.id_pedido, pr.nome as produto, ip.quantidade, ip.preco_unitario
FROM ITEM_PEDIDO ip
JOIN PRODUTO pr ON ip.id_produto = pr.id_produto;

-- Verificar movimentações de estoque
SELECT l.id_log, p.nome as produto, l.quantidade_alterada, l.tipo_movimentacao, l.data_log
FROM LOG_ESTOQUE l
JOIN PRODUTO p ON l.id_produto = p.id_produto;