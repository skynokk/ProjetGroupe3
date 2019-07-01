-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 01 juil. 2019 à 17:07
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `database_projet_b2_test`
--

DROP DATABASE IF EXISTS `database_projet_b2_test`;
CREATE DATABASE IF NOT EXISTS `database_projet_b2_test`;
USE `database_projet_b2_test`;

-- --------------------------------------------------------

--
-- Structure de la table `agence`
--

DROP TABLE IF EXISTS `agence`;
CREATE TABLE IF NOT EXISTS `agence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse_id` int(11) NOT NULL,
  `nom_agence` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19AA94DE7DC5C` (`adresse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agence`
--

INSERT INTO `agence` (`id`, `adresse_id`, `nom_agence`) VALUES
(1, 22, 'Agence Lyon'),
(2, 21, 'Agence Paris');

-- --------------------------------------------------------

--
-- Structure de la table `agent`
--

DROP TABLE IF EXISTS `agent`;
CREATE TABLE IF NOT EXISTS `agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agence_id` int(11) NOT NULL,
  `personne_id` int(11) NOT NULL,
  `adresse_mail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_268B9C9DA21BD112` (`personne_id`),
  KEY `IDX_268B9C9DD725330D` (`agence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agent`
--

INSERT INTO `agent` (`id`, `agence_id`, `personne_id`, `adresse_mail`) VALUES
(2, 1, 2, 'calai.sloth@agence-lyon.com'),
(3, 1, 3, 'onyx.envy@agence-lyon.com'),
(4, 1, 4, 'malakain.gluttony@agence-lyon.com'),
(6, 2, 6, 'yvette.greed@agence-paris.com');

-- --------------------------------------------------------

--
-- Structure de la table `agent_client`
--

DROP TABLE IF EXISTS `agent_client`;
CREATE TABLE IF NOT EXISTS `agent_client` (
  `agent_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`agent_id`,`client_id`),
  KEY `IDX_99A353733414710B` (`agent_id`),
  KEY `IDX_99A3537319EB6921` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `agent_client`
--

