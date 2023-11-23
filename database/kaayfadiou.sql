-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 19 nov. 2023 à 00:53
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `kaayfadiou`
--

-- --------------------------------------------------------

--
-- Structure de la table `analyses`
--

CREATE TABLE `analyses` (
  `idAnalyse` int(11) NOT NULL,
  `descriptionAnalyse` text NOT NULL,
  `Resultats` text NOT NULL,
  `montantAnalyse` int(11) NOT NULL,
  `dateAnalyse` date NOT NULL,
  `idPaiement_F` int(11) NOT NULL,
  `idOrdonnance_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `consultation`
--

CREATE TABLE `consultation` (
  `idConsultation` int(11) NOT NULL,
  `dateConsultation` date NOT NULL,
  `montantConsultation` int(11) NOT NULL,
  `idPatient_F` int(11) NOT NULL,
  `idMedecin_F` int(11) NOT NULL,
  `idService_F` int(11) NOT NULL,
  `idPaiement_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `infirmier`
--

CREATE TABLE `infirmier` (
  `idInfirmier` int(11) NOT NULL,
  `nomInfirmier` varchar(20) NOT NULL,
  `prenomInfirmier` varchar(30) NOT NULL,
  `telInfirmier` varchar(10) NOT NULL,
  `emailInfirmier` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin`
--

CREATE TABLE `medecin` (
  `idMedecin` int(11) NOT NULL,
  `nomMedecin` varchar(20) NOT NULL,
  `prenomMedecin` varchar(30) NOT NULL,
  `telMedecin` varchar(10) NOT NULL,
  `emailMedecin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin_service`
--

CREATE TABLE `medecin_service` (
  `idMedecinService` int(11) NOT NULL,
  `dateDebutMS` date NOT NULL,
  `dateFinMS` date NOT NULL,
  `idMedecin_F` int(11) NOT NULL,
  `idService_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medecin_specialite`
--

CREATE TABLE `medecin_specialite` (
  `idMedecinSpecialite` int(11) NOT NULL,
  `idMedecin_F` int(11) NOT NULL,
  `idSpecialite_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `medicament`
--

CREATE TABLE `medicament` (
  `idMedicament` int(11) NOT NULL,
  `nomMedicament` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `mode_paiement`
--

CREATE TABLE `mode_paiement` (
  `idModePaiement` int(11) NOT NULL,
  `libelle` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `ordonnance`
--

CREATE TABLE `ordonnance` (
  `idOrdonnance` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  `idConsultation_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

CREATE TABLE `paiement` (
  `idPaiement` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `idModePaiement_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

CREATE TABLE `patient` (
  `idPatient` int(11) NOT NULL,
  `nomPatient` varchar(20) NOT NULL,
  `prenomPatient` varchar(32) NOT NULL,
  `telPatient` varchar(10) NOT NULL,
  `adressePatiient` varchar(30) NOT NULL,
  `dateNaissance` date NOT NULL,
  `genre` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `patient`
--

INSERT INTO `patient` (`idPatient`, `nomPatient`, `prenomPatient`, `telPatient`, `adressePatiient`, `dateNaissance`, `genre`) VALUES
(1, 'Fall', 'Souleymane', '777151061', 'Comico 4', '2013-09-16', 'M');

-- --------------------------------------------------------

--
-- Structure de la table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `idPrescription` int(11) DEFAULT NULL,
  `posologie` varchar(30) NOT NULL,
  `dureeTraitement` int(11) NOT NULL,
  `idOrdonnance_F` int(11) NOT NULL,
  `idMedicament_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

CREATE TABLE `profil` (
  `idProfil` int(11) NOT NULL,
  `nomProfil` varchar(20) NOT NULL,
  `statut` varchar(20) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`idProfil`, `nomProfil`, `statut`) VALUES
(1, 'Medecin', 'active'),
(2, 'Infirmier', 'active'),
(3, 'Accueil', 'active'),
(4, 'Labo', 'active'),
(5, 'Pharmacien', 'active');

-- --------------------------------------------------------

--
-- Structure de la table `rendezvous`
--

CREATE TABLE `rendezvous` (
  `idRV` int(11) NOT NULL,
  `dateRV` date NOT NULL,
  `idPatient_F` int(11) NOT NULL,
  `idService_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `idService` int(11) NOT NULL,
  `nomService` varchar(20) NOT NULL,
  `telService` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `soin`
--

CREATE TABLE `soin` (
  `idSoin` int(11) NOT NULL,
  `description` text NOT NULL,
  `montantSoin` int(11) NOT NULL,
  `dateSoin` date NOT NULL,
  `idInfirmier_F` int(11) NOT NULL,
  `idPatient_F` int(11) NOT NULL,
  `idOrdonnance_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE `specialite` (
  `idSpecialite` int(11) NOT NULL,
  `nomSpecialite` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `nomUser` varchar(20) NOT NULL,
  `prenomUser` varchar(30) NOT NULL,
  `poste` varchar(20) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `statutUser` varchar(10) NOT NULL DEFAULT 'active',
  `idProfil_F` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`idUser`, `nomUser`, `prenomUser`, `poste`, `login`, `password`, `statutUser`, `idProfil_F`) VALUES
(1, 'Fall', 'Souleymane', 'Developpeur', 'souleymanefall176', 'passer123', 'active', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `analyses`
--
ALTER TABLE `analyses`
  ADD PRIMARY KEY (`idAnalyse`),
  ADD KEY `fk_analyses_paiement` (`idPaiement_F`),
  ADD KEY `fk_analyses_ordonnance` (`idOrdonnance_F`);

--
-- Index pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD PRIMARY KEY (`idConsultation`),
  ADD KEY `fk_consultation_patient` (`idPatient_F`),
  ADD KEY `fk_consultation_medecin` (`idMedecin_F`),
  ADD KEY `fk_consultation_paiement` (`idPaiement_F`),
  ADD KEY `fk_consultation_service` (`idService_F`);

--
-- Index pour la table `infirmier`
--
ALTER TABLE `infirmier`
  ADD PRIMARY KEY (`idInfirmier`);

--
-- Index pour la table `medecin`
--
ALTER TABLE `medecin`
  ADD PRIMARY KEY (`idMedecin`);

--
-- Index pour la table `medecin_service`
--
ALTER TABLE `medecin_service`
  ADD PRIMARY KEY (`idMedecinService`),
  ADD KEY `fk_medecinService_medecin` (`idMedecin_F`),
  ADD KEY `fk_medecinService_service` (`idService_F`);

--
-- Index pour la table `medecin_specialite`
--
ALTER TABLE `medecin_specialite`
  ADD PRIMARY KEY (`idMedecinSpecialite`),
  ADD KEY `fk_medecinSpecialite_specialite` (`idSpecialite_F`),
  ADD KEY `fk_medecinSpecialite_medecin` (`idMedecin_F`);

--
-- Index pour la table `medicament`
--
ALTER TABLE `medicament`
  ADD PRIMARY KEY (`idMedicament`);

--
-- Index pour la table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  ADD PRIMARY KEY (`idModePaiement`);

--
-- Index pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD PRIMARY KEY (`idOrdonnance`),
  ADD KEY `fk_ordonnance_consultation` (`idConsultation_F`);

--
-- Index pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD PRIMARY KEY (`idPaiement`),
  ADD KEY `fk_paiement_modePaiement` (`idModePaiement_F`);

--
-- Index pour la table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`idPatient`);

--
-- Index pour la table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD KEY `fk_prescriptions_ordonnance` (`idOrdonnance_F`),
  ADD KEY `fk_prescriptions_medicament` (`idMedicament_F`);

--
-- Index pour la table `profil`
--
ALTER TABLE `profil`
  ADD PRIMARY KEY (`idProfil`);

--
-- Index pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD PRIMARY KEY (`idRV`),
  ADD KEY `fk_rendezvous_patient` (`idPatient_F`),
  ADD KEY `fk_rendezvous_services` (`idService_F`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`idService`);

--
-- Index pour la table `soin`
--
ALTER TABLE `soin`
  ADD PRIMARY KEY (`idSoin`),
  ADD KEY `fk_soin_infirmier` (`idInfirmier_F`),
  ADD KEY `fk_soin_ordonnance` (`idOrdonnance_F`),
  ADD KEY `fk_soin_patient` (`idPatient_F`);

--
-- Index pour la table `specialite`
--
ALTER TABLE `specialite`
  ADD PRIMARY KEY (`idSpecialite`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`),
  ADD KEY `fk_users_profil` (`idProfil_F`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `analyses`
--
ALTER TABLE `analyses`
  MODIFY `idAnalyse` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `consultation`
--
ALTER TABLE `consultation`
  MODIFY `idConsultation` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `infirmier`
--
ALTER TABLE `infirmier`
  MODIFY `idInfirmier` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin`
--
ALTER TABLE `medecin`
  MODIFY `idMedecin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin_service`
--
ALTER TABLE `medecin_service`
  MODIFY `idMedecinService` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medecin_specialite`
--
ALTER TABLE `medecin_specialite`
  MODIFY `idMedecinSpecialite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `medicament`
--
ALTER TABLE `medicament`
  MODIFY `idMedicament` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `mode_paiement`
--
ALTER TABLE `mode_paiement`
  MODIFY `idModePaiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  MODIFY `idOrdonnance` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `paiement`
--
ALTER TABLE `paiement`
  MODIFY `idPaiement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `patient`
--
ALTER TABLE `patient`
  MODIFY `idPatient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `profil`
--
ALTER TABLE `profil`
  MODIFY `idProfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  MODIFY `idRV` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `idService` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `soin`
--
ALTER TABLE `soin`
  MODIFY `idSoin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `specialite`
--
ALTER TABLE `specialite`
  MODIFY `idSpecialite` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `analyses`
--
ALTER TABLE `analyses`
  ADD CONSTRAINT `fk_analyses_ordonnance` FOREIGN KEY (`idOrdonnance_F`) REFERENCES `ordonnance` (`idOrdonnance`),
  ADD CONSTRAINT `fk_analyses_paiement` FOREIGN KEY (`idPaiement_F`) REFERENCES `paiement` (`idPaiement`);

--
-- Contraintes pour la table `consultation`
--
ALTER TABLE `consultation`
  ADD CONSTRAINT `fk_consultation_medecin` FOREIGN KEY (`idMedecin_F`) REFERENCES `medecin` (`idMedecin`),
  ADD CONSTRAINT `fk_consultation_paiement` FOREIGN KEY (`idPaiement_F`) REFERENCES `paiement` (`idPaiement`),
  ADD CONSTRAINT `fk_consultation_patient` FOREIGN KEY (`idPatient_F`) REFERENCES `patient` (`idPatient`),
  ADD CONSTRAINT `fk_consultation_service` FOREIGN KEY (`idService_F`) REFERENCES `services` (`idService`);

--
-- Contraintes pour la table `medecin_service`
--
ALTER TABLE `medecin_service`
  ADD CONSTRAINT `fk_medecinService_medecin` FOREIGN KEY (`idMedecin_F`) REFERENCES `medecin` (`idMedecin`),
  ADD CONSTRAINT `fk_medecinService_service` FOREIGN KEY (`idService_F`) REFERENCES `services` (`idService`);

--
-- Contraintes pour la table `medecin_specialite`
--
ALTER TABLE `medecin_specialite`
  ADD CONSTRAINT `fk_medecinSpecialite_medecin` FOREIGN KEY (`idMedecin_F`) REFERENCES `medecin` (`idMedecin`),
  ADD CONSTRAINT `fk_medecinSpecialite_specialite` FOREIGN KEY (`idSpecialite_F`) REFERENCES `specialite` (`idSpecialite`);

--
-- Contraintes pour la table `ordonnance`
--
ALTER TABLE `ordonnance`
  ADD CONSTRAINT `fk_ordonnance_consultation` FOREIGN KEY (`idConsultation_F`) REFERENCES `consultation` (`idConsultation`);

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `fk_paiement_modePaiement` FOREIGN KEY (`idModePaiement_F`) REFERENCES `mode_paiement` (`idModePaiement`);

--
-- Contraintes pour la table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `fk_prescriptions_medicament` FOREIGN KEY (`idMedicament_F`) REFERENCES `medicament` (`idMedicament`),
  ADD CONSTRAINT `fk_prescriptions_ordonnance` FOREIGN KEY (`idOrdonnance_F`) REFERENCES `ordonnance` (`idOrdonnance`);

--
-- Contraintes pour la table `rendezvous`
--
ALTER TABLE `rendezvous`
  ADD CONSTRAINT `fk_rendezvous_patient` FOREIGN KEY (`idPatient_F`) REFERENCES `patient` (`idPatient`),
  ADD CONSTRAINT `fk_rendezvous_services` FOREIGN KEY (`idService_F`) REFERENCES `services` (`idService`);

--
-- Contraintes pour la table `soin`
--
ALTER TABLE `soin`
  ADD CONSTRAINT `fk_soin_infirmier` FOREIGN KEY (`idInfirmier_F`) REFERENCES `infirmier` (`idInfirmier`),
  ADD CONSTRAINT `fk_soin_ordonnance` FOREIGN KEY (`idOrdonnance_F`) REFERENCES `ordonnance` (`idOrdonnance`),
  ADD CONSTRAINT `fk_soin_patient` FOREIGN KEY (`idPatient_F`) REFERENCES `patient` (`idPatient`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_profil` FOREIGN KEY (`idProfil_F`) REFERENCES `profil` (`idProfil`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
