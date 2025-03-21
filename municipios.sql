-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30/08/2024 às 17:49
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
-- Banco de dados: `sergipe`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `jogador`
--

CREATE TABLE `jogador` (
  `idjogador` int(11) NOT NULL,
  `nomejogador` varchar(50) NOT NULL,
  `pontuacao` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `jogador`
--

INSERT INTO `jogador` (`idjogador`, `nomejogador`, `pontuacao`, `date`, `hora`) VALUES
(1, 'oo', -303, '2024-05-09', '16:37:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `municipios`
--

CREATE TABLE `municipios` (
  `idmunicipios` int(11) NOT NULL,
  `nomemunicipio` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `municipios`
--

INSERT INTO `municipios` (`idmunicipios`, `nomemunicipio`) VALUES
(1, 'Aracaju'),
(2, 'Nossa Senhora do Socorro'),
(3, 'Itabaiana'),
(4, 'Lagarto'),
(5, 'São Cristóvão'),
(6, 'Estância'),
(7, 'Tobias Barreto'),
(8, 'Simão Dias'),
(9, 'Barra dos Coqueiros'),
(10, 'Nossa Senhora da Glória'),
(11, 'Itabaianinha'),
(12, 'Itaporanga Ajuda'),
(13, 'Poço Redondo'),
(14, 'Capela'),
(15, 'Canindé de São Francisco'),
(16, 'Propriá'),
(17, 'Porto da Folha'),
(18, 'Nossa Senhora das Dores'),
(19, 'Boquim'),
(20, 'Laranjeiras'),
(21, 'Umbaúba'),
(22, 'Poço Verde'),
(23, 'Salgado'),
(24, 'Aquidabã'),
(25, 'Carira'),
(26, 'Riachão do Dantas'),
(27, 'Campo do Brito'),
(28, 'Areia Branca'),
(29, 'Cristinápolis'),
(30, 'Ribeirópolis'),
(31, 'Indiaroba'),
(32, 'Neópolis'),
(33, 'Japaratuba'),
(34, 'Maruim'),
(35, 'Frei Paulo'),
(36, 'Monte Alegre de Sergipe'),
(37, 'Carmópolis'),
(38, 'Santa Luzia do Itanhy'),
(39, 'Japoatã'),
(40, 'Pacatuba'),
(41, 'Tomar do Geru'),
(42, 'Malhador'),
(43, 'Gararu'),
(44, 'Santo Amaro das Brotas'),
(45, 'Moita Bonita'),
(46, 'São Domingos'),
(47, 'Arauá'),
(48, 'Rosário do Catete'),
(49, 'Nossa Senhora Aparecida'),
(50, 'Ilha das Flores'),
(51, 'Riachuelo'),
(52, 'Pirambu'),
(53, 'Brejo Grande'),
(54, 'Siriri'),
(55, 'Muribeca'),
(56, 'Pedrinhas'),
(57, 'Santana do São Francisco'),
(58, 'Macambira'),
(59, 'Nossa Senhora de Lourdes'),
(60, 'Feira Nova'),
(61, 'Graccho Cardoso'),
(62, 'Pinhão'),
(63, 'Cedro de São João'),
(64, 'Itabi'),
(65, 'Divina Pastora'),
(66, 'Santa Rosa de Lima'),
(67, 'Cumbe'),
(68, 'Canhoba'),
(69, 'Malhada dos Bois'),
(70, 'São Miguel do Aleixo'),
(71, 'Telha'),
(72, 'São Francisco'),
(73, 'General Maynard'),
(74, 'Pedra Mole'),
(75, 'Amparo de São Francisco');

-- --------------------------------------------------------

--
-- Estrutura para tabela `perguntas`
--

CREATE TABLE `perguntas` (
  `idperguntas` int(11) NOT NULL,
  `municipio_idmunicipios` int(11) NOT NULL,
  `professor_idprofessor` int(11) NOT NULL,
  `pergunta` varchar(200) DEFAULT NULL,
  `respostacerta` varchar(100) DEFAULT NULL,
  `respostaerrada1` varchar(100) DEFAULT NULL,
  `respostaerrada2` varchar(100) DEFAULT NULL,
  `respostaerrada3` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `perguntas`
--

INSERT INTO `perguntas` (`idperguntas`, `municipio_idmunicipios`, `professor_idprofessor`, `pergunta`, `respostacerta`, `respostaerrada1`, `respostaerrada2`, `respostaerrada3`) VALUES
(1, 1, 1, 'Qual o nome deste município?', 'Aracaju', 'Itabaiana', 'Estância', 'São Cristóvão'),
(2, 2, 1, 'Qual o nome deste município?', 'Nossa Senhora do Socorro', 'Lagarto', 'São Domingos', 'Tomar do Geru'),
(3, 3, 1, 'Qual o nome deste município?', 'Itabaiana', 'Umbaúba', 'Carmópolis', 'Nossa Senhora de Lourdes'),
(4, 4, 1, 'Qual o nome deste município?', 'Lagarto', 'São Francisco', 'Poço Verde', 'Feira Nova'),
(5, 5, 1, 'Qual o nome deste município?', 'São Cristóvão', 'Nossa Senhora das Dores', 'Santana do São Francisco', 'Amparo de São Francisco'),
(6, 6, 1, 'Qual o nome deste município?', 'Estância', 'Brejo Grande', 'Cumbe', 'Santa Luzia do Itanhy'),
(7, 7, 1, 'Qual o nome deste município?', 'Tobias Barreto', 'Nossa Senhora Aparecida', 'Riachuelo', 'Pedra Mole'),
(8, 8, 1, 'Qual o nome deste município?', 'Simão Dias', 'Ilha das Flores', 'Cedro de São João', 'Macambira'),
(9, 9, 1, 'Qual o nome deste município?', 'Barra dos Coqueiros', 'Riachão do Dantas', 'Moita Bonita', 'Santa Rosa de Lima'),
(10, 10, 1, 'Qual o nome deste município?', 'Nossa Senhora da Glória', 'Campo do Brito', 'Ribeirópolis', 'General Maynard'),
(11, 11, 1, 'Qual o nome deste município?', 'Itabaianinha', 'Areia Branca', 'Indiaroba', 'Pedrinhas'),
(12, 12, 1, 'Qual o nome deste município?', 'Itaporanga Ajuda', 'Cristinápolis', 'Neópolis', 'Santana do São Francisco'),
(13, 13, 1, 'Qual o nome deste município?', 'Poço Redondo', 'Ribeirópolis', 'Arauá', 'Malhador'),
(14, 14, 1, 'Qual o nome deste município?', 'Capela', 'Nossa Senhora Aparecida', 'Siriri', 'Santa Rosa de Lima'),
(15, 15, 1, 'Qual o nome deste município?', 'Canindé de São Francisco', 'Ilha das Flores', 'Muribeca', 'Telha'),
(16, 16, 1, 'Qual o nome deste município?', 'Propriá', 'Campo do Brito', 'Pedrinhas', 'Canhoba'),
(17, 17, 1, 'Qual o nome deste município?', 'Porto da Folha', 'Frei Paulo', 'Japoatã', 'Santa Luzia do Itanhy'),
(18, 18, 1, 'Qual o nome deste município?', 'Nossa Senhora das Dores', 'Monte Alegre de Sergipe', 'Pacatuba', 'São Cristóvão'),
(19, 19, 1, 'Qual o nome deste município?', 'Boquim', 'Carmópolis', 'Tomar do Geru', 'Itabaianinha'),
(20, 20, 1, 'Qual o nome deste município?', 'Laranjeiras', 'Santa Luzia do Itanhy', 'Japoatã', 'São Francisco'),
(21, 21, 1, 'Qual o nome deste município?', 'Umbaúba', 'Moita Bonita', 'Ribeirópolis', 'Gararu'),
(22, 22, 1, 'Qual o nome deste município?', 'Poço Verde', 'Itaporanga Ajuda', 'Nossa Senhora da Glória', 'Siriri'),
(23, 23, 1, 'Qual o nome deste município?', 'Salgado', 'Areia Branca', 'Itabi', 'Santa Rosa de Lima'),
(24, 24, 1, 'Qual o nome deste município?', 'Aquidabã', 'Cristinápolis', 'Divina Pastora', 'Pedra Mole'),
(25, 25, 1, 'Qual o nome deste município?', 'Carira', 'Ribeirópolis', 'Amparo de São Francisco', 'Cumbe'),
(26, 26, 1, 'Qual o nome deste município?', 'Riachão do Dantas', 'Neópolis', 'Ilha das Flores', 'Santa Luzia do Itanhy'),
(27, 27, 1, 'Qual o nome deste município?', 'Campo do Brito', 'Japaratuba', 'Cedro de São João', 'Santana do São Francisco'),
(28, 28, 1, 'Qual o nome deste município?', 'Areia Branca', 'Maruim', 'Macambira', 'Moita Bonita'),
(29, 29, 1, 'Qual o nome deste município?', 'Cristinápolis', 'Frei Paulo', 'Pinhão', 'General Maynard'),
(30, 30, 1, 'Qual o nome deste município?', 'Ribeirópolis', 'Monte Alegre de Sergipe', 'São Francisco', 'Santa Rosa de Lima'),
(31, 31, 1, 'Qual o nome deste município?', 'Indiaroba', 'Carmópolis', 'Santana do São Francisco', 'Telha'),
(32, 32, 1, 'Qual o nome deste município?', 'Neópolis', 'Santa Luzia do Itanhy', 'Malhador', 'Canhoba'),
(33, 33, 1, 'Qual o nome deste município?', 'Japaratuba', 'Tomar do Geru', 'Pedra Mole', 'Feira Nova'),
(34, 34, 1, 'Qual o nome deste município?', 'Maruim', 'Malhador', 'Amparo de São Francisco', 'Gararu'),
(35, 35, 1, 'Qual o nome deste município?', 'Frei Paulo', 'Gararu', 'Cumbe', 'Santana do São Francisco'),
(36, 36, 1, 'Qual o nome deste município?', 'Monte Alegre de Sergipe', 'Santo Amaro das Brotas', 'Santa Rosa de Lima', 'Tomar do Geru'),
(37, 37, 1, 'Qual o nome deste município?', 'Carmópolis', 'Moita Bonita', 'Riachuelo', 'Malhador'),
(38, 38, 1, 'Qual o nome deste município?', 'Santa Luzia do Itanhi', 'Pacatuba', 'Santana do São Francisco', 'Japoatã'),
(39, 39, 1, 'Qual o nome deste município?', 'Japoatã', 'Itabaianinha', 'Pinhão', 'Cumbe'),
(40, 40, 1, 'Qual o nome deste município?', 'Pacatuba', 'Tomar do Geru', 'Brejo Grande', 'Santa Rosa de Lima'),
(41, 41, 1, 'Qual o nome deste município?', 'Tomar do Geru', 'Cristinápolis', 'Riachão do Dantas', 'Itabi'),
(42, 42, 1, 'Qual o nome deste município?', 'Malhador', 'Neópolis', 'Cedro de São João', 'Campo do Brito'),
(43, 43, 1, 'Qual o nome deste município?', 'Gararu', 'Moita Bonita', 'Amparo de São Francisco', 'Santa Rosa de Lima'),
(44, 44, 1, 'Qual o nome deste município?', 'Santo Amaro das Brotas', 'Ilha das Flores', 'Siriri', 'Santa Luzia do Itanhy'),
(45, 45, 1, 'Qual o nome deste município?', 'Moita Bonita', 'Campo do Brito', 'Pedrinhas', 'Canhoba'),
(46, 46, 1, 'Qual o nome deste município?', 'São Domingos', 'Japaratuba', 'Cumbe', 'Santa Luzia do Itanhy'),
(47, 47, 1, 'Qual o nome deste município?', 'Arauá', 'Carmópolis', 'Malhador', 'Cristinápolis'),
(48, 48, 1, 'Qual o nome deste município?', 'Rosário do Catete', 'Frei Paulo', 'Pinhão', 'General Maynard'),
(49, 49, 1, 'Qual o nome deste município?', 'Nossa Senhora Aparecida', 'Gararu', 'Riachuelo', 'Pedra Mole'),
(50, 50, 1, 'Qual o nome deste município?', 'Ilha das Flores', 'Malhador', 'Muribeca', 'Telha'),
(51, 51, 1, 'Qual o nome deste município?', 'Riachuelo', 'Gararu', 'Macambira', 'Moita Bonita'),
(52, 52, 1, 'Qual o nome deste município?', 'Pirambu', 'Santo Amaro das Brotas', 'Siriri', 'Santa Rosa de Lima'),
(53, 53, 1, 'Qual o nome deste município?', 'Brejo Grande', 'Moita Bonita', 'Pinhão', 'Feira Nova'),
(54, 54, 1, 'Qual o nome deste município?', 'Siriri', 'Itaporanga Ajuda', 'Amparo de São Francisco', 'Gararu'),
(55, 55, 1, 'Qual o nome deste município?', 'Muribeca', 'Tomar do Geru', 'Cumbe', 'Santana do São Francisco'),
(56, 56, 1, 'Qual o nome deste município?', 'Pedrinhas', 'Campo do Brito', 'Pedra Mole', 'Canhoba'),
(57, 57, 1, 'Qual o nome deste município?', 'Santana do São Francisco', 'Carmópolis', 'Brejo Grande', 'Itabi'),
(58, 58, 1, 'Qual o nome deste município?', 'Macambira', 'Moita Bonita', 'Riachuelo', 'Malhador'),
(59, 59, 1, 'Qual o nome deste município?', 'Nossa Senhora de Lourdes', 'Pacatuba', 'Santana do São Francisco', 'Japoatã'),
(60, 60, 1, 'Qual o nome deste município?', 'Feira Nova', 'Tomar do Geru', 'Pinhão', 'Cumbe'),
(61, 61, 1, 'Qual o nome deste município?', 'Graccho Cardoso', 'Itabaianinha', 'Cedro de São João', 'Gararu'),
(62, 62, 1, 'Qual o nome deste município?', 'Pinhão', 'Santa Luzia do Itanhy', 'Siriri', 'Santa Rosa de Lima'),
(63, 63, 1, 'Qual o nome deste município?', 'Cedro de São João', 'Campo do Brito', 'Amparo de São Francisco', 'Telha'),
(64, 64, 1, 'Qual o nome deste município?', 'Itabi', 'Neópolis', 'Muribeca', 'Canhoba'),
(65, 65, 1, 'Qual o nome deste município?', 'Divina Pastora', 'Santa Rosa de Lima', 'Brejo Grande', 'São Francisco'),
(66, 66, 1, 'Qual o nome deste município?', 'Santa Rosa de Lima', 'Moita Bonita', 'Riachuelo', 'Malhador'),
(67, 67, 1, 'Qual o nome deste município?', 'Cumbe', 'Itabaianinha', 'Pedra Mole', 'Japoatã'),
(68, 68, 1, 'Qual o nome deste município?', 'Canhoba', 'Tomar do Geru', 'Brejo Grande', 'Santa Rosa de Lima'),
(69, 69, 1, 'Qual o nome deste município?', 'Malhada dos Bois', 'Cristinápolis', 'Pinhão', 'Cumbe'),
(70, 70, 1, 'Qual o nome deste município?', 'São Miguel do Aleixo', 'Ribeirópolis', 'Pedra Mole', 'Japoatã'),
(71, 71, 1, 'Qual o nome deste município?', 'Telha', 'Nossa Senhora Aparecida', 'Brejo Grande', 'Gararu'),
(72, 72, 1, 'Qual o nome deste município?', 'São Francisco', 'Frei Paulo', 'Riachuelo', 'Moita Bonita'),
(73, 73, 1, 'Qual o nome deste município?', 'General Maynard', 'Santana do São Francisco', 'Brejo Grande', 'Cumbe'),
(74, 74, 1, 'Qual o nome deste município?', 'Pedra Mole', 'Monte Alegre de Sergipe', 'Brejo Grande', 'Canhoba'),
(75, 75, 1, 'Qual o nome deste município?', 'Amparo de São Francisco', 'Santo Amaro das Brotas', 'Brejo Grande', 'Japoatã'),
(76, 1, 1, 'Qual foi o ano de fundação de Aracaju?', '1855', '1870', '1900', '1825'),
(77, 1, 1, 'Qual é o nome do famoso mercado municipal de Aracaju?', 'Mercado Municipal Antônio Franco', 'Mercado da Cidade', 'Mercado do Bairro', 'Mercado Central'),
(78, 1, 1, 'Quem foi o primeiro prefeito de Aracaju?', 'Pedro Celestino de Rezende', 'Lauro de Freitas', 'Mendonça Prado', 'Augusto Franco'),
(79, 2, 1, 'Qual é a origem do nome \"Nossa Senhora do Socorro\"?', 'O nome \"Nossa Senhora do Socorro\" refere-se à padroeira local, Nossa Senhora do Socorro.', 'O nome foi dado em homenagem a um líder militar local.', 'É uma homenagem a um evento histórico.', 'Nome dado em referência a um lugar histórico na cidade.'),
(80, 2, 1, 'Qual foi o nome da capela que se tornou Matriz em Nossa Senhora do Socorro?', 'Nossa Senhora do Perpétuo Socorro do Tomar da Cotinguiba', 'Nossa Senhora da Conceição', 'São Francisco de Assis', 'Santa Rita de Cássia'),
(81, 2, 1, 'Qual foi a principal atividade econômica de Nossa Senhora do Socorro no início do século XVIII?', 'Plantação de mandioca e cana-de-açúcar', 'Pesca e comércio', 'Indústria têxtil', 'Mineração de ouro'),
(82, 3, 1, 'Qual foi o nome original da sede do município de Itabaiana antes da venda de terras para a Irmandade das Almas?', 'Caatinga de Ayres da Rocha', 'Arraial de Santo Antonio', 'Igreja Velha', 'Sítio de São Cristóvão'),
(83, 3, 1, 'Em que ano Itabaiana foi elevada à categoria de cidade e qual foi a resolução que formalizou essa mudança?', '1888, resolução Provincial de número 301', '1890, resolução Provincial de número 302', '1875, resolução Provincial de número 303', '1900, resolução Provincial de número 304'),
(84, 3, 1, 'Qual é a principal atividade econômica de Itabaiana e como a cidade é conhecida devido a essa atividade?', 'O comércio, conhecida como a \"capital do caminhão\"', 'A agricultura, conhecida como a \"capital da mandioca\"', 'A pecuária, conhecida como a \"capital do gado\"', 'A indústria, conhecida como a \"capital do calçado\"'),
(85, 4, 1, 'Em que ano foi criada a Vila de Nossa Senhora da Piedade do Lagarto?', '1697', '1679', '1658', '1604'),
(86, 4, 1, 'Qual a data comemorativa que celebra a identidade lagartense de acordo com a Câmara de Vereadores de Lagarto?', '20 de outubro', '11 de dezembro', '1 de janeiro', '25 de dezembro'),
(87, 4, 1, 'Qual foi a primeira sede do município de Lagarto antes da sua migração para o atual local?', 'Colina do Lagarto', 'Santo Antônio', 'Nossa Senhora da Piedade', 'Vila de Lagarto'),
(88, 5, 1, 'Qual foi a data de fundação de São Cristóvão?', '1º de janeiro de 1590', '1º de janeiro de 1600', '15 de agosto de 1590', '1º de janeiro de 1589'),
(89, 5, 1, 'São Cristóvão foi a primeira cidade de Sergipe e qual foi a quarta cidade surgida no Brasil?', 'São Cristóvão', 'Salvador', 'Rio de Janeiro', 'João Pessoa'),
(90, 5, 1, 'Qual é o nome do festival de artes que ocorre anualmente em São Cristóvão e que já realizou 37 edições?', 'Festival de Artes de São Cristóvão (FASC)', 'Festival Cultural de Sergipe', 'Carnaval dos Carnavais', 'São João da Tradição'),
(91, 6, 1, 'Em que data Pedro Homem da Costa recebeu a doação das terras onde se encontra Estância?', '16 de setembro de 1621', '1º de janeiro de 1621', '25 de outubro de 1621', '5 de março de 1621'),
(92, 6, 1, 'Qual era o nome da padroeira para a qual Pedro Homem da Costa dedicou a capela em Estância?', 'Nossa Senhora de Guadalupe', 'Nossa Senhora da Conceição', 'Santa Luzia', 'São João Batista'),
(93, 6, 1, 'Quando Estância foi elevada à categoria de cidade?', '4 de maio de 1848', '25 de outubro de 1831', '5 de março de 1835', '1º de janeiro de 1825'),
(94, 7, 1, 'Qual foi o nome original de Tobias Barreto antes de receber sua denominação atual?', 'Campos do Rio Real', 'Rio Real de Cima', 'Campos', 'Vila de Campos'),
(95, 7, 1, 'Quem foi o responsável pela fundação da cidade de Tobias Barreto?', 'Belchior Dias Moréia', 'Pedro Homem da Costa', 'Tobias Barreto de Menezes', 'João Mendes'),
(96, 7, 1, 'Qual é a entidade que consolidou o artesanato de bordados em Tobias Barreto?', 'COOPERBORDADOS', 'Associação dos Artesãos de Tobias Barreto', 'Sindicato dos Bordadores', 'Feira da Coruja'),
(97, 8, 1, 'Qual foi o nome original de Simão Dias antes de receber sua denominação atual?', 'Santana de Simão Dias', 'Rio Vasa-Barris', 'Mata da Moita', 'Campos do Rio Real'),
(98, 8, 1, 'Quando foi criada a freguesia de Sant\'Ana de Simão Dias?', '7 de fevereiro de 1834', '20 de outubro de 1718', '15 de março de 1850', '12 de junho de 1890'),
(99, 8, 1, 'Qual decreto transformou o município de Simão Dias em cidade pela primeira vez?', 'Decreto n.º 51, de 12 de junho de 1890', 'Lei n.º 621, de 25 de outubro de 1912', 'Resolução Provincial n.º 264, de 15 de março de 1850', 'Decreto n.º 43, de 8 de maio de 1890'),
(100, 9, 1, 'Qual foi a data da elevação da Capela de Nossa Senhora dos Mares da Barra dos Coqueiros à categoria de freguesia?', '10 de maio de 1875', '25 de novembro de 1953', '31 de janeiro de 1955', '27 de janeiro de 1903'),
(101, 9, 1, 'Qual a data da criação do Município de Barra dos Coqueiros?', '25 de novembro de 1953', '10 de maio de 1875', '31 de janeiro de 1955', '27 de janeiro de 1903'),
(102, 9, 1, 'Qual é a principal riqueza mineral explorada em Barra dos Coqueiros?', 'Sal marinho', 'Ouro', 'Pedra de Cal', 'Areia'),
(103, 10, 1, 'Qual era o nome da primeira povoação na região que hoje corresponde a Nossa Senhora da Glória?', 'Boca da Mata', 'Gararu', 'Vila Glória', 'Serra Tabanga'),
(104, 10, 1, 'Quando foi criada a vila de Nossa Senhora da Glória, desmembrada do município de Gararu?', '26 de setembro de 1928', '6 de fevereiro de 1922', '1º de janeiro de 1929', '15 de março de 1850'),
(105, 10, 1, 'Quem foi o primeiro intendente de Nossa Senhora da Glória após sua elevação à vila?', 'João Francisco de Souza', 'Francisco Gonçalves Lima', 'Tomé da Rocha Malheiros', 'Carvalho Lima Júnior'),
(106, 11, 1, 'Qual foi o nome dado à localidade que deu origem a Itabaianinha devido ao seu aspecto topográfico semelhante à Itabaiana Grande?', 'Itabaianinha', 'Nova Tomar do Geru', 'Tomar de Geru', 'Serra do Geru'),
(107, 11, 1, 'Em que ano Itabaianinha foi elevada à condição de vila?', '1832', '1835', '1909', '1932'),
(108, 11, 1, 'Qual foi a sede do município de Itabaianinha antes de ser transferida para a povoação de Itabaianinha?', 'Nova Tomar do Geru', 'Itabaiana Grande', 'Tomar de Geru', 'Serra do Geru'),
(109, 12, 1, 'Qual era o nome da aldeia fundada pelo padre Gaspar Lourenço que não deu origem ao município de Itaporanga D’Ajuda?', 'Santo Inácio', 'São Cristóvão', 'Santa Maria', 'São João'),
(110, 12, 1, 'Quando Itaporanga foi transformada em freguesia com o nome de Nossa Senhora D’Ajuda?', '30 de janeiro de 1845', '10 de maio de 1854', '1º de janeiro de 1949', '28 de março de 1938'),
(111, 12, 1, 'Qual foi a denominação adotada pelo município de Itaporanga em 1944, de acordo com a legislação federal que proibia duplicidade de nomes?', 'Irapiranga', 'São Cristóvão', 'Santa Maria', 'Itaporanga do Sul'),
(112, 13, 1, 'Em que local do município de Poço Redondo o cangaceiro Lampião foi morto?', 'Grota de Angicos', 'Fazenda Belmonte', 'Fazenda Cajueiro', 'Povoado Curralinho'),
(113, 13, 1, 'Qual era o nome do povoado que deu origem ao município de Poço Redondo?', 'Poço Redondo', 'Curralinho', 'Poço de Cima', 'Santa Rosa do Ermírio'),
(114, 13, 1, 'Qual é a principal atividade econômica de Santa Rosa do Ermírio, distrito de Poço Redondo?', 'Produção de leite', 'Cultivo de algodão', 'Extração de minérios', 'Turismo ecológico'),
(115, 14, 1, 'Qual era o nome da capela construída por Luís de Andrade Pacheco em 1735?', 'Capela de Nossa Senhora da Purificação', 'Capela de São Pedro', 'Capela de Santo Antônio', 'Capela de São Francisco'),
(116, 14, 1, 'Qual foi o principal fator que impulsionou o desenvolvimento econômico de Capela no início do século XX?', 'A mecanização da indústria açucareira', 'A descoberta de petróleo', 'A construção de uma nova ferrovia', 'O turismo religioso'),
(117, 14, 1, 'Em que ano Capela foi elevada à categoria de cidade?', '1888', '1901', '1914', '1935'),
(118, 15, 1, 'Qual era o nome original do município de Canindé de São Francisco antes de ser renomeado pela Lei nº 890 de 1958?', 'Canindé', 'Curituba', 'Porto da Folha', 'São Francisco'),
(119, 15, 1, 'Quem foi o responsável por transformar o curtume de couro em uma indústria mecanizada em Canindé?', 'Francisco Cardoso de Britto Chaves', 'Antônio Gomes Ferrão Castelo Branco', 'D. João de Souza', 'Cristóvão Burgos'),
(120, 15, 1, 'Em que ano Canindé de São Francisco foi elevado à condição de cidade?', '1955', '1938', '1899', '1936'),
(121, 16, 1, 'Qual era o nome original de Propriá antes de ser elevada a Sede de Freguesia em 1718?', 'Urubu de Baixo', 'Santo Antônio', 'Vila-Nova do São Francisco', 'São Francisco'),
(122, 16, 1, 'Em que data foi instalada a Vila de Propriá com a construção de um pelourinho?', '7 de fevereiro de 1802', '18 de outubro de 1718', '5 de setembro de 1801', '21 de fevereiro de 1866'),
(123, 16, 1, 'Qual era a posição econômica de Propriá em relação a outras cidades do Estado de Sergipe antes da década de 1970?', 'Era a segunda cidade mais rica do Estado', 'Era a terceira cidade mais rica do Estado', 'Era a primeira cidade mais rica do Estado', 'Era a quarta cidade mais rica do Estado'),
(124, 17, 1, 'Qual era o nome da sede do município de Porto da Folha antes de se fixar na fazenda Curral do Buraco?', 'Boa Vista', 'Ilha de São Pedro', 'Porto Principal', 'Curral de Pedras'),
(125, 17, 1, 'Quando o município de Porto da Folha foi finalmente elevado à categoria de cidade?', '11 de novembro de 1896', '7 de fevereiro de 1802', '23 de março de 1870', '16 de abril de 1875'),
(126, 17, 1, 'Qual era o nome da sede do município antes de se chamar Porto da Folha, que foi estabelecido pela Lei nº 194 de 11 de fevereiro de 1896?', 'Nossa Senhora do Porto da Folha', 'Ilha do Ouro', 'São Pedro do Porto da Folha', 'Curral das Pedras'),
(127, 18, 1, 'Qual foi o nome original do município de Nossa Senhora das Dores antes de receber o nome definitivo?', 'Enforcados', 'Sergipe', 'Japaratuba', 'Capela'),
(128, 18, 1, 'Quando foi fundado oficialmente o município de Nossa Senhora das Dores?', '23 de outubro de 1920', '11 de junho de 1859', '28 de abril de 1858', '04 de outubro de 1606'),
(129, 18, 1, 'Qual evento influenciou a mudança de nome do povoado para Nossa Senhora das Dores?', 'A pregação de um missionário', 'A criação de gado', 'Conflitos com índios nativos', 'Uma carta de um juiz de paz'),
(130, 19, 1, 'Qual foi o nome original da localidade que mais tarde se tornou o município de Boquim?', 'Lagoa Vermelha', 'Boquinha da Mata', 'Santa Maria', 'São João'),
(131, 19, 1, 'Quando o município de Boquim foi elevado à categoria de município?', '16 de outubro de 1926', '21 de março de 1870', '27 de janeiro de 1976', '10 km da cidade atual'),
(132, 19, 1, 'Qual é a principal atividade econômica de Boquim desde a década de 1920?', 'Citricultura', 'Pecuária', 'Avicultura', 'Comércio de tecidos'),
(133, 20, 1, 'Qual foi o nome original do povoado que mais tarde se tornou a cidade de Laranjeiras?', 'Vila de Nossa Senhora do Socorro', 'Porto das Laranjeiras', 'Retiro', 'Comandaroba'),
(134, 20, 1, 'Qual importante construção foi realizada pelos jesuítas em Laranjeiras em 1731?', 'Igreja de Nossa Senhora da Conceição da Comandaroba', 'Igreja de São Pedro', 'Igreja do Retiro', 'Convento de São Francisco'),
(135, 20, 1, 'Por que Laranjeiras não se tornou a capital de Sergipe, apesar de sua grande importância?', 'Uma manobra política do Barão de Maruim', 'A construção da Igreja de Nossa Senhora da Conceição da Comandaroba', 'A invasão holandesa', 'A falta de desenvolvimento econômico'),
(136, 21, 1, 'Qual foi a principal atividade econômica que impulsionou o início da fundação do município de Umbaúba?', 'Criação de gado', 'Cultivo de cana-de-açúcar', 'Mineração de ouro', 'Produção de café'),
(137, 21, 1, 'Qual era o nome original do riacho que se localizava na Fazenda Sabiá e que foi renomeado para Dois Riachos?', 'Riacho da Guia', 'Riacho do Sol', 'Riacho do Sertão', 'Riacho das Águas Claras'),
(138, 21, 1, 'Em que data foi criado o Distrito de Umbaúba, marcando o início de sua trajetória como município?', '16 de outubro de 1926', '2 de março de 1938', '6 de fevereiro de 1954', '10 de dezembro de 1889'),
(139, 22, 1, 'Qual era o nome original da fazenda que deu origem ao município de Poço Verde?', 'Fazenda Poço Verde', 'Fazenda Rio Real', 'Fazenda Santa Cruz', 'Fazenda Campos'),
(140, 22, 1, 'Em que ano Poço Verde foi elevado à categoria de vila?', '2 de março de 1938', '25 de novembro de 1953', '1 de julho de 1960', '7 de dezembro de 1944'),
(141, 22, 1, 'Quando Poço Verde foi oficialmente elevado à categoria de cidade?', '25 de novembro de 1953', '2 de março de 1938', '1 de fevereiro de 1955', '7 de dezembro de 1944'),
(142, 23, 1, 'Qual foi o nome da povoação que deu origem ao município de Salgado?', 'Pau Ferro ou Salgadinho', 'Estância', 'Boquim', 'Lagarto'),
(143, 23, 1, 'Em que ano Salgado foi elevado à categoria de município?', '1927', '1911', '1938', '1950'),
(144, 23, 1, 'Qual foi o ano em que a sede de Salgado passou à categoria de cidade?', '1938', '1927', '1940', '1950'),
(145, 24, 1, 'Qual foi o nome original da povoação que deu origem ao município de Aquidabã?', 'Cemitério', 'Santa Cruz', 'Pau Ferro', 'São João'),
(146, 24, 1, 'Em que ano o município de Aquidabã foi criado?', '1882', '1870', '1900', '1927'),
(147, 24, 1, 'Qual é a padroeira de Aquidabã, conforme a história local?', 'Sant’Ana', 'São João', 'Santa Cruz', 'São Francisco'),
(148, 25, 1, 'Qual era o nome original da região que mais tarde se tornou o município de Carira?', 'Mãe Carira', 'Barra Larga', 'Rio do Peixe', 'Cícero Dantas'),
(149, 25, 1, 'Qual evento histórico levou ao início do povoamento da região que se tornaria Carira?', 'A construção de uma feira por João Martins', 'A descoberta de ouro', 'A guerra com os índios', 'A fundação de um convento'),
(150, 25, 1, 'Em que ano Carira foi oficialmente elevado à categoria de município?', '1953', '1938', '1945', '1960'),
(151, 26, 1, 'Qual foi a origem do nome do município de Riachão do Dantas?', 'Fazenda Riachão, pertencente a João Martins Fontes', 'O nome de um chefe indígena', 'Nome de um rio da região', 'Uma referência ao fundador do município'),
(152, 26, 1, 'Qual foi a principal atividade econômica na região de Riachão do Dantas durante o período colonial?', 'Criação de gado e engenhos de açúcar', 'Mineração de ouro', 'Cultivo de café', 'Produção de tecidos'),
(153, 26, 1, 'Em que ano foi criada uma cadeira de primeiras letras para as meninas na Vila do Riachão?', '1848', '1836', '1854', '1860'),
(154, 27, 1, 'Qual foi a data de emancipação política de Campo do Brito?', '29 de outubro de 1912', '1 de janeiro de 1910', '15 de agosto de 1912', '10 de março de 1911'),
(155, 27, 1, 'Quem foi o primeiro prefeito eleito de Campo do Brito após sua emancipação?', 'Padre Francisco Freire de Menezes', 'Arnóbio Baptista de Souza', 'Emeliano Ribeiro', 'Osvaldo Lemos de Almeida'),
(156, 27, 1, 'Qual foi a principal ação do prefeito Graciliano Apolônio da Fonseca em Campo do Brito?', 'Colocação de energia elétrica e abastecimento de água potável', 'Construção de escolas e hospitais', 'Abertura de estradas e melhorias no comércio', 'Reforma da Igreja Matriz e construção de praças'),
(157, 28, 1, 'Qual é a origem do nome \"Areia Branca\"?', 'Pela cor do solo da povoação', 'Pela abundância de areia na região', 'Em homenagem a um antigo proprietário de terras', 'Pela brancura das casas na cidade'),
(158, 28, 1, 'Quem foram os fundadores da povoação que deu origem ao município de Areia Branca?', 'Juviniano Freire de Oliveira e Virgílio Rodrigues do Nascimento', 'José Ferreira Neto e Juviniano Freire de Oliveira', 'Virgílio Rodrigues do Nascimento e José Ferreira Neto', 'Juviniano Freire de Oliveira e José Ferreira Neto'),
(159, 28, 1, 'Em que data Areia Branca foi elevado à categoria de município?', '11 de novembro de 1963', '1 de janeiro de 1963', '15 de agosto de 1963', '25 de dezembro de 1963'),
(160, 29, 1, 'Qual foi o nome original de Cristinápolis antes de se tornar município?', 'Chapada', 'Vila Cristina', 'São Francisco de Assis', 'Chapada dos Índios'),
(161, 29, 1, 'Qual foi a data de emancipação política de Cristinápolis?', '24 de abril de 1882', '12 de abril de 1878', '4 de março de 1882', '28 de março de 1938'),
(162, 29, 1, 'Em homenagem a quem Cristinápolis foi chamada de Vila Cristina?', 'A imperatriz do Brasil, Dona Tereza Cristina', 'A um famoso explorador europeu', 'A um líder indígena local', 'A um santo português'),
(163, 30, 1, 'Qual era o nome de Ribeirópolis antes de sua emancipação?', 'Saco do Ribeiro', 'Chapada do Ribeiro', 'Vila Ribeirão', 'Santa Maria do Ribeiro'),
(164, 30, 1, 'Quando Ribeirópolis foi emancipado?', '18 de dezembro de 1933', '4 de março de 1882', '7 de dezembro de 1944', '28 de março de 1938'),
(165, 30, 1, 'Qual é o nome da igreja que teve ajuda significativa dos moradores na construção?', 'Igreja do Sagrado Coração de Jesus', 'Igreja de São Francisco de Assis', 'Igreja de Nossa Senhora da Conceição', 'Igreja de Santo Antônio'),
(166, 31, 1, 'Qual era o nome de Indiaroba antes de ser elevado a Freguesia pelo Lei no 65 de 6 de março de 1841?', 'Espírito Santo', 'Feira da Ilha', 'Terra do Divino Espírito Santo', 'Santa Luzia do Rio Real'),
(167, 31, 1, 'Qual foi a data de emancipação política de Indiaroba?', '28 de março de 1938', '18 de dezembro de 1933', '7 de dezembro de 1944', '4 de março de 1882'),
(168, 31, 1, 'Quem foi o primeiro Prefeito de Indiaroba após sua emancipação?', 'Antônio Ramos da Silva', 'Manoel Joaquim de Santana', 'Pedro Magro', 'José Gilson dos Santos'),
(169, 32, 1, 'Qual é o evento de rua considerado o segundo melhor carnaval do mundo, realizado em Neópolis?', 'Carnaval de Neópolis', 'Carnaval de Olinda', 'Carnaval de Salvador', 'Carnaval de Recife'),
(170, 32, 1, 'Qual é o nome da fortaleza construída por Maurício de Nassau em Neópolis?', 'Forte Keer de Koe', 'Forte São João', 'Forte São Francisco', 'Forte de Nossa Senhora'),
(171, 32, 1, 'Qual é a segunda igreja mais antiga do Estado de Sergipe localizada em Neópolis?', 'Igreja de Nossa Senhora do Rosário', 'Igreja de São João Batista', 'Igreja de Santo Antônio', 'Igreja de São Francisco de Assis'),
(172, 33, 1, 'Qual é a principal festividade tradicional de Japaratuba?', 'Festa das Cabacinhas', 'Festa do Divino Espírito Santo', 'Festa de São João', 'Festa de Nossa Senhora da Saúde'),
(173, 33, 1, 'Qual é o ponto mais elevado da cidade de Japaratuba?', 'Alto do Lavradio', 'Serra do Leste', 'Morro da Boa Vista', 'Colina da Igreja'),
(174, 33, 1, 'Qual é a principal construção histórica que se destaca em Japaratuba, visível desde a BR-101?', 'Igreja Matriz de Nossa Senhora da Saúde', 'Igreja de São Francisco', 'Igreja de Santo Antônio', 'Igreja de São João Batista'),
(175, 34, 1, 'Qual é a origem do nome \"Maruim\"?', 'O termo tupi mberu\'i, que significa \'mosca pequena\'', 'O termo indígena \"marujin\", que significa \"pequena vila\"', 'O termo africano \"maru\", que significa \"pequeno rio\"', 'O termo espanhol \"marina\", que significa \"pequena praia\"'),
(176, 34, 1, 'O que foi o Empório de Sergipe em Maruim?', 'Um centro comercial que foi muito importante devido às plantações de cana-de-açúcar e algodão', 'Um edifício governamental que administrava o estado', 'Uma fortificação militar durante a colonização', 'Um centro de produção de peças de arte sacra'),
(177, 34, 1, 'Quando Maruim foi emancipada e elevada à categoria de cidade?', '19 de fevereiro de 1835', '15 de agosto de 1828', '22 de março de 1840', '10 de junho de 1852'),
(178, 35, 1, 'Quem foi o missionário que deu início à fundação de Frei Paulo?', 'Frei Paulo de Casa Nova', 'Frei Davi de Umbértide', 'Frei João da Silva', 'Frei Antônio de Oliveira'),
(179, 35, 1, 'Em que data o arraial de São Paulo foi elevado à categoria de Vila?', '25 de janeiro de 1890', '19 de abril de 1886', '23 de outubro de 1920', '2 de março de 1938'),
(180, 35, 1, 'Quando Frei Paulo foi rebatizado em homenagem ao seu fundador?', '2 de março de 1938', '23 de outubro de 1920', '25 de janeiro de 1890', '19 de abril de 1886'),
(181, 36, 1, 'Quem fundou o primeiro núcleo populacional de Monte Alegre de Sergipe?', 'José Inácio de Farias', 'Tomás Bermudes', 'Antônio Machado Cabelê', 'Januário da Costa Farias'),
(182, 36, 1, 'Qual era o principal produto usado como presente na Semana Santa em Monte Alegre de Sergipe?', 'Requeijão do Sertão', 'Queijo coalho', 'Café', 'Manteiga'),
(183, 36, 1, 'Quando Monte Alegre de Sergipe foi elevado à categoria de cidade?', '25 de novembro de 1953', '31 de janeiro de 1955', '15 de agosto de 1945', '1 de janeiro de 1960'),
(184, 37, 1, 'Qual foi o nome primitivo de Carmópolis?', 'Rancho', 'Carmo', 'Japaratuba', 'Rosário'),
(185, 37, 1, 'Quando foi criado o município de Carmópolis?', '23 de outubro de 1920', '1 de janeiro de 1923', '7 de novembro de 1921', '31 de dezembro de 1943'),
(186, 37, 1, 'Qual foi o nome do município de Carmópolis antes de sua mudança para o nome atual?', 'Carmo', 'Rosário', 'Rancho', 'Japaratuba'),
(187, 38, 1, 'Qual foi a primeira missa celebrada em Santa Luzia do Itanhi assistida por?', 'Índios tupinambás', 'Índios Guaranis', 'Colonizadores portugueses', 'Padres franciscanos'),
(188, 38, 1, 'Em que ano Santa Luzia do Itanhi foi elevada à categoria de Vila?', '1698', '1575', '1750', '1800'),
(189, 38, 1, 'Qual era o nome do município antes de ser chamado Santa Luzia do Itanhi?', 'Inajaroba', 'Santa Luzia', 'Vila Real de Santa Luzia', 'São Tomé'),
(190, 39, 1, 'Qual era o nome da igreja fundada pelos jesuítas em Jaboatão?', 'Nossa Senhora das Agonias', 'São Tomé', 'Santa Luzia', 'São Francisco'),
(191, 39, 1, 'Qual foi a data em que Jaboatão foi promovido à categoria de município pela Lei nº 583?', '23 de novembro de 1910', '1 de janeiro de 1911', '15 de agosto de 1910', '5 de março de 1912'),
(192, 39, 1, 'Qual foi o nome de Jaboatão alterado para Japoatã?', 'Lei Estadual nº 525-A de 25 de novembro de 1953', 'Decreto-Lei nº 69 de 20 de outubro de 1926', 'Lei nº 583 de 23 de novembro de 1910', 'Decreto-Lei nº 377 de 31 de dezembro de 1943'),
(193, 40, 1, 'Qual é a localização geográfica de Pacatuba em relação a Aracaju?', '116 km ao norte de Aracaju', '50 km ao sul de Aracaju', '200 km ao leste de Aracaju', '75 km ao oeste de Aracaju'),
(194, 40, 1, 'Qual é o nome do cacique que comandava o povoado na confluência do Rio Poxim do Norte com o Betume?', 'Cacique Pacatuba', 'Cacique Serigy', 'Cacique Baepeba', 'Cacique Siriry'),
(195, 40, 1, 'Qual era a relação dos índios Tupinambás com os franceses antes da chegada dos portugueses a Pacatuba?', 'Uma relação comercial', 'Uma relação hostil', 'Uma relação amistosa sem comércio', 'Os Tupinambás eram neutros em relação aos franceses'),
(196, 41, 1, 'Qual era o nome original da povoação que se tornou Tomar do Geru?', 'Geru', 'Nova Távora', 'Santa Luzia', 'São Miguel'),
(197, 41, 1, 'O que foi estabelecido pela Carta Régia de 22 de novembro de 1758 para o território Sergipano?', 'A liberdade dos índios e a criação da Vila de Tomar', 'A escravização dos índios e a fundação de uma nova colônia portuguesa', 'A anexação de todos os territórios ao estado da Bahia', 'A criação de um novo distrito militar'),
(198, 41, 1, 'Qual foi a razão para a extinção da Vila de Tomar em 1808?', 'Foi extinta e anexada à Vila de Itabaianinha', 'Foi renomeada para Nova Távora', 'Foi transformada em um distrito de Aracaju', 'Foi dividida em duas vilas independentes'),
(199, 42, 1, 'Qual era o principal produto agrícola de Malhador, conhecido por sua relevância econômica?', 'Inhame', 'Cana-de-açúcar', 'Algodão', 'Café'),
(200, 42, 1, 'Em que ano foi iniciada a construção da igreja de Malhador, e quem foi o responsável por esse início?', '1933, Padre João Marinho de Souza', '1920, Padre Manoel José de Oliveira', '1940, Lúcio Pedreiro', '1953, Zé de Beata'),
(201, 42, 1, 'Qual é a data comemorativa de emancipação política de Malhador?', '25 de novembro', '1 de agosto', '15 de setembro', '12 de outubro'),
(202, 43, 1, 'Qual era o nome original de Gararu antes da mudança para a denominação atual?', 'Curral de Pedras', 'São Francisco', 'Pedra do Sertão', 'Riacho da Pedra'),
(203, 43, 1, 'Qual foi a principal razão para a mudança de nome de Curral de Pedras para Gararu?', 'Em homenagem ao Riacho Gararu', 'Para refletir a nova economia local', 'Para prestigiar o Rio São Francisco', 'Em reconhecimento aos colonos portugueses'),
(204, 43, 1, 'Quando foi sancionada a Resolução que elevou Curral de Pedras à categoria de vila?', '15 de março de 1877', '28 de março de 1857', '6 de maio de 1882', '18 de abril de 1888'),
(205, 44, 1, 'Qual era o nome da povoação que deu origem ao município de Santo Amaro das Brotas?', 'Porto das Redes', 'Porto Seguro', 'Santo Amaro do Maroim', 'Porto Alegre'),
(206, 44, 1, 'Quando Santo Amaro das Brotas foi elevado à categoria de cidade?', '1938', '1783', '1835', '1943'),
(207, 44, 1, 'Em qual ano o município de Santo Amaro das Brotas foi renomeado para seu nome atual?', '1943', '1938', '1835', '1960'),
(208, 45, 1, 'Qual foi o nome do antigo povoado que originou o município de Moita Bonita?', 'Alto do Coqueiro', 'Alto da Serra', 'Baixa do Coqueiro', 'Pico do Coqueiro'),
(209, 45, 1, 'Quando Moita Bonita foi oficialmente elevada à categoria de município?', '1963', '1957', '1835', '1970'),
(210, 45, 1, 'Qual era o nome da capela construída pelos primeiros habitantes de Moita Bonita?', 'Santa Terezinha', 'Santa Clara', 'São João Batista', 'Nossa Senhora das Dores'),
(211, 46, 1, 'Qual foi o nome da feira que originou a vila de São Domingos?', 'Feira da Pindoba', 'Feira do Sapucaia', 'Feira de Lagarto', 'Feira do Vaza-Barris'),
(212, 46, 1, 'Em que ano São Domingos foi oficialmente elevado à categoria de município?', '1963', '1957', '1970', '1945'),
(213, 46, 1, 'Qual era a principal atividade econômica de São Domingos no início do século XX?', 'Produção de farinha de mandioca', 'Extração de petróleo', 'Cultivo de café', 'Produção de açúcar'),
(214, 47, 1, 'Qual foi o nome original da povoação que deu origem ao município de Arauá?', 'Nossa Senhora da Conceição da Parida', 'Arraial da Parida', 'Arraial de Arauá', 'Nossa Senhora da Conceição de Arauá'),
(215, 47, 1, 'Em que ano Arauá foi elevado à categoria de cidade?', '1938', '1920', '1945', '1950'),
(216, 47, 1, 'Qual era a principal atividade econômica da região de Arauá durante o século XIX?', 'Produção de açúcar', 'Criação de gado', 'Cultivo de café', 'Produção de algodão'),
(217, 48, 1, 'Qual foi o nome da capela que deu origem à primeira povoação de Rosário do Catete?', 'Nossa Senhora do Rosário', 'Nossa Senhora da Conceição', 'Santa Terezinha', 'São Sebastião'),
(218, 48, 1, 'Em que ano Rosário do Catete foi elevado à categoria de cidade?', '1932', '1920', '1940', '1950'),
(219, 48, 1, 'Qual foi a mudança toponímica mais recente do município de Rosário do Catete?', 'Passar a se chamar Rosário do Catete', 'Passar a se chamar Rosário', 'Passar a se chamar Nossa Senhora do Rosário', 'Passar a se chamar Catete'),
(220, 49, 1, 'Qual era o nome original do município de Nossa Senhora Aparecida antes da mudança de nome em 24 de dezembro de 1975?', 'Cruz das Graças', 'Cruz do Cavalcante', 'Santa Cruz', 'Maniçoba'),
(221, 49, 1, 'Quem foi o principal responsável pelo desenvolvimento do povoado Cruz do Cavalcante no final do século XIX?', 'Cavalcante', 'Chico Ceará', 'Joaquim José de Góis', 'José Brasil'),
(222, 49, 1, 'Em que data foi assinada a Lei nº 165 que transferiu a sede do Município de Cruz das Graças para o povoado Maniçoba?', '24 de dezembro de 1975', '12 de outubro de 1975', '1 de janeiro de 1976', '15 de novembro de 1975'),
(223, 50, 1, 'Qual era o nome original de Ilha das Flores antes da sua denominação atual?', 'Ilha dos Bois', 'Ilha da Boa Vista', 'Arraial de Santo Antônio', 'Cajuípe de Cima'),
(224, 50, 1, 'Quem foi o responsável pela transformação de Ilha das Flores em povoado e, posteriormente, em vila?', 'Luiz Ferreira Lisboa', 'Manuel Ricardo', 'Agripino do Aracaré', 'Santo Antônio'),
(225, 50, 1, 'Qual foi o evento que marcou o fim da administração dos padres jesuítas em Ilha das Flores?', 'Expulsão pelas tropas portuguesas', 'Venda das terras', 'Doação ao Santo Antônio', 'Mudança de nome para Arraial de Santo Antônio'),
(226, 51, 1, 'Qual é a origem do nome Riachuelo?', 'Em homenagem à Batalha Naval do Riachuelo', 'Em função dos três rios que cercam o município', 'Em homenagem a um antigo proprietário de terras', 'Devido à riqueza do município na produção de açúcar'),
(227, 51, 1, 'Qual foi o evento significativo que ocorreu em 6 de maio de 1872 em Riachuelo?', 'Transformação do povoado Pintos em Freguesia de Nossa Senhora da Conceição do Riachuelo', 'Fundação do município', 'Inauguração da primeira ferrovia', 'Declínio econômico do município'),
(228, 51, 1, 'Qual é o nome do monumento tombado pelo IPHAN em Riachuelo e sua importância histórica?', 'Capela de Nossa Senhora da Conceição do Antigo Engenho da Penha', 'Igreja de São Benedito', 'Capela de Santana', 'Casa Grande dos Pintos'),
(229, 52, 1, 'Qual é a origem do nome \"Pirambu\" segundo algumas fontes?', 'Do nome de um peixe comum na região', 'Do nome de um chefe indígena', 'De uma cidade vizinha', 'Do nome de um rio local'),
(230, 52, 1, 'Qual foi o evento significativo para a emancipação de Pirambu em 26 de novembro de 1963?', 'A sanção do projeto de lei que elevava o povoado à categoria de município', 'A construção da igreja em homenagem a Nossa Senhora de Lourdes', 'A fundação da colônia de pescadores', 'A instalação da primeira casa comercial'),
(231, 52, 1, 'Quem foi o primeiro prefeito de Pirambu após sua emancipação?', 'João Dória do Nascimento', 'Manuel Amaral Lemos', 'Abelardo do Nascimento', 'José Lauro Ferreira'),
(232, 53, 1, 'Qual foi a origem da Ilha de Paraúna antes de ser doada a Antônio Cristóvão de Barros em 1590?', 'Era habitada pelos índios Tupinambás', 'Era uma colônia portuguesa', 'Era uma base militar espanhola', 'Era um centro comercial francês'),
(233, 53, 1, 'Em que ano o povoado de Brejo Grande foi elevado à categoria de cidade com o nome de São Francisco?', '1926', '1824', '1943', '1954'),
(234, 53, 1, 'Qual foi a última alteração no nome do município de Brejo Grande antes de retornar ao nome atual?', 'Parapitinga', 'São Francisco', 'Vila Nova', 'Neópolis'),
(235, 54, 1, 'Qual foi o nome da aldeia indígena onde os primeiros habitantes de Siriri se estabeleceram?', 'Remanso', 'Pé do Banco', 'Japaratuba', 'São Francisco'),
(236, 54, 1, 'Em que ano foi criada a vila de Japaratuba, que incluía a área de Pé do Banco?', '1811', '1700', '1839', '1874'),
(237, 54, 1, 'Qual foi a principal atividade econômica de Siriri antes da descoberta de petróleo no subsolo?', 'Cultivo de cana-de-açúcar', 'Pecuária', 'Extração de ouro', 'Pesca'),
(238, 55, 1, 'Qual era o nome original do município de Muribeca?', 'Sítio do Meio', 'Várzea da Onça', 'Visgueiro', 'Propriá'),
(239, 55, 1, 'Quando Sítio do Meio foi elevado à categoria de vila e passou a pertencer juridicamente a Capela?', '1926', '1921', '1938', '1897'),
(240, 55, 1, 'Qual foi o primeiro prefeito da cidade de Muribeca após sua elevação à categoria de cidade?', 'Carlos Camélio Costa', 'João Batista de Almeida', 'Manoel Almeida Figueiredo', 'Francisco Xavier de Figueiredo'),
(241, 56, 1, 'Qual era o nome do engenho que deu origem ao nome da cidade de Pedrinhas?', 'Engenho Pedrinhas', 'Engenho Baixão', 'Engenho São Francisco', 'Engenho Cachoeira'),
(242, 56, 1, 'Em que ano Pedrinhas foi emancipado e se tornou um município?', '1953', '1955', '1913', '1926'),
(243, 56, 1, 'Qual era a principal atividade econômica de Pedrinhas antes da construção da ferrovia?', 'Pecuária e citricultura', 'Agricultura de grãos', 'Pesca e comércio', 'Extração de madeira'),
(244, 57, 1, 'Qual foi o nome do povoado que deu origem ao município de Santana do São Francisco?', 'Carrapicho', 'São Francisco', 'São Bento', 'Santana'),
(245, 57, 1, 'Qual foi o motivo principal para a criação do município de Santana do São Francisco em 1964?', 'Emancipação política do povoado Carrapicho', 'Construção de uma usina de açúcar', 'Desenvolvimento de um projeto de colonização', 'Instalação de uma cooperativa de cerâmica'),
(246, 57, 1, 'Quem foi o responsável pela construção da primeira igreja Matriz de Santana do São Francisco?', 'Messias da Silva Passos', 'José Feliciano Passos', 'Antônio Mathias Barroso', 'Senhor Zuza'),
(247, 58, 1, 'Qual planta deu origem ao nome do município de Macambira?', 'Macambira', 'Cajueiro', 'Bananeira', 'Cana-de-açúcar'),
(248, 58, 1, 'Quando Macambira foi elevado à categoria de município?', '1953', '1896', '1921', '1943'),
(249, 58, 1, 'Qual foi o nome do homem que criou uma feirinha em Macambira no final do século XIX?', 'Ioiô Rodrigues', 'José da Silva', 'Manuel de Andrade', 'Antônio Pereira'),
(250, 59, 1, 'Qual foi o nome original do lugar onde se fundou o município de Nossa Senhora de Lourdes?', 'Lagoa das Antas', 'Escurial', 'Arraial de Antas', 'Lagoa do Monte'),
(251, 59, 1, 'Qual foi o motivo para a mudança do nome de Antas para Nossa Senhora de Lourdes?', 'A intervenção do cônego Lauro de Souza Fraga', 'Um erro de embalagem de uma imagem', 'Uma decisão do bispo Dom Palmeira Lessa', 'A criação da Diocese de Propriá'),
(252, 59, 1, 'Quando foi inaugurada a nova Igreja Matriz de Nossa Senhora de Lourdes?', '7 de outubro de 1990', '12 de maio de 1989', '10 de abril de 1977', '2 de dezembro de 1917'),
(253, 60, 1, 'Qual foi o motivo inicial para a criação da feira em Feira Nova?', 'Evitar que os habitantes fossem atacados por cangaceiros ao frequentarem outros municípios', 'A necessidade de aumentar a renda dos comerciantes locais', 'A falta de feiras em toda a região', 'Uma decisão do governo estadual para desenvolver a região'),
(254, 60, 1, 'Quem foram os principais responsáveis pela criação da feira em Feira Nova?', 'José Alves de Queiroz (Fifio) e José Lino de Souza', 'Domingos Dias de Souza e José Alves de Queiroz', 'Domingos Dias de Souza e José Lino de Souza', 'José Lino de Souza e comerciantes locais'),
(255, 60, 1, 'Qual era a data de início da feira em Feira Nova?', '12 de março de 1939', '1 de janeiro de 1940', '15 de abril de 1938', '20 de março de 1939'),
(256, 61, 1, 'Qual era o nome antigo do município de Graccho Cardoso?', 'Tamanduá', 'Cruz do Agostinho', 'Moita do Tamanduá', 'Nossa Senhora da Piedade'),
(257, 61, 1, 'Qual foi o nome da capela demolida em 1925 em Graccho Cardoso?', 'Capela de Nossa Senhora da Piedade', 'Capela de Santo Antônio', 'Capela de São Francisco', 'Capela de São José'),
(258, 61, 1, 'Quando o município de Tamanduá foi elevado à categoria de cidade?', '6 de fevereiro de 1955', '25 de novembro de 1953', '30 de abril de 1958', '1 de julho de 1950'),
(259, 62, 1, 'Quem foi o responsável pela demarcação das terras que deram origem ao município de Pinhão em 1889?', 'Engenheiro Militar José Calazans', 'Cootchaux Ettinger', 'Gabriel Ettinger', 'José de Alencar'),
(260, 62, 1, 'Qual foi o nome da capela construída na povoação de Pinhão?', 'Capela de São José', 'Capela de Nossa Senhora da Piedade', 'Capela de Santo Antônio', 'Capela de São Francisco'),
(261, 62, 1, 'Quando o povoado de Pinhão foi elevado à categoria de cidade?', '30 de janeiro de 1955', '25 de novembro de 1953', '12 de março de 1939', '1 de janeiro de 1960'),
(262, 63, 1, 'Quem foi o fundador da localidade que mais tarde viria a se tornar o município de Cedro de São João?', 'Antônio Nunes', 'Gabriel Ettinger', 'José Alves de Queiroz', 'Manoel da Rocha'),
(263, 63, 1, 'Qual foi o nome da localidade que foi elevada à categoria de Vila pela Lei Estadual nº 83, de 23 de outubro de 1894?', 'Cedro de São João', 'Darcilena', 'Tamanduá', 'São Francisco'),
(264, 63, 1, 'Em que ano o município de Cedro de São João mudou seu nome de \"Darcilena\" para o atual nome?', '1954', '1928', '1938', '1944'),
(265, 64, 1, 'Qual foi o nome dado ao local onde se ergueu a primeira capela de Itabi?', 'Lagoa das Panelas', 'Pedra da Paciência', 'Fazenda Bela Vista', 'Capela da Providência'),
(266, 64, 1, 'Em que ano Itabi foi elevado à categoria de vila?', '1944', '1936', '1953', '1954'),
(267, 64, 1, 'Qual foi o nome original do município de Itabi antes de receber esse nome em 1944?', 'Nossa Senhora da Providência', 'Lagoa das Panelas', 'Pedra da Paciência', 'Fazenda Bela Vista'),
(268, 65, 1, 'Qual era o nome da capela que foi a primeira sede do município de Divina Pastora?', 'Capela de São Gonçalo', 'Capela de Jesus, Maria e José', 'Capela de Nossa Senhora da Conceição', 'Capela de Santo Amaro'),
(269, 65, 1, 'Qual foi o nome original do município de Divina Pastora antes de ser elevado à categoria de vila?', 'Ladeira', 'Siriri', 'Pé do Banco', 'Santo Amaro das Brotas'),
(270, 65, 1, 'Quando Divina Pastora foi elevada à categoria de cidade?', '15 de novembro de 1938', '12 de março de 1836', '18 de fevereiro de 1700', '1 de janeiro de 1900'),
(271, 66, 1, 'Qual era o nome original da povoação que mais tarde se tornou Santa Rosa de Lima?', 'Presa', 'Santa Rosa', 'Camboatá', 'Divina Pastora'),
(272, 66, 1, 'Qual foi a nova denominação dada à Vila Santa Rosa pelo Decreto Lei Estadual nº 377 de 1943?', 'Camboatá', 'Santa Rosa de Lima', 'Divina Pastora', 'Presa'),
(273, 66, 1, 'Quando foi criado o Município de Camboatá, que posteriormente teve seu nome alterado para Santa Rosa de Lima?', '25 de novembro de 1953', '31 de dezembro de 1943', '26 de outubro de 1884', '15 de novembro de 1938'),
(274, 67, 1, 'Quando o Cumbe foi elevado à categoria de cidade dentro do município de Nossa Senhora das Dores?', '11 de junho de 1859', '4 de outubro de 1606', '25 de novembro de 1953', '31 de janeiro de 1955'),
(275, 67, 1, 'Quem foi o principal defensor da emancipação política de Cumbe e qual era seu cargo?', 'Cloves de Faro Rollemberg, deputado estadual', 'Antonio Gomes de Moraes, prefeito', 'Manoel Zacarias, marchante', 'Leandro Maciel, vereador'),
(276, 67, 1, 'Qual era a principal atividade econômica de Cumbe antes da crise causada pelas pragas no algodão?', 'Produção de algodão', 'Criação de gado', 'Produção de feijão', 'Extração de madeira'),
(277, 68, 1, 'Qual é o significado do nome \"Canhoba\" em tupi?', 'Folhas escondidas', 'Águas profundas', 'Montanhas altas', 'Florestas densas'),
(278, 68, 1, 'Qual foi a mudança de nome que ocorreu em Canhoba no início do século XX?', 'Mudança do nome de \"Baixa do Canhoba\" para \"Canhoba\"', 'Mudança do nome de \"Curral de Barro\" para \"Canhoba\"', 'Mudança do nome de \"Nossa Senhora da Conceição\" para \"Canhoba\"', 'Mudança do nome de \"Povoado de Itabi\" para \"Canhoba\"'),
(279, 68, 1, 'Quem foi um filho ilustre de Canhoba que se destacou como governador do Estado de Sergipe?', 'Erônides de Carvalho', 'Antonio Ferreira de Carvalho', 'Temistocles da Rocha Torres', 'Manoel José da Rocha Torres'),
(280, 69, 1, 'Qual foi o papel da boiada do major João Aguiar Bota de Melo na formação de Malhada dos Bois?', 'Serviu como ponto de parada para descanso e alimentação', 'Era usada para o transporte de mercadorias para o exterior', 'Foi a principal fonte de trabalho para a população local', 'Era uma atração turística da região'),
(281, 69, 1, 'Quando o território de Malhada dos Bois passou a compor a Freguesia de Aquidabã?', 'Em 11 de abril de 1872', 'Em 8 de outubro de 1926', 'Em 25 de novembro de 1953', 'Em 31 de janeiro de 1955'),
(282, 69, 1, 'Qual foi o principal produto da economia local de Malhada dos Bois no final do século XIX?', 'Algodão', 'Café', 'Cana-de-açúcar', 'Cacau'),
(283, 70, 1, 'Qual era o nome da cidade antes de se tornar São Miguel do Aleixo?', 'Lagoa do Aleixo', 'Lagoa da Esperança', 'Lagoa do Nordeste', 'Lagoa do Sertão'),
(284, 70, 1, 'Quando foi fundado oficialmente o município de São Miguel do Aleixo?', '26 de novembro de 1963', '1 de janeiro de 1964', '15 de agosto de 1962', '10 de março de 1965'),
(285, 70, 1, 'Quais são as principais atividades econômicas de São Miguel do Aleixo?', 'Agricultura e criação de bovinos', 'Indústria têxtil e turismo', 'Mineração e produção de energia', 'Tecnologia da informação e comércio eletrônico'),
(286, 71, 1, 'Qual foi a principal razão para a escolha do nome \"Telha\" para o município?', 'A presença de uma fábrica de telhas de barro cozido estabelecida por duas famílias de holandeses', 'A abundância de telhas no mercado local', 'Uma fábrica de telhas de cerâmica estabelecida por imigrantes portugueses', 'A fabricação de telhas como produto principal da economia local'),
(287, 71, 1, 'Quando foi oficialmente criado o município de Telha?', '20 de janeiro de 1964', '15 de março de 1962', '1 de agosto de 1965', '10 de setembro de 1963'),
(288, 71, 1, 'Qual é uma das principais atividades econômicas de Telha além da rizicultura?', 'Piscicultura', 'Mineração de pedras preciosas', 'Produção de têxteis', 'Fabricação de móveis de madeira'),
(289, 72, 1, 'Qual foi o nome original do município de São Francisco antes de sua mudança?', 'Jacaré', 'Galante', 'Caldas', 'Cedro'),
(290, 72, 1, 'Qual é o nome do padroeiro de São Francisco?', 'São Francisco de Assis', 'São João Batista', 'São Pedro', 'São Antônio'),
(291, 72, 1, 'Quando foi inaugurada a luz elétrica a motor em São Francisco?', '1951', '1945', '1956', '1963'),
(292, 73, 1, 'Qual era o nome original do município de General Maynard antes de sua emancipação?', 'Marcação', 'Japaratuba', 'Rosário do Catete', 'Campo Redondo'),
(293, 73, 1, 'Quem foi o nomeado para homenagear o município de General Maynard?', 'Augusto Maynard Gomes', 'João de Deus', 'Antônio Caldas', 'José Manoel Freire Filho'),
(294, 73, 1, 'Qual é uma das principais festas tradicionais de General Maynard?', 'Festa do Cruzeiro', 'Festa do Padroeiro', 'Festa da Cana-de-Açúcar', 'Festa do Peixe');
INSERT INTO `perguntas` (`idperguntas`, `municipio_idmunicipios`, `professor_idprofessor`, `pergunta`, `respostacerta`, `respostaerrada1`, `respostaerrada2`, `respostaerrada3`) VALUES
(295, 74, 1, 'Quem foi o responsável pela primeira incursão na área territorial de Pedra Mole?', 'Manoel Alves da Silva', 'Gootchaux Ettinger', 'Gabriel Lazar Ettinger', 'Augusto Maynard Gomes'),
(296, 74, 1, 'Em que ano a família Ettinger fundou uma fábrica de beneficiamento de algodão na região de Pedra Mole?', '1890', '1700', '1920', '1800'),
(297, 74, 1, 'Qual é uma das versões sobre a origem do nome Pedra Mole?', 'Alguns moradores encontraram pedras com marcas de patas de animais e disseram que as pedras eram mol', 'Foi nomeado em homenagem a uma cidade francesa.', 'Foi nomeado por um político local.', 'Era um ponto de encontro de tropeiros e viajantes.'),
(298, 75, 1, 'Quem doou terras para a construção da igreja dedicada a Nossa Senhora do Amparo em Amparo de São Francisco?', 'João da Cruz Freire', 'Capitão Antonio Rodrigues da Costa Dória', 'Epaminondas Freire', 'Martins Dias Guimarães'),
(299, 75, 1, 'Qual foi o principal motivo para a elevação do povoado Amparo à categoria de município?', 'A luta de políticos locais para a emancipação política do povoado', 'A chegada de uma nova estrada asfaltada', 'A construção de uma nova escola', 'A instalação de uma fábrica de algodão'),
(300, 75, 1, 'Qual evento histórico envolveu a invasão de Amparo de São Francisco por membros do bando de Lampião?', 'A tentativa de sequestro de Franklin Freire pelo bando de Lampião', 'A invasão de uma fábrica de algodão', 'A construção da primeira escola no município', 'A visita de um político influente');


-- --------------------------------------------------------

--
-- Estrutura para tabela `professor`
--

CREATE TABLE `professor` (
  `idprofessor` int(11) NOT NULL,
  `cpf` char(14) DEFAULT NULL,
  `senha` varchar(14) DEFAULT NULL,
  `nomeprofessor` varchar(50) DEFAULT NULL,
  `perfil` int(11) NOT NULL DEFAULT 1 CHECK (`perfil` in (0,1)),
  `ativo` int(11) NOT NULL DEFAULT 0 CHECK (`ativo` in (0,1))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professor`
--

INSERT INTO `professor` (`idprofessor`, `cpf`, `senha`, `nomeprofessor`, `perfil`, `ativo`) VALUES
(1, '078.700.115-50', '1234', 'Roberto', 1, 1),
(2, '111.111.111-11', '1111', '1111', 0, 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`idjogador`);

--
-- Índices de tabela `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`idmunicipios`);

--
-- Índices de tabela `perguntas`
--
ALTER TABLE `perguntas`
  ADD PRIMARY KEY (`idperguntas`),
  ADD KEY `municipio_idmunicipios` (`municipio_idmunicipios`),
  ADD KEY `professor_idprofessor` (`professor_idprofessor`);

--
-- Índices de tabela `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`idprofessor`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `jogador`
--
ALTER TABLE `jogador`
  MODIFY `idjogador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `municipios`
--
ALTER TABLE `municipios`
  MODIFY `idmunicipios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perguntas`
--
ALTER TABLE `perguntas`
  MODIFY `idperguntas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professor`
--
ALTER TABLE `professor`
  MODIFY `idprofessor` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `perguntas`
--
ALTER TABLE `perguntas`
  ADD CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`municipio_idmunicipios`) REFERENCES `municipios` (`idmunicipios`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
