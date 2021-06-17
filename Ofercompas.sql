-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnueabihf (armv8l)
--
-- Host: localhost    Database: Ofercompas
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

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
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `Categoria_categoria_uindex` (`categoria`),
  UNIQUE KEY `Categoria_idCategoria_uindex` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Categoria`
--

/*!40000 ALTER TABLE `Categoria` DISABLE KEYS */;
INSERT INTO `Categoria` VALUES (7,'COMIDA_BEBIDA'),(8,'ENTRETENIMIENTO'),(4,'HOGAR'),(5,'MASCOTAS'),(3,'MODA_HOMBRE'),(2,'MODA_MUJER'),(1,'TECNOLOGIA'),(6,'VIAJE');
/*!40000 ALTER TABLE `Categoria` ENABLE KEYS */;

--
-- Table structure for table `CodigoDescuento`
--

DROP TABLE IF EXISTS `CodigoDescuento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CodigoDescuento` (
  `idPublicacion` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  PRIMARY KEY (`idPublicacion`),
  CONSTRAINT `CodigoDescuento_Publicacion_idPublicacion_fk` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CodigoDescuento`
--

/*!40000 ALTER TABLE `CodigoDescuento` DISABLE KEYS */;
INSERT INTO `CodigoDescuento` VALUES (111,'10-AÑOS-COCA'),(112,'5-AÑOS-UBER'),(115,'FELIZ-CUMPLEAÑOS-100'),(134,'5-AÑOS-UBER'),(135,'5-AÑOS-UBER'),(136,'5-AÑOS-UBER'),(137,'5-AÑOS-UBER');
/*!40000 ALTER TABLE `CodigoDescuento` ENABLE KEYS */;

--
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comentario` (
  `idMiembro` int(11) DEFAULT NULL,
  `idPublicacion` int(11) DEFAULT NULL,
  `contenido` varchar(200) NOT NULL,
  KEY `Comentario_Miembro_idMiembro_fk` (`idMiembro`),
  KEY `Comentario_Oferta_idOferta_fk` (`idPublicacion`),
  CONSTRAINT `Comentario_Miembro_idMiembro_fk` FOREIGN KEY (`idMiembro`) REFERENCES `MiembroOfercompas` (`idMiembro`),
  CONSTRAINT `Comentario_Oferta_idOferta_fk` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comentario`
--

/*!40000 ALTER TABLE `Comentario` DISABLE KEYS */;
INSERT INTO `Comentario` VALUES (7,98,'erwerwerw'),(7,98,'Muy buena oferta'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,98,'Excelente aporte!'),(7,114,'Muy rico se be'),(26,104,'Medio feos los tenis la verdad'),(26,101,'Muy buena grafica'),(7,111,'Mal codigo'),(7,101,'Se me quemó');
/*!40000 ALTER TABLE `Comentario` ENABLE KEYS */;

--
-- Table structure for table `Denuncia`
--

