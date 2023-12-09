-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hrm_project
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add hobby',7,'add_hobby'),(26,'Can change hobby',7,'change_hobby'),(27,'Can delete hobby',7,'delete_hobby'),(28,'Can view hobby',7,'view_hobby'),(29,'Can add personality',8,'add_personality'),(30,'Can change personality',8,'change_personality'),(31,'Can delete personality',8,'delete_personality'),(32,'Can view personality',8,'view_personality'),(33,'Can add employee hobby',9,'add_employeehobby'),(34,'Can change employee hobby',9,'change_employeehobby'),(35,'Can delete employee hobby',9,'delete_employeehobby'),(36,'Can view employee hobby',9,'view_employeehobby'),(37,'Can add employee personality',10,'add_employeepersonality'),(38,'Can change employee personality',10,'change_employeepersonality'),(39,'Can delete employee personality',10,'delete_employeepersonality'),(40,'Can view employee personality',10,'view_employeepersonality'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add employees',12,'add_employees'),(46,'Can change employees',12,'change_employees'),(47,'Can delete employees',12,'delete_employees'),(48,'Can view employees',12,'view_employees'),(49,'Can add employee skills',13,'add_employeeskills'),(50,'Can change employee skills',13,'change_employeeskills'),(51,'Can delete employee skills',13,'delete_employeeskills'),(52,'Can view employee skills',13,'view_employeeskills');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$lQHL87nWtvjroUbRYqE5kf$k+AYB7UqMVZz6e1zXotn5n4cQUxpZh/bN4DKOUMYhGU=','2023-12-09 08:18:38.317262',1,'admin','','','admin@gmail.com',1,1,'2023-12-09 08:16:05.278223');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'project_app','employeehobby'),(10,'project_app','employeepersonality'),(12,'project_app','employees'),(13,'project_app','employeeskills'),(7,'project_app','hobby'),(8,'project_app','personality'),(11,'project_app','skill'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-09 08:15:52.234705'),(2,'auth','0001_initial','2023-12-09 08:15:52.500943'),(3,'admin','0001_initial','2023-12-09 08:15:52.593969'),(4,'admin','0002_logentry_remove_auto_add','2023-12-09 08:15:52.609602'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-09 08:15:52.621212'),(6,'contenttypes','0002_remove_content_type_name','2023-12-09 08:15:52.674627'),(7,'auth','0002_alter_permission_name_max_length','2023-12-09 08:15:52.716599'),(8,'auth','0003_alter_user_email_max_length','2023-12-09 08:15:52.728853'),(9,'auth','0004_alter_user_username_opts','2023-12-09 08:15:52.742225'),(10,'auth','0005_alter_user_last_login_null','2023-12-09 08:15:52.771892'),(11,'auth','0006_require_contenttypes_0002','2023-12-09 08:15:52.771892'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-09 08:15:52.771892'),(13,'auth','0008_alter_user_username_max_length','2023-12-09 08:15:52.812381'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-09 08:15:52.849862'),(15,'auth','0010_alter_group_name_max_length','2023-12-09 08:15:52.862369'),(16,'auth','0011_update_proxy_permissions','2023-12-09 08:15:52.862369'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-09 08:15:52.906012'),(18,'project_app','0001_initial','2023-12-09 08:15:53.135137'),(19,'project_app','0002_alter_hobby_description','2023-12-09 08:15:53.135137'),(20,'project_app','0003_rename_description_skill_skill_description_and_more','2023-12-09 08:15:53.185654'),(21,'project_app','0004_employees_alter_employeehobby_employee_and_more','2023-12-09 08:15:53.351818'),(22,'project_app','0005_remove_employees_exit_date_remove_employees_skills_and_more','2023-12-09 08:15:53.398518'),(23,'project_app','0006_remove_employees_idemployees','2023-12-09 08:15:53.428253'),(24,'project_app','0007_rename_skill_skills','2023-12-09 08:15:53.438699'),(25,'project_app','0008_rename_skills_skill','2023-12-09 08:15:53.462522'),(26,'project_app','0009_remove_employees_personalities_and_more','2023-12-09 08:15:53.492404'),(27,'project_app','0010_alter_employees_personalities','2023-12-09 08:15:53.568055'),(28,'project_app','0011_alter_employeepersonality_personality','2023-12-09 08:15:53.621993'),(29,'project_app','0012_remove_employees_personalities','2023-12-09 08:15:53.665318'),(30,'project_app','0013_employees_personalities_and_more','2023-12-09 08:15:53.728926'),(31,'project_app','0014_employeeskills','2023-12-09 08:15:53.749898'),(32,'project_app','0015_delete_employeeskills_remove_employees_personalities_and_more','2023-12-09 08:15:53.785545'),(33,'project_app','0016_employeeskills_remove_employees_personality_and_more','2023-12-09 08:15:53.838285'),(34,'project_app','0017_alter_employees_middle_name','2023-12-09 08:15:53.870261'),(35,'project_app','0018_remove_employees_personalities_and_more','2023-12-09 08:15:53.904253'),(36,'project_app','0019_rename_employeeskills_employeeskill_employee_and_more','2023-12-09 08:15:54.019563'),(37,'project_app','0020_rename_employee_employees','2023-12-09 08:15:54.100613'),(38,'project_app','0021_delete_employeeskill','2023-12-09 08:15:54.116247'),(39,'project_app','0022_remove_employees_personalities_employees_personality','2023-12-09 08:15:54.141411'),(40,'sessions','0001_initial','2023-12-09 08:15:54.167890'),(41,'project_app','0023_remove_employees_personality','2023-12-09 08:25:46.460234'),(42,'project_app','0024_employees_personality','2023-12-09 08:25:46.491985'),(43,'project_app','0025_rename_personality_employees_personalities','2023-12-09 08:27:39.282079'),(44,'project_app','0026_remove_employees_personalities_and_more','2023-12-09 08:29:29.846527'),(45,'project_app','0002_skill_skills_idskills','2023-12-09 08:47:41.192821'),(46,'project_app','0002_remove_skill_skills_idskills','2023-12-09 08:55:35.874415');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('yf1cmss6gtvsoizwmyl7z9rukgotkhsx','.eJxVjMsOgjAQRf-la9NQkGHq0j3fQOZVixpIKKyM_64kLHR7zzn35Qba1jxsxZZhVHdxwZ1-NyZ52LQDvdN0m73M07qM7HfFH7T4flZ7Xg_37yBTyd-aFbqOOwCUBo2wYkBDrDAm0mBijahULdRyDsAxtJQio4AlTZJqce8P9wQ5Dg:1rBsXm:8PoerDt5YjWGNr0wNTGULMskRUALVysZmmqmz7CzIcM','2023-12-23 08:18:38.319325');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employeehobby`
--

DROP TABLE IF EXISTS `project_app_employeehobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employeehobby` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `hobby_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_employee_hobby_id_5f663387_fk_project_a` (`hobby_id`),
  KEY `project_app_employee_employee_id_da7312a8_fk_project_a` (`employee_id`),
  CONSTRAINT `project_app_employee_employee_id_da7312a8_fk_project_a` FOREIGN KEY (`employee_id`) REFERENCES `project_app_employees` (`id`),
  CONSTRAINT `project_app_employee_hobby_id_5f663387_fk_project_a` FOREIGN KEY (`hobby_id`) REFERENCES `project_app_hobby` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=761 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeehobby`
