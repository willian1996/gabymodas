-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 01-Dez-2021 às 01:34
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `catalogo_virtual_2020`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_total` decimal(10,2) NOT NULL,
  `frete` decimal(8,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `taxas` decimal(10,2) DEFAULT NULL,
  `total_custo` decimal(10,2) DEFAULT NULL,
  `total_liquido` decimal(10,2) DEFAULT NULL,
  `meio_pagamento` varchar(50) DEFAULT NULL,
  `data_liberacao` date DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(35) NOT NULL,
  `rastreio` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `sub_total`, `frete`, `total`, `taxas`, `total_custo`, `total_liquido`, `meio_pagamento`, `data_liberacao`, `id_usuario`, `pago`, `data`, `status`, `rastreio`) VALUES
(1, '19.99', '0.00', '20.59', '0.60', '0.00', NULL, 'Debito', NULL, 1, 'Não', '2021-11-28', 'Comprado', NULL),
(2, '59.98', '0.00', '62.38', '2.40', '0.00', NULL, 'Credito 1x', NULL, 1, 'Não', '2021-11-28', 'Comprado', NULL),
(3, '31.98', '0.00', '32.94', '0.96', '0.00', NULL, 'Debito', NULL, 2, 'Não', '2021-11-28', 'Comprado', NULL),
(4, '33.15', '0.00', '35.14', '1.99', '0.00', NULL, 'Credito 3x', NULL, 2, 'Não', '2021-11-28', 'Encomendado', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