DROP TABLE IF EXISTS `Denuncia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Denuncia` (
  `idMiembro` int(11) NOT NULL,
  `idPublicacion` int(11) NOT NULL,
  `comentario` varchar(100) DEFAULT NULL,
  `motivo` tinyint(11) NOT NULL,
  KEY `Denuncia_Miembro_idMiembro_fk` (`idMiembro`),
  KEY `Denuncia_Oferta_idOferta_fk` (`idPublicacion`),
  KEY `Denuncia_Motivo_idMotivo_fk` (`motivo`),
  CONSTRAINT `Denuncia_Miembro_idMiembro_fk` FOREIGN KEY (`idMiembro`) REFERENCES `MiembroOfercompas` (`idMiembro`),
  CONSTRAINT `Denuncia_Motivo_idMotivo_fk` FOREIGN KEY (`motivo`) REFERENCES `Motivo` (`idMotivo`),
  CONSTRAINT `Denuncia_Oferta_idOferta_fk` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Denuncia`
--

/*!40000 ALTER TABLE `Denuncia` DISABLE KEYS */;
INSERT INTO `Denuncia` VALUES (7,98,'Está chipeada, es no es legal',9),(27,103,'huelen feo',5),(27,104,'apestan no me quedaron',5),(27,98,'no sirvió, es cucho',5),(7,105,'Re feos los cacles',9),(7,103,'me los puse y me salieron hongos',5),(7,114,'Comida en mal estado',5),(7,115,'Muuuuy malaaaa',5),(7,106,'No sirven para jugar basquet',5);
/*!40000 ALTER TABLE `Denuncia` ENABLE KEYS */;

--
-- Table structure for table `EstadoMiembro`
--

DROP TABLE IF EXISTS `EstadoMiembro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoMiembro` (
  `idEstado` tinyint(4) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idEstado`),
  UNIQUE KEY `EstadoMiembro_estado_uindex` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoMiembro`
--

/*!40000 ALTER TABLE `EstadoMiembro` DISABLE KEYS */;
INSERT INTO `EstadoMiembro` VALUES (1,'activo'),(3,'eliminado'),(2,'expulsado');
/*!40000 ALTER TABLE `EstadoMiembro` ENABLE KEYS */;

--
-- Table structure for table `EstadoPublicacion`
--

DROP TABLE IF EXISTS `EstadoPublicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoPublicacion` (
  `idEstado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) NOT NULL,
  PRIMARY KEY (`idEstado`),
  UNIQUE KEY `EstadoPublicacion_estado_uindex` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EstadoPublicacion`
--

/*!40000 ALTER TABLE `EstadoPublicacion` DISABLE KEYS */;
INSERT INTO `EstadoPublicacion` VALUES (1,'ACTIVA'),(4,'ELIMINADA'),(3,'PROHIBIDA'),(2,'TERMINADA');
/*!40000 ALTER TABLE `EstadoPublicacion` ENABLE KEYS */;

--
-- Table structure for table `MiembroOfercompas`
--

DROP TABLE IF EXISTS `MiembroOfercompas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MiembroOfercompas` (
  `idMiembro` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(320) NOT NULL,
  `contrasenia` varchar(40) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1,
  `tipoMiembro` tinyint(4) NOT NULL DEFAULT 1,
  `nickname` varchar(20) NOT NULL,
  `publicacionesDenunciadas` int(11) DEFAULT 0,
  `publicacionesProhibidas` int(11) DEFAULT 0,
  PRIMARY KEY (`idMiembro`),
  UNIQUE KEY `Usuario_email_uindex` (`email`),
  UNIQUE KEY `Usuario_nickname_uindex` (`nickname`),
  UNIQUE KEY `Miembro_idMiembro_uindex` (`idMiembro`),
  KEY `Miembro_EstadoMiembro_idEstado_fk` (`estado`),
  KEY `Miembro_TipoMiembro_idTipo_fk` (`tipoMiembro`),
  CONSTRAINT `Miembro_EstadoMiembro_idEstado_fk` FOREIGN KEY (`estado`) REFERENCES `EstadoMiembro` (`idEstado`),
  CONSTRAINT `Miembro_TipoMiembro_idTipo_fk` FOREIGN KEY (`tipoMiembro`) REFERENCES `TipoMiembro` (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MiembroOfercompas`
--

/*!40000 ALTER TABLE `MiembroOfercompas` DISABLE KEYS */;
INSERT INTO `MiembroOfercompas` VALUES (7,'hola@gmail.com','z6SEIOxnHpiPm1aT5kKtUw==',1,2,'HolaEditado',0,0),(24,'moderador@gmail.com','2FM3kO2CQerbYQiJjEaNZA==',1,2,'GeraModerador',0,0),(25,'e@gmail.com','2FM3kO2CQerbYQiJjEaNZA==',2,1,'ElEfraGood',0,0),(26,'moderador2@gmail.com','FJqVe7m7g7n4Qq/gnfD0Jw==',1,2,'Elmoderador',0,0),(27,'lampro@gmail.com','mzgl7U1EIsqHsql5SeMHqg==',1,1,'lampropeltis',0,0),(28,'pepito@gmail.com','minecraft',1,1,'PepitoGamerPro',0,0),(29,'pepita@gmail.com','minecraft',1,1,'PepitaGamerPro',0,0),(30,'gera@gmail.com','2FM3kO2CQerbYQiJjEaNZA==',1,1,'Elgera',0,0);
/*!40000 ALTER TABLE `MiembroOfercompas` ENABLE KEYS */;

