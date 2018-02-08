-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 08, 2018 at 02:15 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `novaz`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `userLogin` (IN `username` VARCHAR(45), IN `mypasswords` VARCHAR(45))  NO SQL
BEGIN
	SELECT * 
    FROM tableUser
    WHERE Username= username
    AND myPassword = mypasswords;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Follower`
--

CREATE TABLE `Follower` (
  `idFollower` int(11) NOT NULL,
  `telenovaID` int(11) DEFAULT NULL,
  `novaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tableContent`
--

CREATE TABLE `tableContent` (
  `idtableContent` int(11) NOT NULL,
  `tableContentcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tableDashboard`
--

CREATE TABLE `tableDashboard` (
  `idtableDashboard` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Datecreated` datetime DEFAULT NULL,
  `novaID` int(11) DEFAULT NULL,
  `idtableContent` int(11) DEFAULT NULL,
  `URL` varchar(45) DEFAULT NULL,
  `fb` varchar(45) DEFAULT NULL,
  `youtubeurl` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tableNova`
--

CREATE TABLE `tableNova` (
  `novaID` int(11) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `Password` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Profile` varchar(45) DEFAULT NULL,
  `Facebook` varchar(45) DEFAULT NULL,
  `Youtube` varchar(45) DEFAULT NULL,
  `WhatsaAPP` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tableUser`
--

CREATE TABLE `tableUser` (
  `telenovaID` int(11) NOT NULL,
  `Username` varchar(45) DEFAULT NULL,
  `myPassword` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tableUser`
--

INSERT INTO `tableUser` (`telenovaID`, `Username`, `myPassword`, `Email`) VALUES
(1, '111', '111', 'kejrekjrkejr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Follower`
--
ALTER TABLE `Follower`
  ADD PRIMARY KEY (`idFollower`),
  ADD KEY `fk_Follower_1_idx` (`telenovaID`),
  ADD KEY `fk_Follower_2_idx` (`novaID`);

--
-- Indexes for table `tableContent`
--
ALTER TABLE `tableContent`
  ADD PRIMARY KEY (`idtableContent`);

--
-- Indexes for table `tableDashboard`
--
ALTER TABLE `tableDashboard`
  ADD PRIMARY KEY (`idtableDashboard`),
  ADD KEY `fk_tableDashboard_1_idx` (`novaID`),
  ADD KEY `fk_tableDashboard_2_idx` (`idtableContent`);

--
-- Indexes for table `tableNova`
--
ALTER TABLE `tableNova`
  ADD PRIMARY KEY (`novaID`);

--
-- Indexes for table `tableUser`
--
ALTER TABLE `tableUser`
  ADD PRIMARY KEY (`telenovaID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Follower`
--
ALTER TABLE `Follower`
  MODIFY `idFollower` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableContent`
--
ALTER TABLE `tableContent`
  MODIFY `idtableContent` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableDashboard`
--
ALTER TABLE `tableDashboard`
  MODIFY `idtableDashboard` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableNova`
--
ALTER TABLE `tableNova`
  MODIFY `novaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableUser`
--
ALTER TABLE `tableUser`
  MODIFY `telenovaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Follower`
--
ALTER TABLE `Follower`
  ADD CONSTRAINT `fk_Follower_1` FOREIGN KEY (`telenovaID`) REFERENCES `tableUser` (`telenovaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Follower_2` FOREIGN KEY (`novaID`) REFERENCES `tableNova` (`novaID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tableDashboard`
--
ALTER TABLE `tableDashboard`
  ADD CONSTRAINT `fk_tableDashboard_1` FOREIGN KEY (`novaID`) REFERENCES `tableNova` (`novaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tableDashboard_2` FOREIGN KEY (`idtableContent`) REFERENCES `tableContent` (`idtableContent`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
