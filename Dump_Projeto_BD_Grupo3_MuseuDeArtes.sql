-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 201.140.252.22:3306
-- Tempo de geração: 28-Mar-2022 às 01:12
-- Versão do servidor: 10.1.23-MariaDB-9+deb9u1
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_bd`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Artistas`
--

DROP TABLE IF EXISTS `Artistas`;
CREATE TABLE IF NOT EXISTS `Artistas` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(70) COLLATE utf8mb4_bin NOT NULL,
  `Data_Nascimento` date NOT NULL,
  `Data_Falecimento` date DEFAULT NULL,
  `Pais` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Estilo_principal` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Artistas`
--

INSERT INTO `Artistas` (`Codigo`, `Nome`, `Data_Nascimento`, `Data_Falecimento`, `Pais`, `Estilo_principal`) VALUES
(3, 'Francisco Brennand', '1927-06-11', '2019-12-19', 'Brasil', 'Plastico'),
(4, 'Vincent Van Gogh', '1853-03-30', '1890-07-29', 'Países Baixos', 'Pós-impressionismo'),
(5, 'Paul Gauguin', '1848-06-07', '1903-05-08', 'França', 'Arte Moderna'),
(6, 'Édouard Manet', '1832-01-23', '1883-04-30', 'França', 'Arte Moderna'),
(7, 'Tomie Ohtake', '1913-11-21', '2015-02-12', 'Japão', 'Abstrato'),
(8, 'James Rizzi', '1950-10-05', '2011-12-26', 'Estados Unidos', 'Renascentista ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Busto`
--

DROP TABLE IF EXISTS `Busto`;
CREATE TABLE IF NOT EXISTS `Busto` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Homenageado` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Codigo_escultura` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Codigo_escultura` (`Codigo_escultura`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Busto`
--

INSERT INTO `Busto` (`Codigo`, `Homenageado`, `Codigo_escultura`) VALUES
(1, 'Eduard', 12),
(2, 'James Bound', 11);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Colecoes`
--

DROP TABLE IF EXISTS `Colecoes`;
CREATE TABLE IF NOT EXISTS `Colecoes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Descricao` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Pessoa_Responsavel` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Colecoes`
--

INSERT INTO `Colecoes` (`Codigo`, `Nome`, `Descricao`, `Pessoa_Responsavel`) VALUES
(1, 'Primordios', 'A primeira coleção do Museu', 'Eduardo Jublieu Francisco'),
(2, 'Inverno', 'Objetos que remetem a estação do frio', 'Giovani Arthurio'),
(3, 'Anos de guerra', 'Obras de guerras e tempos difíceis', 'Antony Raul'),
(4, 'Nascimento de uma nação', 'História da origem do país onde o museu está ', 'Maria Bennet');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Emprestados`
--

DROP TABLE IF EXISTS `Emprestados`;
CREATE TABLE IF NOT EXISTS `Emprestados` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Data_emprestimo` date NOT NULL,
  `Data_devolver` date NOT NULL,
  `Colecao_Origem` int(11) NOT NULL,
  `Codigo_objetos` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Codigo_objetos` (`Codigo_objetos`),
  KEY `pertence` (`Colecao_Origem`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Emprestados`
--

INSERT INTO `Emprestados` (`Codigo`, `Data_emprestimo`, `Data_devolver`, `Colecao_Origem`, `Codigo_objetos`) VALUES
(2, '2005-09-06', '2027-03-31', 1, 1),
(4, '2022-03-01', '2032-03-01', 1, 4),
(5, '2014-03-01', '2022-03-31', 1, 5),
(6, '2010-03-26', '2019-03-26', 1, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Esculturas`
--

DROP TABLE IF EXISTS `Esculturas`;
CREATE TABLE IF NOT EXISTS `Esculturas` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Largura` varchar(11) COLLATE utf8mb4_bin NOT NULL,
  `Altura` varchar(11) COLLATE utf8mb4_bin NOT NULL,
  `Peso` varchar(11) COLLATE utf8mb4_bin NOT NULL,
  `Material_principal` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `codigo_objeto` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `codigo_objeto` (`codigo_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Esculturas`
--

INSERT INTO `Esculturas` (`Codigo`, `Largura`, `Altura`, `Peso`, `Material_principal`, `codigo_objeto`) VALUES
(1, '17cm', '18cm', '20g', 'Cerâmica', 1),
(10, '80cm', '1.5M', '700kg', 'Mármore', 5),
(11, '80cm', '80cm', '250kg', 'Pedra', 6),
(12, '60cm', '60cm', '800kg', 'Cerâmica', 7),
(13, '60cm', '1.85', '850kg', 'Porcelana', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Estatuas`
--

DROP TABLE IF EXISTS `Estatuas`;
CREATE TABLE IF NOT EXISTS `Estatuas` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Homenageado` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Codigo_escultura` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Codigo_escultura` (`Codigo_escultura`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Estatuas`
--

INSERT INTO `Estatuas` (`Codigo`, `Homenageado`, `Codigo_escultura`) VALUES
(1, 'Sr. Totto', 10),
(2, 'Sr. Lewis', 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Exposicoes`
--

DROP TABLE IF EXISTS `Exposicoes`;
CREATE TABLE IF NOT EXISTS `Exposicoes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Data_inicial` date NOT NULL,
  `Data_Final` date NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Exposicoes`
--

INSERT INTO `Exposicoes` (`Codigo`, `Nome`, `Data_inicial`, `Data_Final`) VALUES
(1, 'Belas artes', '2020-03-26', '2021-03-26'),
(2, 'Mais arte', '2021-03-26', '2023-03-26');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Objetos`
--

DROP TABLE IF EXISTS `Objetos`;
CREATE TABLE IF NOT EXISTS `Objetos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `Estilo` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Ano_de_criacao` date NOT NULL,
  `Descricao` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `Codigo_artista` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `artistas` (`Codigo_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Objetos`
--

INSERT INTO `Objetos` (`Codigo`, `Titulo`, `Estilo`, `Ano_de_criacao`, `Descricao`, `Codigo_artista`) VALUES
(1, 'Tartaruga', 'Plastico', '2002-05-03', 'Uma tartaruga feita em cerâmica.', 3),
(2, 'Telhados', 'Impressionismo', '1882-05-12', 'Vista do Ateliê em Haia', 4),
(3, 'Os Comedores de Batata', 'naturezas-mortas', '1885-09-08', 'Estudos de personagens camponeses', 4),
(4, 'A estatua', 'Plastico', '1990-06-08', 'Uma estatua em mármore', 8),
(5, 'O homem', 'Escultura', '2013-05-22', 'Escultura em mármore', 7),
(6, 'James Bound', 'Busto', '2021-03-05', 'Um grande homem', 6),
(7, 'Eduard', 'Busto', '1999-09-22', 'Uma incrível pessoa', 7),
(10, 'As casas', 'Plastico', '1999-03-26', 'Uma bela vista com muitas casas', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Objetos_Exposicoes`
--

DROP TABLE IF EXISTS `Objetos_Exposicoes`;
CREATE TABLE IF NOT EXISTS `Objetos_Exposicoes` (
  `Codigo_Objetos` int(11) NOT NULL,
  `Codigo_Exposicao` int(11) NOT NULL,
  PRIMARY KEY (`Codigo_Objetos`,`Codigo_Exposicao`),
  KEY `FK_Compoe_Exposicoes` (`Codigo_Exposicao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Objetos_Exposicoes`
--

INSERT INTO `Objetos_Exposicoes` (`Codigo_Objetos`, `Codigo_Exposicao`) VALUES
(4, 1),
(5, 2),
(6, 2),
(7, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Permanentes`
--

DROP TABLE IF EXISTS `Permanentes`;
CREATE TABLE IF NOT EXISTS `Permanentes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Data_aquisicao` date NOT NULL,
  `Custo` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `Fonte_vendedora` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `codigo_objeto` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `codigo_objeto` (`codigo_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Permanentes`
--

INSERT INTO `Permanentes` (`Codigo`, `Data_aquisicao`, `Custo`, `Fonte_vendedora`, `codigo_objeto`) VALUES
(1, '2005-09-12', 'R$2000,00', 'Museu de Pernambuco ', 2),
(2, '2009-09-07', 'R$500,00', 'Museu Paraíba', 3),
(3, '2022-03-01', 'R$10000,00', 'Museu de Pernambuco ', 6),
(4, '2022-03-01', 'R$500,00', 'Museu Paraíba', 7);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Pinturas`
--

DROP TABLE IF EXISTS `Pinturas`;
CREATE TABLE IF NOT EXISTS `Pinturas` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Dimensoes` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `Tipo_moldura` varchar(45) COLLATE utf8mb4_bin NOT NULL,
  `codigo_objeto` int(11) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `codigo_objeto` (`codigo_objeto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Pinturas`
--

INSERT INTO `Pinturas` (`Codigo`, `Dimensoes`, `Tipo_moldura`, `codigo_objeto`) VALUES
(1, '104*250cm', 'Metalica', 2),
(2, '105*205cm', 'Madeira', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Telefone`
--

DROP TABLE IF EXISTS `Telefone`;
CREATE TABLE IF NOT EXISTS `Telefone` (
  `Telefone` varchar(16) COLLATE utf8mb4_bin NOT NULL,
  `Codigo_colecoes` int(11) NOT NULL,
  PRIMARY KEY (`Telefone`,`Codigo_colecoes`) USING BTREE,
  KEY `FK_Telefone_Colecoes` (`Codigo_colecoes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Extraindo dados da tabela `Telefone`
--

INSERT INTO `Telefone` (`Telefone`, `Codigo_colecoes`) VALUES
('(11)98521-0307', 3),
('(12)99630-0014', 4),
('(81)98521-3647', 2),
('(81)99485-0978', 1),
('(83)98541-2367', 2),
('(83)99652-8741', 3),
('(83)99988-5511', 1),
('(84)98663-1475', 1),
('(85)99632-8523', 3);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Busto`
--
ALTER TABLE `Busto`
  ADD CONSTRAINT `Busto` FOREIGN KEY (`Codigo_escultura`) REFERENCES `Esculturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Emprestados`
--
ALTER TABLE `Emprestados`
  ADD CONSTRAINT `emprestados` FOREIGN KEY (`Codigo_objetos`) REFERENCES `Objetos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pertence` FOREIGN KEY (`Colecao_Origem`) REFERENCES `Colecoes` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Esculturas`
--
ALTER TABLE `Esculturas`
  ADD CONSTRAINT `escultura` FOREIGN KEY (`codigo_objeto`) REFERENCES `Objetos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Estatuas`
--
ALTER TABLE `Estatuas`
  ADD CONSTRAINT `estatua` FOREIGN KEY (`Codigo_escultura`) REFERENCES `Esculturas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Objetos`
--
ALTER TABLE `Objetos`
  ADD CONSTRAINT `artistas` FOREIGN KEY (`Codigo_artista`) REFERENCES `Artistas` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Objetos_Exposicoes`
--
ALTER TABLE `Objetos_Exposicoes`
  ADD CONSTRAINT `FK_Compoe_Exposicoes` FOREIGN KEY (`Codigo_Exposicao`) REFERENCES `Exposicoes` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_Compoe_Objetos` FOREIGN KEY (`Codigo_Objetos`) REFERENCES `Objetos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Permanentes`
--
ALTER TABLE `Permanentes`
  ADD CONSTRAINT `permantentes` FOREIGN KEY (`codigo_objeto`) REFERENCES `Objetos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Pinturas`
--
ALTER TABLE `Pinturas`
  ADD CONSTRAINT `pinturas` FOREIGN KEY (`codigo_objeto`) REFERENCES `Objetos` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `Telefone`
--
ALTER TABLE `Telefone`
  ADD CONSTRAINT `FK_Telefone_Colecoes` FOREIGN KEY (`Codigo_colecoes`) REFERENCES `Colecoes` (`Codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
