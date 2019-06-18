-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: BMS
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Table structure for table `BasicInfoBooks`
--

DROP TABLE IF EXISTS `BasicInfoBooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BasicInfoBooks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) NOT NULL COMMENT '图书编号',
  `CategoryNumber` varchar(45) NOT NULL COMMENT '类别编号',
  `Name` varchar(45) NOT NULL COMMENT '图书名称',
  `Author` varchar(45) DEFAULT NULL COMMENT '作者',
  `Translator` varchar(45) DEFAULT NULL COMMENT '译者',
  `Press` varchar(45) DEFAULT NULL COMMENT '出版社',
  `Price` varchar(45) DEFAULT NULL COMMENT '价格',
  `PublicationTime` date DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Number_UNIQUE` (`Number`),
  KEY `Category_idx` (`CategoryNumber`),
  CONSTRAINT `Category` FOREIGN KEY (`CategoryNumber`) REFERENCES `BookCategorys` (`Number`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BasicInfoBooks`
--

LOCK TABLES `BasicInfoBooks` WRITE;
/*!40000 ALTER TABLE `BasicInfoBooks` DISABLE KEYS */;
INSERT INTO `BasicInfoBooks` VALUES (1,'A100-01','A','123','znb','znb','znb','50','2019-11-19');
/*!40000 ALTER TABLE `BasicInfoBooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookBorrowings`
--

DROP TABLE IF EXISTS `BookBorrowings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookBorrowings` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `BookBarcode` varchar(45) NOT NULL COMMENT '图书条形码',
  `ReaderNumber` varchar(45) NOT NULL COMMENT '读者编号',
  `BorrowingDate` date NOT NULL COMMENT '借阅日期',
  `ReturnDate` date DEFAULT NULL COMMENT '归还日期',
  `OperatorNumber` varchar(45) NOT NULL COMMENT '操作员编号',
  `Arrears` double NOT NULL,
  `Paid` bit(1) NOT NULL,
  `SendBack` bit(1) NOT NULL COMMENT '是否归还',
  PRIMARY KEY (`Id`),
  KEY `BookBorrowings_ReaderNumber_idx` (`ReaderNumber`),
  KEY `BookBorrowings_OperatorNumber_idx` (`OperatorNumber`),
  KEY `BookBorrowings_BarCode_idx` (`BookBarcode`),
  CONSTRAINT `BookBorrowings_BooKBarCode` FOREIGN KEY (`BookBarcode`) REFERENCES `Books` (`Barcode`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `BookBorrowings_OperatorNumber` FOREIGN KEY (`OperatorNumber`) REFERENCES `Operators` (`Number`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `BookBorrowings_ReaderNumber` FOREIGN KEY (`ReaderNumber`) REFERENCES `Readers` (`Number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookBorrowings`
--

LOCK TABLES `BookBorrowings` WRITE;
/*!40000 ALTER TABLE `BookBorrowings` DISABLE KEYS */;
/*!40000 ALTER TABLE `BookBorrowings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BookCategorys`
--

DROP TABLE IF EXISTS `BookCategorys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BookCategorys` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) NOT NULL COMMENT '类别编号',
  `Name` varchar(45) NOT NULL COMMENT '类别名称',
  `BorrowableDays` int(11) NOT NULL COMMENT '可借天数',
  `FinesAmount` double NOT NULL COMMENT '罚款金额',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `new_tablecol_UNIQUE` (`Number`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BookCategorys`
--

LOCK TABLES `BookCategorys` WRITE;
/*!40000 ALTER TABLE `BookCategorys` DISABLE KEYS */;
INSERT INTO `BookCategorys` VALUES (1,'A','马克思主义、列宁主义、毛泽东思想、邓小平理论',5,0.2);
/*!40000 ALTER TABLE `BookCategorys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Books`
--

DROP TABLE IF EXISTS `Books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Books` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Barcode` varchar(45) NOT NULL,
  `BasicNumber` varchar(45) NOT NULL,
  `State` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Barcode_UNIQUE` (`Barcode`),
  KEY `fk_Books_1_idx` (`BasicNumber`),
  CONSTRAINT `Books_BasicNumber` FOREIGN KEY (`BasicNumber`) REFERENCES `BasicInfoBooks` (`Number`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Books`
--

LOCK TABLES `Books` WRITE;
/*!40000 ALTER TABLE `Books` DISABLE KEYS */;
/*!40000 ALTER TABLE `Books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Operators`
--

DROP TABLE IF EXISTS `Operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operators` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) NOT NULL COMMENT '编号',
  `Name` varchar(45) NOT NULL COMMENT '名字',
  `Sex` varchar(45) DEFAULT NULL COMMENT '性别',
  `Age` int(11) DEFAULT NULL COMMENT '性别',
  `IdNumber` varchar(45) NOT NULL COMMENT '身份证号',
  `WorkDate` date NOT NULL COMMENT '工作日期',
  `Telephone` varchar(45) DEFAULT NULL COMMENT '电话',
  `IsAdmin` bit(1) NOT NULL COMMENT '是否为管理员',
  `PassWord` varchar(45) NOT NULL COMMENT '密码',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Number_UNIQUE` (`Number`),
  UNIQUE KEY `IdNumber_UNIQUE` (`IdNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Operators`
--

LOCK TABLES `Operators` WRITE;
/*!40000 ALTER TABLE `Operators` DISABLE KEYS */;
INSERT INTO `Operators` VALUES (1,'Admin','管理员','男',25,'522222111133330022','2018-11-19','12215698520',_binary '','123456');
/*!40000 ALTER TABLE `Operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Readers`
--

DROP TABLE IF EXISTS `Readers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Readers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Number` varchar(45) NOT NULL COMMENT '姓名',
  `Name` varchar(45) NOT NULL COMMENT '姓名',
  `Sex` varchar(45) DEFAULT NULL COMMENT '性别',
  `Age` varchar(45) DEFAULT NULL COMMENT '年龄',
  `Telephone` varchar(45) DEFAULT NULL COMMENT '电话',
  `Deposit` double DEFAULT NULL COMMENT '押金',
  `Birthday` date DEFAULT NULL COMMENT '生日',
  `Occupation` varchar(45) DEFAULT NULL COMMENT '职业',
  `IdType` varchar(45) DEFAULT NULL COMMENT '证件类型',
  `CertificationDate` date DEFAULT NULL COMMENT '办证日期',
  `MaxNumber` int(11) NOT NULL COMMENT '最大借书数量',
  `IdNumber` varchar(45) NOT NULL COMMENT '证件号码',
  `PassWord` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Number_UNIQUE` (`Number`),
  UNIQUE KEY `IdNumber_UNIQUE` (`IdNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Readers`
--

LOCK TABLES `Readers` WRITE;
/*!40000 ALTER TABLE `Readers` DISABLE KEYS */;
INSERT INTO `Readers` VALUES (1,'20164089145','张南彬','男','22','13312498600',100,'1998-11-19','学生','身份证','2016-09-01',20,'522325000000000000','');
/*!40000 ALTER TABLE `Readers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-19  5:17:11
