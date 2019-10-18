-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for new_hotel_db
CREATE DATABASE IF NOT EXISTS `new_hotel_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `new_hotel_db`;

-- Dumping structure for table new_hotel_db.staff_add_staff
CREATE TABLE IF NOT EXISTS `staff_add_staff` (
  `Fullname` varchar(200) NOT NULL,
  `Email` varchar(200) NOT NULL,
  `Phone_number` varchar(200) NOT NULL,
  `Address` varchar(200) NOT NULL,
  `Post` varchar(200) NOT NULL,
  `Salary` varchar(200) NOT NULL,
  `Age` varchar(10) NOT NULL,
  `Dept_id_id` int(11) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `staff_add_staff_Dept_id_id_9b3625be_fk_staff_department_Dept_id` (`Dept_id_id`),
  CONSTRAINT `staff_add_staff_Dept_id_id_9b3625be_fk_staff_department_Dept_id` FOREIGN KEY (`Dept_id_id`) REFERENCES `staff_department` (`Dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table new_hotel_db.staff_add_staff: ~0 rows (approximately)
/*!40000 ALTER TABLE `staff_add_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_add_staff` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
new_hotel_db