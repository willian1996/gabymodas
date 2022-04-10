-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 07-Nov-2021 às 09:34
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
(2, 'Cor');

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
) ENGINE=InnoDB AUTO_INCREMENT=697 DEFAULT CHARSET=utf8;

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
(301, 83, 'M - veste 36 ao 42', ''),
(302, 84, 'Rosa ', ''),
(303, 84, 'Preta ', ''),
(304, 84, 'Cinza', ''),
(305, 85, '2 anos', ''),
(306, 85, '4 anos ', ''),
(307, 85, '6 anos', ''),
(308, 85, '8 anos ', ''),
(309, 87, '2 anos ', ''),
(310, 87, '4 anos', ''),
(311, 87, '6 anos ', ''),
(312, 87, '8 anos ', ''),
(313, 88, '2 anos ', ''),
(314, 88, '4 anos ', ''),
(315, 88, '6 anos ', ''),
(316, 88, '8 anos ', ''),
(317, 89, 'Rosa Clara ', ''),
(318, 89, 'Branca', ''),
(319, 89, 'Preta ', ''),
(320, 89, 'Azul Bebê', ''),
(321, 90, '2 anos ', ''),
(322, 90, '4 anos ', ''),
(323, 90, '6 anos ', ''),
(324, 90, '8 anos', ''),
(325, 91, 'Rosa Clara ', ''),
(326, 91, 'Verde Água ', ''),
(327, 91, 'Preta', ''),
(328, 91, 'Vermelha', ''),
(329, 92, '2 anos', ''),
(330, 92, '4 anos ', ''),
(331, 92, '6 anos ', ''),
(332, 92, '8 anos', ''),
(333, 93, '2 anos ', ''),
(334, 93, '4 anos ', ''),
(335, 93, '6 anos ', ''),
(336, 93, '8 anos ', ''),
(337, 94, '2 anos ', ''),
(338, 94, '4 anos ', ''),
(339, 94, '6 anos', ''),
(340, 94, '8 anos ', ''),
(341, 95, 'Preta ', ''),
(343, 95, 'Rosa Clara ', ''),
(344, 95, 'Verde Bandeira ', ''),
(345, 95, 'Verde Militar ', ''),
(346, 95, 'Pink', ''),
(348, 96, 'M - veste 38/40', ''),
(349, 96, 'G - veste 42', ''),
(350, 97, 'P - veste 36', ''),
(351, 97, 'M - veste 38/30', ''),
(353, 97, 'G - veste 42', ''),
(354, 97, 'GG - veste 44', ''),
(355, 98, 'Preta ', ''),
(356, 98, 'Rosé', ''),
(357, 98, 'Verde Militar ', ''),
(358, 99, 'P - veste 36', ''),
(359, 99, 'M - veste 38/40', ''),
(360, 99, 'G - veste 42', ''),
(361, 99, 'GG - veste 44/46', ''),
(362, 100, 'Preta ', ''),
(363, 100, 'Verde Militar ', ''),
(364, 100, 'Rosé', ''),
(365, 100, 'Vinho', ''),
(366, 100, 'Caramelo', ''),
(367, 101, 'P - veste 36', ''),
(368, 101, 'M - veste 38', ''),
(369, 101, 'G - veste 40/42', ''),
(370, 101, 'GG - veste 44', ''),
(371, 102, 'Preta ', ''),
(372, 102, 'Beje Crua', ''),
(373, 103, 'P ', ''),
(374, 103, 'M', ''),
(375, 103, 'G', ''),
(376, 103, 'GG', ''),
(377, 105, 'P - veste 38/40', ''),
(378, 105, 'M - veste 40/42', ''),
(379, 105, 'G - 42/44', ''),
(380, 106, 'Xadrez Vermelha ', ''),
(381, 106, 'Xadrez Branca', ''),
(382, 107, 'P - veste 36', ''),
(383, 107, 'M - veste 38/40', ''),
(384, 107, 'G - veste 42', ''),
(385, 107, 'GG - veste 44', ''),
(386, 108, 'Preta ', ''),
(387, 108, 'Rosé', ''),
(388, 108, 'Verde Militar ', ''),
(391, 109, 'P - veste 34/36', ''),
(392, 109, 'M - veste 38/40', ''),
(393, 109, 'G - veste 42', ''),
(394, 109, 'GG - veste 44', ''),
(395, 111, 'P - veste 34/36', ''),
(396, 111, 'M - veste 38', ''),
(397, 111, 'G - veste 40/42', ''),
(398, 111, 'GG - veste 44', ''),
(399, 112, 'Preta ', ''),
(401, 112, 'Cinza Clara ', ''),
(402, 112, 'Cinza Escura ', ''),
(403, 113, 'P - veste 36', ''),
(404, 113, 'M - veste 38/40', ''),
(406, 113, 'G - veste 42', ''),
(407, 113, 'GG - veste 44', ''),
(408, 114, 'Preta ', ''),
(409, 114, 'Vinho', ''),
(410, 114, 'Rosé', ''),
(411, 115, 'P - veste 36', ''),
(412, 115, 'M - veste 38/40', ''),
(416, 115, 'G - veste 42', ''),
(417, 115, 'GG - veste 44', ''),
(418, 116, 'Preta ', ''),
(419, 116, 'Beje Crua', ''),
(420, 116, 'Rosé ', ''),
(421, 117, 'P - veste 36', ''),
(422, 117, 'M - veste 38/40', ''),
(423, 117, 'G - veste 42', ''),
(424, 117, 'GG - veste 44', ''),
(425, 118, 'P - veste 36', ''),
(426, 118, 'M - veste 38/40', ''),
(427, 118, 'G - veste 42', ''),
(428, 119, 'Preta', ''),
(429, 119, 'Rosé', ''),
(430, 119, 'Vinho', ''),
(432, 120, 'M - veste 36/38', ''),
(433, 120, 'G - veste 40/42', ''),
(436, 121, 'Verde Água ', ''),
(437, 121, 'Preta ', ''),
(438, 121, 'Azul Bebê', ''),
(439, 121, 'Rosa Clara', ''),
(440, 121, 'Branca ', ''),
(441, 121, 'Vinho', ''),
(442, 121, 'Verde Militar ', ''),
(443, 122, 'M - veste 38/40', ''),
(444, 122, 'G - veste 42/44', ''),
(445, 123, 'Verde Água ', ''),
(446, 123, 'Preta ', ''),
(447, 123, 'Rosa Clara', ''),
(448, 123, 'Pink ', ''),
(449, 123, 'Vinho', ''),
(450, 124, 'M - veste 38/40', ''),
(451, 124, 'G - veste 42/44', ''),
(452, 125, 'Verde Bandeira ', ''),
(453, 125, 'Rosa Clara ', ''),
(454, 125, 'Amarela ', ''),
(455, 125, 'Onça ', ''),
(456, 125, 'Vermelho Queimado', ''),
(457, 125, 'Preta ', ''),
(458, 125, 'Laranja ', ''),
(459, 125, 'Azul Bebê', ''),
(460, 126, 'M - veste 38/40', ''),
(461, 126, 'G - veste 42/44', ''),
(462, 127, 'Preto', ''),
(463, 127, 'Mostarda ', ''),
(464, 127, 'Vermelha ', ''),
(465, 127, 'Branca ', ''),
(466, 127, 'Vinho ', ''),
(467, 127, 'Rosa Clara', ''),
(468, 128, 'M - veste 36/38', ''),
(469, 128, 'G - veste 40/42', ''),
(470, 129, 'Branca', ''),
(471, 129, 'Vermelha', ''),
(472, 129, 'Preta ', ''),
(473, 129, 'Pink', ''),
(474, 129, 'Rosa Clara ', ''),
(475, 129, 'Vinho', ''),
(476, 129, 'Verde Bandeira', ''),
(477, 129, 'Mostarda ', ''),
(478, 130, 'M - veste 38/40', ''),
(479, 130, 'G - veste 42/44', ''),
(480, 131, 'P - veste 36', ''),
(481, 131, 'M - veste 38/40', ''),
(482, 131, 'G - veste 42', ''),
(483, 133, '34', ''),
(484, 133, '36', ''),
(485, 133, '38', ''),
(486, 133, '40', ''),
(487, 133, '42', ''),
(488, 133, '44', ''),
(489, 134, '34', ''),
(490, 134, '36', ''),
(491, 134, '38', ''),
(492, 134, '40', ''),
(493, 134, '42', ''),
(494, 134, '44', ''),
(495, 135, '34', ''),
(496, 135, '36', ''),
(497, 135, '38', ''),
(498, 135, '40', ''),
(499, 135, '42', ''),
(500, 135, '44', ''),
(501, 136, '34', ''),
(502, 136, '36', ''),
(503, 136, '38', ''),
(504, 136, '40', ''),
(505, 136, '42', ''),
(506, 136, '44', ''),
(507, 137, 'Preto ', ''),
(508, 137, 'Caramelo', ''),
(509, 137, 'Rosé', ''),
(510, 137, 'Verde Militar ', ''),
(511, 138, 'P - veste 36/38', ''),
(512, 138, 'M - veste 40', ''),
(514, 138, 'G - veste 42', ''),
(515, 138, 'GG - veste 44', ''),
(516, 139, 'Preto ', ''),
(517, 139, 'Caramelo', ''),
(519, 139, 'Vermelho Queimado', ''),
(520, 139, 'Rosa Claro  ', ''),
(521, 139, 'Rosa Pink', ''),
(522, 139, 'Azul Marinho', ''),
(523, 140, 'P ', ''),
(524, 140, 'M ', ''),
(525, 140, 'G', ''),
(526, 140, 'GG', ''),
(527, 141, 'Preto ', ''),
(528, 141, 'Azul', ''),
(529, 141, 'Amarelo Mostarda ', ''),
(530, 141, 'Rose', ''),
(531, 141, 'Vinho', ''),
(532, 141, 'Verde Militar ', ''),
(533, 142, 'P - veste 36/38', ''),
(534, 142, 'M - veste 40', ''),
(535, 142, 'G - veste 42', ''),
(536, 142, 'GG -  veste 44/46', ''),
(541, 144, 'P - veste 38', ''),
(542, 144, 'M - veste 40', ''),
(544, 144, 'G - veste 42', ''),
(545, 144, 'GG - veste 44/46', ''),
(546, 145, 'Preto', ''),
(547, 145, 'Vinho', ''),
(548, 145, 'Rosé', ''),
(550, 145, 'Azul', ''),
(551, 146, 'P - veste 34/36', ''),
(552, 146, 'M - veste 38', ''),
(553, 146, 'G - veste 40/42', ''),
(554, 146, 'GG - veste 42/44', ''),
(557, 147, 'Branco com listrinhas preta', ''),
(558, 147, 'Preto com listrinhas brancas', ''),
(559, 147, 'Preto liso sem listra ', ''),
(560, 148, 'P - veste 36/38', ''),
(561, 148, 'M - veste 40', ''),
(562, 148, 'G - veste 42/44', ''),
(563, 148, 'GG - veste 44/46', ''),
(564, 149, 'Preto ', ''),
(565, 149, 'Cinza', ''),
(566, 149, 'Vinho', ''),
(567, 150, 'M - veste do 36 ao 40', ''),
(568, 151, 'Preto', ''),
(569, 151, 'Cinza', ''),
(570, 151, 'Vinho', ''),
(571, 152, 'M veste do 36 ao 40', ''),
(572, 153, 'Preto', ''),
(573, 153, 'Cinza', ''),
(574, 154, 'M - veste do 38 ao 42', ''),
(575, 155, 'Preto', ''),
(576, 155, 'Branco ', ''),
(577, 155, 'Rosa', ''),
(578, 156, 'M - veste do 36 ao 42', ''),
(579, 157, 'Preto ', ''),
(580, 157, 'Vinho', ''),
(581, 157, 'Branco', ''),
(582, 157, 'Rosé', ''),
(583, 158, 'P - veste 36', ''),
(584, 158, 'M - veste 38/40', ''),
(585, 158, 'G - veste 42', ''),
(586, 158, 'GG - veste 44/46', ''),
(587, 159, 'Preto', ''),
(588, 159, 'Rosé', ''),
(589, 159, 'Branco', ''),
(590, 159, 'Vinho', ''),
(591, 160, 'P - veste 36', ''),
(592, 160, 'M - veste 38/40', ''),
(593, 160, 'G - veste 42', ''),
(594, 160, 'GG - veste 44/46', ''),
(595, 161, 'Preto', ''),
(596, 161, 'Vinho', ''),
(597, 161, 'Rosé', ''),
(598, 162, 'M - veste 34/36', ''),
(599, 162, 'G - veste 38/40/42', ''),
(600, 163, 'Preto', ''),
(601, 163, 'Rosé', ''),
(602, 163, 'Vinho', ''),
(603, 164, 'M - veste 34/36', ''),
(604, 164, 'G - veste 38/40/42', ''),
(605, 165, 'Preto ', ''),
(606, 165, 'Onça', ''),
(607, 165, 'Rosa Pink', ''),
(608, 165, 'Verde Água ', ''),
(609, 165, 'Branco ', ''),
(610, 165, 'Listrado ', ''),
(611, 165, 'Roxo ', ''),
(612, 165, 'Amarelo ', ''),
(613, 166, 'M - veste do 36 ao 40', ''),
(614, 167, 'Preto ', ''),
(615, 167, 'Branco ', ''),
(616, 168, 'M - veste do 38 ao 42', ''),
(617, 169, 'Preto ', ''),
(618, 169, 'Onça', ''),
(619, 169, 'Rosa Chiclete', ''),
(620, 169, 'Branco', ''),
(621, 169, 'Listrado', ''),
(622, 169, 'Roxo', ''),
(623, 169, 'Verde Água', ''),
(624, 170, 'M - veste do 36 ao 40', ''),
(625, 171, 'Preto', ''),
(626, 171, 'Roxo', ''),
(627, 171, 'Branco', ''),
(628, 171, 'Rosa Chiclete', ''),
(629, 172, 'M - veste do 36 ao 40', ''),
(630, 173, 'Preto', ''),
(631, 173, 'Vermelho', ''),
(632, 173, 'Vinho', ''),
(633, 173, 'Branco', ''),
(634, 173, 'Rosa Claro', ''),
(635, 174, 'M - veste 36/38', ''),
(636, 174, 'G - veste 40/42', ''),
(637, 175, 'Preto', ''),
(638, 175, 'Listrado', ''),
(639, 175, 'Vermelho', ''),
(640, 175, 'Branco', ''),
(641, 175, 'Onça', ''),
(642, 175, 'Amarelo', ''),
(643, 175, 'Verde Água', ''),
(644, 176, 'M - veste do 36 ao 42', ''),
(645, 177, 'Listrado', ''),
(646, 177, 'Onça', ''),
(647, 177, 'Rosa Pink', ''),
(648, 177, 'Verde Água ', ''),
(649, 177, 'Preto', ''),
(650, 177, 'Branco', ''),
(651, 177, 'Amarelo', ''),
(652, 177, 'Vermelho', ''),
(653, 178, 'M - veste do 36 ao 40', ''),
(654, 180, 'Preto ', ''),
(655, 180, 'Branco', ''),
(656, 181, 'P - veste 36', ''),
(657, 181, 'M - veste 38/40', ''),
(658, 181, 'G - veste 42', ''),
(659, 181, 'GG - veste 44/46', ''),
(660, 182, 'Preto', ''),
(661, 182, 'Branco', ''),
(662, 182, 'Rosé', ''),
(663, 183, 'M - veste do 36 ao 40', ''),
(664, 184, 'Preta ', ''),
(665, 184, 'Branca', ''),
(666, 184, 'Pink', ''),
(667, 185, 'M - veste do 36 ao 42', ''),
(668, 186, 'Preta ', ''),
(669, 186, 'Branca', ''),
(670, 187, 'M - veste do 38 ao 44 ', ''),
(671, 188, 'Preto', ''),
(672, 188, 'Vinho', ''),
(673, 188, 'Laranja', ''),
(674, 188, 'Branco', ''),
(675, 188, 'Rosa Neom', ''),
(676, 188, 'Verde Neon', ''),
(677, 189, 'M - veste do 36 ao 42', ''),
(678, 190, 'Preto', ''),
(679, 190, 'Vinho', ''),
(680, 190, 'Rosé', ''),
(681, 191, 'M - veste 34/36', ''),
(682, 191, 'G - veste 38/40/42', ''),
(683, 192, 'Preta', ''),
(684, 192, 'Vinho', ''),
(686, 192, 'Rosé', ''),
(687, 193, 'M - veste 34/36', ''),
(688, 193, 'G - veste 38/40/42', ''),
(689, 194, 'Preto', ''),
(690, 194, 'Branco', ''),
(691, 194, 'Vermelho', ''),
(692, 194, 'Azul Royal', ''),
(693, 195, 'P - veste 34/36', ''),
(694, 195, 'M - veste 38', ''),
(695, 195, 'G - veste 40/42', ''),
(696, 195, 'GG - veste 42/44', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;

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
(284, 617, 2, 'Preto'),
(285, 618, 2, 'Rosé'),
(286, 618, 1, 'M - veste 36 ao 42'),
(287, 619, 2, 'Preta '),
(288, 619, 1, 'M - veste 36 ao 40'),
(289, 620, 1, '2 anos '),
(290, 621, 2, 'Preta '),
(291, 621, 1, 'M - veste 36 ao 42'),
(292, 623, 2, 'Preto'),
(293, 624, 2, 'Rosa Clara '),
(294, 624, 1, '2 anos'),
(295, 625, 2, 'Preto'),
(296, 626, 2, 'Preto'),
(297, 627, 2, 'Preta'),
(298, 628, 2, 'Rosa Clara '),
(299, 628, 1, '2 anos '),
(300, 629, 2, 'Preto'),
(301, 630, 2, 'Preto'),
(303, 632, 2, 'Verde Militar');

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
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

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
(83, 1, 73),
(84, 2, 74),
(85, 1, 74),
(87, 1, 75),
(88, 1, 76),
(89, 2, 77),
(90, 1, 77),
(91, 2, 78),
(92, 1, 78),
(93, 1, 80),
(94, 1, 79),
(95, 2, 81),
(96, 1, 81),
(97, 1, 83),
(98, 2, 84),
(99, 1, 84),
(100, 2, 85),
(101, 1, 85),
(102, 2, 86),
(103, 1, 86),
(105, 1, 87),
(106, 2, 88),
(107, 1, 88),
(108, 2, 89),
(109, 1, 89),
(111, 1, 90),
(112, 2, 91),
(113, 1, 91),
(114, 2, 92),
(115, 1, 92),
(116, 2, 93),
(117, 1, 93),
(118, 1, 94),
(119, 2, 95),
(120, 1, 95),
(121, 2, 97),
(122, 1, 97),
(123, 2, 98),
(124, 1, 98),
(125, 2, 99),
(126, 1, 99),
(127, 2, 100),
(128, 1, 100),
(129, 2, 101),
(130, 1, 101),
(131, 1, 102),
(133, 1, 103),
(134, 1, 104),
(135, 1, 105),
(136, 1, 106),
(137, 2, 108),
(138, 1, 108),
(139, 2, 109),
(140, 1, 109),
(141, 2, 110),
(142, 1, 110),
(144, 1, 111),
(145, 2, 112),
(146, 1, 112),
(147, 2, 113),
(148, 1, 113),
(149, 2, 114),
(150, 1, 114),
(151, 2, 115),
(152, 1, 115),
(153, 2, 116),
(154, 1, 116),
(155, 2, 118),
(156, 1, 118),
(157, 2, 119),
(158, 1, 119),
(159, 2, 120),
(160, 1, 120),
(161, 2, 121),
(162, 1, 121),
(163, 2, 122),
(164, 1, 122),
(165, 2, 123),
(166, 1, 123),
(167, 2, 124),
(168, 1, 124),
(169, 2, 125),
(170, 1, 125),
(171, 2, 126),
(172, 1, 126),
(173, 2, 127),
(174, 1, 127),
(175, 2, 128),
(176, 1, 128),
(177, 2, 129),
(178, 1, 129),
(180, 2, 130),
(181, 1, 130),
(182, 2, 131),
(183, 1, 131),
(184, 2, 132),
(185, 1, 132),
(186, 2, 133),
(187, 1, 133),
(188, 2, 134),
(189, 1, 134),
(190, 2, 135),
(191, 1, 135),
(192, 2, 136),
(193, 1, 136),
(194, 2, 137),
(195, 1, 137);

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
) ENGINE=InnoDB AUTO_INCREMENT=633 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id`, `id_usuario`, `id_produto`, `quantidade`, `id_venda`, `data`, `combo`) VALUES
(626, 19, 53, 1, 50, '2021-11-06', 'Não'),
(627, 19, 54, 1, 50, '2021-11-06', 'Não'),
(628, 19, 77, 1, 50, '2021-11-06', 'Não'),
(629, 19, 53, 1, 51, '2021-11-06', 'Não'),
(630, 19, 53, 1, 0, '2021-11-06', 'Não'),
(632, 19, 54, 1, 0, '2021-11-06', 'Não');

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
(7, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', 'Perto do Hortifruti JC', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 5, '2020-12-09 00:00:00'),
(8, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, '2020-12-07 00:00:00'),
(9, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', 'Perto do Hortifruti JC', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 5, '2020-12-04 00:00:00'),
(11, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:52:33'),
(12, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:53:04'),
(13, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', 'Perto do Hortifruti JC', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 6, '2020-12-06 02:54:16'),
(14, 'Rebeca Lorraine Mendes de Oliveira', '50332421805', 'rebecalorraine0204@gmail.com', '12996278049', 'Rua Cleusa Fatima dos Santos ', '30', 'Perto do Hortifruti JC', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', NULL, '2020-12-09 15:45:42'),
(15, 'Willian Sales Gabriel', '11867569698', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', 'Perto do Hortifruti JC', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', 4, '2020-12-09 20:32:10'),
(16, 'Marcos de Oliveira', '57424477528', 'marcos@gmail.com', '12996546658', 'Rua Cleusa Fatima dos Santos ', '30', 'Perto do Hortifruti JC', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', 1, '2020-12-18 01:09:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=utf8;

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
(121, 73, '1326120121ic1dj2kkh2.jpg'),
(122, 78, '08291309211hff60ei5g.jpg'),
(123, 78, '0829130921c08aaccd6e.jpg'),
(124, 80, '20481209214ia4i5000b.jpg'),
(125, 80, '2048120921k0a3fckj7d.jpg'),
(126, 80, '2048120921g4b8efhbe6.jpg'),
(127, 84, '1202050621kehj4kfj0i.jpg'),
(128, 85, '1653050521kkdf0ii9fc.jpg'),
(129, 88, '1158300421bf1gb312he.jpg'),
(130, 88, '1158300421gga6fe70ae (1).jpg'),
(132, 81, '1753260221kdbdge0462.jpg'),
(133, 81, '143926092190c10ha287 (1).jpg'),
(134, 85, '165405052108jegcddkh (1).jpg'),
(135, 85, '0919300421k8jg0a3ga2.jpg'),
(136, 85, '0919300421ajcd047gde.jpg'),
(137, 85, '0919300421ikh6ggj1ec.jpg'),
(138, 85, '0919300421ghc2a6ggdb.jpg'),
(139, 89, '1524130121icchc5ha03.jpg'),
(140, 89, '1524130121ieaigd5cd4.jpg'),
(141, 89, '1524130121ih3idcj2he.jpg'),
(142, 89, '1524130121ed70gekj6c.jpg'),
(143, 90, '1353130121jcijggfagk.jpg'),
(144, 90, '1353130121geafac98k1.jpg'),
(145, 91, '1303130121ce0k34ka79.jpg'),
(146, 91, '13031301214ak9ijj7ea.jpg'),
(147, 91, '1303130121jgdkg282gc.jpg'),
(148, 92, '124513012195a1fa6icg.jpg'),
(149, 92, '12451301219370af8g5a.jpg'),
(150, 92, '0926300421ag6fjf2f3i.jpg'),
(151, 92, '1515100921igf7ff2fd1.png'),
(152, 93, '1208130121i0c7jee6j3.jpg'),
(153, 93, '1208130121787jgejg3e.jpg'),
(154, 93, '1208130121ek1cjgjh4f.jpg'),
(155, 94, '10481301216aiba6g90e.jpg'),
(156, 94, '1048130121hdahjkg21c.jpg'),
(157, 94, '1048130121ek248cj4cb.jpg'),
(158, 94, '1048130121ag8akagj2h.jpg'),
(159, 96, '0954130921g6kcjec5ee.jpg'),
(160, 96, '0954130921502hhjk6ek.jpg'),
(161, 97, '2126120921f1hei3keh6.jpg'),
(162, 97, '2126120921b3jkgc4kke.jpg'),
(163, 97, '2126120921j0gf6f3k24.jpg'),
(164, 97, '2126120921gkbha0bd9i.jpg'),
(165, 97, '2126120921k1ibh168k5.jpg'),
(166, 97, '2126120921adhgk4di68.jpg'),
(167, 98, '2112120921a5d0dk8adk.jpg'),
(168, 98, '2112120921heca5hkg7g.jpg'),
(169, 98, '2112120921bhj68f3e5b.jpg'),
(170, 98, '2112120921i4da84dj8h (1).jpg'),
(171, 100, '124205052147ekhdkekg.jpg'),
(172, 100, '1242050521ik05gd9gff.jpg'),
(173, 100, '1242050521g5hdcedb9h.jpg'),
(174, 100, '1242050521cjjgf225da.jpg'),
(175, 100, '1242050521i1ggibfd4b.jpg'),
(176, 100, '12420505218h5bff3ci6.jpg'),
(177, 99, '11102301219id9bigge6.jpg'),
(178, 99, '11102301214fe1k1khce.jpg'),
(179, 99, '1110230121kc6ehfdkbc.jpg'),
(180, 99, '20561209214g461hf2da.jpg'),
(181, 95, '1747150121bac1b3jhd0.jpg'),
(182, 95, '1747150121e4chjhejfg.jpg'),
(183, 101, '2207120121d9hdhjffhg.jpg'),
(184, 101, '2207120121bhicccggcc.jpg'),
(185, 101, '2207120121i2h5681h4k.jpg'),
(186, 101, '2207120121cdfkaejjic.jpg'),
(187, 102, '2241120121ha4d9afg53.jpg'),
(188, 102, '2241120121jbg2ej72ef.jpg'),
(189, 102, '2241120121g9h0if7b76 (1).jpg'),
(190, 106, '18221501214deig1iaha.jpg'),
(192, 106, '1822150121ce09g8df0e.jpg'),
(193, 107, '09092409211bccajbh2a.jpg'),
(194, 107, '1224130921dabb9795fc.jpg'),
(195, 109, '1403150121ckafbe8ed0.jpg'),
(196, 109, '0001130121ic2kc7k9eb.jpg'),
(197, 110, '2352120121dkce02beg8.jpg'),
(198, 110, '2352120121k55f0i8ikj.jpg'),
(199, 110, '2352120121hj1jckcaac.jpg'),
(200, 111, '2347120121k5d4cck7g5.jpg'),
(201, 111, '2347120121haghahjdi5.jpg'),
(202, 111, '2347120121hgfigajbhb.jpg'),
(204, 115, '2128120121g2eei4a56d.jpg'),
(205, 115, '2128120121gkbf16edei (1).jpg'),
(206, 115, '21281201212eef48ad87.jpg'),
(207, 115, '2128120121f5j77hfafc.jpg'),
(208, 115, '2128120121kkf98e1i0f.jpg'),
(209, 115, '2128120121ja1k2g9ff1.jpg'),
(210, 115, '21281201214acefjjca7.jpg'),
(212, 115, '21281201210ifageaa0k.jpg'),
(213, 114, '1754020521ace5ekeicc.jpg'),
(214, 114, '2118120121ebehff3edb.jpg'),
(215, 116, '2110120121edghjkbd4i.jpg'),
(216, 116, '21101201217g6bkdffih.jpg'),
(217, 116, '2110120121kedgg70i0e.jpg'),
(218, 117, '2108120121803ic96c2e.jpg'),
(219, 117, '2108120121kdd5k6kae3.jpg'),
(220, 117, '2108120121k3180k1idj.png'),
(221, 119, '0846160121ga21gf6c6a.jpg'),
(222, 119, '0846160121ci62a7diei.jpg'),
(223, 119, '0846160121fi4ibhjeka.jpg'),
(224, 119, '0846160121ccehfb6ebf.jpg'),
(225, 120, '1252130121jh5ag4jaf3.jpg'),
(226, 120, '12521301217kkhd5i32j.jpg'),
(227, 120, '1252130121f2hik23kea.jpg'),
(228, 120, '1252130121jj1k1ea6i4.jpg'),
(229, 121, '0735060521bg3ja7k82f.jpg'),
(230, 121, '0736060521idj4eh2cfk.png'),
(231, 121, '1537130121hk0k64jkcd.jpg'),
(232, 122, '15321301219e7bkegdg7.jpg'),
(233, 122, '153213012126i5afkjgh.jpg'),
(234, 124, '1959110921fhkbiegjf9.jpg'),
(235, 124, '19591109215a1hiedibi.jpg'),
(236, 125, '1436110921gcg8hhgf5d.jpg'),
(237, 125, '1436110921h93bc6ifce.jpg'),
(238, 125, '14361109214cfiedifaa.jpg'),
(239, 126, '1428110921gkf4a0kfai.jpg'),
(240, 126, '1428110921d8kj4dif3k.jpg'),
(241, 126, '1428110921acdi7b0288.jpg'),
(242, 126, '1428110921h3jgjbhf2h.jpg'),
(243, 126, '1428110921kicdhak7ce.jpg'),
(245, 126, '1428110921babe4fae07.jpg'),
(246, 126, '1428110921ag383bk34a.jpg'),
(247, 127, '1830110121dkd5f60chi.jpg'),
(248, 127, '1830110121bbd3d0aghe.jpg'),
(249, 127, '1830110121c3jk1ik0gc.jpg'),
(250, 128, '1809110121h3a6ge8igg.jpg'),
(251, 128, '1412150121cc1aicfdfi.jpg'),
(252, 128, '1809110121hjfjgg2hk3 (1).jpg'),
(253, 129, '1742110121c5k1h6cffk.jpg'),
(254, 129, '17421101211dkigecicg.jpg'),
(255, 129, '174211012116e8hbfhkj.jpg'),
(256, 129, '1742110121f6c1dedjeb.jpg'),
(257, 129, '1742110121jdjgiaad7a.jpg'),
(258, 130, '15541101215e54282dhg.jpg'),
(259, 130, '1554110121e7hkkgdcjj.jpg'),
(260, 130, '1554110121hegi7ajbjf.jpg'),
(261, 130, '1554110121j4297f0c85.png'),
(262, 131, '1427110121gcg3efic3h.jpg'),
(263, 131, '1427110121b6ddfe4106.jpg'),
(264, 131, '14271101212h9kdfbebi.jpg'),
(265, 131, '1427110121j83c0ehebc.jpg'),
(266, 131, '1427110121baj1e5b75g.jpg'),
(268, 135, '23130505210c2akdi8kf.jpg'),
(269, 135, '23130505214deki5i8bk (1).jpg'),
(270, 135, '1219130121ifhcijje64.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

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
(39, 25, 'Parabéns, você ganhou um novo cupom de desconto no valor de 20 reais, poderá usar até o dia 23/01/2021 o seu código para uso do cupom é 11867569698', 'Admin', '2021-01-16', '01:52:54'),
(40, 45, 'Mudança de status no pedido, pedido ', 'Admin', '2021-11-06', '09:28:44'),
(41, 45, 'Mudança de status no pedido, pedido ', 'Admin', '2021-11-06', '09:29:03'),
(42, 44, 'Mudança de status no pedido, pedido ', 'Admin', '2021-11-06', '09:34:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

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
(53, 2, 22, 'Body gola v com costura na lateral REF-5579', 'body-gola-v-com-costura-na-lateral-ref-5579', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '5579', '19.99', '0', '2127100121ikkbc70e48.jpg', 998, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 2, ''),
(54, 2, 23, 'Blusa Mickey REF-63623', 'blusa-mickey-ref-63623', '✅ TECIDO: Viscolaicra com aplicação em perolas\r\n<br><br>\r\n✅ TAMANHO: único M\r\nVeste do 38 ao 42', '63623', '19.99', '0', '1843110921f2ccgcbk6j.jpg', 999, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 1, ''),
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
(73, 2, 23, 'Blusa com manguinha bolso viscolycra REF-6003', 'blusa-com-manguinha-bolso-viscolycra-ref-6003', '✅ Blusa viscolaycra , tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6003', '19.99', '0', '1326120121dhae4c35ch.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(74, 2, 25, 'T-shirt infantil pedraria REF-63784', 't-shirt-infantil-pedraria-ref-63784', '✅ TECIDO: Viscolaicra\r\n***não garantimos a estampa do desenho\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63784', '18.00', '0', '1157130921e4ekk34kgi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(75, 2, 25, 'Jardineira suplex infantil REF-63782', 'jardineira-suplex-infantil-ref-63782', '✅ TECIDO: suplex /estampas diversas\r\nEla é aberta nas costas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n', '63782', '19.99', '0', '1143130921a4df8hggga.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(76, 2, 25, 'Vestido sorvete REF-63781', 'vestido-sorvete-ref-63781', '✅ TECIDO: Ribana canelado\r\n* não acompanha acessórios\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63781', '19.99', '0', '1135130921c9feie0did.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(77, 2, 25, 'Blusa Infantil Corrente REF-63780', 'blusa-infantil-corrente-ref-63780', '\r\n✅ TECIDO: Ribana canelada\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63780', '19.99', '0', '1129130921gb62c5dhfj.jpg', 999, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 1, ''),
(78, 2, 25, 'Blusa infantil manga tele bolinha REF-63763', 'blusa-infantil-manga-tele-bolinha-ref-63763', '✅ TECIDO: canelada e tule\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63763', '18.00', '0', '0829130921c08aaccd6e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(79, 2, 25, 'Macacão infantil viscose REF-63726', 'macacao-infantil-viscose-ref-63726', '✅ TECIDO: viscose/estampas diversas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n<br><br>\r\n✅ TAMANHO: 2/4/6/8', '63726', '24.99', '0', '2050120921cid7igcdak.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(80, 2, 25, 'Vestido infantil viscose alcinha REF-63725', 'vestido-infantil-viscose-alcinha-ref-63725', '✅ TECIDO: viscose/estampas diversas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n<br><br>\r\n✅ TAMANHO: 2/4/6/8', '63725', '18.00', '0', '20481209214ia4i5000b.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(81, 2, 26, 'Calça pantalona REF-66212', 'calca-pantalona-ref-66212', '✅ TECIDO: viscose\r\n<br><br>\r\n✅ TAMANHO: M / G', '66212', '39.99', '0', '1753260221kdbdge0462.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(82, 2, 26, 'Calça bandagem Preta REF-63733', 'calca-bandagem-preta-ref-63733', '✅ TECIDO: Bandagem\r\n<br><br>\r\n✅TAMANHO: P M G GG', '63733', '49.00', '0', '21351209215cjj5k8kf5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(83, 2, 26, 'Calça camuflada REF-6262', 'calca-camuflada-ref-6262', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6262', '39.99', '0', '0759100921cde275g48e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(84, 2, 26, 'Calça jogger com elastico REF-6284', 'calca-jogger-com-elastico-ref-6284', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6284', '35.00', '0', '1207050621d9dbjkd542.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(85, 2, 26, 'Calça bengaline cinto REF-14096', 'calca-bengaline-cinto-ref-14096', '✅ TECIDO : Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '14096', '39.99', '0', '165405052108jegcddkh.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(86, 2, 26, 'Calça de linho frizada com amarração REF-35740', 'calca-de-linho-frizada-com-amarracao-ref-35740', 'Tecido viscolinho<br>\r\nTamanho M 38/40<br>\r\nTamanho G 42/44<br>', '35740', '49.99', '0', '0820220921eid2afkkea.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(87, 2, 26, 'Calça fivela redonda xadrez REF-35037', 'calca-fivela-redonda-xadrez-ref-35037', '✅ TECIDO: jacar\r\n<br><br>\r\n✅ TAMANHO: P M G GG Forma grande', '35037', '39.99', '0', '2037300421dac538iaf8.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(88, 2, 26, 'Calça bengaline Xadrez REF-34961', 'calca-bengaline-xadrez-ref-34961', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '34961', '39.99', '0', '1158300421ha0gh6c3ch.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(89, 2, 26, 'Calça army bengaline REF-6318', 'calca-army-bengaline-ref-6318', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6318', '39.99', '0', '1524130121g6024cefbk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(90, 2, 26, 'Calça legging preta REF-6306', 'calca-legging-preta-ref-6306', '✅ TECIDO : Calça de suplex\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6306', '19.99', '0', '1353130121jcijggfagk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(91, 2, 26, 'Calça ribana com listra na lateral REF-6295', 'calca-ribana-com-listra-na-lateral-ref-6295', '✅ TECIDO: Ribana Canelada\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6295', '35.00', '0', '1303130121jgdkg282gc.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(92, 2, 26, 'Calça bengaline frizada com amarração REF-6287', 'calca-bengaline-frizada-com-amarracao-ref-6287', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6287', '39.00', '0', '124513012195a1fa6icg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(93, 2, 26, 'Calça de linho REF-6268', 'calca-de-linho-ref-6268', '✅ TECIDO: Linho\r\n\r\n✅ TAMANHO: P M G GG\r\n<br><br>', '6268', '39.99', '0', '1208130121i0c7jee6j3.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(94, 2, 26, 'Calça com botões e abertura lateral REF-6239', 'calca-com-botoes-e-abertura-lateral-ref-6239', '✅ TECIDO: viscose\r\n<br><br>\r\n✅ TAMANHO: P M G', '6239', '39.99', '0', '1048130121hdahjkg21c.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(95, 2, 27, 'Saia bengaline curta com duas fendas nas laterais REF-6814', 'saia-bengaline-curta-com-duas-fendas-nas-laterais-ref-6814', '✅ TECIDO: Malha canelada\r\n<br><br>\r\n✅ TAMANHO : M /G', '6814', '25.00', '0', '1452260921f3c1k7jhhd.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(96, 2, 27, 'Saia bengaline fivela/duas fendas REF-63769', 'saia-bengaline-fivela/duas-fendas-ref-63769', '\r\n✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO : M /G', '63769', '29.99', '0', '0954130921502hhjk6ek.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(97, 2, 27, 'Saia godê longa estampada REF-63732', 'saia-gode-longa-estampada-ref-63732', '✅ TAMANHO : M / G', '63732', '59.00', '0', '2126120921f1hei3keh6.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(98, 2, 27, 'Saia godê longa lisa REF-63729', 'saia-gode-longa-lisa-ref-63729', '✅ TAMANHO : M / G', '63729', '49.00', '0', '2112120921i4da84dj8h.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(99, 2, 27, 'Saia longa REF-8270', 'saia-longa-ref-8270', '✅ TECIDO: Linho\r\n<br><br>\r\n✅ TAMANHO : M /G', '8270', '49.00', '0', '2058120921gcag889hid.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(100, 2, 27, 'Short saia bengaline botões lateral REF-35735', 'short-saia-bengaline-botoes-lateral-ref-35735', '✅ Tecido bengaline forma pequena<br>\r\n✅Tamanho M 36/38<br>\r\n✅Tamanho G 40/42<br>', '35735', '25.00', '0', '1242050521i1ggibfd4b.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(101, 2, 27, 'Saia godê REF-6157', 'saia-gode-ref-6157', '✅ TAMANHO : M / G', '6157', '35.00', '0', '2207120121d9hdhjffhg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(102, 2, 28, 'Short com abertura na lateral REF-6179', 'short-com-abertura-na-lateral-ref-6179', '✅ TECIDO: Viscose\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6179', '25.00', '0', '2241120121g9h0if7b76.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(103, 2, 28, 'Short jeans REF-65796', 'short-jeans-ref-65796', '✅ TECIDO : jeans, sem lycra\r\n<br><br>\r\n✅ TAMANHO: 34/36/38/40/42/44', '65796', '34.99', '0', '09112409219ji2hie53d.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(104, 2, 28, 'Short jeans REF-35312', 'short-jeans-ref-35312', '✅ TECIDO : jeans, sem lycra\r\n<br><br>\r\n✅ TAMANHO: 34/36/38/40/42/44', '35312', '34.99', '0', '1711020521cadjddkddf.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(105, 2, 28, 'Short jeans Preto REF-6835', 'short-jeans-preto-ref-6835', '✅ TECIDO : jeans, sem lycra\r\n<br><br>\r\n✅ TAMANHO: 34/36/38/40/42/44', '6835', '34.99', '0', '182815012119f9c1jk8k.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(106, 2, 28, 'Short jeans REF-6828', 'short-jeans-ref-6828', '✅ TECIDO : jeans, sem lycra\r\n<br><br>\r\n✅ TAMANHO: 34/36/38/40/42/44', '6828', '34.99', '0', '1822150121ce09g8df0e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(107, 2, 28, 'Short bengaline fivela Redonda REF-6683', 'short-bengaline-fivela-redonda-ref-6683', '✅ TECIDO : Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6683', '19.99', '0', '1224130921dabb9795fc.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(108, 2, 28, 'Short bengaline com barbante REF-6231', 'short-bengaline-com-barbante-ref-6231', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6231', '19.99', '0', '10121301213gcabje4ie.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(109, 2, 28, 'Short bengaline com fivela REF-6201', 'short-bengaline-com-fivela-ref-6201', 'Tecido bengaline<br>\r\nTamanho P 34/36<br>\r\nTamanho M 38/40<br>\r\nTamanho G 42<br>\r\nTamanho GG 44/46<br>', '6201', '19.99', '0', '0001130121ic2kc7k9eb.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(110, 2, 28, 'Short canelado REF-6197', 'short-canelado-ref-6197', '✅ TECIDO: Canelado\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6197', '19.99', '0', '2352120121dkce02beg8.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(111, 2, 28, 'Short florido REF-6196', 'short-florido-ref-6196', '✅ TECIDO: viscose, estampas mudam diariamente\r\n***NÃO GARANTIMOS ESTAMPAS\r\n<br><br>\r\n✅ TAMANHO: P M G GG Forma grande', '6196', '19.99', '0', '2347120121k5d4cck7g5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(112, 2, 28, 'Short de veludo REF-6193', 'short-de-veludo-ref-6193', '✅ TECIDO: Veludo\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6193', '19.99', '0', '2340120121jkk4hb7id0.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(113, 2, 28, 'Short listrado colmeia com amarração REF-6188', 'short-listrado-colmeia-com-amarracao-ref-6188', '✅ TECIDO: jacar / comeia texturizado\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6188', '19.99', '0', '23201201216f9ekhg207.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(114, 2, 29, 'Vestido canelado de gola curto REF-6141', 'vestido-canelado-de-gola-curto-ref-6141', '✅ TECIDO: Malha canelada\r\n<br><br>\r\n✅ TAMANHO ÚNICO : M veste do 36 ao 40 forma pequena', '6141', '19.99', '0', '1621050521j6efkfifdf.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(115, 2, 29, 'Vestido curto canelado alça REF-6154', 'vestido-curto-canelado-alca-ref-6154', '✅ TECIDO: Malha canelada\r\n<br><br>\r\n✅ TAMANHO ÚNICO : M veste do 36 ao 40 forma pequena', '6154', '19.99', '0', '2128120121gkbf16edei.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(116, 2, 29, 'Vestido longo canelado costas nua REF-6137', 'vestido-longo-canelado-costas-nua-ref-6137', '✅ TECIDO: Malha canelada\r\n<br><br>\r\n✅ TAMANHO ÚNICO : M veste do 38 ao 42', '6137', '35.00', '0', '2110120121edghjkbd4i.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(117, 2, 29, 'Vestido longo com manga canelado com listra na lateral REF-6134', 'vestido-longo-com-manga-canelado-com-listra-na-lateral-ref-6134', '✅ TECIDO: Malha canelada\r\n<br><br>\r\n✅ TAMANHO ÚNICO : M veste do 38 ao 42', '6134', '35.00', '0', '2108120121803ic96c2e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(118, 2, 30, 'Corta vento REF-35301', 'corta-vento-ref-35301', '✅ TECIDO: tactel\r\n<br><br>\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '35301', '25.00', '0', '1711050521fafici5kgk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(119, 2, 30, 'Blazer longo neopreme REF-7045', 'blazer-longo-neopreme-ref-7045', '✅ TECIDO: Neopreme\r\n<br><br>\r\n✅ TAMANHO: P M G', '7045', '39.00', '0', '0846160121ga21gf6c6a.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(120, 2, 30, 'Blazer neoprene curto REF-6289', 'blazer-neoprene-curto-ref-6289', '✅ TECIDO: Neopreme\r\n<br><br>\r\n✅ TAMANHO : P M G GG', '6289', '35.00', '0', '1252130121jh5ag4jaf3.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(121, 2, 31, 'Macacão longo jardineira REF-6321', 'macacao-longo-jardineira-ref-6321', 'Jardineira tecido bengaline<br>\r\nForma pequena<br>\r\nTamanho m 36/38<br>\r\nTamanho G 40/42', '6321', '49.00', '0', '0736060521idj4eh2cfk.png', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(122, 2, 31, 'Macacão longo jogue bengaline REF-6320', 'macacao-longo-jogue-bengaline-ref-6320', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: M / G', '6320', '49.00', '0', '15321301219e7bkegdg7.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(123, 2, 32, 'Cropped de suplex REF-5843', 'cropped-de-suplex-ref-5843', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '5843', '19.99', '0', '1752110121ikhehcd6c31.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(124, 2, 32, 'Cropped Renda ilhos REF-63629', 'cropped-renda-ilhos-ref-63629', '✅ TECIDO: renda e\r\n<br><br>\r\n✅TAMANHO : M único veste do 38 ao 42', '63629', '19.99', '0', '1959110921fhkbiegjf9.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(125, 2, 32, 'Cropped suplex decote v REF-63572', 'cropped-suplex-decote-v-ref-63572', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '63572', '19.99', '0', '1436110921gcg8hhgf5d.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(126, 2, 32, 'Cropped de suplex REF-63569', 'cropped-de-suplex-ref-63569', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '63569', '19.99', '0', '1428110921gkf4a0kfai.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(127, 2, 32, 'Cropped Renda transparência REF-5865', 'cropped-renda-transparencia-ref-5865', '✅ TECIDO: renda e suplex , acompanha bojo\r\n<br><br>\r\n✅TAMANHO : M /G', '5865', '19.99', '0', '1830110121dkd5f60chi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(128, 2, 32, 'Cropped de suplex alça fina REF-5854', 'cropped-de-suplex-alca-fina-ref-5854', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42', '5854', '19.99', '0', '1809110121h3a6ge8igg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(129, 2, 32, 'Cropped de suplex alça grossa REF-5841', 'cropped-de-suplex-alca-grossa-ref-5841', '✅ TECIDO: Suplex, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '5841', '19.99', '0', '1742110121c5k1h6cffk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(130, 2, 32, 'Cropped Pavão REF-5793', 'cropped-pavao-ref-5793', '✅ TECIDO: renda acompanha bojo\r\n<br><br>\r\n✅TAMANHO : P M G GG', '5793', '19.99', '0', '15541101215e54282dhg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(131, 2, 32, 'Cropped renda com gola REF-5744', 'cropped-renda-com-gola-ref-5744', '✅ TECIDO: Renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente\r\n', '5744', '26.99', '0', '1427110121gcg3efic3h.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(132, 2, 33, 'Saia de praia com fenda REF-6720', 'saia-de-praia-com-fenda-ref-6720', '✅ Saia de praia, não acompanha bikine<br>\r\n\r\n✅TECIDO: Malha<br>\r\n\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6720', '19.99', '0', '1011130921hjd6hjijkd.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(133, 2, 33, 'Saida de praia trico longa REF-63764', 'saida-de-praia-trico-longa-ref-63764', 'TECIDO: TRICO\r\n<br><br>\r\nTAMANHO ÚNICO : M veste do 38 ao 44 estica tricô', '63764', '19.99', '0', '0848130921eb5gdekedk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(134, 2, 33, 'Biquíni asa delta REF-6303', 'biquini-asa-delta-ref-6303', '✅ TECIDO: Suplex acompanha bojo, tamanho único\r\n<br><br>\r\nTAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6303', '19.99', '0', '15552905218heaii1ejd.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(135, 2, 34, 'Macaquinho jogue curto bengaline REF-6273', 'macaquinho-jogue-curto-bengaline-ref-6273', '\r\n✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: M / G', '6273', '39.99', '0', '23130505214deki5i8bk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(136, 2, 34, 'Jardineira curta REF-6276', 'jardineira-curta-ref-6276', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6276', '39.99', '0', '1225130121hkdbf9c8hg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(137, 2, 35, 'Conjunto Calvin Klein REF-6304', 'conjunto-calvin-klein-ref-6304', '✅ TECIDO: Suplex\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6304', '19.99', '0', '1341130121abhafdh9da.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `sub_total`, `frete`, `total`, `taxas`, `total_custo`, `total_liquido`, `meio_pagamento`, `data_liberacao`, `id_usuario`, `pago`, `data`, `status`, `rastreio`) VALUES
(50, '59.97', '0.00', '59.97', NULL, '0.00', NULL, NULL, NULL, 19, 'Sim', '2021-11-06', 'Comprado', NULL),
(51, '19.99', '0.00', '19.99', NULL, '0.00', NULL, NULL, NULL, 19, 'Sim', '2021-11-06', 'Comprado', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
