/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: voyageursdutemps
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0+deb12u2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `voyageursdutemps`
--

/*!40000 DROP DATABASE IF EXISTS `voyageursdutemps`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `voyageursdutemps` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `voyageursdutemps`;

--
-- Table structure for table `intranet_fonctions`
--

DROP TABLE IF EXISTS `intranet_fonctions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intranet_fonctions` (
  `id_fonction` int(3) NOT NULL AUTO_INCREMENT,
  `nom_fonction` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fonction`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranet_fonctions`
--

LOCK TABLES `intranet_fonctions` WRITE;
INSERT INTO `intranet_fonctions` VALUES
(1,'Directeur'),
(2,'Administrateur système & réseau'),
(3,'Technicien informatique'),
(4,'Responsable informatique'),
(5,'Commercial'),
(6,'Directeur commercial et achats'),
(7,'Ing&eacute;nieur R&amp;D'),
(8,'Directeur R&amp;D'),
(9,'Comptable'),
(10,'Directeur financier'),
(11,'Hôte(sse) d\'accueil'),
(12,'Directeur de la communication'),
(13,'Gestionnaire de communication'),
(14,'Agent de logistique'),
(15,'Responsable logistique'),
(16,'Acheteur'),
(17,'Technicien de maintenance produits');
UNLOCK TABLES;

--
-- Table structure for table `intranet_news`
--

DROP TABLE IF EXISTS `intranet_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intranet_news` (
  `id_news` int(4) NOT NULL AUTO_INCREMENT,
  `titre_news` varchar(255) DEFAULT NULL,
  `texte_news` text DEFAULT NULL,
  `date_news` date NOT NULL,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranet_news`
--

LOCK TABLES `intranet_news` WRITE;
INSERT INTO `intranet_news` VALUES
(1,'Partenariat stratégique avec l’Institut Chronoscientifique Européen','Nous sommes heureux d’annoncer un partenariat de long terme avec l’Institut Chronoscientifique Européen. Cette collaboration vise à améliorer la compréhension des paradoxes temporels et à développer des technologies de retour instantané en cas d’anomalie. Ce partenariat marque une étape clé dans notre mission : faire du voyage temporel une science maîtrisée et responsable. ','2120-02-28'),
(2,'Arrivée d\'un nouvel ingénieur R&D','Un nouvel ingénieur R&D intègre notre société ce jour. Il travaillera notamment sur la technologie quantique. ','2124-01-10'),
(3,'Sortie du nouveau bracelet temporel XZ2905','Après 2 ans de travail, nous commercialiserons notre nouveau bracelet temporel XZ2905 à énergie quantique. Cette nouvelle technologie rend inutile le rechargement de batterie et permet des voyages temporels sans limite. Nous espérons ainsi conserver notre leadership sur ce marché concurrentiel. ','2124-02-28');
UNLOCK TABLES;

--
-- Table structure for table `intranet_roles`
--

DROP TABLE IF EXISTS `intranet_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intranet_roles` (
  `id_role` int(2) NOT NULL AUTO_INCREMENT,
  `nom_role` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranet_roles`
--

LOCK TABLES `intranet_roles` WRITE;
INSERT INTO `intranet_roles` VALUES
(1,'Administrateur'),
(2,'Utilisateur'),
(3,'Technicien');
UNLOCK TABLES;

--
-- Table structure for table `intranet_services`
--

DROP TABLE IF EXISTS `intranet_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intranet_services` (
  `id_service` int(3) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranet_services`
--

LOCK TABLES `intranet_services` WRITE;
INSERT INTO `intranet_services` VALUES
(1,'Direction'),
(2,'Accueil'),
(3,'Informatique'),
(4,'Comptabilit&eacute;'),
(5,'Achats'),
(6,'Logistique'),
(7,'Recherche et d&eacute;veloppement'),
(8,'Commercial'),
(9,'Communication'),
(10,'Support produits');
UNLOCK TABLES;

--
-- Table structure for table `intranet_users`
--

DROP TABLE IF EXISTS `intranet_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `intranet_users` (
  `id_user` int(4) NOT NULL AUTO_INCREMENT,
  `login_user` varchar(30) DEFAULT NULL,
  `pass_user` varchar(32) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `role` tinyint(2) NOT NULL,
  `service` int(2) NOT NULL,
  `fonction` int(2) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intranet_users`
--

LOCK TABLES `intranet_users` WRITE;
INSERT INTO `intranet_users` VALUES
(1,'admin','ee35e7c782791419f29316f183d5d6d3','Administrateur',NULL,1,3,2),
(2,'a.mercier','c279cae731baada8ddd92f23426f0efa','MERCIER','Antoine',1,3,4),
(3,'s.durand','718acd4a316b7c363d295f9e597e5410','DURAND','Simon',2,8,5),
(4,'p.cheval','3db98553462812943a754ad29818da27','CHEVAL','Pascal',2,1,1),
(5,'a.vandenbergh','3a54c28a29759b4296cde000b9f93201','VANDENBERGH','Alexandre',2,4,9),
(6,'l.martin','55ae0a0df046c117dc22d564cbf0b528','MARTIN','Lise',2,9,13),
(7,'c.martial','ef702193cf9c428651333e4a41f12d3e','MARTIAL','Claude',3,3,3),
(8,'l.morel','abeef2c34053477297058b400e267ac1','MOREL','Lucas',2,5,16),
(9,'s.lefevre','a664f6ca09bebdfb5442c3e377300da9','LEFEVRE','Sarah',2,8,5),
(10,'i.bernard','46b756db4e4e68ba8d34537c57b6d12c','BERNARD','Inès',2,2,11),
(11,'t.petit','2621e432adbd927fb3f2f93059ce93d2','PETIT','Thomas',2,10,17),
(12,'h.lambert','5f251c43ec1a9fc0b38402be0fb09058','LAMBERT','Hugo',2,5,16),
(13,'c.rousseau','b627d8dac01bc2361b59d53ef490ee8e','ROUSSEAU','Clara',2,4,9),
(14,'m.dubois','bf59608246b168320f992be0d35cb280','DUBOIS','Manon',2,5,16),
(15,'n.girard','832fb21dfb2eb2ed12f75c5b1a0c1947','GIRARD','Nathan',3,3,3),
(16,'l.fontaine','1bf83419b0ab70cfae539862eb040c62','FONTAINE','Léa',2,7,7),
(17,'m.chevalier','63b3c934cb14ee1513c9f6ba3b41faf2','CHEVALIER','Maxime',2,4,10),
(18,'e.rolland','77e5139690043326d9596acc1359657d','ROLLAND','Emma',2,9,12),
(19,'c.garnier','b9dbcf3137ac8c9632b257a0bba1ad42','GARNIER','Chloé',2,6,15),
(20,'p.renard','bd3d6cf4e8f96ba8319220a8ae02341b','RENARD','Paul',2,6,14),
(21,'s.blanchard','a2514d847d5964b7f5ce6348d2738998','BLANCHARD','Sofia',2,8,5),
(22,'a.perrin','a29ba0223666003f3dd2fc07ba81e798','PERRIN','Alexandre',2,10,17),
(23,'j.marchand','badcda7f480237ed39cf39b05f141b18','MARCHAND','Julie',2,8,6),
(24,'r.colin','9a4388f62199411246f88b23b04083bd','COLIN','Romain',2,7,8),
(25,'a.benali','7cd8b45932a49000b3f1e509fef050bf','BENALI','Amina',2,9,13),
(26,'v.lopez','69edba9531e3b699a4786f4f82997f58','LOPEZ','Victor',2,6,14),
(27,'n.faure','3f361ee00c33dbdea8b7104733e69b04','FAURE','Noémie',2,2,10),
(28,'k.haddad','7ca9d7f5675fa08d1e15e7e0e62fa300','HADDAD','Karim',2,7,7),
(29,'b.lemoine','a641ae22fb84cdc14f1b84278e7e4647','LEMOINE','Baptiste',1,3,2);
UNLOCK TABLES;

--
-- Table structure for table `site_news`
--

DROP TABLE IF EXISTS `site_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_news` (
  `id_news` int(4) NOT NULL AUTO_INCREMENT,
  `titre_news` varchar(255) DEFAULT NULL,
  `texte_news` text DEFAULT NULL,
  `date_news` date NOT NULL,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_news`
--

LOCK TABLES `site_news` WRITE;
INSERT INTO `site_news` VALUES
(3,'Mise en ligne de notre nouveau site',' Nous avons mis à jour notre site Internet. ','2120-05-05'),
(4,'Voyage exclusif : ouverture des réservations pour la Renaissance italienne','Les réservations sont désormais ouvertes pour notre nouveau programme \"Florence, 1504\". Les voyageurs auront l’opportunité d’explorer la Renaissance italienne au moment où l’art, la science et la philosophie connaissaient un essor sans précédent. Comme toujours, nos guides temporels certifiés accompagneront chaque groupe afin de garantir une observation sans interférence historique. ','2120-07-18'),
(5,'Partenariat stratégique avec l’Institut Chronoscientifique Européen','Nous sommes heureux d’annoncer un partenariat de long terme avec l’Institut Chronoscientifique Européen. Cette collaboration vise à améliorer la compréhension des paradoxes temporels et à développer des technologies de retour instantané en cas d’anomalie. Ce partenariat marque une étape clé dans notre mission : faire du voyage temporel une science maîtrisée et responsable. ','2120-02-28'),
(6,'Phénomènes naturels','Notre société est fière d’annoncer la mise en service de sa nouvelle plateforme de transit temporel de génération VII. Grâce à des avancées majeures en stabilisation chronologique, cette infrastructure permet des déplacements encore plus précis vers les périodes historiques sensibles. Cette innovation renforce notre engagement : offrir à nos voyageurs une expérience sûre, immersive et respectueuse de la ligne temporelle. Les billets seront prochainement disponibles chez votre revendeur habituel. ','2124-01-12'),
(7,'Sortie du nouveau bracelet temporel XZ2905','Après 2 ans de travail, nous vous proposerons bientôt notre nouveau bracelet temporel XZ2905 à énergie quantique. Contrairement aux précédents modèles, il ne sera plus nécessaire de le recharger. Nous vous tiendrons informés de sa sortie. ','2124-03-03');
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed
