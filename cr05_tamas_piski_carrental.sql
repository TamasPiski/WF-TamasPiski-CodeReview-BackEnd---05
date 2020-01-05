CREATE DATABASE  IF NOT EXISTS `cr05_tamas_piski_carrental` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cr05_tamas_piski_carrental`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: cr05_tamas_piski_carrental
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `idcars` int(11) NOT NULL,
  `car_brand` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `car_model` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `licence_plate_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `maintenance_id` int(11) DEFAULT NULL,
  `pickup_location_id` int(11) DEFAULT NULL,
  `return_location_id` int(11) DEFAULT NULL,
  `insurance` int(11) DEFAULT NULL,
  `reserved` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idcars`),
  UNIQUE KEY `idcars_UNIQUE` (`idcars`),
  KEY `location_id` (`pickup_location_id`),
  KEY `maintenance_id` (`maintenance_id`),
  KEY `fk_cars_location2_idx` (`return_location_id`),
  KEY `fk_cars_insurances1_idx` (`insurance`),
  CONSTRAINT `fk_cars_insurances1` FOREIGN KEY (`insurance`) REFERENCES `insurances` (`idinsurances`),
  CONSTRAINT `fk_cars_location1` FOREIGN KEY (`pickup_location_id`) REFERENCES `location` (`idlocation`),
  CONSTRAINT `fk_cars_location2` FOREIGN KEY (`return_location_id`) REFERENCES `location` (`idlocation`),
  CONSTRAINT `fk_cars_maintenances1` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`idmaintenance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'BMW','5 series','W1665E',1,1,1,1,0),(2,'Ford','Mustang','W1566I',2,2,3,2,0),(3,'Volkswagen','Golf','W5146T',3,3,2,3,0),(4,'Aston Martin','DB9','W1616U',4,1,3,4,0),(5,'Mercedes','S','W1618X',5,1,1,5,0),(6,'Mazda','MX-5','W486468Y',6,3,3,6,0);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `idclients` int(11) NOT NULL,
  `client_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `client_phone_number` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `client_address` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `reservation` int(11) DEFAULT NULL,
  PRIMARY KEY (`idclients`),
  UNIQUE KEY `idclients_UNIQUE` (`idclients`),
  KEY `fk_clients_reservations1_idx` (`reservation`),
  CONSTRAINT `fk_clients_reservations1` FOREIGN KEY (`reservation`) REFERENCES `reservations` (`idreservations`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Simon','+3654844','Kettenbruckengasse 26',NULL),(2,'Tamas','+4354888','Alszeile 118',NULL),(3,'Joe','+416846848','Stephansplatz 1',NULL),(4,'Eva','+4846864','Keplerplatz 17',NULL),(5,'John','+4854446','Rotzergasse 46',NULL),(6,'Kevin','+4484864','Reumanplatz',NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extras`
--

