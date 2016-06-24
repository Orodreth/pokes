-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: pokes
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`sender_id`),
  KEY `fk_pokes_users1_idx` (`receiver_id`),
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pokes_users1` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
INSERT INTO `pokes` VALUES (2,2,1,'2016-06-24 10:39:47','2016-06-24 10:39:47'),(3,2,1,'2016-06-24 10:39:50','2016-06-24 10:39:50'),(4,2,1,'2016-06-24 10:40:18','2016-06-24 10:40:18'),(5,1,2,'2016-06-24 10:42:59','2016-06-24 10:42:59'),(6,1,2,'2016-06-24 10:42:59','2016-06-24 10:42:59'),(7,1,2,'2016-06-24 10:43:00','2016-06-24 10:43:00'),(8,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(9,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(10,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(11,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(12,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(13,1,2,'2016-06-24 10:43:03','2016-06-24 10:43:03'),(14,1,2,'2016-06-24 10:43:04','2016-06-24 10:43:04'),(15,3,2,'2016-06-24 10:44:39','2016-06-24 10:44:39'),(16,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(17,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(18,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(19,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(20,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(21,3,1,'2016-06-24 10:44:45','2016-06-24 10:44:45'),(22,3,1,'2016-06-24 10:44:46','2016-06-24 10:44:46'),(23,3,1,'2016-06-24 10:44:46','2016-06-24 10:44:46'),(24,3,1,'2016-06-24 10:44:46','2016-06-24 10:44:46'),(25,3,1,'2016-06-24 10:44:46','2016-06-24 10:44:46'),(26,3,1,'2016-06-24 10:45:25','2016-06-24 10:45:25'),(27,3,2,'2016-06-24 10:45:27','2016-06-24 10:45:27'),(28,1,4,'2016-06-24 11:10:52','2016-06-24 11:10:52'),(29,1,4,'2016-06-24 11:20:24','2016-06-24 11:20:24'),(30,1,3,'2016-06-24 11:20:24','2016-06-24 11:20:24'),(31,4,1,'2016-06-24 11:20:40','2016-06-24 11:20:40'),(32,4,2,'2016-06-24 11:20:41','2016-06-24 11:20:41'),(33,4,3,'2016-06-24 11:20:42','2016-06-24 11:20:42'),(34,1,2,'2016-06-24 11:25:04','2016-06-24 11:25:04'),(35,1,3,'2016-06-24 11:25:05','2016-06-24 11:25:05'),(36,1,3,'2016-06-24 11:25:06','2016-06-24 11:25:06'),(37,1,3,'2016-06-24 11:25:06','2016-06-24 11:25:06'),(38,1,4,'2016-06-24 11:25:07','2016-06-24 11:25:07'),(39,1,4,'2016-06-24 11:25:09','2016-06-24 11:25:09'),(40,1,4,'2016-06-24 11:25:10','2016-06-24 11:25:10'),(41,1,4,'2016-06-24 11:25:15','2016-06-24 11:25:15');
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Calvin Ying','Cal','caltianyu5@gmail.com','$2b$12$P4Lc6faQe.OQxP206SWk8.LMRJ16zDVwaJLAA3QiFr5wBfbwdWcOe','2016-06-01','2016-06-24 10:25:44','2016-06-24 10:25:44'),(2,'Edlenen','Ed','ed@yahoo.com','$2b$12$kUNkNMvzAZ4Z3IxSv9ObwOljIMkDcdfZy8IoImT4vhzflD8GpfROG','2016-06-14','2016-06-24 10:32:50','2016-06-24 10:32:50'),(3,'Nicole Zhou','Nic','nic@yahoo.com','$2b$12$Cnei7JlaIlU3FfC1Td9.2.SOaJmzywZ3SG6LBJoCR9.eD6wf79Ox6','2016-06-05','2016-06-24 10:43:53','2016-06-24 10:43:53'),(4,'TT','TT','tt@yahoo.com','$2b$12$rsfQOtlcR2RoePA6oQTgW./yhvy.GoMBpCPFeWNXn0JFkMS39jXAO','2016-06-05','2016-06-24 11:07:59','2016-06-24 11:07:59');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-24 11:28:03