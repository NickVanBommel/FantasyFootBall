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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Role` int(11) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Admin','Admin','Sys','Admin',1),('AMille','51RoB74Qm','Anthony','Miller',0),('BDavis','^BS85ZF#T','Brian','Davis',0),('BEvans','NmoRI#WF&','Brian','Evans',0),('BThoma','NLATFT7Y8','Brian','Thomas',0),('CClark','QGYsYVY!&','Charles','Clark',0),('CEvans','KL2I!imMZ','Chris','Evans',0),('CJones','^1AmYMp8m','Chris','Jones',0),('CTryni','im_^Gim&I','Chris','Tryniski',0),('CWilso','ooWGsHVIH','Chris','Wilson',0),('DClark','v@s#1ZHgG','David','Clark',0),('DHarri','I$1N5aY9V','Daniel','Harris',0),('DRobin','ENINpV#W6','David','Robinson',0),('DThoma','g7$!FGZFa','Daniel','Thomas',0),('DWalke','Y!UpmT995','Daniel','Walker',0),('DWilso','mT65B!NB!','David','Wilson',0),('DWrigh','F7YTNvTsI','David','Wright',0),('EClark','s9K&BsYpZ','Edward','Clark',0),('EJohns','58S3!_HNs','Edward','Johnson',0),('GBrown','KigWMMgsS','George','Brown',0),('GEvans','TQK8_a7Y#','George','Evans',0),('GJohnn','TB^Bp#H8&','George','Johnn',0),('GJohns','Fp%IiYR7F','Gary','Johnson',0),('GThomp','WGKT#8BUI','Gary','Thompson',0),('GWalke','KNW1#VsaI','George','Walker',0),('GWilso','&KTKVsMB_','George','Wilson',0),('GWoods','W7LF%v^Vo','Gary','Woods',0),('JAdams','BL_A1SLAG','Joseph','Adams',0),('JAnder','GI^TTAIa9','Jason','Anderson',0),('JEvans','LUH3N7@Ta','Jose','Evans',0),('JHarri','YBaH6Y!ms','James','Harris',0),('JHille','s1FRa!Nia','Joseph','Hiller',0),('JJacks','V9A_3Va%M','James','Jackson',0),('JJones','iEEE7MmKW','Jose','Jones',0),('JLewis','&W!A89mYI','Joseph','Lewis',0),('JMarti','I#T8TmoS1','Jason','Martin',0),('JRobin','%mi8T%QMI','James','Robinson',0),('JTaylo','6EIE5i2TI','Jason','Taylor',0),('JThomp','2aW4sI8BG','John','Thompson',0),('JTryni','YaVK&ImGv','Jose','Tryniski',0),('JWalke','!YZ4BiI26','Jason','Walker',0),('JWhite','&WpM!FW83','James','White',0),('JWoods','oFa7KFBWN','Jason','Woods',0),('KAnder','SVUBI$maQ','Kenneth','Anderson',0),('KDavis','#TpvGoGR5','Kevin','Davis',0),('KEvans','EGoNTsYgN','Kenneth','Evans',0),('KJones','IZ53HYINL','Kenneth','Jones',0),('KKingl','!&IGaL&4^','Kenneth','Kingly',0),('KWoods','SQ!TvspIN','Kenneth','Woods',0),('LHarri','BGaQ_oNv5','Larry','Harris',0),('LJones','R3BTN1EG&','Larry','Jones',0),('LMille','IQAHNY&SN','Larry','Miller',0),('LWhite','ILBM5ivQ2','Larry','White',0),('MAdams','WRTWII@LE','Matthew','Adams',0),('MBrown','pIYs5A$1F','Mark','Brown',0),('MJacks','I&mL#4YQK','Mark','Jackson',0),('MKingl','1MTTGMR4s','Michael','Kingly',0),('MMoore','9^$IaUB8Y','Michael','Moore',0),('MRobin','GNKW_TE@T','Mark','Robinson',0),('MSmith','LN!ZN6oIB','Mark','Smith',0),('MTryni','MGGTF6WpI','Mark','Tryniski',0),('MWhite','AR%3mN4S6','Matthew','White',0),('nick123','nick123','nick','second',0),('nvanbomm','nvanbomm','Nick','Van Bommel',0),('PJohns','^VKvBT#5S','Paul','Johnson',0),('PJones','!4!1mp!vM','Paul','Jones',0),('PMarti','V7iLRN&!i','Paul','Martin',0),('PSmith','GY!YaF!Rp','Paul','Smith',0),('PThomp','KIT&N2_B4','Paul','Thompson',0),('PWilso','8WMA&oW8V','Paul','Wilson',0),('RBrown','mZBIYLQpM','Ronald','Brown',0),('RHille','WBH63Sa4U','Robert','Hiller',0),('RJacks','VmKGQ@7TG','Ronald','Jackson',0),('RMille','I6iK14M9G','Richard','Miller',0),('RSmith','UGAQ#9!B^','Richard','Smith',0),('RWrigh','75QTsRoQG','Robert','Wright',0),('SHille','GYYBV@4!@','Steven','Hiller',0),('SJacks','%AiB4TB%_','Steven','Jackson',0),('SJohns','%ToGv!4iB','Steven','Johnson',0),('SRobin','IW$A!2TG@','Steven','Robinson',0),('SSmith','GG%8HKNIW','Steven','Smith',0),('SThoma','soYsFY4IQ','Steven','Thomas',0),('SWrigh','%_MMUBsKQ','Steven','Wright',0),('TEvans','2Z^96ITB8','Thomas','Evans',0),('TMille','Ws1M8_L#N','Timothy','Miller',0),('TWilli','VImKTR^Wo','Thomas','Williams',0),('TYoung','vZIBR5TBB','Thomas','Young',0),('WAnder','6QN%FIBFN','William','Anderson',0),('WJones','s&Qp@8^T^','William','Jones',0),('WMoore','ALT4ZW%IF','William','Moore',0),('WWhite','VGVaoNvY8','William','White',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
