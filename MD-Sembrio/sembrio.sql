-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 03, 2018 at 09:02 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sembrio`
--

-- --------------------------------------------------------

--
-- Table structure for table `cosechas`
--

CREATE TABLE `cosechas` (
  `COSID` int(11) NOT NULL,
  `COSFECHA` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fertilizaciones`
--

CREATE TABLE `fertilizaciones` (
  `FERID` int(11) NOT NULL,
  `SENID` int(11) NOT NULL,
  `FERCANTIDAD` decimal(8,0) NOT NULL,
  `FERTEMPMED` decimal(8,0) NOT NULL,
  `FERFECHAHORA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reportes`
--

CREATE TABLE `reportes` (
  `REPID` int(11) NOT NULL,
  `RIEID` int(11) NOT NULL,
  `COSID` int(11) NOT NULL,
  `FERID` int(11) NOT NULL,
  `REPFECHAHORA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `riegos`
--

CREATE TABLE `riegos` (
  `RIEID` int(11) NOT NULL,
  `SENID` int(11) NOT NULL,
  `RIECANTIDAD` decimal(8,0) NOT NULL,
  `RIEHUMMED` decimal(8,0) NOT NULL,
  `RIEFECHAHORA` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sensores`
--

CREATE TABLE `sensores` (
  `SENID` int(11) NOT NULL,
  `SENTIPO` char(2) NOT NULL,
  `SENDESCRIPCION` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sensores`
--

INSERT INTO `sensores` (`SENID`, `SENTIPO`, `SENDESCRIPCION`) VALUES
(1, 'HS', 'Humedad del suelo'),
(2, 'TS', 'Temperatura del suelo'),
(3, 'HA', 'Humedad del aire');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cosechas`
--
ALTER TABLE `cosechas`
  ADD PRIMARY KEY (`COSID`);

--
-- Indexes for table `fertilizaciones`
--
ALTER TABLE `fertilizaciones`
  ADD PRIMARY KEY (`FERID`),
  ADD KEY `FK_RELATIONSHIP_2` (`SENID`);

--
-- Indexes for table `reportes`
--
ALTER TABLE `reportes`
  ADD PRIMARY KEY (`REPID`),
  ADD KEY `FK_RELATIONSHIP_4` (`COSID`),
  ADD KEY `FK_RELATIONSHIP_5` (`FERID`),
  ADD KEY `FK_RELATIONSHIP_6` (`RIEID`);

--
-- Indexes for table `riegos`
--
ALTER TABLE `riegos`
  ADD PRIMARY KEY (`RIEID`),
  ADD KEY `FK_RELATIONSHIP_3` (`SENID`);

--
-- Indexes for table `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`SENID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cosechas`
--
ALTER TABLE `cosechas`
  MODIFY `COSID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fertilizaciones`
--
ALTER TABLE `fertilizaciones`
  MODIFY `FERID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reportes`
--
ALTER TABLE `reportes`
  MODIFY `REPID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `riegos`
--
ALTER TABLE `riegos`
  MODIFY `RIEID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sensores`
--
ALTER TABLE `sensores`
  MODIFY `SENID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fertilizaciones`
--
ALTER TABLE `fertilizaciones`
  ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`SENID`) REFERENCES `sensores` (`SENID`);

--
-- Constraints for table `reportes`
--
ALTER TABLE `reportes`
  ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`COSID`) REFERENCES `cosechas` (`COSID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`FERID`) REFERENCES `fertilizaciones` (`FERID`),
  ADD CONSTRAINT `FK_RELATIONSHIP_6` FOREIGN KEY (`RIEID`) REFERENCES `riegos` (`RIEID`);

--
-- Constraints for table `riegos`
--
ALTER TABLE `riegos`
  ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`SENID`) REFERENCES `sensores` (`SENID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
