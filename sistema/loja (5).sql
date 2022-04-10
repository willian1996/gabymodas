-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 05-Nov-2021 às 09:47
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
-- Estrutura da tabela `alertas`
--

DROP TABLE IF EXISTS `alertas`;
CREATE TABLE IF NOT EXISTS `alertas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_alerta` varchar(20) NOT NULL,
  `titulo_mensagem` varchar(100) NOT NULL,
  `mensagem` varchar(1000) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  `data` date NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `alertas`
--

INSERT INTO `alertas` (`id`, `titulo_alerta`, `titulo_mensagem`, `mensagem`, `link`, `imagem`, `data`, `ativo`) VALUES
(1, 'Promoção Imperdível', 'Combo de 8 Camisetas', 'Combo com 8 camisetas de 260 reais por apenas 160 reais.', 'http://google.com', 'cat-2.jpg', '2020-09-17', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE IF NOT EXISTS `avaliacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `texto` varchar(500) NOT NULL,
  `nota` int(11) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `id_produto`, `id_usuario`, `texto`, `nota`, `data`) VALUES
(3, 1, 8, 'Muito bom, gostei muito.', 5, '2020-09-17'),
(4, 25, 8, 'Muito bom, excelente Produto!!', 5, '2020-09-17'),
(5, 25, 6, 'Fiquei impressionado com a qualidade do produto, superou todas as minhas expectativas, realmente muito bom e num preço totalmente acessível, super indico!', 5, '2020-09-17'),
(6, 22, 19, 'muito bom ', 5, '2020-12-28');

-- --------------------------------------------------------

--
-- Estrutura da tabela `blog`
--

DROP TABLE IF EXISTS `blog`;
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descricao_1` varchar(1000) NOT NULL,
  `descricao_2` varchar(1000) NOT NULL,
  `imagem` varchar(150) NOT NULL,
  `data` date NOT NULL,
  `palavras` varchar(150) DEFAULT NULL,
  `nome_url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `blog`
--

INSERT INTO `blog` (`id`, `titulo`, `descricao_1`, `descricao_2`, `imagem`, `data`, `palavras`, `nome_url`) VALUES
(1, 'Titulo da Postagem do Blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames.', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscingLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing', 'curso-de-bootstrap-5.jpeg', '2020-09-21', 'curso de bootstrap 5, novidades bootstrap 5, aulas de bootstrap 5, treinamento com bootstrap, aulas bootstrap', 'titulo-da-postagem-do-blog'),
(3, 'Saiba como verificar a originalidade de uma roupa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscingLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula eu lectus lobortis condimentum. Aliquam nonummy auctor massa. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla at risus. Quisque purus magna, auctor et, sagittis ac, posuere eu, lectus. Nam mattis, felis ut adipiscing', 'nao-pode-provar-roupas-em-loja.jpg', '2020-09-21', 'roupa original, como saber, como saber se a roupa é original', 'saiba-como-verificar-a-originalidade-de-uma-roupa'),
(4, 'Como verificar a qualidade de uma roupa?', 'Nos países de língua inglesa o texto apresenta-se em forma um pouco diferente, apresentada a seguir:\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'Nos países de língua inglesa o texto apresenta-se em forma um pouco diferente, apresentada a seguir:\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'mv-modas1.jpg', '2020-09-21', 'qualidade de roupa, verificar qualidade', 'como-verificar-a-qualidade-de-uma-roupa-'),
(5, 'Tendência para o verão de 2020', 'Aquele que ama ou exerce ou deseja a dor, pode ocasionalmente adquirir algum prazer na labuta. Para dar um exemplo trivial, qual de nós se submete a laborioso exercício físico, exceto para obter alguma vantagem com isso. Desmoralizado pelos encantos do prazer, percebe que a dor não resulta em prazer algum. Está tão cego pelo desejo que não pode prever quem não cumprirá seu dever por fraqueza de vontade', 'Aquele que ama ou exerce ou deseja a dor, pode ocasionalmente adquirir algum prazer na labuta. Para dar um exemplo trivial, qual de nós se submete a laborioso exercício físico, exceto para obter alguma vantagem com isso. Desmoralizado pelos encantos do prazer, percebe que a dor não resulta em prazer algum. Está tão cego pelo desejo que não pode prever quem não cumprirá seu dever por fraqueza de vontadeAquele que ama ou exerce ou deseja a dor, pode ocasionalmente adquirir algum prazer na labuta. Para dar um exemplo trivial, qual de nós se submete a laborioso exercício físico, exceto para obter alguma vantagem com isso. Desmoralizado pelos encantos do prazer, percebe que a dor não resulta em prazer algum. Está tão cego pelo desejo que não pode prever quem não cumprirá seu dever por fraqueza de vontade', 'Roupas-feitas-com-renda-1.jpg', '2020-09-21', 'tendencias para o versão 2020, tendencia verão, roupa verão', 'tendencia-para-o-verao-de-2020');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carac`
--

DROP TABLE IF EXISTS `carac`;
CREATE TABLE IF NOT EXISTS `carac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carac`
--

INSERT INTO `carac` (`id`, `nome`) VALUES
(1, 'Tamanho'),
(2, 'Cor'),
(3, 'Numeração');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carac_itens`
--

DROP TABLE IF EXISTS `carac_itens`;
CREATE TABLE IF NOT EXISTS `carac_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_carac_prod` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valor_item` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carac_itens`
--

INSERT INTO `carac_itens` (`id`, `id_carac_prod`, `nome`, `valor_item`) VALUES
(1, 11, 'Azul', '#80acf2'),
(2, 3, 'Azul', '#80acf2'),
(3, 3, 'Vermelho', '#cf4023'),
(4, 10, 'P', ''),
(5, 10, 'M', ''),
(6, 10, 'G', ''),
(7, 10, 'GG', ''),
(8, 3, 'Amarelo', ''),
(9, 3, 'Verde', ''),
(12, 11, 'Vermelho', ''),
(13, 15, '30 e 31', ''),
(14, 15, '32 e 33', ''),
(15, 16, 'Marron', ''),
(16, 16, 'Preto', ''),
(17, 17, '34/35', ''),
(18, 17, '36/37', ''),
(19, 18, 'Azul', ''),
(20, 20, 'P', ''),
(22, 21, 'Preta', '#000'),
(23, 21, 'Azul', '#939ced'),
(24, 22, 'P', ''),
(25, 22, 'M', ''),
(26, 22, 'G', ''),
(27, 22, 'GG', ''),
(29, 21, 'Verde Escuro', '#073817'),
(30, 21, 'Verde Claro', '#6fd691'),
(31, 21, 'Laranja', '#b5631b'),
(32, 19, 'Azul', '#2640bf'),
(33, 19, 'Preta', '#000'),
(34, 20, 'M', ''),
(35, 23, 'Preto', '#000'),
(36, 24, 'P', ''),
(37, 24, 'M', ''),
(38, 24, 'G', ''),
(39, 25, '31 e 32', ''),
(40, 25, '33 e 34', ''),
(41, 26, 'P', ''),
(42, 26, 'M', ''),
(43, 27, 'Preto', '#000'),
(44, 27, 'Vermelho', '#f00'),
(45, 27, 'Azul', '#00f'),
(46, 28, 'P', ''),
(47, 28, 'M', ''),
(48, 28, 'G', ''),
(49, 28, 'GG', ''),
(51, 29, 'Vermelho', '#f00'),
(53, 29, 'Verde', '#44ff1f'),
(54, 29, 'Rosa', '#ff1ce9'),
(55, 30, 'M', ''),
(56, 30, 'P', ''),
(57, 30, 'G', ''),
(58, 30, 'GG', ''),
(59, 29, 'Branco', '#ccc'),
(60, 31, 'Verde', '#008000'),
(61, 32, 'P', ''),
(62, 32, 'M', ''),
(63, 32, 'G', ''),
(64, 32, 'GG', ''),
(66, 34, '36', '#fff'),
(67, 34, '38', '#fff'),
(68, 34, '40', '#fff'),
(69, 33, 'Preto', '#000000'),
(70, 35, 'Preto', ''),
(71, 35, 'Vinho', ''),
(72, 35, 'Rosa Claro', ''),
(73, 35, 'Amarelo Mostarda', ''),
(74, 35, 'Cinza', ''),
(75, 35, 'Verde Militar ', ''),
(76, 35, 'Uva', ''),
(77, 35, 'Azeul Céu', ''),
(78, 35, 'Branco', ''),
(79, 36, 'Único M 36 ao 42', ''),
(80, 38, 'TAMANHO ÚNICO: veste do 36 ao 42', ''),
(81, 37, 'Amarelo Mostarda', ''),
(82, 37, 'Cinza', ''),
(83, 37, 'Vermelho', ''),
(84, 37, 'Rosa Pink', ''),
(85, 37, 'Vinho', ''),
(86, 37, 'Preto', ''),
(87, 40, 'TAMANHO ÚNICO: veste do 36 ao 42', ''),
(88, 39, 'Preto', ''),
(89, 39, 'Rosa Claro', ''),
(90, 39, 'Amarelo ', ''),
(91, 39, 'Cinza', ''),
(92, 39, 'Branco ', ''),
(93, 39, 'Vinho', ''),
(95, 39, 'Azul Céu', ''),
(96, 39, 'Pink', ''),
(97, 42, 'TAMANHO ÚNICO: M veste do 36 ao 42', ''),
(98, 41, 'Preto', ''),
(99, 41, 'Amarelo', ''),
(100, 41, 'Azul Marinho', ''),
(101, 41, 'Verde Militar ', ''),
(102, 41, 'Vermelho', ''),
(103, 43, 'TAMANHO ÚNICO M: veste do 36 ao 42', ''),
(104, 44, 'Preto ', ''),
(105, 44, 'Vinho', ''),
(106, 44, 'Verde', ''),
(107, 44, 'Laranja', ''),
(108, 44, 'Branco ', ''),
(109, 44, 'Rose', ''),
(110, 44, 'Azul', ''),
(111, 44, 'Roxo', ''),
(112, 45, 'Preto', ''),
(113, 45, 'Branco', ''),
(115, 45, 'Rosé', ''),
(116, 46, 'TAMANHO ÚNICO: M veste do 36 ao 40', ''),
(117, 47, 'Preto', ''),
(118, 47, 'Branco', ''),
(119, 47, 'Rosé', ''),
(120, 47, 'Vinho', ''),
(121, 48, 'TAMANHO ÚNICO M : veste do 36 ao 42 ', ''),
(122, 49, 'Preto', ''),
(123, 49, 'Amarelo Mostarda ', ''),
(124, 49, 'Laranja', ''),
(125, 49, 'Verde Militar ', ''),
(126, 49, 'Rosa Claro', ''),
(127, 49, 'Rosa Pink', ''),
(128, 49, 'Vermelho', ''),
(129, 50, 'TAMANHO ÚNICO: veste do 36 ao 42', ''),
(130, 51, 'Preto', ''),
(131, 51, 'Branco', ''),
(132, 52, 'Preto', ''),
(133, 52, 'Branco', ''),
(134, 53, 'Preto', ''),
(135, 53, 'Rosa', ''),
(136, 53, 'Vinho', ''),
(137, 53, 'Branco', ''),
(138, 54, 'Preto', ''),
(139, 54, 'Branco', ''),
(140, 54, 'Rosa', ''),
(141, 54, 'Vermelho', ''),
(143, 54, 'Laranja Telha', ''),
(144, 54, 'Vinho', ''),
(145, 54, 'Mostarda', ''),
(146, 55, 'Preta', ''),
(148, 55, 'Verde Militar', ''),
(149, 55, 'Azul Céu', ''),
(150, 55, 'Rosa Clara', ''),
(151, 55, 'Azul Marinho', ''),
(152, 55, 'Vermelha', ''),
(153, 55, 'Branca Off White', ''),
(154, 56, 'Preta', ''),
(155, 56, 'Rosa Chiclete', ''),
(156, 56, 'Verde Militar', ''),
(157, 56, 'Azul Marinho', ''),
(158, 56, 'Azul Bebê', ''),
(159, 56, 'Branca ', ''),
(160, 56, 'Rosa Clara', ''),
(161, 56, 'Amarela', ''),
(162, 56, 'Amarela Mostarda ', ''),
(163, 56, 'Vinho', ''),
(164, 56, 'Lilás', ''),
(165, 57, 'Preta', ''),
(166, 57, 'Cinza', ''),
(167, 57, 'Rosa bebê', ''),
(168, 57, 'Off Whithe', ''),
(169, 57, 'Verde Militar', ''),
(170, 58, 'Branca', ''),
(171, 58, 'Roxa', ''),
(172, 58, 'Azul Ceu ', ''),
(173, 58, 'Rosa Pink', ''),
(174, 58, 'Preta', ''),
(175, 59, 'Preta ', ''),
(176, 59, 'Branca', ''),
(177, 59, 'Vinho', ''),
(178, 59, 'Amarela', ''),
(179, 59, 'Rosa Clara', ''),
(180, 59, 'Rosa Escura', ''),
(181, 59, 'Vermelha', ''),
(182, 59, 'Azul Bebê', ''),
(183, 59, 'Cinza', ''),
(184, 59, 'Azul Royal', ''),
(185, 59, 'Verde Militar', ''),
(186, 60, 'Preta ', ''),
(187, 60, 'Branca', ''),
(188, 60, 'Cinza', ''),
(189, 60, 'Roxa', ''),
(191, 60, 'Rosé', ''),
(192, 61, 'Preta ', ''),
(193, 61, 'Branca', ''),
(194, 61, 'Vermelha', ''),
(195, 61, 'Vinho', ''),
(196, 61, 'Rosé', ''),
(197, 61, 'Verde Militar ', ''),
(198, 61, 'Mostarda ', ''),
(199, 62, 'Preta ', ''),
(201, 62, 'Branca', ''),
(202, 62, 'Cinza Clara ', ''),
(203, 62, 'Rosa Clara ', ''),
(204, 63, 'P - veste 36', ''),
(205, 63, 'M - veste 38', ''),
(206, 63, 'G - veste 40/42', ''),
(207, 63, 'GG - veste 44', ''),
(208, 64, 'Preta ', ''),
(209, 64, 'Branca ', ''),
(210, 64, 'Rosa Escura', ''),
(211, 64, 'Rosa Clara ', ''),
(215, 64, 'Rosa Pink', ''),
(216, 64, 'Laranja', ''),
(217, 64, 'Azul Clara', ''),
(218, 64, 'Verde Água', ''),
(219, 65, 'P - veste 36', ''),
(220, 65, 'M - veste 38/40', ''),
(221, 65, 'G - veste 42', ''),
(222, 65, 'GG - veste 44', ''),
(223, 66, 'Preta', ''),
(224, 66, 'Verde Militar', ''),
(225, 66, 'Vermelha', ''),
(226, 66, 'Rosa Clara', ''),
(227, 66, 'Azul Marinho', ''),
(228, 66, 'Azul Céu', ''),
(230, 67, 'M - veste 38 ao 42', ''),
(231, 68, 'Preta', ''),
(232, 68, 'Branca', ''),
(233, 68, 'Azul Marinho', ''),
(234, 68, 'Azul Céu', ''),
(235, 68, 'Amarelo', ''),
(236, 68, 'Laranja', ''),
(237, 68, 'Rosé', ''),
(238, 68, 'Pink', ''),
(239, 68, 'Verde Bandeira', ''),
(240, 68, 'Verde Turquesa', ''),
(241, 68, 'Vermelho Queimado ', ''),
(242, 69, 'P - veste 36', ''),
(243, 69, 'M - veste 38', ''),
(244, 69, 'G - veste 40/42', ''),
(245, 70, 'Preta ', ''),
(246, 70, 'Branca Off-White', ''),
(247, 70, 'Verde Clara ', ''),
(248, 70, 'Verde Escura ', ''),
(249, 70, 'Rosa Claro', ''),
(250, 70, 'Vinho ', ''),
(251, 70, 'Azul Marinho', ''),
(252, 71, 'P - veste 36', ''),
(253, 71, 'M - veste 38/40', ''),
(254, 71, 'G - veste 42', ''),
(255, 72, 'Preta ', ''),
(256, 72, 'Mostarda ', ''),
(257, 72, 'Vinho', ''),
(258, 72, 'Azul', ''),
(259, 72, 'Verde Militar ', ''),
(260, 72, 'Rosa Clara', ''),
(261, 72, 'Telha', ''),
(262, 72, 'Vermelha', ''),
(263, 72, 'Caramelo', ''),
(264, 73, 'M - veste 36/38/40', ''),
(265, 73, 'G - veste 42', ''),
(266, 73, 'GG - veste 44/46', ''),
(267, 74, 'Preta ', ''),
(268, 74, 'Azul Royal', ''),
(269, 74, 'Vermelha', ''),
(270, 74, 'Amarela', ''),
(271, 74, 'Branca', ''),
(272, 74, 'Pink', ''),
(273, 74, 'Cinza', ''),
(274, 74, 'Verde Água', ''),
(275, 75, 'Único - 36 ao 42', ''),
(276, 76, 'Preta', ''),
(277, 76, 'Rosé', ''),
(278, 76, 'Caramelo', ''),
(279, 76, 'Vinho', ''),
(280, 77, 'P - veste 36', ''),
(281, 77, 'M - veste 38', ''),
(282, 77, 'G - veste 40/42', ''),
(283, 77, 'GG - veste 42/44', ''),
(284, 78, 'Verde Água ', ''),
(285, 78, 'Preta ', ''),
(286, 78, 'Branca', ''),
(287, 78, 'Verde Militar ', ''),
(288, 78, 'Rosa Clara ', ''),
(289, 78, 'Vermelha', ''),
(290, 79, 'M - veste 36 ao 42', ''),
(291, 80, 'Preta ', ''),
(292, 80, 'Rosa Claro', ''),
(293, 80, 'Branca', ''),
(294, 80, 'Vinho', ''),
(295, 80, 'Cinza', ''),
(296, 81, 'M - veste 36 ao 40', ''),
(297, 82, 'Preta ', ''),
(298, 82, 'Rosé', ''),
(299, 82, 'Cinza', ''),
(300, 82, 'Branca', ''),
(301, 83, 'M - veste 36 ao 42', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carac_itens_car`
--

DROP TABLE IF EXISTS `carac_itens_car`;
CREATE TABLE IF NOT EXISTS `carac_itens_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_carrinho` int(11) NOT NULL,
  `id_carac` int(11) NOT NULL,
  `nome` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carac_itens_car`
--

INSERT INTO `carac_itens_car` (`id`, `id_carrinho`, `id_carac`, `nome`) VALUES
(32, 104, 2, 'Azul'),
(33, 104, 1, 'G'),
(34, 220, 1, 'M'),
(36, 223, 1, 'M'),
(37, 223, 2, 'Verde Escuro'),
(38, 220, 2, 'Preto'),
(39, 220, 3, '31 e 32'),
(41, 315, 2, 'Preta'),
(42, 222, 2, 'Preto'),
(43, 318, 2, 'Azul'),
(44, 320, 2, 'Verde Escuro'),
(45, 321, 2, 'Verde Claro'),
(46, 322, 2, 'Verde Claro'),
(47, 323, 2, 'Azul'),
(48, 324, 2, 'Laranja'),
(49, 325, 2, 'Preta'),
(50, 326, 2, 'Azul'),
(51, 327, 2, 'Verde Escuro'),
(52, 328, 2, 'Laranja'),
(53, 329, 2, 'Azul'),
(54, 330, 0, ''),
(55, 331, 2, 'Verde Escuro'),
(56, 332, 2, 'Azul'),
(57, 333, 2, 'Azul'),
(58, 334, 2, 'Verde Escuro'),
(59, 335, 2, 'Verde Escuro'),
(60, 336, 2, 'Preta'),
(61, 337, 2, 'Azul'),
(62, 337, 1, 'M'),
(63, 338, 0, ''),
(64, 338, 1, 'G'),
(65, 339, 2, 'Azul'),
(66, 339, 1, 'G'),
(67, 340, 2, 'Preto'),
(68, 340, 1, 'M'),
(69, 340, 3, '31 e 32'),
(78, 441, 2, 'Azul'),
(79, 441, 1, 'P'),
(80, 455, 2, 'Azul'),
(81, 455, 1, 'M'),
(82, 457, 2, 'Azul'),
(83, 457, 1, 'P'),
(84, 458, 2, 'Azul'),
(85, 458, 1, 'G'),
(86, 459, 2, 'Preta'),
(87, 459, 1, 'M'),
(88, 465, 2, 'Azul'),
(89, 465, 1, 'M'),
(90, 467, 2, 'Preta'),
(91, 467, 1, 'M'),
(92, 469, 2, 'Azul'),
(93, 469, 1, 'GG'),
(100, 473, 2, 'Verde Escuro'),
(101, 473, 1, 'G'),
(105, 492, 2, 'Preta'),
(106, 492, 1, 'M'),
(109, 497, 2, 'Verde Escuro'),
(110, 497, 1, 'G'),
(111, 498, 1, 'P'),
(112, 498, 2, 'Verde Escuro'),
(113, 499, 2, 'Preta'),
(114, 499, 1, 'M'),
(117, 504, 2, 'Preta'),
(118, 504, 1, 'G'),
(119, 505, 2, 'Azul'),
(120, 505, 1, 'M'),
(121, 509, 2, 'Azul'),
(122, 509, 1, 'G'),
(123, 510, 2, 'Azul'),
(124, 510, 1, 'G'),
(125, 512, 2, 'Azul'),
(126, 512, 1, 'M'),
(127, 0, 2, 'Vermelho'),
(128, 0, 3, 'P'),
(129, 526, 2, 'Preto'),
(130, 526, 3, 'M'),
(131, 527, 2, 'Vermelho'),
(132, 527, 3, 'P'),
(133, 528, 2, 'Vermelho'),
(134, 528, 3, 'P'),
(135, 530, 2, 'Preto'),
(136, 530, 3, 'M'),
(137, 530, 2, 'Vermelho'),
(138, 530, 3, 'P'),
(139, 531, 2, 'Verde'),
(140, 531, 3, 'P'),
(141, 0, 2, 'Preto'),
(142, 0, 3, 'M'),
(143, 0, 2, 'Preto'),
(144, 0, 3, 'P'),
(145, 0, 2, 'Preto'),
(146, 0, 3, 'P'),
(147, 0, 2, 'Preto'),
(148, 0, 1, 'P'),
(149, 0, 3, '31 e 32'),
(150, 534, 2, 'Vermelho'),
(151, 534, 3, 'P'),
(154, 536, 2, 'Preto'),
(155, 536, 3, 'M'),
(156, 538, 2, 'Verde'),
(157, 538, 3, 'M'),
(158, 543, 2, 'Azul'),
(159, 543, 1, 'P'),
(160, 545, 2, 'Vermelho'),
(161, 545, 3, 'M'),
(162, 549, 2, 'Azul'),
(163, 549, 1, 'P'),
(164, 550, 2, 'Vermelho'),
(165, 550, 3, 'P'),
(171, 553, 2, 'Verde'),
(172, 553, 3, 'P'),
(173, 554, 2, 'Azul'),
(174, 554, 1, 'P'),
(177, 556, 2, 'Preto'),
(178, 556, 3, 'P'),
(179, 557, 2, 'Preto'),
(180, 557, 1, 'P'),
(181, 557, 3, '31 e 32'),
(182, 0, 2, 'Vermelho'),
(183, 0, 3, 'M'),
(184, 0, 2, 'Vermelho'),
(185, 0, 3, 'M'),
(186, 0, 2, 'Preto'),
(187, 0, 3, 'P'),
(194, 0, 2, 'Vermelho'),
(195, 0, 3, 'M'),
(198, 565, 2, 'Vermelho'),
(199, 565, 3, 'P'),
(200, 566, 2, 'Vermelho'),
(201, 566, 3, 'M'),
(202, 567, 2, 'Vermelho'),
(203, 567, 3, 'M'),
(204, 568, 2, 'Vermelho'),
(205, 568, 3, 'M'),
(210, 571, 2, 'Preto'),
(211, 571, 3, 'P'),
(216, 574, 2, 'Vermelho'),
(217, 574, 3, 'M'),
(218, 576, 2, 'Vermelho'),
(219, 576, 3, 'M'),
(220, 577, 2, 'Preto'),
(221, 577, 3, 'P'),
(222, 578, 2, 'Preto'),
(223, 578, 1, 'P'),
(224, 578, 3, '31 e 32'),
(225, 579, 1, 'P'),
(226, 580, 2, 'Vermelho'),
(227, 580, 3, 'M'),
(228, 581, 2, 'Vermelho'),
(229, 581, 3, 'M'),
(230, 582, 2, 'Rosa'),
(231, 582, 3, 'GG'),
(232, 583, 2, 'Verde'),
(233, 583, 3, 'M'),
(234, 584, 2, 'Vermelho'),
(235, 584, 3, 'M'),
(236, 585, 2, 'Vermelho'),
(237, 585, 3, 'M'),
(238, 0, 2, 'Vermelho'),
(239, 0, 3, 'P'),
(240, 0, 2, 'Vermelho'),
(241, 0, 3, 'M'),
(242, 586, 2, 'Vermelho'),
(243, 586, 3, 'M'),
(244, 587, 2, 'Preto'),
(245, 587, 3, 'GG'),
(246, 591, 2, 'Vermelho'),
(247, 591, 3, 'M'),
(250, 0, 2, 'Preta'),
(251, 0, 1, 'P'),
(252, 0, 2, 'Vermelho'),
(253, 0, 3, 'M'),
(254, 0, 2, 'Azul'),
(255, 0, 1, 'P'),
(260, 595, 2, 'Verde'),
(261, 595, 3, 'M'),
(262, 596, 2, 'Verde'),
(263, 596, 1, 'P'),
(272, 605, 2, 'Preto'),
(273, 605, 3, '36'),
(276, 612, 2, 'Preto'),
(277, 612, 3, '36'),
(278, 613, 2, 'Preto'),
(279, 613, 3, '36'),
(280, 614, 2, 'Preto'),
(281, 614, 1, 'Único M 36 ao 42');

-- --------------------------------------------------------

--
-- Estrutura da tabela `carac_prod`
--

DROP TABLE IF EXISTS `carac_prod`;
CREATE TABLE IF NOT EXISTS `carac_prod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_carac` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carac_prod`
--

INSERT INTO `carac_prod` (`id`, `id_carac`, `id_prod`) VALUES
(3, 2, 1),
(10, 1, 1),
(11, 2, 3),
(12, 3, 3),
(13, 1, 3),
(14, 4, 3),
(15, 3, 1),
(16, 2, 23),
(17, 3, 23),
(18, 2, 31),
(19, 2, 30),
(20, 1, 30),
(21, 2, 25),
(22, 1, 25),
(23, 2, 22),
(24, 1, 22),
(25, 3, 22),
(26, 1, 18),
(27, 2, 37),
(28, 3, 37),
(29, 2, 34),
(30, 3, 34),
(31, 2, 38),
(32, 1, 38),
(33, 2, 41),
(34, 3, 41),
(35, 2, 42),
(37, 2, 44),
(39, 2, 45),
(41, 2, 46),
(44, 2, 47),
(45, 2, 48),
(47, 2, 49),
(49, 2, 50),
(51, 2, 43),
(52, 2, 51),
(53, 2, 52),
(54, 2, 53),
(55, 2, 54),
(56, 2, 55),
(57, 2, 56),
(58, 2, 57),
(59, 2, 58),
(60, 2, 59),
(61, 2, 60),
(62, 2, 61),
(63, 1, 61),
(64, 2, 62),
(65, 1, 62),
(66, 2, 63),
(67, 1, 63),
(68, 2, 64),
(69, 1, 64),
(70, 2, 66),
(71, 1, 66),
(72, 2, 67),
(73, 1, 67),
(74, 2, 68),
(75, 1, 68),
(76, 2, 69),
(77, 1, 69),
(78, 2, 70),
(79, 1, 70),
(80, 2, 71),
(81, 1, 71),
(82, 2, 73),
(83, 1, 73);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

DROP TABLE IF EXISTS `carrinho`;
CREATE TABLE IF NOT EXISTS `carrinho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `data` date NOT NULL,
  `combo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=615 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id`, `id_usuario`, `id_produto`, `quantidade`, `id_venda`, `data`, `combo`) VALUES
(427, 8, 25, 1, 42, '2020-09-15', 'Não'),
(428, 8, 30, 1, 43, '2020-09-15', 'Não'),
(429, 8, 25, 1, 43, '2020-09-15', 'Não'),
(430, 8, 30, 1, 44, '2020-09-15', 'Não'),
(431, 8, 25, 1, 44, '2020-09-15', 'Não'),
(434, 8, 22, 1, 45, '2020-09-15', 'Não'),
(435, 8, 24, 1, 46, '2020-09-15', 'Não'),
(436, 8, 15, 1, 46, '2020-09-15', 'Não'),
(437, 8, 10, 1, 46, '2020-09-15', 'Não'),
(438, 8, 24, 1, 47, '2020-09-15', 'Não'),
(439, 8, 15, 1, 47, '2020-09-15', 'Não'),
(440, 8, 10, 1, 47, '2020-09-15', 'Não'),
(457, 8, 30, 1, 48, '2020-09-16', 'Não'),
(458, 8, 25, 1, 48, '2020-09-16', 'Não'),
(459, 8, 25, 1, 49, '2020-09-16', 'Não'),
(460, 8, 1, 1, 49, '2020-09-16', 'Sim'),
(465, 8, 25, 1, 50, '2020-09-16', 'Não'),
(466, 8, 1, 1, 50, '2020-09-16', 'Sim'),
(473, 8, 25, 1, 51, '2020-09-16', 'Não'),
(495, 8, 4, 1, 53, '2020-09-17', 'Sim'),
(497, 8, 25, 1, 54, '2020-09-17', 'Não'),
(498, 8, 25, 1, 55, '2020-09-17', 'Não'),
(499, 8, 25, 1, 56, '2020-09-17', 'Não'),
(502, 8, 4, 1, 57, '2020-09-17', 'Sim'),
(503, 8, 32, 1, 58, '2020-09-17', 'Não'),
(504, 8, 25, 1, 58, '2020-09-17', 'Não'),
(505, 8, 25, 1, 59, '2020-09-17', 'Não'),
(508, 8, 24, 1, 60, '2020-09-17', 'Não'),
(509, 6, 25, 1, 61, '2020-09-17', 'Não'),
(510, 8, 25, 1, 62, '2020-09-17', 'Não'),
(511, 8, 32, 1, 63, '2020-09-17', 'Não'),
(512, 8, 25, 2, 64, '2020-09-21', 'Não'),
(519, 13, 36, 1, 65, '2020-11-06', 'Não'),
(520, 13, 10, 1, 66, '2020-11-09', 'Não'),
(521, 13, 36, 1, 67, '2020-11-09', 'Não'),
(522, 18, 34, 1, 68, '2020-11-09', 'Não'),
(523, 13, 10, 1, 69, '2020-11-09', 'Não'),
(524, 13, 8, 1, 72, '2020-11-09', 'Não'),
(525, 13, 15, 1, 73, '2020-11-09', 'Não'),
(526, 13, 37, 1, 75, '2020-11-10', 'Não'),
(527, 13, 34, 1, 76, '2020-11-10', 'Não'),
(528, 13, 34, 2, 1, '2020-11-10', 'Não'),
(529, 17, 33, 2, 2, '2020-11-10', 'Não'),
(530, 13, 34, 1, 3, '2020-11-25', 'Não'),
(531, 13, 34, 1, 5, '2020-11-25', 'Não'),
(532, 13, 8, 1, 5, '2020-11-25', 'Não'),
(534, 13, 34, 1, 6, '2020-11-25', 'Não'),
(536, 13, 37, 1, 6, '2020-11-25', 'Não'),
(537, 13, 10, 1, 7, '2020-11-25', 'Não'),
(538, 13, 34, 1, 8, '2020-11-25', 'Não'),
(539, 13, 33, 1, 9, '2020-11-25', 'Não'),
(540, 13, 35, 1, 10, '2020-11-25', 'Não'),
(541, 13, 10, 5, 11, '2020-11-25', 'Não'),
(542, 20, 33, 1, 12, '2020-11-26', 'Não'),
(543, 20, 30, 1, 12, '2020-11-26', 'Não'),
(544, 20, 8, 1, 12, '2020-11-26', 'Não'),
(545, 20, 34, 1, 12, '2020-11-26', 'Não'),
(546, 20, 35, 1, 12, '2020-11-26', 'Não'),
(548, 19, 10, 10, 13, '2020-11-27', 'Não'),
(549, 19, 30, 2, 14, '2020-12-02', 'Não'),
(550, 19, 34, 1, 14, '2020-12-02', 'Não'),
(553, 19, 34, 5, 15, '2020-12-02', 'Não'),
(554, 19, 30, 1, 16, '2020-12-21', 'Não'),
(556, 19, 37, 27, 17, '2020-12-22', 'Não'),
(557, 19, 22, 1, 18, '2020-12-22', 'Não'),
(565, 19, 34, 1, 19, '2020-12-28', 'Não'),
(566, 19, 34, 1, 19, '2020-12-28', 'Não'),
(567, 19, 34, 1, 20, '2020-12-28', 'Não'),
(568, 19, 34, 1, 21, '2020-12-28', 'Não'),
(571, 19, 37, 1, 22, '2021-01-01', 'Não'),
(574, 19, 34, 1, 23, '2021-01-15', 'Não'),
(575, 19, 36, 1, 23, '2021-01-15', 'Não'),
(576, 19, 34, 1, 24, '2021-01-15', 'Não'),
(577, 19, 37, 1, 24, '2021-01-15', 'Não'),
(578, 19, 22, 1, 25, '2021-01-16', 'Não'),
(579, 19, 18, 1, 25, '2021-01-16', 'Não'),
(580, 19, 34, 1, 26, '2021-01-31', 'Não'),
(581, 19, 34, 1, 27, '2021-01-31', 'Não'),
(582, 19, 34, 1, 27, '2021-01-31', 'Não'),
(583, 13, 34, 1, 28, '2021-02-02', 'Não'),
(584, 13, 34, 1, 29, '2021-02-02', 'Não'),
(585, 19, 34, 1, 30, '2021-02-20', 'Não'),
(586, 19, 34, 1, 31, '2021-03-02', 'Não'),
(587, 19, 37, 1, 31, '2021-03-02', 'Não'),
(590, 19, 33, 1, 32, '2021-03-08', 'Não'),
(591, 19, 34, 1, 32, '2021-03-08', 'Não'),
(595, 19, 34, 1, 34, '2021-04-30', 'Não'),
(596, 19, 38, 1, 39, '2021-04-30', 'Não'),
(601, 19, 39, 1, 40, '2021-10-29', 'Não'),
(602, 19, 39, 1, 41, '2021-10-29', 'Não'),
(603, 19, 39, 1, 42, '2021-10-29', 'Não'),
(604, 19, 39, 1, 43, '2021-10-29', 'Não'),
(605, 19, 41, 1, 44, '2021-10-30', 'Não'),
(606, 19, 40, 1, 44, '2021-10-30', 'Não'),
(607, 19, 39, 1, 44, '2021-10-30', 'Não'),
(612, 19, 41, 1, 45, '2021-10-31', 'Não'),
(613, 19, 41, 1, 45, '2021-11-01', 'Não'),
(614, 19, 42, 1, 0, '2021-11-04', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `nome_url` varchar(50) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `nome_url`, `imagem`) VALUES
(2, 'Moda Feminina', 'moda-feminina', 'cat-2.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(5) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `cartoes` int(11) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `email`, `telefone`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `estado`, `cep`, `cartoes`, `data_cadastro`) VALUES
(7, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 5, '2020-12-09 00:00:00'),
(8, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2020-12-07 00:00:00'),
(9, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 5, '2020-12-04 00:00:00'),
(11, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:52:33'),
(12, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:53:04'),
(13, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:54:16'),
(14, 'Rebeca Lorraine Mendes de Oliveira', '50332421805', 'rebecalorraine0204@gmail.com', '12996278049', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', NULL, '2020-12-09 15:45:42'),
(15, 'Willian Sales Gabriel', '11867569698', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', 2, '2020-12-09 20:32:10'),
(16, 'Marcos de Oliveira', '57424477528', 'marcos@gmail.com', '12996546658', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', 1, '2020-12-18 01:09:05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `combos`
--

DROP TABLE IF EXISTS `combos`;
CREATE TABLE IF NOT EXISTS `combos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `nome_url` varchar(50) NOT NULL,
  `descricao` varchar(1000) NOT NULL,
  `descricao_longa` text NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `tipo_envio` int(1) NOT NULL,
  `palavras` varchar(250) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `peso` double(8,2) NOT NULL,
  `largura` double(8,2) NOT NULL,
  `altura` double(8,2) NOT NULL,
  `comprimento` double(8,2) NOT NULL,
  `valor_frete` decimal(10,2) DEFAULT NULL,
  `vendas` int(11) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `coment_blog`
--

DROP TABLE IF EXISTS `coment_blog`;
CREATE TABLE IF NOT EXISTS `coment_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_blog` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `comentario` varchar(500) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupons`
--

DROP TABLE IF EXISTS `cupons`;
CREATE TABLE IF NOT EXISTS `cupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(35) NOT NULL,
  `desconto` decimal(8,2) NOT NULL,
  `codigo` varchar(35) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `emails`
--

DROP TABLE IF EXISTS `emails`;
CREATE TABLE IF NOT EXISTS `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `nome`, `email`, `ativo`) VALUES
(8, 'Willian Sales Gabriel', 'williansales199619@gmail.com', 'Sim'),
(9, 'Rebeca Lorraine Mendes de Oliveira', 'rebeca@gmail.com', 'Sim'),
(10, 'Rebeca Lorraine Mendes de Oliveira', 'rebecalorraine0204@gmail.com', 'Sim'),
(11, 'Marcos de Oliveira', 'marcos@gmail.com', 'Sim'),
(12, 'Willian Sales Gabriel ', 'williansalesgabriel@hotmail.com', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `envios_email`
--

DROP TABLE IF EXISTS `envios_email`;
CREATE TABLE IF NOT EXISTS `envios_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `final` int(11) NOT NULL,
  `assunto` varchar(100) NOT NULL,
  `mensagem` varchar(1000) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `envios_email`
--

INSERT INTO `envios_email` (`id`, `data`, `final`, `assunto`, `mensagem`, `link`) VALUES
(1, '2020-09-21 17:30:54', 0, 'Promoção de Camisas', 'Aproveite a nossa promoção com um lindo conjunto ..', 'combo-conjunto-completo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `imagens`
--

DROP TABLE IF EXISTS `imagens`;
CREATE TABLE IF NOT EXISTS `imagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `imagens`
--

INSERT INTO `imagens` (`id`, `id_produto`, `imagem`) VALUES
(11, 1, 'cat-4.jpg'),
(13, 3, 'cat-2.jpg'),
(14, 3, 'cat-4.jpg'),
(15, 3, 'cat-7.jpg'),
(16, 1, 'cat-6.jpg'),
(19, 31, 'cat-4.jpg'),
(21, 25, 'ca misa social.jpg'),
(22, 25, 'Blusa-azul.jpg'),
(23, 25, 'Blusa Ver.jpg'),
(24, 25, 'Polo Marinho.jpg'),
(25, 25, 'Blue.jpg'),
(26, 37, '0ce0f135e0e18473412e860efabacb28.jpg'),
(27, 39, '17210305213i7397ga5g.jpg'),
(28, 39, '1721030521j31eic5gcf.jpg'),
(30, 42, '1721030521j31eic5gcf (1).jpg'),
(31, 42, '17210305213i7397ga5g (1).jpg'),
(33, 46, '074514012155f0h330a4.jpg'),
(35, 46, '0745140121hc1hdejbic.jpg'),
(36, 46, '0745140121chj63206d6.jpg'),
(37, 46, '0745140121kihacjiajg.jpg'),
(39, 47, '1401110121h46a60ehck.jpg'),
(40, 47, '1401110121dafah1hcef.jpg'),
(41, 47, '1401110121be7ji1fhde.jpg'),
(43, 48, '1352110121ca5dha8eff.jpg'),
(44, 48, '1352110121e3jigjdchj.jpg'),
(45, 48, '1352110121bdj3fg19j6.jpg'),
(46, 47, '1401110121eigh4iceee (2).jpg'),
(47, 49, '1335110121jcaaii0hk5.jpg'),
(48, 49, '1335110121kbfjikf8c8.jpg'),
(49, 49, '1335110121c3e03kk2hh.jpg'),
(50, 51, '1204110121hhhd6d0dh5 (1).jpg'),
(51, 51, '1204110121cb86fkjdbe.jpg'),
(52, 51, '1204110121jghbbj9adh.jpg'),
(53, 51, '1204110121h9dabk34kd.jpg'),
(54, 51, '12041101214kgc5ie8k0.jpg'),
(55, 52, '1029110121caiehajhik.jpg'),
(58, 52, '1029110121bgc4fbi8da.jpg'),
(59, 52, '10291101215gj5496eae.jpg'),
(60, 53, '2127100121j0h0iid5id.jpg'),
(61, 53, '2127100121ikkbc70e48.jpg'),
(62, 54, '1843110921f2ccgcbk6j (1).jpg'),
(63, 54, '1843110921da5gkcgfe8.jpg'),
(65, 56, '1807110921keggecedaa.jpg'),
(66, 56, '1807110921jkfg8gbcab.jpg'),
(67, 56, '1807110921de3baej67a.jpg'),
(68, 56, '18071109218h3fj9ed4i.jpg'),
(69, 56, '1807110921g9bbfe0k79.jpg'),
(70, 64, '1949050521jijbad2ak8.jpg'),
(71, 64, '1951050521ejjgagf94h (1).jpg'),
(72, 64, '1951050521aa5chagk34 (2).jpg'),
(73, 64, '1948050521dbjhjegfb0.jpg'),
(74, 64, '1224300421bkebd2iiha.jpg'),
(75, 59, '091715012183heha8d1i.jpg'),
(76, 59, '0917150121aa6fgjjci5.jpg'),
(77, 65, '2055120121c9dcchajcj.jpg'),
(78, 65, '2055120121chbhb3kbi2.jpg'),
(79, 65, '2055120121ebidcbkgaa.jpg'),
(80, 67, '1609120121cchfki2afc.jpg'),
(81, 67, '1609120121j0adeff9kg.jpg'),
(82, 67, '1609120121gah5ikdk2j.jpg'),
(83, 67, '1609120121b3c7j2fa9b.jpg'),
(84, 67, '1609120121afhc0ehhhc.jpg'),
(85, 67, '1609120121j2fha6deee (1).jpg'),
(86, 68, '1557120121h6kh5h26cj.jpg'),
(87, 68, '1557120121iei8ccdahf.jpg'),
(88, 68, '1557120121cjfi7gkd44.jpg'),
(89, 68, '1557120121f6b85fc1a3.jpg'),
(90, 69, '1544120121bciaikekck.jpg'),
(91, 69, '15441201215jfkgd1908.jpg'),
(92, 69, '154412012108ee5k88e4 (1).jpg'),
(93, 69, '15441201217cc2ec0ajf.jpg'),
(94, 69, '1544120121khdeeb3ejf (1).jpg'),
(95, 58, '1527120121bb3aiaic25.jpg'),
(96, 58, '15271201215hidbkbhf0.jpg'),
(97, 55, '1459120121eedekgjee2.jpg'),
(98, 55, '1459120121akdk41g9kb.jpg'),
(99, 55, '1453120121c7ek1gh5if (1).jpg'),
(100, 62, '0856150121e96i8ii4d4.jpg'),
(101, 62, '1441120121e8ededai3f.jpg'),
(102, 62, '08561501215h7hfci9af.jpg'),
(103, 60, '1117270221kkk9dg9jc6.jpg'),
(104, 60, '1841100921ibi5hc8d19 (1).jpg'),
(105, 57, '13071201216i62ai6eca.jpg'),
(106, 57, '1307120121gb12jb2eig.jpg'),
(107, 57, '13071201219gk1aaajc2.jpg'),
(108, 57, '1307120121gajjcj3d78.jpg'),
(109, 71, '1405120121ceh6g0gjbg.jpg'),
(110, 71, '1405120121594bahecgd.png'),
(111, 71, '1405120121ekhdk5cg6g.jpg'),
(112, 71, '1405120121daijbhg6gg.jpg'),
(113, 71, '14051201212hb9fbcdc5.png'),
(114, 71, '1405120121h5h89gbfaf.jpg'),
(115, 71, '1405120121dfegaa0ejc.jpg'),
(116, 71, '1405120121d4ek0gfif3.jpg'),
(117, 71, '14051201215fikbiakkj.jpg'),
(118, 73, '1326120121dhae4c35ch.jpg'),
(119, 73, '13261201211gdadec1ka.jpg'),
(120, 73, '132612012196cfhha30k.jpg'),
(121, 73, '1326120121ic1dj2kkh2.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mensagem`
--

DROP TABLE IF EXISTS `mensagem`;
CREATE TABLE IF NOT EXISTS `mensagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  `usuario` varchar(25) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `mensagem`
--

INSERT INTO `mensagem` (`id`, `id_venda`, `texto`, `usuario`, `data`, `hora`) VALUES
(7, 43, 'Mensagem Teste', 'Cliente', '2020-09-15', '00:00:00'),
(9, 43, 'Pergunta do Admin', 'Admin', '2020-09-15', '00:00:00'),
(15, 43, 'Cliente Respondeu', 'Admin', '2020-09-15', '13:37:59'),
(16, 42, 'Pergunta do cliente sobre...', 'Cliente', '2020-09-15', '14:01:25'),
(17, 42, 'Resposta do Admin', 'Admin', '2020-09-15', '14:26:59'),
(18, 42, 'Mudança de status no pedido, pedido Disponivel', 'Admin', '2020-09-15', '15:19:45'),
(19, 42, 'Mudança de status no pedido, pedido Entregue', 'Admin', '2020-09-15', '15:20:34'),
(20, 42, 'Mudança de status no pedido, pedido Entregue', 'Admin', '2020-09-15', '15:27:39'),
(21, 42, 'Obrigado', 'Cliente', '2020-09-15', '15:32:48'),
(22, 40, 'Seu pedido foi Enviado, o código de rastreio é JR065666652', 'Admin', '2020-09-15', '15:38:18'),
(23, 44, 'Parab?ns, voc? ganhou um novo cupom de desconto, poder? usar at? o dia 22/09/2020 o seu c?digo para uso do cupom ? 214.569.999-99', 'Admin', '2020-09-15', '17:32:02'),
(24, 45, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 22/09/2020 o seu código para uso do cupom é 214.569.999-99', 'Admin', '2020-09-15', '17:40:39'),
(25, 46, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 22/09/2020 o seu código para uso do cupom é 214.569.999-99', 'Admin', '2020-09-15', '18:19:56'),
(26, 43, 'Mudança de status no pedido, pedido Não Enviado', 'Admin', '2020-09-15', '18:53:38'),
(27, 47, 'Seu pedido foi Enviado, o código de rastreio é JR065666652', 'Admin', '2020-09-15', '19:10:46'),
(28, 43, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 22/09/2020 o seu código para uso do cupom é 214.569.999-99', 'Admin', '2020-09-15', '19:13:33'),
(29, 64, 'Seu pedido foi Enviado, o código de rastreio é JR065666652', 'Admin', '2020-09-21', '18:01:57'),
(30, 2, 'Seu pedido foi Enviado, o código de rastreio é AA987654321BR', 'Admin', '2020-11-10', '05:15:34'),
(31, 2, 'Seu pedido foi Enviado, o código de rastreio é AA987654321BR', 'Admin', '2020-11-10', '05:15:35'),
(32, 11, 'Seu pedido foi Enviado, o código de rastreio é AA987654321BR', 'Admin', '2020-12-10', '17:40:31'),
(33, 11, 'Seu pedido foi Enviado, o código de rastreio é AA987654321BR', 'Admin', '2020-12-10', '17:40:32'),
(34, 6, 'Mudança de status no pedido, pedido Retirada', 'Admin', '2020-12-10', '18:32:45'),
(35, 3, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 17/12/2020 o seu código para uso do cupom é 43593584825', 'Admin', '2020-12-10', '18:44:34'),
(36, 1, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 29/12/2020 o seu código para uso do cupom é 43593584825', 'Admin', '2020-12-22', '18:58:37'),
(37, 17, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 29/12/2020 o seu código para uso do cupom é 11867569698', 'Admin', '2020-12-22', '20:14:56'),
(38, 17, 'Mudança de status no pedido, pedido Entregue', 'Admin', '2020-12-27', '14:37:17'),
(39, 25, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 23/01/2021 o seu código para uso do cupom é 11867569698', 'Admin', '2021-01-16', '01:52:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `motoboy`
--

DROP TABLE IF EXISTS `motoboy`;
CREATE TABLE IF NOT EXISTS `motoboy` (
  `bairros_id` int(11) NOT NULL AUTO_INCREMENT,
  `bairros_nome` varchar(100) NOT NULL,
  `bairros_cidade` varchar(100) NOT NULL,
  `bairros_frete_valor` double DEFAULT NULL,
  PRIMARY KEY (`bairros_id`)
) ENGINE=MyISAM AUTO_INCREMENT=308 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `motoboy`
--

INSERT INTO `motoboy` (`bairros_id`, `bairros_nome`, `bairros_cidade`, `bairros_frete_valor`) VALUES
(1, 'Balneário Copacabana', 'Caraguatatuba', 7),
(2, 'Balneário dos Golfinhos', 'Caraguatatuba', 7),
(113, 'Alfredo Petercem', 'Sao Sebastiao', 5),
(4, 'balneário Gardem Mar ', 'Caraguatatuba', 7),
(6, 'Balneário Golfinhos', 'Caraguatatuba', 8),
(7, 'Balneário Recanto do Sol', 'Caraguatatuba', 8),
(8, 'Barranco Alto', 'Caraguatatuba', 7),
(9, 'Benfica', 'Caraguatatuba', 7),
(10, 'Capricórnio III', 'Caraguatatuba', 15),
(11, 'Caputera', 'Caraguatatuba', 7),
(12, 'Casa Branca', 'Caraguatatuba', 7),
(13, 'Centro', 'Caraguatatuba', 7),
(14, 'Chácara Colónias ', 'Caraguatatuba', 7),
(15, 'Cidade Jardim', 'Caraguatatuba', 7),
(16, 'Copacabana', 'Caraguatatuba', 7),
(17, 'Costa Tabatinga', 'Caraguatatuba', 15),
(18, 'Costa Verde Mococa', 'Caraguatatuba', 7),
(19, 'Costa Verde Tabatinga', 'Caraguatatuba', 7),
(20, 'Estância Balneária Hawai', 'Caraguatatuba', 7),
(21, 'Fazenda Getuba', 'Caraguatatuba', 7),
(22, 'Fazenda Jaraguá', 'Caraguatatuba', 7),
(23, 'Fazenda Jetuba', 'Caraguatatuba', 7),
(24, 'Fazenda Recanto Ana', 'Caraguatatuba', 7),
(25, 'Fazenda Rio Claro', 'Caraguatatuba', 7),
(26, 'Getuba', 'Caraguatatuba', 7),
(27, 'Indaiá', 'Caraguatatuba', 7),
(28, 'Ipiranga', 'Caraguatatuba', 7),
(29, 'Jaraguá', 'Caraguatatuba', 7),
(30, 'Jaraguá Perequê', 'Caraguatatuba', 7),
(31, 'Jaraguazinho', 'Caraguatatuba', 7),
(32, 'Jardim Aruan', 'Caraguatatuba', 7),
(33, 'Jardim Bandeirantes', 'Caraguatatuba', 7),
(34, 'Jardim Benfica', 'Caraguatatuba', 7),
(35, 'Jardim Brasil', 'Caraguatatuba', 7),
(36, 'Jardim Británia', 'Caraguatatuba', 7),
(37, 'Jardim C Sindicatos', 'Caraguatatuba', 7),
(38, 'Jardim Califórnia ', 'Caraguatatuba', 7),
(39, 'Jardim Capricórnio', 'Caraguatatuba', 7),
(40, 'Jardim Capricórnio II', 'Caraguatatuba', 7),
(41, 'Jardim Casa Branca', 'Caraguatatuba', 7),
(42, 'Jardim Colónia Sindicatos', 'Caraguatatuba', 7),
(43, 'Jardim das Gaivotas', 'Caraguatatuba', 7),
(44, 'Jardim do Sol', 'Caraguatatuba', 7),
(45, 'Jardim dos Sindicatos', 'Caraguatatuba', 7),
(46, 'Jardim Flexeiras', 'Caraguatatuba', 7),
(47, 'Jardim Forest', 'Caraguatatuba', 7),
(48, 'Jardim Gaivotas', 'Caraguatatuba', 7),
(49, 'Jardim Gaivotas III', 'Caraguatatuba', 7),
(50, 'Jardim Golfinhos', 'Caraguatatuba', 7),
(51, 'Jardim Indaiá', 'Caraguatatuba', 7),
(52, 'Jardim ItaÃºna', 'Caraguatatuba', 7),
(53, 'Jardim Jaqueira', 'Caraguatatuba', 7),
(54, 'Jardim Jaraguá', 'Caraguatatuba', 7),
(55, 'Jardim Miramar', 'Caraguatatuba', 7),
(56, 'Jardim Olaria', 'Caraguatatuba', 7),
(57, 'Jardim Palmeiras', 'Caraguatatuba', 7),
(58, 'Jardim Parnaso', 'Caraguatatuba', 7),
(59, 'Jardim Parnazo', 'Caraguatatuba', 7),
(60, 'Jardim Ponte Seca', 'Caraguatatuba', 7),
(61, 'Jardim Porto Novo', 'Caraguatatuba', 7),
(62, 'Jardim Primavera', 'Caraguatatuba', 7),
(63, 'Jardim Recanto', 'Caraguatatuba', 7),
(64, 'Jardim Rio Santos', 'Caraguatatuba', 7),
(65, 'Jardim Rua Santos', 'Caraguatatuba', 7),
(66, 'Jardim São Francisco', 'Caraguatatuba', 7),
(67, 'Jardim Saveiro', 'Caraguatatuba', 7),
(68, 'Jardim Sindicato', 'Caraguatatuba', 7),
(69, 'Jardim Sindicatos', 'Caraguatatuba', 7),
(70, 'Jardim Sol', 'Caraguatatuba', 7),
(71, 'Jardim Tarumas', 'Caraguatatuba', 7),
(72, 'Loteamento Luiz Marques', 'Caraguatatuba', 7),
(73, 'Loteamento Recreio Juqueriquere', 'Caraguatatuba', 7),
(74, 'Mar Verde II', 'Caraguatatuba', 7),
(75, 'Martim de Sá', 'Caraguatatuba', 7),
(76, 'Martim Sá', 'Caraguatatuba', 7),
(77, 'Massaguaçu', 'Caraguatatuba', 7),
(78, 'Morro Algodão', 'Caraguatatuba', 7),
(79, 'Morro do Algodão', 'Caraguatatuba', 7),
(80, 'Morro Querozene', 'Caraguatatuba', 7),
(81, 'Olaria', 'Caraguatatuba', 7),
(82, 'Parque Imperial', 'Caraguatatuba', 7),
(83, 'Pegorelli', 'Caraguatatuba', 7),
(84, 'Pereque mirim', 'Caraguatatuba', 7),
(85, 'Poiares', 'Caraguatatuba', 7),
(86, 'Pontal de Santa Marina', 'Caraguatatuba', 7),
(87, 'Pontal Santa Marina', 'Caraguatatuba', 7),
(88, 'Pontal Santamar', 'Caraguatatuba', 7),
(89, 'Ponte Seca', 'Caraguatatuba', 7),
(90, 'Portal Fazendinha', 'Caraguatatuba', 7),
(91, 'Portal Patrimonium', 'Caraguatatuba', 7),
(92, 'Portal Tabatinga', 'Caraguatatuba', 7),
(93, 'Porto Novo', 'Caraguatatuba', 7),
(94, 'Praia da Mococa', 'Caraguatatuba', 7),
(95, 'Praia das Palmeiras', 'Caraguatatuba', 7),
(96, 'Praia Palmeiras', 'Caraguatatuba', 7),
(97, 'Prainha', 'Caraguatatuba', 7),
(98, 'Recanto Som Mar', 'Caraguatatuba', 7),
(99, 'Recanto Verde Mar', 'Caraguatatuba', 7),
(100, 'Residencial Marina', 'Caraguatatuba', 7),
(101, 'Rio Claro', 'Caraguatatuba', 7),
(102, 'Rio do Ouro', 'Caraguatatuba', 7),
(103, 'Rio Ouro', 'Caraguatatuba', 7),
(104, 'Santo António', 'Caraguatatuba', 7),
(105, 'Sumaré', 'Caraguatatuba', 7),
(106, 'Tabatinga', 'Caraguatatuba', 7),
(107, 'Tinga', 'Caraguatatuba', 7),
(108, 'Travessão', 'Caraguatatuba', 7),
(109, 'Viaduto Golfinhos', 'Caraguatatuba', 7),
(110, 'Vila Marcondes', 'Caraguatatuba', 7),
(111, 'Vila Ponte Seca', 'Caraguatatuba', 7),
(112, 'Villagio Verde Mare', 'Caraguatatuba', 7),
(114, 'Areião de Camburí', 'Sao Sebastiao', 5),
(115, 'Arrastão', 'Sao Sebastiao', 5),
(116, 'Bairro Sertãozinho', 'Sao Sebastiao', 5),
(117, 'Bairro Varadouro', 'Sao Sebastiao', 5),
(118, 'Baleia', 'Sao Sebastiao', 5),
(119, 'Balneário Canto do Mar', 'Sao Sebastiao', 5),
(120, 'Balneário Canto Mar', 'Sao Sebastiao', 5),
(121, 'Balneário Turist Enseada', 'Sao Sebastiao', 5),
(122, 'Baraquecaba', 'Sao Sebastiao', 5),
(123, 'Barequeçaba', 'Sao Sebastiao', 5),
(124, 'Barra do Sahy', 'Sao Sebastiao', 5),
(125, 'Barra do Sai', 'Sao Sebastiao', 5),
(126, 'Barra do Say', 'Sao Sebastiao', 5),
(127, 'Barra do Una', 'Sao Sebastiao', 5),
(128, 'Barra Sahy', 'Sao Sebastiao', 5),
(129, 'Barra Una', 'Sao Sebastiao', 5),
(130, 'Boiçucanga', 'Sao Sebastiao', 5),
(131, 'Boissucanga', 'Sao Sebastiao', 5),
(132, 'Boissulanga', 'Sao Sebastiao', 5),
(133, 'Boraceia', 'Sao Sebastiao', 5),
(134, 'Boraceia 2', 'Sao Sebastiao', 5),
(135, 'Boraceia II', 'Sao Sebastiao', 5),
(136, 'Camburí', 'Sao Sebastiao', 5),
(137, 'Camburizinho', 'Sao Sebastiao', 5),
(138, 'Cambury', 'Sao Sebastiao', 5),
(139, 'Canto do Mar', 'Sao Sebastiao', 5),
(140, 'Centro', 'Sao Sebastiao', 5),
(141, 'Cigarras', 'Sao Sebastiao', 5),
(142, 'Condomínio Baleia', 'Sao Sebastiao', 5),
(143, 'do Sai', 'Sao Sebastiao', 5),
(144, 'Enseada', 'Sao Sebastiao', 5),
(145, 'Enseada Divisa', 'Sao Sebastiao', 5),
(146, 'Guaeca', 'Sao Sebastiao', 5),
(147, 'Itatinga', 'Sao Sebastiao', 5),
(148, 'Jaraguá', 'Sao Sebastiao', 5),
(149, 'Jardim Canto Mar', 'Sao Sebastiao', 5),
(150, 'Jardim Forte', 'Sao Sebastiao', 5),
(151, 'Jardim Jaraguá', 'Sao Sebastiao', 5),
(152, 'Jardim S Francisco', 'Sao Sebastiao', 5),
(153, 'Jardim São Francisco', 'Sao Sebastiao', 5),
(154, 'Joquey Maresias', 'Sao Sebastiao', 5),
(155, 'Juquehi', 'Sao Sebastiao', 5),
(156, 'Juquehy', 'Sao Sebastiao', 5),
(157, 'Juqueí', 'Sao Sebastiao', 5),
(158, 'Juquery', 'Sao Sebastiao', 5),
(159, 'Juquey', 'Sao Sebastiao', 5),
(160, 'Jureia', 'Sao Sebastiao', 5),
(161, 'La Residencial Du Moulin', 'Sao Sebastiao', 5),
(162, 'Maresias', 'Sao Sebastiao', 5),
(163, 'Morro do Abrigo', 'Sao Sebastiao', 5),
(164, 'Olaria', 'Sao Sebastiao', 5),
(165, 'Parque Coqueiros', 'Sao Sebastiao', 5),
(166, 'Parque Itatinga', 'Sao Sebastiao', 5),
(167, 'Paúba', 'Sao Sebastiao', 5),
(168, 'Pitangueiras', 'Sao Sebastiao', 5),
(169, 'Pontal Cruz', 'Sao Sebastiao', 5),
(170, 'Pontal da Cruz', 'Sao Sebastiao', 5),
(171, 'Pontão da Cruz', 'Sao Sebastiao', 5),
(172, 'Pontinha', 'Sao Sebastiao', 5),
(173, 'Por Grande', 'Sao Sebastiao', 5),
(174, 'Portal da Olaria', 'Sao Sebastiao', 5),
(175, 'Portal Enseada', 'Sao Sebastiao', 5),
(176, 'Portal Olaria', 'Sao Sebastiao', 5),
(177, 'Porto Grande', 'Sao Sebastiao', 5),
(178, 'Praia Baleia', 'Sao Sebastiao', 5),
(179, 'Praia Baraquecaba', 'Sao Sebastiao', 5),
(180, 'Praia Boissucanga', 'Sao Sebastiao', 5),
(181, 'Praia Boraceia', 'Sao Sebastiao', 5),
(182, 'Praia Camburí', 'Sao Sebastiao', 5),
(183, 'Praia Cigarras', 'Sao Sebastiao', 5),
(184, 'Praia da Baleia', 'Sao Sebastiao', 5),
(185, 'Praia da Figueira', 'Sao Sebastiao', 5),
(186, 'Praia da Olaria', 'Sao Sebastiao', 5),
(187, 'Praia de Boraceia', 'Sao Sebastiao', 5),
(188, 'Praia de Juquehy', 'Sao Sebastiao', 5),
(189, 'Praia de Juqueí', 'Sao Sebastiao', 5),
(190, 'Praia do Arrastão', 'Sao Sebastiao', 5),
(191, 'Praia do Guaeca', 'Sao Sebastiao', 5),
(192, 'Praia do Partido', 'Sao Sebastiao', 5),
(193, 'Praia do Say', 'Sao Sebastiao', 5),
(194, 'Praia do Toque Toque', 'Sao Sebastiao', 5),
(195, 'Praia Engenho', 'Sao Sebastiao', 5),
(196, 'Praia Enseada', 'Sao Sebastiao', 5),
(197, 'Praia Figueira', 'Sao Sebastiao', 5),
(198, 'Praia Juqueí', 'Sao Sebastiao', 5),
(199, 'Praia Maresias', 'Sao Sebastiao', 5),
(200, 'Praia Porto Grande', 'Sao Sebastiao', 5),
(201, 'Praia Preta', 'Sao Sebastiao', 5),
(202, 'Praia Una', 'Sao Sebastiao', 5),
(203, 'Reserva Du Moulin', 'Sao Sebastiao', 5),
(204, 'S Francisco', 'Sao Sebastiao', 5),
(205, 'S Francisco da Praia', 'Sao Sebastiao', 5),
(206, 'Sahi', 'Sao Sebastiao', 5),
(207, 'São Francisco', 'Sao Sebastiao', 5),
(208, 'São Francisco Praia', 'Sao Sebastiao', 5),
(210, 'Sertão Camburí', 'Sao Sebastiao', 5),
(211, 'Sertão do Camburí', 'Sao Sebastiao', 5),
(212, 'Sertãozinho', 'Sao Sebastiao', 5),
(213, 'Sítio Esperança', 'Sao Sebastiao', 5),
(214, 'Tapolandia', 'Sao Sebastiao', 5),
(215, 'Tocolandia', 'Sao Sebastiao', 5),
(216, 'Topo Varadouro', 'Sao Sebastiao', 5),
(217, 'Topolândia', 'Sao Sebastiao', 5),
(218, 'Topovaradouro', 'Sao Sebastiao', 5),
(219, 'Toque T Pequeno', 'Sao Sebastiao', 5),
(220, 'Toque Tooque Pequeno', 'Sao Sebastiao', 5),
(221, 'Toque Toque Pequen', 'Sao Sebastiao', 5),
(222, 'Toque-toque Grande', 'Sao Sebastiao', 5),
(223, 'Toque-toque Pequeno', 'Sao Sebastiao', 5),
(224, 'Varadouro', 'Sao Sebastiao', 5),
(225, 'Vila Amélia', 'Sao Sebastiao', 5),
(226, 'Vila Baiana', 'Sao Sebastiao', 5),
(227, 'Vila do Sahy', 'Sao Sebastiao', 5),
(228, 'Vila Sahy', 'Sao Sebastiao', 5),
(229, 'Village Camburí', 'Sao Sebastiao', 5),
(230, 'Água Branca', 'Ilhabela', 7),
(231, 'ArmaÃ§Ã£o', 'Ilhabela', 7),
(232, 'B Ponta Azeda', 'Ilhabela', 7),
(233, 'Bairro Reino', 'Ilhabela', 7),
(234, 'Barra Água Branca', 'Ilhabela', 7),
(235, 'Barra da Água Branca', 'Ilhabela', 7),
(236, 'Barra Velha', 'Ilhabela', 7),
(237, 'Bexiga', 'Ilhabela', 7),
(238, 'Bonete', 'Ilhabela', 7),
(239, 'Centro', 'Ilhabela', 7),
(240, 'Cocaia', 'Ilhabela', 7),
(241, 'CondomÃ­nio Ilha Sul', 'Ilhabela', 7),
(242, 'Costa Bela', 'Ilhabela', 7),
(243, 'Costa Bela II', 'Ilhabela', 7),
(244, 'Curral', 'Ilhabela', 7),
(245, 'do Ilhote', 'Ilhabela', 7),
(246, 'Feiticeira', 'Ilhabela', 7),
(247, 'Ilha Cabras', 'Ilhabela', 7),
(248, 'ItaguaÃ§u', 'Ilhabela', 7),
(249, 'Itaguassu', 'Ilhabela', 7),
(250, 'Itaquanduba', 'Ilhabela', 7),
(251, 'Jabaquara', 'Ilhabela', 7),
(252, 'Jardim Arco Ãris', 'Ilhabela', 7),
(253, 'Jardim Arco-Ã­ris', 'Ilhabela', 7),
(254, 'Jardim Coqueiros', 'Ilhabela', 7),
(255, 'Jardim Ã‰den', 'Ilhabela', 7),
(256, 'Jardim Siriuba I', 'Ilhabela', 7),
(257, 'Loteamento Fazenda do Matias', 'Ilhabela', 7),
(258, 'Loteamento Fazenda Engenheiro', 'Ilhabela', 7),
(259, 'Loteamento Fazenda Matias', 'Ilhabela', 7),
(260, 'Loteamento Mirante Ilha', 'Ilhabela', 7),
(261, 'Morro Cantagalo', 'Ilhabela', 7),
(262, 'Morro Castelo', 'Ilhabela', 7),
(263, 'Morro Fazenda', 'Ilhabela', 7),
(264, 'Morro Resfriado', 'Ilhabela', 7),
(265, 'Pequea', 'Ilhabela', 7),
(266, 'PerequÃª', 'Ilhabela', 7),
(267, 'Piuva', 'Ilhabela', 7),
(268, 'Ponta Azeda', 'Ilhabela', 7),
(269, 'PontÃ£o Azeda', 'Ilhabela', 7),
(270, 'PontÃ£o das Canas', 'Ilhabela', 7),
(271, 'Portinho', 'Ilhabela', 7),
(272, 'Prai Itacuanduba', 'Ilhabela', 7),
(273, 'Praia Curral', 'Ilhabela', 7),
(274, 'Praia da Feiticeira', 'Ilhabela', 7),
(275, 'Praia do Bexiga', 'Ilhabela', 7),
(276, 'Praia do Curral', 'Ilhabela', 7),
(277, 'Praia do ItaguaÃ§u', 'Ilhabela', 7),
(278, 'Praia do PerequÃª', 'Ilhabela', 7),
(279, 'Praia Feia', 'Ilhabela', 7),
(280, 'Praia Feiticeira', 'Ilhabela', 7),
(281, 'Praia Figueira', 'Ilhabela', 7),
(282, 'Praia Grande', 'Ilhabela', 7),
(283, 'Praia ItaguaÃ§u', 'Ilhabela', 7),
(284, 'Praia JuliÃ£o', 'Ilhabela', 7),
(285, 'Praia PerequÃª', 'Ilhabela', 7),
(286, 'Praia Portinho', 'Ilhabela', 7),
(287, 'Praia Saco Capela', 'Ilhabela', 7),
(288, 'Praia Saco do IndaiÃ¡', 'Ilhabela', 7),
(289, 'Praia Saco IndaiÃ¡', 'Ilhabela', 7),
(290, 'Praia Veloso', 'Ilhabela', 7),
(291, 'Reino', 'Ilhabela', 7),
(292, 'S Pedro', 'Ilhabela', 7),
(293, 'Saco da Capela', 'Ilhabela', 7),
(294, 'Saco do IndaiÃ¡', 'Ilhabela', 7),
(295, 'SÃ£o Pedro', 'Ilhabela', 7),
(296, 'ServidÃ£o Anil', 'Ilhabela', 7),
(297, 'SimÃ£o', 'Ilhabela', 7),
(298, 'Siriuba', 'Ilhabela', 7),
(299, 'Siriuba Ii', 'Ilhabela', 7),
(300, 'Sul', 'Ilhabela', 7),
(301, 'TaubatÃ©', 'Ilhabela', 7),
(302, 'Veloso', 'Ilhabela', 7),
(303, 'Viana', 'Ilhabela', 7),
(304, 'Vila Cabarau', 'Ilhabela', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` int(11) DEFAULT NULL,
  `sub_categoria` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `nome_url` varchar(100) DEFAULT NULL,
  `descricao` varchar(1000) DEFAULT NULL,
  `descricao_longa` text,
  `valor` decimal(10,2) DEFAULT NULL,
  `custo` varchar(5) DEFAULT '0',
  `imagem` varchar(100) DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL,
  `tipo_envio` int(11) DEFAULT NULL,
  `palavras` varchar(250) DEFAULT NULL,
  `ativo` varchar(5) DEFAULT NULL,
  `peso` double(8,2) DEFAULT NULL,
  `largura` int(11) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `comprimento` int(11) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `valor_frete` decimal(8,2) DEFAULT NULL,
  `promocao` varchar(5) DEFAULT NULL,
  `vendas` int(11) DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `categoria`, `sub_categoria`, `nome`, `nome_url`, `descricao`, `descricao_longa`, `valor`, `custo`, `imagem`, `estoque`, `tipo_envio`, `palavras`, `ativo`, `peso`, `largura`, `altura`, `comprimento`, `modelo`, `valor_frete`, `promocao`, `vendas`, `link`) VALUES
(42, 2, 22, 'Body com manga de zíper canelado REF-35539', 'body-com-manga-de-ziper-canelado-ref-35539', '#REF-35539\r\nDetalhes:\r\nBory canelado com elastano acompanha bojo, tamanho único\r\n\r\nTAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '35539', '19.99', '0', '1721030521ah9edhgadc.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(43, 2, 22, 'Body Multiformas REF-5730', 'body-multiformas-ref-5730', 'TECIDO: suplex com elastano acompanha bojo, tamanho único\r\nTAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5730', '25.00', '0', '1502300421dgcci2jaeg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(44, 2, 22, 'Body canelado de alça decote v REF-6733', 'body-canelado-de-alca-decote-v-ref-6733', 'Body canelado bojo, tamanho único\r\n\r\nTAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6733', '19.99', '0', '1233150121cech2j2b8h.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(45, 2, 22, 'Body com manga decote V canelado REF-6732', 'body-com-manga-decote-v-canelado-ref-6732', '#REF-6732\r\nDetalhes:\r\nBody canelado acompanha bojo, tamanho único\r\n\r\nTAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6732', '19.99', '0', '1225150121k0if3fhd7g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(46, 2, 22, 'Body canelado manga curta princesa REF-6494', 'body-canelado-manga-curta-princesa-ref-6494', '✅TECIDO: canelado, tamanho único.<br><br>\r\n\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '6494', '19.99', '0', '0745140121i7ich715ai.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(47, 2, 22, 'Body trançado REF-5729', 'body-trancado-ref-5729', '✅ TECIDO: Suplex com elastano acompanha bojo, tamanho único.<br><br>\r\n\r\n\r\n✅TAMANHO ÚNICO M: veste do 36 ao 42 aproximadamente', '5729', '24.99', '0', '1401110121eigh4iceee.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(48, 2, 22, 'Body renda de gola REF-5724', 'body-renda-de-gola-ref-5724', '✅ TECIDO: renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 40 aproximadamente', '5724', '29.99', '0', '1352110121bdj3fg19j6.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(49, 2, 22, 'Body renda chique REF-5719', 'body-renda-chique-ref-5719', '✅ TECIDO: renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5719', '34.99', '0', '1335110121jcaaii0hk5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(50, 2, 22, 'Body regata de zíper canelado REF-5704', 'body-regata-de-ziper-canelado-ref-5704', 'Bory canelado com elastano acompanha bojo, tamanho único<br><br>\r\n\r\nTAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '5704', '19.99', '0', '1300110121cbdahgj74g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(51, 2, 22, 'Body com abertura no ombro e abdômen REF-5679', 'body-com-abertura-no-ombro-e-abdomen-ref-5679', '✅ TECIDO: suplex com elastano,\r\nacompanha bojo\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5679', '21.99', '0', '1204110121hhhd6d0dh5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(52, 2, 22, 'Body reto REF-5632', 'body-reto-ref-5632', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '5632', '19.99', '0', '1029110121bgc4fbi8da.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(53, 2, 22, 'Body gola v com costura na lateral REF-5579', 'body-gola-v-com-costura-na-lateral-ref-5579', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '5579', '19.99', '0', '2127100121ikkbc70e48.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(54, 2, 23, 'Blusa Mickey REF-63623', 'blusa-mickey-ref-63623', '✅ TECIDO: Viscolaicra com aplicação em perolas\r\n<br><br>\r\n✅ TAMANHO: único M\r\nVeste do 38 ao 42', '63623', '19.99', '0', '1843110921f2ccgcbk6j.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(55, 2, 23, 'Blusa canelada manga franzidinha REF-6016', 'blusa-canelada-manga-franzidinha-ref-6016', '✅ Blusa Malha canelada, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6016', '19.99', '0', '1453120121c7ek1gh5if.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(56, 2, 23, 'T-shirt /aplique estampas diversas REF-63619', 't-shirt-/aplique-estampas-diversas-ref-63619', '✅ T-shirt /aplique estampas diversas\r\n( não garantimos a estampa )\r\n*** estampas mudam diariamente\r\n<br><br>\r\n✅ TECIDO: viscolaycra , tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 38 ao 42 aproximadamente', '63619', '19.90', '0', '1807110921a46ke8a3gi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(57, 2, 23, 'Blusa podrinha REF-5992', 'blusa-podrinha-ref-5992', '✅Blusa podrinha, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5992', '19.99', '0', '1020110921hdjgdf23ae.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(58, 2, 23, 'Blusa canelada com bojo REF-6019', 'blusa-canelada-com-bojo-ref-6019', '✅ TECIDO : canelada acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO M : único veste do 36 ao 42 aproximadamente', '6019', '19.99', '0', '1012110921kek0hhc10g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(59, 2, 23, 'Blusa com manga de tule bolinha REF-6668', 'blusa-com-manga-de-tule-bolinha-ref-6668', '\r\n✅ Blusa canelada , tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6668', '19.99', '0', '09481109217ahbc3gbkg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(60, 2, 23, 'Blusa canelada manga princesa REF-6012', 'blusa-canelada-manga-princesa-ref-6012', '✅ TECIDO: canelada, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6012', '19.99', '0', '1841100921ibi5hc8d19.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(61, 2, 23, 'Blusa Viscolaicra manga curta REF-35928', 'blusa-viscolaicra-manga-curta-ref-35928', '✅ TECIDO: Viscolaicra\r\n<br><br>\r\n✅ TAMANHO : P M G GG', '35928', '19.99', '0', '1807100921bbckadijac.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(62, 2, 23, 'Regata crepe gola v REF-6014', 'regata-crepe-gola-v-ref-6014', '✅ TECIDO: crepe\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6014', '19.99', '0', '00480605216ig936afh7.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(63, 2, 23, 'Blusa coração REF-14103', 'blusa-coracao-ref-14103', '✅ TECIDO: Viscolaicra com aplicação em perolas\r\n<br><br>\r\n✅ TAMANHO: único M\r\nVeste do 38 ao 42', '14103', '19.99', '0', '22290505213c7jje7gaa.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(64, 2, 23, 'Camisa linho botões REF-34962', 'camisa-linho-botoes-ref-34962', '✅ TECIDO: Viscolinho\r\n<br><br>\r\n✅TAMANHO : P M G', '34962', '29.99', '0', '1951050521aa5chagk34.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(65, 2, 23, 'Básica viscolycra REF-6130', 'basica-viscolycra-ref-6130', '✅ TECIDO: Viscolaicra\r\n\r\n✅ TAMANHO: P M G GG', '6130', '12.99', '0', '2055120121ebidcbkgaa.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(66, 2, 23, 'Blusa de alça Suede botões e amarração REF-6032', 'blusa-de-alca-suede-botoes-e-amarracao-ref-6032', '✅ TECIDO: Suede\r\n<br><br>\r\n✅TAMANHO : P M G', '6032', '19.99', '0', '161412012107d7g40bdj.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(67, 2, 23, 'Blusa de Suede com manga REF-6027', 'blusa-de-suede-com-manga-ref-6027', 'Tamanho M 36/38/40<br>\r\nTamanho G 42<br>\r\nTamanho GG 44/46', '6027', '19.99', '0', '1609120121j2fha6deee.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(68, 2, 23, 'Blusa com renda viscolycra REF-6024', 'blusa-com-renda-viscolycra-ref-6024', '✅ Blusa viscolycra acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6024', '19.99', '0', '1557120121iei8ccdahf.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(69, 2, 23, 'Blusa de Suede de alça REF-6021', 'blusa-de-suede-de-alca-ref-6021', '✅ TECIDO : Blusa de Suede\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6021', '19.99', '0', '154412012108ee5k88e4.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(70, 2, 23, 'Blusa canelada com botões REF-6017', 'blusa-canelada-com-botoes-ref-6017', '✅ TECIDO : canelada acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6017', '19.99', '0', '1511120121f4i8de097d.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(71, 2, 23, 'Blusa canelada golinha com bojo', 'blusa-canelada-golinha-com-bojo', '✅ Blusa canelada acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente Forma pequena', '6007', '19.99', '0', '1405120121ekhdk5cg6g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(72, 2, 23, 'Blusa ombro a ombro canelada REF-6009', 'blusa-ombro-a-ombro-canelada-ref-6009', '✅ Blusa canelada acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6009', '19.99', '0', '1420120121f1aikdhif0.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(73, 2, 23, 'Blusa com manguinha bolso viscolycra REF-6003', 'blusa-com-manguinha-bolso-viscolycra-ref-6003', '✅ Blusa viscolaycra , tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6003', '19.99', '0', '1326120121dhae4c35ch.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `prod_combos`
--

DROP TABLE IF EXISTS `prod_combos`;
CREATE TABLE IF NOT EXISTS `prod_combos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_combo` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `prod_combos`
--

INSERT INTO `prod_combos` (`id`, `id_produto`, `id_combo`) VALUES
(9, 24, 1),
(10, 25, 1),
(13, 30, 1),
(14, 23, 1),
(15, 30, 3),
(18, 24, 3),
(19, 22, 3),
(20, 32, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocao_banner`
--

DROP TABLE IF EXISTS `promocao_banner`;
CREATE TABLE IF NOT EXISTS `promocao_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL,
  `link` varchar(100) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `ativo` varchar(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `promocao_banner`
--

INSERT INTO `promocao_banner` (`id`, `titulo`, `link`, `imagem`, `ativo`) VALUES
(1, 'Promoção 6 Camisetas', 'http://google.com', 'banner-promo-2.jpg', 'Não'),
(3, 'Segunda Promoção', 'produto-sapato-social', 'banner-promo.jpg', 'Não'),
(4, 'Terceira Promoção', 'http://google.com', 'banner-1.jpg', 'Não'),
(10, 'Quarta Promoção', 'http://google.com', 'img5.jpg', 'Sim'),
(11, 'Quinta Promoção', 'http://google.com', 'img2.jpg', 'Sim');

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
CREATE TABLE IF NOT EXISTS `promocoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `custo` decimal(10,2) DEFAULT NULL,
  `data_inicio` date NOT NULL,
  `data_final` date NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `desconto` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id`, `id_produto`, `valor`, `custo`, `data_inicio`, `data_final`, `ativo`, `desconto`) VALUES
(2, 31, '30.00', '15.00', '2020-08-30', '2021-09-01', 'Sim', ''),
(3, 30, '125.99', '70.00', '2020-08-31', '2021-03-31', 'Sim', '10'),
(4, 29, '35.00', '17.00', '2020-08-24', '2021-09-02', 'Não', ''),
(5, 28, '50.00', '25.00', '2020-08-31', '2021-09-08', 'Sim', ''),
(6, 25, '45.00', '25.00', '2020-09-02', '2021-03-31', 'Sim', '10'),
(7, 24, '0.40', '0.20', '2020-09-02', '2021-09-30', 'Sim', '0'),
(8, 22, '89.91', '10.00', '2020-09-02', '2021-09-04', 'Sim', '10'),
(9, 18, '170.99', '100.00', '2020-09-02', '2021-01-09', 'Sim', '10'),
(10, 23, '134.99', '75.00', '2020-09-09', '2021-03-31', 'Sim', '10'),
(11, 37, '17.91', '10.00', '2020-12-29', '2021-03-31', 'Sim', '10'),
(12, 36, '31.41', '20.90', '2020-12-29', '2021-03-31', 'Sim', '10'),
(13, 35, '17.91', '10.00', '2020-12-29', '2021-03-31', 'Sim', '10'),
(14, 34, '17.91', '10.00', '2020-12-29', '2021-03-31', 'Sim', '10'),
(15, 33, '17.91', '10.00', '2020-12-29', '2021-03-31', 'Sim', '10'),
(16, 38, '17.91', '10.00', '2021-01-01', '2021-04-30', 'Sim', '10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_categorias`
--

DROP TABLE IF EXISTS `sub_categorias`;
CREATE TABLE IF NOT EXISTS `sub_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `nome_url` varchar(50) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sub_categorias`
--

INSERT INTO `sub_categorias` (`id`, `nome`, `nome_url`, `imagem`, `id_categoria`) VALUES
(22, 'Bodys', 'bodys', 'sem-foto.jpg', 2),
(23, 'Blusas', 'blusas', 'sem-foto.jpg', 2),
(25, 'Meninas', 'meninas', 'sem-foto.jpg', 2),
(26, 'Calças', 'calcas', 'sem-foto.jpg', 2),
(27, 'Saías', 'saias', 'sem-foto.jpg', 2),
(28, 'Shorts', 'shorts', 'sem-foto.jpg', 2),
(29, 'Vestidos', 'vestidos', 'sem-foto.jpg', 2),
(30, 'Blusas de inverno', 'blusas-de-inverno', 'sem-foto.jpg', 2),
(31, 'Macacões', 'macacoes', 'sem-foto.jpg', 2),
(32, 'Cropped', 'cropped', 'sem-foto.jpg', 2),
(33, 'Biquíni', 'biquini', 'sem-foto.jpg', 2),
(34, 'Macaquinho', 'macaquinho', 'sem-foto.jpg', 2),
(35, 'Conjuntos', 'conjuntos', 'sem-foto.jpg', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_envios`
--

DROP TABLE IF EXISTS `tipo_envios`;
CREATE TABLE IF NOT EXISTS `tipo_envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_envios`
--

INSERT INTO `tipo_envios` (`id`, `nome`) VALUES
(6, 'Motoboy'),
(7, 'Valor Fixo'),
(8, 'Sem Frete'),
(13, 'Correios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `trafego`
--

DROP TABLE IF EXISTS `trafego`;
CREATE TABLE IF NOT EXISTS `trafego` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `pagina` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `regiao` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `navegador` varchar(255) DEFAULT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `plataforma` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `trafego`
--

INSERT INTO `trafego` (`id`, `data`, `pagina`, `ip`, `cidade`, `regiao`, `pais`, `navegador`, `referencia`, `plataforma`) VALUES
(1, '2015-10-11 10:07:25', 'home', '::1', 'Osasco', 'São Paulo', 'Brasil', 'Chrome', 'Acesso direto ou não identificado', 'Windows 10'),
(2, '2015-11-08 13:07:25', 'services', '::1', 'Carapicuiba', 'São Paulo', 'Brasil', 'Chrome', 'Facebook', 'Android'),
(3, '2015-12-08 17:07:25', 'home', '::1', 'Osasco', 'São Paulo', 'Brasil', 'Chrome', 'Google', 'IOS'),
(4, '2016-01-23 14:07:25', 'home', '::1', 'Desconhecida', 'Desconhecida', 'Desconhecido', 'Chrome', 'Acesso direto ou não identificado', 'Windows 7'),
(5, '2016-02-04 13:07:25', 'home', '::1', 'Desconhecida', 'Desconhecida', 'Desconhecido', 'Chrome', 'Acesso direto ou não identificado', 'Windows 10'),
(6, '2016-02-06 02:07:25', 'home', '::1', 'Carapicuiba', 'São Paulo', 'Brasil', 'Chrome', 'Acesso direto ou não identificado', 'Windows 7'),
(7, '2016-02-07 14:07:25', 'home', '::1', 'Barueri', 'São Paulo', 'Brasil', 'Chrome', 'Acesso direto ou não identificado', 'Windows 10'),
(8, '2016-02-08 17:07:25', 'home', '::1', 'Desconhecida', 'Desconhecida', 'Desconhecido', 'Chrome', 'Acesso direto ou não identificado', 'Windows Phone'),
(9, '2016-02-08 14:07:25', 'home', '::1', 'Desconhecida', 'Desconhecida', 'Desconhecido', 'Chrome', 'Acesso direto ou não identificado', 'Windows Phone'),
(10, '2016-02-09 10:47:09', 'home', '::1', 'Desconhecida', 'Desconhecida', 'Desconhecido', 'Chrome', 'Acesso direto ou não identificado', 'Windows 10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(35) NOT NULL,
  `senha_crip` varchar(150) NOT NULL,
  `nivel` varchar(20) NOT NULL,
  `imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `email`, `senha`, `senha_crip`, `nivel`, `imagem`) VALUES
(1, 'Administrador Willian ', '00000000000', 'williansalesgabriel@hotmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'willianprof.jpg'),
(13, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '', 'd41d8cd98f00b204e9800998ecf8427e', 'Cliente', NULL),
(17, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Cliente', NULL),
(18, 'Rebeca Lorraine Mendes de Oliveira', '50332421805', 'rebecalorraine0204@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Cliente', NULL),
(19, 'Willian Sales Gabriel', '11867569698', 'williansales199619@gmail.com', '123', '202cb962ac59075b964b07152d234b70', 'Cliente', NULL),
(20, 'Marcos de Oliveira', '57424477528', 'marcos@gmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'Cliente', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `sub_total`, `frete`, `total`, `taxas`, `total_custo`, `total_liquido`, `meio_pagamento`, `data_liberacao`, `id_usuario`, `pago`, `data`, `status`, `rastreio`) VALUES
(1, '39.80', '21.00', '60.80', NULL, '20.00', NULL, NULL, NULL, 13, 'Não', '2021-03-05', 'Não Enviado', NULL),
(2, '49.80', '21.00', '70.80', '1.20', '10.00', '0.60', 'Cartão de credito ', '2020-12-24', 17, 'Sim', '2021-03-05', 'Enviado', 'AA987654321BR'),
(3, '19.90', '21.00', '40.90', '5.40', '10.00', '39.50', 'Cartão de credito ', '2020-12-25', 13, 'Sim', '2021-03-05', 'Não Enviado', NULL),
(5, '109.80', '21.00', '130.80', NULL, '50.00', NULL, NULL, NULL, 13, 'Não', '2021-03-05', 'Não Enviado', NULL),
(6, '39.80', '29.40', '69.20', NULL, '20.00', NULL, NULL, NULL, 13, 'Não', '2021-03-01', 'Retirada', ''),
(7, '0.20', '0.00', '0.20', NULL, '0.10', NULL, NULL, NULL, 13, 'Não', '2021-03-03', 'Não Enviado', NULL),
(8, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 13, 'Não', '2021-03-03', 'Não Enviado', NULL),
(9, '29.90', '21.00', '50.90', NULL, '15.00', NULL, NULL, NULL, 13, 'Não', '2021-03-02', 'Não Enviado', NULL),
(10, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 13, 'Não', '2021-03-04', 'Não Enviado', NULL),
(11, '1.00', '0.00', '1.00', '0.44', '0.50', '0.56', 'Cartão de crédito (pagamento em 1x)', '2020-12-25', 13, 'Sim', '2021-03-01', 'Enviado', 'AA987654321BR'),
(12, '299.59', '22.50', '322.09', NULL, '150.00', NULL, NULL, NULL, 20, 'Não', '2021-03-02', 'Não Enviado', NULL),
(13, '2.00', '0.00', '2.00', '0.40', '1.00', '0.60', 'Cartão de credito ', '2021-01-04', 19, 'Sim', '2021-03-09', 'Não Enviado', NULL),
(14, '299.88', '21.00', '320.88', NULL, '150.00', NULL, NULL, NULL, 19, 'Não', '2021-02-09', 'Não Enviado', NULL),
(15, '99.50', '21.00', '120.50', '0.44', '50.00', '0.56', 'Cartão de crédito (pagamento em 1x)', '2020-12-25', 19, 'Sim', '2021-03-02', 'Não Enviado', NULL),
(16, '139.99', '0.00', '139.99', '0.00', '70.00', '0.00', 'Cartão de credito ', '2020-12-23', 19, 'Sim', '2021-03-07', 'Retirada', NULL),
(17, '537.30', '21.00', '558.30', '40.00', '250.00', '420.00', 'Cartão de credito ', '2020-12-22', 19, 'Sim', '2021-03-03', 'Entregue', ''),
(18, '49.90', '0.00', '49.90', '4.90', '25.00', '45.00', 'Cartão de credito ', '2021-01-13', 19, 'Sim', '2021-03-03', 'Retirada', NULL),
(19, '39.80', '21.00', '60.80', NULL, '20.00', NULL, NULL, NULL, 19, 'Não', '2021-03-05', 'Não Enviado', NULL),
(20, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-03-05', 'Não Enviado', NULL),
(21, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-03-03', 'Não Enviado', NULL),
(22, '17.91', '21.00', '38.91', NULL, '15.00', NULL, NULL, NULL, 19, 'Não', '2021-03-02', 'Não Enviado', NULL),
(23, '49.32', '21.00', '70.32', NULL, '25.00', NULL, NULL, NULL, 19, 'Não', '2021-03-02', 'Não Enviado', NULL),
(24, '35.82', '21.00', '56.82', '2.30', '15.00', '54.50', 'Cartão de credito', '2021-01-16', 19, 'Sim', '2021-03-02', 'Não Enviado', NULL),
(25, '289.89', '21.00', '310.89', '15.50', '120.00', '295.00', 'cartão de credito ', '2021-03-10', 19, 'Sim', '2021-03-01', 'Não Enviado', NULL),
(26, '17.91', '21.00', '38.91', '1.94', '10.00', '36.96', 'cartão de credito ', '2021-02-28', 19, 'Sim', '2021-03-01', 'Não Enviado', NULL),
(27, '35.82', '21.00', '56.82', '2.84', '10.00', '53.82', 'cartão de credito ', '2021-02-28', 19, 'Sim', '2021-01-31', 'Não Enviado', NULL),
(28, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 13, 'Não', '2021-02-02', 'Não Enviado', NULL),
(29, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 13, 'Não', '2021-02-02', 'Não Enviado', NULL),
(30, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-02-20', 'Não Enviado', NULL),
(31, '39.80', '21.00', '60.80', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-03-02', 'Não Enviado', NULL),
(32, '27.91', '21.00', '48.91', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-03-08', 'Não Enviado', NULL),
(33, '17.91', '21.00', '38.91', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-03-08', 'Não Enviado', NULL),
(34, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(35, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(36, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(37, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(38, '19.90', '21.00', '40.90', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(39, '17.91', '21.00', '38.91', NULL, '10.00', NULL, NULL, NULL, 19, 'Não', '2021-04-30', 'Não Enviado', NULL),
(40, '19.90', '0.00', '19.90', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-10-29', 'Não Enviado', NULL),
(41, '19.90', '0.00', '19.90', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-10-29', 'Não Enviado', NULL),
(42, '19.90', '0.00', '19.90', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-10-29', 'Não Enviado', NULL),
(43, '19.90', '0.00', '19.90', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-10-29', 'Não Enviado', NULL),
(44, '84.89', '0.00', '84.89', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-10-30', 'Não Enviado', NULL),
(45, '70.00', '0.00', '70.00', NULL, '0.00', NULL, NULL, NULL, 19, 'Não', '2021-11-02', 'Não Enviado', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