INSERT INTO `agent_client` (`agent_id`, `client_id`) VALUES
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(3, 10),
(3, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(6, 19),
(6, 20);

-- --------------------------------------------------------

--
-- Structure de la table `bien_immobilier`
--

DROP TABLE IF EXISTS `bien_immobilier`;
CREATE TABLE IF NOT EXISTS `bien_immobilier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendeur_id` int(11) NOT NULL,
  `adresse_id` int(11) NOT NULL,
  `acheteur_id` int(11) DEFAULT NULL,
  `agence_id` int(11) NOT NULL,
  `type_bien` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precision_type_bien` longtext COLLATE utf8mb4_unicode_ci,
  `description_bien` longtext COLLATE utf8mb4_unicode_ci,
  `superficie` int(11) NOT NULL,
  `nombre_pieces` int(11) NOT NULL,
  `etage` int(11) NOT NULL,
  `prix_minimum` double NOT NULL,
  `prix_mise_en_vente` double NOT NULL,
  `date_mise_en_vente` date NOT NULL,
  `visites` int(11) NOT NULL,
  `vendue` tinyint(1) NOT NULL,
  `date_vente` date DEFAULT NULL,
  `prix_vente` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D1BE34E1858C065E` (`vendeur_id`),
  KEY `IDX_D1BE34E14DE7DC5C` (`adresse_id`),
  KEY `IDX_D1BE34E196A7BB5F` (`acheteur_id`),
  KEY `IDX_D1BE34E1D725330D` (`agence_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `bien_immobilier`
--

INSERT INTO `bien_immobilier` (`id`, `vendeur_id`, `adresse_id`, `acheteur_id`, `agence_id`, `type_bien`, `precision_type_bien`, `description_bien`, `superficie`, `nombre_pieces`, `etage`, `prix_minimum`, `prix_mise_en_vente`, `date_mise_en_vente`, `visites`, `vendue`, `date_vente`, `prix_vente`) VALUES
(1, 1, 23, 21, 1, 'studio', NULL, 'un studio au hasard', 50, 1, 0, 50000, 53000, '2016-10-09', 106, 1, '2017-06-29', 52000),
(2, 2, 24, 24, 1, 'appart', NULL, 'un appart a lyon', 110, 4, 3, 300000, 320000, '2017-09-19', 251, 1, '2017-12-09', 310000),
(3, 3, 25, 25, 1, 'maison', NULL, 'une maison a lyon', 180, 4, 0, 350000, 360000, '2015-03-05', 92, 1, '2015-04-16', 360000),
(4, 4, 26, NULL, 1, 'villa', NULL, 'une villa a peyrolles', 250, 6, 0, 590000, 600000, '2016-11-23', 265, 0, NULL, NULL),
(5, 5, 27, NULL, 1, 'autre', 'une tente', 'juste une tente, mais une grande tente', 5, 1, 0, 160, 200, '2005-01-02', 35, 0, NULL, NULL),
(6, 6, 28, 27, 1, 'autre', 'chateau', 'un grand chateau en bon etat', 530, 16, 0, 1000000, 1050000, '2018-12-09', 102, 1, '2019-06-16', 1025000),
(7, 7, 29, 30, 1, 'studio', NULL, 'un autre petit studio', 45, 1, 2, 110000, 110000, '2009-05-17', 263, 1, '2009-10-30', 110000),
(8, 8, 30, 31, 1, 'maison', NULL, 'une maison a lyon', 160, 4, 0, 320000, 350000, '2018-02-15', 160, 1, '2018-10-31', 340000),
(9, 9, 31, NULL, 1, 'appart', NULL, 'un petit appart a lyon', 80, 3, 6, 120000, 130000, '2019-06-07', 157, 0, NULL, NULL),
(10, 10, 32, NULL, 1, 'appart', NULL, 'un troisieme appart a lyon', 90, 3, 5, 160000, 160000, '2019-06-15', 102, 0, NULL, NULL),
(11, 11, 33, NULL, 1, 'maison', NULL, 'encore une maison a lyon', 180, 4, 0, 380000, 380000, '2016-05-26', 315, 0, NULL, NULL),
(12, 12, 34, NULL, 1, 'maison', NULL, 'une derniere maison a lyon', 210, 5, 0, 480000, 500000, '2018-12-04', 153, 0, NULL, NULL),
(13, 13, 35, 33, 1, 'studio', NULL, 'un dernier studio a lyon', 35, 1, 4, 68000, 68000, '2018-10-15', 135, 1, '2018-11-16', 68000),
(14, 14, 36, NULL, 1, 'appart', NULL, 'un dernier appart a lyon', 95, 4, 2, 240000, 240000, '2017-06-26', 268, 0, NULL, NULL),
(15, 15, 37, 36, 1, 'autre', 'un cirque', 'Oui, je vend un cirque !', 250, 1, 0, 5000, 6000, '2007-06-15', 35, 1, '2010-09-29', 5500),
(16, 16, 38, NULL, 2, 'maison', NULL, 'une premiere maison a paris', 100, 3, 0, 410000, 430000, '2019-01-18', 168, 0, NULL, NULL),
(17, 17, 39, NULL, 2, 'studio', NULL, 'un premier studio a paris', 25, 1, 9, 190000, 200000, '2018-08-03', 351, 0, NULL, NULL),
(18, 18, 40, 27, 2, 'appart', NULL, 'un premier appart a paris', 85, 2, 5, 190000, 200000, '2017-02-16', 128, 1, '2017-09-19', 200000),
(19, 19, 41, NULL, 2, 'maison', NULL, 'une derniere maison a paris', 170, 4, 0, 620000, 650000, '2018-09-19', 183, 0, NULL, NULL),
(20, 20, 42, NULL, 2, 'villa', NULL, 'allez, viens on vend Versailles !', 82000, 2300, 0, 7500000000, 8000000000, '2000-01-01', 682, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parrain_id` int(11) DEFAULT NULL,
  `adresse_id` int(11) NOT NULL,
  `personne_id` int(11) NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C7440455E7927C74` (`email`),
  UNIQUE KEY `UNIQ_C7440455A21BD112` (`personne_id`),
  KEY `IDX_C7440455DE2A7A37` (`parrain_id`),
  KEY `IDX_C74404554DE7DC5C` (`adresse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `parrain_id`, `adresse_id`, `personne_id`, `email`) VALUES
(1, NULL, 1, 7, 'helena.klein@free.fr'),
(2, NULL, 2, 8, 'reiner.wolfson@free.fr'),
(3, NULL, 3, 9, 'august.falke@free.fr'),
(4, NULL, 4, 10, 'altea.bellerose@free.fr'),
(5, NULL, 5, 11, 'iseul.idreis@free.fr'),
(6, NULL, 6, 12, 'saerys@free.fr'),
(7, NULL, 7, 13, 'alain.richter@free.fr'),
(8, NULL, 8, 14, 'solaire.lightwing@free.fr'),
(9, NULL, 9, 15, 'magnus.vestergraad@free.fr'),
(10, NULL, 10, 16, 'lennox.arnold@free.fr'),
(11, NULL, 11, 17, 'jinhai.jibal@free.fr'),
(12, NULL, 12, 18, 'ishara.idreis@free.fr'),
(13, NULL, 13, 19, 'iraia.idreis@free.fr'),
(14, NULL, 14, 20, 'imohn.idreis@free.fr'),
(15, NULL, 15, 21, 'heloise.falke@free.fr'),
(16, NULL, 16, 22, 'astah.falke@free.fr'),
(17, NULL, 17, 23, 'lionel.ailerose@free.fr'),
(18, NULL, 18, 24, 'sophie.lawrence@free.fr'),
(19, NULL, 19, 25, 'ryland.goldhart@free.fr'),
(20, NULL, 20, 26, 'adelaide.ailerose@free.fr'),
(21, NULL, 43, 27, 'mackenzie.hunt@free.fr'),
(22, NULL, 44, 28, 'diego.escalona@free.fr'),
(23, NULL, 45, 29, 'razi.nassar@free.fr'),
(24, NULL, 46, 30, 'jordan.davies@free.fr'),
(25, NULL, 47, 31, 'vanessa.helsing@free.fr'),
(26, NULL, 48, 32, 'antonio.vasquez@free.fr'),
(27, NULL, 49, 33, 'annabelle.sheppard@free.fr'),
(28, NULL, 50, 34, 'damien.rider@free.fr'),
(29, NULL, 51, 35, 'beau.rider@free.fr'),
(30, NULL, 52, 36, 'gwen.doran@free.fr'),
(31, NULL, 53, 37, 'hikari.hayashi@free.fr'),
(32, NULL, 54, 38, 'roshi.nassar@free.fr'),
(33, NULL, 55, 39, 'liliane.labasque@free.fr'),
(34, NULL, 56, 40, 'evangelina.vasquez@free.fr'),
(35, NULL, 57, 41, 'rahim.nassar@free.fr'),
(36, NULL, 58, 42, 'levana.helsing@free.fr'),
(37, NULL, 59, 43, 'john.lapin@free.fr'),
(38, NULL, 60, 44, 'grace.langston@free.fr'),
(39, NULL, 61, 45, 'mireille.mercier@free.fr'),
(41, NULL, 63, 47, 'jean.ferro@ynov.com'),
(42, NULL, 64, 48, 'nolwenn.myran@free.fr');

-- --------------------------------------------------------

--
-- Structure de la table `client_bien_immobilier`
--

DROP TABLE IF EXISTS `client_bien_immobilier`;
CREATE TABLE IF NOT EXISTS `client_bien_immobilier` (
  `client_id` int(11) NOT NULL,
  `bien_immobilier_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`bien_immobilier_id`),
  KEY `IDX_AC98691219EB6921` (`client_id`),
  KEY `IDX_AC9869125992120A` (`bien_immobilier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `client_bien_immobilier`
--

INSERT INTO `client_bien_immobilier` (`client_id`, `bien_immobilier_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `bien_id` int(11) NOT NULL,
  `contenu_commentaire` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_commentaire` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BC19EB6921` (`client_id`),
  KEY `IDX_67F068BCBD95B80F` (`bien_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `communication`
--

DROP TABLE IF EXISTS `communication`;
CREATE TABLE IF NOT EXISTS `communication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expediteur_id` int(11) NOT NULL,
  `destinataire_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_message` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F9AFB5EB10335F61` (`expediteur_id`),
  KEY `IDX_F9AFB5EBA4F84F6E` (`destinataire_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `dependance`
--

DROP TABLE IF EXISTS `dependance`;
CREATE TABLE IF NOT EXISTS `dependance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bien_id` int(11) NOT NULL,
  `nom_dependance` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `superficie` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B43B9E1DBD95B80F` (`bien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `dependance`
--

INSERT INTO `dependance` (`id`, `bien_id`, `nom_dependance`, `description`, `superficie`) VALUES
(1, 1, 'cabane pour enfants', NULL, 2),
(2, 1, 'piscine', NULL, 9),
(3, 2, 'garage a velo', NULL, 3),
(4, 4, 'garage', NULL, 10),
(5, 6, 'garage', NULL, 12),
(6, 6, 'piscine', NULL, 6),
(7, 6, 'écuries', NULL, 60),
(8, 9, 'garage a velo', NULL, 5),
(9, 11, 'garage', NULL, 9),
(10, 13, 'cabanon de bricolage', NULL, 15),
(11, 13, 'piscine', NULL, 8),
(12, 16, 'piscine', NULL, 7),
(13, 17, 'garage', NULL, 12),
(14, 20, 'jardin', 'juste un petit jardin avec quelques fleurs', 261800);

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

DROP TABLE IF EXISTS `localisation`;
CREATE TABLE IF NOT EXISTS `localisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adresse` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `complement_adresse` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `localisation`
--

INSERT INTO `localisation` (`id`, `adresse`, `complement_adresse`, `ville`, `code_postal`) VALUES
(1, '137  rue Sébastopol', NULL, 'Saint-Etienne', 42000),
(2, '91 rue de Groussay', NULL, 'Rodez', 12000),
(3, '111 rue Bonnet', NULL, 'Watterlos', 59150),
(4, '109 Chemin des Bateliers', NULL, 'Albi', 81000),
(5, '28 rue du Clair Bocage', NULL, 'La Teste-de-Buch', 33260),
(6, '123 rue Victor Hugo', NULL, 'Compiegne', 60200),
(7, '109 Chemin du Lavarin sud', NULL, 'Caen', 14000),
(8, '138 Rue du Limas', NULL, 'Bayonne', 64100),
(9, '58 rue de Strasbourg', NULL, 'Clermond-Ferrand', 63100),
(10, '46 place de Miremont', NULL, 'Villeneuve-sur-lot', 47300),
(11, '35 rue du Palais', NULL, 'Ermont', 95120),
(12, '99 rue Isambard', NULL, 'Franconville-la-Garenne', 95130),
(13, '42 Rue de Verdun', NULL, 'Montélimar', 26200),
(14, '65 place Miremont', NULL, 'Villepinte', 93420),
(15, '45 Rue de la Pompe', NULL, 'Mayotte', 97600),
(16, '115 reu Petite Fusterie', NULL, 'Boulogne-sur-Mer', 62200),
(17, '71 rue Marguerite', NULL, 'Villeurbanne', 69100),
(18, '34 Quai des Belges', NULL, 'Meaux', 77100),
(19, '77 Rue Marie de Médicis', NULL, 'Béziers', 34500),
(20, '50 Square de la Couronne', NULL, 'Paris', 75001),
(21, '44 rue Nationale', NULL, 'Paris', 75007),
(22, '115 rue de la République', NULL, 'Lyon', 69003),
(23, '82 rue Pierre Motte', NULL, 'Saint-Foy-Les-Lyon', 69110),
(24, '47 rue du Château', NULL, 'Saint-Etienne', 42100),
(25, '84 rue Gustave Eiffel', NULL, 'Roanne', 42300),
(26, '62 rue de la République', NULL, 'Lyon', 69001),
(27, '17 Place du Jeu de Paume', NULL, 'Lyon', 69400),
(28, '27 rue des Nations Unies', NULL, 'Saint-Chamond', 42400),
(29, '41 Chemin des Bateliers', NULL, 'Annecy', 74000),
(30, '64 rue du Fossé des Tanneurs', NULL, 'Thonon-les-Bains', 74200),
(31, '51 Rue Marie de Médicis', NULL, 'Caluire-Et-Cuire', 69300),
(32, '73 rue Petite Fusterie', NULL, 'Bourg-en-Bresse', 1000),
(33, '66 Boulevard Amiral Courbet', NULL, 'Oullins', 69600),
(34, '73 rue Gustave Eiffel', NULL, 'Rilleux-la-Pape', 69140),
(35, '25 Place du Jeu de Paume', NULL, 'Villefranche-sur Saone', 69400),
(36, '44 rue des Nations Unies', NULL, 'Saint-Chamond', 42400),
(37, '92 Boulevard de Normandie', NULL, 'Fontaine', 38600),
(38, '42 Avenue de Marlioz', NULL, 'Argenteuil', 95100),
(39, '59 Avenue Jules Ferry', NULL, 'Stains', 93240),
(40, '46 rue Nationale', NULL, 'Paris', 75004),
(41, '102 rue de Verdun', NULL, 'Montfermeil', 93370),
(42, 'Versailles', NULL, 'Versailles', 78000),
(43, '73 Chemin des Bateliers', NULL, 'Angouleme', 16000),
(44, '103 rue du President Roosvelt', NULL, 'Schiltigheim', 67300),
(45, '62 Rue Joseph Vernet', NULL, 'Bagneux', 92220),
(46, '73 rue des Dunes', NULL, 'Saint-Medard-en-Jalles', 33160),
(47, '23 Chemin Challet', NULL, 'Lille', 59800),
(48, '97 rue du Gue Jacquet', NULL, 'Châtenay-Malabry', 92290),
(49, '96 rue Chateau', NULL, 'Saint-Herbelain', 44800),
(50, '50 Rue de la Pompe', NULL, 'Manosque', 4100),
(51, '58 avenue de Bouvines', NULL, 'Sète', 34200),
(52, '51 rue Bonneterie', NULL, 'Millau', 12100),
(53, '93 rue de Penthièvre', NULL, 'Pontoise', 95300),
(54, '55 rue Pierre Motte', NULL, 'Saint-Anne', 97180),
(55, '129 rue de la Boétie', NULL, 'Pontault-combault', 77340),
(56, '47 Place du Jeu de Paume', NULL, 'Vigneux-sur-seine', 91270),
(57, '100 rue de Raymond Pointcarré', NULL, 'Nantes', 44300),
(58, '70 rue Isambard', NULL, 'Fresne', 942600),
(59, '82 avenue de Provence', NULL, 'Vallauris', 6220),
(60, '91avenue Jean Portalis', NULL, 'Trappes', 78190),
(61, '76  Rue St Ferréol', NULL, 'Metz', 57070),
(62, 'toto', NULL, 'toto', 12345),
(63, '2 rue le Corbusier', NULL, 'Aix-en-Provence', 13100),
(64, '5 Allée Mireille', NULL, 'Lambesc', 13410);

-- --------------------------------------------------------

--
-- Structure de la table `migration_versions`
--

DROP TABLE IF EXISTS `migration_versions`;
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migration_versions`
--

INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
('20190629164308', '2019-06-29 16:43:13'),
('20190701095149', '2019-07-01 09:52:13');

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personne` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom_personne` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexe` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `est_agent` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `personne`
--

INSERT INTO `personne` (`id`, `nom_personne`, `prenom_personne`, `sexe`, `password`, `photo`, `username`, `est_agent`) VALUES
(2, 'Sloth', 'Calai', 'M', '$2y$13$ThUSm8RcDqFHp/VaXcQT9.UA.f5o6S8u3yJtVHlLPBXXhVpzCOTSu', NULL, 'calslo', 1),
(3, 'Envy', 'Onyx', 'F', '$2y$13$aSFJ2gFg91qKYpQ7gBsa9.i94cQe6f3WAD.JsKR.aK1SbvDZwqr6e', NULL, 'onyenv', 1),
(4, 'Gluttony', 'Malakai', 'M', '$2y$13$RcemH/O3qLzhdCb1fskhXucabh7WMD0kXVadHY/oivKYLnJkRiFcW', NULL, 'malglu', 1),
(6, 'Greed', 'Yvette', 'F', '$2y$13$0nv4.3UJQSj5UGiyZ1TrJO/C8olX4K4/bPvqHaZ/8n3EhzkQo/LiC', NULL, 'yvegre', 1),
(7, 'Klein', 'Helena', 'F', '$2y$13$IR6vioMK5W8pbdUOgymtCOwAN6f01NIklqNPvJwNfiwpTNYhmxwse', NULL, 'helkle', 0),
(8, 'Wolfson', 'Reiner', 'M', '$2y$13$s6Ut1fcEc2lidobJZB1G1e84I.qlm0ctuWNrOTOxQ6b96Fj1bUnvO', NULL, 'reiwol', 0),
(9, 'Falke', 'August', 'M', '$2y$13$G1uz7DqzdLVisrjjWd6PAeTfEBpOgt4YPZ/7LxHUoW5NjHxed8v2y', NULL, 'augfal', 0),
(10, 'Bellerose', 'Altea', 'F', '$2y$13$ADF43tGV2w5kOTbUCM8f0.lcpnJjJ0ics5mg1UG159rbkAiGbfmAm', NULL, 'altbel', 0),
(11, 'Idreis', 'Iseul', 'M', '$2y$13$Q7Xzr3K8SCT9bLwv1IB96.Qrs6.ymK2nqBjrSQurSYcCu0f5ADKFO', NULL, 'iseidr', 0),
(12, 'Demon', 'Saerys', 'M', '$2y$13$Tw5i8g/a8W2Iyq4unQ5CtOTesOqGfIJiCkioEXWULNGo5J5PS80cS', NULL, 'saedem', 0),
(13, 'Richter', 'Alain', 'M', '$2y$13$gkaw/U/DHFmpCQn46ZiVEuZAlw0NjzUcJv7RuW1ZAdbjXSl967ovK', NULL, 'alaric', 0),
(14, 'Lightwing', 'Solaire', 'F', '$2y$13$0rtc8oC39egOa6VXWplcn.tl1z6QEpdynMrnQIXjqiQ0t7gjYbUeq', NULL, 'sollig', 0),
(15, 'Vestergraad', 'Magnus', 'M', '$2y$13$PuqqeCs9JxsVo.TyNuFL2.GRwiVvdzum8R9AHS.avz9E5k24ik1iW', NULL, 'magves', 0),
(16, 'Arnold', 'Lennox', 'M', '$2y$13$SqP4P7x7zqjJMEk1v53xAexR80vFWnGnJxQkURD9mGF677qK4L2nC', NULL, 'lenarn', 0),
(17, 'Jibal', 'Jinhai', 'M', '$2y$13$mDuwIwS/8/ZpOL.xKiKF9ODbMKpZHJ2p2EqLPgsvLm2s9Lw0DNL1G', NULL, 'jinjib', 0),
(18, 'Idreis', 'Ishara', 'F', '$2y$13$vQPy.xwzYwYAvAhKK6TUUeSiYSMFtRRwiPHxbCXYpaiZuhNO5nKIy', NULL, 'ishidr', 0),
(19, 'Idreis', 'Iraia', 'F', '$2y$13$opTR0bndo4zrPFDOWv8bAeipKJ9wnaf1V2yEKH2q7NLxTF95cywcm', NULL, 'iraidr', 0),
(20, 'Idreis', 'Imohn', 'A', '$2y$13$IwhnmnhoDYIsbX9SmcWv9.1EcJ4fuVzpaY54Jnlf/g5Irgq7TUB0C', NULL, 'imoidr', 0),
(21, 'Falke', 'Heloise', 'F', '$2y$13$fam2KjISHJRuqKGepuCGjOoCcUhzZ3Cene2xVsgOgRiVczQBUHaRK', NULL, 'helfal', 0),
(22, 'Falke', 'Astah', 'F', '$2y$13$nQf7H6/CeprohkYvh8zTOus7uxo1cpHvmpsDgFQw.sqxRy1n2tOnu', NULL, 'astfal', 0),
(23, 'Ailerose', 'Lionel', 'M', '$2y$13$hppZrvHZOnXBW6eGc362ye3Ff/56ietD4QUHTPOFMAcqhkOheiW0a', NULL, 'lioail', 0),
(24, 'Lawrence', 'Sophie', 'F', '$2y$13$2xDR1psraybyPAPUnDvPwuMAraLh0Uv2db9YnUfc7Pkx8859B0BGu', NULL, 'soplaw', 0),
(25, 'Goldhart', 'Ryland', 'M', '$2y$13$vIHedFGJ1oqsU/NikKqPJeRx2zWgCgTDivCJQbCq9cWqAk9E37s5C', NULL, 'rylgol', 0),
(26, 'Ailerose', 'Adelaide', 'F', '$2y$13$EEMqieO2JQaupyOgEkk00eBkP6Wxchw/knllUK2LU/5KsEZ.av7Y.', NULL, 'adeail', 0),
(27, 'Hunt', 'Mackenzie', 'F', '$2y$13$9A/gjfXOFwTHujNR7Xo/7OIwNAzW8jUZDYNgdRwXfFIE770JOYK3y', NULL, 'machun', 0),
(28, 'Escalona', 'Diego', 'M', '$2y$13$PA47gCZb2ltCXY5NfXXBV.XGVsyWA/BeDJoe6D6YmskSWjTluWog2', NULL, 'dieesc', 0),
(29, 'Nassar', 'Razi', 'M', '$2y$13$Uj11RoL9ypE6mOsOEi1tie.BxjzNQ71rL4llQVGtd6JY1knkWKvlK', NULL, 'raznas', 0),
(30, 'Davies', 'Jordan', 'A', '$2y$13$aIFvy.B4p1UnCiJbIJjzoeN.gxr9tfHUvrrIhHFKMrQ/aB4EVW3Hm', NULL, 'jordav', 0),
(31, 'Helsing', 'Vanessa', 'F', '$2y$13$wtXZtahm0i807mYM.Xt39eKVu6VnKiM1efKMktqZirCjK4VSzrnvW', NULL, 'vanhel', 0),
(32, 'Vasquez', 'Antonio', 'M', '$2y$13$7icPJxK/qsr67i8B8Pd3WuPqm.wX0v.S5EWUMTDEtQ9kTQ8I1WIwW', NULL, 'antvas', 0),
(33, 'Sheppard', 'Annabelle', 'F', '$2y$13$nfjuStK8iyViNx8r9i8B9.oe9VXjxIB1crJtR.9kNm76b7Hj2I9T.', NULL, 'annshe', 0),
(34, 'Rider', 'Damien', 'M', '$2y$13$juLSajsRXbqPb3NjyeJ9suNUuI0a.myYGXidG0ZRExtlyP9DSvSIm', NULL, 'damrid', 0),
(35, 'Rider', 'Beau', 'M', '$2y$13$RJif22poZ0Ou4e.1dWwF1ujWozFMMviIUdtL8O/GCk3YSegtyVN.a', NULL, 'bearid', 0),
(36, 'Doran', 'Gwen', 'F', '$2y$13$3zPrEJlT.YDnw1JJSINoAuIaf3dducesPY3BFrfIZvoAllibJPizi', NULL, 'gwedor', 0),
(37, 'Hayashi', 'Hikari', 'F', '$2y$13$zQNDY6Pt.cxMj1W6YPPw5OedpQV5mDcV9ErJZ1TfjmIWhkhIpI2qO', NULL, 'hikhay', 0),
(38, 'Nassar', 'Roshni', 'F', '$2y$13$62rMMkwpuTGp7z05J/NQQO0n3Fq6mphmF0ucl8rBKOF99mJvTdPlK', NULL, 'rosnas', 0),
(39, 'Labasque', 'Liliane', 'F', '$2y$13$domfjyFkB8bUqK1BoOTIRuFWQbcBJVdpLO/1cOankHND4.57Tti7G', NULL, 'lillab', 0),
(40, 'Vasquez', 'Evangelina', 'F', '$2y$13$2OFZG/s2J8Nk5/rWywQh.eVmNsHPf9P9Emafqz3v8.QAnF.rmgHQ.', NULL, 'evavas', 0),
(41, 'Nassar', 'Rahim', 'M', '$2y$13$BEgXG9i4KYUA9zZwXyC90OvPn/FyMWKJ6Q70yoijsfKztUABuB.p6', NULL, 'rahnas', 0),
(42, 'Helsing', 'Levana', 'F', '$2y$13$dvvPpCL1r6/BRvejyPubNOeu55Fen37N.ZpJVFtV/JUbIlnT5WQCC', NULL, 'levhel', 0),
(43, 'Lapin', 'John', 'M', '$2y$13$Lbs.C81SMOVc5GlSbEFXpu9vBaOW12/kw.zooRMxPvFUdOPHm02YG', NULL, 'johlap', 0),
(44, 'Langston', 'Grace', 'F', '$2y$13$6AlInJEm9wESSxlekhLWq.XDCJoMqXf8LTA43teXgfn/fVnq7nGm6', NULL, 'gralan', 0),
(45, 'Mercier', 'Mirelle', 'Femme', '$2y$13$8OQKMYy0Lw40mA7XAIhLA.rMRH88eTdJzNzvgtKFIO/2km6Wl4gtS', NULL, 'mirmer', 0),
(47, 'Ferro', 'Jean', 'Homme', '$2y$13$McPy1HUvNAcq9769Nx/EgeXmV1uAoT9kMO1awx.wwIryErTxucx6.', NULL, 'jean', 0),
(48, 'MYRAN', 'Nolwenn', 'Femme', '$2y$13$7CTELATIKJiptonaPrbhq.tD1/GIiUVJarEpyfB3eKZsoPfdfLdxW', NULL, 'nono', 0);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bien_id` int(11) NOT NULL,
  `nom_photo` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chemin_photo` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_14B784186F8CE322` (`chemin_photo`),
  KEY `IDX_14B78418BD95B80F` (`bien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `bien_id`, `nom_photo`, `chemin_photo`) VALUES
(1, 1, 'Photo 1', '1studio_1.jpg'),
(2, 1, 'Photo 2', '1studio_2.jpg'),
(3, 2, 'Photo 1', '2appart_1.jpg'),
(4, 2, 'Photo 2', '2appart_2.jpg'),
(5, 2, 'Photo 3', '2appart_3.jpg'),
(6, 3, 'Photo 1', '3maison_1.jpg'),
(7, 3, 'Photo 2', '3maison_2.jpg'),
(8, 3, 'Photo 3', '3maison_3.jpg'),
(9, 3, 'Photo 4', '3maison_4.jpg'),
(10, 4, 'Photo 1', '4villa_1.jpg'),
(11, 4, 'Photo 2', '4villa_2.jpg'),
(12, 4, 'Photo 3', '4villa_3.jpg'),
(13, 5, 'Photo 1', '5tente_1.jpg'),
(14, 5, 'Photo 2', '5tente_2.jpg'),
(15, 6, 'Photo 1', '6chateau_1.jfif'),
(16, 6, 'Photo 2', '6chateau_2.jfif'),
(17, 6, 'Photo 3', '6chateau_3.jfif'),
(18, 6, 'Photo 4', '6chateau_4.jfif'),
(19, 6, 'Photo 5', '6chateau_5.jfif'),
(20, 7, 'Photo 1', '7studio_1.jpg'),
(21, 7, 'Photo 2', '7studio_2.jpg'),
(22, 8, 'Photo 1', '8maison_1.jpg'),
(23, 8, 'Photo 2', '8maison_2.jpg'),
(24, 8, 'Photo 3', '8maison_3.jpg'),
(25, 8, 'Photo 4', '8maison_4.jpg'),
(26, 8, 'Photo 5', '8maison_5.jpg'),
(27, 9, 'Photo 1', '9appart_1.jpg'),
(28, 9, 'Photo 2', '9appart_2.jpg'),
(29, 9, 'Photo 3', '9appart_3.jpg'),
(30, 10, 'Photo 1', '10appart_1.jpg'),
(31, 10, 'Photo 2', '10appart_2.jpg'),
(32, 10, 'Photo 3', '10appart_3.jpg'),
(33, 10, 'Photo 4', '10appart_4.jpg'),
(34, 11, 'Photo 1', '11maison_1.jpg'),
(35, 11, 'Photo 2', '11maison_2.jpg'),
(36, 11, 'Photo 3', '11maison_3.jpg'),
(37, 12, 'Photo 1', '12maison_1.jpg'),
(38, 12, 'Photo 2', '12maison_2.jpg'),
(39, 12, 'Photo 3', '12maison_3.jpg'),
(40, 12, 'Photo 4', '12maison_4.jpg'),
(41, 13, 'Photo 1', '13studio_1.jpg'),
(42, 13, 'Photo 2', '13studio_2.jpg'),
(43, 13, 'Photo 3', '13studio_3.jpg'),
(44, 14, 'Photo 1', '14appart_1.jpg'),
(45, 14, 'Photo 2', '14appart_2.jpg'),
(46, 14, 'Photo 3', '14appart_3.jpg'),
(47, 15, 'Photo 1', '15cirque_1.jpg'),
(48, 15, 'Photo 2', '15cirque_2.jpg'),
(49, 16, 'Photo 1', '16maison_1.jpg'),
(50, 16, 'Photo 2', '16maison_2.jpg'),
(51, 16, 'Photo 3', '16maison_3.jpg'),
(52, 16, 'Photo 4', '16maison_4.jpg'),
(53, 17, 'Photo 1', '17studio_1.jpg'),
(54, 17, 'Photo 2', '17studio_2.jpg'),
(55, 18, 'Photo 1', '18appart_1.jpg'),
(56, 18, 'Photo 2', '18appart_2.jpg'),
(57, 18, 'Photo 3', '18appart_3.jpg'),
(58, 19, 'Photo 1', '19maison_1.jpg'),
(59, 19, 'Photo 2', '19maison_2.jpg'),
(60, 20, 'Photo 1', '20Versailles_1.jpg'),
(61, 20, 'Photo 2', '20Versailles_2.jpg'),
(62, 20, 'Photo 3', '20Versailles_3.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

DROP TABLE IF EXISTS `proposition`;
CREATE TABLE IF NOT EXISTS `proposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `bien_id` int(11) NOT NULL,
  `montant_offre` double NOT NULL,
  `date_proposition` date NOT NULL,
  `montant_contre_proposition` double DEFAULT NULL,
  `date_contre_proposition` date DEFAULT NULL,
  `proposition_acceptee` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C7CDC35319EB6921` (`client_id`),
  KEY `IDX_C7CDC353BD95B80F` (`bien_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `proposition`
--

INSERT INTO `proposition` (`id`, `client_id`, `bien_id`, `montant_offre`, `date_proposition`, `montant_contre_proposition`, `date_contre_proposition`, `proposition_acceptee`) VALUES
(1, 21, 1, 51000, '2016-11-20', 52000, '2016-11-30', 0),
(2, 22, 1, 52000, '2017-06-29', NULL, NULL, 1),
(3, 23, 2, 300000, '2017-10-10', NULL, NULL, 0),
(4, 24, 2, 305000, '2017-11-25', 310000, '2017-12-01', 1),
(5, 25, 3, 360000, '2015-04-10', NULL, NULL, 1),
(6, 26, 4, 593000, '2016-12-13', NULL, NULL, 0),
(7, 27, 6, 1010000, '2013-03-12', 1025000, '2019-06-13', 1),
(8, 28, 7, 110000, '2009-06-12', NULL, NULL, 0),
(9, 29, 7, 110000, '2009-09-15', NULL, NULL, 0),
(10, 30, 7, 110000, '2009-10-29', NULL, NULL, 1),
(11, 31, 8, 340000, '2018-05-14', NULL, NULL, 1),
(12, 32, 10, 160000, '2019-06-27', NULL, NULL, NULL),
(13, 33, 13, 68000, '2018-11-14', NULL, NULL, 1),
(14, 34, 14, 240000, '2017-11-20', NULL, NULL, NULL),
(15, 35, 14, 240000, '2018-04-19', NULL, NULL, NULL),
(16, 36, 15, 5500, '2017-11-20', NULL, NULL, 1),
(17, 37, 16, 420000, '2019-03-18', NULL, NULL, NULL),
(18, 38, 17, 200000, '2018-09-18', NULL, NULL, NULL),
(19, 32, 18, 195000, '2017-05-21', NULL, NULL, 0),
(20, 27, 18, 200000, '2017-09-18', NULL, NULL, 1),
(21, 31, 19, 630000, '2019-06-14', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

DROP TABLE IF EXISTS `telephone`;
CREATE TABLE IF NOT EXISTS `telephone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proporietaire_id` int(11) NOT NULL,
  `type_telephone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_450FF0106FE0925` (`proporietaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `telephone`
--

INSERT INTO `telephone` (`id`, `proporietaire_id`, `type_telephone`, `numero`) VALUES
(4, 2, 'portable', '06 59 59 63 75'),
(5, 2, 'fixe', '03 83 93 50 02'),
(6, 2, 'fax', '04 53 33 67 48'),
(7, 3, 'portable', '06 04 21 85 25'),
(8, 3, 'fixe', '03 83 93 50 02'),
(9, 3, 'fax', '04 53 33 67 48'),
(10, 4, 'portable', '07 75 71 17 93'),
(11, 4, 'fixe', '03 83 93 50 02'),
(12, 4, 'fax', '04 53 33 67 48'),
(16, 6, 'portable', '07 03 18 21 22'),
(17, 6, 'fixe', '03 35 22 61 58'),
(18, 6, 'fax', '04 77 99 38 89'),
(19, 7, 'portable', '06 84 95 49 25'),
(20, 7, 'fixe', '03 63 81 30 38'),
(21, 8, 'portable', '07 03 18 21 22'),
(22, 9, 'portable', '07 53 71 09 88'),
(23, 9, 'fixe', '03 60 55 47 52'),
(24, 10, 'portable', '06 39 28 22 74'),
(25, 10, 'fixe', '03 96 55 57 22'),
(26, 11, 'portable', '06 76 15 99 04'),
(27, 11, 'fixe', '03 39 46 49 15'),
(28, 12, 'fixe', '03 37 89 66 89'),
(29, 13, 'portable', '06 40 09 72 68'),
(30, 13, 'fixe', '03 49 90 10 99'),
(31, 14, 'portable', '07 84 84 69 75'),
(32, 14, 'fixe', '03 65 48 62 33'),
(33, 15, 'fixe', '03 66 14 68 05'),
(34, 16, 'portable', '06 18 31 98 60'),
(35, 16, 'fixe', '03 47 29 70 19'),
(36, 17, 'portable', '06 41 49 00 74'),
(37, 18, 'portable', '07 19 53 80 46'),
(38, 19, 'portable', '07 73 23 63 90'),
(39, 19, 'fixe', '03 50 63 98 05'),
(40, 20, 'portable', '06 84 62 31 71'),
(41, 20, 'fixe', '03 81 33 58 90'),
(42, 21, 'fixe', '03 91 78 64 08'),
(43, 22, 'portable', '06 79 32 31 45'),
(44, 22, 'fixe', '03 00 43 27 56'),
(45, 23, 'fixe', '03 71 53 50 34'),
(46, 24, 'portable', '07 61 28 77 09'),
(47, 24, 'fixe', '03 42 98 30 50'),
(48, 25, 'portable', '07 89 43 65 67'),
(49, 26, 'portable', '06 97 17 48 96'),
(50, 26, 'fixe', '03 37 44 81 47');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agence`
--
ALTER TABLE `agence`
  ADD CONSTRAINT `FK_64C19AA94DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `localisation` (`id`);

--
-- Contraintes pour la table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `FK_268B9C9DA21BD112` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_268B9C9DD725330D` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `agent_client`
--
ALTER TABLE `agent_client`
  ADD CONSTRAINT `FK_99A3537319EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_99A353733414710B` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `bien_immobilier`
--
ALTER TABLE `bien_immobilier`
  ADD CONSTRAINT `FK_D1BE34E14DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `localisation` (`id`),
  ADD CONSTRAINT `FK_D1BE34E1858C065E` FOREIGN KEY (`vendeur_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_D1BE34E196A7BB5F` FOREIGN KEY (`acheteur_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_D1BE34E1D725330D` FOREIGN KEY (`agence_id`) REFERENCES `agence` (`id`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_C74404554DE7DC5C` FOREIGN KEY (`adresse_id`) REFERENCES `localisation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C7440455A21BD112` FOREIGN KEY (`personne_id`) REFERENCES `personne` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C7440455DE2A7A37` FOREIGN KEY (`parrain_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `client_bien_immobilier`
--
ALTER TABLE `client_bien_immobilier`
  ADD CONSTRAINT `FK_AC98691219EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_AC9869125992120A` FOREIGN KEY (`bien_immobilier_id`) REFERENCES `bien_immobilier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC19EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_67F068BCBD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `bien_immobilier` (`id`);

--
-- Contraintes pour la table `communication`
--
ALTER TABLE `communication`
  ADD CONSTRAINT `FK_F9AFB5EB10335F61` FOREIGN KEY (`expediteur_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_F9AFB5EBA4F84F6E` FOREIGN KEY (`destinataire_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `dependance`
--
ALTER TABLE `dependance`
  ADD CONSTRAINT `FK_B43B9E1DBD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `bien_immobilier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `FK_14B78418BD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `bien_immobilier` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `proposition`
--
ALTER TABLE `proposition`
  ADD CONSTRAINT `FK_C7CDC35319EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_C7CDC353BD95B80F` FOREIGN KEY (`bien_id`) REFERENCES `bien_immobilier` (`id`);

--
-- Contraintes pour la table `telephone`
--
ALTER TABLE `telephone`
  ADD CONSTRAINT `FK_450FF0106FE0925` FOREIGN KEY (`proporietaire_id`) REFERENCES `personne` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
