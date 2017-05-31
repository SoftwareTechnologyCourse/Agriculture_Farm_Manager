-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Serveur: localhost
-- Généré le : Mar 21 Septembre 2010 à 23:37
-- Version du serveur: 5.1.36
-- Version de PHP: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Base de données: `gfadatabase`
--
CREATE DATABASE `gfadatabase` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `gfadatabase`;

-- --------------------------------------------------------

--
-- Structure de la table `acheteur`
--

CREATE TABLE IF NOT EXISTS `acheteur` (
  `CODEACH` decimal(8,0) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `COMPTE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODEACH`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `acheteur`
--


-- --------------------------------------------------------

--
-- Structure de la table `aune`
--

CREATE TABLE IF NOT EXISTS `aune` (
  `ID_IMG` varchar(100) NOT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL,
  PRIMARY KEY (`ID_IMG`,`CODEPRODUIT`),
  KEY `FK_AUNE2` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `aune`
--


-- --------------------------------------------------------

--
-- Structure de la table `batre`
--

CREATE TABLE IF NOT EXISTS `batre` (
  `CODEENNEMIE` decimal(8,0) NOT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL,
  PRIMARY KEY (`CODEENNEMIE`,`CODEPRODUIT`),
  KEY `FK_BATRE2` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `batre`
--


-- --------------------------------------------------------

--
-- Structure de la table `commissionnaire`
--

CREATE TABLE IF NOT EXISTS `commissionnaire` (
  `CODECOM` decimal(8,0) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESSE` varchar(200) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `PATTENTE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODECOM`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commissionnaire`
--


-- --------------------------------------------------------

--
-- Structure de la table `cueillette`
--

CREATE TABLE IF NOT EXISTS `cueillette` (
  `CODECUEIL` decimal(8,0) NOT NULL,
  `CODESER` decimal(8,0) NOT NULL,
  `DATECUEIL` varchar(100) DEFAULT NULL,
  `QUANCEUIL` varchar(20) DEFAULT NULL,
  `POIT` float DEFAULT NULL,
  `NBEMP` int(11) DEFAULT NULL,
  `PCAL1` float DEFAULT NULL,
  `PCAL2` float DEFAULT NULL,
  `PCAL3` float DEFAULT NULL,
  `PCAL4` float DEFAULT NULL,
  `OBSERM` text,
  `OBSERCEUIL` text,
  `X1` float NOT NULL,
  `X2` float NOT NULL,
  `Y1` float NOT NULL,
  `Y2` float NOT NULL,
  PRIMARY KEY (`CODECUEIL`),
  KEY `FK_FAIRE` (`CODESER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `cueillette`
--


-- --------------------------------------------------------

--
-- Structure de la table `culture`
--

CREATE TABLE IF NOT EXISTS `culture` (
  `CODECULTURE` decimal(8,0) NOT NULL,
  `NOMCULTURE` varchar(100) DEFAULT NULL,
  `VARITE` varchar(100) DEFAULT NULL,
  `MARQUECUL` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODECULTURE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `culture`
--


-- --------------------------------------------------------

--
-- Structure de la table `ennemie`
--

CREATE TABLE IF NOT EXISTS `ennemie` (
  `CODEENNEMIE` decimal(8,0) NOT NULL,
  `NOMENNEMIE` varchar(100) DEFAULT NULL,
  `IMAGEENNEMIE` mediumblob,
  PRIMARY KEY (`CODEENNEMIE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ennemie`
--


-- --------------------------------------------------------

--
-- Structure de la table `ferme`
--

CREATE TABLE IF NOT EXISTS `ferme` (
  `CODEFERME` decimal(8,0) NOT NULL,
  `NOMFERME` longtext,
  `ADRESSEFERME` longtext,
  `TELFERME` varchar(20) DEFAULT NULL,
  `DESCRIPTIONFERME` text,
  `NBPARCELLE` int(11) DEFAULT NULL,
  `NBSECTEUR` bigint(20) DEFAULT NULL,
  `RESPONSABLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODEFERME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ferme`
--


-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE IF NOT EXISTS `fournisseur` (
  `CODEFOUR` int(11) NOT NULL,
  `NOM` varchar(50) DEFAULT NULL,
  `SOCAGENT` varchar(50) DEFAULT NULL,
  `ADRESSE` varchar(100) DEFAULT NULL,
  `EMAILAGENT` varchar(50) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `TELAGENT` varchar(20) DEFAULT NULL,
  `INFOAGENT` longtext,
  `PATTENTE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`CODEFOUR`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fournisseur`
--


-- --------------------------------------------------------

--
-- Structure de la table `galerie`
--

CREATE TABLE IF NOT EXISTS `galerie` (
  `imgid` varchar(80) NOT NULL,
  `imgnom` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `galerie`
--

INSERT INTO `galerie` (`imgid`, `imgnom`) VALUES
('1', 'www.gfasoft.com/agent/galerie/1.jpeg'),
('2', 'www.gfasoft.com/agent/galerie/2.jpeg'),
('3', 'www.gfasoft.com/agent/galerie/3.jpeg'),
('4', 'www.gfasoft.com/agent/galerie/4.jpeg'),
('5', 'www.gfasoft.com/agent/galerie/5.jpeg'),
('6', 'www.gfasoft.com/agent/galerie/6.jpeg'),
('7', 'www.gfasoft.com/agent/galerie/7.jpeg'),
('8', '	www.gfasoft.com/agent/galerie/8.jpeg'),
('9', '	www.gfasoft.com/agent/galerie/9.jpeg'),
('10', '	www.gfasoft.com/agent/galerie/10.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `imageproduit`
--

CREATE TABLE IF NOT EXISTS `imageproduit` (
  `ID_IMG` varchar(45) NOT NULL,
  `IMGPROD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_IMG`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `imageproduit`
--

INSERT INTO `imageproduit` (`ID_IMG`, `IMGPROD`) VALUES
('Corrosif', 'www.gfasoft.com/agent/images/imageproduit/1.jpg'),
('Explosif', 'www.gfasoft.com/agent/images/imageproduit/2.jpg'),
('Extremement inflammable', 'www.gfasoft.com/agent/images/imageproduit/3.jpg'),
('Facilement inflammable', 'www.gfasoft.com/agent/images/imageproduit/4.jpg'),
('Irritant', 'www.gfasoft.com/agent/images/imageproduit/5.jpg'),
('Dangereux pour l''environnement', 'www.gfasoft.com/agent/images/imageproduit/6.jpg'),
('Comburant', 'www.gfasoft.com/agent/images/imageproduit/7.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `instocke`
--

CREATE TABLE IF NOT EXISTS `instocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(45) NOT NULL,
  `AGENT` varchar(45) NOT NULL,
  `OBSERVATION` longtext,
  `DESIGNATION` varchar(500) DEFAULT NULL,
  `ETAT` varchar(100) DEFAULT NULL,
  `DATEIN` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CODESTOCKE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `instocke`
--


-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE IF NOT EXISTS `livraison` (
  `NULIVRAISON` decimal(8,0) NOT NULL,
  `CODECULTURE` decimal(8,0) NOT NULL,
  `DATELIVRAISON` varchar(100) DEFAULT NULL,
  `POITNET` float DEFAULT NULL,
  `NBGAJETTE` int(11) DEFAULT NULL,
  `CODETRAN` decimal(8,0) NOT NULL,
  PRIMARY KEY (`NULIVRAISON`),
  KEY `FK_REALISER` (`CODECULTURE`),
  KEY `FK_FOURNER` (`CODETRAN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livraison`
--


-- --------------------------------------------------------

--
-- Structure de la table `machine`
--

CREATE TABLE IF NOT EXISTS `machine` (
  `CODEMACHINE` decimal(8,0) NOT NULL,
  `CODESTOCKE` decimal(8,0) DEFAULT NULL,
  `NOMMACHINE` varchar(50) DEFAULT NULL,
  `OBSERVATION` longtext,
  PRIMARY KEY (`CODEMACHINE`),
  KEY `FK_STOCKER` (`CODESTOCKE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `machine`
--


-- --------------------------------------------------------

--
-- Structure de la table `outstocke`
--

CREATE TABLE IF NOT EXISTS `outstocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(150) NOT NULL,
  `AGENT` varchar(150) NOT NULL,
  `OBSERVATION` text,
  `DESIGNATION` varchar(100) DEFAULT NULL,
  `TACHE` varchar(100) DEFAULT NULL,
  `DATEOUT` varchar(50) DEFAULT NULL,
  `PRODUITSORTIE` varchar(100) DEFAULT NULL,
  `MACHINESORTIE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODESTOCKE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `outstocke`
--


-- --------------------------------------------------------

--
-- Structure de la table `parcelle`
--

CREATE TABLE IF NOT EXISTS `parcelle` (
  `CODEPARCELLE` decimal(8,0) NOT NULL,
  `CODEFERME` decimal(8,0) NOT NULL,
  `SURFACE` float DEFAULT NULL,
  `SURFACECULTIVE` float DEFAULT NULL,
  `NBSERRE` int(11) DEFAULT NULL,
  `SURFACENCULTIVE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`CODEPARCELLE`),
  KEY `FK_AVOIR` (`CODEFERME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `parcelle`
--


-- --------------------------------------------------------

--
-- Structure de la table `plantation`
--

CREATE TABLE IF NOT EXISTS `plantation` (
  `NUPLENTATION` decimal(8,0) NOT NULL,
  `SURFACEPLENTATION` bigint(20) DEFAULT NULL,
  `DATEPENTATION` varchar(50) DEFAULT NULL,
  `NBPLENTE` int(11) DEFAULT NULL,
  `SURGREFF` varchar(10) DEFAULT NULL,
  `ANNEESURGREFF` decimal(8,0) DEFAULT NULL,
  `X1` float NOT NULL,
  `X2` float NOT NULL,
  `Y1` float NOT NULL,
  `Y2` float NOT NULL,
  `DESCPLENT` longtext,
  `PORTEGREF` varchar(100) DEFAULT NULL,
  `CODESER` decimal(8,0) NOT NULL,
  PRIMARY KEY (`NUPLENTATION`),
  KEY `FK_EFFECTUER` (`CODESER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `plantation`
--


-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE IF NOT EXISTS `produit` (
  `CODEPRODUIT` decimal(8,0) NOT NULL,
  `CODESTOCKE` decimal(8,0) DEFAULT NULL,
  `NOMCOMMERCIAL` varchar(100) DEFAULT NULL,
  `MATIEREACTIVE` varchar(100) DEFAULT NULL,
  `MOLECULE` varchar(100) DEFAULT NULL,
  `CODEFOUR` decimal(8,0) NOT NULL,
  PRIMARY KEY (`CODEPRODUIT`),
  KEY `FK_METTRE` (`CODESTOCKE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--


-- --------------------------------------------------------

--
-- Structure de la table `serre`
--

CREATE TABLE IF NOT EXISTS `serre` (
  `CODESER` decimal(8,0) NOT NULL,
  `CODEPARCELLE` decimal(8,0) NOT NULL,
  `SURFACESERRE` float DEFAULT NULL,
  PRIMARY KEY (`CODESER`),
  KEY `FK_CONTENIR` (`CODEPARCELLE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `serre`
--


-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE IF NOT EXISTS `societe` (
  `NOMSOC` varchar(100) NOT NULL,
  `ADRESSESOC` varchar(500) DEFAULT NULL,
  `TELSOC` varchar(20) DEFAULT NULL,
  `EMAILSOC` varchar(50) DEFAULT NULL,
  `DESCRIPTIONSOC` longtext,
  `PATTENTESOC` varchar(50) DEFAULT NULL,
  `FAXSOC` bigint(20) DEFAULT NULL,
  `LOGO` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`NOMSOC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `societe`
--


-- --------------------------------------------------------

--
-- Structure de la table `source_d_eau`
--

CREATE TABLE IF NOT EXISTS `source_d_eau` (
  `CODE_EAU` int(11) NOT NULL AUTO_INCREMENT,
  `CODEFERME` decimal(8,0) NOT NULL,
  `TYPE_EAU` varchar(50) NOT NULL,
  PRIMARY KEY (`CODE_EAU`),
  KEY `FK_DISPOSER` (`CODEFERME`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `source_d_eau`
--


-- --------------------------------------------------------

--
-- Structure de la table `source_energie`
--

CREATE TABLE IF NOT EXISTS `source_energie` (
  `CODE_ENERGIE` int(11) NOT NULL AUTO_INCREMENT,
  `CODEFERME` decimal(8,0) NOT NULL,
  `TYPE_ENERGIE` varchar(50) NOT NULL,
  PRIMARY KEY (`CODE_ENERGIE`),
  KEY `FK_AYANT` (`CODEFERME`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `source_energie`
--


-- --------------------------------------------------------

--
-- Structure de la table `stocke`
--

CREATE TABLE IF NOT EXISTS `stocke` (
  `CODESTOCKE` decimal(8,0) NOT NULL,
  `QAUNTITE` float NOT NULL,
  `MAGASIN` varchar(100) NOT NULL,
  `AGENT` varchar(100) NOT NULL,
  `OBSERVATION` longtext,
  `DESIGNATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`CODESTOCKE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `stocke`
--


-- --------------------------------------------------------

--
-- Structure de la table `traitement`
--

CREATE TABLE IF NOT EXISTS `traitement` (
  `NUMTRAITEMENT` decimal(8,0) NOT NULL,
  `CODESER` decimal(8,0) NOT NULL,
  `DATETRAITEMENT` varchar(50) DEFAULT NULL,
  `DUREE_DE_TRAITEMENT` int(11) DEFAULT NULL,
  `OBSERVATION` text,
  `TYPETRAITEMENT` varchar(50) DEFAULT NULL,
  `TOTALQLITE` float DEFAULT NULL,
  `COUTPROD` float DEFAULT NULL,
  `AGENT_TRAIT` varchar(100) DEFAULT NULL,
  `SURTRAI` float DEFAULT NULL,
  `CODEPRODUIT` decimal(8,0) NOT NULL,
  PRIMARY KEY (`NUMTRAITEMENT`),
  KEY `FK_EXECUTER` (`CODESER`),
  KEY `FK_par` (`CODEPRODUIT`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `traitement`
--


-- --------------------------------------------------------

--
-- Structure de la table `transporteur`
--

CREATE TABLE IF NOT EXISTS `transporteur` (
  `CODETRAN` decimal(8,0) NOT NULL,
  `NOM` varchar(100) DEFAULT NULL,
  `SOCAGENT` varchar(100) DEFAULT NULL,
  `ADRESS` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `FAX` varchar(50) DEFAULT NULL,
  `TELAGENT` varchar(50) DEFAULT NULL,
  `INFOAGENT` longtext,
  `MARQUE` varchar(100) DEFAULT NULL,
  `MATRICULE` varchar(50) DEFAULT NULL,
  `TARIF` float DEFAULT NULL,
  PRIMARY KEY (`CODETRAN`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `transporteur`
--


-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `EMAILUSER` varchar(100) NOT NULL,
  `ROLE` varchar(50) NOT NULL,
  `NOMUSER` varchar(50) DEFAULT NULL,
  `GRADEUSER` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`ID`, `PASSWORD`, `EMAILUSER`, `ROLE`, `NOMUSER`, `GRADEUSER`) VALUES
('admin', '123456', 'admin@h.fr', 'admin', 'Admin', 'Administrateur');