--

LOCK TABLES `project_app_employeehobby` WRITE;
/*!40000 ALTER TABLE `project_app_employeehobby` DISABLE KEYS */;
INSERT INTO `project_app_employeehobby` VALUES (5,1,5),(7,1,8),(9,2,1),(10,2,2),(11,2,3),(12,2,4),(13,2,5),(14,2,6),(15,3,1),(16,3,2),(17,3,3),(18,3,4),(19,3,5),(20,3,6),(21,3,7),(22,3,8),(23,4,6),(24,5,8),(25,5,2),(26,5,7),(27,6,1),(28,6,3),(29,6,4),(30,6,6),(31,6,8),(32,7,1),(33,7,2),(34,7,4),(35,7,5),(36,7,7),(37,7,8),(38,8,8),(39,8,3),(40,9,1),(41,9,2),(42,9,3),(43,9,4),(44,9,5),(45,9,6),(46,9,7),(47,9,8),(48,10,1),(49,10,2),(50,10,4),(51,10,5),(52,10,6),(53,10,8),(54,11,5),(55,12,1),(56,12,3),(57,12,6),(58,12,7),(59,12,8),(60,13,1),(61,13,3),(62,13,4),(63,13,5),(64,13,6),(65,13,8),(66,14,1),(67,14,2),(68,14,4),(69,14,6),(70,14,7),(71,14,8),(72,15,1),(73,15,3),(74,15,4),(75,15,6),(76,15,7),(77,15,8),(78,16,3),(79,16,4),(80,16,5),(81,16,7),(82,17,2),(83,17,3),(84,17,4),(85,17,5),(86,17,7),(87,17,8),(88,18,2),(89,18,3),(90,18,4),(91,18,7),(92,19,1),(93,19,2),(94,19,3),(95,19,4),(96,19,6),(97,19,7),(98,20,1),(99,20,3),(100,20,4),(101,20,6),(102,20,7),(103,20,8),(104,21,1),(105,21,2),(106,21,3),(107,21,4),(108,21,6),(109,21,8),(110,22,1),(111,22,2),(112,22,4),(113,22,5),(114,22,6),(115,22,8),(116,23,1),(117,23,2),(118,23,3),(119,23,4),(120,23,5),(121,23,6),(122,23,7),(123,23,8),(124,24,2),(125,24,3),(126,24,4),(127,24,5),(128,24,6),(129,24,7),(130,24,8),(131,25,1),(132,25,2),(133,25,4),(134,25,5),(135,25,6),(136,25,7),(137,25,8),(138,26,1),(139,27,1),(140,27,2),(141,27,4),(142,27,5),(143,27,6),(144,27,7),(145,27,8),(146,28,8),(147,28,3),(148,28,4),(149,28,7),(150,29,2),(151,29,3),(152,29,4),(153,29,5),(154,29,6),(155,29,7),(156,29,8),(157,30,1),(158,30,3),(159,30,4),(160,30,5),(161,30,6),(162,30,7),(163,30,8),(164,31,1),(165,31,2),(166,31,3),(167,31,4),(168,31,5),(169,31,6),(170,31,7),(171,31,8),(172,32,1),(173,32,3),(174,32,4),(175,32,6),(176,32,7),(177,33,1),(178,33,5),(179,34,2),(180,34,3),(181,35,1),(182,35,2),(183,35,3),(184,35,5),(185,35,6),(186,35,7),(187,35,8),(188,36,1),(189,36,2),(190,36,3),(191,36,4),(192,36,5),(193,36,6),(194,36,7),(195,36,8),(196,37,1),(197,37,2),(198,37,3),(199,37,4),(200,37,5),(201,37,8),(202,38,8),(203,38,3),(204,38,5),(205,38,6),(206,39,3),(207,39,4),(208,39,5),(209,39,7),(210,39,8),(211,40,1),(212,40,2),(213,40,3),(214,40,4),(215,40,5),(216,40,6),(217,40,8),(218,41,1),(219,41,2),(220,41,3),(221,41,4),(222,41,5),(223,41,6),(224,41,7),(225,41,8),(226,42,4),(227,42,6),(228,43,1),(229,43,2),(230,43,3),(231,43,4),(232,43,5),(233,43,6),(234,43,7),(235,43,8),(236,44,8),(237,44,1),(238,44,4),(239,44,5),(240,45,1),(241,45,2),(242,45,3),(243,45,4),(244,45,5),(245,45,6),(246,45,7),(247,45,8),(248,46,2),(249,46,6),(250,47,8),(251,47,1),(252,47,2),(253,47,7),(254,48,1),(255,48,2),(256,48,3),(257,48,4),(258,48,5),(259,48,6),(260,48,7),(261,48,8),(262,49,2),(263,49,3),(264,49,4),(265,49,5),(266,49,7),(267,50,8),(268,50,2),(269,50,4),(270,50,5),(271,51,1),(272,51,2),(273,51,3),(274,51,5),(275,51,6),(276,51,7),(277,52,2),(278,52,4),(279,52,6),(280,52,7),(281,53,1),(282,53,2),(283,53,3),(284,53,4),(285,53,5),(286,53,7),(287,53,8),(288,54,8),(289,55,5),(290,55,7),(291,56,8),(292,56,1),(293,57,1),(294,57,2),(295,57,3),(296,57,4),(297,57,7),(298,57,8),(299,58,1),(300,58,6),(301,59,2),(302,59,3),(303,59,4),(304,59,6),(305,59,7),(306,59,8),(307,60,1),(308,60,2),(309,60,3),(310,60,5),(311,60,6),(312,60,7),(313,60,8),(314,61,7),(315,62,8),(316,63,2),(317,64,3),(318,64,6),(319,65,8),(320,65,2),(321,65,3),(322,65,7),(323,66,8),(324,66,1),(325,66,3),(326,66,6),(327,67,8),(328,67,3),(329,68,3),(330,68,4),(331,68,5),(332,68,6),(333,68,8),(334,69,8),(335,69,3),(336,69,5),(337,69,6),(338,70,1),(339,70,2),(340,70,3),(341,70,4),(342,70,5),(343,70,6),(344,70,7),(345,70,8),(346,71,1),(347,71,3),(348,71,4),(349,71,6),(350,71,7),(351,71,8),(352,72,1),(353,72,2),(354,72,3),(355,72,4),(356,72,5),(357,72,6),(358,72,7),(359,72,8),(360,73,1),(361,73,3),(362,73,4),(363,73,5),(364,73,6),(365,73,7),(366,73,8),(367,74,1),(368,74,2),(369,74,3),(370,74,4),(371,74,5),(372,74,6),(373,74,7),(374,74,8),(375,75,1),(376,76,8),(377,76,5),(378,77,2),(379,77,3),(380,77,4),(381,78,7),(382,79,1),(383,79,3),(384,79,4),(385,79,5),(386,79,6),(387,79,7),(388,79,8),(389,80,1),(390,80,2),(391,80,3),(392,80,4),(393,80,5),(394,80,6),(395,80,7),(396,80,8),(397,81,2),(398,81,3),(399,81,4),(400,81,7),(401,81,8),(402,82,1),(403,82,2),(404,82,3),(405,82,4),(406,82,5),(407,82,6),(408,82,7),(409,82,8),(410,83,1),(411,83,2),(412,83,3),(413,83,4),(414,83,5),(415,83,6),(416,83,7),(417,83,8),(418,84,2),(419,85,1),(420,85,2),(421,85,3),(422,85,4),(423,85,7),(424,85,8),(425,86,6),(426,86,7),(427,87,1),(428,87,2),(429,87,3),(430,87,4),(431,87,5),(432,87,6),(433,87,7),(434,87,8),(435,88,2),(436,88,4),(437,88,5),(438,88,6),(439,88,7),(440,89,1),(441,89,2),(442,89,3),(443,89,4),(444,89,5),(445,89,6),(446,89,7),(447,90,8),(448,90,3),(449,90,5),(450,90,6),(451,91,1),(452,91,2),(453,91,3),(454,91,4),(455,91,5),(456,91,6),(457,91,7),(458,91,8),(459,92,1),(460,92,2),(461,92,3),(462,92,4),(463,92,5),(464,92,6),(465,92,7),(466,92,8),(467,93,1),(468,93,2),(469,93,6),(470,94,1),(471,94,5),(472,94,6),(473,95,1),(474,95,3),(475,95,6),(476,95,7),(477,96,2),(478,96,4),(479,96,7),(480,97,1),(481,97,6),(482,98,8),(483,98,3),(484,98,7),(485,99,3),(486,99,4),(487,99,6),(488,100,3),(489,100,4),(490,100,6),(491,101,1),(492,101,4),(493,102,8),(494,102,1),(495,102,2),(496,102,4),(497,103,8),(498,103,3),(499,104,5),(500,105,1),(501,105,2),(502,105,5),(503,105,6),(504,105,8),(505,106,8),(506,107,3),(507,107,4),(508,108,1),(509,108,2),(510,108,4),(511,108,5),(512,108,6),(513,108,8),(514,109,1),(515,109,6),(516,110,1),(517,110,3),(518,110,4),(519,110,5),(520,110,6),(521,110,7),(522,110,8),(523,111,3),(524,111,4),(525,112,1),(526,112,2),(527,112,3),(528,112,5),(529,113,2),(530,114,1),(531,114,2),(532,114,3),(533,114,4),(534,114,5),(535,114,6),(536,114,7),(537,114,8),(538,115,1),(539,115,3),(540,115,5),(541,115,6),(542,115,7),(543,115,8),(544,116,4),(545,117,1),(546,117,2),(547,117,3),(548,117,4),(549,117,5),(550,117,6),(551,118,2),(552,119,1),(553,119,2),(554,119,3),(555,119,4),(556,119,5),(557,119,6),(558,119,7),(559,120,1),(560,120,2),(561,120,3),(562,120,4),(563,120,5),(564,120,6),(565,120,7),(566,120,8),(567,121,8),(568,122,2),(569,122,4),(570,123,1),(571,123,2),(572,123,3),(573,123,4),(574,123,5),(575,123,6),(576,123,7),(577,123,8),(578,124,2),(579,125,2),(580,125,3),(581,125,4),(582,126,8),(583,126,1),(584,126,5),(585,127,5),(586,127,7),(587,128,3),(588,129,1),(589,129,2),(590,129,3),(591,129,4),(592,129,5),(593,129,6),(594,129,7),(595,129,8),(596,130,8),(597,131,1),(598,131,2),(599,131,3),(600,131,4),(601,131,5),(602,131,6),(603,131,7),(604,131,8),(605,132,5),(606,133,1),(607,133,2),(608,133,3),(609,133,4),(610,133,6),(611,133,7),(612,133,8),(613,134,1),(614,134,3),(615,134,4),(616,134,7),(617,135,1),(618,135,2),(619,135,3),(620,135,4),(621,135,5),(622,135,6),(623,135,8),(624,136,2),(625,137,5),(626,137,6),(627,138,1),(628,138,2),(629,138,3),(630,138,4),(631,138,5),(632,138,6),(633,138,7),(634,138,8),(635,139,1),(636,139,4),(637,139,5),(638,139,6),(639,139,8),(640,140,1),(641,140,2),(642,140,3),(643,140,4),(644,140,6),(645,140,7),(646,140,8),(647,141,2),(648,141,3),(649,141,4),(650,141,5),(651,141,6),(652,141,8),(653,142,3),(654,142,5),(655,142,6),(656,142,7),(657,143,1),(658,143,2),(659,143,7),(660,144,1),(661,144,2),(662,144,3),(663,144,4),(664,144,5),(665,144,7),(666,144,8),(667,145,2),(668,145,3),(669,145,4),(670,145,5),(671,145,6),(672,145,7),(673,145,8),(674,146,7),(675,147,1),(676,148,1),(677,148,2),(678,148,5),(679,148,6),(680,148,8),(681,149,1),(682,149,3),(683,150,1),(684,150,2),(685,150,3),(686,150,4),(687,150,5),(688,150,7),(689,151,1),(690,151,2),(691,151,3),(692,151,4),(693,151,5),(694,151,6),(695,151,7),(696,151,8),(697,152,1),(698,152,2),(699,152,3),(700,152,4),(701,152,5),(702,152,7),(703,152,8),(704,153,1),(705,153,2),(706,153,3),(707,153,4),(708,153,5),(709,153,6),(710,153,7),(711,154,2),(712,154,4),(713,154,5),(714,154,7),(715,154,8),(716,155,5),(717,155,7),(718,156,1),(719,156,2),(720,156,3),(721,156,5),(722,156,6),(723,156,7),(724,156,8),(725,157,1),(726,157,2),(727,157,3),(728,157,5),(729,157,6),(730,157,7),(731,157,8),(732,158,8),(733,158,3),(734,159,6),(735,160,1),(736,160,3),(737,161,8),(738,161,2),(739,161,4),(740,161,5),(741,162,8),(742,162,2),(743,162,3),(744,162,7),(745,163,1),(746,163,2),(747,163,3),(748,163,4),(749,163,5),(750,163,6),(751,164,1),(752,164,2),(753,164,3),(754,164,4),(755,164,5),(756,164,6),(757,164,7),(758,164,8),(759,165,8),(760,165,5);
/*!40000 ALTER TABLE `project_app_employeehobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employeepersonality`
--

DROP TABLE IF EXISTS `project_app_employeepersonality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employeepersonality` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `personality_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `project_app_employeepersonality_personality_id_35d2ae02` (`personality_id`),
  KEY `project_app_employee_employee_id_94802f49_fk_project_a` (`employee_id`),
  CONSTRAINT `project_app_employee_employee_id_94802f49_fk_project_a` FOREIGN KEY (`employee_id`) REFERENCES `project_app_employees` (`id`),
  CONSTRAINT `project_app_employee_personality_id_35d2ae02_fk_project_a` FOREIGN KEY (`personality_id`) REFERENCES `project_app_personality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeepersonality`
--

LOCK TABLES `project_app_employeepersonality` WRITE;
/*!40000 ALTER TABLE `project_app_employeepersonality` DISABLE KEYS */;
INSERT INTO `project_app_employeepersonality` VALUES (1,1,16),(2,2,8),(3,3,1),(4,4,15),(5,5,16),(6,6,10),(7,7,6),(8,8,2),(9,9,13),(10,10,4),(11,11,11),(12,12,15),(13,13,10),(14,14,4),(15,15,9),(16,16,3),(17,17,3),(18,18,12),(19,19,7),(20,20,11),(21,21,15),(22,22,4),(23,23,14),(24,24,11),(25,25,11),(26,26,6),(27,27,9),(28,28,2),(29,29,10),(30,30,16),(31,31,9),(32,32,15),(33,33,13),(34,34,5),(35,35,8),(36,36,8),(37,37,13),(38,38,15),(39,39,7),(40,40,15),(41,41,5),(42,42,6),(43,43,6),(44,44,2),(45,45,15),(46,46,11),(47,47,8),(48,48,7),(49,49,14),(50,50,3),(51,51,15),(52,52,2),(53,53,7),(54,54,13),(55,55,4),(56,56,5),(57,57,2),(58,58,5),(59,59,13),(60,60,6),(61,61,3),(62,62,4),(63,63,11),(64,64,11),(65,65,15),(66,66,15),(67,67,3),(68,68,2),(69,69,5),(70,70,14),(71,71,13),(72,72,2),(73,73,9),(74,74,6),(75,75,12),(76,76,7),(77,77,5),(78,78,15),(79,79,14),(80,80,2),(81,81,1),(82,82,1),(83,83,8),(84,84,5),(85,85,15),(86,86,5),(87,87,3),(88,88,3),(89,89,3),(90,90,4),(91,91,10),(92,92,14),(93,93,11),(94,94,15),(95,95,6),(96,96,1),(97,97,3),(98,98,15),(99,99,2),(100,100,2),(101,101,15),(102,102,10),(103,103,1),(104,104,3),(105,105,7),(106,106,1),(107,107,5),(108,108,11),(109,109,12),(110,110,11),(111,111,9),(112,112,16),(113,113,5),(114,114,3),(115,115,14),(116,116,15),(117,117,1),(118,118,2),(119,119,13),(120,120,11),(121,121,8),(122,122,6),(123,123,16),(124,124,12),(125,125,8),(126,126,3),(127,127,12),(128,128,13),(129,129,13),(130,130,13),(131,131,5),(132,132,15),(133,133,12),(134,134,14),(135,135,6),(136,136,11),(137,137,15),(138,138,11),(139,139,7),(140,140,2),(141,141,10),(142,142,13),(143,143,7),(144,144,9),(145,145,8),(146,146,3),(147,147,8),(148,148,4),(149,149,5),(150,150,14),(151,151,11),(152,152,16),(153,153,1),(154,154,13),(155,155,14),(156,156,7),(157,157,11),(158,158,3),(159,159,15),(160,160,11),(161,161,7),(162,162,13),(163,163,16),(164,164,5),(165,165,1);
/*!40000 ALTER TABLE `project_app_employeepersonality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employees`
--

DROP TABLE IF EXISTS `project_app_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employees` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employees`
--

LOCK TABLES `project_app_employees` WRITE;
/*!40000 ALTER TABLE `project_app_employees` DISABLE KEYS */;
INSERT INTO `project_app_employees` VALUES (1,'Mark','Dhenniel','Nepomuceno'),(2,'Jose Ramil','Macawile','Malate'),(3,'John Paul','Prado','Solis'),(4,'Eron Rei','Edaño','Masculino'),(5,'Ken Randolf','Padayao','Mapa'),(6,'Kenneth','Amorin','Palmes'),(7,'John Aivanne','Mendez','Molato'),(8,'Larry John','Escote','Andonga'),(9,'Joseph','Lucas','Baria'),(10,'Nick Brienne','N/a','Martinez'),(11,'Joshua Serge','Gacusan','Tibudan'),(12,'Ma. Daphnee','Baguyo','Evediente'),(13,'Jeha','Hisona','Batoon'),(14,'Angel Mae','Go','Gabayan'),(15,'Karla Eryka','Pineda','Cabuhat'),(16,'Jessa May','Alvarez','Cajayon'),(17,'Jubil','Lagrosa','Cabrestante'),(18,'Nick Francis','Habab','Bundal'),(19,'Nicole Angelo','Villono','Celis'),(20,'Emmanuel','Bora','Cari-an'),(21,'Estrella Rose Ann','Machado','Navia'),(22,'Sheryl Ann','Navazero','Navarro'),(23,'Barysh Nikov','Naviza','Bacaltos'),(24,'Yuan Nico','Samante','Lazarte'),(25,'Marclin','Resurreccion','Abarracoso'),(26,'Tracer Bench','Dulanding','Baiddin'),(27,'Michael Angelo','Coralde','Demadura'),(28,'Ric Ryan','Petalver','Nolasco'),(29,'Kurt Adrian','Dacasin','Delera'),(30,'Vince Borgy','Edar','Espina'),(31,'Aubrey karylle','Neri','Mamaril'),(32,'Jessa Rey','n/a','Repoylo'),(33,'Reinhard Jake','Abog','Sacay'),(34,'Remark','Poquiz','Timones'),(35,'Jay Evan Willis','Daboda','Lagutan'),(36,'Albert','Golosino','Mirasol'),(37,'Kenneth','Baniasia','Peralta'),(38,'Mark Christian','N/A','Creador'),(39,'Nathalie Shane','N/A','Abia'),(40,'Maria Eloiza','Manlangit','Buo'),(41,'Riezel','Calda','Remo'),(42,'Philip Arland','Pagliawan','Alili'),(43,'April Joy','Dacles','Gamboa'),(44,'Erica Jane','Dagot','Vasquez'),(45,'Adrian','Dela Torre','Gabuco'),(46,'Jeremiah','Andrada','Mutia'),(47,'Rovick Anthony','Abaga','Pasamonte'),(48,'Diane Joy','Domingo','Nicanor'),(49,'Joshua','Darlington','Panes'),(50,'John Clyde','Alarcon','Basig'),(51,'John Allen','Collado','Dugelio'),(52,'Angelyn','Diego','Ombe'),(53,'Alvin Jay','Diego','Ombe'),(54,'Ken Lorenz','San Gabriel','Sendaydiego'),(55,'Nikita','Lagan','Abela'),(56,'Jameson Mark','Olac','Carabot'),(57,'Carljay','Sabaulan','Almojuela'),(58,'Jacob Ryan','Edep','Rabang'),(59,'Luin','Mariquit','Formento'),(60,'Elsid Rick','Lopez','Panolino'),(61,'Lorenz','Rala','Lucio'),(62,'John Cedrick','Claro','Chu'),(63,'Kenneth Clifford','Magalona','Janoras'),(64,'John','Palao','Gadiano'),(65,'Jarette Albert','Ibong','Lee'),(66,'Cloyd','Yusop','Talirongan'),(67,'Kristian Marc Anthony','Mendoza','Ng'),(68,'Khalil Angelo','Timbancaya','Acosta'),(69,'Rochelle','Locsin','Matillano'),(70,'Allyne','Sipin','Singson'),(71,'Jeff Paul','Nangit','Manglicmot'),(72,'Ronillynuel James','Catli','Agum'),(73,'Allen','De Guzman','Selga'),(74,'Raquel','Rubion','Relata'),(75,'Emmanuel','Gadot','Juanich'),(76,'Synteche','Magarce','Sabandal'),(77,'Denzel Andrei','Ballesteros','Bermejo'),(78,'John Cletus','Nale','Blas'),(79,'Vincent Adrian','Pacleb','Abian'),(80,'Arnaldo','de Leon','Olarte'),(81,'Anthoy Steven','N/A','Adato'),(82,'Ria joy','Tingdan','Brizo'),(83,'Aldrin','Tibus','Delicias'),(84,'Tiffany Joy','Castro','Iquin'),(85,'Sairah Faith','De los Reyes','Tablatin'),(86,'Mizraim','Balgoma','San Juan'),(87,'Bhea Jane','Junio','Cafugauan'),(88,'Kevin Cesar','Juan','Jacobo'),(89,'Mel Joseph','Gabuco','Paredes'),(90,'Francis Paul','Rieza','Hizon'),(91,'Liezel Jay','Barbacena','Diong'),(92,'Richo','Orehuela','Combinido'),(93,'James Barry','Menchavez','Almerez'),(94,'Dean','Dalabajan','Sabroso'),(95,'Jessica','Gloria','Cabilar'),(96,'Keff Ivan','Collantes','Decolongon'),(97,'Irish Jean','N/A','Gillona'),(98,'Zoe Ayessa','N/A','Buesa'),(99,'Renz Carl','Antenero','Ozoa'),(100,'Chris Daniel','Olila','Daquioag'),(101,'Ailene Grace','T','Heredero'),(102,'Aizel','Hoyo-a','Cantado'),(103,'Elyn May','Dela Pena','Macatangay'),(104,'Bjan Cymar','Lamdagan','Cabangbang'),(105,'John Bryan','Pantojan','Macalinao'),(106,'Ian Jan','Favila','Aborot'),(107,'Joni Caryl','Mayo','Diaz'),(108,'Verna Karylle','Cayao','Elanan'),(109,'Alondra','Trinidad','Sola'),(110,'Zaj Kenneth','Baldea','Panes'),(111,'Jofli Asaph','Sarmiento','Delcoro'),(112,'Shervielyn Jane','N/A','Apolinar'),(113,'Shervielyn Jane','N/A','Apolinar'),(114,'Cyver Kate','N/A','Mahinay'),(115,'Anniza','Acot-Acot','Hachero'),(116,'Harry Ericson','Alaras','Cabrera'),(117,'Milky Mae','Mahinay','Galicia'),(118,'Maui Azryl','Morillo','Lomuntad'),(119,'Dyla Kris Vanneth','Mesina','Bondesto'),(120,'Samantha Anne','Perez','Quizon'),(121,'Meah','Dape','Fabrigas'),(122,'Jeffer','Inocente','Molato'),(123,'Michael Joshua','Damasco','Calan'),(124,'Reymart','Flores','Azucena'),(125,'German','Rodriguez','Cinco'),(126,'Yusuf Xander','Badidil','Ortega'),(127,'Austin Clyde','Palermo','Sibugan'),(128,'Norkizah','Monib','Baute'),(129,'Reodel','Suarez','Calilung'),(130,'Ian Gabriel','Fetalver','Dalimocon'),(131,'Justine Luis','Diola','Elorde'),(132,'Queanna Brittany','Salamatin','Ibrahim'),(133,'kyla mae','gabayan','pagkaliwangan'),(134,'Mikhaela','Diaz','Pastor'),(135,'Carl Vincent','Nacasi','Alabastro'),(136,'Jan Ivn Anthony','Donaire','Conde'),(137,'Joni Caryl','Mayo','Diaz'),(138,'Apple Ace','Eduardo','Acepcion'),(139,'Charls Brent','dela Cruz','Cayabyab'),(140,'Kate Andrea','Palay','Katon'),(141,'Aubrey karylle','Neri','Mamaril'),(142,'Obrien Troy','Magalsoo','Dangan'),(143,'Gideon','Torres','Magno'),(144,'Drexzel','Cayao','Lambon'),(145,'Arvin Clark','Tumpag','Lota'),(146,'Johnzyll','Abadiano','Jimeno'),(147,'Jemeric','N/A','VAlmoria'),(148,'John Carl','Aurelio','Reyes'),(149,'john philip','bermudez','beltran'),(150,'Mart','Edrian','Bernardo'),(151,'Danielle Grace','Diongzon','Dignadice'),(152,'Cy Allene','Origenes','Paalan'),(153,'Don Angel Lou','Manzano','Salvatierra'),(154,'Princess Aira','Ahmad','Suranol'),(155,'Melodie','Lacson','Gardose'),(156,'John Dexter','Embile','Sangalang'),(157,'Cristy','Villan','Tubo'),(158,'Carlota','Calagos','Prado'),(159,'Jason Maverick','Diokno','Serencio'),(160,'Kier Wilson','Mangahas','Familaran'),(161,'Noe','Dumip-ig','Dela Concepcion'),(162,'Franz Lorrenz','Miraflores','Badenas'),(163,'Joni Caryl','Mayo','Diaz'),(164,'Al-nizar','Sabuddin','Wahab'),(165,'Marvin','Dela Torre','Esmeralda');
/*!40000 ALTER TABLE `project_app_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employeeskills`
--

DROP TABLE IF EXISTS `project_app_employeeskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employeeskills` (
  `skill_id` int DEFAULT NULL,
  `employee_id` varchar(45) DEFAULT NULL,
  `skill_level` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeeskills`
--

LOCK TABLES `project_app_employeeskills` WRITE;
/*!40000 ALTER TABLE `project_app_employeeskills` DISABLE KEYS */;
INSERT INTO `project_app_employeeskills` VALUES (1,'3','Advanced Mastery'),(2,'7','Average'),(3,'7','Advanced'),(4,'7','Beginner'),(4,'18','Advanced'),(6,'6','Intermediate'),(6,'111','Professional'),(7,'9','Beginner'),(8,'10','Beginner'),(9,'11','Mid-level'),(12,'2','Professional'),(13,'13','Expert'),(17,'17','Intermediate'),(18,'8','Expert'),(19,'20','Average'),(21,'23','Expert'),(23,'21','Expert'),(24,'25','Expert'),(25,'26','Expert'),(27,'32','Professional'),(28,'23','Beginner'),(31,'28','Legendary'),(32,'36','Professional'),(33,'33','Professional'),(34,'102','Advanced'),(35,'123','Professional'),(36,'35','Expert'),(37,'38','Intermediate'),(50,'50','Intermediate'),(55,'55','Average'),(62,'62','Expert'),(63,'63','Expert'),(65,'125','Professional'),(69,'69','Intermediate'),(88,'88','Expert'),(98,'98','Master Level'),(99,'99','Beginner'),(102,'104','Ibang Level'),(103,'103','Professional'),(104,'24','Intermediate'),(106,'106','Intermediate'),(111,'111','Professional'),(124,'124','Professional'),(136,'132','Intermediate'),(143,'143','Intermediate'),(1124,'4','Professional'),(1221,'37','Non Professional'),(9080,'29','Advanced 2');
/*!40000 ALTER TABLE `project_app_employeeskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_hobby`
--

DROP TABLE IF EXISTS `project_app_hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_hobby` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_hobby`
--

LOCK TABLES `project_app_hobby` WRITE;
/*!40000 ALTER TABLE `project_app_hobby` DISABLE KEYS */;
INSERT INTO `project_app_hobby` VALUES (7,'Art'),(5,'Cooking'),(8,'Fitness'),(6,'Gaming'),(3,'Music'),(1,'Reading'),(2,'Sports'),(4,'Travel');
/*!40000 ALTER TABLE `project_app_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_personality`
--

DROP TABLE IF EXISTS `project_app_personality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_personality` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_personality`
--

LOCK TABLES `project_app_personality` WRITE;
/*!40000 ALTER TABLE `project_app_personality` DISABLE KEYS */;
INSERT INTO `project_app_personality` VALUES (1,'ISTJ','The Inspector'),(2,'ISFJ','The Protector'),(3,'INFJ','The Counselor'),(4,'INTJ','The Mastermind'),(5,'ISTP','The Craftsman'),(6,'ISFP','The Composer'),(7,'INFP','The Healer'),(8,'INTP','The Architect'),(9,'ESTP','The Dynamo'),(10,'ESFP','The Performer'),(11,'ENFP','The Champion'),(12,'ENTP','The Visionary'),(13,'ESTJ','The Supervisor'),(14,'ESFJ','The Provider'),(15,'ENFJ','The Teacher'),(16,'ENTJ','The Commander');
/*!40000 ALTER TABLE `project_app_personality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_skill`
--

DROP TABLE IF EXISTS `project_app_skill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_skill` (
  `id` int NOT NULL,
  `skill_type` varchar(45) NOT NULL,
  `skill_description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_skill`
--

LOCK TABLES `project_app_skill` WRITE;
/*!40000 ALTER TABLE `project_app_skill` DISABLE KEYS */;
INSERT INTO `project_app_skill` VALUES (0,'Web Design','encompasses many different skills and discipl'),(1,'Quantum Code','Quantum coding involves programming at the in'),(2,'','Skills in database design, SQL (Structured Qu'),(3,'Programming','Understanding of algorithms, data structures,'),(4,'Cloud Computing','Familiarity with cloud platforms like AWS (Am'),(5,'Information Architecture','Information architecture (IA) involves effect'),(6,'Web Development',' Create and maintain websites.'),(7,'Cybersecurity','Businesses need people with cybersecurity ski'),(8,'Analytical Skills','Ability to gather, interpret, and analyze dat'),(9,'Managing','Manages and oversees IT projects'),(10,'Mathematical Reasoning','The process of applying logical thinking to a'),(11,'Technical Proficiency','Understanding of networking protocols, operating systems, and security technologies to analyze logs, identify vulnerabilities, and troubleshoot issues.'),(12,'Critical Thingkings','Critical thinking is the intellectually disci'),(13,'Front End Engineering','A front-end engineer works on the part of the'),(14,'Networking','Knowledge of networking protocols, infrastruc'),(16,'UI/UX Design','Understanding user interface design principle'),(17,'Artificial Intelligence','Technical and Non-Technical abilities to depl'),(18,'Mobile app development','Mobile app development is the process of crea'),(19,'Cloud Engineering',' builds and maintains cloud infrastructure'),(20,' Technical Analysts','Configure and implement SaaS solutions'),(21,'Back End Developer','A back-end developer possesses expertise in s'),(22,'Full-Stack Development','Full stack development refers to the end-to-e'),(23,'UI Design','UI (User Interface) design focuses on creatin'),(24,'Analytics and Troubleshooting','a logical process network engineers follow to'),(25,'Analytical Abilities','Being Analytical gives you a major edge in IT'),(26,'Artificial Intelligence','deep learning, reinforcement learning, comput'),(27,'Communication','Strong communication skills ensure that your '),(28,'Troubleshooting and Technical Support','Strong troubleshooting skills for identifying'),(29,'Web Developer','A Web Developer is a professional who is resp'),(30,'Penetration Tester','Penetration testers, also known as pen tester'),(31,'Service Management','Wrapping technologies in services that are di'),(32,'Game Development','encompassing technical, creative, and collabo'),(33,'Web Developer','Expertise with modern web programming languag'),(34,'Technical','Java programming'),(35,'Data visualization','presenting complex data in a graphical or vis'),(36,'Visual effects','Visual effects (sometimes abbreviated VFX) is'),(37,'Visualize and Conceptualize Information','The ability to conceptualize and visualize in'),(38,'Graphics Design Specialist','crafts visually compelling and impactful digital designs, leveraging creative expertise and technical skills to produce engaging visuals across various mediums.'),(47,'Technical Support','Technical support (tech support) refers to a range services companies provide to their customers for products such as software, mobile phones, printers, and other electronic, mechanical or electromechanical products.'),(50,'Risk Assessment','Capability to assess and manage risks associa'),(55,'Excellent Designing','Ability to provide beautiful designs and enha'),(60,'Cloud Platform Proficiency','Ability to proficiently navigate and leverage'),(62,'Implementation of backup and recovery process','Minimize the risk of data loss and ensure tha'),(63,'IT Infrastructure and Systems Administration','IT Infrastructure Configuring and Maintenance'),(64,'Programming','programming is that it is a way of providing '),(65,'Business Intelligence','Skilled in gathering and analyzing business d'),(69,'Vulnerability Management','Identifying and addressing vulnerabilities in'),(70,'Data Analyst','Creating Dashboards and Reports'),(71,'Web Designer','The skill description for a web designer typi'),(72,'Debugging','Evaluating and debugging modules'),(87,'photographic log and photographic sketch','Photograph all latent fingerprints and other '),(88,'Full Stack Developer','Knowledgeable in every aspect of programming'),(89,'Valorant Pro','Gaming and Line Up'),(98,'Handy Man','Full-Stack HandyMan'),(99,'Web Design','Creating user friendly designs for websites.'),(100,'Geographic Information System (GIS) Specialis','GIS specialists utilize geospatial data to cr'),(101,'Project Management','Overseeing and managing IT projects from init'),(102,'esports coach','work closely with the players, to motivate th'),(103,'Data Harmonization','Harmonize data for unified insights'),(104,'Ethical Decision-Making','Ethical decision-making involves the process of evaluating and choosing actions that align with moral principles and values. It requires considering the potential impact of decisions on various stakeholders, adhering to principles of fairness, honesty, and integrity, and ensuring that choices uphold ethical standards and legal requirements. Ethical decision-making guides individuals and organizations to make choices that contribute to the well-being of society and promote trust and credibility.'),(106,'Artificial Intelligence (AI)','Proficient in developing AI models using mach'),(110,'Software and Hardware Knowledge','Understanding of computer hardware and famili'),(111,'Problem Solving Skills','Ability to solve problems effectively'),(124,'Programming','Capable of developing efficient and scalable '),(136,'Data Analyst','Data analysis tools assist you in uncovering '),(143,'Game Analyst','Examine games to ensure they are free of bugs'),(187,'Ethical Hacking',' security experts that perform these security'),(321,'Networking','Cisco CCNA'),(322,'Cybersecurity','Ethical Hacking'),(323,'Data Science','Python and Pandas'),(408,'IT Policy Development','Crafts effective IT policies, aligning industry standards, legal requirements, and organizational needs.'),(409,'Strategic Planning','ligns IT policy initiatives with organizational goals, anticipates future needs, and adapts policies to evolving technology.'),(420,'Full Stack Developer','Full-stack developers possess a diverse skill'),(456,'Graphic Design','Deisgn a website'),(475,'Graphic Design','Proficiency in Adobe Creative Suite or other '),(500,'Machine Learning','This area involves creating and refining algo'),(666,' Statistical Analysis','Understanding statistical tests and tools is crucial. Familiarity with mean, median, variance, standard deviation, correlation, regression, and hypothesis testing can be fundamental.'),(991,'Computer Analyst','computer virus killer'),(1000,'Cloud Network Engineer ','design and implement computer and information'),(1001,'Information Systems Analyst',' uses analysis and design techniques to solve business problems using information technology.'),(1124,'data analysis and management','These skills allow DPOs to effectively overse'),(1129,'Cloud Engineer','cloud computing,  maintenance and support'),(1212,'Technical Support','Technical Trouble shooting and customer suppo'),(1214,'IT developer','Installing Firewalls and routers'),(1215,'Data Visualization','Alongside basic knowledge of spreadsheets, ha'),(1221,'game design','Develop and maintain graphics applications'),(1818,'Solve design challenges creatively','Design digital interfaces'),(2121,'Computer maintenance','Keeping your computers and laptops in good co'),(2309,'Competitive Programming','A sport where contestants solve algorithmic p'),(2323,'Software Engineering','Developing Website for Needs'),(4420,'Cybersecurity','Knowledge of security principles'),(6666,'QA Engineer ','Find and fix bugs'),(8223,'Graphic Design','Designing application'),(9080,'Programming','full-stack dev'),(9999,'Software Engineering','Develop and maintain software applications'),(10101,'Basic Web Designer','Plan, create and code internet sites and web pages, many of which combine text with sounds, pictures, graphics and video clips. A web designer is responsible for creating the design and layout of a website or web pages.'),(12345,'Operating Systems','Troubleshooting'),(14369,'Coding','Software architecture understanding and desig'),(20203,'Professional Gamer','Competitive gamer '),(33332,'Help Desk Support, Database, MS Office, Activ','Identify and troubleshoot networked systems. '),(55555,'Web Design','Making a user-friendly websites'),(69120,'Problem-Solving Aptitude','possesses a strong problem-solving aptitude, '),(70121,'Cipher Text  Decoder','Encrypted to Decrypted text decoder'),(70134,'Algorithm Design and Analysis','Proficient problem-solving skills to understa'),(70135,'Data Mining','searching and analyzing a large batch of raw '),(75300,'Database management',' responsible for developing and maintaining a'),(76446,'DevOps Design','Develop programs and design manually'),(80217,'Graphic Design','Designing application'),(81111,'Algorithm and Data Structures','Understanding and implementing efficient algo'),(81112,'Neural Network Architect','Design efficient and effective neural network'),(90197,'Data analytics developer','Clarify & set business expectations'),(90446,'GameDevs Design','Develop games and design manually'),(90809,'Floor General','coach on the floor, and the heart of the team'),(122213,'Creativity','The ability to generate original ideas, characters, and stories is fundamental in animation. Creativity fuels the entire process of bringing imagination to life.'),(134811,'Web Developer','Mastered in HTML,CSS, and JS'),(200021,'Front-End Web Developer','Designing Front-end of websites.'),(202080,'Cybersecurity','is the application of technologies, processes'),(202081,'DevOps','Combination of “development” and “operations”'),(202127,'Web Design','encompasses many different skills and discipl'),(238912,'Scripting and Code Efficiency','Writing scripts to automate repetitive tasks '),(246810,'Operating Systems','Troubleshooting'),(303040,'Minning Strat','Data Analysis'),(711711,'FASTER ENCODER','FASTING TYPING'),(937374,'Automation','Scripting and automation skills for routine tasks (e.g., Bash, PowerShell).'),(1170135,'Augmented Reality Development','Proficiency in AR frameworks, platforms, and '),(1231234,'Bogaboga developer','Bogaboga'),(2947104,'Web Design','encompasses many different skills and discipl'),(5555555,'Risk Taker','Expert in Risk Analyzing'),(20212374,'Web Design','encompasses many different skills and discipl'),(20231126,'Back End Developer',' handle the server-side of the website, manag'),(20502050,'HACKER','Hacking Bank Account'),(201980339,'data analyst','statistical analysis of data'),(201980356,'Web Developer','Designing and developing websites according to client specifications.'),(202018927,'Cybersecurity','skills to keep their data,including customer,'),(202080016,'Game designing','Ability to develop a hero in game'),(202080027,'UI/UX Designer','Developing visual concepts, graphics, and layouts based on client or project requirements.'),(202080035,'Network Configuration','assigning network settings, policies, flows, '),(202080044,'Threat Hunting','Proactive cybersecurity: detect, analyze, res'),(202080061,'Wed Designer','Ability to pla, create and code internet site'),(202080135,'Roblox Game Designer','A game designer\'s role is to create an engagi'),(202080160,'Digital Forensics','Focuses on identifying, acquiring, processing'),(202080171,'Game Level Design ','Create structure, layout and overall experience of a game development'),(202080457,'Data Visualization','is the practice of designing and creating eas'),(202080463,'Computational Scientist','Determine computing needs and system requirem'),(202080473,'Technical Skills','Should have a detailed knowledge of softw'),(202080476,'Web developer','Create functional, user-friendly websites'),(202080497,'Azure API Developer','Design and build scalable and secure integration solutions using Azure Logic Apps, Azure API Management, and Microsoft Integration Services.'),(202083480,'Cybersecurity Master','monitor current systems for both internal and'),(202180032,'Technical skills',' could be responsible for providing technical support, troubleshooting hardware and software issues, and assisting with the implementation and maintenance of IT systems within an organization.'),(202180036,'UI Designer','Designing UI'),(202180157,'Back end Developer','Ability tosomething that is farthest from the'),(202180210,'Security Specialist','Develop and implement security measures'),(202180249,'Technical Skills ','Equipment repairs, installations and troubles'),(202180343,'Fullstack Software Engineer','Plan, Design, and Develop software'),(202180362,'Quantum Ciphercraft Mastery','Proficiency in Quantum Ciphercraft involves the ability to create and decode ethereal encryptions, harnessing the quantum dance of particles to fortify data against unseen digital adversaries. Masters of this skill can seamlessly traverse the realms of quantum computing, crafting cryptographic shields that defy conventional decryption methods. Quantum Ciphercraft expertise empowers individuals to safeguard information with arcane algorithms, ensuring the sanctity of digital secrets in an ever-ev'),(202180383,'Parallel Programming','Ability to develop multiple projects simultan'),(202180384,'Natural Language Processing','Expertise in machine learning models and libr'),(1212783718,'senior level','all around hacking'),(2020100612,'SOFTWARE TESTER','Ability to test and enhance the software'),(2021001132,'Network Engineer','Designing and implementing new network soluti'),(2021100007,'Front End Developer','Create and Enhance the look and feel og a UI'),(2147483647,'Mid End Developer','Create and Innovate new design ');
/*!40000 ALTER TABLE `project_app_skill` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-09 17:16:17