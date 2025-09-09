-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/09/2025 às 02:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `loja_pr`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `realiza_pedido` (IN `p_id_cliente` INT, IN `p_id_produto` INT, IN `p_quantidade` INT)   BEGIN 
	DECLARE v_preco_unitario DECIMAL(10,2);
	DECLARE v_estoque_atual INT;
	DECLARE v_id_pedido INT;
    -- obter estoque e preco do produto
    SELECT estoque, preco INTO v_estoque_atual, v_preco_unitario 
    FROM produto 
    WHERE id_produto = p_id_produto;
    
    -- verificar se há estoque suficiente
    IF v_estoque_atual < p_quantidade THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Estoque insuficiente';
    ELSE 
    	-- criar novo produto
        INSERT INTO pedido (id_cliente) VALUES (p_id_cliente);
        SET v_id_pedido = LAST_INSERT_ID(); 
        
        -- adicionar item ao pedido
        INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario)
        VALUES (v_id_pedido, p_id_produto, p_quantidade, v_preco_unitario); 
        
        -- atualizando o estoque do produto
        UPDATE produto 
        SET estoque = estoque - p_quantidade 
        WHERE id_produto = p_id_produto;
	END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome`, `email`) VALUES
(1, 'João Silva', 'joao.silva@email.com'),
(2, 'Maria Santos', 'maria.santos@email.com'),
(3, 'Pedro Almeida', 'pedro.almeida@email.com'),
(4, 'Ana Costa', 'ana.costa@email.com'),
(5, 'Carlos Oliveira', 'carlos.oliveira@email.com'),
(6, 'Juliana Pereira', 'juliana.pereira@email.com'),
(7, 'Fernando Rodrigues', 'fernando.rodrigues@email.com'),
(8, 'Camila Souza', 'camila.souza@email.com'),
(9, 'Ricardo Lima', 'ricardo.lima@email.com'),
(10, 'Amanda Ferreira', 'amanda.ferreira@email.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_pedido`
--

