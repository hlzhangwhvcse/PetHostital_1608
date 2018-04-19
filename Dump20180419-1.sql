-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ajax
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=REDUNDANT COMMENT='5.1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'pic001.jpg',504,600),(2,'pic002.jpg',516,600),(3,'pic003.jpg',767,600),(4,'pic004.jpg',800,554),(5,'pic005.jpg',757,600);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cd_info`
--

DROP TABLE IF EXISTS `cd_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `singer` varchar(255) NOT NULL,
  `cdname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='3.3';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_info`
--

LOCK TABLES `cd_info` WRITE;
/*!40000 ALTER TABLE `cd_info` DISABLE KEYS */;
INSERT INTO `cd_info` VALUES (1,'ABBA','Love Stories'),(2,'ABBA','The Music Still Goes On'),(3,'Aqua','Aquarius [US]'),(4,'Backstreet Boys','Backstreet Boys'),(5,'Boyz II Men','Nathan Michael Shawn Wanya'),(6,'Bryan Adams','So Far So Good'),(7,'Cat Stevens','Classics, Vol. 24'),(8,'Celine Dion','New Day Has Come'),(9,'Celine Dion','Falling into You'),(10,'Celine Dion','Live A Paris'),(11,'Celine Dion','DEux'),(12,'Celine Dion','Olympia'),(13,'Celine Dion','Premieres Anees'),(14,'Celine Dion','If It Is Enough to Love'),(15,'Chumbawamba ','What You See Is What You Get'),(16,'Donny Osmond','This Is the Moment'),(17,'Enya','Shepherd Moons'),(18,'Luis Angel','Del Corazon Del Homb'),(19,'Manu Chao','Proxima Estacion: Esperanza'),(20,'Michael Learns to Rock','Paint My Love'),(21,'New Kids on the Block','Face the Music'),(22,'Paula Abdul','Head over Heels'),(23,'Ricky Martin','Sound Loaded'),(24,'Santana','Supernatural'),(25,'Selena','Entre a Mi Mundo'),(26,'Stevie B.','Healing'),(27,'Texas','Hush'),(28,'The Bee Gees','Record: Their Greatest Hits'),(29,'The Carpenters','Reflections'),(30,'The Neville Brothers','Live on Planet Earth'),(31,'Various','Platinum Collection'),(32,'Various','Notting Hill'),(33,'Various','1996 Grammy Nominees'),(34,'Various','Grammy\'s Greatest Moments, Vol. 1'),(35,'Various','1999 Grammy Nominees: Mainstream'),(36,'Various','Men Are from Mars, Women Are from Venus'),(37,'Various','Waiting to Exhale'),(38,'Various','Home for the Holidays [Polygram]'),(39,'Various','Bop Boys'),(40,'Various','Even Cowgirls Get the Blues'),(41,'Various','Now That\'s What I Call Music!, Vol. 3'),(42,'Various','Sabrina the Teenage Witch [Television Soundtrack]'),(43,'Various','Luv Collection: Hot Luv'),(44,'Various','Now That\'s What I Call Music!'),(45,'Various','City of Angels [Original Soundtrack]'),(46,'Various','Red Hot + Blue: A Tribute to Cole Porter'),(47,'Various','Tribute to Curtis Mayfield'),(48,'Various','Batman & Robin'),(49,'Various','Where the Heart Is [Original Soundtrack]'),(50,'Various','1998 Grammy Nominees');
/*!40000 ALTER TABLE `cd_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-19 11:57:11
