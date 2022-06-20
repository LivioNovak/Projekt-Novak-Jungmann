-- MariaDB dump 10.19  Distrib 10.4.22-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: infi_projekt_novakjungmann
-- ------------------------------------------------------
-- Server version	10.4.22-MariaDB

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
-- Table structure for table `classifieds`
--

DROP TABLE IF EXISTS `classifieds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classifieds` (
  `id` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `creatoremail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `erstelleremail` (`creatoremail`),
  CONSTRAINT `classifieds_ibfk_1` FOREIGN KEY (`creatoremail`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifieds`
--

LOCK TABLES `classifieds` WRITE;
/*!40000 ALTER TABLE `classifieds` DISABLE KEYS */;
INSERT INTO `classifieds` VALUES (1,'jeans XXL schwarz',12.99,'alte Jeans, passt mir leider nicht mehr und steht deswegen zum verkauf','max.mustermann@gmx.at'),(2,'Bratpfanne WMF',30,'meine alte lieblings Bratpfanne. Luxusmarke. Top Zustand','max.mustermann@gmx.at'),(3,'VW Golf Baujahr 2004',899.99,'noch intakt, nur Selbstabholung','hilda.billiger@tsn.at'),(4,'Danker Schulranzen',13.2,'Gebraucht - Wie neu','jujungmann@tsn.at');
/*!40000 ALTER TABLE `classifieds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classifiedstouser`
--

DROP TABLE IF EXISTS `classifiedstouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classifiedstouser` (
  `useremail` varchar(255) NOT NULL,
  `classifiedsId` int(11) NOT NULL,
  `connect_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`useremail`,`classifiedsId`,`connect_timestamp`),
  KEY `bid` (`classifiedsId`),
  CONSTRAINT `classifiedstouser_ibfk_1` FOREIGN KEY (`useremail`) REFERENCES `user` (`email`),
  CONSTRAINT `classifiedstouser_ibfk_2` FOREIGN KEY (`classifiedsId`) REFERENCES `classifieds` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classifiedstouser`
--

LOCK TABLES `classifiedstouser` WRITE;
/*!40000 ALTER TABLE `classifiedstouser` DISABLE KEYS */;
INSERT INTO `classifiedstouser` VALUES ('hilda.billiger@tsn.at',1,'2022-05-31 22:00:00'),('hilda.billiger@tsn.at',1,'2022-06-18 22:00:00'),('jujungmann@tsn.at',4,'2022-06-18 22:00:00'),('max.mustermann@gmx.at',2,'2022-06-11 22:00:00');
/*!40000 ALTER TABLE `classifiedstouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('hilda.billiger@tsn.at','ratrat','1980-04-14','loveHTL'),('jujungmann@tsn.at','schifoarer77','2005-07-23','Scurr'),('max.mustermann@gmx.at','Maxi1','1992-12-02','12345678'),('sitrailovic@tsn.at','xXLostermodusXx','2005-06-22','WerHatGefragt?');
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

-- Dump completed on 2022-06-20 12:14:38
