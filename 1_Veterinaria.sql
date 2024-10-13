-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gasto`
--

DROP TABLE IF EXISTS `gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gasto` (
  `idGasto` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `importe` float NOT NULL,
  `tipo_gasto` varchar(45) NOT NULL,
  PRIMARY KEY (`idGasto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gasto`
--

LOCK TABLES `gasto` WRITE;
/*!40000 ALTER TABLE `gasto` DISABLE KEYS */;
INSERT INTO `gasto` VALUES (1,'Compra de vacunas','2023-01-05',500000,'Medicamentos'),(2,'Reparación de equipo de rayos X','2023-03-20',300000,'Equipo'),(3,'Compra de anestesia','2023-02-10',200000,'Medicamentos');
/*!40000 ALTER TABLE `gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospitalizacion`
--

DROP TABLE IF EXISTS `hospitalizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospitalizacion` (
  `idHospitalizacion` int NOT NULL AUTO_INCREMENT,
  `fecha_ingreso` datetime NOT NULL,
  `condiciones` varchar(45) NOT NULL,
  `fecha_alta` datetime NOT NULL,
  `Veterinario_idVeterinario` int NOT NULL,
  `Mascotas_id_mascota` int NOT NULL,
  PRIMARY KEY (`idHospitalizacion`,`Veterinario_idVeterinario`,`Mascotas_id_mascota`),
  KEY `fk_Hospitalizacion_Veterinario1_idx` (`Veterinario_idVeterinario`),
  KEY `fk_Hospitalizacion_Mascotas1_idx` (`Mascotas_id_mascota`),
  CONSTRAINT `fk_Hospitalizacion_Mascotas1` FOREIGN KEY (`Mascotas_id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Hospitalizacion_Veterinario1` FOREIGN KEY (`Veterinario_idVeterinario`) REFERENCES `veterinario` (`idVeterinario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospitalizacion`
--

LOCK TABLES `hospitalizacion` WRITE;
/*!40000 ALTER TABLE `hospitalizacion` DISABLE KEYS */;
INSERT INTO `hospitalizacion` VALUES (1,'2023-02-18 10:00:00','Post operatorio de cirugía','2023-02-25 14:00:00',1,3),(2,'2023-03-11 08:30:00','Observación post tratamiento','2023-03-12 17:00:00',3,2);
/*!40000 ALTER TABLE `hospitalizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascotas`
--

DROP TABLE IF EXISTS `mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascotas` (
  `id_mascota` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `especie` varchar(45) NOT NULL,
  `raza` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(20) NOT NULL,
  `peso` float NOT NULL,
  `nombre_dueno` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`id_mascota`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascotas`
--

