-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 01-Dez-2021 às 01:38
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
(42, 2, 22, 'Body com manga de zíper canelado ref-35539', 'body-com-manga-de-ziper-canelado-ref-35539', '✅Detalhes:\r\nBory canelado com elastano acompanha bojo, tamanho único\r\n\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '35539', '100.00', '0', '1721030521ah9edhgadc.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(43, 2, 22, 'Body Multiformas ref-5730', 'body-multiformas-ref-5730', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5730', '25.00', '0', '1502300421dgcci2jaeg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(44, 2, 22, 'Body canelado de alça decote v ref-6733', 'body-canelado-de-alca-decote-v-ref-6733', '✅Body canelado bojo, tamanho único\r\n\r\n✅TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6733', '19.99', '0', '1233150121cech2j2b8h.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(45, 2, 22, 'Body com manga decote V canelado ref-6732', 'body-com-manga-decote-v-canelado-ref-6732', '✅Body canelado acompanha bojo, tamanho único\r\n\r\n✅TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6732', '19.99', '0', '1225150121k0if3fhd7g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(46, 2, 22, 'Body canelado manga curta princesa ref-6494', 'body-canelado-manga-curta-princesa-ref-6494', '✅TECIDO: canelado, tamanho único.<br><br>\r\n\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '6494', '19.99', '0', '0745140121i7ich715ai.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(47, 2, 22, 'Body trançado ref-5729', 'body-trancado-ref-5729', '✅ TECIDO: Suplex com elastano acompanha bojo, tamanho único.<br><br>\r\n\r\n\r\n✅TAMANHO ÚNICO M: veste do 36 ao 42 aproximadamente', '5729', '24.99', '0', '1401110121eigh4iceee.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(48, 2, 22, 'Body renda de gola ref-5724', 'body-renda-de-gola-ref-5724', '✅ TECIDO: renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 40 aproximadamente', '5724', '29.99', '0', '1352110121bdj3fg19j6.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(49, 2, 22, 'Body renda chique ref-5719', 'body-renda-chique-ref-5719', '✅ TECIDO: renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5719', '34.99', '0', '1335110121jcaaii0hk5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(50, 2, 22, 'Body regata de zíper canelado ref-5704', 'body-regata-de-ziper-canelado-ref-5704', 'Bory canelado com elastano acompanha bojo, tamanho único<br><br>\r\n\r\nTAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '5704', '19.99', '0', '1300110121cbdahgj74g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(51, 2, 22, 'Body com abertura no ombro e abdômen ref-5679', 'body-com-abertura-no-ombro-e-abdomen-ref-5679', '✅ TECIDO: suplex com elastano,\r\nacompanha bojo\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5679', '21.99', '0', '1204110121hhhd6d0dh5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(52, 2, 22, 'Body reto ref-5632', 'body-reto-ref-5632', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '5632', '19.99', '0', '1029110121bgc4fbi8da.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(53, 2, 22, 'Body gola v com costura na lateral ref-5579', 'body-gola-v-com-costura-na-lateral-ref-5579', '✅TECIDO: suplex com elastano acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: M veste do 36 ao 42 aproximadamente', '5579', '19.99', '0', '2127100121ikkbc70e48.jpg', 998, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 2, ''),
(54, 2, 23, 'Blusa Mickey ref-63623', 'blusa-mickey-ref-63623', '✅ TECIDO: Viscolaicra com aplicação em perolas\r\n<br><br>\r\n✅ TAMANHO: único M\r\nVeste do 38 ao 42', '63623', '19.99', '0', '1843110921f2ccgcbk6j.jpg', 999, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 1, ''),
(55, 2, 23, 'Blusa canelada manga franzidinha ref-6016', 'blusa-canelada-manga-franzidinha-ref-6016', '✅ Blusa Malha canelada, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6016', '19.99', '0', '1453120121c7ek1gh5if.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(56, 2, 23, 'T-shirt /aplique estampas diversas ref-63619', 't-shirt-/aplique-estampas-diversas-ref-63619', '✅ T-shirt /aplique estampas diversas\r\n( não garantimos a estampa )\r\n*** estampas mudam diariamente\r\n<br><br>\r\n✅ TECIDO: viscolaycra , tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 38 ao 42 aproximadamente', '63619', '19.90', '0', '1807110921a46ke8a3gi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(57, 2, 23, 'Blusa podrinha ref-5992', 'blusa-podrinha-ref-5992', '✅Blusa podrinha, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '5992', '19.99', '0', '1020110921hdjgdf23ae.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(58, 2, 23, 'Blusa canelada com bojo ref-6019', 'blusa-canelada-com-bojo-ref-6019', '✅ TECIDO : canelada acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO M : único veste do 36 ao 42 aproximadamente', '6019', '19.99', '0', '1012110921kek0hhc10g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(59, 2, 23, 'Blusa com manga de tule bolinha ref-6668', 'blusa-com-manga-de-tule-bolinha-ref-6668', '\r\n✅ Blusa canelada , tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6668', '19.99', '0', '09481109217ahbc3gbkg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(60, 2, 23, 'Blusa canelada manga princesa ref-6012', 'blusa-canelada-manga-princesa-ref-6012', '✅ TECIDO: canelada, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6012', '19.99', '0', '1841100921ibi5hc8d19.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(61, 2, 23, 'Blusa Viscolaicra manga curta ref-35928', 'blusa-viscolaicra-manga-curta-ref-35928', '✅ TECIDO: Viscolaicra\r\n<br><br>\r\n✅ TAMANHO : P M G GG', '35928', '19.99', '0', '1807100921bbckadijac.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(62, 2, 23, 'Regata crepe gola v ref-6014', 'regata-crepe-gola-v-ref-6014', '✅ TECIDO: crepe\r\n<br><br>\r\n✅TAMANHO : P M G GG', '6014', '19.99', '0', '00480605216ig936afh7.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(63, 2, 23, 'Blusa coração ref-14103', 'blusa-coracao-ref-14103', '✅ TECIDO: Viscolaicra com aplicação em perolas\r\n<br><br>\r\n✅ TAMANHO: único M\r\nVeste do 38 ao 42', '14103', '19.99', '0', '22290505213c7jje7gaa.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(64, 2, 23, 'Camisa linho botões ref-34962', 'camisa-linho-botoes-ref-34962', '✅ TECIDO: Viscolinho\r\n<br><br>\r\n✅TAMANHO : P M G', '34962', '29.99', '0', '1951050521aa5chagk34.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(65, 2, 23, 'Básica viscolycra ref-6130', 'basica-viscolycra-ref-6130', '✅ TECIDO: Viscolaicra\r\n\r\n✅ TAMANHO: P M G GG', '6130', '12.99', '0', '2055120121ebidcbkgaa.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(66, 2, 23, 'Blusa de alça Suede botões e amarração ref-6032', 'blusa-de-alca-suede-botoes-e-amarracao-ref-6032', '✅ TECIDO: Suede\r\n<br><br>\r\n✅TAMANHO : P M G', '6032', '19.99', '0', '161412012107d7g40bdj.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(67, 2, 23, 'Blusa de Suede com manga ref-6027', 'blusa-de-suede-com-manga-ref-6027', 'Tamanho M 36/38/40<br>\r\nTamanho G 42<br>\r\nTamanho GG 44/46', '6027', '19.99', '0', '1609120121j2fha6deee.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(68, 2, 23, 'Blusa com renda viscolycra ref-6024', 'blusa-com-renda-viscolycra-ref-6024', '✅ Blusa viscolycra acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO: veste do 36 ao 42 aproximadamente', '6024', '19.99', '0', '1557120121iei8ccdahf.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(69, 2, 23, 'Blusa de Suede de alça ref-6021', 'blusa-de-suede-de-alca-ref-6021', '✅ TECIDO : Blusa de Suede\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6021', '19.99', '0', '154412012108ee5k88e4.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(70, 2, 23, 'Blusa canelada com botões ref-6017', 'blusa-canelada-com-botoes-ref-6017', '✅ TECIDO : canelada acompanha bojo, tamanho único\r\n<br><br>\r\n\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6017', '19.99', '0', '1511120121f4i8de097d.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(71, 2, 23, 'Blusa canelada golinha com bojo ref-6007', 'blusa-canelada-golinha-com-bojo', '✅ Blusa canelada acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente Forma pequena', '6007', '19.99', '0', '1405120121ekhdk5cg6g.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(72, 2, 23, 'Blusa ombro a ombro canelada ref-6009', 'blusa-ombro-a-ombro-canelada-ref-6009', '✅ Blusa canelada acompanha bojo, tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6009', '19.99', '0', '1420120121f1aikdhif0.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(73, 2, 23, 'Blusa com manguinha bolso viscolycra ref-6003', 'blusa-com-manguinha-bolso-viscolycra-ref-6003', '✅ Blusa viscolaycra , tamanho único\r\n<br><br>\r\n✅ TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6003', '19.99', '0', '1326120121dhae4c35ch.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(74, 2, 25, 'T-shirt infantil pedraria ref-63784', 't-shirt-infantil-pedraria-ref-63784', '✅ TECIDO: Viscolaicra\r\n***não garantimos a estampa do desenho\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63784', '18.00', '0', '1157130921e4ekk34kgi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(75, 2, 25, 'Jardineira suplex infantil ref-63782', 'jardineira-suplex-infantil-ref-63782', '✅ TECIDO: suplex /estampas diversas\r\nEla é aberta nas costas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n', '63782', '19.99', '0', '1143130921a4df8hggga.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(76, 2, 25, 'Vestido sorvete ref-63781', 'vestido-sorvete-ref-63781', '✅ TECIDO: Ribana canelado\r\n* não acompanha acessórios\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63781', '19.99', '0', '1135130921c9feie0did.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(77, 2, 25, 'Blusa Infantil Corrente ref-63780', 'blusa-infantil-corrente-ref-63780', '\r\n✅ TECIDO: Ribana canelada\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63780', '19.99', '0', '1129130921gb62c5dhfj.jpg', 999, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', 1, ''),
(78, 2, 25, 'Blusa infantil manga tele bolinha ref-63763', 'blusa-infantil-manga-tele-bolinha-ref-63763', '✅ TECIDO: canelada e tule\r\n<br><br>\r\n✅ TAMANHO: 2 /4/ 6/ 8', '63763', '18.00', '0', '0829130921c08aaccd6e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(79, 2, 25, 'Macacão infantil viscose ref-63726', 'macacao-infantil-viscose-ref-63726', '✅ TECIDO: viscose/estampas diversas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n<br><br>\r\n✅ TAMANHO: 2/4/6/8', '63726', '24.99', '0', '2050120921cid7igcdak.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(80, 2, 25, 'Vestido infantil viscose alcinha ref-63725', 'vestido-infantil-viscose-alcinha-ref-63725', '✅ TECIDO: viscose/estampas diversas\r\n<br><br>\r\n✅(Não garantimos estampas)\r\nEstampas mudam diariamente\r\n<br><br>\r\n✅ TAMANHO: 2/4/6/8', '63725', '18.00', '0', '20481209214ia4i5000b.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(81, 2, 26, 'Calça pantalona ref-66212', 'calca-pantalona-ref-66212', '✅ TECIDO: viscose\r\n<br><br>\r\n✅ TAMANHO: M / G', '66212', '39.99', '0', '1753260221kdbdge0462.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(82, 2, 26, 'Calça bandagem Preta ref-63733', 'calca-bandagem-preta-ref-63733', '✅ TECIDO: Bandagem\r\n<br><br>\r\n✅TAMANHO: P M G GG', '63733', '49.00', '0', '21351209215cjj5k8kf5.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(83, 2, 26, 'Calça camuflada ref-6262', 'calca-camuflada-ref-6262', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6262', '39.99', '0', '0759100921cde275g48e.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(84, 2, 26, 'Calça jogger com elastico ref-6284', 'calca-jogger-com-elastico-ref-6284', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6284', '35.00', '0', '1207050621d9dbjkd542.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(85, 2, 26, 'Calça bengaline cinto ref-14096', 'calca-bengaline-cinto-ref-14096', '✅ TECIDO : Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '14096', '39.99', '0', '165405052108jegcddkh.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(86, 2, 26, 'Calça de linho frizada com amarração ref-35740', 'calca-de-linho-frizada-com-amarracao-ref-35740', 'Tecido viscolinho<br>\r\nTamanho M 38/40<br>\r\nTamanho G 42/44<br>', '35740', '49.99', '0', '0820220921eid2afkkea.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(87, 2, 26, 'Calça fivela redonda xadrez ref-35037', 'calca-fivela-redonda-xadrez-ref-35037', '✅ TECIDO: jacar\r\n<br><br>\r\n✅ TAMANHO: P M G GG Forma grande', '35037', '39.99', '0', '2037300421dac538iaf8.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(88, 2, 26, 'Calça bengaline Xadrez ref-34961', 'calca-bengaline-xadrez-ref-34961', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '34961', '39.99', '0', '1158300421ha0gh6c3ch.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(89, 2, 26, 'Calça army bengaline ref-6318', 'calca-army-bengaline-ref-6318', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6318', '39.99', '0', '1524130121g6024cefbk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(90, 2, 26, 'Calça legging preta ref-6306', 'calca-legging-preta-ref-6306', '✅ TECIDO : Calça de suplex\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6306', '19.99', '0', '1353130121jcijggfagk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(91, 2, 26, 'Calça ribana com listra na lateral ref-6295', 'calca-ribana-com-listra-na-lateral-ref-6295', '✅ TECIDO: Ribana Canelada\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6295', '35.00', '0', '1303130121jgdkg282gc.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
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
(119, 2, 30, 'Blazer longo neopreme REF-7045', 'blazer-longo-neopreme-ref-7045', '✅ TECIDO: Neopreme\r\n<br><br>\r\n✅ TAMANHO: P M G', '7045', '39.00', '0', '0846160121ga21gf6c6a.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(120, 2, 30, 'Blazer neoprene curto REF-6289', 'blazer-neoprene-curto-ref-6289', '✅ TECIDO: Neopreme\r\n<br><br>\r\n✅ TAMANHO : P M G GG', '6289', '35.00', '0', '1252130121jh5ag4jaf3.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(121, 2, 31, 'Macacão longo jardineira REF-6321', 'macacao-longo-jardineira-ref-6321', 'Jardineira tecido bengaline<br>\r\nForma pequena<br>\r\nTamanho m 36/38<br>\r\nTamanho G 40/42', '6321', '49.00', '0', '0736060521idj4eh2cfk.png', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(122, 2, 31, 'Macacão longo jogue bengaline REF-6320', 'macacao-longo-jogue-bengaline-ref-6320', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: M / G', '6320', '49.00', '0', '15321301219e7bkegdg7.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(123, 2, 32, 'Cropped de suplex REF-5843', 'cropped-de-suplex-ref-5843', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '5843', '19.99', '0', '1752110121ikhehcd6c31.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(124, 2, 32, 'Cropped Renda ilhos REF-63629', 'cropped-renda-ilhos-ref-63629', '✅ TECIDO: renda e\r\n<br><br>\r\n✅TAMANHO : M único veste do 38 ao 42', '63629', '19.99', '0', '1959110921fhkbiegjf9.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(125, 2, 32, 'Cropped suplex decote v REF-63572', 'cropped-suplex-decote-v-ref-63572', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '63572', '19.99', '0', '1436110921gcg8hhgf5d.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(126, 2, 32, 'Cropped de suplex REF-63569', 'cropped-de-suplex-ref-63569', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '63569', '19.99', '0', '1428110921gkf4a0kfai.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(127, 2, 32, 'Cropped Renda transparência REF-5865', 'cropped-renda-transparencia-ref-5865', '✅ TECIDO: renda e suplex , acompanha bojo\r\n<br><br>\r\n✅TAMANHO : M /G', '5865', '19.99', '0', '1830110121dkd5f60chi.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Não', NULL, ''),
(128, 2, 32, 'Cropped de suplex alça fina REF-5854', 'cropped-de-suplex-alca-fina-ref-5854', '✅ TECIDO: Suplex , tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42', '5854', '19.99', '0', '1809110121h3a6ge8igg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(129, 2, 32, 'Cropped de suplex alça grossa REF-5841', 'cropped-de-suplex-alca-grossa-ref-5841', '✅ TECIDO: Suplex, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente', '5841', '19.99', '0', '1742110121c5k1h6cffk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(130, 2, 32, 'Cropped Pavão REF-5793', 'cropped-pavao-ref-5793', '✅ TECIDO: renda acompanha bojo\r\n<br><br>\r\n✅TAMANHO : P M G GG', '5793', '19.99', '0', '15541101215e54282dhg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(131, 2, 32, 'Cropped renda com gola REF-5744', 'cropped-renda-com-gola-ref-5744', '✅ TECIDO: Renda acompanha bojo, tamanho único\r\n<br><br>\r\n✅TAMANHO ÚNICO M : veste do 36 ao 40 aproximadamente\r\n', '5744', '26.99', '0', '1427110121gcg3efic3h.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(132, 2, 33, 'Saia de praia com fenda REF-6720', 'saia-de-praia-com-fenda-ref-6720', '✅ Saia de praia, não acompanha bikine<br>\r\n\r\n✅TECIDO: Malha<br>\r\n\r\n✅TAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6720', '19.99', '0', '1011130921hjd6hjijkd.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(133, 2, 33, 'Saida de praia trico longa REF-63764', 'saida-de-praia-trico-longa-ref-63764', 'TECIDO: TRICO\r\n<br><br>\r\nTAMANHO ÚNICO : M veste do 38 ao 44 estica tricô', '63764', '19.99', '0', '0848130921eb5gdekedk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(134, 2, 33, 'Biquíni asa delta REF-6303', 'biquini-asa-delta-ref-6303', '✅ TECIDO: Suplex acompanha bojo, tamanho único\r\n<br><br>\r\nTAMANHO ÚNICO M : veste do 36 ao 42 aproximadamente', '6303', '19.99', '0', '15552905218heaii1ejd.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(135, 2, 34, 'Macaquinho jogue curto bengaline REF-6273', 'macaquinho-jogue-curto-bengaline-ref-6273', '\r\n✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: M / G', '6273', '39.99', '0', '23130505214deki5i8bk.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(136, 2, 34, 'Jardineira curta REF-6276', 'jardineira-curta-ref-6276', '✅ TECIDO: Bengaline\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6276', '39.99', '0', '1225130121hkdbf9c8hg.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, ''),
(137, 2, 35, 'Conjunto Calvin Klein REF-6304', 'conjunto-calvin-klein-ref-6304', '✅ TECIDO: Suplex\r\n<br><br>\r\n✅ TAMANHO: P M G GG', '6304', '19.99', '0', '1341130121abhafdh9da.jpg', 1000, 6, 'padrao', 'Sim', 0.00, 0, 0, 0, '', '0.00', 'Sim', NULL, '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
