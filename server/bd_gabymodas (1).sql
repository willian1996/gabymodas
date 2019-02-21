-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 21-Fev-2019 às 02:19
-- Versão do servidor: 5.7.21
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_gabymodas`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `admin`
--

INSERT INTO `admin` (`id_admin`, `nome`, `email`, `senha`) VALUES
(1, 'Willian ', 'williansalesgabriel@hotmail.com', '1f54316ca54232f4ac3ba6a1353b971f77a233b0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(200) NOT NULL,
  `whatsapp` varchar(11) NOT NULL,
  `rua` varchar(200) NOT NULL,
  `numeroCasa` varchar(5) NOT NULL,
  `pontoDeReferencia` varchar(200) DEFAULT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `telefone1` varchar(11) DEFAULT NULL,
  `telefone2` varchar(11) CHARACTER SET utf32 DEFAULT NULL,
  `dataCadastro` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `whatsapp` (`whatsapp`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome_completo`, `whatsapp`, `rua`, `numeroCasa`, `pontoDeReferencia`, `bairro`, `cidade`, `cep`, `telefone1`, `telefone2`, `dataCadastro`) VALUES
(7, 'Willian Sales Gabriel', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', 'Fica na  Frutaria Hortifruti JC', 'TravessÃ£o', 'Caraguatatuba', '11669309', '1238894092', '', '2019-02-20 00:05:25');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
