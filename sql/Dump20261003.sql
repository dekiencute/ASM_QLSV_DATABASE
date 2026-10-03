-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: qlsv
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '06703e6e-ac4b-11f1-a0e8-7a8c4fe79845:1-112';

--
-- Table structure for table `diem`
--

DROP TABLE IF EXISTS `diem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diem` (
  `ma_sinh_vien` int NOT NULL,
  `ma_mon` int NOT NULL,
  `ma_hoc_ky` int NOT NULL,
  `ma_giang_vien` int NOT NULL,
  `diem` decimal(4,2) NOT NULL,
  PRIMARY KEY (`ma_sinh_vien`,`ma_mon`,`ma_hoc_ky`),
  KEY `ma_mon` (`ma_mon`),
  KEY `ma_hoc_ky` (`ma_hoc_ky`),
  KEY `ma_giang_vien` (`ma_giang_vien`),
  KEY `idx_diem_ma_sinhvien` (`ma_sinh_vien`),
  CONSTRAINT `diem_ibfk_1` FOREIGN KEY (`ma_sinh_vien`) REFERENCES `sinhvien` (`ma_sinh_vien`),
  CONSTRAINT `diem_ibfk_2` FOREIGN KEY (`ma_mon`) REFERENCES `monhoc` (`ma_mon`),
  CONSTRAINT `diem_ibfk_3` FOREIGN KEY (`ma_hoc_ky`) REFERENCES `hocky` (`ma_hoc_ky`),
  CONSTRAINT `diem_ibfk_4` FOREIGN KEY (`ma_giang_vien`) REFERENCES `giangvien` (`ma_giang_vien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diem`
--

LOCK TABLES `diem` WRITE;
/*!40000 ALTER TABLE `diem` DISABLE KEYS */;
INSERT INTO `diem` VALUES (1001,1,1,1,8.50),(1001,2,1,2,7.50),(1001,3,2,3,9.00),(1001,4,2,4,8.00),(1002,1,1,1,9.00),(1002,2,1,2,8.50),(1002,3,2,3,8.00),(1002,4,2,4,7.50),(1003,1,1,1,6.50),(1003,2,1,2,7.00),(1003,3,2,3,7.50),(1003,4,2,4,6.00),(1004,1,1,1,8.00),(1004,2,1,2,9.00),(1004,3,2,3,8.50),(1004,4,2,4,8.00),(1005,1,1,1,7.00),(1005,2,1,2,6.50),(1005,3,2,3,7.00),(1006,1,1,1,9.50),(1006,2,1,2,8.50),(1006,3,2,3,9.00),(1007,6,1,3,8.00),(1007,7,2,4,7.50),(1008,6,1,3,9.00),(1008,7,2,8,8.50),(1009,8,1,5,7.50),(1010,6,1,3,8.50),(1010,7,2,5,9.00);
/*!40000 ALTER TABLE `diem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giangvien`
--

DROP TABLE IF EXISTS `giangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `giangvien` (
  `ma_giang_vien` int NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `so_dien_thoai` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ma_giang_vien`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `so_dien_thoai` (`so_dien_thoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giangvien`
--

LOCK TABLES `giangvien` WRITE;
/*!40000 ALTER TABLE `giangvien` DISABLE KEYS */;
INSERT INTO `giangvien` VALUES (1,'Nguyen Van Thanh','thanh.nguyen@example.com','0901000001'),(2,'Tran Minh Duc','duc.tran@example.com','0901000002'),(3,'Le Thi Huong','huong.le@example.com','0901000003'),(4,'Pham Quoc Bao','bao.pham@example.com','0901000004'),(5,'Hoang Thu Trang','trang.hoang@example.com','0901000005'),(6,'Nguyen Thi Lan','lan.nguyen@example.com','0901000006'),(7,'Pham Minh Quan','quan.pham@example.com','0901000007'),(8,'Tran Hoai Nam','nam.tran@example.com','0901000008'),(9,'Le Ngoc Anh','anh.le@example.com','0901000009'),(10,'Do Thi Hoa','hoa.do@example.com','0901000010');
/*!40000 ALTER TABLE `giangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hocky`
--

DROP TABLE IF EXISTS `hocky`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hocky` (
  `ma_hoc_ky` int NOT NULL,
  `ten_hoc_ky` varchar(50) NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  PRIMARY KEY (`ma_hoc_ky`),
  UNIQUE KEY `ten_hoc_ky` (`ten_hoc_ky`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hocky`
--

LOCK TABLES `hocky` WRITE;
/*!40000 ALTER TABLE `hocky` DISABLE KEYS */;
INSERT INTO `hocky` VALUES (1,'Hoc ky 1 2025-2026','2025-09-01','2026-01-15'),(2,'Hoc ky 2 2025-2026','2026-02-01','2026-06-15'),(3,'Hoc ky 3 2025-2026','2026-06-20','2026-08-15');
/*!40000 ALTER TABLE `hocky` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `ma_khoa` int NOT NULL,
  `ten_khoa` varchar(100) NOT NULL,
  PRIMARY KEY (`ma_khoa`),
  UNIQUE KEY `ten_khoa` (`ten_khoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Công nghệ thông tin'),(9,'Kinh doanh quốc tế'),(5,'Lập Trình Game'),(4,'Ngôn ngữ Anh'),(8,'Ngôn ngũ Nga'),(10,'Ngôn ngữ Pháp'),(7,'Ngôn ngữ Trung'),(6,'Quản Trị Du Lịch'),(2,'Quản trị kinh doanh'),(3,'Tài chính - Ngân hàng');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lop`
--

DROP TABLE IF EXISTS `lop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lop` (
  `ma_lop` int NOT NULL,
  `ten_lop` varchar(50) NOT NULL,
  `nam_hoc` int NOT NULL,
  `ma_khoa` int NOT NULL,
  PRIMARY KEY (`ma_lop`),
  UNIQUE KEY `ten_lop` (`ten_lop`),
  KEY `ma_khoa` (`ma_khoa`),
  CONSTRAINT `lop_ibfk_1` FOREIGN KEY (`ma_khoa`) REFERENCES `khoa` (`ma_khoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lop`
--

LOCK TABLES `lop` WRITE;
/*!40000 ALTER TABLE `lop` DISABLE KEYS */;
INSERT INTO `lop` VALUES (101,'CNTT01',2024,1),(102,'CNTT02',2024,1),(103,'CNTT03',2025,1),(201,'QTKD01',2024,2),(301,'TCNH01',2024,3),(401,'NNA01',2025,4),(501,'LTG01',2025,5),(601,'QTDL01',2024,6),(701,'NNT01',2024,7),(702,'NNT02',2025,7),(801,'NNN01',2024,8);
/*!40000 ALTER TABLE `lop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monhoc`
--

DROP TABLE IF EXISTS `monhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monhoc` (
  `ma_mon` int NOT NULL,
  `ten_mon` varchar(100) NOT NULL,
  `so_tin_chi` int NOT NULL,
  PRIMARY KEY (`ma_mon`),
  UNIQUE KEY `ten_mon` (`ten_mon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monhoc`
--

LOCK TABLES `monhoc` WRITE;
/*!40000 ALTER TABLE `monhoc` DISABLE KEYS */;
INSERT INTO `monhoc` VALUES (1,'Co so du lieu',3),(2,'Lap trinh Java',3),(3,'Lap trinh Web',3),(4,'Mang may tinh',3),(5,'Cau truc du lieu va giai thuat',4),(6,'Quan tri hoc',3),(7,'Marketing can ban',3),(8,'Tai chinh doanh nghiep',3),(9,'Kinh te hoc',3),(10,'Triet Hoc Mac Lenin',4);
/*!40000 ALTER TABLE `monhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinhvien`
--

DROP TABLE IF EXISTS `sinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinhvien` (
  `ma_sinh_vien` int NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `gioi_tinh` varchar(10) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ma_lop` int NOT NULL,
  PRIMARY KEY (`ma_sinh_vien`),
  UNIQUE KEY `email` (`email`),
  KEY `idx_sinhvien_ma_lop` (`ma_lop`),
  CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`ma_lop`) REFERENCES `lop` (`ma_lop`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinhvien`
--

LOCK TABLES `sinhvien` WRITE;
/*!40000 ALTER TABLE `sinhvien` DISABLE KEYS */;
INSERT INTO `sinhvien` VALUES (1001,'Nguyen Van An','2006-03-15','Nam','an.nguyen@example.com',101),(1002,'Tran Thi Binh','2006-07-21','Nu','binh.tran@example.com',101),(1003,'Le Hoang Cuong','2006-11-02','Nam','cuong.le@example.com',102),(1004,'Pham Minh Chau','2006-05-18','Nu','chau.pham@example.com',102),(1005,'Do Quang Huy','2007-01-10','Nam','huy.do@example.com',103),(1006,'Nguyen Thu Ha','2007-09-25','Nu','ha.nguyen@example.com',103),(1007,'Vu Duc Long','2006-12-12','Nam','long.vu@example.com',201),(1008,'Hoang Ngoc Mai','2006-04-30','Nu','mai.hoang@example.com',201),(1009,'Bui Thanh Nam','2006-08-14','Nam','nam.bui@example.com',301),(1010,'Pham Yen Nhi','2007-02-20','Nu','nhi.pham@example.com',401);
/*!40000 ALTER TABLE `sinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_bang_diem_sinh_vien`
--

DROP TABLE IF EXISTS `vw_bang_diem_sinh_vien`;
/*!50001 DROP VIEW IF EXISTS `vw_bang_diem_sinh_vien`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_bang_diem_sinh_vien` AS SELECT 
 1 AS `ma_sinh_vien`,
 1 AS `ho_ten`,
 1 AS `ten_lop`,
 1 AS `ten_mon`,
 1 AS `ten_hoc_ky`,
 1 AS `giang_vien`,
 1 AS `diem`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_bang_diem_sinh_vien`
--

/*!50001 DROP VIEW IF EXISTS `vw_bang_diem_sinh_vien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_bang_diem_sinh_vien` AS select `sv`.`ma_sinh_vien` AS `ma_sinh_vien`,`sv`.`ho_ten` AS `ho_ten`,`l`.`ten_lop` AS `ten_lop`,`mh`.`ten_mon` AS `ten_mon`,`hk`.`ten_hoc_ky` AS `ten_hoc_ky`,`gv`.`ho_ten` AS `giang_vien`,`d`.`diem` AS `diem` from (((((`diem` `d` join `sinhvien` `sv` on((`d`.`ma_sinh_vien` = `sv`.`ma_sinh_vien`))) join `lop` `l` on((`sv`.`ma_lop` = `l`.`ma_lop`))) join `monhoc` `mh` on((`d`.`ma_mon` = `mh`.`ma_mon`))) join `hocky` `hk` on((`d`.`ma_hoc_ky` = `hk`.`ma_hoc_ky`))) join `giangvien` `gv` on((`d`.`ma_giang_vien` = `gv`.`ma_giang_vien`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-03 15:05:20
