-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 27-Nov-2020 às 15:45
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
-- Database: `loja`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `id_produto`, `id_usuario`, `texto`, `nota`, `data`) VALUES
(3, 1, 8, 'Muito bom, gostei muito.', 5, '2020-09-17'),
(4, 25, 8, 'Muito bom, excelente Produto!!', 5, '2020-09-17'),
(5, 25, 6, 'Fiquei impressionado com a qualidade do produto, superou todas as minhas expectativas, realmente muito bom e num preço totalmente acessível, super indico!', 5, '2020-09-17');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carac`
--

INSERT INTO `carac` (`id`, `nome`) VALUES
(1, 'Tamanho'),
(2, 'Cor'),
(3, 'Numeração'),
(4, 'Voltagem');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

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
(59, 29, 'Branco', '#ccc');

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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;

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
(161, 545, 3, 'M');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

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
(30, 3, 34);

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
) ENGINE=InnoDB AUTO_INCREMENT=549 DEFAULT CHARSET=utf8;

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
(547, 20, 15, 1, 0, '2020-11-26', 'Não'),
(548, 19, 10, 10, 13, '2020-11-27', 'Não');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `nome_url`, `imagem`) VALUES
(1, 'Moda Masculina', 'moda-masculina', 'cat-3.jpg'),
(2, 'Moda Feminina', 'moda-feminina', 'cat-2.jpg'),
(3, 'Relógios', 'relogios', 'cat-5.jpg'),
(4, 'Calçados', 'calcados', 'cat-6.jpg'),
(5, 'Jóias e Semi-Jóias', 'joias-e-semi-joias', 'cat-7.jpg'),
(8, 'Óculos', 'oculos', 'cat-oculos.jpg'),
(9, 'Chapéu e Bonés', 'chapeu-e-bones', '00.jpg'),
(10, 'Cursos', 'cursos', 'cursos-cat.png');

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
(7, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 3, '2020-08-02 00:00:00'),
(8, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, '2020-09-07 00:00:00'),
(9, 'Willian Sales Gabriel', '43593584825', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', 3, '2020-10-04 00:00:00'),
(11, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 1, '2020-11-06 02:52:33'),
(12, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 1, '2020-11-06 02:53:04'),
(13, 'Rebeca Lorraine Mendes de Oliveira', '65512202405', 'rebeca@gmail.com', '12996417887', 'Dois', '348', '', 'Pereque', 'Caraguatatuba', 'SP', '11669-309', 1, '2020-11-06 02:54:16'),
(14, 'Rebeca Lorraine Mendes de Oliveira', '50332421805', 'rebecalorraine0204@gmail.com', '12996278049', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatuba', 'SP', '11669-309', NULL, '2020-11-09 15:45:42'),
(15, 'Willian Sales Gabriel', '11867569698', 'williansales199619@gmail.com', '12996417887', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', NULL, '2020-11-09 20:32:10'),
(16, 'Marcos de Oliveira', '57424477528', 'marcos@gmail.com', '12996546658', 'Rua Cleusa Fatima dos Santos ', '30', '', 'Pegorelli', 'Caraguatatuba', 'SP', '11669-309', NULL, '2020-11-26 01:09:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `coment_blog`
--

INSERT INTO `coment_blog` (`id`, `id_blog`, `id_usuario`, `comentario`, `data`, `hora`) VALUES
(1, 3, 6, 'Sempre tive dúvidas quanto a isso, muitas das vezes não conseguia diferenciar bem, sua postagem me ajudou muito, vou prestar mais atenção, grato.', '2020-09-21', '13:21:49'),
(5, 3, 8, 'cccccccccc', '2020-09-21', '13:47:45');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `emails`
--

INSERT INTO `emails` (`id`, `nome`, `email`, `ativo`) VALUES
(8, 'Willian Sales Gabriel', 'williansales199619@gmail.com', 'Sim'),
(9, 'Rebeca Lorraine Mendes de Oliveira', 'rebeca@gmail.com', 'Sim'),
(10, 'Rebeca Lorraine Mendes de Oliveira', 'rebecalorraine0204@gmail.com', 'Sim'),
(11, 'Marcos de Oliveira', 'marcos@gmail.com', 'Sim');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
(25, 25, 'Blue.jpg');

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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

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
(31, 2, 'Seu pedido foi Enviado, o código de rastreio é AA987654321BR', 'Admin', '2020-11-10', '05:15:35');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `categoria`, `sub_categoria`, `nome`, `nome_url`, `descricao`, `descricao_longa`, `valor`, `imagem`, `estoque`, `tipo_envio`, `palavras`, `ativo`, `peso`, `largura`, `altura`, `comprimento`, `modelo`, `valor_frete`, `promocao`, `vendas`, `link`) VALUES
(1, 4, 2, 'Sapato Social', 'sapato-social', 'aaaaaaaaaaaafdsfdfsdf', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaafdsfdsfdffdsf', '189.99', 'cat-6.jpg', 12, 2, 'tenis masculino, tenis esportivo, tenis barato, comprar tenis, tenis lançamento', 'Não', 0.20, 0, 0, 1, '', '20.00', 'Não', NULL, NULL),
(4, 2, 6, 'Olympikus', 'olympikus', 'Tênis Olympikus Selene Preto\r\n\r\n', 'Tênis Olympikus Selene, feito em jacquard multicolor, com estampa floral exclusiva e detalhes em lycra. A palmilha Feetpad traz ainda mais conforto. Solado em Evasense texturizado completa o visual do tênis, garantindo leveza e segurança.\r\n\r\n\r\n', '129.99', 'Tenis-fem-rosa.jpg', 20, 1, 'fadsdsa', 'Sim', 0.00, 34, 0, 39, '', '0.00', 'Não', NULL, NULL),
(5, 2, 6, 'Tênis para Esporte', 'tenis-para-esporte', 'Tênis Olympikus Selene Azul', 'Tênis Olympikus Selene, feito em jacquard multicolor, com estampa floral exclusiva e detalhes em lycra. A palmilha Feetpad traz ainda mais conforto. Solado em Evasense texturizado completa o visual do tênis, garantindo leveza e segurança.\r\n\r\n\r\n', '129.99', 'tenis-masculino.jpg', 20, 1, 'fdfa', 'Sim', 0.00, 0, 0, 39, '', '0.00', 'Não', NULL, NULL),
(6, 2, 6, 'Jogging', 'jogging', 'Tênis Jogging Via Marte Branco', 'Modelo conta com fecho em cadarço permitindo um melhor ajuste aos pés, interior revestido em material têxtil e palmilha em PU macio para um caminhar confortável.\r\n\r\n\r\n', '99.99', 'tenis-feminino.jpg', 20, 1, 'fdsafds', 'Sim', 0.00, 0, 0, 39, '', '0.00', 'Não', NULL, NULL),
(8, 2, 3, 'Vestido com Capuz', 'vestido-com-capuz', 'Vestido com Capuz Preto', 'Vestido básico com capuz. Confeccionado em malha moletinho leve de algodão com toque macio. Com decote em V e mangas longas, de modelagem soltinha e comprimento curto.\r\n\r\n\r\n', '89.90', 'Vestido-Preto-.jpg', 20, 8, 'fadfaf', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 6, ''),
(10, 2, 3, 'Vestidos', 'vestidos', 'Vestido Preto Transpassado com Alça Dupla', 'Vestido em helanca. Modelo com alças, decote transpassado, busto duplo, recorte na cintura, saia assimétrica com transpasse frontal. Comprimento: Curto.\r\n\r\n\r\n', '0.20', 'Vst-preto.jpg', 15, 8, 'fdafa', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 16, ''),
(15, 2, 7, 'Camisa Polo', 'camisa-polo', 'Polo Azul Royal Feminina', 'Polo Feminina em modelo Tradicional. Confeccionado em Meia Malha\r\n\r\n\r\n', '0.40', 'Blusa-azul.jpg', 20, 8, 'dafa', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 15, ''),
(18, 2, 8, 'Calças', 'calcas', 'Calça Jeans Sawary Skinny 360° com Cinta e Puídos', 'Calça em jeans com elastano. Modelo 360º skinny. Cintura com cós e passantes, bolsos frontais falsos e traseiros funcionais, fechamento em botão e zíper, puídos nas pernas, cinta interna contornando a cintura. Cintura alta.\r\n\r\n\r\n', '189.99', 'gabymodas.litoral_123355093_385871819518359_7835157801370328098_n.jpg', 20, 7, 'fdafa', 'Sim', 0.10, 0, 0, 0, '', '10.00', 'Não', NULL, ''),
(20, 2, 9, 'Calção Preto', 'calcao-preto', 'Short Boxer Preta com Elástico Esportivo', 'Short, em helanca. Modelo boxer, com elástico na cintura, faixa esportiva nas laterais e cordão decorativo. Cintura: Média.\r\n\r\n\r\n', '39.99', 'gabymodas.litoral_123462335_1463418570514021_6266216120671708371_n.jpg', 20, 6, 'fdsaf', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(22, 2, 9, 'Short Jeans', 'short-jeans', 'Short Azul', 'Short em jeans de algodão com puídos de efeito destroyed e barra desfiada. Possui comprimento curto e cintura média e tem cós com passantes, bolsos na frente e na parte de trás e fechamento por botão fixo de metal e zíper.\r\n\r\n\r\n', '99.90', 'gabymodas.litoral_124032535_396235488453019_5905175998241839736_n.jpg', 20, 6, 'fdff', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 2, ''),
(23, 4, 10, 'Dariely', 'dariely', 'Bota Montaria Feminina Bottero Couro Preto', 'Modelo básico que finaliza inúmeros looks com muita elegância. Conta com detalhes metalizados na lateral, fecho em zíper garante a praticidade no calce. Salto grosso complementa o estilo.\r\n\r\n\r\n', '149.99', 'gabymodas.litoral_123960386_856204065126804_2958453555303307970_n.jpg', 18, 7, 'fsdfa', 'Sim', 0.10, 0, 0, 0, '', '18.00', 'Não', 1, ''),
(25, 1, 11, 'Camisa Estampa', 'camisa-estampa', 'Camiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha.\r\n\r\n\r\n\r\n', 'Camiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha.\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha.\r\n\r\n\r\n\r\n\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha. Modelagem tradicional. Possui estampa ilustrativa de peixe-espada. Detalhe de etiqueta decorativa da marca. Aposte em calça jeans skinny e tênis slip on, para um visual despojado e moderno!\r\nCamiseta confeccionada em meia malha.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '50.00', 'gabymodas.litoral_124201389_396988358093125_4284827088868776956_n.jpg', 10, 6, 'fdfs', 'Sim', 0.02, 20, 15, 30, '', '0.00', 'Não', 11, ''),
(30, 1, 12, 'Bermudas', 'bermudas', 'Bermuda com Cordel e Detalhe Destroyed Jeans', 'Bermuda em jeans de algodão. Modelo com cordel removível e bolsos frontais e traseiros funcionais. Detalhes destroyed.\r\n\r\n\r\n', '139.99', 'gabymodas.litoral_124288946_153796429787484_6603144107077681972_n.jpg', 15, 6, 'ssfs', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 5, ''),
(33, 2, 7, 'Baby Luck Adidas', 'baby-luck-adidas', 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaa', '19.90', 'Baby-Luck-Adidas.jpg', 8, 6, 'baby-luck-adidas', 'Sim', 0.20, 0, 0, 1, 'aaaaaa', '10.00', 'Não', 1, ''),
(34, 2, 7, 'Blusa de Suplex com Bojo', 'blusa-de-suplex-com-bojo', 'aaaaaa', 'aaaaaaaaaaaaaaaaaaa', '19.90', 'Blusa-de-Suplex-com-Bojo.jpg', 7, 6, 'Blusa-de-Suplex-com-Bojo', 'Sim', 0.20, 0, 0, 1, 'sem modelo', '0.00', 'Não', 2, ''),
(35, 2, 7, 'Baby Luck Puma', 'baby-luck-puma', 'aaaaaaaaa', 'aaaaaaaaaa', '19.90', 'Baby-Luck-Puma.jpg', 10, 6, 'baby luck  adidas', 'Sim', 0.20, 0, 0, 1, '', '0.00', 'Não', NULL, ''),
(36, 4, 10, 'Blusa Xadrez', 'blusa-xadrez', 'aaaaaa', 'aaaaaaa', '34.90', 'Blusa-Xadrez.jpg', 10, 6, 'Blusa Xadrez', 'Sim', 0.20, 0, 0, 1, '', '0.00', 'Não', NULL, ''),
(37, 2, 7, 'Blusa Canelada Com Bojo De Golinha', 'blusa-canelada-com-bojo-de-golinha', 'aa', 'aaaaaaaaaaaaaaaa', '19.90', 'Blusa-Canelada-Com-Bojo-De-Golinha.jpg', 10, 6, 'Blusa Canelada Com Bojo De Golinha', 'Não', 0.20, 0, 0, 1, '', '0.00', 'Não', NULL, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `promocao_banner`
--

INSERT INTO `promocao_banner` (`id`, `titulo`, `link`, `imagem`, `ativo`) VALUES
(1, 'Promoção 6 Camisetas', 'http://google.com', 'banner-promo-2.jpg', 'Sim'),
(3, 'Segunda Promoção', 'produto-sapato-social', 'banner-promo.jpg', 'Sim'),
(4, 'Terceira Promoção', 'http://google.com', 'banner-1.jpg', 'Não');

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocoes`
--

