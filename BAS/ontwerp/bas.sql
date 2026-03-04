-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 04 mrt 2026 om 14:29
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bas`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `artikelen`
--

CREATE TABLE `artikelen` (
  `ArtikelID` int(11) NOT NULL,
  `ArtikelNaam` varchar(100) DEFAULT NULL,
  `Prijs` decimal(10,2) DEFAULT NULL,
  `Voorraad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `artikelen`
--

INSERT INTO `artikelen` (`ArtikelID`, `ArtikelNaam`, `Prijs`, `Voorraad`) VALUES
(1, 'Melk 1L', 1.29, 100),
(2, 'Brood Volkoren', 2.19, 50),
(3, 'Eieren 12 stuks', 3.49, 40),
(4, 'Appels 1kg', 2.99, 60),
(5, 'Kipfilet 500g', 5.99, 30),
(6, 'Pasta 500g', 0.99, 80),
(7, 'Tomatensaus', 1.49, 70),
(8, 'Cola 1.5L', 2.09, 90),
(9, 'Boter 250g', 2.59, 45),
(10, 'Yoghurt 1L', 1.89, 55);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klanten`
--

CREATE TABLE `klanten` (
  `KlantID` int(11) NOT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefoon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `klanten`
--

INSERT INTO `klanten` (`KlantID`, `Voornaam`, `Achternaam`, `Email`, `Telefoon`) VALUES
(1, 'Jan', 'Jansen', 'jan.jansen@email.nl', '0612345678'),
(2, 'Piet', 'Pieters', 'piet.pieters@email.nl', '0623456789'),
(3, 'Klaas', 'De Vries', 'klaas.devries@email.nl', '0634567890');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `verkooporders`
--

CREATE TABLE `verkooporders` (
  `OrderID` int(11) NOT NULL,
  `KlantID` int(11) DEFAULT NULL,
  `ArtikelID` int(11) DEFAULT NULL,
  `Aantal` int(11) DEFAULT NULL,
  `OrderDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `artikelen`
--
ALTER TABLE `artikelen`
  ADD PRIMARY KEY (`ArtikelID`);

--
-- Indexen voor tabel `klanten`
--
ALTER TABLE `klanten`
  ADD PRIMARY KEY (`KlantID`);

--
-- Indexen voor tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `KlantID` (`KlantID`),
  ADD KEY `ArtikelID` (`ArtikelID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `artikelen`
--
ALTER TABLE `artikelen`
  MODIFY `ArtikelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT voor een tabel `klanten`
--
ALTER TABLE `klanten`
  MODIFY `KlantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `verkooporders`
--
ALTER TABLE `verkooporders`
  ADD CONSTRAINT `verkooporders_ibfk_1` FOREIGN KEY (`KlantID`) REFERENCES `klanten` (`KlantID`),
  ADD CONSTRAINT `verkooporders_ibfk_2` FOREIGN KEY (`ArtikelID`) REFERENCES `artikelen` (`ArtikelID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
