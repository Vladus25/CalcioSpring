-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 24, 2023 alle 17:31
-- Versione del server: 10.4.27-MariaDB
-- Versione PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `calciospring`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `giocatori`
--

CREATE TABLE `giocatori` (
  `id` int(11) NOT NULL,
  `data_n` date NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `ruolo` varchar(50) NOT NULL,
  `id_squadra` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `giocatori`
--

INSERT INTO `giocatori` (`id`, `data_n`, `cognome`, `nome`, `ruolo`, `id_squadra`) VALUES
(1, '1990-02-10', 'Ronaldo', 'Cristiano', 'Attaccante', 1),
(2, '1993-05-20', 'Pellegrini', 'Lorenzo', 'Centrocampista', 2),
(3, '1995-09-03', 'Donnarumma', 'Gianluigi', 'Portiere', 3),
(4, '1992-11-08', 'Insigne', 'Lorenzo', 'Attaccante', 4),
(5, '1997-03-23', 'Lukaku', 'Romelu', 'Attaccante', 5),
(6, '1991-06-15', 'Gomez', 'Alejandro', 'Centrocampista', 6),
(7, '1994-07-17', 'Locatelli', 'Manuel', 'Centrocampista', 7),
(8, '1996-04-09', 'Orsolini', 'Riccardo', 'Attaccante', 8),
(9, '1998-01-25', 'Muriqi', 'Vedat', 'Attaccante', 9),
(10, '1993-12-03', 'Quagliarella', 'Fabio', 'Attaccante', 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `partite`
--

CREATE TABLE `partite` (
  `id` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `nome` int(11) NOT NULL,
  `girone` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `partite`
--

INSERT INTO `partite` (`id`, `data`, `nome`, `girone`) VALUES
(1, '2023-01-01', 1, 1),
(2, '2023-01-08', 2, 1),
(3, '2023-01-15', 3, 1),
(4, '2023-01-22', 4, 1),
(5, '2023-01-29', 5, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `squadre`
--

CREATE TABLE `squadre` (
  `id` int(11) NOT NULL,
  `allenatore` varchar(50) NOT NULL,
  `citta` varchar(50) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `squadre`
--

INSERT INTO `squadre` (`id`, `allenatore`, `citta`, `nome`) VALUES
(1, 'Massimiliano Allegri', 'Torino', 'Juventus'),
(2, 'José Mourinho', 'Roma', 'Roma'),
(3, 'Stefano Pioli', 'Milano', 'Milan'),
(4, 'Luciano Spalletti', 'Napoli', 'Napoli'),
(5, 'Simone Inzaghi', 'Milano', 'Inter'),
(6, 'Maurizio Sarri', 'Bergamo', 'Atalanta'),
(7, 'Gian Piero Gasperini', 'Bergamo', 'Sassuolo'),
(8, 'Roberto De Zerbi', 'Bologna', 'Bologna'),
(9, 'Leonardo Semplici', 'Ferrara', 'Spal'),
(10, 'Eusebio Di Francesco', 'Genova', 'Sampdoria');

-- --------------------------------------------------------

--
-- Struttura della tabella `tra`
--

CREATE TABLE `tra` (
  `id` int(11) NOT NULL,
  `gioca_in_casa` bit(1) DEFAULT NULL,
  `id_squadra` int(11) DEFAULT NULL,
  `id_partita` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `tra`
--

INSERT INTO `tra` (`id`, `gioca_in_casa`, `id_squadra`, `id_partita`) VALUES
(1, b'1', 1, 1),
(2, b'0', 2, 1),
(3, b'1', 3, 2),
(4, b'0', 4, 2),
(5, b'1', 5, 3),
(6, b'0', 6, 3),
(7, b'1', 7, 4),
(8, b'0', 8, 4),
(9, b'1', 9, 5),
(10, b'0', 10, 5);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `giocatori`
--
ALTER TABLE `giocatori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKmk579mdvcixhl8myqfxhqqmlc` (`id_squadra`);

--
-- Indici per le tabelle `partite`
--
ALTER TABLE `partite`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `squadre`
--
ALTER TABLE `squadre`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `tra`
--
ALTER TABLE `tra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1trdyg8vd6eeo16xcxm3sw2a9` (`id_partita`),
  ADD KEY `FKl418cnh5vuw1icwiv68i219fe` (`id_squadra`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `giocatori`
--
ALTER TABLE `giocatori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `partite`
--
ALTER TABLE `partite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `squadre`
--
ALTER TABLE `squadre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `tra`
--
ALTER TABLE `tra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