DROP TABLE IF EXISTS `promocoes`;
CREATE TABLE IF NOT EXISTS `promocoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_final` date NOT NULL,
  `ativo` varchar(5) NOT NULL,
  `desconto` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `promocoes`
--

INSERT INTO `promocoes` (`id`, `id_produto`, `valor`, `data_inicio`, `data_final`, `ativo`, `desconto`) VALUES
(2, 31, '30.00', '2020-08-30', '2020-09-01', 'Sim', ''),
(3, 30, '104.99', '2020-08-31', '2020-09-30', 'Sim', '25'),
(4, 29, '35.00', '2020-08-24', '2020-09-02', 'Não', ''),
(5, 28, '50.00', '2020-08-31', '2020-09-08', 'Sim', ''),
(6, 25, '45.00', '2020-09-02', '2020-09-25', 'Sim', '10'),
(7, 24, '0.40', '2020-09-02', '2020-09-30', 'Sim', '0'),
(8, 22, '89.91', '2020-09-02', '2020-09-04', 'Sim', '10'),
(9, 18, '170.99', '2020-09-02', '2020-09-02', 'Sim', '10'),
(10, 23, '75.00', '2020-09-09', '2020-09-30', 'Sim', '50');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sub_categorias`
--

INSERT INTO `sub_categorias` (`id`, `nome`, `nome_url`, `imagem`, `id_categoria`) VALUES
(1, 'Tênis Masculinos', 'tenis-masculinos', 'Prdt-Tenis-Masc-preto.jpg', 4),
(2, 'Sapato Social', 'sapato-social', 'Sapato-Social.jpg', 4),
(3, 'Vestidos', 'vestidos', 'cat-2.jpg', 2),
(6, 'Tênis Femininos', 'tenis-femininos', 'Prdt-Tenis-Feminino-Rosa.jpg', 2),
(7, 'Blusas', 'blusas', 'Sub-Social-Feminina-.jpg', 2),
(8, 'Calças ', 'calcas', 'Prdt-Jogger-Feminina.jpg', 2),
(9, 'Shorts', 'shorts', 'Calção.jpg', 2),
(10, 'Botas', 'botas', 'Bota-Feminina.jpg', 4),
(11, 'Camisetas', 'camisetas', 'Sub-Camisas.jpg', 1),
(12, 'Bermudas', 'bermudas', 'Prdt-Bermuda-masc-Cinza.jpg', 1),
(13, 'Desenvolvimento WEB', 'desenvolvimento-web', 'loja-virtual-php7.jpeg', 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_envios`
--