LOCK TABLES `mascotas` WRITE;
/*!40000 ALTER TABLE `mascotas` DISABLE KEYS */;
INSERT INTO `mascotas` VALUES (1,'Fido','Perro','Labrador','2020-05-10','Macho',25.4,'Juan Pérez'),(2,'Misu','Gato','Siames','2021-07-12','Hembra',4.2,'Ana Gómez'),(3,'Rex','Perro','Pastor Alemán','2018-03-20','Macho',30.8,'Carlos Ramírez'),(4,'Luna','Gato','Persa','2019-08-25','Hembra',3.6,'Laura Rodríguez');
/*!40000 ALTER TABLE `mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso`
--

DROP TABLE IF EXISTS `recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso` (
  `idRecurso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`idRecurso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso`
--

LOCK TABLES `recurso` WRITE;
/*!40000 ALTER TABLE `recurso` DISABLE KEYS */;
INSERT INTO `recurso` VALUES (1,'Vacuna antirrábica','Vacuna contra la rabia','Vacuna',50),(2,'Anestesia','Anestesia general','Medicamento',30),(3,'Rayos X','Equipo de radiografía','Equipo',2),(4,'Antibiótico','Antibiótico de amplio espectro','Medicamento',100);
/*!40000 ALTER TABLE `recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recurso_has_gasto`
--

DROP TABLE IF EXISTS `recurso_has_gasto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso_has_gasto` (
  `Recurso_idRecurso` int NOT NULL,
  `Gasto_idGasto` int NOT NULL,
  PRIMARY KEY (`Recurso_idRecurso`,`Gasto_idGasto`),
  KEY `fk_Recurso_has_Gasto_Gasto1_idx` (`Gasto_idGasto`),
  KEY `fk_Recurso_has_Gasto_Recurso1_idx` (`Recurso_idRecurso`),
  CONSTRAINT `fk_Recurso_has_Gasto_Gasto1` FOREIGN KEY (`Gasto_idGasto`) REFERENCES `gasto` (`idGasto`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Recurso_has_Gasto_Recurso1` FOREIGN KEY (`Recurso_idRecurso`) REFERENCES `recurso` (`idRecurso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recurso_has_gasto`
--

LOCK TABLES `recurso_has_gasto` WRITE;
/*!40000 ALTER TABLE `recurso_has_gasto` DISABLE KEYS */;
INSERT INTO `recurso_has_gasto` VALUES (1,1),(3,2),(2,3);
/*!40000 ALTER TABLE `recurso_has_gasto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento`
--

DROP TABLE IF EXISTS `tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento` (
  `idTratamiento` int NOT NULL AUTO_INCREMENT,
  `tipo_tratatamiento` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `costo` float NOT NULL,
  `Veterinario_idVeterinario` int NOT NULL,
  PRIMARY KEY (`idTratamiento`,`Veterinario_idVeterinario`),
  KEY `fk_Tratamiento_Veterinario1_idx` (`Veterinario_idVeterinario`),
  CONSTRAINT `fk_Tratamiento_Veterinario1` FOREIGN KEY (`Veterinario_idVeterinario`) REFERENCES `veterinario` (`idVeterinario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento`
--

LOCK TABLES `tratamiento` WRITE;
/*!40000 ALTER TABLE `tratamiento` DISABLE KEYS */;
INSERT INTO `tratamiento` VALUES (1,'Vacunación','2023-01-15',150000,2),(2,'Cirugía','2023-02-20',600000,1),(3,'Desparasitación','2023-03-10',100000,3),(4,'Radiografía','2023-04-25',250000,4);
/*!40000 ALTER TABLE `tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tratamiento_has_recurso`
--

DROP TABLE IF EXISTS `tratamiento_has_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tratamiento_has_recurso` (
  `Tratamiento_idTratamiento` int NOT NULL,
  `Recurso_idRecurso` int NOT NULL,
  `cantidad_recurso_usado` float NOT NULL,
  PRIMARY KEY (`Tratamiento_idTratamiento`,`Recurso_idRecurso`),
  KEY `fk_Tratamiento_has_Recurso_Recurso1_idx` (`Recurso_idRecurso`),
  KEY `fk_Tratamiento_has_Recurso_Tratamiento1_idx` (`Tratamiento_idTratamiento`),
  CONSTRAINT `fk_Tratamiento_has_Recurso_Recurso1` FOREIGN KEY (`Recurso_idRecurso`) REFERENCES `recurso` (`idRecurso`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Tratamiento_has_Recurso_Tratamiento1` FOREIGN KEY (`Tratamiento_idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tratamiento_has_recurso`
--

LOCK TABLES `tratamiento_has_recurso` WRITE;
/*!40000 ALTER TABLE `tratamiento_has_recurso` DISABLE KEYS */;
INSERT INTO `tratamiento_has_recurso` VALUES (1,1,1),(2,2,0.5),(3,4,0.2),(4,3,1);
/*!40000 ALTER TABLE `tratamiento_has_recurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `idVeterinario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `numero_licencia` int NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `anios_experiencia` int NOT NULL,
  `salario` float NOT NULL,
  PRIMARY KEY (`idVeterinario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES (1,'Dr. Pedro Morales',123456,'Cirugía',10,5000000),(2,'Dra. Lucia Fernández',654321,'Medicina General',7,4000000),(3,'Dr. Javier García',112233,'Medicina Felina',5,3500000),(4,'Dra. Maria López',445566,'Cirugía',12,5200000);
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `fecha_visita` date NOT NULL,
  `motivo_visita` varchar(100) NOT NULL,
  `observacion_veterinario` varchar(500) NOT NULL,
  `Mascotas_id_mascota` int NOT NULL,
  PRIMARY KEY (`id_visita`,`Mascotas_id_mascota`),
  KEY `fk_Visita_Mascotas_idx` (`Mascotas_id_mascota`),
  CONSTRAINT `fk_Visita_Mascotas` FOREIGN KEY (`Mascotas_id_mascota`) REFERENCES `mascotas` (`id_mascota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES (1,'2023-01-10','Vacunación anual','Mascota en buen estado de salud',1),(2,'2023-02-18','Chequeo de cirugía','Cicatrización en curso, recuperación favorable',3),(3,'2023-03-12','Problemas estomacales','Se recomienda desparasitación inmediata',2),(4,'2023-04-30','Dolor en la pata','Se solicitó una radiografía',4);
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita_has_tratamiento`
--

DROP TABLE IF EXISTS `visita_has_tratamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita_has_tratamiento` (
  `Visita_id_visita` int NOT NULL AUTO_INCREMENT,
  `Visita_Mascotas_id_mascota` int NOT NULL,
  `Tratamiento_idTratamiento` int NOT NULL,
  PRIMARY KEY (`Visita_id_visita`,`Visita_Mascotas_id_mascota`,`Tratamiento_idTratamiento`),
  KEY `fk_Visita_has_Tratamiento_Tratamiento1_idx` (`Tratamiento_idTratamiento`),
  KEY `fk_Visita_has_Tratamiento_Visita1_idx` (`Visita_id_visita`,`Visita_Mascotas_id_mascota`),
  CONSTRAINT `fk_Visita_has_Tratamiento_Tratamiento1` FOREIGN KEY (`Tratamiento_idTratamiento`) REFERENCES `tratamiento` (`idTratamiento`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Visita_has_Tratamiento_Visita1` FOREIGN KEY (`Visita_id_visita`, `Visita_Mascotas_id_mascota`) REFERENCES `visita` (`id_visita`, `Mascotas_id_mascota`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita_has_tratamiento`
--

LOCK TABLES `visita_has_tratamiento` WRITE;
/*!40000 ALTER TABLE `visita_has_tratamiento` DISABLE KEYS */;
INSERT INTO `visita_has_tratamiento` VALUES (1,1,1),(2,3,2),(3,2,3),(4,4,4);
/*!40000 ALTER TABLE `visita_has_tratamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13 11:49:25
