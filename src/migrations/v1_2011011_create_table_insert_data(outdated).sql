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
  `name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mesp_categories`
--

LOCK TABLES `mesp_categories` WRITE;
/*!40000 ALTER TABLE `mesp_categories` DISABLE KEYS */;
INSERT INTO `mesp_categories` VALUES (0,'Monitoring, Evaluation and Learning Basics'),(1,'Theory of Change and Impact Pathways - Planning'),(2,'Indicators'),(3,'Baselines'),(4,'Reflection Mechanisms'),(5,'Reporting'),(6,'Impact Assessment Studies and Evaluation'),(7,'Monitoring, Evaluation and Learning Tools'),(8,'Online Planning, Reporting and Management Information System'),(9,'Overall references for suitable tools and their descriptions');
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
  `code` varchar(45) DEFAULT NULL,
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
INSERT INTO `mesp_guidelines` VALUES (1,'0.1.','CCAFS Results-Based Management Strategy (2016) - CCAFS Full Proposal Annexes 3.0.5 (p.34-45)',0,''),(2,'0.2.','CCAFS Monitoring and Evaluation Strategy (2014)',0,''),(3,'0.3.','Strategy for Priority Setting, Monitoring and Evaluation (2012)',0,''),(4,'0.4.','Glossary',0,''),(5,'0.5.','Operationalization Plan',0,''),(6,'0.6.','Social Learning where business as usual does not work (2016) - Learning Note',0,''),(7,'0.7.','Climate Change Social Learning Sandbox (2014) - Learning Note ',0,''),(8,'0.8.','Stocktake of CGIAR Social Learning relevant to CCAFS (2013)',0,''),(9,'0.9.','CCAFS Learning Platforms ',0,''),(10,'1.1.','Building your thematic program (flagship) Impact Pathway & Theory of Change - facilitation guide section A',0,''),(11,'1.2.','Building your Regional Impact Pathway & Theory of Change - facilitation guide section B',0,''),(12,'1.3.','Building your Project Impact Pathway & Theory of Change - facilitation guide section C',0,''),(13,'1.4.','Impact Pathway & Theory of Change LIGHT - template blank',0,''),(14,'1.5.','Impact Pathway & Theory of Change LIGHT - CCAFS FP1 example',0,''),(15,'1.6.','Budgeting & Planning for Monitoring and Evaluation',0,''),(16,'1.7.','ToR for M&E Support Staff/ Officer',0,''),(17,'1.8.','CCAFS online Planning system (in use till 2015)',0,''),(18,'1.9.','CRP and Platforms Phase II common planning system MARLO (since 2016)',0,''),(19,'1.10.','Planning Template for projects',0,''),(20,'1.11.','Planning Template for Flagships',0,''),(21,'1.12.','Planning Template CRPs',0,''),(22,'1.13.','Planning Template Platforms',0,''),(23,'1.14.','Planning Consolidated for Portfolio',0,''),(24,'2.1.','CCAFS take on indicators',0,''),(25,'2.2.','CCAFS set of Outcome Indicators 2022 and 2030',0,''),(26,'2.3.','Good practices for indicator development and reporting (2009) OECD ',0,''),(27,'2.4.','Tipps for defining indicators',0,''),(28,'3.1.','CCAFS Baseline surveys: how they came about',0,''),(29,'3.2.','Global summary of baseline household survey results (2014)',0,''),(30,'3.3.','Relevant read: Baseline resources (Reports)',0,''),(31,'3.4.','Baseline data (Datasets)',0,''),(32,'3.5.','Materials for Baseline household surveys',0,''),(33,'3.6.','Materials for Baseline village surveys',0,''),(34,'3.7.','Materials for Baseline organisational surveys',0,''),(35,'3.8.','Materials for Baseline indicator documents',0,''),(36,'4.1.','Why reflection?  ',0,''),(37,'4.2.','Example agenda for (regional) reflection meeting',0,''),(38,'4.3.','CCAFS Learning Platforms',0,''),(39,'5.1.','Overview description - Reporting requirements ($, outcome case study, project highlights, etc.)',0,''),(40,'5.2.','CCAFS online reporting platform',0,''),(41,'5.3.','CRP and Platforms Phase II common reporting system ',0,''),(42,'5.4.','Reporting Template for Projects',0,''),(43,'5.5.','Reporting Template for Flagships',0,''),(44,'5.6.','Reporting Template for CRPs',0,''),(45,'5.7.','Reporting Template for Platforms',0,''),(46,'5.8.','Reporting for CGIAR Portfolio ',0,''),(47,'6.1.','CCAFS utilizes four different types of impact assessment studies',0,''),(48,'6.2.','Reference material -  betterevaluation website and community',0,''),(49,'6.3.','CGIAR Independent Evaluation Arrangement ',0,''),(50,'6.4.','CGIAR Independent Evaluation Arrangement Evaluation Community of Practice',0,''),(51,'6.5.','CGIAR Evaluation Standards for Independent External Evaluations (2015)',0,''),(52,'6.7.','CGIAR Policy for Independent External Evaluations (2012)',0,''),(53,'6.8.','Overview of CCAFS results-based evaluation 2012-2016 (2017) - Info Note',0,''),(54,'6.9.','CCAFS Reporting and Evaluation in a results-based management framework (2015) ',0,''),(55,'6.10.','Evaluation sheet example',0,''),(56,'6.11.','Bonus Allocation ideas',0,''),(57,'6.12.','Outcome Harvesting - use case for CCAFS Climate Data and Tools (2016) - Info Note',0,''),(58,'6.13. ','Outcome Case Study Evaluation ',0,''),(59,'7.1.','Monitoring and evaluation operational plan - Basic utilization-focused template (adapted from IDRC)',0,''),(60,'7.2.','Knowledge Attitude Skills Practice Survey Tool (EA example)',0,''),(61,'7.3.','Reference to KAP Survey Model',0,''),(62,'7.4.','Outcome Journals (adapted from IDRC\'s Outcome Mapping) ',0,''),(63,'7.5.','Interesting reference to read on Outcome Mapping',0,''),(64,'7.6.','Stories of change using Most Significant Change (MSC) - template for collecting potential MSCs',0,''),(65,'7.7.','Reference on Most Significant Change (MSC) Stories ',0,''),(66,'7.8.','Compilation of built-in monitoring tools',0,''),(67,'7.9.','After Activity Evaluation (EA example)',0,''),(68,'7.10.','Four quadrants = a rapid mini After Action Review',0,''),(69,'7.11.','Reference Evaluation Toolbox',0,''),(70,'7.12.','Network analysis tool (EA example)',0,''),(71,'7.13.','Overview of network mapping tools',0,''),(72,'7.14.','Stakeholder analysis to map key actors',0,''),(73,'7.15.','Meeting documentation',0,''),(74,'7.16.','Meeting Monitoring Template (LAM example) - to document meetings held within the different activities.',0,''),(75,'7.17.','Meeting Minutes - template example',0,''),(76,'7.18.','Participants attendance registration - template example Word',0,''),(77,'7.19.','Participants/ attendance registration - template example Excel',0,''),(78,'7.20.','Google Analytics (YouTube for beginners 2017)',0,''),(79,'7.21.','Learning Alliance (LA) activity report (EA example)',0,''),(80,'7.22.','Learning Alliance (LA) review (EA example)',0,''),(81,'7.23.','Measuring how communication and engagement efforts help deliver outcomes (2017) - Info Note',0,''),(82,'7.24.','Selected outcome-focused monitoring tools for communication and engagement (2017) Info Note',0,''),(83,'8.1.','CCAFS online planning and reporting system (CCAFS P&R Learning Note) - in use until 2015',0,''),(84,'8.2.','Common online Program Management system (Managing Agricultural Research for Learning and Outcomes - MARLO) since 2016',0,''),(85,'8.3.','Planning Guide for Flagship Program Leaders',0,''),(86,'8.4.','Planning Guide for Project Leaders',0,''),(87,'8.5.','Reporting Guide for Flagship Program Leaders',0,''),(88,'8.6.','Reporting Guide for Project Leaders',0,''),(89,'9.1.','Facilitator\'s guide, good short descriptions for different user groups explained, e.g. social network analysis, p. 49 ff',0,''),(90,'9.2.','Knowledge sharing toolkit (Great wealth of resources)',0,''),(91,'9.3.','Institutional Learning and Change Initiative (ILAC) has a series of briefs on a wide range of Knowledge Sharing, Monitoring and Evaluation tools',0,''),(92,'9.4.','Betterevaluation (Great sharing site for information to improve evaluations)',0,''),(93,'9.5.','Guideline to conduct Writeshops to capture and disseminate learning',0,''),(94,'9.6.','How the Bank (Worldbank) learns',0,''),(95,'9.7.','Monitoring & Evaluation: Some Tools, Methods & Approaches (WorldBank, 2004)',0,''),(96,'9.8.','Ten Steps to a Results-Based Monitoring and Evaluation System (OECD, 2004)',0,''),(97,'9.9.','Review of the use of Theory of Change in international development (2012)',0,'');
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
INSERT INTO `mesp_importance_levels` VALUES (54,'Very important',6,0,3,3),(53,'Very important',6,0,3,2),(52,'Very important',6,0,3,1),(51,'Very important',6,0,2,3),(50,'Important',6,0,2,2),(49,'Useful',6,0,2,1),(48,'Very important',6,0,1,3),(47,'Very important',6,0,1,2),(46,'Very important',6,0,1,1),(45,'Very important',5,0,3,3),(44,'Useful',5,0,3,2),(43,'Useful',5,0,3,1),(42,'Very important',5,0,2,3),(41,'Useful',5,0,2,2),(40,'Useful',5,0,2,1),(39,'Very important',5,0,1,3),(38,'Very important',5,0,1,2),(37,'Very important',5,0,1,1),(36,'Very important',4,0,3,3),(35,'Useful',4,0,3,2),(34,'Useful',4,0,3,1),(33,'Very important',4,0,2,3),(32,'Useful',4,0,2,2),(31,'Useful',4,0,2,1),(30,'Very important',4,0,1,3),(29,'Very important',4,0,1,2),(28,'Very important',4,0,1,1),(27,'Very important',3,0,3,3),(26,'Important',3,0,3,2),(25,'Important',3,0,3,1),(24,'Very important',3,0,2,3),(23,'Useful',3,0,2,2),(22,'Useful',3,0,2,1),(21,'Very important',3,0,1,3),(20,'Very important',3,0,1,2),(19,'Very important',3,0,1,1),(18,'Important',2,0,3,3),(17,'Useful',2,0,3,2),(16,'Useful',2,0,3,1),(15,'Very important',2,0,2,3),(14,'Useful',2,0,2,2),(13,'Useful',2,0,2,1),(12,'Very important',2,0,1,3),(11,'Useful',2,0,1,2),(10,'Useful',2,0,1,1),(9,'Very important',1,0,3,3),(8,'Important',1,0,3,2),(7,'Important',1,0,3,1),(6,'Very important',1,0,2,3),(5,'Useful',1,0,2,2),(4,'Useful',1,0,2,1),(3,'Very important',1,0,1,3),(2,'Very important',1,0,1,2),(1,'Very important',1,0,1,1),(55,'Very important',7,0,1,1),(56,'Very important',7,0,1,2),(57,'Very important',7,0,1,3),(58,'Useful',7,0,2,1),(59,'Important',7,0,2,2),(60,'Very important',7,0,2,3),(61,'Very important',7,0,3,1),(62,'Very important',7,0,3,2),(63,'Very important',7,0,3,3),(64,'Very important',8,0,1,1),(65,'Very important',8,0,1,2),(66,'Very important',8,0,1,3),(67,'Useful',8,0,2,1),(68,'Important',8,0,2,2),(69,'Very important',8,0,2,3),(70,'Very important',8,0,3,1),(71,'Very important',8,0,3,2),(72,'Very important',8,0,3,3),(73,'Very important',9,0,1,1),(74,'Very important',9,0,1,2),(75,'Very important',9,0,1,3),(76,'Useful',9,0,2,1),(77,'Important',9,0,2,2),(78,'Very important',9,0,2,3),(79,'Very important',9,0,3,1),(80,'Very important',9,0,3,2),(81,'Very important',9,0,3,3),(82,'Very important',10,1,1,1),(83,'Important',10,1,1,2),(84,'Important',10,1,1,3),(85,'Optional',10,1,2,1),(86,'Optional',10,1,2,2),(87,'Useful',10,1,2,3),(88,'Optional',10,1,3,1),(89,'Optional',10,1,3,2),(90,'Optional',10,1,3,3),(91,'Very important',11,1,1,1),(92,'Important',11,1,1,2),(93,'Important',11,1,1,3),(94,'Optional',11,1,2,1),(95,'Optional',11,1,2,2),(96,'Useful',11,1,2,3),(97,'',11,1,3,1),(98,'',11,1,3,2),(99,'',11,1,3,3),(100,'Very important',12,1,1,1),(101,'Important',12,1,1,2),(102,'Important',12,1,1,3),(103,'Optional',12,1,2,1),(104,'Optional',12,1,2,2),(105,'Useful',12,1,2,3),(106,'Optional',12,1,3,1),(107,'Useful',12,1,3,2),(108,'Useful',12,1,3,3),(109,'Very important',13,1,1,1),(110,'Important',13,1,1,2),(111,'Important',13,1,1,3),(112,'Optional',13,1,2,1),(113,'Optional',13,1,2,2),(114,'Useful',13,1,2,3),(115,'',13,1,3,1),(116,'',13,1,3,2),(117,'',13,1,3,3),(118,'Useful',14,1,1,1),(119,'Useful',14,1,1,2),(120,'Useful',14,1,1,3),(121,'',14,1,2,1),(122,'Optional',14,1,2,2),(123,'Useful',14,1,2,3),(124,'',14,1,3,1),(125,'',14,1,3,2),(126,'',14,1,3,3),(127,'Very important',15,1,1,1),(128,'Very important',15,1,1,2),(129,'Very important',15,1,1,3),(130,'Optional',15,1,2,1),(131,'Important',15,1,2,2),(132,'Important',15,1,2,3),(133,'Optional',15,1,3,1),(134,'Optional',15,1,3,2),(135,'Optional',15,1,3,3),(136,'Very important',16,1,1,1),(137,'Very important',16,1,1,2),(138,'Very important',16,1,1,3),(139,'Optional',16,1,2,1),(140,'Important',16,1,2,2),(141,'Important',16,1,2,3),(142,'Optional',16,1,3,1),(143,'Optional',16,1,3,2),(144,'Optional',16,1,3,3),(145,'Optional',17,1,1,1),(146,'Optional',17,1,1,2),(147,'Optional',17,1,1,3),(148,'Optional',17,1,2,1),(149,'Optional',17,1,2,2),(150,'Optional',17,1,2,3),(151,'Optional',17,1,3,1),(152,'Optional',17,1,3,2),(153,'Optional',17,1,3,3),(154,'Useful',18,1,1,1),(155,'Useful',18,1,1,2),(156,'Useful',18,1,1,3),(157,'Useful',18,1,2,1),(158,'Useful',18,1,2,2),(159,'Useful',18,1,2,3),(160,'Useful',18,1,3,1),(161,'Useful',18,1,3,2),(162,'Useful',18,1,3,3),(163,'Useful',19,1,1,1),(164,'Very important',19,1,1,2),(165,'Very important',19,1,1,3),(166,'Useful',19,1,2,1),(167,'Very important',19,1,2,2),(168,'Very important',19,1,2,3),(169,'Useful',19,1,3,1),(170,'Very important',19,1,3,2),(171,'Very important',19,1,3,3),(172,'Very important',20,1,1,1),(173,'Important',20,1,1,2),(174,'Very important',20,1,1,3),(175,'Very important',20,1,2,1),(176,'Important',20,1,2,2),(177,'Very important',20,1,2,3),(178,'Very important',20,1,3,1),(179,'Important',20,1,3,2),(180,'Very important',20,1,3,3),(181,'Very important',21,1,1,1),(182,'Useful',21,1,1,2),(183,'Very important',21,1,1,3),(184,'Very important',21,1,2,1),(185,'Useful',21,1,2,2),(186,'Very important',21,1,2,3),(187,'Very important',21,1,3,1),(188,'Useful',21,1,3,2),(189,'Very important',21,1,3,3),(190,'Very important',22,1,1,1),(191,'Useful',22,1,1,2),(192,'Very important',22,1,1,3),(193,'Very important',22,1,2,1),(194,'Useful',22,1,2,2),(195,'Very important',22,1,2,3),(196,'Very important',22,1,3,1),(197,'Useful',22,1,3,2),(198,'Very important',22,1,3,3),(199,'Very important',23,1,1,1),(200,'Useful',23,1,1,2),(201,'Very important',23,1,1,3),(202,'Very important',23,1,2,1),(203,'Useful',23,1,2,2),(204,'Very important',23,1,2,3),(205,'Very important',23,1,3,1),(206,'Useful',23,1,3,2),(207,'Very important',23,1,3,3),(208,'Very important',24,2,1,1),(209,'Very important',24,2,1,2),(210,'Very important',24,2,1,3),(211,'Very important',24,2,2,1),(212,'Very important',24,2,2,2),(213,'Very important',24,2,2,3),(214,'Very important',24,2,3,1),(215,'Very important',24,2,3,2),(216,'Very important',24,2,3,3),(217,'Very important',25,2,1,1),(218,'Very important',25,2,1,2),(219,'Very important',25,2,1,3),(220,'Very important',25,2,2,1),(221,'Very important',25,2,2,2),(222,'Very important',25,2,2,3),(223,'Very important',25,2,3,1),(224,'Very important',25,2,3,2),(225,'Very important',25,2,3,3),(226,'Very important',26,2,1,1),(227,'Very important',26,2,1,2),(228,'Very important',26,2,1,3),(229,'Optional',26,2,2,1),(230,'Optional',26,2,2,2),(231,'Optional',26,2,2,3),(232,'Optional',26,2,3,1),(233,'Optional',26,2,3,2),(234,'Optional',26,2,3,3),(235,'',27,2,1,1),(236,'',27,2,1,2),(237,'',27,2,1,3),(238,'',27,2,2,1),(239,'',27,2,2,2),(240,'',27,2,2,3),(241,'',27,2,3,1),(242,'',27,2,3,2),(243,'',27,2,3,3),(244,'Very important',28,3,1,1),(245,'Very important',28,3,1,2),(246,'Very important',28,3,1,3),(247,'Useful',28,3,2,1),(248,'Useful',28,3,2,2),(249,'Useful',28,3,2,3),(250,'Important',28,3,3,1),(251,'Important',28,3,3,2),(252,'Important',28,3,3,3),(253,'Useful',29,3,1,1),(254,'Useful',29,3,1,2),(255,'Useful',29,3,1,3),(256,'Useful',29,3,2,1),(257,'Useful',29,3,2,2),(258,'Useful',29,3,2,3),(259,'Useful',29,3,3,1),(260,'Useful',29,3,3,2),(261,'Useful',29,3,3,3),(262,'Useful',30,3,1,1),(263,'Useful',30,3,1,2),(264,'Useful',30,3,1,3),(265,'Optional',30,3,2,1),(266,'Optional',30,3,2,2),(267,'Useful',30,3,2,3),(268,'Optional',30,3,3,1),(269,'Optional',30,3,3,2),(270,'Important',30,3,3,3),(271,'Optional',31,3,1,1),(272,'Optional',31,3,1,2),(273,'Useful',31,3,1,3),(274,'Optional',31,3,2,1),(275,'Optional',31,3,2,2),(276,'Useful',31,3,2,3),(277,'Optional',31,3,3,1),(278,'Optional',31,3,3,2),(279,'Important',31,3,3,3),(280,'Optional',32,3,1,1),(281,'Optional',32,3,1,2),(282,'Useful',32,3,1,3),(283,'Optional',32,3,2,1),(284,'Optional',32,3,2,2),(285,'Useful',32,3,2,3),(286,'Optional',32,3,3,1),(287,'Optional',32,3,3,2),(288,'Important',32,3,3,3),(289,'Optional',33,3,1,1),(290,'Optional',33,3,1,2),(291,'Useful',33,3,1,3),(292,'Optional',33,3,2,1),(293,'Optional',33,3,2,2),(294,'Useful',33,3,2,3),(295,'Optional',33,3,3,1),(296,'Optional',33,3,3,2),(297,'Important',33,3,3,3),(298,'Optional',34,3,1,1),(299,'Optional',34,3,1,2),(300,'Useful',34,3,1,3),(301,'Optional',34,3,2,1),(302,'Optional',34,3,2,2),(303,'Useful',34,3,2,3),(304,'Optional',34,3,3,1),(305,'Optional',34,3,3,2),(306,'Important',34,3,3,3),(307,'Optional',35,3,1,1),(308,'Optional',35,3,1,2),(309,'Useful',35,3,1,3),(310,'Optional',35,3,2,1),(311,'Optional',35,3,2,2),(312,'Useful',35,3,2,3),(313,'Optional',35,3,3,1),(314,'Optional',35,3,3,2),(315,'Important',35,3,3,3),(316,'Very important',36,4,1,1),(317,'Very important',36,4,1,2),(318,'Very important',36,4,1,3),(319,'Useful',36,4,2,1),(320,'Important',36,4,2,2),(321,'Very important',36,4,2,3),(322,'Optional',36,4,3,1),(323,'Optional',36,4,3,2),(324,'Very important',36,4,3,3),(325,'Useful',37,4,1,1),(326,'Useful',37,4,1,2),(327,'Very important',37,4,1,3),(328,'Useful',37,4,2,1),(329,'Important',37,4,2,2),(330,'Very important',37,4,2,3),(331,'Optional',37,4,3,1),(332,'Optional',37,4,3,2),(333,'Very important',37,4,3,3),(334,'Very important',38,4,1,1),(335,'Very important',38,4,1,2),(336,'Very important',38,4,1,3),(337,'Useful',38,4,2,1),(338,'Important',38,4,2,2),(339,'Very important',38,4,2,3),(340,'Very important',38,4,3,1),(341,'Very important',38,4,3,2),(342,'Very important',38,4,3,3),(343,'Very important',39,5,1,1),(344,'Very important',39,5,1,2),(345,'Very important',39,5,1,3),(346,'Important',39,5,2,1),(347,'Important',39,5,2,2),(348,'Important',39,5,2,3),(349,'Very important',39,5,3,1),(350,'Very important',39,5,3,2),(351,'Very important',39,5,3,3),(352,'Very important',40,5,1,1),(353,'Very important',40,5,1,2),(354,'Very important',40,5,1,3),(355,'Useful',40,5,2,1),(356,'Useful',40,5,2,2),(357,'Useful',40,5,2,3),(358,'Very important',40,5,3,1),(359,'Very important',40,5,3,2),(360,'Very important',40,5,3,3),(361,'Useful',41,5,1,1),(362,'Useful',41,5,1,2),(363,'Useful',41,5,1,3),(364,'Useful',41,5,2,1),(365,'Useful',41,5,2,2),(366,'Useful',41,5,2,3),(367,'Very important',41,5,3,1),(368,'Useful',41,5,3,2),(369,'Very important',41,5,3,3),(370,'Useful',42,5,1,1),(371,'Very important',42,5,1,2),(372,'Very important',42,5,1,3),(373,'Useful',42,5,2,1),(374,'Very important',42,5,2,2),(375,'Very important',42,5,2,3),(376,'Useful',42,5,3,1),(377,'Very important',42,5,3,2),(378,'Very important',42,5,3,3),(379,'Very important',43,5,1,1),(380,'Important',43,5,1,2),(381,'Very important',43,5,1,3),(382,'Very important',43,5,2,1),(383,'Important',43,5,2,2),(384,'Very important',43,5,2,3),(385,'Very important',43,5,3,1),(386,'Important',43,5,3,2),(387,'Very important',43,5,3,3),(388,'Very important',44,5,1,1),(389,'Useful',44,5,1,2),(390,'Very important',44,5,1,3),(391,'Very important',44,5,2,1),(392,'Useful',44,5,2,2),(393,'Very important',44,5,2,3),(394,'Very important',44,5,3,1),(395,'Useful',44,5,3,2),(396,'Very important',44,5,3,3),(397,'Very important',45,5,1,1),(398,'Useful',45,5,1,2),(399,'Very important',45,5,1,3),(400,'Very important',45,5,2,1),(401,'Useful',45,5,2,2),(402,'Very important',45,5,2,3),(403,'Very important',45,5,3,1),(404,'Useful',45,5,3,2),(405,'Very important',45,5,3,3),(406,'Very important',46,5,1,1),(407,'Useful',46,5,1,2),(408,'Very important',46,5,1,3),(409,'Very important',46,5,2,1),(410,'Useful',46,5,2,2),(411,'Very important',46,5,2,3),(412,'Very important',46,5,3,1),(413,'Useful',46,5,3,2),(414,'Very important',46,5,3,3),(415,'Important',47,6,1,1),(416,'Important',47,6,1,2),(417,'Very important',47,6,1,3),(418,'Important',47,6,2,1),(419,'Important',47,6,2,2),(420,'Important',47,6,2,3),(421,'Important',47,6,3,1),(422,'Important',47,6,3,2),(423,'Very important',47,6,3,3),(424,'Optional',48,6,1,1),(425,'Optional',48,6,1,2),(426,'Very important',48,6,1,3),(427,'Optional',48,6,2,1),(428,'Optional',48,6,2,2),(429,'Very important',48,6,2,3),(430,'Optional',48,6,3,1),(431,'Optional',48,6,3,2),(432,'Very important',48,6,3,3),(433,'Useful',49,6,1,1),(434,'Useful',49,6,1,2),(435,'Very important',49,6,1,3),(436,'Useful',49,6,2,1),(437,'Useful',49,6,2,2),(438,'Very important',49,6,2,3),(439,'Useful',49,6,3,1),(440,'Useful',49,6,3,2),(441,'Very important',49,6,3,3),(442,'Optional',50,6,1,1),(443,'Optional',50,6,1,2),(444,'Very important',50,6,1,3),(445,'Optional',50,6,2,1),(446,'Optional',50,6,2,2),(447,'Useful',50,6,2,3),(448,'Optional',50,6,3,1),(449,'Optional',50,6,3,2),(450,'Very important',50,6,3,3),(451,'Useful',51,6,1,1),(452,'Useful',51,6,1,2),(453,'Very important',51,6,1,3),(454,'Useful',51,6,2,1),(455,'Useful',51,6,2,2),(456,'Very important',51,6,2,3),(457,'Useful',51,6,3,1),(458,'Useful',51,6,3,2),(459,'Very important',51,6,3,3),(460,'Useful',52,6,1,1),(461,'Useful',52,6,1,2),(462,'Very important',52,6,1,3),(463,'Useful',52,6,2,1),(464,'Useful',52,6,2,2),(465,'Important',52,6,2,3),(466,'Useful',52,6,3,1),(467,'Useful',52,6,3,2),(468,'Important',52,6,3,3),(469,'Optional',53,6,1,1),(470,'Optional',53,6,1,2),(471,'Important',53,6,1,3),(472,'Optional',53,6,2,1),(473,'Optional',53,6,2,2),(474,'Useful',53,6,2,3),(475,'Optional',53,6,3,1),(476,'Optional',53,6,3,2),(477,'Important',53,6,3,3),(478,'Useful',54,6,1,1),(479,'Useful',54,6,1,2),(480,'Useful',54,6,1,3),(481,'Useful',54,6,2,1),(482,'Useful',54,6,2,2),(483,'Useful',54,6,2,3),(484,'Useful',54,6,3,1),(485,'Useful',54,6,3,2),(486,'Very important',54,6,3,3),(487,'Useful',55,6,1,1),(488,'Useful',55,6,1,2),(489,'Useful',55,6,1,3),(490,'Useful',55,6,2,1),(491,'Useful',55,6,2,2),(492,'Useful',55,6,2,3),(493,'Useful',55,6,3,1),(494,'Useful',55,6,3,2),(495,'Very important',55,6,3,3),(496,'Useful',56,6,1,1),(497,'Useful',56,6,1,2),(498,'Useful',56,6,1,3),(499,'Useful',56,6,2,1),(500,'Useful',56,6,2,2),(501,'Useful',56,6,2,3),(502,'Useful',56,6,3,1),(503,'Useful',56,6,3,2),(504,'Very important',56,6,3,3),(505,'Useful',57,6,1,1),(506,'Useful',57,6,1,2),(507,'Useful',57,6,1,3),(508,'Useful',57,6,2,1),(509,'Useful',57,6,2,2),(510,'Useful',57,6,2,3),(511,'Useful',57,6,3,1),(512,'Useful',57,6,3,2),(513,'Very important',57,6,3,3),(514,'Important',58,6,1,1),(515,'Important',58,6,1,2),(516,'Very important',58,6,1,3),(517,'Important',58,6,2,1),(518,'Important',58,6,2,2),(519,'Very important',58,6,2,3),(520,'Important',58,6,3,1),(521,'Important',58,6,3,2),(522,'Very important',58,6,3,3),(523,'Very important',59,7,1,1),(524,'Very important',59,7,1,2),(525,'Very important',59,7,1,3),(526,'Very important',59,7,2,1),(527,'Very important',59,7,2,2),(528,'Very important',59,7,2,3),(529,'Very important',59,7,3,1),(530,'Very important',59,7,3,2),(531,'Very important',59,7,3,3),(532,'Useful',60,7,1,1),(533,'Useful',60,7,1,2),(534,'Important',60,7,1,3),(535,'Useful',60,7,2,1),(536,'Useful',60,7,2,2),(537,'Important',60,7,2,3),(538,'Useful',60,7,3,1),(539,'Useful',60,7,3,2),(540,'Important',60,7,3,3),(541,'Useful',61,7,1,1),(542,'Useful',61,7,1,2),(543,'Very important',61,7,1,3),(544,'Useful',61,7,2,1),(545,'Useful',61,7,2,2),(546,'Very important',61,7,2,3),(547,'Useful',61,7,3,1),(548,'Useful',61,7,3,2),(549,'Important',61,7,3,3),(550,'Useful',62,7,1,1),(551,'Important',62,7,1,2),(552,'Very important',62,7,1,3),(553,'Useful',62,7,2,1),(554,'Important',62,7,2,2),(555,'Very important',62,7,2,3),(556,'Useful',62,7,3,1),(557,'Important',62,7,3,2),(558,'Very important',62,7,3,3),(559,'Useful',63,7,1,1),(560,'Important',63,7,1,2),(561,'Very important',63,7,1,3),(562,'Useful',63,7,2,1),(563,'Important',63,7,2,2),(564,'Very important',63,7,2,3),(565,'Useful',63,7,3,1),(566,'Important',63,7,3,2),(567,'Very important',63,7,3,3),(568,'Optional',64,7,1,1),(569,'Useful',64,7,1,2),(570,'Very important',64,7,1,3),(571,'Optional',64,7,2,1),(572,'Useful',64,7,2,2),(573,'Very important',64,7,2,3),(574,'Optional',64,7,3,1),(575,'Useful',64,7,3,2),(576,'Very important',64,7,3,3),(577,'Optional',65,7,1,1),(578,'Useful',65,7,1,2),(579,'Very important',65,7,1,3),(580,'Optional',65,7,2,1),(581,'Useful',65,7,2,2),(582,'Very important',65,7,2,3),(583,'Optional',65,7,3,1),(584,'Useful',65,7,3,2),(585,'Very important',65,7,3,3),(586,'Optional',66,7,1,1),(587,'Useful',66,7,1,2),(588,'Very important',66,7,1,3),(589,'Optional',66,7,2,1),(590,'Useful',66,7,2,2),(591,'Very important',66,7,2,3),(592,'Optional',66,7,3,1),(593,'Useful',66,7,3,2),(594,'Very important',66,7,3,3),(595,'Useful',67,7,1,1),(596,'Useful',67,7,1,2),(597,'Important',67,7,1,3),(598,'Useful',67,7,2,1),(599,'Useful',67,7,2,2),(600,'Important',67,7,2,3),(601,'Useful',67,7,3,1),(602,'Useful',67,7,3,2),(603,'Important',67,7,3,3),(604,'',68,7,1,1),(605,'Optional',68,7,1,2),(606,'Very important',68,7,1,3),(607,'',68,7,2,1),(608,'Optional',68,7,2,2),(609,'Very important',68,7,2,3),(610,'',68,7,3,1),(611,'Optional',68,7,3,2),(612,'Very important',68,7,3,3),(613,'Optional',69,7,1,1),(614,'Optional',69,7,1,2),(615,'Very important',69,7,1,3),(616,'Optional',69,7,2,1),(617,'Optional',69,7,2,2),(618,'Very important',69,7,2,3),(619,'Optional',69,7,3,1),(620,'Optional',69,7,3,2),(621,'Very important',69,7,3,3),(622,'Optional',70,7,1,1),(623,'Optional',70,7,1,2),(624,'Important',70,7,1,3),(625,'Optional',70,7,2,1),(626,'Optional',70,7,2,2),(627,'Important',70,7,2,3),(628,'Optional',70,7,3,1),(629,'Optional',70,7,3,2),(630,'Important',70,7,3,3),(631,'Useful',71,7,1,1),(632,'Useful',71,7,1,2),(633,'Very important',71,7,1,3),(634,'Useful',71,7,2,1),(635,'Useful',71,7,2,2),(636,'Very important',71,7,2,3),(637,'Useful',71,7,3,1),(638,'Useful',71,7,3,2),(639,'Very important',71,7,3,3),(640,'Useful',72,7,1,1),(641,'Useful',72,7,1,2),(642,'Very important',72,7,1,3),(643,'Useful',72,7,2,1),(644,'Useful',72,7,2,2),(645,'Very important',72,7,2,3),(646,'Useful',72,7,3,1),(647,'Useful',72,7,3,2),(648,'Very important',72,7,3,3),(649,'Optional',73,7,1,1),(650,'Useful',73,7,1,2),(651,'Very important',73,7,1,3),(652,'Optional',73,7,2,1),(653,'Useful',73,7,2,2),(654,'Very important',73,7,2,3),(655,'Optional',73,7,3,1),(656,'Useful',73,7,3,2),(657,'Very important',73,7,3,3),(658,'Optional',74,7,1,1),(659,'Optional',74,7,1,2),(660,'Useful',74,7,1,3),(661,'Optional',74,7,2,1),(662,'Optional',74,7,2,2),(663,'Useful',74,7,2,3),(664,'Optional',74,7,3,1),(665,'Optional',74,7,3,2),(666,'Useful',74,7,3,3),(667,'Useful',75,7,1,1),(668,'Useful',75,7,1,2),(669,'Very important',75,7,1,3),(670,'Useful',75,7,2,1),(671,'Useful',75,7,2,2),(672,'Very important',75,7,2,3),(673,'Useful',75,7,3,1),(674,'Useful',75,7,3,2),(675,'Very important',75,7,3,3),(676,'Optional',76,7,1,1),(677,'Optional',76,7,1,2),(678,'Very important',76,7,1,3),(679,'Optional',76,7,2,1),(680,'Optional',76,7,2,2),(681,'Very important',76,7,2,3),(682,'Optional',76,7,3,1),(683,'Optional',76,7,3,2),(684,'Very important',76,7,3,3),(685,'Optional',77,7,1,1),(686,'Optional',77,7,1,2),(687,'Very important',77,7,1,3),(688,'Optional',77,7,2,1),(689,'Optional',77,7,2,2),(690,'Very important',77,7,2,3),(691,'Optional',77,7,3,1),(692,'Optional',77,7,3,2),(693,'Very important',77,7,3,3),(694,'Optional',78,7,1,1),(695,'Optional',78,7,1,2),(696,'Important',78,7,1,3),(697,'Optional',78,7,2,1),(698,'Optional',78,7,2,2),(699,'Important',78,7,2,3),(700,'Optional',78,7,3,1),(701,'Optional',78,7,3,2),(702,'Important',78,7,3,3),(703,'Optional',79,7,1,1),(704,'Optional',79,7,1,2),(705,'Useful',79,7,1,3),(706,'Optional',79,7,2,1),(707,'Optional',79,7,2,2),(708,'Useful',79,7,2,3),(709,'Optional',79,7,3,1),(710,'Optional',79,7,3,2),(711,'Useful',79,7,3,3),(712,'Optional',80,7,1,1),(713,'Optional',80,7,1,2),(714,'Useful',80,7,1,3),(715,'Optional',80,7,2,1),(716,'Optional',80,7,2,2),(717,'Useful',80,7,2,3),(718,'Optional',80,7,3,1),(719,'Optional',80,7,3,2),(720,'Useful',80,7,3,3),(721,'Useful',81,7,1,1),(722,'Useful',81,7,1,2),(723,'Important',81,7,1,3),(724,'Useful',81,7,2,1),(725,'Useful',81,7,2,2),(726,'Important',81,7,2,3),(727,'Useful',81,7,3,1),(728,'Useful',81,7,3,2),(729,'Important',81,7,3,3),(730,'Optional',82,7,1,1),(731,'Optional',82,7,1,2),(732,'Important',82,7,1,3),(733,'Optional',82,7,2,1),(734,'Optional',82,7,2,2),(735,'Important',82,7,2,3),(736,'Optional',82,7,3,1),(737,'Optional',82,7,3,2),(738,'Important',82,7,3,3),(739,'Optional',83,8,1,1),(740,'Optional',83,8,1,2),(741,'Optional',83,8,1,3),(742,'Optional',83,8,2,1),(743,'Optional',83,8,2,2),(744,'Optional',83,8,2,3),(745,'Optional',83,8,3,1),(746,'Optional',83,8,3,2),(747,'Optional',83,8,3,3),(748,'Important',84,8,1,1),(749,'Important',84,8,1,2),(750,'Important',84,8,1,3),(751,'Useful',84,8,2,1),(752,'Useful',84,8,2,2),(753,'Useful',84,8,2,3),(754,'Very important',84,8,3,1),(755,'Very important',84,8,3,2),(756,'Very important',84,8,3,3),(757,'Useful',85,8,1,1),(758,'Optional',85,8,1,2),(759,'Useful',85,8,1,3),(760,'Useful',85,8,2,1),(761,'Optional',85,8,2,2),(762,'Useful',85,8,2,3),(763,'Useful',85,8,3,1),(764,'Optional',85,8,3,2),(765,'Useful',85,8,3,3),(766,'Optional',86,8,1,1),(767,'Important',86,8,1,2),(768,'Useful',86,8,1,3),(769,'Optional',86,8,2,1),(770,'Important',86,8,2,2),(771,'Useful',86,8,2,3),(772,'Optional',86,8,3,1),(773,'Important',86,8,3,2),(774,'Useful',86,8,3,3),(775,'Useful',87,8,1,1),(776,'Optional',87,8,1,2),(777,'Useful',87,8,1,3),(778,'Useful',87,8,2,1),(779,'Optional',87,8,2,2),(780,'Useful',87,8,2,3),(781,'Useful',87,8,3,1),(782,'Optional',87,8,3,2),(783,'Useful',87,8,3,3),(784,'Optional',88,8,1,1),(785,'Important',88,8,1,2),(786,'Useful',88,8,1,3),(787,'Optional',88,8,2,1),(788,'Important',88,8,2,2),(789,'Useful',88,8,2,3),(790,'Optional',88,8,3,1),(791,'Important',88,8,3,2),(792,'Useful',88,8,3,3),(793,'Optional',89,9,1,1),(794,'Optional',89,9,1,2),(795,'Important',89,9,1,3),(796,'Optional',89,9,2,1),(797,'Optional',89,9,2,2),(798,'Important',89,9,2,3),(799,'Optional',89,9,3,1),(800,'Optional',89,9,3,2),(801,'Important',89,9,3,3),(802,'Optional',90,9,1,1),(803,'Optional',90,9,1,2),(804,'Important',90,9,1,3),(805,'Optional',90,9,2,1),(806,'Optional',90,9,2,2),(807,'Important',90,9,2,3),(808,'Optional',90,9,3,1),(809,'Optional',90,9,3,2),(810,'Important',90,9,3,3),(811,'Optional',91,9,1,1),(812,'Optional',91,9,1,2),(813,'Very important',91,9,1,3),(814,'Optional',91,9,2,1),(815,'Optional',91,9,2,2),(816,'Very important',91,9,2,3),(817,'Optional',91,9,3,1),(818,'Optional',91,9,3,2),(819,'Very important',91,9,3,3),(820,'Optional',92,9,1,1),(821,'Optional',92,9,1,2),(822,'Very important',92,9,1,3),(823,'Optional',92,9,2,1),(824,'Optional',92,9,2,2),(825,'Very important',92,9,2,3),(826,'Optional',92,9,3,1),(827,'Optional',92,9,3,2),(828,'Very important',92,9,3,3),(829,'Optional',93,9,1,1),(830,'Optional',93,9,1,2),(831,'Important',93,9,1,3),(832,'Optional',93,9,2,1),(833,'Optional',93,9,2,2),(834,'Important',93,9,2,3),(835,'Optional',93,9,3,1),(836,'Optional',93,9,3,2),(837,'Important',93,9,3,3),(838,'Optional',94,9,1,1),(839,'Optional',94,9,1,2),(840,'Useful',94,9,1,3),(841,'Optional',94,9,2,1),(842,'Optional',94,9,2,2),(843,'Useful',94,9,2,3),(844,'Optional',94,9,3,1),(845,'Optional',94,9,3,2),(846,'Useful',94,9,3,3),(847,'Optional',95,9,1,1),(848,'Optional',95,9,1,2),(849,'Useful',95,9,1,3),(850,'Optional',95,9,2,1),(851,'Optional',95,9,2,2),(852,'Useful',95,9,2,3),(853,'Optional',95,9,3,1),(854,'Optional',95,9,3,2),(855,'Useful',95,9,3,3),(856,'Useful',96,9,1,1),(857,'Useful',96,9,1,2),(858,'Important',96,9,1,3),(859,'Useful',96,9,2,1),(860,'Useful',96,9,2,2),(861,'Important',96,9,2,3),(862,'Useful',96,9,3,1),(863,'Useful',96,9,3,2),(864,'Important',96,9,3,3),(865,'Useful',97,9,1,1),(866,'Useful',97,9,1,2),(867,'Important',97,9,1,3),(868,'Useful',97,9,2,1),(869,'Useful',97,9,2,2),(870,'Important',97,9,2,3),(871,'Useful',97,9,3,1),(872,'Useful',97,9,3,2),(873,'Important',97,9,3,3);
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

-- Dump completed on 2017-10-13  8:58:32
