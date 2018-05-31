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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pet`
--

LOCK TABLES `t_pet` WRITE;
/*!40000 ALTER TABLE `t_pet` DISABLE KEYS */;
INSERT INTO `t_pet` VALUES (1,'Teddy Bear','2017-01-01','/photo/TeddyBear.jpg',3),(2,'Mikey Mouse','2016-06-06','/photo/MickeyMouse.jpg',4),(3,'Puppy Dog','2017-01-01','/photo/PuppyDog.jpg',5),(4,'Kitty Cat','2016-09-09','/photo/KittyCat.jpg',5),(6,'tom','2018-05-18','photo/default.jpg',3),(7,'puppy','2018-05-19','photo/default.jpg',9),(8,'kitty','2018-05-19','photo/default.jpg',11),(9,'kitty','2018-05-25','photo/1527210008776.jpg',9),(10,'Teddy','2018-05-24','photo/1527210020367.jpg',10),(11,'Mickey','2018-05-24','photo/1527210035370.jpg',11),(12,'aaaaxxxxxyyyy','','photo/default.jpg',3),(13,'王思聪的葱','2018-05-05','photo/1527734482259.jpg',12),(14,'李彦宏的熊','2018-05-05','photo/1527734490027.jpg',3),(15,'马云的猫','2018-05-05','photo/1527734501078.jpg',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_speciality`
--

LOCK TABLES `t_speciality` WRITE;
/*!40000 ALTER TABLE `t_speciality` DISABLE KEYS */;
INSERT INTO `t_speciality` VALUES (1,'Pet Dog',NULL),(2,'Pet Cat',NULL),(3,'Pet Bird',NULL),(4,'Pet Fish',NULL),(5,'Pet Pig','Cure Pet Pig'),(6,'Pet Duck','cure pet bird'),(7,'Pet Sheep','cure pet sheep'),(8,'Pet Mouse','cure pet mouse'),(9,'爬虫专业','专门治疗爬虫的专业');
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
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin','admin','21232F297A57A5A743894A0E4A801FC3',NULL,NULL),(2,'admin','sa','C12E01F2A13FF5587E1E9E4AEDB8242D',NULL,NULL),(3,'customer','hlzhang','E10ADC3949BA59ABBE56E057F20F883E','88888888888','wuhan'),(9,'customer','mayun','E10ADC3949BA59ABBE56E057F20F883E','999999999','hangzhou'),(10,'customer','mahuateng','E10ADC3949BA59ABBE56E057F20F883E','8888888888','shenzhen'),(11,'customer','wangsicong','E10ADC3949BA59ABBE56E057F20F883E','7777777777','dalian'),(12,'customer','王思聪','E10ADC3949BA59ABBE56E057F20F883E','8888888888','大连万达'),(13,'customer','李彦宏','E10ADC3949BA59ABBE56E057F20F883E','1234567890','北京百度大厦'),(14,'customer','马云','E10ADC3949BA59ABBE56E057F20F883E','555555555555','杭州阿里巴巴'),(15,'customer','马化腾','E10ADC3949BA59ABBE56E057F20F883E','77777788888','深圳腾讯大楼');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_vet`
--

LOCK TABLES `t_vet` WRITE;
/*!40000 ALTER TABLE `t_vet` DISABLE KEYS */;
INSERT INTO `t_vet` VALUES (1,'zhangsan'),(5,'lisi'),(7,'wangwu'),(8,'zhaoliu'),(11,'王爬虫');
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
INSERT INTO `t_vet_speciality` VALUES (1,'1'),(1,'2'),(1,'6'),(2,'2'),(2,'3'),(3,'3'),(4,'4'),(5,'7'),(6,'4'),(6,'5'),(6,'6'),(7,'3'),(7,'5'),(7,'7'),(8,'2'),(8,'4'),(8,'5'),(8,'7'),(9,'1'),(10,'6'),(10,'7'),(10,'8'),(11,'9');
/*!40000 ALTER TABLE `t_vet_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_visit`
--

DROP TABLE IF EXISTS `t_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petId` int(11) NOT NULL,
  `vetId` int(11) NOT NULL,
  `visitdate` varchar(45) NOT NULL,
  `description` varchar(256) NOT NULL,
  `treatment` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_visit`
--

LOCK TABLES `t_visit` WRITE;
/*!40000 ALTER TABLE `t_visit` DISABLE KEYS */;
INSERT INTO `t_visit` VALUES (1,1,1,'2018-05-23','get a cold','drink more water'),(2,1,1,'2018-05-31 10:38:43','ggggggggggg','gghhhhhhhhh');
/*!40000 ALTER TABLE `t_visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-31 11:19:10
