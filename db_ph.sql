-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_ph
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
-- Table structure for table `t_pet`
--

DROP TABLE IF EXISTS `t_pet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `birthdate` varchar(45) DEFAULT NULL,
  `photo` varchar(256) DEFAULT NULL,
  `ownerId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pet`
--

LOCK TABLES `t_pet` WRITE;
/*!40000 ALTER TABLE `t_pet` DISABLE KEYS */;
INSERT INTO `t_pet` VALUES (25,'Kitty Cat','2018-01-01','/photo/KittyCat.jpg',3),(26,'Mickey Mouse','2018-01-02','/photo/MickeyMouse.jpg',6),(27,'Puppy Dog','2018-01-03','/photo/PuppyDog.jpg',6),(28,'Teddy Bear','2018-01-04','/photo/TeddyBear.jpg',7),(29,'Tom Cat','2018-01-05','/photo/TomCat.jpg',7);
/*!40000 ALTER TABLE `t_pet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_speciality`
--

DROP TABLE IF EXISTS `t_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_speciality` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_speciality`
--

LOCK TABLES `t_speciality` WRITE;
/*!40000 ALTER TABLE `t_speciality` DISABLE KEYS */;
INSERT INTO `t_speciality` VALUES (1,'Pet Dog',NULL),(2,'Pet Cat',NULL),(3,'Pet Fish','cure pet fish'),(4,'Pet Bird','cure pet bird'),(5,'Pet Bear','cure pet bear'),(6,'Pet Mouse','cure pet mouse'),(7,'Pet Horse','cure pet horse');
/*!40000 ALTER TABLE `t_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `pwd` varchar(45) NOT NULL,
  `tel` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','admin','admin','888','aaa'),(3,'customer','hlzhang','666','9999999999','beijing'),(6,'customer','wangsicong','123456','999999','dalian'),(7,'customer','mayun','123456','','');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vet`
--

DROP TABLE IF EXISTS `t_vet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vet`
--

LOCK TABLES `t_vet` WRITE;
/*!40000 ALTER TABLE `t_vet` DISABLE KEYS */;
INSERT INTO `t_vet` VALUES (10,'xiaowang'),(14,'xiaoma'),(15,'xiaozhao'),(16,'xiaoliu');
/*!40000 ALTER TABLE `t_vet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_vet_speciality`
--

DROP TABLE IF EXISTS `t_vet_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_vet_speciality` (
  `vetId` int(11) NOT NULL,
  `specId` varchar(45) NOT NULL,
  PRIMARY KEY (`vetId`,`specId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vet_speciality`
--

LOCK TABLES `t_vet_speciality` WRITE;
/*!40000 ALTER TABLE `t_vet_speciality` DISABLE KEYS */;
INSERT INTO `t_vet_speciality` VALUES (1,'1'),(1,'2'),(2,'1'),(3,'1'),(4,'4'),(5,'1'),(5,'3'),(5,'5'),(6,'1'),(6,'2'),(6,'3'),(6,'4'),(6,'5'),(7,'1'),(7,'2'),(7,'3'),(8,'1'),(8,'2'),(8,'3'),(8,'4'),(8,'5'),(8,'6'),(9,'1'),(10,'1'),(10,'2'),(11,'3'),(11,'6'),(11,'7'),(12,'2'),(12,'3'),(13,'4'),(13,'5'),(13,'6'),(14,'2'),(14,'3'),(15,'1'),(15,'6'),(16,'1'),(16,'6'),(17,'2'),(17,'3'),(17,'6');
/*!40000 ALTER TABLE `t_vet_speciality` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-19 10:00:39