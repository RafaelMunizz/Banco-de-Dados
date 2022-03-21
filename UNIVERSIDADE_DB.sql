-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 21/03/2022 às 23:37
-- Versão do servidor: 10.4.22-MariaDB
-- Versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `UNIVERSIDADE_DB`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `DEPARTAMENTO`
--

CREATE TABLE `DEPARTAMENTO` (
  `Nome` varchar(30) NOT NULL,
  `Sigla` varchar(5) DEFAULT NULL,
  `Codigo` int(11) NOT NULL,
  `Coordenador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `DEPARTAMENTO`
--

INSERT INTO `DEPARTAMENTO` (`Nome`, `Sigla`, `Codigo`, `Coordenador`) VALUES
('Tec. Telemática', 'DTT', 121, 121031),
('Tec. Construção de edifícios', 'DCE', 122, 122047),
('Licenciatura em Física', 'DLF', 123, 123040),
('Licenciatura em Matemática', 'DLM', 124, 124056),
('Eng. Computação', 'DEC', 125, 125331);

-- --------------------------------------------------------

--
-- Estrutura para tabela `DEPENDENTE`
--

CREATE TABLE `DEPENDENTE` (
  `MatricProf` int(11) NOT NULL,
  `Nome` varchar(30) NOT NULL,
  `RG` varchar(10) NOT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `DataNasc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `DEPENDENTE`
--

INSERT INTO `DEPENDENTE` (`MatricProf`, `Nome`, `RG`, `Sexo`, `DataNasc`) VALUES
(121003, 'Karla Julia', '4653148', 'F', '1990-05-22'),
(121003, 'Fabiana Catarina', '4731648', 'F', '1994-09-03'),
(121003, 'Antonio José', '4785426', 'M', '1992-07-14'),
(121031, 'Julio Cezar', '4899264', 'M', '1998-02-27'),
(122045, 'Gabriel Melo', '4125683', 'M', '2021-12-29'),
(122047, 'Maria Beatriz', '4121852', 'F', '2002-06-24'),
(123040, 'Sara Rebeka', '4725548', 'F', '2006-10-16'),
(125332, 'Kátia Marcela', '4125777', 'F', '1989-09-22'),
(125332, 'Socorro Lira', '4418759', 'F', '1987-01-08'),
(125332, 'Letícia Rebeka', '4991412', 'F', '1983-08-13'),
(125335, 'Arthur Medeiros', '4159753', 'M', '2005-11-15');

-- --------------------------------------------------------

--
-- Estrutura para tabela `EMAIL`
--

CREATE TABLE `EMAIL` (
  `MatricProf` int(11) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `EMAIL`
--

INSERT INTO `EMAIL` (`MatricProf`, `Email`) VALUES
(121003, 'pedro.silva@academico.ifpb.edu.br'),
(121031, 'jose.campos@academico.ifpb.edu.br'),
(122045, 'bento.costa@academico.ifpb.edu.br'),
(122047, 'ana.santos@academico.ifpb.edu.br'),
(123040, 'miguel.pereira@academico.ifpb.edu.br'),
(123565, 'juliana.silveira@academico.ifpb.edu.br'),
(124056, 'maria.brito@academico.ifpb.edu.br'),
(124077, 'daniela.leite@academico.ifpb.edu.br'),
(125331, 'maria.machado@academico.ifpb.edu.br'),
(125332, 'joana.pereira@academico.ifpb.edu.br'),
(125335, 'joao.cavalcanti@academico.ifpb.edu.br');

-- --------------------------------------------------------

--
-- Estrutura para tabela `PROFESSOR`
--

CREATE TABLE `PROFESSOR` (
  `Nome` varchar(30) NOT NULL,
  `SNome` varchar(50) NOT NULL,
  `Matricula` int(11) NOT NULL,
  `DataNasc` date DEFAULT NULL,
  `Sexo` enum('M','F') DEFAULT NULL,
  `Salario` decimal(7,2) DEFAULT NULL CHECK (`Salario` >= 0),
  `Matric_Coord_Area` int(11) DEFAULT NULL,
  `Depto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `PROFESSOR`
--

INSERT INTO `PROFESSOR` (`Nome`, `SNome`, `Matricula`, `DataNasc`, `Sexo`, `Salario`, `Matric_Coord_Area`, `Depto`) VALUES
('Pedro', 'Pereira da Silva', 121003, '1982-03-25', 'M', '4000.00', NULL, 121),
('José Maria', 'Campos', 121031, '1978-04-10', 'M', '7000.00', 121003, 121),
('Bento', 'Diniz Costa', 122045, '1980-11-27', 'M', '4000.00', NULL, 122),
('Ana Clara', 'Araújo Santos', 122047, '1994-12-30', 'F', '7200.00', 122045, 122),
('Miguel', 'Barbosa Pereira', 123040, '1985-07-10', 'M', '6000.00', 123040, 123),
('Juliana', 'Maria Queiroz Silveira', 123565, '1968-08-11', 'F', '5000.00', 123040, 123),
('Maria', 'Angela Brito', 124056, '1990-01-15', 'F', '8000.00', 124056, 124),
('Daniela', 'Ferreira da Costa Leite', 124077, '1989-04-08', 'F', '4000.00', 124056, 124),
('Maria Luiza', 'Machado', 125331, '1974-08-16', 'F', '6800.00', 125332, 125),
('Joana Maria', 'Pereira', 125332, '1990-06-12', 'F', '4500.00', NULL, 125),
('João Carlos', 'Matos Cavalcanti', 125335, '1976-07-22', 'M', '3700.00', 125332, 125);

-- --------------------------------------------------------

--
-- Estrutura para tabela `PROJETO`
--

CREATE TABLE `PROJETO` (
  `Nome` varchar(30) NOT NULL,
  `Codigo` int(11) NOT NULL,
  `Depto` int(11) DEFAULT NULL,
  `Duracao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `PROJETO`
--

INSERT INTO `PROJETO` (`Nome`, `Codigo`, `Depto`, `Duracao`) VALUES
('Planta de Shopping Center', 1, 122, 60),
('Redes de Transmissão', 2, 121, 30),
('Site Institucional', 3, 125, 60),
('Placas Integradas', 4, 125, 30),
('Análise de Materiais', 5, 122, 15),
('Construção de Pontes', 6, 122, 20),
('Gerador de Sinais', 7, 121, 30),
('Eletromagnetismo', 8, 123, 30),
('Algarismos e suas origens', 9, 124, 30),
('Aplicações de Big Data', 10, 125, 60),
('Sistemas Digitais', 11, 125, 50),
('Leis de Newton', 12, 123, 15),
('Gravidade e Força', 13, 123, 30);

-- --------------------------------------------------------

--
-- Estrutura para tabela `TELEFONE`
--

CREATE TABLE `TELEFONE` (
  `MatricProf` int(11) NOT NULL,
  `Telefone` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `TELEFONE`
--

INSERT INTO `TELEFONE` (`MatricProf`, `Telefone`) VALUES
(121003, '83914785236'),
(121031, '83936528977'),
(122045, '83925489665'),
(122047, '83915874236'),
(122047, '83933254489'),
(123040, '83916245732'),
(123565, '83912246885'),
(124056, '83971245933'),
(124077, '83977712438'),
(125331, '83912569874'),
(125332, '83924517891'),
(125335, '83912345678');

-- --------------------------------------------------------

--
-- Estrutura para tabela `TRABALHA_EM`
--

CREATE TABLE `TRABALHA_EM` (
  `MatricProf` int(11) NOT NULL,
  `CodProj` int(11) NOT NULL,
  `Horas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `TRABALHA_EM`
--

INSERT INTO `TRABALHA_EM` (`MatricProf`, `CodProj`, `Horas`) VALUES
(121003, 7, 3),
(121031, 2, 2),
(122045, 6, 2),
(122047, 1, 5),
(122047, 5, 1),
(123040, 8, 1),
(123040, 12, 1),
(123040, 13, 1),
(123565, 13, 2),
(124056, 9, 5),
(125331, 4, 5),
(125332, 11, 2),
(125335, 3, 2),
(125335, 10, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  ADD PRIMARY KEY (`Codigo`),
  ADD UNIQUE KEY `Sigla` (`Sigla`),
  ADD KEY `Coordenador` (`Coordenador`);

--
-- Índices de tabela `DEPENDENTE`
--
ALTER TABLE `DEPENDENTE`
  ADD PRIMARY KEY (`MatricProf`,`RG`);

--
-- Índices de tabela `EMAIL`
--
ALTER TABLE `EMAIL`
  ADD PRIMARY KEY (`MatricProf`,`Email`);

--
-- Índices de tabela `PROFESSOR`
--
ALTER TABLE `PROFESSOR`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `Matric_Coord_Area` (`Matric_Coord_Area`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices de tabela `PROJETO`
--
ALTER TABLE `PROJETO`
  ADD PRIMARY KEY (`Codigo`),
  ADD KEY `Depto` (`Depto`);

--
-- Índices de tabela `TELEFONE`
--
ALTER TABLE `TELEFONE`
  ADD PRIMARY KEY (`MatricProf`,`Telefone`);

--
-- Índices de tabela `TRABALHA_EM`
--
ALTER TABLE `TRABALHA_EM`
  ADD PRIMARY KEY (`MatricProf`,`CodProj`),
  ADD KEY `CodProj` (`CodProj`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `DEPARTAMENTO`
--
ALTER TABLE `DEPARTAMENTO`
  ADD CONSTRAINT `DEPARTAMENTO_ibfk_1` FOREIGN KEY (`Coordenador`) REFERENCES `PROFESSOR` (`Matricula`);

--
-- Restrições para tabelas `DEPENDENTE`
--
ALTER TABLE `DEPENDENTE`
  ADD CONSTRAINT `DEPENDENTE_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `PROFESSOR` (`Matricula`);

--
-- Restrições para tabelas `PROFESSOR`
--
ALTER TABLE `PROFESSOR`
  ADD CONSTRAINT `PROFESSOR_ibfk_1` FOREIGN KEY (`Matric_Coord_Area`) REFERENCES `PROFESSOR` (`Matricula`),
  ADD CONSTRAINT `PROFESSOR_ibfk_2` FOREIGN KEY (`Depto`) REFERENCES `DEPARTAMENTO` (`Codigo`);

--
-- Restrições para tabelas `PROJETO`
--
ALTER TABLE `PROJETO`
  ADD CONSTRAINT `PROJETO_ibfk_1` FOREIGN KEY (`Depto`) REFERENCES `DEPARTAMENTO` (`Codigo`);

--
-- Restrições para tabelas `TRABALHA_EM`
--
ALTER TABLE `TRABALHA_EM`
  ADD CONSTRAINT `TRABALHA_EM_ibfk_1` FOREIGN KEY (`MatricProf`) REFERENCES `PROFESSOR` (`Matricula`),
  ADD CONSTRAINT `TRABALHA_EM_ibfk_2` FOREIGN KEY (`CodProj`) REFERENCES `PROJETO` (`Codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
