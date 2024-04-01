-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 01.04.2024 klo 14:57
-- Palvelimen versio: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sakke`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakas`
--

CREATE TABLE `asiakas` (
  `astunnus` char(6) NOT NULL,
  `asnimi` char(20) NOT NULL,
  `yhteyshlo` char(15) DEFAULT NULL,
  `postinro` char(5) DEFAULT NULL,
  `postitmp` char(10) DEFAULT NULL,
  `asvuosi` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `asiakas`
--

INSERT INTO `asiakas` (`astunnus`, `asnimi`, `yhteyshlo`, `postinro`, `postitmp`, `asvuosi`) VALUES
('ITPRO', 'IT-Profes', 'Ojala', '90100', 'Oulu', 2010),
('MANNIN', 'Manninen', 'Jokinen', '90100', 'Oulu', 2006),
('MASI', 'MasiYards', 'Oja', '20100', 'Turku', 2008),
('NASI', 'Nasi Oy', NULL, '33700', 'Tampere', 2009),
('NUUKIA', 'Nuukia Ky', 'Aro', '90100', 'Oulu', 2011),
('SARA', 'Sara Oy', 'Herva', '00100', 'Helsinki', 2009),
('TELE', 'Tele Oy', NULL, '00100', 'Helsinki', 2011);

-- --------------------------------------------------------

--
-- Rakenne taululle `tilaus`
--

CREATE TABLE `tilaus` (
  `tilausnro` int(11) NOT NULL,
  `astunnus` char(6) NOT NULL,
  `tilauspvm` datetime NOT NULL,
  `tapa` char(1) NOT NULL,
  `tila` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tilaus`
--

INSERT INTO `tilaus` (`tilausnro`, `astunnus`, `tilauspvm`, `tapa`, `tila`) VALUES
(100, 'MANNIN', '2008-09-19 00:00:00', 'L', 'M'),
(101, 'MASI', '2008-11-11 00:00:00', 'V', 'M'),
(102, 'SARA', '2009-02-12 00:00:00', 'L', 'M'),
(202, 'MASI', '2011-02-10 00:00:00', 'V', 'M'),
(206, 'NASI', '2011-04-13 00:00:00', 'V', 'L'),
(207, 'ITPRO', '2011-09-15 00:00:00', 'L', 'T'),
(208, 'NUUKIA', '2011-10-10 00:00:00', 'V', NULL),
(209, 'MASI', '2011-10-20 00:00:00', 'L', NULL);

-- --------------------------------------------------------

--
-- Rakenne taululle `tilausrivi`
--

CREATE TABLE `tilausrivi` (
  `tilausnro` int(11) NOT NULL,
  `rivinro` smallint(6) NOT NULL,
  `tuotenro` int(11) DEFAULT NULL,
  `kpl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tilausrivi`
--

INSERT INTO `tilausrivi` (`tilausnro`, `rivinro`, `tuotenro`, `kpl`) VALUES
(100, 1, 1, 50),
(100, 2, 4, 115),
(101, 1, 3, 200),
(101, 2, 2, 150),
(101, 3, 2, 10),
(102, 1, 1, 15),
(102, 2, 4, 10),
(202, 1, 2, 100),
(202, 2, 3, 100),
(206, 1, 2, 30),
(206, 2, 6, 40),
(207, 1, 2, 17),
(208, 1, 2, 400),
(209, 1, 2, 50),
(209, 2, 3, 50),
(209, 3, 6, 50);

-- --------------------------------------------------------

--
-- Rakenne taululle `tuote`
--

CREATE TABLE `tuote` (
  `tuotenro` int(11) NOT NULL,
  `tuotenimi` char(20) NOT NULL,
  `hinta` decimal(5,2) DEFAULT NULL,
  `kustannus` decimal(5,2) DEFAULT NULL,
  `trnro` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tuote`
--

INSERT INTO `tuote` (`tuotenro`, `tuotenimi`, `hinta`, `kustannus`, `trnro`) VALUES
(1, 'Silkkisolmio', 15.00, 6.00, 11),
(2, 'Kuksa', 28.00, 14.50, 13),
(3, 'Puukko', 27.00, 19.60, 13),
(4, 'Silkkihuivi', 20.00, 12.30, 11),
(5, 'Paperiveitsi', 16.00, 7.40, 14),
(6, 'Lompakko', 31.00, 24.85, 12),
(7, 'Kukkaro', 16.00, NULL, 12);

-- --------------------------------------------------------

--
-- Rakenne taululle `tuoteryhma`
--

CREATE TABLE `tuoteryhma` (
  `trnro` smallint(6) NOT NULL,
  `trnimi` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vedos taulusta `tuoteryhma`
--

INSERT INTO `tuoteryhma` (`trnro`, `trnimi`) VALUES
(11, 'Asusteet'),
(12, 'Laukut'),
(13, 'Talous'),
(14, 'Toimisto');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asiakas`
--
ALTER TABLE `asiakas`
  ADD PRIMARY KEY (`astunnus`),
  ADD UNIQUE KEY `asnimi_un` (`asnimi`);

--
-- Indexes for table `tilaus`
--
ALTER TABLE `tilaus`
  ADD PRIMARY KEY (`tilausnro`),
  ADD KEY `tilaus_asiakas_fk` (`astunnus`);

--
-- Indexes for table `tilausrivi`
--
ALTER TABLE `tilausrivi`
  ADD PRIMARY KEY (`tilausnro`,`rivinro`),
  ADD KEY `tilausrivi_tuote_fk` (`tuotenro`);

--
-- Indexes for table `tuote`
--
ALTER TABLE `tuote`
  ADD PRIMARY KEY (`tuotenro`),
  ADD UNIQUE KEY `tuotenimi_un` (`tuotenimi`),
  ADD KEY `tuote_ryhma_fk` (`trnro`);

--
-- Indexes for table `tuoteryhma`
--
ALTER TABLE `tuoteryhma`
  ADD PRIMARY KEY (`trnro`);

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `tilaus`
--
ALTER TABLE `tilaus`
  ADD CONSTRAINT `tilaus_asiakas_fk` FOREIGN KEY (`astunnus`) REFERENCES `asiakas` (`astunnus`);

--
-- Rajoitteet taululle `tilausrivi`
--
ALTER TABLE `tilausrivi`
  ADD CONSTRAINT `tilausrivi_tuote_fk` FOREIGN KEY (`tuotenro`) REFERENCES `tuote` (`tuotenro`);

--
-- Rajoitteet taululle `tuote`
--
ALTER TABLE `tuote`
  ADD CONSTRAINT `tuote_ryhma_fk` FOREIGN KEY (`trnro`) REFERENCES `tuoteryhma` (`trnro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