--
-- Table structure for table `Motivo`
--

DROP TABLE IF EXISTS `Motivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Motivo` (
  `idMotivo` tinyint(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(20) NOT NULL,
  PRIMARY KEY (`idMotivo`),
  UNIQUE KEY `Motivo_motivo_uindex` (`motivo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Motivo`
--

/*!40000 ALTER TABLE `Motivo` DISABLE KEYS */;
INSERT INTO `Motivo` VALUES (7,'AlcoholTabaco'),(4,'Animales'),(2,'Armas'),(1,'Drogas'),(5,'Fraude'),(10,'LinkCaído'),(8,'Ofensivo'),(9,'Piratería'),(3,'Pornografía'),(6,'Spam');
/*!40000 ALTER TABLE `Motivo` ENABLE KEYS */;

--
-- Table structure for table `Multimedia`
--

DROP TABLE IF EXISTS `Multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Multimedia` (
  `idOferta` int(11) NOT NULL,
  `ruta` varchar(200) NOT NULL,
  `tipo` varchar(5) NOT NULL,
  PRIMARY KEY (`ruta`),
  UNIQUE KEY `Multimedia_ruta_uindex` (`ruta`),
  KEY `Multimedia_Oferta_idOferta_fk` (`idOferta`),
  CONSTRAINT `Multimedia_Oferta_idOferta_fk` FOREIGN KEY (`idOferta`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Multimedia`
--

/*!40000 ALTER TABLE `Multimedia` DISABLE KEYS */;
INSERT INTO `Multimedia` VALUES (101,'101-  81aQTxxcCJL._AC_SL1500_.jpg','foto'),(102,'102-  D_NQ_NP_2X_916669-MLM45584436850_042021-F.png','foto'),(103,'103-  tenisAz.png','foto'),(104,'104-  tenisGris.png','foto'),(105,'105-  tenisNaranj.png','foto'),(106,'106-  tenisnike.png','foto'),(107,'107-  HTC.png','foto'),(108,'108-  H2.png','foto'),(109,'109-  escoba.png','foto'),(110,'110-il_794xN.2872673777_dbt7.jpg','foto'),(114,'114-  breakfast_t750x550.jpg','foto'),(114,'114-  videoplayback.mp4','video'),(98,'98-  Borr@cho explicando porque no debes dejar de estudiar __ Shitpost Corto.mp4','video'),(98,'98-  il_794xN.2872673777_dbt7.jpg','foto'),(98,'98-  videoplayback.mp4','video'),(98,'98-bob cholo.jpg','foto');
/*!40000 ALTER TABLE `Multimedia` ENABLE KEYS */;

--
-- Table structure for table `Oferta`
--

DROP TABLE IF EXISTS `Oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Oferta` (
  `idPublicacion` int(11) NOT NULL,
  `precio` float NOT NULL,
  `vinculo` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`idPublicacion`),
  CONSTRAINT `Oferta_Publicacion_idPublicacion_fk` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Oferta`
--

/*!40000 ALTER TABLE `Oferta` DISABLE KEYS */;
INSERT INTO `Oferta` VALUES (98,10000,'https://www.walmart.com.mx/videojuegos/playstation-5/consolas-ps5/consola-playstation-5-825-gb_00071171954176?gclid=CjwKCAjw_JuGBhBkEiwA1xmbRU8n9cpb2-IoPJI_Fm-QDnBTwHpEJdjzq_dvEsI5MII99WyYcmUQERoCbbkQAvD_BwE'),(99,18000,'https://www.amazon.com.mx/gp/product/B06ZZ6FMF8?pf_rd_r=TZC76GG0A87YSWWXYX5W&pf_rd_p=e785ae9e-2ad6-4898-9405-402e0de2c911&pd_rd_r=d9b4f081-e9c4-4397-b107-5913ca37b2f6&pd_rd_w=5yfL4&pd_rd_wg=mlKEf&ref_=pd_gw_unk'),(100,18000,'https://www.amazon.com.mx/gp/product/B06ZZ6FMF8?pf_rd_r=TZC76GG0A87YSWWXYX5W&pf_rd_p=e785ae9e-2ad6-4898-9405-402e0de2c911&pd_rd_r=d9b4f081-e9c4-4397-b107-5913ca37b2f6&pd_rd_w=5yfL4&pd_rd_wg=mlKEf&ref_=pd_gw_unk'),(101,14000,'https://www.amazon.com.mx/gp/product/B06ZZ6FMF8?pf_rd_r=TZC76GG0A87YSWWXYX5W&pf_rd_p=e785ae9e-2ad6-4898-9405-402e0de2c911&pd_rd_r=d9b4f081-e9c4-4397-b107-5913ca37b2f6&pd_rd_w=5yfL4&pd_rd_wg=mlKEf&ref_=pd_gw_unk'),(102,500,'https://articulo.mercadolibre.com.mx/MLM-804530411-tenis-para-hombre-nike-court-vision-low-_JM#reco_item_pos=1&reco_backend=machinalis-homes-pdp-boos&reco_backend_type=function&reco_client=home_navigation-recommendations&reco_id=1904db8f-aafc-40d7-8a4f-99bbcdf8d22c&c_id=/home/navigation-recommendations/element&c_element_order=2&c_uid=e70c7694-1266-414c-87dc-7efcd1a84f8f'),(103,2000,'https://articulo.mercadolibre.com.mx/MLM-804530411-tenis-para-hombre-nike-court-vision-low-_JM#reco_item_pos=0&reco_backend=machinalis-homes-pdp-boos&reco_backend_type=function&reco_client=home_navigation-recommendations&reco_id=4b0372c0-a29f-484b-881b-9f52fe79373f&c_id=/home/navigation-recommendations/element&c_element_order=1&c_uid=ef06cd92-a28f-4997-9ff4-e1c0db0305eb'),(104,8000,'https://articulo.mercadolibre.com.mx/MLM-903089214-tenis-para-hombre-nike-court-vision-low-_JM#reco_item_pos=2&reco_backend=machinalis-homes-pdp-boos&reco_backend_type=function&reco_client=home_navigation-recommendations&reco_id=4b0372c0-a29f-484b-881b-9f52fe79373f&c_id=/home/navigation-recommendations/element&c_element_order=3&c_uid=044e7025-0e60-4ab7-8143-4d9ef880d62a'),(105,50000,'https://articulo.mercadolibre.com.mx/MLM-847837872-tenis-dc-mujer-amarillo-fosfo-e-tribeka-pltfrm-adjs700078yel-_JM?searchVariation=70090808173#searchVariation=70090808173&position=1&search_layout=grid&type=item&tracking_id=da53eefb-2cfd-4e12-8d31-58d05b5c6023'),(106,1200,'https://articulo.mercadolibre.com.mx/MLM-888986734-tenis-mujer-nina-juvenil-neon-rosa-amarillo-brillos-fosfo-_JM?searchVariation=78465153764#searchVariation=78465153764&position=2&search_layout=grid&type=item&tracking_id=ae4d38a7-fb6e-40a3-b013-b3a35d8bc6f5'),(107,12000,'https://www.amazon.com.mx/HTC-desbloqueado-f%C3%A1brica-ahumado-compatible/dp/B08DFJLB2Z/ref=sr_1_1?__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=htc&qid=1623742192&sr=8-1'),(108,800,'https://www.amazon.com.mx/HTC-Double-Rhode-Island-estuche/dp/B00S1RWTKI/ref=sr_1_13?__mk_es_MX=%C3%85M%C3%85%C5%BD%C3%95%C3%91&dchild=1&keywords=htc&qid=1623742350&sr=8-13'),(109,80,'https://articulo.mercadolibre.com.mx/MLM-850486468-escoba-barredora-magica-manual-reynera-_JM#position=1&search_layout=stack&type=pad&tracking_id=d79410b9-ce3f-4aad-add2-f316e9aaf9d4&is_advertising=true&ad_domain=VQCATCORE_LST&ad_position=1&ad_click_id=NWFlNjZkZjMtMGFhYS00MjNmLWI0YTctN2U0ZmU2ZTk4MzVh'),(110,3500,'mercadolibre.com'),(113,1000,'amazon.mx'),(114,20,'mcdonalds.com'),(116,1000,'amazon.mx'),(117,1000,'amazon.mx'),(118,10,'amazon.mx'),(119,10,'amazon.mx'),(120,10,'amazon.mx'),(121,10,'amazon.mx'),(122,10,'amazon.mx'),(123,10,'amazon.mx'),(124,10,'amazon.mx'),(125,10,'amazon.mx'),(126,10,'amazon.mx'),(127,10,'amazon.mx'),(128,10,'amazon.mx'),(129,10,'amazon.mx'),(130,10,'amazon.mx'),(131,10,'amazon.mx'),(132,3500,'mercadolibre.com'),(133,3500,'mercadolibre.com');
/*!40000 ALTER TABLE `Oferta` ENABLE KEYS */;

--
-- Table structure for table `Publicacion`
--

DROP TABLE IF EXISTS `Publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publicacion` (
  `idPublicacion` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `estado` tinyint(11) NOT NULL DEFAULT 1,
  `categoria` int(11) NOT NULL,
  `publicador` int(11) NOT NULL,
  `fechaCreacion` date NOT NULL,
  `fechaFin` date NOT NULL,
  `tipoPublicacion` varchar(20) NOT NULL,
  `numeroDenuncias` int(11) DEFAULT 0,
  `puntuacion` int(11) DEFAULT 0,
  PRIMARY KEY (`idPublicacion`),
  UNIQUE KEY `Oferta_idOferta_uindex` (`idPublicacion`),
  KEY `Oferta_Categoria_idCategoria_fk` (`categoria`),
  KEY `Oferta_Miembro_idMiembro_fk` (`publicador`),
  CONSTRAINT `Oferta_Categoria_idCategoria_fk` FOREIGN KEY (`categoria`) REFERENCES `Categoria` (`idCategoria`),
  CONSTRAINT `Oferta_Miembro_idMiembro_fk` FOREIGN KEY (`publicador`) REFERENCES `MiembroOfercompas` (`idMiembro`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publicacion`
--

/*!40000 ALTER TABLE `Publicacion` DISABLE KEYS */;
INSERT INTO `Publicacion` VALUES (98,'Play Station 5 Chipiada','Viene chipiada para que puedas disfrutar de juegos hasta de la XBOX',3,1,7,'2021-06-14','2021-06-30','Oferta',2,-1),(99,'Sapphire 11265-05-20G Tarjeta Gráfica','Tarjeta gráfica de alto rendimiento',4,1,24,'2021-06-15','2021-06-22','Oferta',0,0),(100,'Sapphire 11265-05-20G Tarjeta Gráfica','De alto rendimiento',4,1,25,'2021-06-22','2021-07-27','Oferta',1,-1),(101,'Sapphire 11265-05-20G Tarjeta Gráfica','Muy buena',1,1,26,'2021-06-15','2021-06-22','Oferta',0,3),(102,'Tenis blancos','Tenis blancos suaves',4,3,7,'2021-06-16','2021-06-17','Oferta',0,0),(103,'Tenis de colores','tenis buenos para el basquet',1,3,24,'2021-06-16','2021-06-17','Oferta',2,0),(104,'Tenis grises','Tenis nile grises',3,3,25,'2021-06-17','2021-06-18','Oferta',1,1),(105,'Tenis FOSFO FOSFO','Los tenis de la senatora por un sueldito de 50 000',1,2,26,'2021-06-19','2021-06-20','Oferta',1,2),(106,'Tenis  para basquet','Me ayudaron muchisimo jugando',1,3,7,'2021-06-27','2021-06-28','Oferta',1,0),(107,'Celular Htc','Celular con muy buen rendi,iento y bonito',1,1,24,'2021-07-01','2021-07-02','Oferta',0,0),(108,'htc morado celular','htc muy baratyo',1,1,25,'2021-06-17','2021-06-18','Oferta',1,0),(109,'Escoba para barrer','Escoba muy buena y barata para barrer',1,4,26,'2021-06-26','2021-06-27','Oferta',0,0),(110,'Nintendo Switch Verde','Ahora es azul',4,1,7,'2021-07-15','2021-07-16','Oferta',0,0),(111,'40% de descuento en Coca Cola','Por el 10 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0),(112,'20% de descuento en Uber Eats','Por el 5 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0),(113,'Nintendo NES','Para echar la reta del smash con todos tus amigos',2,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(114,'Desayuno de McDonalds','Está barato y te saca de un apuro',1,7,7,'2021-06-16','2021-06-17','Oferta',1,0),(115,'10% Asadero 100','Por el cumpleaños del dueño nos dan un descuento del 10%, no se vayan a quear pobres',1,7,7,'2021-06-17','2021-06-22','CodigoDescuento',1,0),(116,'XBOX 360','Para echar la reta del smash con todos tus amigos',2,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(117,'Nintendo DS Lite','Para echar la reta del smash con todos tus amigos',2,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(118,'Pozole','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(119,'Pozole','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(120,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(121,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(122,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(123,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(124,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(125,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(126,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(127,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(128,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(129,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(130,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(131,'Pizza','Delicioso a diez varos el litro',1,1,7,'2021-06-15','2021-06-02','Oferta',0,0),(132,'Tacos','Ahora es azul',4,1,7,'2021-07-15','2021-07-16','Oferta',0,0),(133,'Tacos','Ahora es azul',4,1,7,'2021-07-15','2021-07-16','Oferta',0,0),(134,'20% de descuento en Uber Eats','Por el 5 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0),(135,'20% de descuento en Uber Eats','Por el 5 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0),(136,'20% de descuento en Uber Eats','Por el 5 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0),(137,'20% de descuento en Uber Eats','Por el 5 aniversario',1,7,7,'2021-06-15','2021-06-16','CodigoDescuento',0,0);
/*!40000 ALTER TABLE `Publicacion` ENABLE KEYS */;

--
-- Table structure for table `Puntuacion`
--

DROP TABLE IF EXISTS `Puntuacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Puntuacion` (
  `idPuntuador` int(11) NOT NULL,
  `idPublicacion` int(11) NOT NULL,
  `esPositiva` tinyint(1) NOT NULL,
  KEY `table_name_Miembro_idMiembro_fk` (`idPuntuador`),
  KEY `table_name_Oferta_idOferta_fk` (`idPublicacion`),
  CONSTRAINT `table_name_Miembro_idMiembro_fk` FOREIGN KEY (`idPuntuador`) REFERENCES `MiembroOfercompas` (`idMiembro`),
  CONSTRAINT `table_name_Oferta_idOferta_fk` FOREIGN KEY (`idPublicacion`) REFERENCES `Publicacion` (`idPublicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Puntuacion`
--

/*!40000 ALTER TABLE `Puntuacion` DISABLE KEYS */;
INSERT INTO `Puntuacion` VALUES (7,98,1),(7,101,1),(27,105,1),(27,101,1),(26,101,0),(26,104,1),(7,105,0);
/*!40000 ALTER TABLE `Puntuacion` ENABLE KEYS */;

--
-- Table structure for table `TipoMiembro`
--

DROP TABLE IF EXISTS `TipoMiembro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoMiembro` (
  `idTipo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(20) NOT NULL,
  PRIMARY KEY (`idTipo`),
  UNIQUE KEY `TipoMiembro_tipo_uindex` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TipoMiembro`
--

/*!40000 ALTER TABLE `TipoMiembro` DISABLE KEYS */;
INSERT INTO `TipoMiembro` VALUES (1,'comun'),(2,'moderador');
/*!40000 ALTER TABLE `TipoMiembro` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-17  3:26:52
