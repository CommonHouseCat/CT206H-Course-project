-- MySQL dump 10.13  Distrib 5.7.43, for Win64 (x86_64)
--
-- Host: localhost    Database: studentmanagement
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dID` varchar(10) NOT NULL,
  `dName` varchar(50) NOT NULL,
  PRIMARY KEY (`dID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('econ','College of Economic'),('edu','School of Education'),('law','Law School'),('natsci','College of Natural Science'),('tech','College of Infomation & Communication Technology');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `sID` char(6) NOT NULL,
  `cID` char(5) NOT NULL,
  `iID` char(7) NOT NULL,
  `semester` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `grade` float DEFAULT NULL,
  PRIMARY KEY (`sID`,`cID`,`iID`,`semester`,`year`),
  KEY `cID` (`cID`),
  KEY `iID` (`iID`),
  CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`sID`) REFERENCES `student` (`sID`),
  CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`),
  CONSTRAINT `grade_ibfk_3` FOREIGN KEY (`iID`) REFERENCES `teaches` (`iID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('S01001','CT101','I005002',2,2017,9),('S01001','LN101','I001001',1,2016,8),('S01001','SP179','I002002',1,2017,7.5),('S01002','LN101','I001001',1,2016,7.8),('S01002','SP179','I002001',2,2018,8.5),('S01003','CT101','I005001',1,2016,8.3),('S01003','EC101','I003001',1,2017,7.5),('S01003','LN101','I001001',3,2018,8),('S01003','SP179','I002001',3,2018,9),('S01004','LN101','I001001',1,2016,8.5),('S01004','SP179','I002002',1,2017,7),('S01004','TN004','I004002',1,2018,9.2),('S02001','CT101','I005001',1,2016,7.5),('S02002','CT101','I005001',3,2018,7.2),('S02002','SP101','I002001',3,2017,8.8),('S02002','SP179','I002002',1,2017,9),('S02003','CT101','I005002',2,2017,9.5),('S02003','LN101','I001001',1,2016,8),('S02003','SP179','I002001',2,2018,7.8),('S02003','TN001','I004001',3,2016,8.7),('S02004','LN101','I001001',2,2017,8.5),('S02004','SP101','I002002',1,2016,7.8),('S03001','EC101','I003001',2,2016,7.5),('S03002','CT102','I005001',3,2017,7.9),('S03002','LN101','I001001',1,2016,8.7),('S03002','SP179','I002001',2,2018,9.2),('S03003','CT101','I005002',2,2017,9.1),('S03003','LN101','I001001',1,2016,7.8),('S03003','SP101','I002002',2,2018,8),('S03003','TN004','I004002',2,2016,8.5),('S03004','SP179','I002001',3,2016,8.2),('S03004','TN001','I004001',1,2018,9.3),('S04001','SP101','I002002',1,2016,8.7),('S04002','CT102','I005002',2,2016,8.5),('S04002','LN101','I001001',3,2018,9.2),('S04002','TN004','I004001',3,2017,7.8),('S04003','CT101','I005001',3,2018,7.7),('S04003','EC101','I003001',2,2016,8.3),('S04003','LN101','I001001',1,2016,8.9),('S04003','SP179','I002002',1,2017,9),('S04004','CT101','I005001',3,2018,8.6),('S04004','TN001','I004001',1,2018,9.1),('S05001','CT102','I005002',2,2016,8.5),('S05002','CT102','I005002',1,2018,9.1),('S05002','LN101','I001001',2,2017,8.3),('S05002','SP101','I002002',2,2018,7.9),('S05003','EC101','I003001',2,2016,7.7),('S05003','SP101','I002001',3,2017,8.9),('S05003','SP179','I002001',2,2018,8.6),('S05003','TN004','I004001',1,2018,9),('S05004','LN101','I001001',1,2016,8.8),('S05004','SP179','I002001',2,2018,7.5);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instructor` (
  `iID` char(7) NOT NULL,
  `iName` varchar(50) NOT NULL,
  `dID` varchar(10) DEFAULT NULL,
  `salary` float NOT NULL,
  PRIMARY KEY (`iID`),
  KEY `dID` (`dID`),
  CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('I001001','John Doe','law',65000),('I002001','Michael Johnson','edu',60000),('I002002','Emily Williams','edu',58000),('I003001','Daniel Brown','econ',58000),('I004001','Samantha Martinez','natsci',67000),('I004002','Jane Smith','natsci',70000),('I005001','Joe Generic','tech',64000),('I005002','Olivia Davis','tech',60000);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `sID` char(6) NOT NULL,
  `sName` varchar(50) NOT NULL,
  `sex` char(1) DEFAULT NULL,
  `dID` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`sID`),
  KEY `dID` (`dID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dID`) REFERENCES `department` (`dID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('S01001','Horus Nguyen','M','law','Condo Building A, room 101'),('S01002','Leman Russ','M','law','Condo Building A, room 102'),('S01003','Fulgrim Le','F','law','Condo Building A, room 103'),('S01004','Vulkan Pham','M','law','Condo Building A, room 104'),('S02001','Erda Huynh','F','edu','Condo Building A, room 105'),('S02002','Konrad Curze','M','edu','Condo Building A, room 106'),('S02003','Sanguinius Ngo','F','edu','Condo Building A, room 107'),('S02004','Henry Do','M','edu','Condo Building A, room 108'),('S03001','Isabella Vo','F','econ','Condo Building A, room 109'),('S03002','Jaghatai Khan','M','econ','Condo Building A, room 110'),('S03003','Rogal Dorn','M','econ','Condo Building A, room 111'),('S03004','Lily Nguyen','F','econ','Condo Building A, room 112'),('S04001','Lion El Jonson','M','natsci','Condo Building A, room 113'),('S04002','Lotara Sarrin','F','natsci','Condo Building A, room 114'),('S04003','Corvus Corax','M','natsci','Condo Building A, room 115'),('S04004','Penelope Bui','F','natsci','Condo Building A, room 116'),('S05001','Constantin Valdor','M','tech','Condo Building A, room 117'),('S05002','Roboute Guilliman','M','tech','Condo Building A, room 118'),('S05003','Perturabo Le','M','tech','Condo Building A, room 119'),('S05004','Angron Vo','M','tech','Condo Building A, room 120');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teaches`
--

DROP TABLE IF EXISTS `teaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teaches` (
  `iID` char(7) NOT NULL,
  `cID` char(5) NOT NULL,
  `semester` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`iID`,`cID`,`semester`,`year`),
  KEY `cID` (`cID`),
  CONSTRAINT `teaches_ibfk_1` FOREIGN KEY (`iID`) REFERENCES `instructor` (`iID`),
  CONSTRAINT `teaches_ibfk_2` FOREIGN KEY (`cID`) REFERENCES `course` (`cID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teaches`
--

LOCK TABLES `teaches` WRITE;
/*!40000 ALTER TABLE `teaches` DISABLE KEYS */;
INSERT INTO `teaches` VALUES ('I005001','CT101',1,2016),('I005001','CT101',3,2018),('I005002','CT101',2,2017),('I005001','CT102',3,2017),('I005002','CT102',1,2018),('I005002','CT102',2,2016),('I003001','EC101',1,2017),('I003001','EC101',2,2016),('I003001','EC101',2,2018),('I001001','LN101',1,2016),('I001001','LN101',2,2017),('I001001','LN101',3,2018),('I002001','SP101',3,2017),('I002002','SP101',1,2016),('I002002','SP101',2,2018),('I002001','SP179',2,2018),('I002001','SP179',3,2016),('I002002','SP179',1,2017),('I004001','TN001',1,2018),('I004001','TN001',3,2016),('I004002','TN001',2,2017),('I004001','TN004',3,2017),('I004002','TN004',1,2018),('I004002','TN004',2,2016);
/*!40000 ALTER TABLE `teaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'studentmanagement'
--
/*!50003 DROP FUNCTION IF EXISTS `CALCULATE_GPA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` FUNCTION `CALCULATE_GPA`(ID char(6)) RETURNS float
    DETERMINISTIC
begin 
	if exists(select sID from Student where Student.sID = ID)
    then
		return (select sum(grade*credit)/sum(credit) from Grade
				join Course on Grade.cID = Course.cID
                where Grade.sID = ID);
	else 
		return -1;
	end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `YEARLY_TUITION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` FUNCTION `YEARLY_TUITION`(IDs char(6), yar int) RETURNS float
    DETERMINISTIC
begin
	declare total float default 0;
    
    select sum(280000*credit) into total from Grade
    join Course on Grade.cID = Course.cID
    where sID = IDs and year = yar;
    
    return total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_GRADE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` PROCEDURE `ADD_GRADE`(
	IN IDs char(6),
    IN IDc char(5),
    IN IDi char(7),
    IN sems int,
    IN yer int,
    IN point float)
begin
	insert into Grade values (IDs, IDc,IDi, sems, yer, point);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ADD_STUDENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` PROCEDURE `ADD_STUDENT`(
	IN ID char(6),
    IN Name varchar(50),
    IN gender char(1),
    IN deptID varchar(10),
    IN addr varchar(100))
begin
	insert into Student values(ID, Name, gender, deptID, addr);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `INSTRUCTOR_SCHEDULE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` PROCEDURE `INSTRUCTOR_SCHEDULE`(IN ID char(7))
begin
	select * from Instructor 
    join Teaches on Instructor.iID = Teaches.iID
    join Course on Teaches.cID = Course.cID
    where Instructor.iID = ID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `REPORT_CARD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` PROCEDURE `REPORT_CARD`(IN IDs char(6))
begin
	select * from Student
    join Grade on Student.sID = Grade.sID
    join Course on Grade.cID = Course.cID
    where Student.sID =IDs;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `STUDENT_BY_DEPARTMENT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project`@`%` PROCEDURE `STUDENT_BY_DEPARTMENT`(IN deptID varchar(10))
begin
	select * from Student
    join Department on Department.dID = Student.dID
    where Student.dID = deptID;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 22:43:52
