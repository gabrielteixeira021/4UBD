-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 19/08/2025 às 16:53
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vendas_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_vendas` int(11) NOT NULL,
  `produto` varchar(20) NOT NULL,
  `data_venda` date NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id_vendas`, `produto`, `data_venda`, `valor`) VALUES
(1, 'Notebook Dell i7', '2024-01-15', 3500.00),
(2, 'iPhone 14', '2024-01-16', 4500.00),
(3, 'Samsung Galaxy S23', '2024-01-17', 3200.00),
(4, 'Tablet iPad Air', '2024-01-18', 2800.00),
(5, 'Monitor 24\" LG', '2024-01-19', 850.00),
(6, 'Teclado Mecânico', '2024-01-20', 350.00),
(7, 'Mouse Gamer', '2024-01-21', 180.00),
(8, 'Headphone Sony', '2024-01-22', 420.00),
(9, 'Smart TV 55\"', '2024-01-23', 2200.00),
(10, 'PlayStation 5', '2024-01-24', 3800.00),
(11, 'Notebook Lenovo', '2024-01-25', 2700.00),
(12, 'Câmera Canon', '2024-01-26', 1900.00),
(13, 'Impressora HP', '2024-01-27', 650.00),
(14, 'HD Externo 1TB', '2024-01-28', 320.00),
(15, 'Smartwatch Apple', '2024-01-29', 2100.00),
(16, 'Fone Bluetooth', '2024-01-30', 150.00),
(17, 'Webcam Logitech', '2024-01-31', 280.00),
(18, 'Roteador Wi-Fi', '2024-02-01', 190.00),
(19, 'Carregador Portátil', '2024-02-02', 120.00),
(20, 'Cabo HDMI', '2024-02-03', 45.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_vendas`),
  ADD KEY `idx_data_venda` (`data_venda`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_vendas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
