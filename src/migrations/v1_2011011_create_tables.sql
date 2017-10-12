-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: me_support_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.13-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mesp_categories`
--

DROP TABLE IF EXISTS `mesp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_categories`
--

LOCK TABLES `mesp_categories` WRITE;
/*!40000 ALTER TABLE `mesp_categories` DISABLE KEYS */;
INSERT INTO `mesp_categories` VALUES (1,'Monitoring, Evaluation and Learning Basics'),(2,'Theory of Change and Impact Pathways - Planni'),(3,'Indicators'),(4,'Baselines'),(5,'Reflection Mechanisms'),(6,'Reporting'),(7,'Impact Assessment Studies and Evaluation'),(8,'Monitoring, Evaluation and Learning Tools'),(9,'Online Planning, Reporting and Management Inf'),(10,'Overall references for suitable tools and the');
/*!40000 ALTER TABLE `mesp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_download`
--

DROP TABLE IF EXISTS `mesp_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `institute` longtext NOT NULL,
  `intended_use` longtext NOT NULL,
  `date` datetime NOT NULL,
  `filter_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mes_download_fbfc09f1` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15469 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_download`
--

LOCK TABLES `mesp_download` WRITE;
/*!40000 ALTER TABLE `mesp_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_download_stats`
--

DROP TABLE IF EXISTS `mesp_download_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_download_stats` (
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `institute` longtext,
  `intended_use` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_download_stats`
--

LOCK TABLES `mesp_download_stats` WRITE;
/*!40000 ALTER TABLE `mesp_download_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_download_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_downloadinstitutelocation`
--

DROP TABLE IF EXISTS `mesp_downloadinstitutelocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_downloadinstitutelocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `africa` tinyint(1) NOT NULL DEFAULT '0',
  `asia` tinyint(1) NOT NULL DEFAULT '0',
  `oceania` tinyint(1) NOT NULL DEFAULT '0',
  `central_america_caribbean` tinyint(1) NOT NULL DEFAULT '0',
  `europe` tinyint(1) NOT NULL DEFAULT '0',
  `middle_east_north_africa` tinyint(1) NOT NULL DEFAULT '0',
  `north_america` tinyint(1) NOT NULL DEFAULT '0',
  `south_america` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mes_downloadinstitutelocation_30b991ec` (`download_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15451 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_downloadinstitutelocation`
--

LOCK TABLES `mesp_downloadinstitutelocation` WRITE;
/*!40000 ALTER TABLE `mesp_downloadinstitutelocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_downloadinstitutelocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_guidelines`
--

DROP TABLE IF EXISTS `mesp_guidelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_guidelines` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `source` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_guidelines`
--

LOCK TABLES `mesp_guidelines` WRITE;
/*!40000 ALTER TABLE `mesp_guidelines` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_guidelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_guidelines_downloaded`
--

DROP TABLE IF EXISTS `mesp_guidelines_downloaded`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_guidelines_downloaded` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `guideline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_guidelines_downloaded`
--

LOCK TABLES `mesp_guidelines_downloaded` WRITE;
/*!40000 ALTER TABLE `mesp_guidelines_downloaded` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_guidelines_downloaded` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_guidelines_downloaded_stats`
--

DROP TABLE IF EXISTS `mesp_guidelines_downloaded_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_guidelines_downloaded_stats` (
  `id` int(11) DEFAULT NULL,
  `download_id` int(11) DEFAULT NULL,
  `guideline_id` int(11) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `institute` longtext,
  `intended_use` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_guidelines_downloaded_stats`
--

LOCK TABLES `mesp_guidelines_downloaded_stats` WRITE;
/*!40000 ALTER TABLE `mesp_guidelines_downloaded_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_guidelines_downloaded_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_importance_levels`
--

DROP TABLE IF EXISTS `mesp_importance_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_importance_levels` (
  `id_importance_level` int(11) NOT NULL,
  `importance_level` enum('Very important','Important','Useful','Optional') DEFAULT NULL,
  `guideline_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `stage_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id_importance_level`),
  KEY `fk_mes_importance_level_mes_guidelines_idx` (`guideline_id`),
  KEY `fk_mes_importance_level_mes_what1_idx` (`category_id`),
  KEY `fk_mes_importance_level_mes_when1_idx` (`stage_id`),
  KEY `fk_mes_importance_level_mes_role1_idx` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_importance_levels`
--

LOCK TABLES `mesp_importance_levels` WRITE;
/*!40000 ALTER TABLE `mesp_importance_levels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_importance_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_person`
--

DROP TABLE IF EXISTS `mesp_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `registered` date NOT NULL,
  `email` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_person`
--

LOCK TABLES `mesp_person` WRITE;
/*!40000 ALTER TABLE `mesp_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesp_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_roles`
--

DROP TABLE IF EXISTS `mesp_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_roles`
--

LOCK TABLES `mesp_roles` WRITE;
/*!40000 ALTER TABLE `mesp_roles` DISABLE KEYS */;
INSERT INTO `mesp_roles` VALUES (1,'Program Manager'),(2,'Project Manager'),(3,'M&E Officer');
/*!40000 ALTER TABLE `mesp_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mesp_stages`
--

DROP TABLE IF EXISTS `mesp_stages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mesp_stages` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_stages`
--

LOCK TABLES `mesp_stages` WRITE;
/*!40000 ALTER TABLE `mesp_stages` DISABLE KEYS */;
INSERT INTO `mesp_stages` VALUES (1,'Decisions while designing'),(2,'Management of research processes'),(3,'Delivery of research products');
/*!40000 ALTER TABLE `mesp_stages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-12  8:09:06
