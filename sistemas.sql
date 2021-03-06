CREATE DATABASE  IF NOT EXISTS `sistemas` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci */;
USE `sistemas`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 192.168.5.3    Database: sistemas
-- ------------------------------------------------------
-- Server version	5.5.24-log

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
-- Table structure for table `audit`
--

DROP TABLE IF EXISTS `audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `operation` enum('update','delete','replace') COLLATE latin1_spanish_ci DEFAULT NULL,
  `date_pre` text COLLATE latin1_spanish_ci,
  `date_new` text COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit`
--

LOCK TABLES `audit` WRITE;
/*!40000 ALTER TABLE `audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_attempt`
--

DROP TABLE IF EXISTS `login_attempt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ip_index` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempt`
--

LOCK TABLES `login_attempt` WRITE;
/*!40000 ALTER TABLE `login_attempt` DISABLE KEYS */;
INSERT INTO `login_attempt` VALUES (1,'127.0.0.1'),(2,'127.0.0.1'),(3,'127.0.0.1');
/*!40000 ALTER TABLE `login_attempt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `url_id` int(11) NOT NULL,
  `name` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `icon_class` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`url_id`),
  KEY `fk_menu_url1` (`url_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Mapa',0,'icon-question-sign'),(2,'Mapa Insertar',1,''),(13,'Mapa Crear',1,''),(14,'Cantv',0,'icon-phone'),(15,'Cantv Consultar',14,''),(16,'Cantv Report',14,''),(3,'Mapa Modificar',1,''),(18,'Usuarios',0,'icon-adjust'),(20,'Añadir',18,''),(19,'Gestión',18,''),(17,'Sistema',0,'icon-desktop'),(29,'Gestionar',30,''),(30,'Usuario',0,'icon-user'),(31,'crear',30,'');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `system_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`) USING BTREE,
  KEY `fk_role_system1` (`system_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'transcriptor',1),(2,'consultor',1),(3,'consultor',2),(4,'administrador',2),(5,'consultor',3),(6,'administrador',3),(7,'casa',0),(13,'nuevo',10),(12,'Administrador',4),(14,'Administrador',11);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_url`
--

DROP TABLE IF EXISTS `role_has_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_url` (
  `role_id` int(11) NOT NULL,
  `url_id` int(11) NOT NULL,
  `operations` set('C','R','U','D') COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`role_id`,`url_id`),
  KEY `fk_role_has_url_url1` (`url_id`),
  KEY `fk_role_has_url_role_idx` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_url`
--

LOCK TABLES `role_has_url` WRITE;
/*!40000 ALTER TABLE `role_has_url` DISABLE KEYS */;
INSERT INTO `role_has_url` VALUES (14,29,''),(14,31,''),(14,30,''),(3,4,''),(4,4,''),(4,5,''),(4,6,''),(5,8,''),(6,7,''),(6,9,''),(6,8,''),(12,17,''),(12,18,''),(12,19,''),(12,20,'');
/*!40000 ALTER TABLE `role_has_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL,
  `alias` varchar(6) COLLATE latin1_spanish_ci DEFAULT NULL,
  `url` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `path` varchar(120) COLLATE latin1_spanish_ci DEFAULT NULL,
  `logo` varchar(120) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'Sistema de Herramientas para Actualización','sha','actualizacion.infoguia.com/','C:\\www\\actualizacion\\',NULL),(2,'Sistema de Registro y Control de Contratos','srcc','contratos.infoguia.net/','C:\\www\\contratos\\',''),(3,'Sistema de Administracion de Contacto a Empresas','sace','contactos.infoguia.net/','C.\\www\\contacto\\',NULL),(4,'Administracion de cuentas y sistemas','adsi','http:\\\\actualizacion.infoguia','C:\\wamp\\www\\login.com\\',''),(5,'Sistema','sis','http://cualquiercosa2','C://cualquiercosa2',NULL),(9,'Sistema de control','sisco','http://controles.com','C:\\miCarpeta\\miarchivo.mp3\\','icon-asterisk'),(10,'Otro sistema de prueba','otro','http://otroSistema.com','C:\\otrosistema\\micarpeta\\','icon-adjust'),(11,'Administrador de Usuarios','adsu','http://localhost/adus_v1/','C:\\wamp\\','icon-user');
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_change`
--

DROP TABLE IF EXISTS `system_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_change` (
  `id` int(11) NOT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_change`
--

LOCK TABLES `system_change` WRITE;
/*!40000 ALTER TABLE `system_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `url`
--

DROP TABLE IF EXISTS `url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url` (
  `url_id` int(11) NOT NULL AUTO_INCREMENT,
  `system_id` int(11) NOT NULL,
  `url` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  `is_menu` tinyint(1) DEFAULT '0',
  `operations` set('C','R','U','D') COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`url_id`,`system_id`) USING BTREE,
  KEY `fk_url_system1` (`system_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `url`
--

LOCK TABLES `url` WRITE;
/*!40000 ALTER TABLE `url` DISABLE KEYS */;
INSERT INTO `url` VALUES (1,1,'mapa/',1,'C,U'),(2,1,'mapa/insertar',1,''),(3,1,'mapa/modificar',1,''),(4,2,'contrato/nuevo',1,''),(5,2,'contrato/modificar',1,''),(6,2,'contrato/eliminar',1,''),(7,3,'contacto/email',1,''),(8,3,'contacto/estatus',1,''),(9,3,'contacto/desactivar',1,''),(13,1,'mapa/crear',1,''),(14,1,'cantv/',1,''),(15,1,'cantv/consultar',1,''),(16,1,'cantv/reporte',1,''),(17,4,'sistema/all',1,''),(18,4,'user/',1,'C,R,U,D'),(19,4,'user/all',1,'C,R,U,D'),(20,4,'user/add',1,'C,R,U,D'),(21,0,'campo/',0,'C,R,U,D'),(22,0,'campo//',0,'R'),(23,0,'casa/',0,'R'),(24,0,'casss',1,'R'),(25,0,'casa/s',0,'R'),(26,0,'rerwe453',0,'C'),(28,4,'user/ajax',0,'C,R,U,D'),(29,11,'user/all',1,'C,R,U,D'),(30,11,'user/',1,'C,R,U,D'),(31,11,'user/create',1,'C,R,U,D');
/*!40000 ALTER TABLE `url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `last_name` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `login` varchar(15) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `password_s` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `sex` enum('Femenino','Masculino') COLLATE latin1_spanish_ci DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `specialization` enum('usuario','vendedor') COLLATE latin1_spanish_ci DEFAULT NULL,
  `status` enum('ACTIVE','DISABLED','UNVALIDATED','REMOVED') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'UNVALIDATED',
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=81 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Jhoynerk Caraballo',NULL,'jhoynerk',NULL,NULL,'programador1@infoguia.net','Masculino',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(2,'Joseph Huizi',NULL,'joseph','260e41d3f9b21ef28432bfba437544fc3ee6ba32',NULL,'programador2@infoguia.net','Masculino',NULL,'usuario','ACTIVE','0000-00-00 00:00:00'),(3,'Daniel Castillo',NULL,'daniel',NULL,NULL,'coordinador@infoguia.net','Masculino',NULL,'vendedor','ACTIVE','0000-00-00 00:00:00'),(15,'Jhoynerk','Caraballo','jhoynerk2','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',NULL,'jhoy@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(16,'jhoynerk','caraballo','jhoynerk1','7f03f3f2febc46f3fa832d98251b0c98f64bc19b',NULL,'jhoyn@gmail.com','Femenino',NULL,'usuario','ACTIVE','0000-00-00 00:00:00'),(17,'jhoynerk','caraballo','jhoynerk3','7f03f3f2febc46f3fa832d98251b0c98f64bc19b',NULL,'jhoyn@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(18,'jhoynerk','caraballo','jhoynerk4','7f03f3f2febc46f3fa832d98251b0c98f64bc19b',NULL,'jhoyn@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(19,'jhoynerk','caraballo','JohnSmith','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(20,'jhoynerk','caraballo','JohnSmith1','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(21,'jhoynerk','caraballo','JohnSmith2','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(22,'jhoynerk','caraballo','JohnSmith3','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(23,'jhoynerk','caraballo','342131','7110eda4d09e062aa5e4a390b0a572ac0d2c0220',NULL,'jtdw@fma.com','',NULL,'usuario','REMOVED','0000-00-00 00:00:00'),(33,'jhoynerk','caraballo','programador1','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(34,'jhoynerk','caraballo','programador2','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','Masculino','0000-00-00','usuario','ACTIVE','0000-00-00 00:00:00'),(35,'jhoynerk','caraballo','programador3','40bd001563085fc35165329ea1ff5c5ecbdbbeef',NULL,'jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(36,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(37,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(38,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(39,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(40,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(41,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','ACTIVE','0000-00-00 00:00:00'),(42,'Jhoynerk Renee','Caraballo Hernandez','Jhoynerk','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','REMOVED','0000-00-00 00:00:00'),(43,'Jhoynerk','Caraballo','Jhoynerk21','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','0000-00-00','usuario','ACTIVE','0000-00-00 00:00:00'),(44,'Jhoynerk','Caraballo','Jhoynerk222','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoynerk@gmail.com','Masculino','2013-10-01','usuario','REMOVED','0000-00-00 00:00:00'),(45,'prueba','prueba','Prueba1','20eabe5d64b0e216796e834f52d61fd0b70332fc','1234567','prueba1@gmail.com','Masculino','2013-08-10','usuario','ACTIVE','0000-00-00 00:00:00'),(46,'prueba','prueba','Prueba2','20eabe5d64b0e216796e834f52d61fd0b70332fc','1234567','prueba2@gmail.com','Masculino','2013-08-10','usuario','REMOVED','0000-00-00 00:00:00'),(47,'prueba','prueba','Prueba3','20eabe5d64b0e216796e834f52d61fd0b70332fc','1234567','prueba3@gmail.com','Masculino','2013-08-10','usuario','ACTIVE','0000-00-00 00:00:00'),(48,'usuario','master','usuario1','20eabe5d64b0e216796e834f52d61fd0b70332fc','1234567','master@gmail.com','Masculino','1970-01-01','usuario','ACTIVE','2013-10-16 15:59:06'),(49,'jhon','smith','Johnmith','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhoydn@gmail.com','Masculino','1980-09-10','usuario','ACTIVE','2013-10-16 16:07:50'),(50,'yiuo','yuio','adasda','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','yuio@yuio.me','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:08:38'),(51,'yiuo','yuio','adasda1','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','yui1o@yuio.me','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:08:54'),(52,'yiuo','yuio','adasd1','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','yui2o@yuio.me','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:14:05'),(53,'yiuo','yuio','adas21','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','y2ui2o@yuio.me','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:15:13'),(54,'yiuo','yuio','ad221','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','y2u2o@yuio.me','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:17:23'),(55,'dasdasd','dsadasd','Joh2nSmith','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhsdf@gasdwda.dsa','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:17:58'),(56,'fsfsfs','fsdf','programad','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','fsdfs@fdsf.com','Masculino','2013-10-10','usuario','ACTIVE','2013-10-16 16:19:12'),(57,'dasda','dsada','32131231','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','dasda@dsa.com','Masculino','2013-04-10','usuario','ACTIVE','2013-10-16 16:20:15'),(58,'hgas','gfda','wqeweqw','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','aSA@DSAD.com','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 16:25:50'),(59,'adsdsa','eaew','asdada2','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','eqwe@dfsdas.com','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 17:20:44'),(60,'sdfsd','asddsf','JoSmith','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','asda@gmail.com','Masculino','2013-10-10','usuario','ACTIVE','2013-10-16 17:21:57'),(61,'sdfsd','asddsf','JoSmidsth','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','asda@gail.com','Masculino','2013-10-10','usuario','ACTIVE','2013-10-16 17:31:23'),(62,'sdfsd','asddsf','JoSmidst','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','ada@gail.com','Masculino','2013-10-10','usuario','ACTIVE','2013-10-16 17:33:16'),(63,'sadsda','dasdad','adsds','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','sdada@sdad.com','Masculino','2013-01-10','usuario','ACTIVE','2013-10-16 17:36:49'),(64,'adasdsa','dasdas','JohSmith','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','sdad@dsd.com','Masculino','2013-10-10','usuario','ACTIVE','2013-10-16 17:40:29'),(65,'sadasds','asda','dasdas12','f10e2821bbbea527ea02200352313bc059445190','asd','dsad@dsad.com','Masculino','2013-02-10','usuario','ACTIVE','2013-10-16 17:41:07'),(66,'jhoynerk','caraballo','jhoynerk234','cdb9178d20cae5345c38e9be14d3410a1e8597cd','caraballo','jhoynerck@gmail.com','Masculino','2013-02-10','usuario','ACTIVE','2013-10-16 17:49:38'),(67,'jhoynerk','caraballo','jhoynerk2321','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','jhon@gmaol.com','Masculino','2013-09-10','usuario','ACTIVE','2013-10-16 17:52:37'),(68,'asdfghj','asdfghjk','jhoynerksdfg','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','asdfgh@asdf.co','Masculino','2013-03-10','usuario','ACTIVE','2013-10-16 17:57:16'),(69,'asdfghj','asdfghjk','jhoynerw','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','asdfwgh@asdf.co','Masculino','2013-03-10','usuario','ACTIVE','2013-10-16 18:06:14'),(70,'asdasd','asdasw','12ewqe','29cae740561f02efef4d05aa51f4a02ddf2366fd','wqe','asda@sds.com','Masculino','2013-01-10','usuario','ACTIVE','2013-10-16 18:09:55'),(71,'dsad','dsad','dasd2','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','wwwww@gas.com','Masculino','2013-01-10','usuario','ACTIVE','2013-10-16 18:11:35'),(72,'sdfg','sdfgh','123453sdfs','f10e2821bbbea527ea02200352313bc059445190','asd','dfg@sdd.com','Masculino','2013-01-10','usuario','ACTIVE','2013-10-16 18:14:42'),(73,'adss','dasdsa','dwqdwq','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','sda@sada.com','Masculino','2013-01-10','usuario','ACTIVE','2013-10-16 18:20:55'),(74,'fghfhdfh','fhfhffgs','kjhgfds','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','1234','hjyone@hjdhd.com','Masculino','2013-02-10','usuario','ACTIVE','2013-10-16 18:23:53'),(75,'sdsada','dasdsa','jhoyneqw','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','1234','jhoyner@dsads.com','Masculino','2013-02-10','usuario','REMOVED','2013-10-16 18:29:11'),(76,'sdsada','dasdsa','jhoyne2','7110eda4d09e062aa5e4a390b0a572ac0d2c0220','1234','jhoyner@dads.com','Masculino','2013-02-10','usuario','ACTIVE','2013-10-16 18:29:44'),(77,'asdfgh','asdd','sdasdsa','b4914600112ba18af7798b6c1a1363728ae1d96f','sad','sdasd@das.com','Masculino','2013-02-10','usuario','ACTIVE','2013-10-17 18:49:15'),(78,'jhoynerk','caraballo','jhoynerk12','40bd001563085fc35165329ea1ff5c5ecbdbbeef','123','adsad@gotm.com','Masculino','1970-01-01','usuario','ACTIVE','2013-10-23 19:37:23'),(79,'jhoynerk','caraballo','jhoynerk13','5f6955d227a320c7f1f6c7da2a6d96a851a8118f','321','a2dsad@gotm.com','Masculino','1970-01-01','usuario','ACTIVE','2013-10-23 19:39:01'),(80,'jhoynerk','caraballo','jhoynerk122','8cb2237d0679ca88db6464eac60da96345513964','12345','ad2sad@gotm.com','Masculino','0000-00-00','usuario','ACTIVE','2013-10-23 20:00:41');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_role`
--

DROP TABLE IF EXISTS `user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_role`
--

LOCK TABLES `user_has_role` WRITE;
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
INSERT INTO `user_has_role` VALUES (0,1),(1,1),(2,2),(2,5),(3,1),(3,4),(3,6),(41,1),(41,4),(41,12),(41,13),(42,1),(42,4),(42,12),(42,13),(43,1),(43,4),(43,12),(43,13),(44,5),(44,12),(44,13),(44,14),(47,1),(47,3),(47,14),(50,1),(51,1),(52,1),(53,1),(54,1),(78,1),(79,1),(80,1);
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-23 16:44:43
