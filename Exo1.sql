-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 29 nov. 2024 à 11:22
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
-- Base de données : `Exo1`
--

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
  `idJoueur` int(11) NOT NULL,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Joueur`
--

INSERT INTO `Joueur` (`idJoueur`, `nom`, `prenom`) VALUES
(1, 'Johnson', 'Théo'),
(2, 'Trizo', 'Marion'),
(3, 'Royal', 'Théo'),
(4, 'Zig', 'Zag'),
(5, 'zig', 'zag'),
(6, 'tik', 'tak');

-- --------------------------------------------------------

--
-- Structure de la table `MatchTennis`
--

CREATE TABLE `MatchTennis` (
  `numMatch` int(11) NOT NULL,
  `dateHeure` datetime NOT NULL,
  `idJoueur1` int(11) NOT NULL,
  `idTerrain` int(11) NOT NULL,
  `idVictoire` int(11) NOT NULL,
  `idJoueur2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `MatchTennis`
--

INSERT INTO `MatchTennis` (`numMatch`, `dateHeure`, `idJoueur1`, `idTerrain`, `idVictoire`, `idJoueur2`) VALUES
(1, '2024-11-29 09:48:07', 1, 1, 3, 3),
(4, '2024-11-29 10:18:07', 2, 1, 2, 3),
(5, '2024-11-08 10:18:48', 2, 2, 1, 1),
(6, '2024-11-21 10:18:48', 6, 1, 1, 6),
(7, '2024-11-29 10:18:07', 6, 2, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Terrain`
--

CREATE TABLE `Terrain` (
  `idTerrain` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Terrain`
--

INSERT INTO `Terrain` (`idTerrain`) VALUES
(1),
(2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`idJoueur`);

--
-- Index pour la table `MatchTennis`
--
ALTER TABLE `MatchTennis`
  ADD PRIMARY KEY (`numMatch`),
  ADD KEY `idJoueur` (`idJoueur1`),
  ADD KEY `idTerrain` (`idTerrain`),
  ADD KEY `idJoueur_2` (`idJoueur1`),
  ADD KEY `numCarte` (`idJoueur1`),
  ADD KEY `idJoueur_3` (`idJoueur1`),
  ADD KEY `idScore` (`idVictoire`),
  ADD KEY `idJoueur2` (`idJoueur2`);

--
-- Index pour la table `Terrain`
--
ALTER TABLE `Terrain`
  ADD PRIMARY KEY (`idTerrain`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
  MODIFY `idJoueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `MatchTennis`
--
ALTER TABLE `MatchTennis`
  MODIFY `numMatch` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `Terrain`
--
ALTER TABLE `Terrain`
  MODIFY `idTerrain` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `MatchTennis`
--
ALTER TABLE `MatchTennis`
  ADD CONSTRAINT `MatchTennis_ibfk_1` FOREIGN KEY (`idJoueur1`) REFERENCES `Joueur` (`idJoueur`),
  ADD CONSTRAINT `MatchTennis_ibfk_3` FOREIGN KEY (`idJoueur2`) REFERENCES `Joueur` (`idJoueur`),
  ADD CONSTRAINT `MatchTennis_ibfk_4` FOREIGN KEY (`idVictoire`) REFERENCES `Joueur` (`idJoueur`),
  ADD CONSTRAINT `MatchTennis_ibfk_5` FOREIGN KEY (`idTerrain`) REFERENCES `Terrain` (`idTerrain`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
