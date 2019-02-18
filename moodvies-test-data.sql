-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: moodvies
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actor` (
  `idActor` int(11) NOT NULL AUTO_INCREMENT,
  `nameActor` varchar(45) DEFAULT NULL,
  `last_nameActor` varchar(45) DEFAULT NULL,
  `date_of_birthActor` date DEFAULT NULL,
  `descriptionActor` varchar(1000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `search_field` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idActor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (8,'Christian','Bale','1974-01-30','Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer \"Jenny\" (James) and David Charles Howard Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale\'s childhood, including England, Portugal, and the United States. Bale acknowledges the constant change was one of the influences on his career choice.','2018-11-17 22:07:03.125729','2019-02-18 15:28:48.690069','MV5BMTkxMzk4MjQ4MF5BMl5BanBnXkFtZTcwMzExODQxOA._V1_.jpg','Christian Bale 1974'),(16,'Leonardo','DiCaprio','1974-11-11','Few actors in the world have had a career quite as diverse as Leonardo DiCaprio\'s. DiCaprio has gone from relatively humble beginnings, as a supporting cast member of the sitcom Growing Pains (1985) and low budget horror movies, such as Critters 3 (1991), to a major teenage heartthrob in the 1990s, as the hunky lead actor in movies such as Romeo + Juliet (1996) and Titanic (1997), to then become a leading man in Hollywood blockbusters, made by internationally renowned directors such as Martin Scorsese and Christopher Nolan.','2018-12-20 19:03:31.986028','2019-02-18 04:48:00.169126','Leonard_Dicaprio.jpg','Leonardo Leonardo'),(17,'Joseph','Gordon-Levitt','1981-02-17','Joseph Leonard Gordon-Levitt was born February 17, 1981 in Los Angeles, California, to Jane Gordon and Dennis Levitt. Joseph was raised in a Jewish family with his late older brother, Dan Gordon-Levitt, who passed away in October 2010.','2018-12-20 19:04:05.875448','2019-02-18 16:04:33.694006','joseph-gordon-levitt_BpGgELJ.jpg','Joseph Gordon-Levitt Joseph Gordon Levitt'),(21,'Liam','Neeson','1952-06-07','During his early years, Liam worked as a forklift operator for Guinness, a truck driver, an assistant architect and an amateur boxer. He had originally sought a career as a teacher by attending St. Mary\'s Teaching College, Newcastle. However, in 1976, Neeson joined the Belfast Lyric Players\' Theater and made his professional acting debut in the play \"The Risen People\".','2019-02-18 04:15:28.992198','2019-02-18 04:15:28.992198','Liam_Neeson.jpg','Liam Neeson 1952'),(22,'Elijah','Wood','1981-01-28','Elijah Wood is an American actor best known for portraying Frodo Baggins in Peter Jackson\'s blockbuster Lord of the Rings film trilogy. In addition to reprising the role in The Hobbit series, Wood also played Ryan in the FX television comedy Wilfred (2011) and voiced Beck in the Disney XD animated television series TRON: Uprising (2012).','2019-02-18 04:25:07.232194','2019-02-18 15:23:40.528257','Elijah_Wood.jpg','Elijah Wood 1981'),(23,'Ellar','Coltrane','1994-08-27','Ellar Coltrane was born on August 27, 1994 in Austin, Texas, USA as Ellar Coltrane Kinney Salmon. He is an actor and producer, known for Boyhood (2014), The Circle (2017) and Fast Food Nation (2006).','2019-02-18 04:29:36.077378','2019-02-18 04:29:36.077378','Ellar_Coltrane.jpg','Ellar Coltrane'),(24,'Colin','Farrel','1976-05-31','Colin Farrell is one of Ireland\'s biggest stars in Hollywood and abroad. His film presence has been filled with memorable roles that range from an inwardly tortured hit man, to an adventurous explorer, a determined-but-failing writer, and the greatest military leader in history.','2019-02-18 04:37:51.919040','2019-02-18 04:37:51.919040','Collin_Farrell.jpg','Colin Farrel');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_visit`
--

DROP TABLE IF EXISTS `actor_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actor_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) NOT NULL,
  `ipaddress_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `actor_visits_actor_id_ipaddress_id_b9eeabfb_uniq` (`actor_id`,`ipaddress_id`),
  KEY `actor_visit_ipaddress_id_fc24b42c_fk_ipAddress_idActor` (`ipaddress_id`),
  CONSTRAINT `actor_visit_actor_id_4d4a0c4c_fk_actor_idActor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`idactor`),
  CONSTRAINT `actor_visit_ipaddress_id_fc24b42c_fk_ipAddress_idActor` FOREIGN KEY (`ipaddress_id`) REFERENCES `ipaddress` (`idactor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_visit`
--

LOCK TABLES `actor_visit` WRITE;
/*!40000 ALTER TABLE `actor_visit` DISABLE KEYS */;
INSERT INTO `actor_visit` VALUES (3,8,13),(9,8,16),(20,17,13),(19,22,13);
/*!40000 ALTER TABLE `actor_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add actor',1,'add_actor'),(2,'Can change actor',1,'change_actor'),(3,'Can delete actor',1,'delete_actor'),(4,'Can view actor',1,'view_actor'),(5,'Can add director',2,'add_director'),(6,'Can change director',2,'change_director'),(7,'Can delete director',2,'delete_director'),(8,'Can view director',2,'view_director'),(9,'Can add genre',3,'add_genre'),(10,'Can change genre',3,'change_genre'),(11,'Can delete genre',3,'delete_genre'),(12,'Can view genre',3,'view_genre'),(13,'Can add images',4,'add_images'),(14,'Can change images',4,'change_images'),(15,'Can delete images',4,'delete_images'),(16,'Can view images',4,'view_images'),(17,'Can add mood',5,'add_mood'),(18,'Can change mood',5,'change_mood'),(19,'Can delete mood',5,'delete_mood'),(20,'Can view mood',5,'view_mood'),(21,'Can add movie',6,'add_movie'),(22,'Can change movie',6,'change_movie'),(23,'Can delete movie',6,'delete_movie'),(24,'Can view movie',6,'view_movie'),(25,'Can add log entry',7,'add_logentry'),(26,'Can change log entry',7,'change_logentry'),(27,'Can delete log entry',7,'delete_logentry'),(28,'Can view log entry',7,'view_logentry'),(29,'Can add permission',8,'add_permission'),(30,'Can change permission',8,'change_permission'),(31,'Can delete permission',8,'delete_permission'),(32,'Can view permission',8,'view_permission'),(33,'Can add group',9,'add_group'),(34,'Can change group',9,'change_group'),(35,'Can delete group',9,'delete_group'),(36,'Can view group',9,'view_group'),(37,'Can add user',10,'add_user'),(38,'Can change user',10,'change_user'),(39,'Can delete user',10,'delete_user'),(40,'Can view user',10,'view_user'),(41,'Can add content type',11,'add_contenttype'),(42,'Can change content type',11,'change_contenttype'),(43,'Can delete content type',11,'delete_contenttype'),(44,'Can view content type',11,'view_contenttype'),(45,'Can add session',12,'add_session'),(46,'Can change session',12,'change_session'),(47,'Can delete session',12,'delete_session'),(48,'Can view session',12,'view_session'),(49,'Can add review',13,'add_review'),(50,'Can change review',13,'change_review'),(51,'Can delete review',13,'delete_review'),(52,'Can view review',13,'view_review'),(53,'Can add rating movie',14,'add_ratingmovie'),(54,'Can change rating movie',14,'change_ratingmovie'),(55,'Can delete rating movie',14,'delete_ratingmovie'),(56,'Can view rating movie',14,'view_ratingmovie'),(57,'Can add review like',15,'add_reviewlike'),(58,'Can change review like',15,'change_reviewlike'),(59,'Can delete review like',15,'delete_reviewlike'),(60,'Can view review like',15,'view_reviewlike'),(61,'Can add user movie list',16,'add_usermovielist'),(62,'Can change user movie list',16,'change_usermovielist'),(63,'Can delete user movie list',16,'delete_usermovielist'),(64,'Can view user movie list',16,'view_usermovielist'),(65,'Can add user movie list comment',17,'add_usermovielistcomment'),(66,'Can change user movie list comment',17,'change_usermovielistcomment'),(67,'Can delete user movie list comment',17,'delete_usermovielistcomment'),(68,'Can view user movie list comment',17,'view_usermovielistcomment'),(69,'Can add user movie list like',18,'add_usermovielistlike'),(70,'Can change user movie list like',18,'change_usermovielistlike'),(71,'Can delete user movie list like',18,'delete_usermovielistlike'),(72,'Can view user movie list like',18,'view_usermovielistlike'),(73,'Can add custom user',10,'add_customuser'),(74,'Can change custom user',10,'change_customuser'),(75,'Can delete custom user',10,'delete_customuser'),(76,'Can view custom user',10,'view_customuser'),(77,'Can add ip address',20,'add_ipaddress'),(78,'Can change ip address',20,'change_ipaddress'),(79,'Can delete ip address',20,'delete_ipaddress'),(80,'Can view ip address',20,'view_ipaddress'),(81,'Can add feedback',21,'add_feedback'),(82,'Can change feedback',21,'change_feedback'),(83,'Can delete feedback',21,'delete_feedback'),(84,'Can view feedback',21,'view_feedback');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$120000$wPwaviWqgXCH$rJkRu2cNfJ1d2z7r0yBY4O7XMV2aR7kK3sHa/C1AnwE=','2019-02-18 05:13:01.793265',1,'moodvies','admin','moodvies','moodvies.supp@gmail.com',1,1,'2018-11-12 22:27:17.613155'),(34,'pbkdf2_sha256$120000$W2BRda89Fop8$okJ17rt2f2Ple6hU5usbuUk92o2mvt8POrZybTMnrqE=','2019-02-18 20:14:53.523724',0,'test','test','test','test@test.com',0,1,'2019-02-18 15:52:45.531770');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `search_field` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idDirector`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (2,'Christopher','Nolan','1970-07-30','Best known for his cerebral, often nonlinear, storytelling, acclaimed writer-director Christopher Nolan was born on July 30, 1970 in London, England. Over the course of 15 years of filmmaking, Nolan has gone from low-budget independent films to working on some of the biggest blockbusters ever made.','2018-11-17 22:06:08.023475','2019-02-18 04:45:53.698078','Christopher_Nolan.png','Christopher Nolan 1970'),(3,'Peter','Jackson','1961-10-31','Peter Jackson was born as an only child in a small coast-side town in New Zealand in 1961. When a friend of his parents bought him a super 8 movie camera (because she saw how much he enjoyed taking photos), the then eight-year-old Peter instantly grabbed the thing to start recording his own movies, which he made with his friends. They were usually short, but they already had the trademark that would make Jackson famous: impressive special effects, made at a very low cost. For example, for his film \"World War Two\" which he made as a teenager, he used to simulate a firing gun by punching little holes into the celluloid, so that, once projected, the gun gave the impression of displaying a small fire. Jackson\'s first step towards more serious film-making came with an entry in a local contest to stimulate amateur and children\'s films. For this film, he used stop-motion animation to create a monster that ruins a city in the style of Ray Harryhausen. Unfortunately, he didn\'t win. At twenty-tw','2018-11-20 16:18:45.152419','2019-02-18 04:44:42.198085','Peter_Jackson_X0j2qoS.png','Peter Jackson'),(8,'Steven','Stielberg','1943-12-08','One of the most influential personalities in the history of cinema, Steven Spielberg is Hollywood\'s best known director and one of the wealthiest filmmakers in the world. He has an extraordinary number of commercially successful and critically acclaimed credits to his name, either as a director, producer or writer.','2019-02-18 04:18:24.590286','2019-02-18 16:04:32.396649','Steven_Stielberg.png','Steven Stielberg 1943'),(9,'Richard','Linklater','1960-07-30','Self-taught writer-director Richard Stuart Linklater was born in Houston, Texas, to Diane Margaret (Krieger), who taught at a university, and Charles W. Linklater III. Richard was among the first and most successful talents to emerge during the American independent film renaissance of the 1990s.','2019-02-18 04:32:20.961164','2019-02-18 04:32:20.961164','Richard_Linklater-1.png','Richard Linklater'),(10,'Yorgos','Lanthimos','1973-05-27','Lanthimos was born in Athens. Having graduated from the Moraitis School, he went on to study directing for film and television at Hellenic Cinema and Television School Stavrakos [el] in Athens. Through the 1990s he directed a series of videos for Greek dance-theater companies. Since 1995 he has directed a large number of TV commercials, in addition to music videos, short films and experimental theater plays. He was also a member of the creative team which designed the opening and closing ceremonies of the 2004 Summer Olympics in Athens.','2019-02-18 04:38:57.935907','2019-02-18 04:40:54.371455','Yorgos_Lanthimos.png','Yorgos Lanthimos');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director_visit`
--

