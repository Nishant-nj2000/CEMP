-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: cemp
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `admit_card_details`
--

DROP TABLE IF EXISTS `admit_card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admit_card_details` (
  `Admit_card_id` int NOT NULL,
  `Form_id` int NOT NULL,
  `Card_available` enum('Yes','No','','') NOT NULL DEFAULT 'No',
  `issue_date` date DEFAULT NULL,
  `date_of_exam` date DEFAULT NULL,
  `link` varchar(50) NOT NULL,
  PRIMARY KEY (`Admit_card_id`),
  KEY `Form_id` (`Form_id`),
  CONSTRAINT `admit_card_details_ibfk_2` FOREIGN KEY (`Form_id`) REFERENCES `exam_form_details` (`Form_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admit_card_details`
--

LOCK TABLES `admit_card_details` WRITE;
/*!40000 ALTER TABLE `admit_card_details` DISABLE KEYS */;
INSERT INTO `admit_card_details` VALUES (0,2,'No','2020-10-10','2020-11-20',''),(1,3,'Yes','2020-10-08','2020-12-18',''),(2,8,'Yes','2020-10-07','2020-10-18','rgform8.link'),(3,6,'No','2020-10-01','2020-10-30',''),(4,7,'No','2020-10-05','2020-10-31',''),(9,1,'Yes','2020-09-01','2020-11-25',''),(10,2,'No','2020-10-28','2021-01-15',''),(11,3,'Yes','2020-09-16','2021-03-07',''),(12,4,'No','2020-06-20','2020-10-31',''),(13,5,'Yes','2020-06-30','2020-12-29',''),(14,6,'No','2020-07-09','2021-02-10',''),(15,7,'Yes','2020-10-20','2021-05-02',''),(16,8,'No','2020-08-31','2021-05-27','');
/*!40000 ALTER TABLE `admit_card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applied_form`
--

DROP TABLE IF EXISTS `applied_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applied_form` (
  `Applied_id` int NOT NULL AUTO_INCREMENT,
  `Form_id` int DEFAULT NULL,
  `Exam_id` int DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  `Registration_no` varchar(30) NOT NULL,
  `Date_of_filling` timestamp(6) NULL DEFAULT NULL,
  `Time_of_filling` timestamp(6) NULL DEFAULT NULL,
  `centre` varchar(30) NOT NULL,
  PRIMARY KEY (`Applied_id`),
  UNIQUE KEY `Registration_no` (`Registration_no`),
  KEY `Form_id` (`Form_id`,`Exam_id`,`User_id`),
  KEY `User_id` (`User_id`),
  KEY `Exam_id` (`Exam_id`),
  KEY `Applied_id` (`Applied_id`),
  CONSTRAINT `applied_form_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `candidate_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applied_form_ibfk_2` FOREIGN KEY (`Exam_id`) REFERENCES `exam_master` (`Exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `applied_form_ibfk_3` FOREIGN KEY (`Form_id`) REFERENCES `exam_form_details` (`Form_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applied_form`
--

LOCK TABLES `applied_form` WRITE;
/*!40000 ALTER TABLE `applied_form` DISABLE KEYS */;
INSERT INTO `applied_form` VALUES (1,1,1,2,'GJ-10001','2020-10-10 07:00:00.000000','2021-07-24 23:13:47.000000',''),(3,3,3,4,'GJ-10003','2020-10-12 07:00:00.000000','2021-07-24 23:14:53.000000',''),(5,8,8,5,'RG-10003','2020-10-13 07:00:00.000000','2021-07-25 00:41:03.000000',''),(6,6,6,10,'PM-1006','2020-10-19 07:00:00.000000','2021-07-25 00:41:38.000000',''),(7,7,7,12,'SJ-10004','2020-10-28 07:00:00.000000','2021-07-25 00:41:03.000000',''),(8,2,1,12,'AH-10001','2020-10-28 07:00:00.000000','2021-07-25 03:19:09.000000',''),(9,1,1,36,'BB-10505','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(10,2,2,37,'RA-10066','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(11,3,3,38,'SK-100303','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(12,4,4,39,'PK-10404','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(13,5,5,40,'RR-105505','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(14,6,6,41,'HB-10006','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(15,7,7,42,'AJ-0907','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(16,8,8,43,'AD-1040343','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(17,1,1,44,'KV-44','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000',''),(18,2,2,45,'TS-00045','2020-10-30 07:00:00.000000','2021-07-25 03:08:42.000000','');
/*!40000 ALTER TABLE `applied_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate_details`
--

DROP TABLE IF EXISTS `candidate_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate_details` (
  `User_id` int NOT NULL AUTO_INCREMENT,
  `User_type_id` int DEFAULT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Dob` date NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Phone` bigint NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Adhaar_number` bigint NOT NULL,
  `DOJ` date NOT NULL,
  PRIMARY KEY (`User_id`),
  UNIQUE KEY `Phone` (`Phone`),
  UNIQUE KEY `Adhaar_number` (`Adhaar_number`),
  UNIQUE KEY `Email` (`Email`),
  KEY `User_type_id` (`User_type_id`),
  KEY `User_type_id_2` (`User_type_id`),
  CONSTRAINT `User_type_id` FOREIGN KEY (`User_type_id`) REFERENCES `user_type_master` (`User_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_details`
--

LOCK TABLES `candidate_details` WRITE;
/*!40000 ALTER TABLE `candidate_details` DISABLE KEYS */;
INSERT INTO `candidate_details` VALUES (2,3,'Gaurav Bhojwani','gaurav.bhojwani@gmail.com','1999-03-11','M',9870145876,'301, ISCON-2','Ahmedabad','Gujarat',111122223333,'2019-11-01'),(4,5,'Trilok Sharma','trilok.sharma@gmail.com','1998-08-12','M',8824759861,'12/A, Laxminagar','Baroda','Gujarat',202303404505,'2019-09-02'),(5,7,'Rohan Gupta','Rohan.gupta@gmail.com','1999-07-07','M',9845632147,'401, Fatehgunj','Vadodara','Gujarat',651324879536,'2020-07-09'),(6,13,'Prakash Mehta','prakash.mehta@gmail.com','1999-06-09','M',9456872451,'Station Road','Kota ','Rajasthan',456874521368,'2020-05-31'),(7,14,'siddhesh Jain','siddhesh.jain@gmail.com','1998-12-10','M',9785687417,'Pragati Nagar ','Dungarpur','Rajasthan',368945678125,'2020-05-22'),(8,16,'Sanjay Mehta','sanjay.mehta@gmail.com','1999-05-10','M',9456879412,'Navrangpura ','Ahmedabad','Gujarat',354124789654,'2020-04-01'),(9,21,'Sheetal Mehta','Sheetalmehta@gmail.com','1999-06-07','F',9456781348,'Sector 15 ','Chittaurgarh','Rajasthan',466878954647,'2020-10-05'),(10,22,'Kunti Roy','kuntirox@gmail.com','1999-07-07','F',9456123475,'Sector 2','Rajsamand','Rajasthan',452367894564,'2020-02-13'),(11,23,'Jaya Shukla','jayashukla@gmail.com','1998-10-08','F',9456788464,'New Market','Patiyaa','Gujarat',458796421354,'2020-01-17'),(12,24,'Aishwarya Patil','Aishwaryapatil@gmail.com','1998-12-02','F',9458764859,'New Port Road','Pune ','Maharashtra',945687456985,'2020-08-31'),(36,36,'Bhuvan Bam','bhuvan@gmail.com','1994-01-22','M',9149102219,'Rohini','New Delhi','NCT Delhi',914910221955,'2019-07-22'),(37,37,'Ranveer Allahbadia','ranveerallahbadia@gmail.com','1993-06-23','M',9931613277,'Paul Road','Chennai','Tamil Nadu',7723116139977,'2019-07-10'),(38,38,'Sejal Kumar','sejalkumar@gmail.com','1995-01-01','F',9195100155,'Sector 10','Gurugram','Haryana',551001591955,'2019-08-16'),(39,39,'Prachi Keswani','prachi@gmail.com','2000-01-05','F',6213391086,'New Orlando Building','Faridabad','Haryana',680193312696,'2020-05-01'),(40,40,'Rohit Raj','rohitraj@gmail.com','1993-04-08','M',8040399108,'Chinatown','Kolkata','West Bengal',801993040801,'2020-09-25'),(41,41,'Harsh Beniwal','harshbeniwal@gmail.com','1996-02-13','M',9961213157,'M G Road','Pune','Maharashtra',437567795441,'2020-10-13'),(42,42,'Aranya Johar','aranyajohar@gmail.com','1998-09-07','F',7090899753,'Indraprasth Nagar','Indore','Madhya Pradesh',357998090716,'2020-03-18'),(43,43,'Anisha Dixit','anishadixit@gmail.com','1994-01-17','F',7101499166,'Munich Towers','Lucknow','Uttar Pradesh',761606114993,'2019-03-21'),(44,44,'Kumar Varun','kumarvarun@gmail.com','1995-11-27','M',9511279166,'Escalade 12','Ahmedabad','Gujarat',366199721195,'2019-11-25'),(45,45,'Tanmay Singh','tanmaysingh@gmail.com','1996-07-04','M',7096409155,'L&T 5','Kolkata','West Bengal',551904690711,'2020-05-05');
/*!40000 ALTER TABLE `candidate_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centre_details`
--

DROP TABLE IF EXISTS `centre_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centre_details` (
  `C_id` int NOT NULL,
  `Centre_id` int NOT NULL,
  `Form_id` int NOT NULL,
  PRIMARY KEY (`C_id`),
  UNIQUE KEY `C_id` (`C_id`),
  KEY `Centre_id` (`Centre_id`,`Form_id`),
  KEY `Form_id` (`Form_id`),
  KEY `Centre_id_2` (`Centre_id`,`Form_id`),
  CONSTRAINT `centre_details_ibfk_1` FOREIGN KEY (`Centre_id`) REFERENCES `centre_master` (`Centre_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `centre_details_ibfk_2` FOREIGN KEY (`Form_id`) REFERENCES `exam_form_details` (`Form_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centre_details`
--

LOCK TABLES `centre_details` WRITE;
/*!40000 ALTER TABLE `centre_details` DISABLE KEYS */;
INSERT INTO `centre_details` VALUES (112,1,1),(101,1,2),(106,1,3),(126,1,8),(113,2,1),(102,2,2),(107,2,3),(108,2,3),(115,3,1),(104,3,2),(110,3,3),(116,4,1),(105,4,2),(111,4,3),(114,5,1),(103,5,2),(109,5,3),(121,6,4),(122,9,5),(125,10,7),(123,11,6);
/*!40000 ALTER TABLE `centre_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centre_master`
--

DROP TABLE IF EXISTS `centre_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centre_master` (
  `Centre_id` int NOT NULL AUTO_INCREMENT,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  PRIMARY KEY (`Centre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centre_master`
--

LOCK TABLES `centre_master` WRITE;
/*!40000 ALTER TABLE `centre_master` DISABLE KEYS */;
INSERT INTO `centre_master` VALUES (1,'Ahmedabad','Gujarat'),(2,'Gandhinagar','Gujarat'),(3,'Mumbai','Maharashtra'),(4,'Pune','Maharashtra'),(5,'Jaipur','Rajasthan'),(6,'Bengaluru','Karnataka'),(7,'Hyderabad','Telangana'),(8,'Kolkata','West Bengal'),(9,'Lucknow','Uttar Pradesh'),(10,'Indore','Madhya Pradesh'),(11,'New Delhi','NCT Delhi');
/*!40000 ALTER TABLE `centre_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_details`
--

DROP TABLE IF EXISTS `complaint_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_details` (
  `Complaint_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Form_id` int NOT NULL,
  `Type` enum('Link Unavailable','Exam Unavailable','Course Unavailable','Cant Enroll','Form Unavailable','Other') NOT NULL,
  `Description` varchar(200) NOT NULL,
  `doc` date NOT NULL,
  `forward` enum('Yes','No','','') NOT NULL DEFAULT 'No',
  PRIMARY KEY (`Complaint_id`),
  UNIQUE KEY `Complaint_id` (`Complaint_id`),
  KEY `User_id` (`User_id`),
  KEY `Form_id` (`Form_id`),
  KEY `Form_id_2` (`Form_id`),
  CONSTRAINT `complaint_details_ibfk_1` FOREIGN KEY (`Form_id`) REFERENCES `exam_form_details` (`Form_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `User_id` FOREIGN KEY (`User_id`) REFERENCES `candidate_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_details`
--

LOCK TABLES `complaint_details` WRITE;
/*!40000 ALTER TABLE `complaint_details` DISABLE KEYS */;
INSERT INTO `complaint_details` VALUES (1,4,2,'Link Unavailable','The link is not available yet..','2020-10-21','Yes'),(2,2,1,'Cant Enroll','i cannot enroll','2019-11-05','No'),(3,11,3,'Form Unavailable','Form is unavailable','2019-01-08','No'),(4,8,2,'Exam Unavailable','Exam is Unavailable','2019-05-01','No'),(5,4,7,'Other','Other','2018-03-06','No');
/*!40000 ALTER TABLE `complaint_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `Document_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Signature` varchar(30) NOT NULL,
  `Pan_card` varchar(30) NOT NULL,
  `Ssc_doc` varchar(30) NOT NULL,
  `Hsc_doc` varchar(30) NOT NULL,
  `Ug_doc` varchar(30) NOT NULL,
  `Pg_doc` varchar(30) NOT NULL,
  `Iti_doc` varchar(30) NOT NULL,
  `Diploma_doc` varchar(30) NOT NULL,
  `Thumbprint` varchar(30) NOT NULL,
  `Adhaar_doc` varchar(30) NOT NULL,
  `Caste_certificate` varchar(30) NOT NULL,
  `Res_certificate` varchar(30) NOT NULL,
  `Income_certificate` varchar(30) NOT NULL,
  PRIMARY KEY (`Document_id`),
  UNIQUE KEY `Adhaar_doc` (`Adhaar_doc`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `candidate_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,2,'photo.gauravbhojwani','signature.gauravbhojwani','pancard.gauravbhojwani','ss.gauravbhojwani','hsc.gauravbhojwani','ug.gauravbhojwani','pg.gauravbhojwani','','','thumbprint.gauravbhojwani','','','',''),(3,4,'photo.trilok','sign.trilok','pan.trilok','ssc.trilok','hsc.trilok','ug.trilok','pg.trilok','','','thumb.trilok','adhaar.trilok','','',''),(5,5,'photo.rohan','sign.rohan','pan.rohan','ssc.rohan','hsc.rohan','ug.rohan','pg.rohan','','','thumb.rohan','adhaar.rohan','','',''),(6,6,'photo.prakash','sign.prakash','pan.prakash','ssc.prakash','hsc.prakash','ug.prakash','pg.prakash','','','thumb.prakash','adhaar.prakash','','',''),(7,7,'photo.siddhesh','sign.siddhesh','pan.siddhesh','ssc.siddhesh','hsc.siddhesdh','ug.siddhesh','','','','thumb.siddhesh','adhaar.siddhesh','','',''),(8,8,'photo.sanjaymehta','sign.sanjaymehta','pan..sanjaymehta','ssc..sanjaymehta','hsc..sanjaymehta','ug..sanjaymehta','pg..sanjaymehta','','','thumb.sanjaymehta','adhaar.sanjaymehta','','',''),(9,9,'photo.sheetalmehta','sign..sheetalmehta','pan..sheetalmehta','ssc.sheetalmehta','hsc.sheetalmehta','ug.sheetalmehta','','','','thumb.sheetalmehta','adhaar.sheetalmehta','','',''),(10,10,'photo.kuntiroy','sign.kuntiroy','pan.kuntiroy','ssc.kuntiroy','hsc.kuntiroy','ug.kuntiroy','pg.kuntiroy','','','thumb.kuntiroy','adhaar.kuntiroy','','',''),(11,11,'photo.jayashukla','sign.jayashukla','pan.jayashukla','ssc.jayashukla','hsc.jayashukla','ug.jayashukla','pg.jayashukla','','diplo.jayashukla','thumb.jayashukla','adhaar.jayashukla','','',''),(12,12,'photo.aishwaryapatil','sign.aishwaryapatil','pan.aishwaryapatil','ssc.aishwaryapatil','hsc.aishwaryapatil','ug.aishwaryapatil','pg.aishwaryapatil','','','thumb.aishwaryapatil','adhaar.aishwaryapatil','','',''),(36,36,'photo.bhuvanbam','sign.bhuvanbam','pan.bhuvanbam','ssc.bhuvanbam','hsc.bhuvanbam','ug.bhuvanbam','','','','thumb.bhuvanbam','adhaar.bhuvanbam','','',''),(37,37,'photo.ranveerallahbadia','sign.ranveerallahbadia','pan.ranveerallahbadia','ssc.ranveerallahbadia','hsc.ranveerallahbadia','ug.ranveerallahbadia','pg.ranveerallahbadia','','diplo.ranveerallahbadia','thumb.ranveerallahbadia','adhaar.ranveerallahbadia','','',''),(38,38,'photo.sejalkumar','sign.sejalkumar','pan.sejalkumar','ssc.sejalkumar','hsc.sejalkumar','ug.sejalkumar','pg.sejalkumar','','diplo.sejalkumar','thumb.sejalkumar','adhaar.sejalkumar','','',''),(39,39,'photo.prachikeswani','sign.prachikeswani','pan.prachikeswani','ssc.prachikeswani','','','','','','thumb.prachikeswani','adhaar.prachikeswani','','',''),(40,40,'photo.rohitraj','sign.rohitraj','pan.rohitraj','ssc.rohitraj','hsc.rohitraj','ug.rohitraj','pg.rohitraj','iti.rohitraj','','thumb.rohitraj','adhaar.rohitraj','','',''),(41,41,'photo.harshbeniwal','sign.harshbeniwal','pan.harshbeniwal','ssc.harshbeniwal','hsc.harshbeniwal','ug.harshbeniwal','','','','thumb.harshbeniwal','adhaar.harshbeniwal','','',''),(42,42,'photo.aranyajohar','sign.aranyajohar','pan.aranyajohar','ssc.aranyajohar','hsc.aranyajohar','ug.aranyajohar','pg.aranyajohar','','','thumb.aranyajohar','adhaar.aranyajohar','','',''),(43,43,'photo.anishadixit','sign.anishadixit','pan.anishadixit','ssc.anishadixit','hsc.anishadixit','ug.anishadixit','pg.anishadixit','','','thumb.anishadixit','adhaar.anishadixit','','',''),(44,44,'photo.kumarvarun','sign.kumarvarun','pan.kumarvarun','ssc.kumarvarun','hsc.kumarvarun','ug.kumarvarun','pg.kumarvarun','iti.kumarvarun','','thumb.kumarvarun','adhaar.kumarvarun','','',''),(45,45,'photo.tanmaysigh','sign.tanmaysigh','pan.tanmaysigh','ssc.tanmaysigh','hsc.tanmaysigh','','','','','thumb.tanmaysigh','adhaar.tanmaysigh','','','');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_form_details`
--

DROP TABLE IF EXISTS `exam_form_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_form_details` (
  `Form_id` int NOT NULL AUTO_INCREMENT,
  `Form_name` varchar(20) NOT NULL,
  `Exam_id` int NOT NULL,
  `Centre_id` int NOT NULL,
  `Date_of_opening` date DEFAULT NULL,
  `Date_of_closing` date DEFAULT NULL,
  `Fees` int NOT NULL,
  `Eligibility` varchar(50) NOT NULL,
  `Link` varchar(50) NOT NULL,
  `Date_of_exam` date DEFAULT NULL,
  PRIMARY KEY (`Form_id`),
  KEY `Exam_id` (`Exam_id`,`Centre_id`),
  KEY `Centre_id` (`Centre_id`),
  CONSTRAINT `exam_form_details_ibfk_1` FOREIGN KEY (`Exam_id`) REFERENCES `exam_master` (`Exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `exam_form_details_ibfk_2` FOREIGN KEY (`Centre_id`) REFERENCES `centre_master` (`Centre_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_form_details`
--

LOCK TABLES `exam_form_details` WRITE;
/*!40000 ALTER TABLE `exam_form_details` DISABLE KEYS */;
INSERT INTO `exam_form_details` VALUES (1,'NIMCET',1,1,'2020-08-06','2020-11-13',1500,'Bachelor\'s Degree from any university','form1.link','2020-10-31'),(2,'MAHCET',2,2,'2020-10-10','2020-10-10',4000,'Senior Secondary Exam [High School] in any stream ','form2.link','2020-10-31'),(3,'NEET-JEE',3,4,'2020-10-10','2020-10-10',1200,'Candidates who have appeared for Class 12 exam','form3.link','2020-10-30'),(4,'GATE',4,6,'2020-10-28','2020-10-28',2000,'Bachelor\'s','form4.link','2020-10-28'),(5,'IES',5,9,'2020-10-28','2020-10-28',500,'Degree in Engineering','form5.link','2020-10-28'),(6,'AIIMS',6,11,'2020-10-28','2020-10-28',400,'Minimum Marks in Physics, Chemistry, Biology: For ','form6.link','2020-10-28'),(7,'NDA',7,10,'2020-10-28','2020-10-28',1750,'10+2 passed','form7.link','2020-10-28'),(8,'NID',8,1,'2020-10-28','2020-10-28',2750,'B.Des','form8.link','2020-10-28');
/*!40000 ALTER TABLE `exam_form_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_master`
--

DROP TABLE IF EXISTS `exam_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_master` (
  `Exam_id` int NOT NULL AUTO_INCREMENT,
  `Exam_name` varchar(20) NOT NULL,
  `Exam_type` varchar(20) NOT NULL,
  `Exam_niche` varchar(20) NOT NULL,
  `Name_of_organisation` varchar(80) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  PRIMARY KEY (`Exam_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_master`
--

LOCK TABLES `exam_master` WRITE;
/*!40000 ALTER TABLE `exam_master` DISABLE KEYS */;
INSERT INTO `exam_master` VALUES (1,'CAT','Management','National','IIM','Ahmedabad','Gujarat'),(2,'CLAT','Law','National','National Law Universities','Gandhinagar','Gujarat'),(3,'NEET','Medical','National ','NTA','Mumbai','Maharashtra'),(4,'GATE','Management','National','IIT','Bengaluru','Karnataka'),(5,'IES','Civil Services','National','Govt.','Lucknow','Uttar Pradesh'),(6,'AIIMS','Medical','National','AIIMS Cohort Study','New Delhi','NCT Delhi'),(7,'NDA','Defense','National','UPSC','Indore','Madhya Pradesh'),(8,'NID Design Aptitude ','Designing','National','NID','Ahmedabad','Gujarat');
/*!40000 ALTER TABLE `exam_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback_details`
--

DROP TABLE IF EXISTS `feedback_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback_details` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Feedback_msg` varchar(700) NOT NULL,
  `Star_rating` float NOT NULL,
  `dof` date NOT NULL,
  PRIMARY KEY (`Feedback_id`),
  KEY `user_id` (`User_id`),
  CONSTRAINT `feedback_details_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `candidate_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback_details`
--

LOCK TABLES `feedback_details` WRITE;
/*!40000 ALTER TABLE `feedback_details` DISABLE KEYS */;
INSERT INTO `feedback_details` VALUES (1,2,'Very simple registration process, swiftly created exams enrollment panel, easy-to-use interface, proctored examination link, proctored invigilation reports, we find this platform to be a one-stop-destination for all exam requirement for any educational institution and Students.',4,'2020-11-10'),(2,4,'The entire examination experience for we at this platform has changed since we have registered with common entrance management platform. The once very complicated system of browsing each different websites has now not been necessary.',3.5,'2020-07-15'),(3,5,'Thank you for great service. We are able to apply for an online assessment for any examination across the region with your platform. Thanks for the good platform and great support. Our exams are going smoothly on the computer and mobile devices as well. Looking for continued support in the future.',5,'2020-03-04'),(4,6,'Very Simple Registration Process',4,'2020-02-06'),(5,7,'Thankyou for great service',3.5,'2019-02-06'),(6,8,'Site doesn\'t work. Bad experience',2,'2018-11-01'),(7,9,'Easy to use',4.5,'0000-00-00'),(8,10,'Can improve',3,'0000-00-00'),(9,11,'bad experience',2.5,'0000-00-00'),(10,12,'Simple and user friendly',4,'0000-00-00'),(11,36,'Swift and fast',4.5,'0000-00-00'),(12,37,'I cannot apply due to technical problems',3,'0000-00-00'),(13,38,'Great procedure',3.5,'0000-00-00'),(14,39,'Simplifies our hassle',5,'0000-00-00'),(15,40,'Hasslefree',4,'0000-00-00'),(16,41,'Troublesome',1,'0000-00-00'),(17,42,'Manageable to use',2.5,'0000-00-00'),(18,43,'Can improve',3.5,'0000-00-00'),(19,44,'Minimalist and best',4,'0000-00-00'),(20,45,'Page doesn\'t load',2.5,'0000-00-00');
/*!40000 ALTER TABLE `feedback_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_details`
--

DROP TABLE IF EXISTS `manager_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_details` (
  `Manager_id` int NOT NULL AUTO_INCREMENT,
  `User_type_id` int DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Dob` date NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Phone` bigint NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Adhaar_number` bigint NOT NULL,
  `status` enum('block','Unblock','','') NOT NULL DEFAULT 'Unblock',
  `AFL` enum('Yes','No','','') NOT NULL DEFAULT 'No',
  `DOJ` date NOT NULL,
  PRIMARY KEY (`Manager_id`),
  UNIQUE KEY `Adhaar_number` (`Adhaar_number`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Phone` (`Phone`),
  KEY `User_type_id` (`User_type_id`),
  CONSTRAINT `manager_details_ibfk_2` FOREIGN KEY (`User_type_id`) REFERENCES `user_type_master` (`User_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_details`
--

LOCK TABLES `manager_details` WRITE;
/*!40000 ALTER TABLE `manager_details` DISABLE KEYS */;
INSERT INTO `manager_details` VALUES (1,2,'Nishant Jain','nishant.nj2000@gmail.com','1999-01-12','M',9978456812,'214 surel appartments','jaipur','Rajasthan',100120023003,'Unblock','No','2019-01-02'),(3,4,'Ajay thakur','ajay.thakur@gmail.com','1998-06-16','M',9548632154,'201, Pragati Nagar','Ahmedabad','Gujarat',645869452136,'block','No','2019-02-13'),(16,11,'Danny','Danny.wolf@gmail.com','1998-10-14','M',9984576424,'Kothrud','Pune','Maharashtra',456421357894,'block','No','2019-01-15'),(17,12,'Rekha bhardwaj','rekha.bhardwaj@gmail.com','1998-11-19','F',9456786532,'Sector 11','Udaipur','Rajasthan',456879451245,'block','No','2020-03-18'),(18,15,'Prakash Jawde','prakash.jawde@gmail.com','1998-09-08','M',9465794534,'New colony ','Pune','Maharashtra',456789456321,'block','No','2020-04-01'),(19,17,'Robin Pandey','Robin.pandey@gmail.com','1998-09-16','M',9784151264,'Subhash Park ','Dungarpur','Rajasthan',456874698745,'block','No','2019-05-22'),(20,18,'Jayadev Mitali','jayadev.mitali@gmail.com','1998-04-08','F',9784568745,'Station Road','Vadodara','Gujarat',123457896541,'Unblock','No','2019-05-31'),(21,19,'Dhrishti Jain','Drishtijain123@gmail.com','1998-11-18','F',9554126883,'Shivaji nagar','Pune','Maharashtra',146624567894,'Unblock','No','2019-07-09'),(22,20,'Vijai Sritharan','vijaisritharan@gmail.com','1998-09-08','F',9554687822,'B- block Mahavir park','Ahmedabad','Gujarat',456978456321,'Unblock','No','2019-09-02'),(23,25,'Ritesh Rana','Riteshrana@gmail.com','1998-07-15','F',9785687634,'15 / A Suraj Flat','Ahmedabad','Gujarat',546847596521,'Unblock','No','2019-11-01'),(26,26,'Jatin Lokwani','jatinlokwani@gmail.com','1999-11-02','M',7567724078,'Jawahar Chowk','Hyderabad','Telangana',75672407820,'Unblock','No','2020-06-20'),(27,27,'Dhiren Mehtani','dhirenmehtani@gmail.com','1998-12-19','M',7016324619,'VLT Apts.','New Delhi','NCT Delhi',701632461969,'Unblock','No','2019-12-14'),(28,28,'Vishal Mehta','vishalmehta@gmail.com','1997-06-08','M',9979610331,'Maninagar','Ahmedabad','Gujarat',997961033152,'Unblock','No','2019-08-06'),(29,29,'Sagar Pandit','sagarpandit@gmail.com','1998-08-17','M',8128922933,'B G Tower','Jaipur','Rajasthan',812892293351,'Unblock','No','2019-03-20'),(30,30,'Nikhil Sharma','nikhilsharma@gmail.com','1991-11-04','M',9998499199,'Powai','Mumbai','Maharashtra',999849919969,'Unblock','No','0000-00-00'),(31,31,'Suhaani Shah','susha@gmail.com','1990-01-29','F',9726290166,'Ramchandra Lane','Lucknow','Uttar Pradesh',972629016610,'Unblock','No','2020-06-12'),(32,32,'Shanice Shreshta','shanice@gmail.com','1995-07-31','F',801286995,'Malad','Mumbai','Maharashtra',80128699512,'Unblock','No','2019-11-04'),(33,33,'Amit Badhana','badhanaamit@gmail.com','1994-09-07','M',9940907169,'Khanpur Market','Indore','Madhya Pradesh',994090716930,'Unblock','No','2018-12-21'),(34,34,'Nikunj Lotia','beyounick@gmail.com','1989-07-29','M',9198709242,'Sentinel Cross road','Bengaluru','Karnataka',919870924296,'Unblock','No','2018-12-29'),(35,35,'Ritu Rathee','riturathee@gmail.com','1993-05-03','F',9139500342,'Sector 26','Gandhinagar','Gujarat',243005931907,'Unblock','No','2020-07-17');
/*!40000 ALTER TABLE `manager_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type_master`
--

DROP TABLE IF EXISTS `user_type_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type_master` (
  `User_type_id` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `User_type` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY (`User_type_id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type_master`
--

LOCK TABLES `user_type_master` WRITE;
/*!40000 ALTER TABLE `user_type_master` DISABLE KEYS */;
INSERT INTO `user_type_master` VALUES (1,'Admin@admin.com','Admin','Admin@123'),(2,'nishant.nj2000@gmail.com','Manager','Abcde@123'),(3,'gaurav.bhojwani@gmail.com','Candidate','Abcde@123'),(4,'ajay.thakur@gmail.com','Manager','Abcde@123'),(5,'trilok.sharma@gmail.com','Candidate','Abcde@123'),(6,'bhupi.kumar@gmail.com','Manager','Abcde@123'),(7,'Rohan.gupta@gmail.com','Candidate','Abcde@123'),(11,'Danny.wolf@gmail.com','Manager','Danny@123'),(12,'rekha.bhardwaj@gmail.com','Manager','Rekha@123'),(13,'prakash.mehta@gmail.com','Candidate','Prakash@123'),(14,'siddhesh.jain@gmail.com','Candidate','Siddhesh@123'),(15,'prakash.jawde@gmail.com','Manager','Prakash@123'),(16,'sanjay.mehta@gmail.com','Candidate','Sanjay@123'),(17,'Robin.pandey@gmail.com','Manager','Robin@123'),(18,'jayadev.mitali@gmail.com','Manager','Jayadev@123'),(19,'Drishtijain123@gmail.com','Manager','Drishti@123'),(20,'vijaisritharan@gmail.com','Manager','Vijay@123'),(21,'Sheetalmehta@gmail.com','Candidate','Sheetal@123'),(22,'kuntirox@gmail.com','Candidate','Kunti@123'),(23,'jayashukla@gmail.com','Candidate','Jaya@123'),(24,'Aishwaryapatil@gmail.com','Candidate','Aish@123'),(25,'Riteshrana@gmail.com','Manager','Ritesh@123'),(26,'jatinlokwani@gmail.com','Manager','Abcde@123'),(27,'dhirenmehtani@gmail.com','Manager','Abcde@123'),(28,'vishalmehta@gmail.com','Manager','Abcde@123'),(29,'sagarpandit@gmail.com','Manager','Abcde@123'),(30,'nikhilsharma@gmail.com','Manager','Abcde@123'),(31,'susha@gmail.com','Manager','Abcde@123'),(32,'shanice@gmail.com','Manager','Abcde@123'),(33,'badhanaamit@gmail.com','Manager','Abcde@123'),(34,'beyounick@gmail.com','Manager','Abcde@123'),(35,'riturathee@gmail.com','Manager','Abcde@123'),(36,'bhuvan@gmail.com','Candidate','Abcde@123'),(37,'ranveerallahbadia@gmail.com','Candidate','Abcde@123'),(38,'sejalkumar@gmail.com','Candidate','Abcde@123'),(39,'prachi@gmail.com','Candidate','Abcde@123'),(40,'rohitraj@gmail.com','Candidate','Abcde@123'),(41,'harshbeniwal@gmail.com','Candidate','Abcde@123'),(42,'aranyajohar@gmail,com','Candidate','Abcde@123'),(43,'anishadixit@gmail.com','Candidate','Abcde@123'),(44,'kumarvarun@gmail.com','Candidate','Abcde@123'),(45,'tanmaysingh@gmail.com','Candidate','Abcde@123');
/*!40000 ALTER TABLE `user_type_master` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-24  7:19:47
