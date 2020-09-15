-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Sep 2020 um 13:19
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `personaldaten`
--
CREATE DATABASE IF NOT EXISTS `personaldaten` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `personaldaten`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `firmendaten`
--

CREATE TABLE `firmendaten` (
  `id` int(11) NOT NULL,
  `firmenname` varchar(50) COLLATE utf8_bin NOT NULL,
  `abteilung` varchar(50) COLLATE utf8_bin NOT NULL,
  `berufsbezeichnung` varchar(50) COLLATE utf8_bin NOT NULL,
  `berufsbeschreibung` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `firmendaten`
--

INSERT INTO `firmendaten` (`id`, `firmenname`, `abteilung`, `berufsbezeichnung`, `berufsbeschreibung`) VALUES
(3, 'Accenture', 'IT', '', ''),
(4, 'Accenture', 'Medien', 'KV', ''),
(6, 'Accenture', 'Administration', 'KV', ''),
(7, 'Accenture', 'Marketing', 'Kaufmann/frau', 'Ein/e Kaufmann/frau');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `personaldaten`
--

CREATE TABLE `personaldaten` (
  `id` int(11) NOT NULL,
  `nachname` varchar(50) COLLATE utf8_bin NOT NULL,
  `vorname` varchar(50) COLLATE utf8_bin NOT NULL,
  `geburtstag` date NOT NULL,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `ahv_nr` varchar(50) COLLATE utf8_bin NOT NULL,
  `personal_nr` int(3) NOT NULL,
  `telefon` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fk_firmendaten` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `personaldaten`
--

INSERT INTO `personaldaten` (`id`, `nachname`, `vorname`, `geburtstag`, `email`, `ahv_nr`, `personal_nr`, `telefon`, `fk_firmendaten`) VALUES
(37, 'Widmer', 'Nathan', '2001-09-12', 'nate.a.widmer@gmail.com', '7283.283.213.233', 1, '0792947099', 3),
(38, 'Blattmann', 'Sina', '2000-07-22', 'sina@gmail.com', '2122.348.342.332', 2, '0792631711', 3),
(46, 'Holzmann', 'Muster', '2000-07-22', 'muster@gmail.com', '776.9384.358.330', 6, '', 4),
(47, 'Black', 'Sebastian', '2000-07-03', 'black@gmail.com', '776.9384.352.333', 4, '', 3);

--
-- Trigger `personaldaten`
--
DELIMITER $$
CREATE TRIGGER `after_insert_user` AFTER INSERT ON `personaldaten` FOR EACH ROW INSERT INTO protokoll
 SET email = NEW.email,
     funktion = 'INSERT'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_delete_user` BEFORE DELETE ON `personaldaten` FOR EACH ROW INSERT INTO protokoll
 SET email = OLD.email,
     funktion = 'DELETE'
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_user` BEFORE UPDATE ON `personaldaten` FOR EACH ROW INSERT INTO protokoll
 SET email = OLD.email,
     funktion = 'UPDATE'
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `protokoll`
--

CREATE TABLE `protokoll` (
  `id` int(11) NOT NULL,
  `datum` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) COLLATE utf8_bin NOT NULL,
  `funktion` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `protokoll`
--

INSERT INTO `protokoll` (`id`, `datum`, `email`, `funktion`) VALUES
(1, '2020-09-10 15:49:33', 'zollinger@gmail.com', 'UPDATE'),
(2, '2020-09-10 16:11:30', 'nate.a.widmer@gmail.com', 'UPDATE'),
(3, '2020-09-10 16:12:10', 'muster@gmail.com', 'INSERT'),
(4, '2020-09-10 16:12:35', 'max@gmail.com', 'DELETE'),
(5, '2020-09-10 16:32:32', 'zollinger@gmail.com', 'UPDATE'),
(6, '2020-09-11 14:23:26', 'holz@gmail.com', 'DELETE'),
(7, '2020-09-11 14:23:44', 'muster@gmail.com', 'UPDATE'),
(8, '2020-09-11 14:25:02', 'black@gmail.com', 'INSERT'),
(9, '2020-09-11 15:13:21', 'zollinger@gmail.com', 'UPDATE'),
(10, '2020-09-11 15:13:34', 'black@gmail.com', 'UPDATE'),
(11, '2020-09-11 15:14:55', 'zollinger@gmail.com', 'DELETE'),
(12, '2020-09-11 15:15:13', 'nate.a.widmer@gmail.com', 'UPDATE');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `firmendaten`
--
ALTER TABLE `firmendaten`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `abteilung` (`abteilung`);

--
-- Indizes für die Tabelle `personaldaten`
--
ALTER TABLE `personaldaten`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ahv_nr` (`ahv_nr`,`personal_nr`),
  ADD UNIQUE KEY `personal_nr` (`personal_nr`),
  ADD UNIQUE KEY `ahv_nr_2` (`ahv_nr`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `ahv_nr_3` (`ahv_nr`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `fk_firmendaten` (`fk_firmendaten`);

--
-- Indizes für die Tabelle `protokoll`
--
ALTER TABLE `protokoll`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `firmendaten`
--
ALTER TABLE `firmendaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `personaldaten`
--
ALTER TABLE `personaldaten`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `protokoll`
--
ALTER TABLE `protokoll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `personaldaten`
--
ALTER TABLE `personaldaten`
  ADD CONSTRAINT `fk_firmendaten` FOREIGN KEY (`fk_firmendaten`) REFERENCES `firmendaten` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