DROP TABLE IF EXISTS `tipo_envios`;
CREATE TABLE IF NOT EXISTS `tipo_envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tipo_envios`
--

INSERT INTO `tipo_envios` (`id`, `nome`) VALUES
(6, 'Correios'),
(7, 'Valor Fixo'),
(8, 'Sem Frete'),
(10, 'Digital');

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
(1, 'Administrador', '00000000000', 'williansalesgabriel@hotmail.com', '123456', 'e10adc3949ba59abbe56e057f20f883e', 'Admin', 'willianprof.jpg'),
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
  `id_usuario` int(11) NOT NULL,
  `pago` varchar(5) NOT NULL,
  `data` date NOT NULL,
  `status` varchar(35) NOT NULL,
  `rastreio` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `sub_total`, `frete`, `total`, `id_usuario`, `pago`, `data`, `status`, `rastreio`) VALUES
(1, '39.80', '21.00', '60.80', 13, 'Sim', '2020-11-10', 'Não Enviado', NULL),
(2, '49.80', '21.00', '70.80', 17, 'Sim', '2020-11-10', 'Enviado', 'AA987654321BR'),
(3, '19.90', '21.00', '40.90', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(4, '0.00', '0.00', '0.00', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(5, '109.80', '21.00', '130.80', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(6, '39.80', '29.40', '69.20', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(7, '0.20', '0.00', '0.20', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(8, '19.90', '21.00', '40.90', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(9, '29.90', '21.00', '50.90', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(10, '19.90', '21.00', '40.90', 13, 'Não', '2020-11-25', 'Não Enviado', NULL),
(11, '1.00', '0.00', '1.00', 13, 'Sim', '2020-11-25', 'Não Enviado', NULL),
(12, '299.59', '22.50', '322.09', 20, 'Não', '2020-11-26', 'Não Enviado', NULL),
(13, '2.00', '0.00', '2.00', 19, 'Não', '2020-11-27', 'Não Enviado', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
