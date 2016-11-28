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
-- Table structure for table `userleagues`
--

DROP TABLE IF EXISTS `userleagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userleagues` (
  `Username` varchar(255) NOT NULL,
  `LeagueID` int(11) NOT NULL,
  PRIMARY KEY (`Username`,`LeagueID`),
  KEY `LeagueID` (`LeagueID`),
  CONSTRAINT `userleagues_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`),
  CONSTRAINT `userleagues_ibfk_2` FOREIGN KEY (`LeagueID`) REFERENCES `league` (`LeagueID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userleagues`
--

LOCK TABLES `userleagues` WRITE;
/*!40000 ALTER TABLE `userleagues` DISABLE KEYS */;
INSERT INTO `userleagues` VALUES ('BThoma',1),('CWilso',1),('GEvans',1),('nvanbomm',1),('TYoung',1),('WMoore',1),('BDavis',2),('DWrigh',2),('JHille',2),('MAdams',2),('PJones',2),('PMarti',2),('RMille',2),('SThoma',2),('BDavis',3),('JTryni',3),('KAnder',3),('MMoore',3),('PJones',3),('PWilso',3),('RSmith',3),('SJohns',3),('SSmith',3),('TYoung',3),('BEvans',4),('DHarri',4),('DWalke',4),('GThomp',4),('PThomp',4),('RWrigh',4),('SWrigh',4),('BThoma',5),('CTryni',5),('DThoma',5),('GBrown',5),('JAnder',5),('JHarri',5),('JLewis',5),('KKingl',5),('KWoods',5),('TYoung',5),('CTryni',6),('GThomp',6),('JAnder',6),('JLewis',6),('JRobin',6),('JWoods',6),('MMoore',6),('PJohns',6),('PSmith',6),('WJones',6),('DHarri',7),('DWilso',7),('GWoods',7),('JJacks',7),('MSmith',7),('RWrigh',7),('SJacks',7),('WJones',7),('GJohnn',8),('GWoods',8),('JHarri',8),('JTaylo',8),('PSmith',8),('SJacks',8),('TMille',8),('TYoung',8),('WJones',8),('BDavis',9),('BThoma',9),('CTryni',9),('JWalke',9),('KAnder',9),('KEvans',9),('nvanbomm',9),('RHille',9),('RMille',9),('DHarri',10),('JMarti',10),('JThomp',10),('JWoods',10),('KJones',10),('LHarri',10),('MJacks',10),('PJohns',10),('TYoung',10),('WAnder',10),('BEvans',11),('CTryni',11),('DThoma',11),('DWalke',11),('KDavis',11),('PJones',11),('SThoma',11),('JJones',12),('KAnder',12),('LMille',12),('MBrown',12),('MKingl',12),('PMarti',12),('RMille',12),('WJones',12),('BEvans',13),('GJohnn',13),('JMarti',13),('JWalke',13),('KDavis',13),('PJones',13),('PMarti',13),('PThomp',13),('BThoma',14),('DWalke',14),('JLewis',14),('JWalke',14),('KEvans',14),('MKingl',14),('PJones',14),('SJacks',14),('BDavis',15),('CWilso',15),('GJohns',15),('KKingl',15),('LHarri',15),('LJones',15),('SSmith',15),('AMille',16),('DThoma',16),('JEvans',16),('JJacks',16),('JLewis',16),('JWoods',16),('DClark',17),('EClark',17),('GBrown',17),('GEvans',17),('GWilso',17),('JJones',17),('KAnder',17),('PJohns',17),('CWilso',18),('GBrown',18),('JThomp',18),('MAdams',18),('MKingl',18),('PJones',18),('TEvans',18),('GEvans',19),('GWoods',19),('JThomp',19),('MAdams',19),('MWhite',19),('PJones',19),('RWrigh',19),('BDavis',20),('CWilso',20),('JAnder',20),('JEvans',20),('JTaylo',20),('LWhite',20),('MBrown',20),('SThoma',20),('SWrigh',20),('TEvans',20),('JJacks',21),('JLewis',21),('JMarti',21),('KWoods',21),('PThomp',21),('SJohns',21),('WWhite',21),('CJones',22),('CWilso',22),('GThomp',22),('JLewis',22),('PSmith',22),('SThoma',22),('WWhite',22),('AMille',23),('DWalke',23),('DWrigh',23),('JAdams',23),('JThomp',23),('MAdams',23),('MTryni',23),('PWilso',23),('RWrigh',23),('SRobin',23),('BThoma',24),('EClark',24),('EJohns',24),('GWilso',24),('JAdams',24),('JTaylo',24),('LWhite',24),('MMoore',24),('PJohns',24),('BEvans',25),('KAnder',25),('LMille',25),('MWhite',25),('PSmith',25),('RSmith',25),('SSmith',25),('SThoma',25),('TYoung',25),('DThoma',26),('GEvans',26),('GThomp',26),('JAdams',26),('JWhite',26),('SThoma',26),('TYoung',26),('WWhite',26),('CTryni',27),('DWalke',27),('GThomp',27),('JHarri',27),('KDavis',27),('LHarri',27),('MSmith',27),('WMoore',27),('WWhite',27),('CTryni',28),('GEvans',28),('GWalke',28),('JHarri',28),('PMarti',28),('RMille',28),('RSmith',28),('WAnder',28),('WJones',28),('DClark',29),('JAnder',29),('JTaylo',29),('MMoore',29),('RSmith',29),('RWrigh',29),('TMille',29),('DWilso',30),('GWoods',30),('JAdams',30),('JLewis',30),('RSmith',30),('SThoma',30);
/*!40000 ALTER TABLE `userleagues` ENABLE KEYS */;
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
