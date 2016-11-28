-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m_and_n_fantasy_sports
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL AUTO_INCREMENT,
  `TeamName` varchar(255) NOT NULL,
  PRIMARY KEY (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'Baltimore Ravens'),(2,'Buffalo Bills'),(3,'Cincinnati Bengals'),(4,'Cleveland Browns'),(5,'Denver Broncos'),(6,'Houston Texans'),(7,'Indianapolis Colts'),(8,'Jacksonville Jaguars'),(9,'Kansas City Chiefs'),(10,'Miami Dolphins'),(11,'New England Patriots'),(12,'New York Jets'),(13,'Oakland Raiders'),(14,'Pittsburgh Steelers'),(15,'San Diego Chargers'),(16,'Tennessee Titans'),(17,'Arizona Cardinals'),(18,'Atlanta Falcons'),(19,'Carolina Panthers'),(20,'Chicago Bears'),(21,'Dallas Cowboys'),(22,'Detroit Lions'),(23,'Green Bay Packers'),(24,'Los Angeles Rams'),(25,'Minnesota Vikings'),(26,'New Orleans Saints'),(27,'New York Giants'),(28,'Philadelphia Eagles'),(29,'San Fransisco 49ers'),(30,'Seattle Seahawks'),(31,'Tampa Bay Buccaneers'),(32,'Washington Redskins');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 12:07:20
