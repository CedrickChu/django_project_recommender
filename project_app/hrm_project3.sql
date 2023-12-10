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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add hobby',7,'add_hobby'),(26,'Can change hobby',7,'change_hobby'),(27,'Can delete hobby',7,'delete_hobby'),(28,'Can view hobby',7,'view_hobby'),(29,'Can add personality',8,'add_personality'),(30,'Can change personality',8,'change_personality'),(31,'Can delete personality',8,'delete_personality'),(32,'Can view personality',8,'view_personality'),(33,'Can add employee hobby',9,'add_employeehobby'),(34,'Can change employee hobby',9,'change_employeehobby'),(35,'Can delete employee hobby',9,'delete_employeehobby'),(36,'Can view employee hobby',9,'view_employeehobby'),(37,'Can add employee personality',10,'add_employeepersonality'),(38,'Can change employee personality',10,'change_employeepersonality'),(39,'Can delete employee personality',10,'delete_employeepersonality'),(40,'Can view employee personality',10,'view_employeepersonality'),(41,'Can add skill',11,'add_skill'),(42,'Can change skill',11,'change_skill'),(43,'Can delete skill',11,'delete_skill'),(44,'Can view skill',11,'view_skill'),(45,'Can add employees',12,'add_employees'),(46,'Can change employees',12,'change_employees'),(47,'Can delete employees',12,'delete_employees'),(48,'Can view employees',12,'view_employees'),(49,'Can add employee skills',13,'add_employeeskills'),(50,'Can change employee skills',13,'change_employeeskills'),(51,'Can delete employee skills',13,'delete_employeeskills'),(52,'Can view employee skills',13,'view_employeeskills'),(53,'Can add institution',14,'add_institution'),(54,'Can change institution',14,'change_institution'),(55,'Can delete institution',14,'delete_institution'),(56,'Can view institution',14,'view_institution'),(57,'Can add training',15,'add_training'),(58,'Can change training',15,'change_training'),(59,'Can delete training',15,'delete_training'),(60,'Can view training',15,'view_training'),(61,'Can add employee training',16,'add_employeetraining'),(62,'Can change employee training',16,'change_employeetraining'),(63,'Can delete employee training',16,'delete_employeetraining'),(64,'Can view employee training',16,'view_employeetraining'),(65,'Can add employee education',17,'add_employeeeducation'),(66,'Can change employee education',17,'change_employeeeducation'),(67,'Can delete employee education',17,'delete_employeeeducation'),(68,'Can view employee education',17,'view_employeeeducation');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-12-10 04:36:19.103798','9','Hiking',1,'[{\"added\": {}}]',7,1),(2,'2023-12-10 04:36:23.695786','10','Video Game',1,'[{\"added\": {}}]',7,1),(3,'2023-12-10 04:36:28.647558','11','Volunteering',1,'[{\"added\": {}}]',7,1),(4,'2023-12-10 04:36:34.639876','12','Dancing',1,'[{\"added\": {}}]',7,1),(5,'2023-12-10 04:36:41.895448','13','Singing',1,'[{\"added\": {}}]',7,1),(6,'2023-12-10 05:39:35.654631','139','Charls Brent Cayabyab - Back-End Web Developer - Average',1,'[{\"added\": {}}]',16,1),(7,'2023-12-10 05:39:53.532375','139','Charls Brent Cayabyab - Back-End Web Developer - In Person Training',2,'[{\"changed\": {\"fields\": [\"Participation type\"]}}]',16,1),(8,'2023-12-10 06:09:34.286491','62','John Cedrick Chu',2,'[{\"changed\": {\"fields\": [\"Personality\", \"Institution\"]}}]',12,1),(9,'2023-12-10 06:10:26.608633','166','Carljay Almojuela - The Inspector - ISTJ',1,'[{\"added\": {}}]',10,1),(10,'2023-12-10 06:10:46.372705','166','Carljay Almojuela - The Inspector - ISTJ',3,'',10,1),(11,'2023-12-10 06:11:37.965088','167','John Cedrick Chu - The Supervisor - ESTJ',1,'[{\"added\": {}}]',10,1),(12,'2023-12-10 06:11:50.279532','62','John Cedrick Chu - The Mastermind - INTJ',3,'',10,1),(13,'2023-12-10 06:13:15.796107','166','Jose Chan',1,'[{\"added\": {}}]',12,1),(14,'2023-12-10 06:52:27.810561','166','Jose Chan',2,'[{\"changed\": {\"fields\": [\"Personality\"]}}]',12,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(17,'project_app','employeeeducation'),(9,'project_app','employeehobby'),(10,'project_app','employeepersonality'),(12,'project_app','employees'),(13,'project_app','employeeskills'),(16,'project_app','employeetraining'),(7,'project_app','hobby'),(14,'project_app','institution'),(8,'project_app','personality'),(11,'project_app','skill'),(15,'project_app','training'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-12-09 08:15:52.234705'),(2,'auth','0001_initial','2023-12-09 08:15:52.500943'),(3,'admin','0001_initial','2023-12-09 08:15:52.593969'),(4,'admin','0002_logentry_remove_auto_add','2023-12-09 08:15:52.609602'),(5,'admin','0003_logentry_add_action_flag_choices','2023-12-09 08:15:52.621212'),(6,'contenttypes','0002_remove_content_type_name','2023-12-09 08:15:52.674627'),(7,'auth','0002_alter_permission_name_max_length','2023-12-09 08:15:52.716599'),(8,'auth','0003_alter_user_email_max_length','2023-12-09 08:15:52.728853'),(9,'auth','0004_alter_user_username_opts','2023-12-09 08:15:52.742225'),(10,'auth','0005_alter_user_last_login_null','2023-12-09 08:15:52.771892'),(11,'auth','0006_require_contenttypes_0002','2023-12-09 08:15:52.771892'),(12,'auth','0007_alter_validators_add_error_messages','2023-12-09 08:15:52.771892'),(13,'auth','0008_alter_user_username_max_length','2023-12-09 08:15:52.812381'),(14,'auth','0009_alter_user_last_name_max_length','2023-12-09 08:15:52.849862'),(15,'auth','0010_alter_group_name_max_length','2023-12-09 08:15:52.862369'),(16,'auth','0011_update_proxy_permissions','2023-12-09 08:15:52.862369'),(17,'auth','0012_alter_user_first_name_max_length','2023-12-09 08:15:52.906012'),(18,'project_app','0001_initial','2023-12-09 08:15:53.135137'),(19,'project_app','0002_alter_hobby_description','2023-12-09 08:15:53.135137'),(20,'project_app','0003_rename_description_skill_skill_description_and_more','2023-12-09 08:15:53.185654'),(21,'project_app','0004_employees_alter_employeehobby_employee_and_more','2023-12-09 08:15:53.351818'),(22,'project_app','0005_remove_employees_exit_date_remove_employees_skills_and_more','2023-12-09 08:15:53.398518'),(23,'project_app','0006_remove_employees_idemployees','2023-12-09 08:15:53.428253'),(24,'project_app','0007_rename_skill_skills','2023-12-09 08:15:53.438699'),(25,'project_app','0008_rename_skills_skill','2023-12-09 08:15:53.462522'),(26,'project_app','0009_remove_employees_personalities_and_more','2023-12-09 08:15:53.492404'),(27,'project_app','0010_alter_employees_personalities','2023-12-09 08:15:53.568055'),(28,'project_app','0011_alter_employeepersonality_personality','2023-12-09 08:15:53.621993'),(29,'project_app','0012_remove_employees_personalities','2023-12-09 08:15:53.665318'),(30,'project_app','0013_employees_personalities_and_more','2023-12-09 08:15:53.728926'),(31,'project_app','0014_employeeskills','2023-12-09 08:15:53.749898'),(32,'project_app','0015_delete_employeeskills_remove_employees_personalities_and_more','2023-12-09 08:15:53.785545'),(33,'project_app','0016_employeeskills_remove_employees_personality_and_more','2023-12-09 08:15:53.838285'),(34,'project_app','0017_alter_employees_middle_name','2023-12-09 08:15:53.870261'),(35,'project_app','0018_remove_employees_personalities_and_more','2023-12-09 08:15:53.904253'),(36,'project_app','0019_rename_employeeskills_employeeskill_employee_and_more','2023-12-09 08:15:54.019563'),(37,'project_app','0020_rename_employee_employees','2023-12-09 08:15:54.100613'),(38,'project_app','0021_delete_employeeskill','2023-12-09 08:15:54.116247'),(39,'project_app','0022_remove_employees_personalities_employees_personality','2023-12-09 08:15:54.141411'),(40,'sessions','0001_initial','2023-12-09 08:15:54.167890'),(41,'project_app','0023_remove_employees_personality','2023-12-09 08:25:46.460234'),(42,'project_app','0024_employees_personality','2023-12-09 08:25:46.491985'),(43,'project_app','0025_rename_personality_employees_personalities','2023-12-09 08:27:39.282079'),(44,'project_app','0026_remove_employees_personalities_and_more','2023-12-09 08:29:29.846527'),(45,'project_app','0002_skill_skills_idskills','2023-12-09 08:47:41.192821'),(46,'project_app','0002_remove_skill_skills_idskills','2023-12-09 08:55:35.874415'),(47,'project_app','0002_institution_employees_institution_training_and_more','2023-12-09 09:39:14.754209'),(48,'project_app','0003_remove_training_idtrainings','2023-12-09 09:41:03.253792'),(49,'project_app','0004_training_idtrainings','2023-12-09 10:05:20.307104'),(50,'project_app','0002_rename_skill_id_skill_id','2023-12-09 10:13:43.011845'),(51,'project_app','0002_employeeskills_id_alter_employeeskills_employee_and_more','2023-12-09 10:36:26.088247'),(52,'project_app','0002_alter_employeeskills_employee','2023-12-10 04:40:48.489231'),(53,'project_app','0002_alter_employeetraining_employee_and_more','2023-12-10 05:12:08.053268'),(54,'project_app','0003_alter_employeeskills_employee_and_more','2023-12-10 05:12:59.657907'),(55,'project_app','0004_remove_employees_personality_employees_personality','2023-12-10 06:08:06.508166'),(56,'project_app','0005_alter_employeepersonality_employee','2023-12-10 06:12:12.817175'),(57,'project_app','0006_alter_employees_personality','2023-12-10 06:41:59.409306'),(58,'project_app','0007_employeeeducation','2023-12-10 06:53:55.659256');
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
  UNIQUE KEY `project_app_employeepersonality_employee_id_94802f49_uniq` (`employee_id`),
  KEY `project_app_employeepersonality_personality_id_35d2ae02` (`personality_id`),
  CONSTRAINT `project_app_employee_employee_id_94802f49_fk_project_a` FOREIGN KEY (`employee_id`) REFERENCES `project_app_employees` (`id`),
  CONSTRAINT `project_app_employee_personality_id_35d2ae02_fk_project_a` FOREIGN KEY (`personality_id`) REFERENCES `project_app_personality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeepersonality`
--

LOCK TABLES `project_app_employeepersonality` WRITE;
/*!40000 ALTER TABLE `project_app_employeepersonality` DISABLE KEYS */;
INSERT INTO `project_app_employeepersonality` VALUES (1,1,16),(2,2,8),(3,3,1),(4,4,15),(5,5,16),(6,6,10),(7,7,6),(8,8,2),(9,9,13),(10,10,4),(11,11,11),(12,12,15),(13,13,10),(14,14,4),(15,15,9),(16,16,3),(17,17,3),(18,18,12),(19,19,7),(20,20,11),(21,21,15),(22,22,4),(23,23,14),(24,24,11),(25,25,11),(26,26,6),(27,27,9),(28,28,2),(29,29,10),(30,30,16),(31,31,9),(32,32,15),(33,33,13),(34,34,5),(35,35,8),(36,36,8),(37,37,13),(38,38,15),(39,39,7),(40,40,15),(41,41,5),(42,42,6),(43,43,6),(44,44,2),(45,45,15),(46,46,11),(47,47,8),(48,48,7),(49,49,14),(50,50,3),(51,51,15),(52,52,2),(53,53,7),(54,54,13),(55,55,4),(56,56,5),(57,57,2),(58,58,5),(59,59,13),(60,60,6),(61,61,3),(63,63,11),(64,64,11),(65,65,15),(66,66,15),(67,67,3),(68,68,2),(69,69,5),(70,70,14),(71,71,13),(72,72,2),(73,73,9),(74,74,6),(75,75,12),(76,76,7),(77,77,5),(78,78,15),(79,79,14),(80,80,2),(81,81,1),(82,82,1),(83,83,8),(84,84,5),(85,85,15),(86,86,5),(87,87,3),(88,88,3),(89,89,3),(90,90,4),(91,91,10),(92,92,14),(93,93,11),(94,94,15),(95,95,6),(96,96,1),(97,97,3),(98,98,15),(99,99,2),(100,100,2),(101,101,15),(102,102,10),(103,103,1),(104,104,3),(105,105,7),(106,106,1),(107,107,5),(108,108,11),(109,109,12),(110,110,11),(111,111,9),(112,112,16),(113,113,5),(114,114,3),(115,115,14),(116,116,15),(117,117,1),(118,118,2),(119,119,13),(120,120,11),(121,121,8),(122,122,6),(123,123,16),(124,124,12),(125,125,8),(126,126,3),(127,127,12),(128,128,13),(129,129,13),(130,130,13),(131,131,5),(132,132,15),(133,133,12),(134,134,14),(135,135,6),(136,136,11),(137,137,15),(138,138,11),(139,139,7),(140,140,2),(141,141,10),(142,142,13),(143,143,7),(144,144,9),(145,145,8),(146,146,3),(147,147,8),(148,148,4),(149,149,5),(150,150,14),(151,151,11),(152,152,16),(153,153,1),(154,154,13),(155,155,14),(156,156,7),(157,157,11),(158,158,3),(159,159,15),(160,160,11),(161,161,7),(162,162,13),(163,163,16),(164,164,5),(165,165,1),(167,62,13);
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
  `institution_id` bigint DEFAULT NULL,
  `personality_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employees`
--

LOCK TABLES `project_app_employees` WRITE;
/*!40000 ALTER TABLE `project_app_employees` DISABLE KEYS */;
INSERT INTO `project_app_employees` VALUES (1,'Mark','Dhenniel','Nepomuceno',3,16),(2,'Jose Ramil','Macawile','Malate',5,8),(3,'John Paul','Prado','Solis',1,1),(4,'Eron Rei','Edaño','Masculino',16,15),(5,'Ken Randolf','Padayao','Mapa',2,16),(6,'Kenneth','Amorin','Palmes',44,10),(7,'John Aivanne','Mendez','Molato',6,6),(8,'Larry John','Escote','Andonga',71,2),(9,'Joseph','Lucas','Baria',2,13),(10,'Nick Brienne','N/a','Martinez',51,4),(11,'Joshua Serge','Gacusan','Tibudan',28,11),(12,'Ma. Daphnee','Baguyo','Evediente',56,15),(13,'Jeha','Hisona','Batoon',65,10),(14,'Angel Mae','Go','Gabayan',5,4),(15,'Karla Eryka','Pineda','Cabuhat',42,9),(16,'Jessa May','Alvarez','Cajayon',1,3),(17,'Jubil','Lagrosa','Cabrestante',86,3),(18,'Nick Francis','Habab','Bundal',2,12),(19,'Nicole Angelo','Villono','Celis',2,7),(20,'Emmanuel','Bora','Cari-an',89,11),(21,'Estrella Rose Ann','Machado','Navia',99,15),(22,'Sheryl Ann','Navazero','Navarro',76,4),(23,'Barysh Nikov','Naviza','Bacaltos',66,14),(24,'Yuan Nico','Samante','Lazarte',21,11),(25,'Marclin','Resurreccion','Abarracoso',5,11),(26,'Tracer Bench','Dulanding','Baiddin',98,6),(27,'Michael Angelo','Coralde','Demadura',89,9),(28,'Ric Ryan','Petalver','Nolasco',14,2),(29,'Kurt Adrian','Dacasin','Delera',6,10),(30,'Vince Borgy','Edar','Espina',23,16),(31,'Aubrey karylle','Neri','Mamaril',6,9),(32,'Jessa Rey','n/a','Repoylo',8,15),(33,'Reinhard Jake','Abog','Sacay',15,13),(34,'Remark','Poquiz','Timones',8,5),(35,'Jay Evan Willis','Daboda','Lagutan',79,8),(36,'Albert','Golosino','Mirasol',76,8),(37,'Kenneth','Baniasia','Peralta',2,13),(38,'Mark Christian','N/A','Creador',23,15),(39,'Nathalie Shane','N/A','Abia',31,7),(40,'Maria Eloiza','Manlangit','Buo',123,15),(41,'Riezel','Calda','Remo',14,5),(42,'Philip Arland','Pagliawan','Alili',15,6),(43,'April Joy','Dacles','Gamboa',77,6),(44,'Erica Jane','Dagot','Vasquez',24,2),(45,'Adrian','Dela Torre','Gabuco',99,15),(46,'Jeremiah','Andrada','Mutia',24,11),(47,'Rovick Anthony','Abaga','Pasamonte',51,8),(48,'Diane Joy','Domingo','Nicanor',23,7),(49,'Joshua','Darlington','Panes',34,14),(50,'John Clyde','Alarcon','Basig',24,3),(51,'John Allen','Collado','Dugelio',67,15),(52,'Angelyn','Diego','Ombe',12,2),(53,'Alvin Jay','Diego','Ombe',61,7),(54,'Ken Lorenz','San Gabriel','Sendaydiego',23,13),(55,'Nikita','Lagan','Abela',87,4),(56,'Jameson Mark','Olac','Carabot',67,5),(57,'Carljay','Sabaulan','Almojuela',83,2),(58,'Jacob Ryan','Edep','Rabang',83,5),(59,'Luin','Mariquit','Formento',71,13),(60,'Elsid Rick','Lopez','Panolino',27,6),(61,'Lorenz','Rala','Lucio',57,3),(62,'John Cedrick','Claro','Chu',26,13),(63,'Kenneth Clifford','Magalona','Janoras',23,11),(64,'John','Palao','Gadiano',16,11),(65,'Jarette Albert','Ibong','Lee',75,15),(66,'Cloyd','Yusop','Talirongan',20,15),(67,'Kristian Marc Anthony','Mendoza','Ng',30,3),(68,'Khalil Angelo','Timbancaya','Acosta',89,2),(69,'Rochelle','Locsin','Matillano',46,5),(70,'Allyne','Sipin','Singson',12,14),(71,'Jeff Paul','Nangit','Manglicmot',61,13),(72,'Ronillynuel James','Catli','Agum',79,2),(73,'Allen','De Guzman','Selga',23,9),(74,'Raquel','Rubion','Relata',78,6),(75,'Emmanuel','Gadot','Juanich',18,12),(76,'Synteche','Magarce','Sabandal',94,7),(77,'Denzel Andrei','Ballesteros','Bermejo',23,5),(78,'John Cletus','Nale','Blas',80,15),(79,'Vincent Adrian','Pacleb','Abian',23,14),(80,'Arnaldo','de Leon','Olarte',79,2),(81,'Anthoy Steven','N/A','Adato',18,1),(82,'Ria joy','Tingdan','Brizo',73,1),(83,'Aldrin','Tibus','Delicias',78,8),(84,'Tiffany Joy','Castro','Iquin',17,5),(85,'Sairah Faith','De los Reyes','Tablatin',22,15),(86,'Mizraim','Balgoma','San Juan',1,5),(87,'Bhea Jane','Junio','Cafugauan',69,3),(88,'Kevin Cesar','Juan','Jacobo',9,3),(89,'Mel Joseph','Gabuco','Paredes',6,3),(90,'Francis Paul','Rieza','Hizon',29,4),(91,'Liezel Jay','Barbacena','Diong',29,10),(92,'Richo','Orehuela','Combinido',47,14),(93,'James Barry','Menchavez','Almerez',23,11),(94,'Dean','Dalabajan','Sabroso',79,15),(95,'Jessica','Gloria','Cabilar',2,6),(96,'Keff Ivan','Collantes','Decolongon',9,1),(97,'Irish Jean','N/A','Gillona',47,3),(98,'Zoe Ayessa','N/A','Buesa',88,15),(99,'Renz Carl','Antenero','Ozoa',99,2),(100,'Chris Daniel','Olila','Daquioag',55,2),(101,'Ailene Grace','T','Heredero',16,15),(102,'Aizel','Hoyo-a','Cantado',85,10),(103,'Elyn May','Dela Pena','Macatangay',25,1),(104,'Bjan Cymar','Lamdagan','Cabangbang',8,3),(105,'John Bryan','Pantojan','Macalinao',47,7),(106,'Ian Jan','Favila','Aborot',78,1),(107,'Joni Caryl','Mayo','Diaz',23,5),(108,'Verna Karylle','Cayao','Elanan',9,11),(109,'Alondra','Trinidad','Sola',46,12),(110,'Zaj Kenneth','Baldea','Panes',2,11),(111,'Jofli Asaph','Sarmiento','Delcoro',8,9),(112,'Shervielyn Jane','N/A','Apolinar',37,16),(113,'Shervielyn Jane','N/A','Apolinar',83,5),(114,'Cyver Kate','N/A','Mahinay',33,3),(115,'Anniza','Acot-Acot','Hachero',16,14),(116,'Harry Ericson','Alaras','Cabrera',17,15),(117,'Milky Mae','Mahinay','Galicia',51,1),(118,'Maui Azryl','Morillo','Lomuntad',78,2),(119,'Dyla Kris Vanneth','Mesina','Bondesto',16,13),(120,'Samantha Anne','Perez','Quizon',68,11),(121,'Meah','Dape','Fabrigas',41,8),(122,'Jeffer','Inocente','Molato',81,6),(123,'Michael Joshua','Damasco','Calan',76,16),(124,'Reymart','Flores','Azucena',41,12),(125,'German','Rodriguez','Cinco',68,8),(126,'Yusuf Xander','Badidil','Ortega',43,3),(127,'Austin Clyde','Palermo','Sibugan',15,12),(128,'Norkizah','Monib','Baute',122,13),(129,'Reodel','Suarez','Calilung',14,13),(130,'Ian Gabriel','Fetalver','Dalimocon',61,13),(131,'Justine Luis','Diola','Elorde',81,5),(132,'Queanna Brittany','Salamatin','Ibrahim',57,15),(133,'kyla mae','gabayan','pagkaliwangan',14,12),(134,'Mikhaela','Diaz','Pastor',77,14),(135,'Carl Vincent','Nacasi','Alabastro',12,6),(136,'Jan Ivn Anthony','Donaire','Conde',81,11),(137,'Joni Caryl','Mayo','Diaz',64,15),(138,'Apple Ace','Eduardo','Acepcion',12,11),(139,'Charls Brent','dela Cruz','Cayabyab',71,7),(140,'Kate Andrea','Palay','Katon',22,2),(141,'Aubrey karylle','Neri','Mamaril',16,10),(142,'Obrien Troy','Magalsoo','Dangan',61,13),(143,'Gideon','Torres','Magno',24,7),(144,'Drexzel','Cayao','Lambon',67,9),(145,'Arvin Clark','Tumpag','Lota',77,8),(146,'Johnzyll','Abadiano','Jimeno',14,3),(147,'Jemeric','N/A','VAlmoria',67,8),(148,'John Carl','Aurelio','Reyes',12,4),(149,'john philip','bermudez','beltran',12,5),(150,'Mart','Edrian','Bernardo',41,14),(151,'Danielle Grace','Diongzon','Dignadice',16,11),(152,'Cy Allene','Origenes','Paalan',8,16),(153,'Don Angel Lou','Manzano','Salvatierra',84,1),(154,'Princess Aira','Ahmad','Suranol',71,13),(155,'Melodie','Lacson','Gardose',41,14),(156,'John Dexter','Embile','Sangalang',86,7),(157,'Cristy','Villan','Tubo',87,11),(158,'Carlota','Calagos','Prado',97,3),(159,'Jason Maverick','Diokno','Serencio',95,15),(160,'Kier Wilson','Mangahas','Familaran',57,11),(161,'Noe','Dumip-ig','Dela Concepcion',50,7),(162,'Franz Lorrenz','Miraflores','Badenas',62,13),(163,'Joni Caryl','Mayo','Diaz',14,16),(164,'Al-nizar','Sabuddin','Wahab',61,5),(165,'Marvin','Dela Torre','Esmeralda',71,1),(166,'Jose','Marie','Chan',17,6);
/*!40000 ALTER TABLE `project_app_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employeeskills`
--

DROP TABLE IF EXISTS `project_app_employeeskills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employeeskills` (
  `employee_id` varchar(45) NOT NULL,
  `skill_id` varchar(45) NOT NULL,
  `skill_level` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`,`skill_id`),
  UNIQUE KEY `project_app_employeeskills_employee_id_skill_id_ca131fb8_uniq` (`employee_id`,`skill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeeskills`
--

LOCK TABLES `project_app_employeeskills` WRITE;
/*!40000 ALTER TABLE `project_app_employeeskills` DISABLE KEYS */;
INSERT INTO `project_app_employeeskills` VALUES ('1','3','Advanced Mastery'),('1000','1000','Professional'),('101','5156','Professional'),('102','104','Ibang Level'),('103','103','Professional'),('104','24','Intermediate'),('106','106','Intermediate  '),('11','0','Advanced'),('111','111','Professional'),('1124','4','Professional'),('1170135','1170131','High'),('12','2','Professional'),('1212783718','2147483647','Professional'),('1214','1214','Professional'),('1221','37','Non Professional'),('122213','913','Advance'),('12345','12345','Beginner'),('124','124','Professional'),('13','13','Expert'),('134811','134811','Average'),('136','132','Intermediate'),('143','143','Intermediate'),('14369','14369','Mythical Glory'),('17','17','Intermediate'),('18','8','Expert'),('1818','1818','Professional'),('187','187','Beginner'),('19','20','Average'),('2','7','Average'),('200021','200021','Entry-level'),('201980339','201980339','Amateur'),('2020100612','2020100612','PROFESSIONAL'),('20203','20203','Professional'),('202080','202080','Professional'),('202080035','202080035','Average'),('202080044','202080044','Professional'),('202080457','202080457','Average'),('202080473','202080473','Average'),('202080476','202080476','Professional'),('202081','202081','Professional'),('2021001132','81233','Average'),('202180032','202180032','Basic'),('202180036','202180036','High-Level'),('202180157','202180157','Average'),('202180343','202180343','Above Average'),('202180383','202180383','God level'),('202180384','202180384','Advanced'),('20231126','202080491','Professional'),('20502050','201880036','SUPER SAIYAN'),('21','23','Expert'),('2121','2121','Professonal'),('2147483647','202143145','Professional '),('23','21','Expert'),('24','25','Expert'),('25','26','Expert'),('27','32','Professional'),('28','23','Beginner'),('3','7','Advanced'),('31','28','Legendary'),('32','36','Professional'),('33','33','Professional'),('34','102','Advanced'),('35','123','Professional'),('35','888','Beginner'),('36','35','Expert'),('37','38','Intermediate'),('38','202180012','Professional'),('4','18','Advanced'),('4','7','Beginner'),('420','420','Professional'),('4420','619','Professional'),('456','2023','Professional'),('47','2020801456','Professional'),('475','425','Professional'),('475','777','Intermediate'),('50','50','Intermediate'),('500','455','Professional'),('55','55','Average'),('55555','55555','Entry Level'),('5555555','51555','Newbie'),('6','111','Professional'),('6','6','Intermediate'),('6','8764','Intermediate'),('62','62','Expert'),('63','63','Expert'),('65','125','Proffesional'),('666','666','Advance Mastery'),('69','69','Intermediate'),('69120','69001','Professional'),('7','9','Beginner'),('70','1830','Professional'),('70121','9090','Professional'),('71','20202','Advanced'),('711711','201880066','LEVEL 1'),('76446','76444','Professional'),('8','10','Beginner'),('81111','90001','Professional'),('81112','90002','Advanced'),('8223','822','Professional'),('88','88','Expert'),('9','11','Mid-level'),('90446','90444','Professional'),('9080','29','Advanced 2'),('90809','9082122','Professional'),('98','98','Master Level'),('99','99','Beginner'),('991','991','Ace'),('9999','9999','Professional');
/*!40000 ALTER TABLE `project_app_employeeskills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_employeetraining`
--

DROP TABLE IF EXISTS `project_app_employeetraining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_employeetraining` (
  `employee_id` bigint NOT NULL,
  `training_id` bigint NOT NULL,
  `participation_type` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`,`training_id`),
  UNIQUE KEY `project_app_employeetrai_employee_id_training_id_1d0c6974_uniq` (`employee_id`,`training_id`),
  KEY `project_app_employee_training_id_fe6f080f_fk_project_a` (`training_id`),
  CONSTRAINT `fk_employeetraining_training` FOREIGN KEY (`training_id`) REFERENCES `project_app_training` (`id`) ON DELETE CASCADE,
  CONSTRAINT `project_app_employee_employee_id_957cf520_fk_project_a` FOREIGN KEY (`employee_id`) REFERENCES `project_app_employees` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_employeetraining`
--

LOCK TABLES `project_app_employeetraining` WRITE;
/*!40000 ALTER TABLE `project_app_employeetraining` DISABLE KEYS */;
INSERT INTO `project_app_employeetraining` VALUES (1,9,'Internship'),(3,1,'In-Person Training'),(4,122,'In-Person Training'),(5,1,'In-Person Training'),(5,3,'Online Training'),(7,1,'In-Person Training'),(8,2,'In-Person Training'),(8,19,'In-Person Training'),(9,5,'Online Training'),(10,6,'Online Training'),(11,7,'Trainor'),(13,8,'Traditional Classroom'),(17,17,'In-Person Training'),(20,20,'On-Site Training'),(21,22,'Online Training'),(22,21,'Online Training'),(23,25,'In-Person Training'),(24,104,'Virtual Training'),(25,23,'On-Site Training'),(26,24,'Online Training'),(27,27,'In-Person Training'),(28,31,'On-Site Training'),(32,27,'In-Person Seminar'),(33,35,'On-Site Training'),(35,46,'On-Site-Training'),(36,32,'On-Site Training'),(37,568,'In-Person Training'),(38,37,'On-Site-Training'),(50,50,'On-Site-Training'),(55,55,'On-Site Training'),(62,62,'Online Training'),(63,63,'In-Person Training'),(69,69,'On-Site-Training'),(88,88,'In-Person Training'),(99,99,'On-Site Training'),(102,36,'In-Person Training'),(103,103,'On-Site Training'),(106,106,'In-Person Training'),(111,111,'On-Site Training'),(123,40,'On-site Training'),(124,124,'On-Site-Training'),(125,65,'In-Person Training'),(132,132,'On-site Training'),(139,202180384,'In Person Training'),(143,143,'In-Person Training');
/*!40000 ALTER TABLE `project_app_employeetraining` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_hobby`
--

LOCK TABLES `project_app_hobby` WRITE;
/*!40000 ALTER TABLE `project_app_hobby` DISABLE KEYS */;
INSERT INTO `project_app_hobby` VALUES (7,'Art'),(5,'Cooking'),(12,'Dancing'),(8,'Fitness'),(6,'Gaming'),(9,'Hiking'),(3,'Music'),(1,'Reading'),(13,'Singing'),(2,'Sports'),(4,'Travel'),(10,'Video Game'),(11,'Volunteering');
/*!40000 ALTER TABLE `project_app_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_app_institution`
--

DROP TABLE IF EXISTS `project_app_institution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_institution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institution_name` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_institution`
--

LOCK TABLES `project_app_institution` WRITE;
/*!40000 ALTER TABLE `project_app_institution` DISABLE KEYS */;
INSERT INTO `project_app_institution` VALUES (1,'Lyceum of the Philippines University'),(2,'Stellar Academy'),(3,'Palawan State University'),(4,'Palawan National School'),(5,'East Central School'),(6,'Palawan Polytechnic College Inc.'),(7,'Eastwide Masters High School'),(8,'Eastwide Masters High School'),(9,'Southbound Monstar School'),(10,'Beijing University'),(11,'Ateneo de Manila University'),(12,'Palawan State University'),(13,'Harvard University'),(14,'Aborlan Elementary School'),(15,'Aborlan National High School'),(16,'Western Philippines University'),(17,'Center for Positive Future'),(18,'Atene de Manila University'),(19,'National University'),(20,'Palawan State University'),(21,'North Ford'),(22,'Hell University'),(23,'National Administrative Systems Authority'),(24,'Pangasinan State University-Open University'),(25,'Manuel Autria Memorial Elementary School'),(26,'Roxas National Comprehensive High School'),(27,'Home Schooled'),(28,'Andres Soriano Memorial Elementary School'),(29,'Governor Alfredo Abueg Sr. National High School'),(30,'West Ford'),(31,'Seoul National University'),(32,'University of the Philippines'),(33,'University Sa Tiniguiban'),(34,'Chodeung Hakgyo'),(35,'Daegu International School'),(36,'Karasuno High School'),(37,'Massachusetts Institute of Technology'),(38,'Stark Industries'),(39,'The big bang institution'),(40,'Nagaoka University of Technology'),(41,'Hero Academy'),(42,'Oracle National University'),(43,'Oracle Academy'),(44,'Stanford University'),(45,'Holy Glory State University'),(46,'Francisco University'),(47,'Queenâ€™s University, Kingston'),(48,'Mindanao State University'),(49,'Institute of Geographic Information System'),(50,'Computer Studies College'),(51,'University of Cambridge'),(52,'Technical University of Munich'),(53,'University College London'),(54,'Bataan State University'),(55,'RYI Science Academy'),(56,'Baltan Academy'),(57,'Suzuran Academy'),(58,'Massachusetts Institute of Technology'),(59,'TechMinds Academy'),(60,'Mexio London University'),(61,'Phantom University'),(62,'Young God University'),(63,'Ateneo de Manila University'),(64,'Technology University'),(65,'Something Academy'),(66,'Harvard University'),(67,'Mababang Paaralan ng Palawan'),(68,'Mataas na Paaralan ng Palawan'),(69,'Unibersidad ng Palawan'),(70,'Lyceum of the Philippines University'),(71,'Innovatech Institute of Technology'),(72,'Princeton University'),(73,'Institute of Imaginative Technologies (IIT)'),(74,'Holy Trinity University'),(75,'Higher Elementary School'),(76,'Middle Junior High School'),(77,'Lower Senior High School'),(78,'Yorozuya Academy'),(79,'CyberGuard Institute '),(80,'Quantum Data Science Institute'),(81,'Tokyo Institute of Technology'),(82,'Western Philippines University'),(83,'PSU-PCAT'),(84,'Mauricio Elementary School'),(85,'Siam Technological University'),(86,'University of Computer Science and Technology'),(87,'Tech Training Institute'),(88,'IT Project Management College'),(89,'Cuyo Isle Institute'),(90,'Baguio State University'),(91,'Eden Academy'),(92,'California Institute of Technology'),(93,'CORAL Elementary School'),(94,'CORAL Academy'),(95,'Federal Bureau of Investigation'),(96,'Hev Abi University'),(97,'Quantum SyncTech Institute'),(98,'Equilibrium Institute'),(99,'Harvard University'),(100,'Massachusetts Institute of Technology '),(101,'Wakanda University'),(102,'Serrano Elementary School'),(103,'Canumay West National High School'),(104,'Bayag National High School'),(105,'Akita University of Art'),(106,'University of Immortals'),(107,'University of Oxford'),(108,'Tesla University'),(109,'Mapua University'),(110,'STARK UNIVERSITY'),(111,'Koudo Ikusei College'),(112,'Digital Design Institute'),(113,'Superhero University'),(114,'Holy Trinity College'),(115,'Holy Trinity University'),(116,'University of Oxford'),(117,'Cannabeast University'),(118,'Occidental Mindoro State University'),(119,'Masbate State University'),(120,'Palawan State University'),(121,'Mariano Marcos State University-Main'),(122,'Bachelor of Science in Computer Science'),(123,'Schoolastica College'),(124,'Cosmic Synx Horizon Institute'),(125,'Cosmic HS Horizon Institute'),(126,'Cosmic College Horizon Institute'),(127,'Palawan State University'),(128,'Wakanda University'),(129,'Georgia Institute of Technology'),(130,'School of Performing Arts Seoul'),(131,'Athens Elementary Institute'),(132,'Athens SHS Institute'),(133,'Athens College  Institute'),(134,'Duke University'),(135,'Northeastern University'),(136,'University of Chicago'),(137,'University of Manila'),(138,'Malabon I.T Developers'),(139,'Palawan  State of University'),(140,'Imong-Mama University'),(141,'De La Salle University'),(142,'El Nido National School'),(143,'Oden Sama State University'),(144,'Asian Institute of Computer Studies'),(145,'University of Son Guko'),(146,'Quezon State University'),(147,'Bio Informatics Institution'),(148,'Palawan State University'),(149,'Seoul National University'),(150,'Cavite State University'),(151,'QuantumTech Institute'),(152,'German European School Manila'),(153,'Hogwarts National School'),(154,'Love Me State UNIVERSITY'),(155,'Kyoto University'),(156,'Nagoya Institute of Technology'),(157,'Palawan College'),(158,'National University of Singapore'),(159,'Seoul National University'),(160,'University of San Agustin'),(161,'University of the Cordilleras'),(162,'Palawan high school'),(163,'Palawan State University'),(164,'Batman University'),(165,'Palawn SU'),(166,'Palawan State University'),(167,'BugaBuga State University'),(168,'AMA Computer University'),(169,'Universidad de Paris V Descartes'),(170,'Sto Thomas University Manila'),(171,'University degli Studi Luminosi'),(172,'Roxas National Comprehensive High School'),(173,'Kansas State University'),(174,'PI School of Mathematics amd Technology'),(175,'JS LESLEY UNIVERSITY'),(176,'Palawan State University'),(177,'Mapua State University'),(178,'JJK Perpetual National High School'),(179,'Notre Dame University'),(180,'Palawan National School');
/*!40000 ALTER TABLE `project_app_institution` ENABLE KEYS */;
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
  `skill_description` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
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

--
-- Table structure for table `project_app_training`
--

DROP TABLE IF EXISTS `project_app_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_app_training` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `training_venue` varchar(100) NOT NULL,
  `training_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `training_title` varchar(100) NOT NULL,
  `institution_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2023237189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_app_training`
--

LOCK TABLES `project_app_training` WRITE;
/*!40000 ALTER TABLE `project_app_training` DISABLE KEYS */;
INSERT INTO `project_app_training` VALUES (1,'TechHub Training Center','Cybersecurity Certification Course','2020-06-25','2021-02-10','Advanced Cyber Defender Certification',1),(2,'TechXcel Training Hub','Data Science and Analytics','2020-03-03','2020-03-10','DataXcel: Applied Data Science and Machine Le',2),(3,'Zoom Meeting ','Web Design and Programming','2020-05-15','2020-05-30','Beginner Full Stack Web Development: HTML, CS',2),(5,'TNC Training Hub','Introduction for  Back-end Developer','2023-10-08','2023-10-20','Basic Information about Back-end programming',10),(6,'The Louis V. Gerstner, Jr. Center for Learnin','Technical Training','2023-11-01','2024-03-10','Mastering IT Essentials: Building Core Techni',12),(7,'IT Training Hub','Project Manager','2020-07-30','2023-11-23','Training for All Aspiring Project Manager',16),(8,'Ateneo de Manila University','Front End Engineering','2021-01-01','2021-06-30','\"Entering the World of a Software Engineers\"',17),(9,'Oscorp Industries','Coding Bootcamp','2020-05-04','2020-05-29','Dev Bootcamp',44),(10,'IAS Common Ground, G11, Ground floor, South W','Workshop','2023-12-13','2023-12-13','IAS Early Career Network: The Elevator Pitch ',53),(13,'Ausphin Hub','Web Development','2023-12-01','2023-12-07','Web Development Bootcamp: Learn and Launch Yo',13),(14,'CodeCraft Learning Hub','Information Systems','2023-11-11','2023-11-20','Elevate Your IT IQ: Advanced Information Syst',14),(15,'NU Manila','Technical','2022-05-05','2022-06-01','Captain Course',19),(16,'TechNest Learning Hub','Computer Science','2022-05-12','2022-05-17','Data Structures and Algorithms Mastery',16),(17,'Harvard University','Artificial Intelligence','2023-06-21','2023-06-24','Introduction to Artificial Intelligence with ',12),(18,'Home','Coaching','2023-05-17','2023-09-23','Advanced algorithm on cloud computing',27),(19,'Abueg High School','IT training program','2022-02-01','2022-02-12','Comprehensive IT Skill Development Program',28),(20,'West Ford ','Information Technology Program','2023-12-01','2024-01-21','Become an Analyst in All Aspect',30),(21,'Online','Software Development','2023-11-23','2024-11-23','Learn, understand and execute on the three ov',32),(22,'Jeju Island','UI/UX','2023-01-23','2023-01-24','User-Centered Design: Mastering UI/UX Princip',31),(23,'Cable Crimping','network engineering','2023-11-22','2024-11-22','Network Export',37),(24,'Greed Island','Data analytics','2023-05-23','2024-01-05','listen,look and listen and learn',36),(25,'University Sa Tiniguiban','Database Management System','2023-11-11','2023-11-22','Mastering Database Management Systems: From F',33),(26,'Stark Tower','AI creation','2023-12-25','2076-01-01','Creating Ultron',38),(27,'Saint Calling IT Camp','Programmer\'s Values and Ethics','2023-09-02','2024-09-09','How to be an apex programmer',39),(28,'Pentest Ins.','Penetration testing workshop','2023-11-22','2023-12-29','Built fo penetration tester your tools to get',6),(30,'IT Training Center','Mobile App Development','2023-12-16','2023-12-20','Hands-on practice on how to develop mobile ap',4),(31,'Oracle Center','Service Management Training','2023-11-11','2023-11-18','One Service One Way',42),(32,'Canada Training Center','Game Development','2023-01-13','2023-06-01','Game Development Finest',51),(33,'Camella Homes','Google IT Support','2023-02-15','2023-04-15','Google Enthusiast Convention',71),(34,'URBN QC','IBM IT Support Training','2023-08-10','2023-10-10','IT Professionals League',72),(35,'Holy Place','Web Delelopment Seminar','2023-10-23','2023-11-10','Web Development',45),(36,'Asturias Hotel','Workshop','2023-05-06','2023-06-30','Effective IT Change Management Practitioner',96),(37,'IGIS Headquarter','On the job training','2023-05-20','2023-10-20','Geospatial and Environment Analysis',33),(40,'Palawan State University','Bootcamp','2023-03-10','2023-03-15','Data management and visualization',50),(46,'Seishun Academy','Anime Designing and Animation','2023-01-15','2024-01-15','Anime Development',23),(50,'National Innovation Hub','Symposium','2023-05-16','2023-05-18','IT Innovation and Emerging Technologies Forum',52),(55,'University Performance Art Center','Workshop','2022-10-10','2022-10-12','Web Designing Program',2),(60,'Cloud Academy Training Center','Architecture Bootcamp','2023-11-16','2023-11-20','Mastering Cloud Solutions Architecture',60),(62,'Microsoft Visitor Center','Online','2023-12-24','2023-12-29','Backup & Recovery: Business Continuity & Disa',62),(63,'Microsoft Headquarters','Hands-on Experience','2023-06-22','2023-12-18','Systems administration tools and technologies',63),(65,'DataSculpt Innovations Hub','Seminar','2023-05-02','2023-05-03','Implementing Quantum-Inspired Machine Learnin',125),(69,'Computer Lab at a Technical Training Center','Software Development Bootcamp','2023-08-19','2023-09-15','CodeCraft: Intensive Software Development Boo',69),(70,'Common Wealth Institute','Mechanical Web','2023-09-08','2029-09-08','Web application Engine',70),(88,'Technology University','Full Stack Development','2023-02-01','2023-02-15','Ellon X:Full Stack Invitational ',88),(99,'Unibersidad sa Palawan','Software Engineering','2023-06-06','2023-06-08','Introduction to Sofware Engineering',101),(100,'Nagaoka University of Technology','Geographic Information System Certification t','2023-01-01','2023-03-03','GIS Specialist Training',3),(101,'Aziza Hotel','Workshop','2021-01-01','2021-07-01','A Comprehensive Training for IT Support Speci',46),(103,'QuantumTech Center for Innovation','Advanced Cybersecurity Symposium','2023-03-15','2023-04-17','CyberGuard Mastery: Defending the Quantum Fro',103),(104,'Zoom Meeting','Webinar','2023-11-24','2023-11-25','Basics of Ethical Hacking',104),(106,'Enchanted Academy','Imaginative Technology Workshop','2024-01-15','2024-01-17','Unleashing Creative Possibilities: Exploring ',106),(110,'Home Study','Online','2023-01-23','2023-06-23','Google IT Support Professional Certificate',109),(111,'University Computer Laboratory','Website Development','2021-01-01','2021-02-02','Entering the World of Software: A Website Dev',2),(121,'De Verde Conference Center','Seminar and hands-on training','2023-03-09','2023-03-12','Introduction to NLP',15),(122,'Asturias Hotel','workshop','2020-11-10','2020-11-10','Certification Training for Data Privacy Offic',12),(124,'CyberGuard Training Center','Hands-On Workshop','2023-01-10','2024-02-07','Securing the Digital Fortress:CompTIA Securit',124),(132,'City Colliseum','Data Analysis','2023-02-22','2023-08-22','Advanced Data Analysis',19),(143,'University of the Philippnes','Data Visualization','2023-01-20','2023-05-30','Data Visualization & Dashboarding with R Spec',15),(187,'Google HQ','Data Security','2019-02-14','2019-12-12','WhiteHat: Google Security ',180),(311,'City Coliseum','Ethical Hacking and Penetration Testing','2023-07-25','2024-02-25','Cyber Sentinel Training Program',23),(321,'Tech Hub B','Seminar','2023-02-05','2023-02-08','Cybersecurity Essentials',2),(367,'PDDRMO Compound','Forensic','2021-03-23','2021-06-12','Determine search patterns',12),(369,'Saitama Center Tech','Online','2024-01-08','2024-01-13','Web development',114),(405,'Marina Bay Sands, Singapore','Seminar','2020-10-10','2020-10-17','Strategic IT Policy Management',124),(406,'Washington, D.C., United States','Workshop','2018-07-12','2018-07-26','Behavioral Analysis in Cyber Investigation',162),(420,'Online','Front&Backend Development','2023-11-24','2023-12-24','Full-Stack Mastery',142),(425,'Innovation Hub','Workshop','2023-03-10','2023-03-14','Comprehensive UI/UX Design Course',12),(471,'TechHub Canada','Microsoft Certified: ','2023-11-24','2024-01-24','Microsoft Certified: Azure Administrator Asso',47),(512,'Valorant','Gaming','2023-11-26','2023-11-29','To Kill Noobs',5),(555,'Bahay Namin','Error lookup','1901-02-23','2015-02-02','Risk Analyzing',13),(568,'World Trade Center','Seminar','2021-04-01','2023-04-03','web and developing Techniques',16),(666,'World Trade Center','Workshop','2000-01-01','2001-10-11','Aspect Data Analytics',75),(888,'Coliseum','UI/UX','2023-01-15','2023-01-18','Dream, Believe',37),(987,'Pac Palawan','Workshop','2023-12-12','2024-12-12','WebDev',71),(989,'San Jose University','Workshop','2020-01-12','2021-01-12','Compendium pen of freedom',2),(991,'Alcatraz','Workshop','2015-01-02','2015-05-05','Masteral of Prison Break',57),(1000,'Department of Computer Science','Design and Engineering','2020-01-01','2024-02-02','Cloud Network Engineering Development',88),(1001,'Accenture Innovation Hub','Bootcamp','2022-01-02','2022-06-02','Understanding Technology and Data',126),(1214,'PPSAT','Technical support','2023-01-20','2023-01-30','Pioneers of Productivity',48),(1313,'Renward Arena','Workshop','2023-10-23','2023-10-28','Network Management',158),(1818,'Asturias Hotel','UI Desgin Conference','2023-01-10','2023-01-10','Navigating the Future of UI Design',78),(2121,'Wakanda','Technology Skills Training','2023-05-19','2023-05-19','Vibranium Technology Training',23),(2212,'PalSU Performing Arts Center','Seminar','2023-12-05','2023-12-07','Natural Language Processing Training',15),(4420,'Rangsit University','Soft Skills Training','2023-01-01','2023-02-01','Cultivating Professional Excellence',77),(8227,'Asturias Hotel','Web Development Seminar','2023-05-03','2023-05-05','Website Development',8),(8764,'Hotel Centro','Workshop','2023-02-14','2023-01-18',' Front-End Development Mastery',95),(9092,'Blue Origin Center','Computer Networking ','2022-07-17','2023-02-11','Network Technology Development ',12),(9999,'Tech Conference Center','Workshop','2023-01-15','2023-01-18','Advanced Software Engineering Techniques',67),(20203,'Mcdo San Pedro','Workshop','2023-05-12','2023-05-12','Game Character Design',86),(55555,'United Kingdom','Workshop','2023-04-15','2023-05-16','WebDiv Convention',12),(69120,'TechForge Academy','Engine Developer','2022-06-15','2023-01-10','Advanced Game Engine Development',45),(75300,'Asturias Hotel','Web Development Seminar','2023-05-03','2023-05-05','Web Development',26),(76501,'TechDev Conference Center','Workshop','2023-01-15','2023-02-18','Advanced DevOps Engineering Techniques',54),(80123,'SM Palawan','Workshop','2023-05-11','2023-05-25','Advanced Neural Networks',12),(90197,'Sunny\'s Dining','Cooking Workshop','2024-02-10','2024-03-10','Korean Traditional Dessert Rice Cake Making C',35),(90501,'GameDev Conference Center','Workshop','2023-01-15','2023-12-18','Advanced Game Engineering Techniques',87),(90809,'NBA training camp 2022','offseason work out','2022-02-15','2023-02-20','NBA training camp 2022',41),(99999,'Shibuya','Wrestling','2025-10-20','2050-05-10','Fighting Sukuna',152),(134811,'University of Manila ','Workshop','2023-12-10','2024-01-12','WebDev Convention',123),(200021,'Malabon I.T Developers City','Bootcamp','2020-01-23','2020-07-20','Front-End Web Developing',153),(202081,'Robinsons\' Place Palawan','Workshop','2019-05-25','2021-03-24','Certification of Being Certified',148),(246810,'Fast Lane US','Workshop','2021-09-18','2021-11-20','AWS Certified SysOps Administrator Associate ',45),(1170132,'MCW Tech Compound','Collaborative Training Program','2023-09-30','2023-12-30','CGI and VR innovation',98),(20231130,'Discord','Webinar','2023-10-28','2023-11-28','Intensive Training Program',86),(201980339,'Online','Online workshop and teambuilding','2023-01-01','2023-01-01','medical imaging data analysis',88),(202080035,'Sky Lodge','Workshop','2023-10-25','2021-12-03','Front-End Developer',25),(202080044,' Skylight Summit Conference Center','Advanced Cybersecurity Workshop','2023-05-14','2023-05-15','CyberGuard Pro: Mastering Advanced Threat Def',56),(202080061,'Hue Hotel','Workshop','2023-03-19','2023-03-25','Cyber Security and Data Privacy',36),(202080135,'Kamogawa Center','Workshop','2022-08-21','2023-08-22','Certified Roblox Game Developer',95),(202080160,'Nagoya Center ','Webinar','2020-01-01','2020-02-01','GIAC Certified Forensic Analyst (GCFA)',97),(202080457,'Costa Palawan Resort','Workshop','2023-11-08','2023-11-09','ICT SKILLS ROADMAP DEVELOPMENT WORKSHOP',4),(202080463,'Skydome Arena ','Artificial Inteligence for Smartphones','2023-02-01','2023-02-05','Galaxy AI  a comprehensive mobile AI experien',84),(202080476,'Skylight covention center','Workshop','2023-03-15','2023-03-18','Operating software and hardware',1),(202080497,'Univeristy of the Cordilleras','Seminar','2023-08-29','2023-08-29','Empowering Learning with AI-Powered ChatBots',23),(202110007,'Zoom Meeting','Online','2023-02-01','2023-05-20','Front and Backend Fundamentals',74),(202180012,'PalawanSU Library - American Corner','Workshop','2023-11-28','2023-11-30','Digital Canvas: Multimedia Crafting and Creat',56),(202180032,'SUN','Workshop','1901-01-01','2000-01-01','Tehnical Training',54),(202180036,'Firing Range','Close Quarter Combat','2002-10-22','2069-11-11','Prey vs Predator',23),(202180200,'D&S Support Center','Workshop','2023-02-02','2023-05-05','Technical Training',65),(202180249,'HCL Technologies Company','Workshop','2023-01-14','2023-07-20','IT Technician Training: Hardware and Software',66),(202180343,'Accenture Centre','Workshop','2023-11-26','2023-11-26','Software Development using PHP and C#',74),(202180362,'Quantum Nexus Institute','Quantum Cyber Alchemy Immersion','2023-05-03','2023-07-18','Quantum Guardian Certification Program',121),(202180384,'The White House','Workshop','2022-09-11','2022-09-11','Back-End Web Developer',122),(711711711,'Grandline','Fishing','2023-01-23','2027-04-01','Bring Down Kaido',154),(2020100612,'New Vesion ','workshop','2023-09-25','2023-09-28','Testing and Advance Testing Function ',162),(2020101111,'City Coliseum','Workshop','2023-05-19','2023-05-19','Phishing attacks Training',21),(2020810710,'Japan','Workshop','2024-01-20','2024-02-20','Video Game Design ',45);
/*!40000 ALTER TABLE `project_app_training` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10 16:26:56
