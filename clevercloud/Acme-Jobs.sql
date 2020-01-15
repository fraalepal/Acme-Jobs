-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: acme-jobs
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2a5vcjo3stlfcwadosjfq49l1` (`user_account_id`),
  CONSTRAINT `FK_2a5vcjo3stlfcwadosjfq49l1` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (4,0,3);
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (23,0,'2019-10-10 11:08:00.000000','http://www.google.com','Description for Sample announcement 01','Sample announcement    01'),(24,0,'2019-10-20 15:08:00.000000','http://www.marca.com','Description for Sample announcement 02','Sample announcement 02'),(25,0,'2019-09-01 10:12:00.000000','http://www.stackoverflow.com','Description for Sample announcement    03','Sample announcement 03');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anonymous`
--

DROP TABLE IF EXISTS `anonymous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anonymous` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6lnbc6fo3om54vugoh8icg78m` (`user_account_id`),
  CONSTRAINT `FK_6lnbc6fo3om54vugoh8icg78m` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anonymous`
--

LOCK TABLES `anonymous` WRITE;
/*!40000 ALTER TABLE `anonymous` DISABLE KEYS */;
INSERT INTO `anonymous` VALUES (2,0,1);
/*!40000 ALTER TABLE `anonymous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `optional_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtjlha5o7ry8m7nuuae58x76ng` (`optional_id`),
  CONSTRAINT `FKtjlha5o7ry8m7nuuae58x76ng` FOREIGN KEY (`optional_id`) REFERENCES `homp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (56,0,NULL,'Hola','https://www.acme.com',53),(57,0,NULL,'Hola',NULL,54),(58,0,'hola111!!!','Hola','https://www.acme.com',55),(71,0,NULL,'a','http://www.acme.com',53),(73,0,'$2a$05$a9MB9mLLTovRtdLBqsfHPu/StEftFZFqsQEVX./IiazELTPVdsZfC','aaa','http://www.acme.com',54),(75,0,NULL,'a','',55),(83,0,NULL,'a','',53);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `qualifications` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  `statement` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  `worker_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ct7r18vvxl5g4c4k7aefpa4do` (`reference`),
  KEY `FKoa6p4s2oyy7tf80xwc4r04vh6` (`job_id`),
  KEY `FKmbjdoxi3o93agxosoate4sxbt` (`worker_id`),
  CONSTRAINT `FKmbjdoxi3o93agxosoate4sxbt` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`),
  CONSTRAINT `FKoa6p4s2oyy7tf80xwc4r04vh6` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (48,0,'2019-10-05 00:00:00.000000',' ','Inglés B2','A0-J1:W1','Sociable','Me gusta trabajar, por eso quiero este trabajo','Pending',38,18),(49,0,'2019-11-05 01:00:00.000000',' ','Francés B2','A0-J2:W2','Amigable','Me gusta trabajar, por eso quiero este trabajo otra vez','Pending',39,18);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_record`
--

DROP TABLE IF EXISTS `audit_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `auditor_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdcrrgv6rkfw2ruvdja56un4ji` (`auditor_id`),
  KEY `FKlbvbyimxf6pxvbhkdd4vfhlnd` (`job_id`),
  CONSTRAINT `FKdcrrgv6rkfw2ruvdja56un4ji` FOREIGN KEY (`auditor_id`) REFERENCES `auditor` (`id`),
  CONSTRAINT `FKlbvbyimxf6pxvbhkdd4vfhlnd` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_record`
--

LOCK TABLES `audit_record` WRITE;
/*!40000 ALTER TABLE `audit_record` DISABLE KEYS */;
INSERT INTO `audit_record` VALUES (50,0,'Esto es el Audit Record 01','2019-11-05 00:00:00.000000','published','Audit Record 01',21,38),(51,0,'Esto es el Audit Record 02','2019-11-06 00:00:00.000000','draft','Audit Record 02',21,39);
/*!40000 ALTER TABLE `audit_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `responsibility_statement` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_clqcq9lyspxdxcp6o4f3vkelj` (`user_account_id`),
  CONSTRAINT `FK_clqcq9lyspxdxcp6o4f3vkelj` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
INSERT INTO `auditor` VALUES (21,0,20,'Auditor 1 firm','Auditor 1 responsibility statement');
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_request`
--

DROP TABLE IF EXISTS `auditor_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditor_request` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `account_id` int(11) NOT NULL,
  `firm` varchar(255) DEFAULT NULL,
  `responsibility_statement` varchar(255) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_request`
--

LOCK TABLES `auditor_request` WRITE;
/*!40000 ALTER TABLE `auditor_request` DISABLE KEYS */;
INSERT INTO `auditor_request` VALUES (58,0,17,'a','a',NULL),(59,0,14,'a','a',NULL);
/*!40000 ALTER TABLE `auditor_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticated`
--

DROP TABLE IF EXISTS `authenticated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authenticated` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_h52w0f3wjoi68b63wv9vwon57` (`user_account_id`),
  CONSTRAINT `FK_h52w0f3wjoi68b63wv9vwon57` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticated`
--

LOCK TABLES `authenticated` WRITE;
/*!40000 ALTER TABLE `authenticated` DISABLE KEYS */;
INSERT INTO `authenticated` VALUES (5,0,3),(16,0,14),(19,0,17),(22,0,20);
/*!40000 ALTER TABLE `authenticated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulletin`
--

DROP TABLE IF EXISTS `bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulletin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulletin`
--

LOCK TABLES `bulletin` WRITE;
/*!40000 ALTER TABLE `bulletin` DISABLE KEYS */;
INSERT INTO `bulletin` VALUES (13,0,'2019-10-17 03:00:00.000000','Chema cuidado con el branch','YanesBulletin'),(14,0,'2019-10-22 09:20:00.000000','Pues esto sería','MerinoBulletin'),(15,0,'2019-10-22 09:57:00.000000','Testing bulletin','BiedmaBulletin'),(16,0,'2019-10-22 11:00:00.000000','Cosas de maestro Yi','GataBulletin'),(17,0,'2019-08-10 09:00:00.000000','Hola','GuillermoBulletin'),(18,0,'2019-10-22 10:50:00.000000','Hola bienvenido a mi Bulletin','AléBulletin');
/*!40000 ALTER TABLE `bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge`
--

DROP TABLE IF EXISTS `challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `bronze` int(11) DEFAULT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gold` int(11) DEFAULT NULL,
  `silver` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge`
--

LOCK TABLES `challenge` WRITE;
/*!40000 ALTER TABLE `challenge` DISABLE KEYS */;
INSERT INTO `challenge` VALUES (26,0,100,'2030-12-01 11:12:00.000000','Probar challenge.',1000,500,'Challenge 01'),(27,0,80,'2040-12-31 11:12:00.000000','Por cortesía, para el futuro.',800,400,'Challenge 02 - Come back');
/*!40000 ALTER TABLE `challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `activities` varchar(255) DEFAULT NULL,
  `ceo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `incorporated` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  `web` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (29,0,'Description of the activities','Raúl García Castro','mikasa@company.com',_binary '\0','Mikasa, LLC','+1 (0) 000000','Economy',4,'http://www.example.com'),(30,0,'Description of the activities','Trevor Philips','trevor@company.com',_binary '','Trevor Philips, Inc.','+998 (9998) 999999999','Economy',5,'http://www.example.com');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6cyha9f1wpj0dpbxrrjddrqed` (`user_account_id`),
  CONSTRAINT `FK_6cyha9f1wpj0dpbxrrjddrqed` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descriptor`
--

DROP TABLE IF EXISTS `descriptor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descriptor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_4iw18njo4d0q8gvnhe04vmctw` (`job_id`),
  CONSTRAINT `FKgfulfilmwi4hhaquiu7fr5g0g` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descriptor`
--

LOCK TABLES `descriptor` WRITE;
/*!40000 ALTER TABLE `descriptor` DISABLE KEYS */;
INSERT INTO `descriptor` VALUES (41,0,'Trabajo de ejemplo 1',38),(42,0,'Trabajo de ejemplo 2',39),(43,0,'Trabajo de ejemplo 3',40);
/*!40000 ALTER TABLE `descriptor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duty`
--

DROP TABLE IF EXISTS `duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duty` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `time_percentage` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `descriptor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3cc3garl37bl7gswreqwr7pj4` (`descriptor_id`),
  CONSTRAINT `FK3cc3garl37bl7gswreqwr7pj4` FOREIGN KEY (`descriptor_id`) REFERENCES `descriptor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duty`
--

LOCK TABLES `duty` WRITE;
/*!40000 ALTER TABLE `duty` DISABLE KEYS */;
INSERT INTO `duty` VALUES (44,0,'Trabajando',40,'Duty1',41),(45,0,'Trabajando x2',20,'Duty2',42),(46,0,'Trabajando x4',40,'Duty2',42),(47,0,'Trabajando x11',20,'Duty2',43);
/*!40000 ALTER TABLE `duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employer`
--

DROP TABLE IF EXISTS `employer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_na4dfobmeuxkwf6p75abmb2tr` (`user_account_id`),
  CONSTRAINT `FK_na4dfobmeuxkwf6p75abmb2tr` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employer`
--

LOCK TABLES `employer` WRITE;
/*!40000 ALTER TABLE `employer` DISABLE KEYS */;
INSERT INTO `employer` VALUES (15,0,14,'Employer 1, Inc.','Sector 1');
/*!40000 ALTER TABLE `employer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gata`
--

DROP TABLE IF EXISTS `gata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gata` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `buffs` varchar(255) DEFAULT NULL,
  `nerfs` varchar(255) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gata`
--

LOCK TABLES `gata` WRITE;
/*!40000 ALTER TABLE `gata` DISABLE KEYS */;
INSERT INTO `gata` VALUES (19,0,'Yi - Guinsoo Bugfix, Kayn, Kog\'Maw, Lulu, Maokai, Viktor, Warwick','Garen, Pyke, Shaco','9.21'),(20,0,'Syndra, Lissandra','Master Yi, Lee Sin','9.20'),(21,0,'Syndra, Lissandra','Master Yi, Lee Sin','9.20'),(22,0,'Pyke','Kayn','9.10'),(23,0,'Syndra, Lissandra','Master Yi, Lee Sin','9.20');
/*!40000 ALTER TABLE `gata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gata_bulletin`
--

DROP TABLE IF EXISTS `gata_bulletin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gata_bulletin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `buffs` varchar(255) DEFAULT NULL,
  `nerfs` varchar(255) DEFAULT NULL,
  `patch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gata_bulletin`
--

LOCK TABLES `gata_bulletin` WRITE;
/*!40000 ALTER TABLE `gata_bulletin` DISABLE KEYS */;
INSERT INTO `gata_bulletin` VALUES (19,0,'Yi - Guinsoo Bugfix, Kayn, Kog\'Maw, Lulu, Maokai, Viktor, Warwick','Garen, Pyke, Shaco','9.21');
/*!40000 ALTER TABLE `gata_bulletin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (60);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `homp`
--

DROP TABLE IF EXISTS `homp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `homp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lmmfdfbsi0p8oplcmvxyhynjc` (`job_id`),
  CONSTRAINT `FKolvnhgkogf6r2898okj9sy152` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `homp`
--

LOCK TABLES `homp` WRITE;
/*!40000 ALTER TABLE `homp` DISABLE KEYS */;
INSERT INTO `homp` VALUES (53,0,'Feliz navidad','https://www.acme.com',38),(54,0,'Feliz jalowin','https://www.acme.com',39),(55,0,'Happy hanuka','https://www.acme.com',40),(66,0,'a\r\n',NULL,65),(69,0,'a','http://www.acme.com',68);
/*!40000 ALTER TABLE `homp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investor_record`
--

DROP TABLE IF EXISTS `investor_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `investor_record` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `investing_statement` varchar(255) DEFAULT NULL,
  `investor` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `stars` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investor_record`
--

LOCK TABLES `investor_record` WRITE;
/*!40000 ALTER TABLE `investor_record` DISABLE KEYS */;
INSERT INTO `investor_record` VALUES (31,0,'http://www.google.com','Elon Musk','Technology',5),(32,0,'http://www.marca.com','Warren Buffett','Real Estate',5);
/*!40000 ALTER TABLE `investor_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `final_mode` bit(1) NOT NULL,
  `more_info` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `salary_amount` double DEFAULT NULL,
  `salary_currency` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `employer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7jmfdvs0b0jx7i33qxgv22h7b` (`reference`),
  KEY `FK3rxjf8uh6fh2u990pe8i2at0e` (`employer_id`),
  CONSTRAINT `FK3rxjf8uh6fh2u990pe8i2at0e` FOREIGN KEY (`employer_id`) REFERENCES `employer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (38,0,'2020-09-01 10:12:00.000000',_binary '','http://www.ej.com','EMP1-JOB1',2000,'$','Published','Sample job 01',15),(39,0,'2040-03-21 20:09:00.000000',_binary '','http://www.ej2.com','EMP1-JOB2',1000,'$','Published','Sample job 02',15),(40,0,'2021-11-11 20:09:00.000000',_binary '','http://www.ej3.com','EMP1-JOB3',900,'$','Published','Sample job 03',15);
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqg3nbb1eigjsqxvnh15ohxge0` (`thread_id`),
  KEY `FK425jlfgp27srb308wipy7kfhq` (`user_id`),
  CONSTRAINT `FK425jlfgp27srb308wipy7kfhq` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`),
  CONSTRAINT `FKqg3nbb1eigjsqxvnh15ohxge0` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (52,0,'Hola, buenas tardes.','2019-10-10 11:08:00.000000','abcdefghijklmnñopqrst','Hola',12,16),(53,0,'Adiós, buenas tardes.','2019-07-10 09:00:00.000000','abcdefghijklmnñopqrst','Adiós',12,19),(54,0,'Buenas tardes.','2019-01-10 16:34:00.000000','abcdefghijklmnñopqrst','Buenas',12,22),(55,0,'Ayuda por favor, no puedo hacer tanto trabajo yo solo.','2019-01-10 16:34:00.000000','abcdefghijklmnñopqrst','Ayuda',13,19),(56,0,'Te mando a alguien','2019-01-10 16:40:00.000000','abcdefghijklmnñopqrst','Contrato a alguien más',13,16),(57,0,'Gracias, everything worked like a charm.','2019-01-10 16:58:00.000000','abcdefghijklmnñopqrst','Gracias',13,19);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `money_max_amount` double DEFAULT NULL,
  `money_max_currency` varchar(255) DEFAULT NULL,
  `money_min_amount` double DEFAULT NULL,
  `money_min_currency` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_iex7e8fs0fh89yxpcnm1orjkm` (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (33,0,'2778-01-01 11:00:00.000000','2019-09-01 10:12:00.000000',1200,'€',900,'€','Primera oferta de prueba','OABCD-01234','Sample offer 01'),(34,0,'2030-02-01 11:00:00.000000','2019-09-14 23:00:00.000000',1500,'€',100,'€','Segunda oferta de prueba','OZZZZ-12345','Sample offer 02'),(35,0,'2040-06-01 10:00:00.000000','2019-10-05 00:00:00.000000',200,'€',150,'€','Tercera oferta de prueba','OZZDD-01234','Sample offer 03');
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `optionaljob`
--

DROP TABLE IF EXISTS `optionaljob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `optionaljob` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `job_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cie20iyoc76m9fjdu8v7ujt04` (`job_id`),
  CONSTRAINT `FKta6iaf44k96gdjrrafy6n0ow3` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `optionaljob`
--

LOCK TABLES `optionaljob` WRITE;
/*!40000 ALTER TABLE `optionaljob` DISABLE KEYS */;
INSERT INTO `optionaljob` VALUES (53,0,'Feliz navidad','https://www.acme.com',38),(54,0,'Feliz jalowin','https://www.acme.com',39),(55,0,'Happy hanuka','https://www.acme.com',40),(70,2,'a\r\n','http://www.acme.com',69);
/*!40000 ALTER TABLE `optionaljob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participations`
--

DROP TABLE IF EXISTS `participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participations` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `thread_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb87athrvhjpdadeorrsulk88` (`thread_id`),
  KEY `FK7jv04b7326650mnxewq248bot` (`user_id`),
  CONSTRAINT `FK7jv04b7326650mnxewq248bot` FOREIGN KEY (`user_id`) REFERENCES `authenticated` (`id`),
  CONSTRAINT `FKb87athrvhjpdadeorrsulk88` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participations`
--

LOCK TABLES `participations` WRITE;
/*!40000 ALTER TABLE `participations` DISABLE KEYS */;
/*!40000 ALTER TABLE `participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provider` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_b1gwnjqm6ggy9yuiqm0o4rlmd` (`user_account_id`),
  CONSTRAINT `FK_b1gwnjqm6ggy9yuiqm0o4rlmd` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requestt`
--

DROP TABLE IF EXISTS `requestt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requestt` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `deadline` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `reward_amount` double DEFAULT NULL,
  `reward_currency` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ao5g68pinvjt8vamovbekyvhj` (`ticker`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requestt`
--

LOCK TABLES `requestt` WRITE;
/*!40000 ALTER TABLE `requestt` DISABLE KEYS */;
INSERT INTO `requestt` VALUES (36,0,'2040-09-01 10:12:00.000000','descripcionnn','2019-09-01 10:12:00.000000',456,'€','Raaaa-12345','Sample    request 01'),(37,0,'2040-09-01 10:12:00.000000','descripcionnnw','2019-09-01 10:12:00.000000',456,'€','Raaaa-54321','Sample request 02');
/*!40000 ALTER TABLE `requestt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segundo`
--

DROP TABLE IF EXISTS `segundo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `segundo` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `optional_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiy95lwp7e1ecmulqu0i2xkvpm` (`optional_id`),
  CONSTRAINT `FKiy95lwp7e1ecmulqu0i2xkvpm` FOREIGN KEY (`optional_id`) REFERENCES `optionaljob` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segundo`
--

LOCK TABLES `segundo` WRITE;
/*!40000 ALTER TABLE `segundo` DISABLE KEYS */;
INSERT INTO `segundo` VALUES (56,0,NULL,'Hola',53),(57,0,NULL,'Hola',54),(58,0,'hola111!!!','Hola',55),(65,0,NULL,'a',53),(67,0,'$2a$05$STcMB5Uqkq8m5MvS6n6a5e2suBVTCpghGHVvOwPKwtlwmocqzhMhO','a',53),(77,0,NULL,'a',55),(79,0,'$2a$05$HOamLlL5Tg393bztU/fcU.xMQRF/af5MIqkd9GHJ3Vl.7.6DNYxk.','a',55);
/*!40000 ALTER TABLE `segundo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shout`
--

DROP TABLE IF EXISTS `shout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shout` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shout`
--

LOCK TABLES `shout` WRITE;
/*!40000 ALTER TABLE `shout` DISABLE KEYS */;
INSERT INTO `shout` VALUES (6,0,'Fofi','2019-07-06 22:00:00.000000','oju'),(7,0,'nadie','2019-09-06 22:00:00.000000','nada'),(8,0,'Francisco Alé Palacios','2019-10-15 11:13:00.000000','Hola Mundo!!'),(9,0,'Guillermo Losada Ostos','2009-05-15 09:13:00.000000','Hola, buenas tardes.'),(10,0,'Jordi Wild','2019-09-09 08:00:00.000000','Rock forever, giorgios'),(11,0,'Albert Rivera','2018-11-04 20:00:00.000000','Don\'t get nervous, Mr. Sánchez'),(12,0,'Pedro Biedma','2019-10-15 16:00:00.000000','Creando mi primer shout');
/*!40000 ALTER TABLE `shout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_filter`
--

DROP TABLE IF EXISTS `spam_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spam_filter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `bad_words` varchar(255) DEFAULT NULL,
  `threshold` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_filter`
--

LOCK TABLES `spam_filter` WRITE;
/*!40000 ALTER TABLE `spam_filter` DISABLE KEYS */;
INSERT INTO `spam_filter` VALUES (28,0,'sex,nigeria,cialis,viagra,you\'ve    won,million dollar,has ganado,millon de dolares,sexo',1);
/*!40000 ALTER TABLE `spam_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spam_filter_bad_words`
--

DROP TABLE IF EXISTS `spam_filter_bad_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spam_filter_bad_words` (
  `spam_filter_id` int(11) NOT NULL,
  `bad_words` varchar(255) DEFAULT NULL,
  KEY `FK3q0sjl7qnwukxhnt9atkhc6xy` (`spam_filter_id`),
  CONSTRAINT `FK3q0sjl7qnwukxhnt9atkhc6xy` FOREIGN KEY (`spam_filter_id`) REFERENCES `spam_filter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spam_filter_bad_words`
--

LOCK TABLES `spam_filter_bad_words` WRITE;
/*!40000 ALTER TABLE `spam_filter_bad_words` DISABLE KEYS */;
INSERT INTO `spam_filter_bad_words` VALUES (13,'sex'),(13,'nigeria'),(13,'cialis'),(13,'viagra'),(13,'you\'ve won'),(13,'million dollar'),(13,'has ganado'),(13,'millon de dolares'),(13,'sexo');
/*!40000 ALTER TABLE `spam_filter_bad_words` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread`
--

DROP TABLE IF EXISTS `thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime(6) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread`
--

LOCK TABLES `thread` WRITE;
/*!40000 ALTER TABLE `thread` DISABLE KEYS */;
INSERT INTO `thread` VALUES (12,0,'2019-01-09 16:34:00.000000','saludos'),(13,0,'2019-01-09 16:34:00.000000','Ayuda para trabajo');
/*!40000 ALTER TABLE `thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thread_authenticated`
--

DROP TABLE IF EXISTS `thread_authenticated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thread_authenticated` (
  `thread_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  KEY `FKkuamwlt147dsxim98bfhh4dsr` (`users_id`),
  KEY `FKjsja3s5mr66x5nxm9dd8kut3r` (`thread_id`),
  CONSTRAINT `FKjsja3s5mr66x5nxm9dd8kut3r` FOREIGN KEY (`thread_id`) REFERENCES `thread` (`id`),
  CONSTRAINT `FKkuamwlt147dsxim98bfhh4dsr` FOREIGN KEY (`users_id`) REFERENCES `authenticated` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thread_authenticated`
--

LOCK TABLES `thread_authenticated` WRITE;
/*!40000 ALTER TABLE `thread_authenticated` DISABLE KEYS */;
INSERT INTO `thread_authenticated` VALUES (12,19),(12,16),(12,22),(13,19),(13,16);
/*!40000 ALTER TABLE `thread_authenticated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `identity_email` varchar(255) DEFAULT NULL,
  `identity_name` varchar(255) DEFAULT NULL,
  `identity_phone_area_code` varchar(255) DEFAULT NULL,
  `identity_phone_country_code` int(11) DEFAULT NULL,
  `identity_phone_number` varchar(255) DEFAULT NULL,
  `identity_surname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
INSERT INTO `user_account` VALUES (1,0,_binary '\0','john.doe@acme.com','John',NULL,1,'123456','Doe','$2a$05$e5vHMVj4/XaMHgQm8sY9a.FxO5awjpiDa38Hztu9jvLimKVlnblIe','anonymous'),(3,0,_binary '','administrator@acme.com','Administrator','0',44,'123-456','Acme.com','$2a$05$Mhcbo8Cb76/Z0kdJqu.q7eu2K1nRQlLNqxgEg64QsL0IaUJpJEREG','administrator'),(14,0,_binary '','employer1@acme.com','Employer',NULL,1,'123456','One','$2a$05$IpMSjMgUVNECEvAOvlWmS.lNZCWASxYTynOLoQ.kjW4j7AK4XQpZC','employer1'),(17,3,_binary '','worker1@acme.com','Worker',NULL,1,'67 123-456','One','$2a$05$m0L/JzFJRGr92y7w4kGDxeHidbL2ImTCjjVaCSzCSbfbl2DPglyP.','worker1'),(20,0,_binary '','auditor1@acme.com','Auditor',NULL,34,'123 456 789','One','$2a$05$bLdFsls8pfKCSOkQQoT6N.ldziz6CbygUfztmCp.4ENGXhHKGH6Y2','auditor1');
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `user_account_id` int(11) DEFAULT NULL,
  `qualifications` varchar(255) DEFAULT NULL,
  `skills` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l5q1f33vs2drypmbdhpdgwfv3` (`user_account_id`),
  CONSTRAINT `FK_l5q1f33vs2drypmbdhpdgwfv3` FOREIGN KEY (`user_account_id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (18,0,17,'Worker 1 qualifications','Worker 1 skills');
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-15 13:27:56
