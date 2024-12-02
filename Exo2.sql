-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : lun. 02 déc. 2024 à 17:42
-- Version du serveur : 10.5.23-MariaDB-0+deb11u1
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Exo2`
--

-- --------------------------------------------------------

--
-- Structure de la table `Consultation`
--

CREATE TABLE `Consultation` (
  `idConsultion` int(11) NOT NULL,
  `dateHeure` datetime NOT NULL,
  `idMedecin` int(11) NOT NULL,
  `idPatient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Consultation`
--

INSERT INTO `Consultation` (`idConsultion`, `dateHeure`, `idMedecin`, `idPatient`) VALUES
(10, '2024-12-02 17:37:53', 3, 2),
(15, '2024-12-02 17:37:53', 4, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Medecin`
--

CREATE TABLE `Medecin` (
  `idMedecin` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Medecin`
--

INSERT INTO `Medecin` (`idMedecin`, `nom`, `prenom`) VALUES
(1, 'Marqo', 'Théo'),
(2, 'Skyvic', 'Sami'),
(3, 'Argente', 'Léo'),
(4, 'Marko', 'Lin');

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `idMedicament` int(11) NOT NULL,
  `nomCommercial` varchar(200) NOT NULL,
  `idConsultion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Patient`
--

CREATE TABLE `Patient` (
  `idPatient` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Patient`
--

INSERT INTO `Patient` (`idPatient`, `nom`, `prenom`) VALUES
(1, 'Soma\r\n', 'Hayate'),
(2, 'Sumi-des', 'Sato');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Consultation`
--
ALTER TABLE `Consultation`
  ADD PRIMARY KEY (`idConsultion`),
  ADD KEY `idMedecin` (`idMedecin`),
  ADD KEY `idPatient` (`idPatient`);

--
-- Index pour la table `Medecin`
--
ALTER TABLE `Medecin`
  ADD PRIMARY KEY (`idMedecin`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedicament`),
  ADD KEY `idConsultion` (`idConsultion`);

--
-- Index pour la table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`idPatient`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Consultation`
--
ALTER TABLE `Consultation`
  MODIFY `idConsultion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `Medecin`
--
ALTER TABLE `Medecin`
  MODIFY `idMedecin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `idMedicament` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Consultation`
--
ALTER TABLE `Consultation`
  ADD CONSTRAINT `Consultation_ibfk_1` FOREIGN KEY (`idMedecin`) REFERENCES `Medecin` (`idMedecin`),
  ADD CONSTRAINT `Consultation_ibfk_2` FOREIGN KEY (`idPatient`) REFERENCES `Patient` (`idPatient`);

--
-- Contraintes pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD CONSTRAINT `medicament_ibfk_1` FOREIGN KEY (`idConsultion`) REFERENCES `Consultation` (`idConsultion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
