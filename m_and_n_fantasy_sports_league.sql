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
-- Table structure for table `league`
--

DROP TABLE IF EXISTS `league`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `league` (
  `LeagueID` int(11) NOT NULL AUTO_INCREMENT,
  `LeagueName` varchar(255) NOT NULL,
  `NumberOfUsers` int(11) NOT NULL,
  PRIMARY KEY (`LeagueID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `league`
--

LOCK TABLES `league` WRITE;
/*!40000 ALTER TABLE `league` DISABLE KEYS */;
INSERT INTO `league` VALUES (1,'NFL Fans 101',6),(2,'Best League',8),(3,'UWO NFL LEague',10),(4,'Fanshawe League',7),(5,'SoftwareEng League',10),(6,'Fav League',10),(7,'Maple Leafs 4ever',8),(8,'Cold as Ice',9),(9,'PigSkins',9),(10,'Why throw the ball',10),(11,'Soccer is lame',7),(12,'S/O to best TAs',8),(13,'Grolinger fan club',8),(14,'Tron can\'t code',8),(15,'UWO SE league',7),(16,'Top 10 ever',6),(17,'American footbal',8),(18,'Seel cold beters',7),(19,'Let\'s play poker',7),(20,'Blackjack gambling tho',10),(21,'Raid 0',7),(22,'The truth is out there',7),(23,'We ain\'t scared of no ghosts',10),(24,'Han shot first',9),(25,'May the force be with you',9),(26,'Coke > Pepsi',8),(27,'Gambino new albul DEC 2',9),(28,'Hammer Smashing',9),(29,'Crush fruit',7),(30,'We kinda sport',6);
/*!40000 ALTER TABLE `league` ENABLE KEYS */;
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