DROP TABLE IF EXISTS `director_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `director_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `director_id` int(11) NOT NULL,
  `ipaddress_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `director_visit_director_id_ipaddress_id_1e0f6456_uniq` (`director_id`,`ipaddress_id`),
  KEY `director_visit_ipaddress_id_64be51ac_fk_ipAddress_idActor` (`ipaddress_id`),
  CONSTRAINT `director_visit_director_id_ad3b0fc3_fk_director_idDirector` FOREIGN KEY (`director_id`) REFERENCES `director` (`iddirector`),
  CONSTRAINT `director_visit_ipaddress_id_64be51ac_fk_ipAddress_idActor` FOREIGN KEY (`ipaddress_id`) REFERENCES `ipaddress` (`idactor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director_visit`
--

LOCK TABLES `director_visit` WRITE;
/*!40000 ALTER TABLE `director_visit` DISABLE KEYS */;
INSERT INTO `director_visit` VALUES (1,2,13),(2,3,13),(8,8,13),(7,10,13);
/*!40000 ALTER TABLE `director_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-11-12 22:28:10.529213','1','12312',1,'[{\"added\": {}}]',3,1),(2,'2018-11-12 22:28:20.652451','1','12312 3123123 (2018-11-12)',1,'[{\"added\": {}}]',1,1),(3,'2018-11-12 22:28:56.779420','2','12312123 123 (2018-11-12)',1,'[{\"added\": {}}]',1,1),(4,'2018-11-13 02:18:13.657370','5','Johnny Depp (1982-06-05)',1,'[{\"added\": {}}]',1,1),(5,'2018-11-13 02:18:28.250435','4','45345 None (None)',3,'',1,1),(6,'2018-11-13 02:18:28.268425','3','45345 None (None)',3,'',1,1),(7,'2018-11-13 02:18:28.275420','2','12312123 123 (2018-11-12)',3,'',1,1),(8,'2018-11-13 02:18:28.279418','1','12312 3123123 (2018-11-12)',3,'',1,1),(9,'2018-11-13 02:18:50.340448','6','Brad Pit (1982-06-05)',1,'[{\"added\": {}}]',1,1),(10,'2018-11-13 02:19:01.719295','7','Angelina Jolie (2018-10-29)',1,'[{\"added\": {}}]',1,1),(11,'2018-11-13 02:19:12.722672','1','12312',3,'',3,1),(12,'2018-11-13 02:19:25.524311','2','Drama',1,'[{\"added\": {}}]',3,1),(13,'2018-11-13 02:19:30.705897','3','Crime',1,'[{\"added\": {}}]',3,1),(14,'2018-11-13 02:19:36.698194','4','Sci-Fi',1,'[{\"added\": {}}]',3,1),(15,'2018-11-13 02:19:46.335554','1','Sad',1,'[{\"added\": {}}]',5,1),(16,'2018-11-13 02:19:50.945931','2','Lonely',1,'[{\"added\": {}}]',5,1),(17,'2018-11-13 02:19:55.659641','3','Happy',1,'[{\"added\": {}}]',5,1),(18,'2018-11-13 02:22:26.260075','1','Director object (1)',1,'[{\"added\": {}}]',2,1),(19,'2018-11-13 02:22:31.964744','1','Images object (1)',1,'[{\"added\": {}}]',4,1),(20,'2018-11-13 02:22:33.614406','4','Lord of the Rings(1999)',1,'[{\"added\": {}}]',6,1),(21,'2018-11-13 03:04:11.706779','1','Lord of the Rings(1999)(123)',1,'[{\"added\": {}}]',13,1),(22,'2018-11-13 03:15:09.273103','2','Lord of the Rings(1999)(123)',1,'[{\"added\": {}}]',13,1),(23,'2018-11-13 03:25:45.920897','1','moodvies(Lord of the Rings(1999))10',1,'[{\"added\": {}}]',14,1),(24,'2018-11-13 03:50:57.841760','2','aaa',1,'[{\"added\": {}}]',10,1),(25,'2018-11-13 03:51:14.282456','2','aaa(Lord of the Rings(1999))8',1,'[{\"added\": {}}]',14,1),(26,'2018-11-13 16:27:30.848521','1','ReviewLike object (1)',1,'[{\"added\": {}}]',15,1),(27,'2018-11-13 16:37:37.537009','2','ReviewLike object (2)',1,'[{\"added\": {}}]',15,1),(28,'2018-11-13 16:37:50.407735','3','ReviewLike object (3)',1,'[{\"added\": {}}]',15,1),(29,'2018-11-13 16:38:17.671008','3','ReviewLike object (3)',3,'',15,1),(30,'2018-11-13 16:38:17.683989','2','ReviewLike object (2)',3,'',15,1),(31,'2018-11-13 16:38:17.686986','1','ReviewLike object (1)',3,'',15,1),(32,'2018-11-13 16:41:01.574602','4','Lord of the Rings(1999)(123)--aaa--True',1,'[{\"added\": {}}]',15,1),(33,'2018-11-13 16:41:27.732657','5','Lord of the Rings(1999)(123)--aaa--True',1,'[{\"added\": {}}]',15,1),(34,'2018-11-13 16:43:25.925038','6','Lord of the Rings(1999)(123)--moodvies--False',1,'[{\"added\": {}}]',15,1),(35,'2018-11-14 00:21:52.852336','1','moodvies--Lord--moodvies--True',1,'[{\"added\": {}}]',18,1),(36,'2018-11-14 00:29:51.638997','1','moodvies--Lord--2--rvdfsvfvfvd',1,'[{\"added\": {}}]',17,1),(37,'2018-11-14 00:31:20.228038','2','moodvies--Lord--2--adwadwa',1,'[{\"added\": {}}]',17,1),(38,'2018-11-17 22:05:05.852688','1','Kon Salopi      (2018-11-13)',3,'',2,1),(39,'2018-11-17 22:06:08.024473','2','Christopher Nolan      (1970-07-30)',1,'[{\"added\": {}}]',2,1),(40,'2018-11-17 22:07:03.127733','8','Christian Bale (1974-01-30)',1,'[{\"added\": {}}]',1,1),(41,'2018-11-17 22:08:59.061538','5','Action',1,'[{\"added\": {}}]',3,1),(42,'2018-11-17 22:09:38.707986','6','Drama',1,'[{\"added\": {}}]',3,1),(43,'2018-11-17 22:10:02.208456','5','The Dark Knight(2008)',1,'[{\"added\": {}}]',6,1),(44,'2018-11-19 21:44:58.337615','3','laloumpa',3,'',10,1),(45,'2018-11-19 21:44:58.442666','8','lolitas34',3,'',10,1),(46,'2018-11-19 21:45:58.966646','9','lolitas34',3,'',10,1),(47,'2018-11-19 21:46:19.678716','10','lolitas34',3,'',10,1),(48,'2018-11-19 21:47:05.258164','11','lolitas34',3,'',10,1),(49,'2018-11-20 01:55:18.783527','3','Lord of the Rings(1999)(Lord)',1,'[{\"added\": {}}]',13,1),(50,'2018-11-20 02:21:52.974317','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"actor\"]}}]',6,1),(51,'2018-11-20 02:54:25.818457','4','Lord of the Rings(1999)',2,'[{\"changed\": {\"fields\": [\"actor\", \"director\"]}}]',6,1),(52,'2018-11-20 13:56:52.438778','4','Lord of the Rings(1999)',2,'[{\"changed\": {\"fields\": [\"mood\"]}}]',6,1),(53,'2018-11-20 14:15:30.111844','4','Lord of the Rings(1999)',2,'[{\"changed\": {\"fields\": [\"trailer_url\"]}}]',6,1),(54,'2018-11-20 14:18:55.735522','4','Lord of the Rings(1999)',2,'[{\"changed\": {\"fields\": [\"trailer_url\"]}}]',6,1),(55,'2018-11-20 16:12:18.048421','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"title\", \"pub_year\", \"duration\", \"description\", \"imdb_score\"]}}]',6,1),(56,'2018-11-20 16:18:45.154410','3','Peter Jackson      (1961-10-31)',1,'[{\"added\": {}}]',2,1),(57,'2018-11-22 01:44:30.958776','3','Happy',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',5,1),(58,'2018-11-22 01:49:31.834215','3','Happy',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',5,1),(59,'2018-11-22 02:58:31.924477','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"mood\"]}}]',6,1),(60,'2018-11-22 02:58:52.609899','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"mood\"]}}]',6,1),(61,'2018-11-22 14:31:12.429160','4','Stoner',1,'[{\"added\": {}}]',5,1),(62,'2018-11-22 14:31:28.268294','5','Motivated',1,'[{\"added\": {}}]',5,1),(63,'2018-11-22 14:37:09.810213','6','Mysterious',1,'[{\"added\": {}}]',5,1),(64,'2018-11-22 15:00:12.170521','4','Lord of the Rings: The Fellowship of the Ring(2001)(dsssdsd)',1,'[{\"added\": {}}]',13,1),(65,'2018-11-22 20:38:54.442610','9','Natalie Portman (1981-06-09)',1,'[{\"added\": {}}]',1,1),(66,'2018-11-22 20:39:04.750659','6','Black Swan(2010)',1,'[{\"added\": {}}]',6,1),(67,'2018-11-22 21:11:09.863388','7','awdwadwa(23123)',1,'[{\"added\": {}}]',6,1),(68,'2018-11-22 21:11:23.347875','8','1231232(1312321)',1,'[{\"added\": {}}]',6,1),(69,'2018-11-22 21:11:34.508348','9','123213123(2131232)',1,'[{\"added\": {}}]',6,1),(70,'2018-11-24 15:36:01.756837','11','123123(123)',2,'[{\"changed\": {\"fields\": [\"images\"]}}]',6,1),(71,'2018-11-24 15:37:03.126127','11','123123(123)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(72,'2018-11-24 15:45:15.440063','11','123123(123)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(73,'2018-11-24 15:46:39.349884','11','123123(123)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(74,'2018-11-24 15:51:09.311132','11','123123(123)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(75,'2018-11-24 16:06:32.934713','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(76,'2018-11-24 16:18:33.625376','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(77,'2018-11-24 17:12:31.539792','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(78,'2018-11-24 17:24:23.433125','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"director\"]}}]',6,1),(79,'2018-11-24 17:49:09.320627','11','123123(123)',3,'',6,1),(80,'2018-11-24 17:49:09.332608','10','123(123)',3,'',6,1),(81,'2018-11-24 17:49:09.335606','9','123213123(2131232)',3,'',6,1),(82,'2018-11-24 17:49:09.338605','8','1231232(1312321)',3,'',6,1),(83,'2018-11-24 17:49:09.341603','7','awdwadwa(23123)',3,'',6,1),(84,'2018-11-24 17:49:34.507217','6','Black Swan(2010)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(85,'2018-11-24 17:51:45.384693','10','Mila Kunis (1983-08-14)',1,'[{\"added\": {}}]',1,1),(86,'2018-11-24 17:52:24.893275','11','Vincent Cassel (1966-11-23)',1,'[{\"added\": {}}]',1,1),(87,'2018-11-24 17:53:15.057752','12','Winona Ryder (1981-10-29)',1,'[{\"added\": {}}]',1,1),(88,'2018-11-24 17:54:08.564900','4','Darren Aronofsky      (1969-02-12)',1,'[{\"added\": {}}]',2,1),(89,'2018-11-24 17:54:16.662093','6','Black Swan(2010)',2,'[{\"changed\": {\"fields\": [\"actor\", \"director\"]}}]',6,1),(90,'2018-11-24 18:04:28.856277','1','Sad',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',5,1),(91,'2018-11-24 19:00:20.213785','1','Sad',2,'[{\"changed\": {\"fields\": [\"back_image\"]}}]',5,1),(92,'2018-11-24 19:12:44.486360','2','Lonely',2,'[{\"changed\": {\"fields\": [\"image\", \"back_image\"]}}]',5,1),(93,'2018-11-24 19:13:34.945607','2','Lonely',2,'[{\"changed\": {\"fields\": [\"back_image\"]}}]',5,1),(94,'2018-11-24 19:14:07.780191','2','Lonely',2,'[{\"changed\": {\"fields\": [\"back_image\"]}}]',5,1),(95,'2018-11-24 19:22:51.173750','3','Happy',2,'[{\"changed\": {\"fields\": [\"image\", \"back_image\"]}}]',5,1),(96,'2018-11-24 19:23:29.458566','3','Happy',2,'[{\"changed\": {\"fields\": [\"back_image\"]}}]',5,1),(97,'2018-11-24 19:25:26.778271','4','Stoner',2,'[{\"changed\": {\"fields\": [\"image\", \"back_image\"]}}]',5,1),(98,'2018-11-24 19:27:21.444080','5','Motivated',2,'[{\"changed\": {\"fields\": [\"image\", \"back_image\"]}}]',5,1),(99,'2018-11-24 19:29:40.731024','6','Mysterious',2,'[{\"changed\": {\"fields\": [\"image\", \"back_image\"]}}]',5,1),(100,'2018-11-24 19:39:13.537567','2','Lonely',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',5,1),(101,'2018-11-24 19:39:59.813231','1','Sad',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',5,1),(102,'2018-11-24 19:41:35.526385','2','Lonely',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',5,1),(103,'2018-11-24 19:43:22.867385','3','Happy',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',5,1),(104,'2018-11-26 14:56:29.256466','5','The Dark Knight3232322323 232322 2323232 232323(2008)',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',6,1),(105,'2018-11-26 15:21:43.820227','12','qwqwq(21121)',1,'[{\"added\": {}}]',6,1),(106,'2018-11-26 15:21:57.405477','12','qwqwq(21121)',2,'[{\"changed\": {\"fields\": [\"mood\"]}}]',6,1),(107,'2018-11-26 15:24:46.546724','13','wadawd(1323)',1,'[{\"added\": {}}]',6,1),(108,'2018-11-26 15:28:17.180667','13','Mahershala Ali (1974-02-16)',1,'[{\"added\": {}}]',1,1),(109,'2018-11-26 15:29:04.183113','14','Naomie Harris (1976-09-06)',1,'[{\"added\": {}}]',1,1),(110,'2018-11-26 15:29:51.024375','15','Trevante Rhodes (None)',1,'[{\"added\": {}}]',1,1),(111,'2018-11-26 15:30:21.795755','5','Barry Jenkins      (1979-11-19)',1,'[{\"added\": {}}]',2,1),(112,'2018-11-26 15:30:35.098746','14','Moonlight(2016)',1,'[{\"added\": {}}]',6,1),(113,'2018-11-26 15:31:08.184711','14','Moonlight(2016)',2,'[{\"changed\": {\"fields\": [\"mood\"]}}]',6,1),(114,'2018-11-26 15:38:43.647401','2','Lonely',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',5,1),(115,'2018-11-26 15:52:51.073470','15','123123(131)',1,'[{\"added\": {}}]',6,1),(116,'2018-11-26 16:19:44.693673','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"search_field\"]}}]',6,1),(117,'2018-11-26 17:57:26.008815','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"title\", \"search_field\"]}}]',6,1),(118,'2018-12-12 02:35:47.869462','3','moodvies--erfrfw',3,'',16,1),(119,'2018-12-12 02:35:47.885453','2','moodvies--12312',3,'',16,1),(120,'2018-12-12 02:35:47.892449','1','moodvies--Lord',3,'',16,1),(121,'2018-12-20 18:42:48.017393','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"imdb_score\"]}}]',6,1),(122,'2018-12-20 18:58:46.272384','15','123123(131)',3,'',6,1),(123,'2018-12-20 18:58:46.359337','13','wadawd(1323)',3,'',6,1),(124,'2018-12-20 18:58:46.363334','12','qwqwq(21121)',3,'',6,1),(125,'2018-12-20 19:02:17.776375','7','Adventure',1,'[{\"added\": {}}]',3,1),(126,'2018-12-20 19:03:31.987027','16','Leonardo DiCaprio (1974-11-11)',1,'[{\"added\": {}}]',1,1),(127,'2018-12-20 19:04:05.876448','17','Joseph Gordon-Levitt (1981-02-17)',1,'[{\"added\": {}}]',1,1),(128,'2018-12-20 19:04:37.968754','18','Ellen Page (1987-02-21)',1,'[{\"added\": {}}]',1,1),(129,'2018-12-20 19:05:19.196033','16','Inception(2010)',1,'[{\"added\": {}}]',6,1),(130,'2018-12-20 19:07:25.140842','6','Black Swan(2010)',2,'[{\"changed\": {\"fields\": [\"imdb_score\", \"search_field\"]}}]',6,1),(131,'2018-12-20 19:07:41.422443','14','Moonlight(2016)',2,'[{\"changed\": {\"fields\": [\"search_field\"]}}]',6,1),(132,'2018-12-20 19:08:16.145509','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"trailer_url\", \"search_field\"]}}]',6,1),(133,'2018-12-21 19:45:24.873163','17','The Lobster(2015)',1,'[{\"added\": {}}]',6,1),(134,'2018-12-21 19:45:57.180091','18','Lord(1321)',1,'[{\"added\": {}}]',6,1),(135,'2018-12-21 20:03:01.652428','9','moodvies--3242413423',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',16,1),(136,'2018-12-21 20:37:47.674245','7','ageladisiomeli(The Lobster(2015))10',1,'[{\"added\": {}}]',14,1),(137,'2018-12-29 18:47:47.654808','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"search_field\"]}}]',6,1),(138,'2018-12-30 01:50:09.560592','16','Inception(2010)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(139,'2018-12-30 02:00:05.069996','18','Lord(1321)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(140,'2018-12-30 02:00:09.089743','17','The Lobster(2015)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(141,'2018-12-30 02:00:12.786730','5','The Dark Knight(2008)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(142,'2018-12-30 02:00:16.930411','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(143,'2018-12-30 02:00:20.819276','14','Moonlight(2016)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(144,'2018-12-30 02:00:24.806070','6','Black Swan(2010)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(145,'2019-01-03 18:57:45.419137','18','Lord(1321)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(146,'2019-01-03 18:59:54.892894','18','Lord(1321)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(147,'2019-01-04 21:56:24.194789','7','Adventure',2,'[]',3,1),(148,'2019-01-10 21:28:25.286051','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"director\"]}}]',6,1),(149,'2019-01-30 15:19:58.445842','2','Drama',3,'',3,1),(150,'2019-01-30 16:03:39.686275','7','None ',3,'',20,1),(151,'2019-01-30 16:03:39.712260','6','None ',3,'',20,1),(152,'2019-01-30 16:03:39.715258','5','None ',3,'',20,1),(153,'2019-01-30 16:03:39.718257','4','None ',3,'',20,1),(154,'2019-01-30 16:03:39.721255','3','None ',3,'',20,1),(155,'2019-01-30 16:03:39.724253','2','None ',3,'',20,1),(156,'2019-01-30 16:03:39.728251','1','94.65.226.173 ',3,'',20,1),(157,'2019-01-30 16:04:26.273933','8','None ',3,'',20,1),(158,'2019-01-30 16:35:24.012109','10','None ',3,'',20,1),(159,'2019-01-30 16:35:24.063085','9','94.65.226.173 ',3,'',20,1),(160,'2019-01-30 16:36:07.954795','11','94.65.226.173 ',3,'',20,1),(161,'2019-01-30 16:36:31.703828','12','94.65.226.173 ',3,'',20,1),(162,'2019-01-30 21:28:31.848238','15','None ',3,'',20,1),(163,'2019-01-30 21:28:31.925196','14','None ',3,'',20,1),(164,'2019-02-01 03:25:34.102071','16','123231231231 ',1,'[{\"added\": {}}]',20,1),(165,'2019-02-01 03:25:56.172027','7','Angelina Jolie (2018-10-29)',2,'[{\"changed\": {\"fields\": [\"visit\"]}}]',1,1),(166,'2019-02-01 15:21:32.962074','7','Angelina Jolie (2019-02-01)',2,'[{\"changed\": {\"fields\": [\"date_of_birth\"]}}]',1,1),(167,'2019-02-05 02:02:24.129856','21','Lord of the Rings: The Fellowship of the Ring(2001)(ddddddddddddddddddddddddddddddddddddd)',3,'',13,1),(168,'2019-02-05 02:02:24.223785','17','Lord of the Rings: The Fellowship of the Ring(2001)(awdawdawdawdwawdawdawdawdwawdawdawdawdwawdawdawdawdwawdawdawdawdwaw)',3,'',13,1),(169,'2019-02-05 02:02:24.226784','16','Lord of the Rings: The Fellowship of the Ring(2001)(wdwdwdwdwdwdwdwdwdwdwdwdwdwdwdwd)',3,'',13,1),(170,'2019-02-05 04:23:55.262020','1','1',1,'[{\"added\": {}}]',21,1),(171,'2019-02-07 16:24:49.164588','18','Ellen Page (1987-02-21)',3,'',1,1),(172,'2019-02-09 15:57:43.081521','19','None None (2019-02-09)',2,'[{\"changed\": {\"fields\": [\"date_of_birth\"]}}]',1,1),(173,'2019-02-09 16:23:56.210566','19','123',2,'[{\"changed\": {\"fields\": [\"email\"]}}]',10,1),(174,'2019-02-17 22:28:00.353133','7','Angelina Jolie (2019-02-01)',2,'[]',1,1),(175,'2019-02-17 22:28:09.032985','7','Angelina Jolie (2019-02-01)',2,'[]',1,1),(176,'2019-02-17 22:49:46.652175','4','Darren Aronofsky      (1969-02-12)',2,'[{\"changed\": {\"fields\": [\"search_field\"]}}]',2,1),(177,'2019-02-17 23:59:24.099637','23','Lord of the Rings: The Fellowship of the Ring(2001)(wdawdawdawdw)',2,'[]',13,1),(178,'2019-02-18 00:00:00.369437','23','Lord of the Rings: The Fellowship of the Ring(2001)(wdawdawdawdw)',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',13,1),(179,'2019-02-18 03:32:38.266257','20','awdadawdd awdawdadaw (2019-02-18)',1,'[{\"added\": {}}]',1,1),(180,'2019-02-18 03:37:08.839611','18','Lord(1321)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(181,'2019-02-18 04:04:17.181000','1','Sad',2,'[{\"changed\": {\"fields\": [\"back_image\"]}}]',5,1),(182,'2019-02-18 04:05:53.050914','1','Sad',2,'[{\"changed\": {\"fields\": [\"description\", \"image\"]}}]',5,1),(183,'2019-02-18 04:06:58.558799','5','Motivated',2,'[{\"changed\": {\"fields\": [\"description\", \"image\", \"back_image\"]}}]',5,1),(184,'2019-02-18 04:08:25.599200','3','Cheerful',2,'[{\"changed\": {\"fields\": [\"mood\", \"description\", \"image\", \"back_image\"]}}]',5,1),(185,'2019-02-18 04:10:06.493727','4','Nostalgic',2,'[{\"changed\": {\"fields\": [\"mood\", \"description\", \"image\", \"back_image\"]}}]',5,1),(186,'2019-02-18 04:10:40.550542','6','Mysterious',2,'[{\"changed\": {\"fields\": [\"description\", \"image\", \"back_image\"]}}]',5,1),(187,'2019-02-18 04:11:06.415265','2','Lonely',3,'',5,1),(188,'2019-02-18 04:13:48.544542','8','Biographt',1,'[{\"added\": {}}]',3,1),(189,'2019-02-18 04:14:03.273737','9','Biography',1,'[{\"added\": {}}]',3,1),(190,'2019-02-18 04:14:09.847827','10','History',1,'[{\"added\": {}}]',3,1),(191,'2019-02-18 04:15:28.995188','21','Liam Neeson (1952-06-07)',1,'[{\"added\": {}}]',1,1),(192,'2019-02-18 04:18:24.596282','8','Steven Stielberg      (1943-12-08)',1,'[{\"added\": {}}]',2,1),(193,'2019-02-18 04:18:51.399451','19','Schindler\'s List(1993)',1,'[{\"added\": {}}]',6,1),(194,'2019-02-18 04:22:23.884529','16','Inception(2010)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(195,'2019-02-18 04:23:30.815841','11','Fantasy',1,'[{\"added\": {}}]',3,1),(196,'2019-02-18 04:25:07.240186','22','Elijah Wood (1981-01-28)',1,'[{\"added\": {}}]',1,1),(197,'2019-02-18 04:25:22.843645','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"mood\", \"genre\", \"actor\"]}}]',6,1),(198,'2019-02-18 04:25:41.139407','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(199,'2019-02-18 04:27:29.383007','22','Elijah Wood (1981-01-28)',2,'[{\"changed\": {\"fields\": [\"image\"]}}]',1,1),(200,'2019-02-18 04:29:36.080377','23','Ellar Coltrane (1994-08-27)',1,'[{\"added\": {}}]',1,1),(201,'2019-02-18 04:32:20.964160','9','Richard Linklater      (1960-07-30)',1,'[{\"added\": {}}]',2,1),(202,'2019-02-18 04:32:41.185070','20','Boyhood(2014)',1,'[{\"added\": {}}]',6,1),(203,'2019-02-18 04:35:07.968455','21','The Dark Knight(2008)',1,'[{\"added\": {}}]',6,1),(204,'2019-02-18 04:35:39.769597','5','The Dark Knight(2008)',3,'',6,1),(205,'2019-02-18 04:37:51.922038','24','Colin Farrel (1976-05-31)',1,'[{\"added\": {}}]',1,1),(206,'2019-02-18 04:38:00.850941','17','The Lobster(2015)',2,'[{\"changed\": {\"fields\": [\"logo\", \"mood\", \"genre\", \"actor\"]}}]',6,1),(207,'2019-02-18 04:38:57.938916','10','Yorgos Lanthimos      (1973-05-27)',1,'[{\"added\": {}}]',2,1),(208,'2019-02-18 04:39:04.193998','17','The Lobster(2015)',2,'[{\"changed\": {\"fields\": [\"actor\", \"director\"]}}]',6,1),(209,'2019-02-18 04:41:41.086015','20','Boyhood(2014)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(210,'2019-02-18 04:41:45.749857','19','Schindler\'s List(1993)',2,'[{\"changed\": {\"fields\": [\"recommended\"]}}]',6,1),(211,'2019-02-18 04:41:49.343189','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[]',6,1),(212,'2019-02-18 04:41:56.537059','14','Moonlight(2016)',3,'',6,1),(213,'2019-02-18 04:41:56.557052','6','Black Swan(2010)',3,'',6,1),(214,'2019-02-18 04:42:02.251350','18','Lord(1321)',3,'',6,1),(215,'2019-02-18 04:42:49.963103','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(216,'2019-02-18 04:44:16.968570','4','Lord of the Rings: The Fellowship of the Ring(2001)',2,'[{\"changed\": {\"fields\": [\"logo\"]}}]',6,1),(217,'2019-02-18 04:44:42.201092','3','Peter Jackson      (1961-10-31)',2,'[{\"changed\": {\"fields\": [\"image\", \"search_field\"]}}]',2,1),(218,'2019-02-18 04:45:53.700077','2','Christopher Nolan      (1970-07-30)',2,'[{\"changed\": {\"fields\": [\"description\", \"image\"]}}]',2,1),(219,'2019-02-18 04:46:13.310257','7','awdad awdadaw      (1992-04-24)',3,'',2,1),(220,'2019-02-18 04:46:13.331234','6','awdad awdadaw      (1992-04-24)',3,'',2,1),(221,'2019-02-18 04:46:13.334230','5','Barry Jenkins      (1979-11-19)',3,'',2,1),(222,'2019-02-18 04:46:13.337230','4','Darren Aronofsky      (1969-02-12)',3,'',2,1),(223,'2019-02-18 04:47:14.311573','20','Boyhood(2014)',2,'[{\"changed\": {\"fields\": [\"actor\"]}}]',6,1),(224,'2019-02-18 04:48:00.172112','16','Leonardo DiCaprio (1974-11-11)',2,'[{\"changed\": {\"fields\": [\"image\", \"search_field\"]}}]',1,1),(225,'2019-02-18 04:48:42.877578','17','Joseph Gordon-Levitt (1981-02-17)',2,'[{\"changed\": {\"fields\": [\"image\", \"search_field\"]}}]',1,1),(226,'2019-02-18 04:49:34.713467','8','Christian Bale (1974-01-30)',2,'[{\"changed\": {\"fields\": [\"description\", \"image\", \"search_field\"]}}]',1,1),(227,'2019-02-18 04:50:04.109013','20','awdadawdd awdawdadaw (2019-02-18)',3,'',1,1),(228,'2019-02-18 04:50:04.160012','19','None None (2019-02-09)',3,'',1,1),(229,'2019-02-18 04:50:04.163001','15','Trevante Rhodes (None)',3,'',1,1),(230,'2019-02-18 04:50:04.165998','14','Naomie Harris (1976-09-06)',3,'',1,1),(231,'2019-02-18 04:50:04.169011','13','Mahershala Ali (1974-02-16)',3,'',1,1),(232,'2019-02-18 04:50:04.170995','12','Winona Ryder (1981-10-29)',3,'',1,1),(233,'2019-02-18 04:50:04.173994','11','Vincent Cassel (1966-11-23)',3,'',1,1),(234,'2019-02-18 04:50:04.176992','10','Mila Kunis (1983-08-14)',3,'',1,1),(235,'2019-02-18 04:50:04.179992','9','Natalie Portman (1981-06-09)',3,'',1,1),(236,'2019-02-18 04:50:04.182989','7','Angelina Jolie (2019-02-01)',3,'',1,1),(237,'2019-02-18 04:50:04.185987','6','Brad Pit (1982-06-05)',3,'',1,1),(238,'2019-02-18 04:50:04.189985','5','Johnny Depp (2019-01-16)',3,'',1,1),(239,'2019-02-18 04:51:14.476760','19','123',3,'',10,1),(240,'2019-02-18 04:51:14.501746','6','213123',3,'',10,1),(241,'2019-02-18 04:51:14.504745','2','aaa',3,'',10,1),(242,'2019-02-18 04:51:14.507742','25','aaaaa',3,'',10,1),(243,'2019-02-18 04:51:14.510741','29','aaaaaaaa',3,'',10,1),(244,'2019-02-18 04:51:14.513739','26','aaadaawd',3,'',10,1),(245,'2019-02-18 04:51:14.516737','24','ageladisiomeli',3,'',10,1),(246,'2019-02-18 04:51:14.518736','33','ageladisiomelii',3,'',10,1),(247,'2019-02-18 04:51:14.521735','5','awd4',3,'',10,1),(248,'2019-02-18 04:51:14.524734','13','awdawdadwad',3,'',10,1),(249,'2019-02-18 04:51:14.527732','21','awdawdawd',3,'',10,1),(250,'2019-02-18 04:51:14.530729','17','awdwd',3,'',10,1),(251,'2019-02-18 04:51:14.533728','15','dwd',3,'',10,1),(252,'2019-02-18 04:51:14.536726','18','efsefes',3,'',10,1),(253,'2019-02-18 04:51:14.539724','7','hawdahaha',3,'',10,1),(254,'2019-02-18 04:51:14.543721','4','lakisdd',3,'',10,1),(255,'2019-02-18 04:51:14.546721','12','lolitas34',3,'',10,1),(256,'2019-02-18 04:51:14.549718','27','moodvies1',3,'',10,1),(257,'2019-02-18 04:51:14.552717','22','moodvies1132',3,'',10,1),(258,'2019-02-18 04:51:14.555715','28','moodvies2',3,'',10,1),(259,'2019-02-18 04:51:14.558714','32','olapopae',3,'',10,1),(260,'2019-02-18 04:51:14.561712','23','t8140093',3,'',10,1),(261,'2019-02-18 04:51:14.564709','20','t81400931',3,'',10,1),(262,'2019-02-18 04:51:14.567707','30','t81400934',3,'',10,1),(263,'2019-02-18 04:51:14.570706','14','t8140093@dias.aueb.gr',3,'',10,1),(264,'2019-02-18 04:51:14.573705','31','t8140095',3,'',10,1),(265,'2019-02-18 04:51:14.577702','16','wadawdaw',3,'',10,1),(266,'2019-02-18 04:56:21.492189','26','Lord of the Rings: The Fellowship of the Ring(2001)(Amazing story)',2,'[{\"changed\": {\"fields\": [\"title\", \"content\"]}}]',13,1),(267,'2019-02-18 05:13:15.743868','36','moodvies--dadadadadadadadadadadadadad',3,'',16,1),(268,'2019-02-18 05:13:15.781845','35','moodvies--wdawdawd',3,'',16,1),(269,'2019-02-18 05:13:15.787842','32','moodvies--qsdQSDDAWDAWDAW',3,'',16,1),(270,'2019-02-18 05:13:15.790849','28','moodvies--console.logconsole.logconsole.l',3,'',16,1),(271,'2019-02-18 05:14:17.955413','29','moodvies--3 good movies',2,'[{\"changed\": {\"fields\": [\"title\", \"description\", \"movies\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'admin','logentry'),(9,'auth','group'),(8,'auth','permission'),(10,'auth','user'),(11,'contenttypes','contenttype'),(1,'mdvapp','actor'),(19,'mdvapp','customuser'),(2,'mdvapp','director'),(21,'mdvapp','feedback'),(3,'mdvapp','genre'),(4,'mdvapp','images'),(20,'mdvapp','ipaddress'),(5,'mdvapp','mood'),(6,'mdvapp','movie'),(14,'mdvapp','ratingmovie'),(13,'mdvapp','review'),(15,'mdvapp','reviewlike'),(16,'mdvapp','usermovielist'),(17,'mdvapp','usermovielistcomment'),(18,'mdvapp','usermovielistlike'),(12,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-11-12 22:25:47.153206'),(2,'auth','0001_initial','2018-11-12 22:25:47.758857'),(3,'admin','0001_initial','2018-11-12 22:25:47.920764'),(4,'admin','0002_logentry_remove_auto_add','2018-11-12 22:25:47.931757'),(5,'admin','0003_logentry_add_action_flag_choices','2018-11-12 22:25:47.943751'),(6,'contenttypes','0002_remove_content_type_name','2018-11-12 22:25:48.053688'),(7,'auth','0002_alter_permission_name_max_length','2018-11-12 22:25:48.115652'),(8,'auth','0003_alter_user_email_max_length','2018-11-12 22:25:48.187610'),(9,'auth','0004_alter_user_username_opts','2018-11-12 22:25:48.197604'),(10,'auth','0005_alter_user_last_login_null','2018-11-12 22:25:48.298550'),(11,'auth','0006_require_contenttypes_0002','2018-11-12 22:25:48.303544'),(12,'auth','0007_alter_validators_add_error_messages','2018-11-12 22:25:48.313553'),(13,'auth','0008_alter_user_username_max_length','2018-11-12 22:25:48.380511'),(14,'auth','0009_alter_user_last_name_max_length','2018-11-12 22:25:48.451460'),(15,'mdvapp','0001_initial','2018-11-12 22:25:49.460876'),(16,'sessions','0001_initial','2018-11-12 22:25:49.499853'),(17,'mdvapp','0002_auto_20181113_0421','2018-11-13 02:21:12.138005'),(18,'mdvapp','0003_review','2018-11-13 03:01:05.578543'),(19,'mdvapp','0004_auto_20181113_0524','2018-11-13 03:24:42.997731'),(20,'mdvapp','0005_auto_20181113_0525','2018-11-13 03:25:09.397312'),(21,'mdvapp','0006_reviewlike','2018-11-13 16:27:14.458970'),(22,'mdvapp','0007_auto_20181113_1839','2018-11-13 16:39:33.330633'),(23,'mdvapp','0008_auto_20181114_0200','2018-11-14 00:00:42.761571'),(24,'mdvapp','0009_auto_20181114_0230','2018-11-14 00:31:03.866584'),(25,'mdvapp','0010_auto_20181122_0344','2018-11-22 01:44:12.673236'),(26,'mdvapp','0011_auto_20181124_1723','2018-11-24 15:23:31.129848'),(27,'mdvapp','0012_mood_image','2018-11-24 18:01:39.629048'),(28,'mdvapp','0013_mood_back_image','2018-11-24 18:59:45.188910'),(29,'mdvapp','0014_customuser','2018-11-26 02:44:34.648173'),(30,'mdvapp','0015_movie_search_field','2018-11-26 16:17:28.827081'),(31,'mdvapp','0016_movie_recommended','2018-12-30 01:48:33.806239'),(32,'mdvapp','0017_auto_20190128_1326','2019-01-28 11:26:42.916886'),(33,'mdvapp','0018_auto_20190130_1719','2019-01-30 15:20:56.275358'),(34,'mdvapp','0019_auto_20190130_1735','2019-01-30 15:35:30.526935'),(35,'mdvapp','0020_auto_20190130_1754','2019-01-30 15:54:34.533188'),(36,'mdvapp','0021_auto_20190130_2326','2019-01-30 21:26:31.577957'),(37,'mdvapp','0022_auto_20190130_2328','2019-01-30 21:28:55.678526'),(38,'mdvapp','0023_auto_20190130_2329','2019-01-30 21:29:56.542314'),(39,'mdvapp','0024_auto_20190130_2342','2019-01-30 21:42:21.109902'),(40,'mdvapp','0025_actor_search_field','2019-02-01 13:47:08.052463'),(41,'mdvapp','0026_auto_20190204_2343','2019-02-05 02:02:34.240658'),(42,'mdvapp','0027_auto_20190205_0403','2019-02-05 02:03:39.922289'),(45,'mdvapp','0028_feedback','2019-02-05 04:22:59.217786'),(46,'mdvapp','0029_auto_20190205_0623','2019-02-05 04:23:46.746829'),(47,'mdvapp','0030_feedback_email','2019-02-05 04:33:22.050590'),(48,'mdvapp','0031_director_search_field','2019-02-06 16:25:02.654764'),(49,'mdvapp','0032_director_visit','2019-02-06 17:03:20.486990'),(50,'mdvapp','0033_auto_20190206_1913','2019-02-06 17:13:37.771304'),(51,'mdvapp','0034_auto_20190207_1823','2019-02-07 16:23:40.669593'),(52,'mdvapp','0035_auto_20190207_2240','2019-02-07 20:41:02.769138'),(53,'mdvapp','0036_auto_20190218_0539','2019-02-18 03:39:50.948626');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0eott4g4zsmvj6y4congj9zku8oyibxl','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-18 21:28:50.824213'),('1jldryq94mcjstkf40dt9rzm4mjgf2r3','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-18 17:03:01.360852'),('1z9pqs0rwlerjykph56e4kn4respnxyu','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-04 19:42:45.958407'),('2axk6cmfl5q35u1f3ebza13rrp4yakpy','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-02-15 03:25:25.098842'),('6g9ykwyt3kl5u2vsnl9j9qs06qijhn4r','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-02-23 15:36:24.209852'),('6ml5m1dyva1qy5i78t30zhow079nzeyn','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-17 18:57:34.269729'),('6rqe1zn9n7fxy4ldx3fn2u9jt81pb3jq','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-03-03 22:27:21.287245'),('8qtc8y377wse4ps3499jo3jscaxro7k1','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-02-19 02:01:25.204701'),('bguxa2fn0i6dgyvfowa8zu7olt0ckl9j','MThiOTQzN2Y5ZGM2ZjIyNGQ0YTk2NTE4ZjY5NmQyNTA2NTlkNWJlYzp7Il9hdXRoX3VzZXJfaWQiOiIyNSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNmZlNTE2YTg4ZGM0NGRkYTRlZDQ4NDE0NmVlNTEyNGY3YjgyYjNiZiJ9','2019-02-07 18:50:41.674536'),('ee5t1dqf38b8ja428mtdf8o9hsg1xvvv','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-12 05:03:14.605087'),('ex3f50gl1dinoy5os0pv98voygfsse81','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-03 18:42:28.652645'),('j00bjf1la9jx9rwx0qyoyoxn3nns6agu','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-13 01:49:53.123425'),('pppvd7xd68gd795eb2kbf5w4jteb357v','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-12 18:18:14.893961'),('rnkuvlc4gr2cru6ijzd66j1zgtaz9e2l','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-24 21:28:15.705867'),('t6fdmcd65tvrol0roy9d79fl896btf5m','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-01-23 14:33:03.373756'),('v424brrchbp6bjmxqtqrbw6gx1vvi7b9','ZjRkNGQ4OTZmMTFjMTE0YTM5MDlkZmU3YmY1NWE5MmE1ZWZiYjliODp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNGI5N2ZjNDljMGEyMmVkZWM5M2IxNTUxZjI5ZmRmMWM2NWMwNDNjNyJ9','2019-03-04 20:14:53.527719'),('vxro8khx4yzruoio7igaggxpptcvn10l','MTNlOTBmMWJiNTU5Njc3NTIyZTkyNWU1NzQ4MzkxMWQ4NmVhMGZlYTp7Il9hdXRoX3VzZXJfaWQiOiIyNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWYzOGFjZGYzZTBjNGNkMjdhYmQyZmE2MmNiNWU2YjU1M2MzYjIzYiJ9','2018-12-10 02:49:47.531081'),('wnn3feigo6cbluftnzuoxsdfs28amrq0','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2018-12-09 01:59:55.960825'),('wrr3658fzll04bsjpfjadme8qcz90n12','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2019-02-05 02:27:36.455646'),('x09qxq0fibqw9v5ye9wj5sc3zvpi1eve','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2018-12-26 02:35:37.815229'),('xmob9bc4s81sbmy4agzft8cfqwukes1p','OTU5YWViYzQyYTg0NjI0YTkzYzczNDJkYTQ3YzYxMGY2NWMxOGMwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkZTNiMzMxMTc1MTBlNjAwMDQxZDI2NTgyOWZhZDQ2ZjRkNTEyZDFjIn0=','2018-12-10 14:56:17.220962');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedback` (
  `idFeedback` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `ip_address_id` int(11) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`idFeedback`),
  KEY `feedback_ip_address_id_7c17e7bf_fk_ipAddress_idActor` (`ip_address_id`),
  CONSTRAINT `feedback_ip_address_id_7c17e7bf_fk_ipAddress_idActor` FOREIGN KEY (`ip_address_id`) REFERENCES `ipaddress` (`idactor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'wdadawd',NULL,NULL),(2,'wadawd',NULL,''),(3,'wadawdawdawd',NULL,''),(4,'wadawdawdawd',NULL,''),(5,'awdawd',NULL,''),(6,'thanospak@gmail.com',NULL,'thanospak@gmail.com'),(7,'thanospak@gmail.com',NULL,'thanospak@gmail.com'),(8,'awdawdawd',NULL,'adwad@dwad.kl'),(9,'awdawdawd',NULL,'adwad@dwad.kl'),(10,'awdawdwa',13,'dawdaw@dadwadw.lk'),(11,'awdaw',13,'wdawd@awdwdw.com');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `genre` (
  `idGenre` int(11) NOT NULL AUTO_INCREMENT,
  `genre` varchar(50) DEFAULT NULL,
  `descriptionGenre` varchar(1000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`idGenre`),
  UNIQUE KEY `genre_genre_de76fbcc_uniq` (`genre`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (3,'Crime',NULL,'2018-11-13 02:19:30.704899','2018-11-13 02:19:30.704899'),(4,'Sci-Fi',NULL,'2018-11-13 02:19:36.697202','2018-11-13 02:19:36.697202'),(5,'Action','Action film is a film genre in which the protagonist or protagonists are thrust into a series of challenges that typically include violence, extended fighting, physical feats, and frantic chases.','2018-11-17 22:08:59.060550','2018-11-17 22:08:59.060550'),(6,'Drama','drama is a genre of narrative fiction (or semi-fiction) intended to be more serious than humorous in tone.[1] Drama of this kind is usually qualified with additional terms that specify its particular subgenre, such as \"police crime drama\", \"political drama\", \"legal drama\", \"historical period drama\", \"domestic drama\", or \"comedy-drama\". These terms tend to indicate a particular setting or subject-matter, or else they qualify the otherwise serious tone of a drama with elements that encourage a broader range of moods.','2018-11-17 22:09:38.706969','2018-11-17 22:09:38.706969'),(7,'Adventure','Adventure films are a genre of film that typically use their action scenes to display and explore exotic locations in an energetic way.','2018-12-20 19:02:17.776375','2019-01-04 21:56:24.183795'),(8,'Biographt',NULL,'2019-02-18 04:13:48.543561','2019-02-18 04:13:48.543561'),(9,'Biography',NULL,'2019-02-18 04:14:03.267734','2019-02-18 04:14:03.267734'),(10,'History',NULL,'2019-02-18 04:14:09.844819','2019-02-18 04:14:09.844819'),(11,'Fantasy',NULL,'2019-02-18 04:23:30.812854','2019-02-18 04:23:30.812854');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipaddress`
--

DROP TABLE IF EXISTS `ipaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ipaddress` (
  `idActor` int(11) NOT NULL AUTO_INCREMENT,
  `nameActor` varchar(45) NOT NULL,
  PRIMARY KEY (`idActor`),
  UNIQUE KEY `ipAddress_nameActor_0aaa5cfb_uniq` (`nameActor`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipaddress`
--

LOCK TABLES `ipaddress` WRITE;
/*!40000 ALTER TABLE `ipaddress` DISABLE KEYS */;
INSERT INTO `ipaddress` VALUES (16,'123231231231'),(13,'94.65.226.173');
/*!40000 ALTER TABLE `ipaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mood`
--

DROP TABLE IF EXISTS `mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mood` (
  `idMood` int(11) NOT NULL AUTO_INCREMENT,
  `mood` varchar(45) DEFAULT NULL,
  `descriptionMood` varchar(400) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `back_image` varchar(100) NOT NULL,
  PRIMARY KEY (`idMood`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mood`
--

LOCK TABLES `mood` WRITE;
/*!40000 ALTER TABLE `mood` DISABLE KEYS */;
INSERT INTO `mood` VALUES (1,'Sad','Sad mood describes a movie in which the plot makes you feel pain for some or many characters. Most of the movies\'s genre here is drama and it is a not recommended mood choice if you want to keep your vibe high.','2018-11-13 02:19:46.334554','2019-02-18 04:05:53.048930','sad-logo.png','tear.png'),(3,'Cheerful','This mood describes a movie that is bright and pleasant. Movies having that mood usually makes you feel very positive and happy.','2018-11-13 02:19:55.658635','2019-02-18 04:08:25.597200','happy_mood.png','happy.png'),(4,'Nostalgic','Nostalgia is a sentimentality for the past, typically for a period or place with happy personal associations.  In the sense of mood, nostalgic mood makes you feel good about the past and more poetically removes the rough edges of the good old days. This mood is externalized from movies showing an older era of people like the 70s or 80s people or even depicts the experiences and the emotions of you','2018-11-22 14:31:12.419175','2019-02-18 04:10:06.491727','nost.png','nost-BACK_XaTsy7b.png'),(5,'Motivated','This movie mood makes you feel motivated about a specific goal you want to set in your life. Here, you can find movies which their main plot is about how a human being can overcome unbelievable obstacles that stand in from of his/her dream.','2018-11-22 14:31:28.267294','2019-02-18 04:06:58.556787','motivated_logo.jpg','motivated.png'),(6,'Mysterious','Mysterious is the mood you when you are experiencing an uncertainty  about what is gonna happen in the plot. Furthermore, it can be the feeling you get when you have no idea of the actual plot and the director is slowly giving you clues. Your task is to put all the clues together and figure out what is going on or what the secrete message of this movie is.','2018-11-22 14:37:09.809208','2019-02-18 04:10:40.547543','Mysterious_Logo.jpg','mysterious.png');
/*!40000 ALTER TABLE `mood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie` (
  `idMovie` int(11) NOT NULL AUTO_INCREMENT,
  `titleMovie` varchar(100) NOT NULL,
  `pub_yearMovie` int(11) NOT NULL,
  `durationMovie` int(11) NOT NULL,
  `descriptionMovie` varchar(2000) NOT NULL,
  `countryMovie` varchar(50) NOT NULL,
  `trailer_urlMovie` varchar(200) DEFAULT NULL,
  `logo` varchar(100) NOT NULL,
  `imdb_scoreMovie` double DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `search_field` varchar(1000) NOT NULL,
  `recommended` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMovie`),
  KEY `movie_user_id_e2770f75_fk_auth_user_id` (`user_id`),
  CONSTRAINT `movie_user_id_e2770f75_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (4,'Lord of the Rings: The Fellowship of the Ring',2001,178,'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.','U.S.A.','V75dMMIW2B4','lord-of-the-rings-fellowship-of-the-ring-maxi-poster-1.143_QYYND8u_uqpAnDO.jpg',8.8,'2018-11-13 02:22:33.576424','2019-02-18 15:36:26.329597',1,'lord of the rings 2001',1),(16,'Inception',2010,148,'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a CEO.','U.S.A.','8hP9D6kZseM','inception_DLe9ttF.jpg',8.8,'2018-12-20 19:05:19.183040','2019-02-18 16:04:54.258166',1,'Inception 2010 Inception2010',1),(17,'The Lobster',2015,119,'In a dystopian near future, single people, according to the laws of The City, are taken to The Hotel, where they are obliged to find a romantic partner in forty-five days or are transformed into beasts and sent off into The Woods.','Greece','z069ldsumxA','The_Lobster.jpg',7.1,'2018-12-21 19:45:24.825193','2019-02-18 04:47:27.629708',1,'The Lobster 2015',1),(19,'Schindler\'s List',1993,195,'The true story of Oscar Sindler, a German industrialist, who saved 1,300 Jews from the Warsaw ghetto, presenting them as skilled workers required for the Third Reich.','USA','gG22XNhtnoY','schindler_s_font.png',8.9,'2019-02-18 04:18:51.384448','2019-02-18 15:56:33.477419',1,'Schindler\'s List 1993',1),(20,'Boyhood',2014,165,'The life of Mason, from early childhood to his arrival at college.','USA','IiDztHS3Wos','Boyhood.jpg',7.9,'2019-02-18 04:32:41.172075','2019-02-18 16:05:03.027279',1,'Boyhood 2014',1),(21,'The Dark Knight',2008,152,'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham. The Dark Knight must accept one of the greatest psychological and physical tests of his ability to fight injustice.','USA','EXeTwQWrcwY','51YbLNGpkpL._SY445_.jpg',9,'2019-02-18 04:35:07.956471','2019-02-18 05:04:42.924774',1,'The Dark Knight',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_actor`
--

DROP TABLE IF EXISTS `movie_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_actor_movie_id_actor_id_e6fb7d95_uniq` (`movie_id`,`actor_id`),
  KEY `movie_actor_actor_id_515518df_fk_actor_idActor` (`actor_id`),
  CONSTRAINT `movie_actor_actor_id_515518df_fk_actor_idActor` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`idactor`),
  CONSTRAINT `movie_actor_movie_id_53955e3e_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` VALUES (39,4,22),(29,16,16),(30,16,17),(42,17,24),(38,19,21),(43,20,23),(41,21,8);
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_director_movie_id_director_id_6292d7be_uniq` (`movie_id`,`director_id`),
  KEY `movie_director_director_id_acced7b2_fk_director_idDirector` (`director_id`),
  CONSTRAINT `movie_director_director_id_acced7b2_fk_director_idDirector` FOREIGN KEY (`director_id`) REFERENCES `director` (`iddirector`),
  CONSTRAINT `movie_director_movie_id_68dc6ff5_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (10,4,3),(18,16,2),(25,17,10),(22,19,8),(23,20,9),(24,21,2);
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_genre_movie_id_genre_id_c86037e3_uniq` (`movie_id`,`genre_id`),
  KEY `movie_genre_genre_id_37135080_fk_genre_idGenre` (`genre_id`),
  CONSTRAINT `movie_genre_genre_id_37135080_fk_genre_idGenre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`idgenre`),
  CONSTRAINT `movie_genre_movie_id_d5c7c115_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (34,4,6),(35,4,7),(33,4,11),(23,16,4),(24,16,5),(25,16,7),(27,17,4),(28,17,5),(40,17,6),(32,19,6),(30,19,9),(31,19,10),(36,20,6),(37,21,3),(38,21,5),(39,21,6);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_mood`
--

DROP TABLE IF EXISTS `movie_mood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_mood` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `mood_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_mood_movie_id_mood_id_f8a45615_uniq` (`movie_id`,`mood_id`),
  KEY `movie_mood_mood_id_aca5b13a_fk_mood_idMood` (`mood_id`),
  CONSTRAINT `movie_mood_mood_id_aca5b13a_fk_mood_idMood` FOREIGN KEY (`mood_id`) REFERENCES `mood` (`idmood`),
  CONSTRAINT `movie_mood_movie_id_03133b30_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_mood`
--

LOCK TABLES `movie_mood` WRITE;
/*!40000 ALTER TABLE `movie_mood` DISABLE KEYS */;
INSERT INTO `movie_mood` VALUES (6,4,3),(32,4,5),(26,16,5),(27,16,6),(35,17,1),(28,17,6),(30,19,1),(31,19,5),(33,20,4),(34,21,5);
/*!40000 ALTER TABLE `movie_mood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_visit`
--

DROP TABLE IF EXISTS `movie_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `movie_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `ipaddress_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `movie_visit_movie_id_ipaddress_id_1039aa24_uniq` (`movie_id`,`ipaddress_id`),
  KEY `movie_visit_ipaddress_id_cef5f509_fk_ipAddress_idActor` (`ipaddress_id`),
  CONSTRAINT `movie_visit_ipaddress_id_cef5f509_fk_ipAddress_idActor` FOREIGN KEY (`ipaddress_id`) REFERENCES `ipaddress` (`idactor`),
  CONSTRAINT `movie_visit_movie_id_d43a5597_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_visit`
--

LOCK TABLES `movie_visit` WRITE;
/*!40000 ALTER TABLE `movie_visit` DISABLE KEYS */;
INSERT INTO `movie_visit` VALUES (5,4,13),(4,16,13),(10,17,13),(9,19,13),(11,20,13),(12,21,13);
/*!40000 ALTER TABLE `movie_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratingmovie`
--

DROP TABLE IF EXISTS `ratingmovie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ratingmovie` (
  `idRating` int(11) NOT NULL AUTO_INCREMENT,
  `rating` int(11) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idRating`),
  UNIQUE KEY `ratingMovie_user_id_movie_id_5beaa748_uniq` (`user_id`,`movie_id`),
  KEY `ratingMovie_movie_id_b8940908_fk_movie_idMovie` (`movie_id`),
  CONSTRAINT `ratingMovie_movie_id_b8940908_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`),
  CONSTRAINT `ratingMovie_user_id_40497106_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratingmovie`
--

LOCK TABLES `ratingmovie` WRITE;
/*!40000 ALTER TABLE `ratingmovie` DISABLE KEYS */;
INSERT INTO `ratingmovie` VALUES (1,10,'2018-11-13 03:25:45.914881','2018-11-13 03:25:45.914881',4,1),(8,9,'2018-12-29 03:57:39.227448','2018-12-29 03:57:39.227448',17,1),(9,10,'2018-12-29 03:58:44.826829','2018-12-29 03:58:44.826829',16,1),(12,8,'2019-02-18 04:54:44.848856','2019-02-18 04:54:44.848856',19,1),(13,7,'2019-02-18 15:56:21.878948','2019-02-18 15:56:21.878948',16,34),(14,6,'2019-02-18 16:05:08.797000','2019-02-18 16:05:08.797000',20,1);
/*!40000 ALTER TABLE `ratingmovie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `idReview` int(11) NOT NULL AUTO_INCREMENT,
  `titleReview` varchar(50) NOT NULL,
  `contentReview` varchar(4000) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idReview`),
  KEY `review_movie_id_ab825372_fk_movie_idMovie` (`movie_id`),
  KEY `review_user_id_1520d914_fk_auth_user_id` (`user_id`),
  CONSTRAINT `review_movie_id_ab825372_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`),
  CONSTRAINT `review_user_id_1520d914_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (26,'Amazing story','I really liked the story in this movie. Besides that the actors are feeling it and if you are focused enough you can live in this world for a while.','2019-02-18 03:17:50.150021','2019-02-18 04:56:21.485179',4,1),(27,'Nice movie but','It was an overall nice movie but i didn\'t quite understand the end of the story and I really don\'t like not understanding the end of a movie. 7 from me.','2019-02-18 15:57:36.864886','2019-02-18 15:57:36.864886',16,34);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviewlike`
--

DROP TABLE IF EXISTS `reviewlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reviewlike` (
  `idReviewLike` int(11) NOT NULL AUTO_INCREMENT,
  `like` tinyint(1) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idReviewLike`),
  UNIQUE KEY `mdvapp_reviewlike_user_id_review_id_de57f142_uniq` (`user_id`,`review_id`),
  KEY `mdvapp_reviewlike_review_id_cf24fd94_fk_review_idReview` (`review_id`),
  CONSTRAINT `mdvapp_reviewlike_review_id_cf24fd94_fk_review_idReview` FOREIGN KEY (`review_id`) REFERENCES `review` (`idreview`),
  CONSTRAINT `mdvapp_reviewlike_user_id_9d11b6d5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviewlike`
--

LOCK TABLES `reviewlike` WRITE;
/*!40000 ALTER TABLE `reviewlike` DISABLE KEYS */;
INSERT INTO `reviewlike` VALUES (211,1,'2019-02-18 04:56:38.474503','2019-02-18 04:56:38.474503',26,1),(212,1,'2019-02-18 15:57:39.405548','2019-02-18 15:57:39.405548',27,34),(213,0,'2019-02-18 16:02:48.929734','2019-02-18 16:02:48.929734',27,1);
/*!40000 ALTER TABLE `reviewlike` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermovielist`
--

DROP TABLE IF EXISTS `usermovielist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usermovielist` (
  `idUserMovieList` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idUserMovieList`),
  KEY `userMovieList_user_id_811e1098_fk_auth_user_id` (`user_id`),
  CONSTRAINT `userMovieList_user_id_811e1098_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermovielist`
--

LOCK TABLES `usermovielist` WRITE;
/*!40000 ALTER TABLE `usermovielist` DISABLE KEYS */;
INSERT INTO `usermovielist` VALUES (29,'3 good movies','Didn\'t spend much time to combine these movies. They are all just amazing and this list just have to exist!','2019-02-09 03:42:22.204538','2019-02-18 05:14:17.949405',1);
/*!40000 ALTER TABLE `usermovielist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermovielist_movies`
--

DROP TABLE IF EXISTS `usermovielist_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usermovielist_movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usermovielist_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userMovieList_movies_usermovielist_id_movie_id_cdb4637a_uniq` (`usermovielist_id`,`movie_id`),
  KEY `userMovieList_movies_movie_id_151f2f60_fk_movie_idMovie` (`movie_id`),
  CONSTRAINT `userMovieList_movies_movie_id_151f2f60_fk_movie_idMovie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`idmovie`),
  CONSTRAINT `userMovieList_movies_usermovielist_id_161cbacc_fk_userMovie` FOREIGN KEY (`usermovielist_id`) REFERENCES `usermovielist` (`idusermovielist`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermovielist_movies`
--

LOCK TABLES `usermovielist_movies` WRITE;
/*!40000 ALTER TABLE `usermovielist_movies` DISABLE KEYS */;
INSERT INTO `usermovielist_movies` VALUES (79,29,16),(80,29,17),(81,29,19);
/*!40000 ALTER TABLE `usermovielist_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermovielistcomment`
--

DROP TABLE IF EXISTS `usermovielistcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usermovielistcomment` (
  `idUserMovieListComment` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(500) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `userMovieList_id` int(11) NOT NULL,
  PRIMARY KEY (`idUserMovieListComment`),
  KEY `userMovieListComment_userMovieList_id_db2d4634_fk_userMovie` (`userMovieList_id`),
  KEY `userMovieListComment_user_id_8293851d` (`user_id`),
  CONSTRAINT `userMovieListComment_userMovieList_id_db2d4634_fk_userMovie` FOREIGN KEY (`userMovieList_id`) REFERENCES `usermovielist` (`idusermovielist`),
  CONSTRAINT `userMovieListComment_user_id_8293851d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermovielistcomment`
--

LOCK TABLES `usermovielistcomment` WRITE;
/*!40000 ALTER TABLE `usermovielistcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermovielistcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usermovielistlike`
--

DROP TABLE IF EXISTS `usermovielistlike`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usermovielistlike` (
  `idUserMovieListLike` int(11) NOT NULL AUTO_INCREMENT,
  `like` tinyint(1) NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `modified` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `userMovieList_id` int(11) NOT NULL,
  PRIMARY KEY (`idUserMovieListLike`),
  UNIQUE KEY `userMovieListLike_user_id_userMovieList_id_b611d4ba_uniq` (`user_id`,`userMovieList_id`),
  KEY `userMovieListLike_userMovieList_id_12d87907_fk_userMovie` (`userMovieList_id`),
  CONSTRAINT `userMovieListLike_userMovieList_id_12d87907_fk_userMovie` FOREIGN KEY (`userMovieList_id`) REFERENCES `usermovielist` (`idusermovielist`),
  CONSTRAINT `userMovieListLike_user_id_2ee1edab_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usermovielistlike`
--

LOCK TABLES `usermovielistlike` WRITE;
/*!40000 ALTER TABLE `usermovielistlike` DISABLE KEYS */;
/*!40000 ALTER TABLE `usermovielistlike` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-18 22:18:22