DROP TABLE IF EXISTS `extras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extras` (
  `idextras` int(11) NOT NULL,
  `extra` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idextras`),
  UNIQUE KEY `idextras_UNIQUE` (`idextras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extras`
--

LOCK TABLES `extras` WRITE;
/*!40000 ALTER TABLE `extras` DISABLE KEYS */;
INSERT INTO `extras` VALUES (1,'Child seat'),(2,'Topbox'),(3,'Tinted windows'),(4,'Electric seats'),(5,'Folding mirrors');
/*!40000 ALTER TABLE `extras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurances`
--

DROP TABLE IF EXISTS `insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurances` (
  `idinsurances` int(11) NOT NULL,
  `insurance_type` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `starts` date DEFAULT NULL,
  `ends` date DEFAULT NULL,
  `paid` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idinsurances`),
  UNIQUE KEY `idinsurances_UNIQUE` (`idinsurances`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurances`
--

LOCK TABLES `insurances` WRITE;
/*!40000 ALTER TABLE `insurances` DISABLE KEYS */;
INSERT INTO `insurances` VALUES (1,'Full','2020-01-01','2020-12-31',1),(2,'Full','2019-06-01','2020-05-31',0),(3,'Third-party','2020-01-06','2021-01-05',1),(4,'Third-party','2020-01-04','2021-01-03',1),(5,'Full','2019-11-16','2020-11-06',1),(6,'Full','2019-02-06','2020-02-05',0);
/*!40000 ALTER TABLE `insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `idinvoices` int(11) NOT NULL,
  `client` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  PRIMARY KEY (`idinvoices`),
  UNIQUE KEY `idinvoices_UNIQUE` (`idinvoices`),
  KEY `fk_invoices_payments1_idx` (`payment`),
  CONSTRAINT `fk_invoices_payments1` FOREIGN KEY (`payment`) REFERENCES `payments` (`idpayments`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (1,1,'2020-01-01','2020-01-15',1551,1),(2,2,'2019-11-19','2019-12-31',800,2),(3,2,'2019-11-01','2019-11-30',450,4),(4,4,'2019-07-16','2019-11-25',901,3),(5,6,'2019-12-02','2020-01-05',472,6),(6,5,'2020-01-06','2020-02-01',1597,5);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `idlocation` int(11) NOT NULL,
  `location_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `location_coordinates` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idlocation`),
  UNIQUE KEY `idlocation_UNIQUE` (`idlocation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Vienna','161656'),(2,'Budapest','15151565'),(3,'Innsbruck','168516');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenances`
--

DROP TABLE IF EXISTS `maintenances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenances` (
  `idmaintenance` int(11) NOT NULL,
  `gas_tank_full` tinyint(4) DEFAULT NULL,
  `last_service` date DEFAULT NULL,
  PRIMARY KEY (`idmaintenance`),
  UNIQUE KEY `idmaintenance_UNIQUE` (`idmaintenance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenances`
--

LOCK TABLES `maintenances` WRITE;
/*!40000 ALTER TABLE `maintenances` DISABLE KEYS */;
INSERT INTO `maintenances` VALUES (1,1,'2019-11-19'),(2,1,'2019-12-11'),(3,0,'2019-06-11'),(4,1,'2019-01-19'),(5,0,'2019-09-19'),(6,1,'2020-01-01');
/*!40000 ALTER TABLE `maintenances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `idpayment_methods` int(11) NOT NULL,
  `payment_method` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idpayment_methods`),
  UNIQUE KEY `idpayment methods_UNIQUE` (`idpayment_methods`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Credit card'),(2,'Bank wire transfer'),(3,'Cash');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `idpayments` int(11) NOT NULL,
  `payment_status` tinyint(4) DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpayments`),
  UNIQUE KEY `idpayments_UNIQUE` (`idpayments`),
  KEY `fk_payments_payment methods1_idx` (`payment_method`),
  CONSTRAINT `fk_payments_payment methods1` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`idpayment_methods`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,0,2),(2,1,1),(3,0,3),(4,1,1),(5,1,2),(6,0,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prices`
--

DROP TABLE IF EXISTS `prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prices` (
  `priceid` int(11) NOT NULL,
  `price_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`priceid`),
  UNIQUE KEY `priceid_UNIQUE` (`priceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prices`
--

LOCK TABLES `prices` WRITE;
/*!40000 ALTER TABLE `prices` DISABLE KEYS */;
INSERT INTO `prices` VALUES (1,'Normal',100),(2,'Regular customer',80),(3,'Company',70);
/*!40000 ALTER TABLE `prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rents`
--

DROP TABLE IF EXISTS `rents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rents` (
  `idrent` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `car` int(11) DEFAULT NULL,
  `invoice` int(11) DEFAULT NULL,
  `extra_service` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`idrent`),
  UNIQUE KEY `idrent_UNIQUE` (`idrent`),
  KEY `fk_rents_clients1_idx` (`client`),
  KEY `fk_rents_invoices1_idx` (`invoice`),
  KEY `fk_rents_extras1_idx` (`extra_service`),
  KEY `fk_rents_prices1_idx` (`price`),
  KEY `fk_rents_cars1_idx` (`car`),
  CONSTRAINT `fk_rents_cars1` FOREIGN KEY (`car`) REFERENCES `cars` (`idcars`),
  CONSTRAINT `fk_rents_clients1` FOREIGN KEY (`client`) REFERENCES `clients` (`idclients`),
  CONSTRAINT `fk_rents_extras1` FOREIGN KEY (`extra_service`) REFERENCES `extras` (`idextras`),
  CONSTRAINT `fk_rents_invoices1` FOREIGN KEY (`invoice`) REFERENCES `invoices` (`idinvoices`),
  CONSTRAINT `fk_rents_prices1` FOREIGN KEY (`price`) REFERENCES `prices` (`priceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rents`
--

LOCK TABLES `rents` WRITE;
/*!40000 ALTER TABLE `rents` DISABLE KEYS */;
INSERT INTO `rents` VALUES (1,'2019-11-01','2019-11-10',2,1,2,1,2),(2,'2019-12-10','2019-12-21',1,2,1,3,3),(3,'2019-10-15','2019-10-20',4,5,3,5,1),(4,'2020-01-06','2020-01-06',5,4,5,1,2),(5,'2019-11-15','2019-12-31',3,3,6,NULL,3),(6,'2019-03-01','2019-03-28',6,6,4,4,3);
/*!40000 ALTER TABLE `rents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `idreservations` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `car` int(11) DEFAULT NULL,
  `extras` int(11) DEFAULT NULL,
  PRIMARY KEY (`idreservations`),
  UNIQUE KEY `idreservations_UNIQUE` (`idreservations`),
  KEY `fk_reservations_cars1_idx` (`car`),
  KEY `fk_reservations_extras1_idx` (`extras`),
  CONSTRAINT `fk_reservations_cars1` FOREIGN KEY (`car`) REFERENCES `cars` (`idcars`),
  CONSTRAINT `fk_reservations_cars2` FOREIGN KEY (`car`) REFERENCES `cars` (`idcars`),
  CONSTRAINT `fk_reservations_extras1` FOREIGN KEY (`extras`) REFERENCES `extras` (`idextras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2020-01-18','2020-01-25',3,1),(2,'2020-03-01','2020-03-08',2,3),(3,'2020-05-15','2020-06-12',1,5),(4,'2020-04-01','2020-04-01',4,3),(5,'2020-02-28','2020-03-12',6,2);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-05 18:33:26
