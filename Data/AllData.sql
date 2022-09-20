-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `korisnickoIme` varchar(20) NOT NULL,
  `lozinka` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`korisnickoIme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES ('sergej','root');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drzava`
--

DROP TABLE IF EXISTS `drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drzava` (
  `idDrzava` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`idDrzava`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` VALUES (13,'Srbija'),(14,'Bosna i Hercegovina');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dvorana`
--

DROP TABLE IF EXISTS `dvorana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dvorana` (
  `idDvorana` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  `kapacitet` int DEFAULT NULL,
  `adresa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDvorana`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dvorana`
--

LOCK TABLES `dvorana` WRITE;
/*!40000 ALTER TABLE `dvorana` DISABLE KEYS */;
INSERT INTO `dvorana` VALUES (1,'Beogradska Arena',20000,'Bulevar Arsenija Carnojevica 58'),(2,'Spens',10000,'Sase Mijatovica 2'),(3,'Hala Pionir',8000,'Carlija Caplina 39'),(4,'Hala Cair',6000,'9. Brigade'),(5,'Jezero',7000,'Nikole Tesle 20');
/*!40000 ALTER TABLE `dvorana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `get_cities`
--

DROP TABLE IF EXISTS `get_cities`;
/*!50001 DROP VIEW IF EXISTS `get_cities`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_cities` AS SELECT 
 1 AS `idGrad`,
 1 AS `grad`,
 1 AS `idDrzava`,
 1 AS `drzava`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_clubs`
--

DROP TABLE IF EXISTS `get_clubs`;
/*!50001 DROP VIEW IF EXISTS `get_clubs`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_clubs` AS SELECT 
 1 AS `id`,
 1 AS `naziv`,
 1 AS `nazivDvorane`,
 1 AS `kapacitetDvorane`,
 1 AS `grad`,
 1 AS `drzava`,
 1 AS `idGrad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_matches`
--

DROP TABLE IF EXISTS `get_matches`;
/*!50001 DROP VIEW IF EXISTS `get_matches`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_matches` AS SELECT 
 1 AS `idUtakmica`,
 1 AS `idLiga`,
 1 AS `idDomaci`,
 1 AS `idGosti`,
 1 AS `datumVrijeme`,
 1 AS `domaci`,
 1 AS `gosti`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_players`
--

DROP TABLE IF EXISTS `get_players`;
/*!50001 DROP VIEW IF EXISTS `get_players`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_players` AS SELECT 
 1 AS `idOsoba`,
 1 AS `ime`,
 1 AS `prezime`,
 1 AS `idKlub`,
 1 AS `imeKluba`,
 1 AS `brojDresa`,
 1 AS `prosjekPoena`,
 1 AS `prosjekAsistencija`,
 1 AS `prosjekSkokova`,
 1 AS `visina`,
 1 AS `tezina`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `get_table`
--

DROP TABLE IF EXISTS `get_table`;
/*!50001 DROP VIEW IF EXISTS `get_table`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_table` AS SELECT 
 1 AS `nazivDrzave`,
 1 AS `idKlub`,
 1 AS `imeKluba`,
 1 AS `pozicija`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `grad`
--

DROP TABLE IF EXISTS `grad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grad` (
  `idGrad` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `idDrzava` int NOT NULL,
  PRIMARY KEY (`idGrad`),
  KEY `fk_Grad_Drzava1_idx` (`idDrzava`),
  CONSTRAINT `fk_Grad_Drzava1` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzava`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grad`
--

LOCK TABLES `grad` WRITE;
/*!40000 ALTER TABLE `grad` DISABLE KEYS */;
INSERT INTO `grad` VALUES (1,'Beograd',13),(2,'Novi Sad',13),(3,'Valjevo',13),(4,'Sombor',13),(5,'Nis',13),(6,'Kragujevac',13),(7,'Cacak',13);
/*!40000 ALTER TABLE `grad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `izmjena`
--

DROP TABLE IF EXISTS `izmjena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `izmjena` (
  `idUtakmica` int NOT NULL,
  `idOsobaUlazi` int NOT NULL,
  `idOsobaIzlazi` int NOT NULL,
  PRIMARY KEY (`idUtakmica`,`idOsobaUlazi`,`idOsobaIzlazi`),
  KEY `fk_Izmjena_Kosarkas1_idx` (`idOsobaUlazi`),
  KEY `fk_Izmjena_Kosarkas2_idx` (`idOsobaIzlazi`),
  CONSTRAINT `fk_Izmjena_Kosarkas1` FOREIGN KEY (`idOsobaUlazi`) REFERENCES `kosarkas` (`idOsoba`),
  CONSTRAINT `fk_Izmjena_Kosarkas2` FOREIGN KEY (`idOsobaIzlazi`) REFERENCES `kosarkas` (`idOsoba`),
  CONSTRAINT `fk_Izmjena_Utakmica1` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `izmjena`
--

LOCK TABLES `izmjena` WRITE;
/*!40000 ALTER TABLE `izmjena` DISABLE KEYS */;
/*!40000 ALTER TABLE `izmjena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klub`
--

DROP TABLE IF EXISTS `klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klub` (
  `idKlub` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  `idDvorana` int NOT NULL,
  `idGrad` int NOT NULL,
  `brojBodova` int DEFAULT NULL,
  PRIMARY KEY (`idKlub`),
  KEY `fk_Klub_Dvorana1_idx` (`idDvorana`),
  KEY `fk_Klub_Grad1_idx` (`idGrad`),
  CONSTRAINT `fk_Klub_Dvorana1` FOREIGN KEY (`idDvorana`) REFERENCES `dvorana` (`idDvorana`),
  CONSTRAINT `fk_Klub_Grad1` FOREIGN KEY (`idGrad`) REFERENCES `grad` (`idGrad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klub`
--

LOCK TABLES `klub` WRITE;
/*!40000 ALTER TABLE `klub` DISABLE KEYS */;
INSERT INTO `klub` VALUES (3,'Crvena Zvezda',1,1,25),(4,'Partizan',3,1,23),(5,'Vojvodina',2,2,15),(6,'Radnicki',5,6,12),(7,'Borac',4,7,11);
/*!40000 ALTER TABLE `klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kosarkas`
--

DROP TABLE IF EXISTS `kosarkas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kosarkas` (
  `idOsoba` int NOT NULL,
  `brojDresa` int DEFAULT NULL,
  `prosjekPoena` double DEFAULT NULL,
  `prosjekAsistencija` double DEFAULT NULL,
  `prosjekSkokova` double DEFAULT NULL,
  `visina` smallint DEFAULT NULL,
  `tezina` float DEFAULT NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_Osoba` FOREIGN KEY (`idOsoba`) REFERENCES `osoba` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kosarkas`
--

LOCK TABLES `kosarkas` WRITE;
/*!40000 ALTER TABLE `kosarkas` DISABLE KEYS */;
INSERT INTO `kosarkas` VALUES (1,1,15.5,2.4,12.1,205,105),(2,2,19,4,11,201,109),(3,3,11,6.2,12,211,108),(4,4,12,2.2,11,203,100),(5,5,13,1.6,2.6,198,97),(8,8,11.5,12.2,8.6,212,114),(9,12,14.1,11,4.6,200,110),(10,13,12.4,1.5,4.8,209,100),(11,14,16.7,11,4.9,207,104),(12,55,19,12,3.9,189,100),(13,19,21,1.6,3.5,195,100),(14,16,10.1,2.8,6.5,190,103),(15,33,19.5,6.3,7.4,197,104),(16,75,11.1,9.3,3.5,201,112),(17,44,13,2.5,2.4,202,108),(18,23,14,2.3,6.8,201,99),(19,22,12,8.2,7,197,98),(20,76,15,9.1,8,196,102),(21,25,16,2,9.8,206,103),(22,18,13,5,3.8,201,101),(23,9,16,2,4.6,200,100);
/*!40000 ALTER TABLE `kosarkas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kosarkas_igra_na_poziciji`
--

DROP TABLE IF EXISTS `kosarkas_igra_na_poziciji`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kosarkas_igra_na_poziciji` (
  `idOsoba` int NOT NULL,
  `idPozicija` int NOT NULL,
  PRIMARY KEY (`idOsoba`,`idPozicija`),
  KEY `fk_Kosarkas_has_Pozicija_Pozicija1_idx` (`idPozicija`),
  KEY `fk_Kosarkas_has_Pozicija_Kosarkas1_idx` (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_has_Pozicija_Kosarkas1` FOREIGN KEY (`idOsoba`) REFERENCES `kosarkas` (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_has_Pozicija_Pozicija1` FOREIGN KEY (`idPozicija`) REFERENCES `pozicija` (`idPozicija`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kosarkas_igra_na_poziciji`
--

LOCK TABLES `kosarkas_igra_na_poziciji` WRITE;
/*!40000 ALTER TABLE `kosarkas_igra_na_poziciji` DISABLE KEYS */;
INSERT INTO `kosarkas_igra_na_poziciji` VALUES (1,1),(11,1),(16,1),(21,1),(3,2),(8,2),(12,2),(17,2),(22,2),(2,3),(13,3),(18,3),(23,3),(4,4),(9,4),(14,4),(19,4),(5,5),(10,5),(15,5),(20,5);
/*!40000 ALTER TABLE `kosarkas_igra_na_poziciji` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kosarkas_igra_za_klub`
--

DROP TABLE IF EXISTS `kosarkas_igra_za_klub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kosarkas_igra_za_klub` (
  `idKlub` int NOT NULL,
  `idOsoba` int NOT NULL,
  `datumPotpisaUgovora` date DEFAULT NULL,
  `datumIstekaUgovora` date DEFAULT NULL,
  `brojNaDresu` int DEFAULT NULL,
  `datumRaskidaUgovora` date DEFAULT NULL,
  PRIMARY KEY (`idKlub`,`idOsoba`),
  KEY `fk_Klub_has_Kosarkas_Kosarkas1_idx` (`idOsoba`),
  KEY `fk_Klub_has_Kosarkas_Klub1_idx` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Kosarkas_Klub1` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Kosarkas_Kosarkas1` FOREIGN KEY (`idOsoba`) REFERENCES `kosarkas` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kosarkas_igra_za_klub`
--

LOCK TABLES `kosarkas_igra_za_klub` WRITE;
/*!40000 ALTER TABLE `kosarkas_igra_za_klub` DISABLE KEYS */;
INSERT INTO `kosarkas_igra_za_klub` VALUES (3,1,NULL,NULL,NULL,NULL),(3,2,NULL,NULL,NULL,NULL),(3,3,NULL,NULL,NULL,NULL),(3,4,NULL,NULL,NULL,NULL),(3,5,NULL,NULL,NULL,NULL),(3,8,NULL,NULL,NULL,NULL),(4,9,NULL,NULL,NULL,NULL),(4,10,NULL,NULL,NULL,NULL),(4,11,NULL,NULL,NULL,NULL),(4,12,NULL,NULL,NULL,NULL),(4,13,NULL,NULL,NULL,NULL),(4,20,NULL,NULL,NULL,NULL),(5,14,NULL,NULL,NULL,NULL),(5,15,NULL,NULL,NULL,NULL),(5,16,NULL,NULL,NULL,NULL),(5,17,NULL,NULL,NULL,NULL),(5,18,NULL,NULL,NULL,NULL),(5,19,NULL,NULL,NULL,NULL),(6,21,NULL,NULL,NULL,NULL),(6,22,NULL,NULL,NULL,NULL),(6,23,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `kosarkas_igra_za_klub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kosarkas_registrovan_za_utakmicu`
--

DROP TABLE IF EXISTS `kosarkas_registrovan_za_utakmicu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kosarkas_registrovan_za_utakmicu` (
  `idUtakmica` int NOT NULL,
  `brojPoena` int DEFAULT NULL,
  `brojAsistencija` int DEFAULT NULL,
  `brojSkokova` int DEFAULT NULL,
  `ukradeneLopte` int DEFAULT NULL,
  `blokade` int DEFAULT NULL,
  `idKlub` int NOT NULL,
  `idOsoba` int NOT NULL,
  PRIMARY KEY (`idUtakmica`,`idOsoba`),
  KEY `fk_Kosarkas_Registrovan_Za_Utakmicu_Klub1_idx` (`idKlub`),
  KEY `fk_Kosarkas_Registrovan_Za_Utakmicu_Kosarkas_igra_na_pozici_idx` (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Klub1` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Kosarkas_igra_na_poziciji1` FOREIGN KEY (`idOsoba`) REFERENCES `kosarkas_igra_na_poziciji` (`idOsoba`),
  CONSTRAINT `fk_Kosarkas_Registrovan_Za_Utakmicu_Utakmica1` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kosarkas_registrovan_za_utakmicu`
--

LOCK TABLES `kosarkas_registrovan_za_utakmicu` WRITE;
/*!40000 ALTER TABLE `kosarkas_registrovan_za_utakmicu` DISABLE KEYS */;
INSERT INTO `kosarkas_registrovan_za_utakmicu` VALUES (17,15,7,3,3,2,4,11),(17,43,15,17,2,0,5,17);
/*!40000 ALTER TABLE `kosarkas_registrovan_za_utakmicu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liga`
--

DROP TABLE IF EXISTS `liga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liga` (
  `idLiga` int NOT NULL AUTO_INCREMENT,
  `idDrzava` int NOT NULL,
  `nazivLige` varchar(45) NOT NULL,
  PRIMARY KEY (`idLiga`),
  KEY `fk_Liga_Drzava1_idx` (`idDrzava`),
  CONSTRAINT `fk_Liga_Drzava1` FOREIGN KEY (`idDrzava`) REFERENCES `drzava` (`idDrzava`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liga`
--

LOCK TABLES `liga` WRITE;
/*!40000 ALTER TABLE `liga` DISABLE KEYS */;
INSERT INTO `liga` VALUES (1,13,'Kosarkaska liga Srbije');
/*!40000 ALTER TABLE `liga` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `osoba`
--

DROP TABLE IF EXISTS `osoba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osoba` (
  `idOsoba` int NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `idMjestoRodjenja` int NOT NULL,
  `plata` int NOT NULL,
  PRIMARY KEY (`idOsoba`),
  KEY `fk_Osoba_Grad1_idx` (`idMjestoRodjenja`),
  CONSTRAINT `fk_Osoba_Grad1` FOREIGN KEY (`idMjestoRodjenja`) REFERENCES `grad` (`idGrad`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osoba`
--

LOCK TABLES `osoba` WRITE;
/*!40000 ALTER TABLE `osoba` DISABLE KEYS */;
INSERT INTO `osoba` VALUES (1,'Bogdan','Bogradnovic',1,12000000),(2,'Nikola','Jokic',4,150000000),(3,'Milos','Teodosic',3,18000000),(4,'Nemanja ','Nedovic',1,10000000),(5,'Vasilije','Micic',1,20000000),(8,'Nikola','Kalinic',2,2000000),(9,'Stefan','Markovic',3,3000000),(10,'Dejan','Davidovac',5,1200000),(11,'Ilija','Djokovic',2,1200000),(12,'Radovan','Djokovic',4,2300000),(13,'Bojan','Tomasevic',2,1940000),(14,'Marko','Pecarski',6,1800000),(15,'Ivan ','Marinkovic',1,4200000),(16,'Aleksa','Avramovic',2,3400000),(17,'Alen','Smailagic',4,1900000),(18,'Uros','Trifunovic',4,1900000),(19,'Danilo','Andjusic',2,2000000),(20,'Filip','Petrusev',1,3000000),(21,'Luka','Mitrovic',2,4000000),(22,'Branko','Lazic',2,1300000),(23,'Ognjen','Kuzmic',5,2000000),(24,'Svetislav','Pesic',3,2000000),(25,'Aleksandar','Djordjevic',2,2000000),(26,'Zeljko ','Obradovic',1,3000000),(27,'Marko','Markovic',1,2000000);
/*!40000 ALTER TABLE `osoba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozicija`
--

DROP TABLE IF EXISTS `pozicija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozicija` (
  `idPozicija` int NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPozicija`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozicija`
--

LOCK TABLES `pozicija` WRITE;
/*!40000 ALTER TABLE `pozicija` DISABLE KEYS */;
INSERT INTO `pozicija` VALUES (1,'plejmejker'),(2,'bek '),(3,'krilo'),(4,'krilni centar'),(5,'centar');
/*!40000 ALTER TABLE `pozicija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozicija_na_tabeli`
--

DROP TABLE IF EXISTS `pozicija_na_tabeli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pozicija_na_tabeli` (
  `idKlub` int NOT NULL,
  `idSezona` int NOT NULL,
  `idLiga` int NOT NULL,
  `pozicija` int DEFAULT NULL,
  PRIMARY KEY (`idKlub`,`idSezona`,`idLiga`),
  KEY `fk_Klub_has_Tabela_Tabela1_idx` (`idSezona`,`idLiga`),
  KEY `fk_Klub_has_Tabela_Klub1_idx` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Tabela_Klub1` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Tabela_Tabela1` FOREIGN KEY (`idSezona`, `idLiga`) REFERENCES `tabela` (`idSezona`, `idLiga`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozicija_na_tabeli`
--

LOCK TABLES `pozicija_na_tabeli` WRITE;
/*!40000 ALTER TABLE `pozicija_na_tabeli` DISABLE KEYS */;
INSERT INTO `pozicija_na_tabeli` VALUES (3,1,1,1),(4,1,1,2),(5,1,1,3),(6,1,1,4),(7,1,1,5);
/*!40000 ALTER TABLE `pozicija_na_tabeli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sezona`
--

DROP TABLE IF EXISTS `sezona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sezona` (
  `idSezona` int NOT NULL AUTO_INCREMENT,
  `oznakaSezone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSezona`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sezona`
--

LOCK TABLES `sezona` WRITE;
/*!40000 ALTER TABLE `sezona` DISABLE KEYS */;
INSERT INTO `sezona` VALUES (1,'Sezona 2022');
/*!40000 ALTER TABLE `sezona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sudija`
--

DROP TABLE IF EXISTS `sudija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sudija` (
  `idOsoba` int NOT NULL,
  `datumIzbora` date DEFAULT NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Sudija_Osoba1` FOREIGN KEY (`idOsoba`) REFERENCES `osoba` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sudija`
--

LOCK TABLES `sudija` WRITE;
/*!40000 ALTER TABLE `sudija` DISABLE KEYS */;
INSERT INTO `sudija` VALUES (27,'2020-01-01');
/*!40000 ALTER TABLE `sudija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sudija_sudi_utakmicu`
--

DROP TABLE IF EXISTS `sudija_sudi_utakmicu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sudija_sudi_utakmicu` (
  `idUtakmica` int NOT NULL,
  `idOsoba` int NOT NULL,
  PRIMARY KEY (`idUtakmica`,`idOsoba`),
  KEY `fk_Utakmica_has_Sudija_Sudija1_idx` (`idOsoba`),
  KEY `fk_Utakmica_has_Sudija_Utakmica1_idx` (`idUtakmica`),
  CONSTRAINT `fk_Utakmica_has_Sudija_Sudija1` FOREIGN KEY (`idOsoba`) REFERENCES `sudija` (`idOsoba`),
  CONSTRAINT `fk_Utakmica_has_Sudija_Utakmica1` FOREIGN KEY (`idUtakmica`) REFERENCES `utakmica` (`idUtakmica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sudija_sudi_utakmicu`
--

LOCK TABLES `sudija_sudi_utakmicu` WRITE;
/*!40000 ALTER TABLE `sudija_sudi_utakmicu` DISABLE KEYS */;
/*!40000 ALTER TABLE `sudija_sudi_utakmicu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabela`
--

DROP TABLE IF EXISTS `tabela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabela` (
  `idSezona` int NOT NULL,
  `idLiga` int NOT NULL,
  PRIMARY KEY (`idSezona`,`idLiga`),
  KEY `fk_Tabela_Liga1_idx` (`idLiga`),
  CONSTRAINT `fk_Tabela_Liga1` FOREIGN KEY (`idLiga`) REFERENCES `liga` (`idLiga`),
  CONSTRAINT `fk_Tabela_Sezona1` FOREIGN KEY (`idSezona`) REFERENCES `sezona` (`idSezona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabela`
--

LOCK TABLES `tabela` WRITE;
/*!40000 ALTER TABLE `tabela` DISABLE KEYS */;
INSERT INTO `tabela` VALUES (1,1);
/*!40000 ALTER TABLE `tabela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfer`
--

DROP TABLE IF EXISTS `transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfer` (
  `idOsoba` int NOT NULL,
  `idTrenutniKlub` int NOT NULL,
  `idNoviKlub` int NOT NULL,
  `iznos` int DEFAULT NULL,
  `datum` date DEFAULT NULL,
  PRIMARY KEY (`idOsoba`,`idTrenutniKlub`,`idNoviKlub`),
  KEY `fk_Transfer_Klub1_idx` (`idTrenutniKlub`),
  KEY `fk_Transfer_Klub2_idx` (`idNoviKlub`),
  CONSTRAINT `fk_Transfer_Klub1` FOREIGN KEY (`idTrenutniKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Transfer_Klub2` FOREIGN KEY (`idNoviKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Transfer_Kosarkas1` FOREIGN KEY (`idOsoba`) REFERENCES `kosarkas` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfer`
--

LOCK TABLES `transfer` WRITE;
/*!40000 ALTER TABLE `transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trener` (
  `idOsoba` int NOT NULL,
  `datumPocetkaKarijere` date NOT NULL,
  PRIMARY KEY (`idOsoba`),
  CONSTRAINT `fk_Trener_Osoba1` FOREIGN KEY (`idOsoba`) REFERENCES `osoba` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
INSERT INTO `trener` VALUES (24,'1984-04-01'),(25,'2012-02-02'),(26,'1990-04-01');
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trener_trenira_u_klubu`
--

DROP TABLE IF EXISTS `trener_trenira_u_klubu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trener_trenira_u_klubu` (
  `idKlub` int NOT NULL,
  `idOsoba` int NOT NULL,
  `datumPotpisaUgovora` date DEFAULT NULL,
  `datumRaskidaUgovora` date DEFAULT NULL,
  `datumIstekaUgovora` date DEFAULT NULL,
  PRIMARY KEY (`idKlub`,`idOsoba`),
  KEY `fk_Klub_has_Trener_Trener1_idx` (`idOsoba`),
  KEY `fk_Klub_has_Trener_Klub1_idx` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Trener_Klub1` FOREIGN KEY (`idKlub`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Klub_has_Trener_Trener1` FOREIGN KEY (`idOsoba`) REFERENCES `trener` (`idOsoba`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener_trenira_u_klubu`
--

LOCK TABLES `trener_trenira_u_klubu` WRITE;
/*!40000 ALTER TABLE `trener_trenira_u_klubu` DISABLE KEYS */;
INSERT INTO `trener_trenira_u_klubu` VALUES (3,24,'2021-01-01',NULL,'2024-01-01'),(4,25,'2020-01-01',NULL,'2024-04-05'),(5,26,'2022-04-05',NULL,'2024-05-06');
/*!40000 ALTER TABLE `trener_trenira_u_klubu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utakmica`
--

DROP TABLE IF EXISTS `utakmica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utakmica` (
  `idUtakmica` int NOT NULL AUTO_INCREMENT,
  `datumVrijeme` datetime NOT NULL,
  `idDomaci` int NOT NULL,
  `idGosti` int NOT NULL,
  `idLiga` int NOT NULL,
  PRIMARY KEY (`idUtakmica`),
  KEY `fk_Utakmica_Klub1_idx` (`idDomaci`),
  KEY `fk_Utakmica_Klub2_idx` (`idGosti`),
  KEY `fk_Utakmica_Liga1_idx` (`idLiga`),
  CONSTRAINT `fk_Utakmica_Klub1` FOREIGN KEY (`idDomaci`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Utakmica_Klub2` FOREIGN KEY (`idGosti`) REFERENCES `klub` (`idKlub`),
  CONSTRAINT `fk_Utakmica_Liga1` FOREIGN KEY (`idLiga`) REFERENCES `liga` (`idLiga`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utakmica`
--

LOCK TABLES `utakmica` WRITE;
/*!40000 ALTER TABLE `utakmica` DISABLE KEYS */;
INSERT INTO `utakmica` VALUES (17,'2022-02-02 19:00:00',4,5,1);
/*!40000 ALTER TABLE `utakmica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `get_cities`
--

/*!50001 DROP VIEW IF EXISTS `get_cities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_cities` AS select `grad`.`idGrad` AS `idGrad`,`grad`.`naziv` AS `grad`,`drzava`.`idDrzava` AS `idDrzava`,`drzava`.`naziv` AS `drzava` from (`grad` join `drzava` on((`drzava`.`idDrzava` = `grad`.`idDrzava`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_clubs`
--

/*!50001 DROP VIEW IF EXISTS `get_clubs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_clubs` AS select `klub`.`idKlub` AS `id`,`klub`.`naziv` AS `naziv`,`dvorana`.`naziv` AS `nazivDvorane`,`dvorana`.`kapacitet` AS `kapacitetDvorane`,`grad`.`naziv` AS `grad`,`drzava`.`naziv` AS `drzava`,`grad`.`idGrad` AS `idGrad` from (((`klub` join `dvorana` on((`dvorana`.`idDvorana` = `klub`.`idDvorana`))) join `grad` on((`grad`.`idGrad` = `klub`.`idGrad`))) join `drzava` on((`grad`.`idDrzava` = `drzava`.`idDrzava`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_matches`
--

/*!50001 DROP VIEW IF EXISTS `get_matches`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_matches` AS select `utakmica`.`idUtakmica` AS `idUtakmica`,`liga`.`idLiga` AS `idLiga`,`klubd`.`idKlub` AS `idDomaci`,`klubg`.`idKlub` AS `idGosti`,`utakmica`.`datumVrijeme` AS `datumVrijeme`,`klubd`.`naziv` AS `domaci`,`klubg`.`naziv` AS `gosti` from (((`utakmica` join `klub` `klubd` on((`klubd`.`idKlub` = `utakmica`.`idDomaci`))) join `klub` `klubg` on((`klubg`.`idKlub` = `utakmica`.`idGosti`))) join `liga` on((`liga`.`idLiga` = `utakmica`.`idLiga`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_players`
--

/*!50001 DROP VIEW IF EXISTS `get_players`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_players` AS select `osoba`.`idOsoba` AS `idOsoba`,`osoba`.`ime` AS `ime`,`osoba`.`prezime` AS `prezime`,`klub`.`idKlub` AS `idKlub`,`klub`.`naziv` AS `imeKluba`,`kosarkas`.`brojDresa` AS `brojDresa`,`kosarkas`.`prosjekPoena` AS `prosjekPoena`,`kosarkas`.`prosjekAsistencija` AS `prosjekAsistencija`,`kosarkas`.`prosjekSkokova` AS `prosjekSkokova`,`kosarkas`.`visina` AS `visina`,`kosarkas`.`tezina` AS `tezina` from (((`osoba` join `kosarkas` on((`osoba`.`idOsoba` = `kosarkas`.`idOsoba`))) join `kosarkas_igra_za_klub` on((`osoba`.`idOsoba` = `kosarkas_igra_za_klub`.`idOsoba`))) join `klub` on((`klub`.`idKlub` = `kosarkas_igra_za_klub`.`idKlub`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `get_table`
--

/*!50001 DROP VIEW IF EXISTS `get_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `get_table` AS select `drzava`.`naziv` AS `nazivDrzave`,`klub`.`idKlub` AS `idKlub`,`klub`.`naziv` AS `imeKluba`,`pozicija_na_tabeli`.`pozicija` AS `pozicija` from (((`klub` join `pozicija_na_tabeli` on((`klub`.`idKlub` = `pozicija_na_tabeli`.`idKlub`))) join `liga` on((`liga`.`idLiga` = `pozicija_na_tabeli`.`idLiga`))) join `drzava` on((`drzava`.`idDrzava` = `liga`.`idDrzava`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-20 14:19:00