CREATE TABLE `item_pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `item_pedido`
--

INSERT INTO `item_pedido` (`id_pedido`, `id_produto`, `quantidade`, `preco_unitario`) VALUES
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
(13, 10, 3, 299.90),
(14, 3, 1, 2499.90),
(15, 3, 2, 2499.90);

-- --------------------------------------------------------

--
-- Estrutura para tabela `log_estoque`
--

CREATE TABLE `log_estoque` (
  `id_log` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade_alterada` int(11) DEFAULT NULL,
  `data_log` datetime DEFAULT current_timestamp(),
  `tipo_movimentacao` enum('ENTRADA','SAÍDA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `log_estoque`
--

INSERT INTO `log_estoque` (`id_log`, `id_produto`, `quantidade_alterada`, `data_log`, `tipo_movimentacao`) VALUES
(1, 1, 5, '2023-09-25 08:30:00', 'ENTRADA'),
(2, 2, 10, '2023-09-25 09:15:00', 'ENTRADA'),
(3, 3, 8, '2023-09-25 10:20:00', 'ENTRADA'),
(4, 4, 20, '2023-09-26 11:05:00', 'ENTRADA'),
(5, 5, 15, '2023-09-26 13:40:00', 'ENTRADA'),
(6, 6, 10, '2023-09-27 14:25:00', 'ENTRADA'),
(7, 7, 5, '2023-09-27 15:50:00', 'ENTRADA'),
(8, 8, 15, '2023-09-28 16:35:00', 'ENTRADA'),
(9, 9, 5, '2023-09-28 17:20:00', 'ENTRADA'),
(10, 10, 12, '2023-09-29 09:45:00', 'ENTRADA'),
(11, 1, -1, '2023-10-01 09:15:00', 'SAÍDA'),
(12, 4, -1, '2023-10-01 09:15:00', 'SAÍDA'),
(13, 2, -2, '2023-10-01 10:30:00', 'SAÍDA'),
(14, 3, -1, '2023-10-02 11:45:00', 'SAÍDA'),
(15, 7, -1, '2023-10-02 11:45:00', 'SAÍDA'),
(16, 5, -1, '2023-10-02 14:20:00', 'SAÍDA'),
(17, 6, -1, '2023-10-02 14:20:00', 'SAÍDA'),
(18, 8, -2, '2023-10-03 16:10:00', 'SAÍDA'),
(19, 10, -1, '2023-10-03 17:35:00', 'SAÍDA'),
(20, 9, -1, '2023-10-04 09:50:00', 'SAÍDA'),
(21, 2, -1, '2023-10-04 11:05:00', 'SAÍDA'),
(22, 4, -1, '2023-10-04 11:05:00', 'SAÍDA'),
(23, 1, -1, '2023-10-05 13:40:00', 'SAÍDA'),
(24, 7, -1, '2023-10-05 13:40:00', 'SAÍDA'),
(25, 3, -1, '2023-10-05 15:55:00', 'SAÍDA'),
(26, 5, -2, '2023-10-06 10:25:00', 'SAÍDA'),
(27, 6, -1, '2023-10-06 10:25:00', 'SAÍDA'),
(28, 8, -1, '2023-10-06 14:45:00', 'SAÍDA'),
(29, 10, -3, '2023-10-07 16:30:00', 'SAÍDA'),
(30, 1, 2, '2025-09-08 21:50:14', 'SAÍDA');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `data_pedido`) VALUES
(1, 1, '2023-10-01 09:15:00'),
(2, 2, '2023-10-01 10:30:00'),
(3, 3, '2023-10-02 11:45:00'),
(4, 4, '2023-10-02 14:20:00'),
(5, 1, '2023-10-03 16:10:00'),
(6, 5, '2023-10-03 17:35:00'),
(7, 6, '2023-10-04 09:50:00'),
(8, 7, '2023-10-04 11:05:00'),
(9, 8, '2023-10-05 13:40:00'),
(10, 9, '2023-10-05 15:55:00'),
(11, 10, '2023-10-06 10:25:00'),
(12, 2, '2023-10-06 14:45:00'),
(13, 3, '2023-10-07 16:30:00'),
(14, 1, '2025-09-08 21:31:48'),
(15, 1, '2025-09-08 21:34:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `preco`, `estoque`) VALUES
(1, 'Notebook Dell i7', 3299.90, 13),
(2, 'Smartphone Samsung Galaxy S21', 1899.90, 25),
(3, 'Tablet Apple iPad 10.2', 2499.90, 9),
(4, 'Mouse Sem Fio Logitech', 89.90, 50),
(5, 'Teclado Mecânico RGB', 299.90, 20),
(6, 'Monitor LG 24\"', 899.90, 18),
(7, 'Headphone Sony WH-1000XM4', 1299.90, 10),
(8, 'Webcam Logitech C920', 399.90, 30),
(9, 'Impressora HP LaserJet', 899.90, 8),
(10, 'HD Externo Seagate 1TB', 299.90, 22);

--
-- Acionadores `produto`
--
DELIMITER $$
CREATE TRIGGER `trg_log_saida` AFTER UPDATE ON `produto` FOR EACH ROW BEGIN 
    -- verifica se houve diminuição no estoque
    IF NEW.estoque < OLD.estoque 
        -- caso haja, insere no log_estoque
        THEN INSERT INTO log_estoque (
            id_produto, 
            quantidade_alterada, 
            tipo_movimentacao
        )
        VALUES (
            NEW.id_produto, 
            OLD.estoque - NEW.estoque, 'SAÍDA'
        );
    END IF;
END
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD PRIMARY KEY (`id_pedido`,`id_produto`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `log_estoque`
--
ALTER TABLE `log_estoque`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `log_estoque`
--
ALTER TABLE `log_estoque`
  MODIFY `id_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `item_pedido`
--
ALTER TABLE `item_pedido`
  ADD CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `log_estoque`
--
ALTER TABLE `log_estoque`
  ADD CONSTRAINT `log_estoque_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id_produto`);

--
-- Restrições para tabelas `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
