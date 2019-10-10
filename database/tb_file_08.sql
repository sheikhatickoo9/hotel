-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.48 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5222
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for hotel_db1
CREATE DATABASE IF NOT EXISTS `hotel_db1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `hotel_db1`;

-- Dumping structure for table hotel_db1.myuserapp_usersignup
hotel_db1myuserapp_usersignupCREATE TABLE IF NOT EXISTS `myuserapp_usersignup` (
  `userFullName` varchar(200) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPassword` varchar(200) NOT NULL,
  `userMobile` varchar(200) NOT NULL,
  `userAge` varchar(10) NOT NULL,
  `userAddress` varchar(500) NOT NULL,
  `userState` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `roleId_id` int(11) NOT NULL,
  `isverified` tinyint(1) NOT NULL,
  `otpcolumn` varchar(200) NOT NULL,
  `otpconfirmation` varchar(200) NOT NULL,
  `otptime` varchar(200) NOT NULL,
  `usertoken` varchar(200) NOT NULL,
  PRIMARY KEY (`userEmail`),
  KEY `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` (`roleId_id`),
  CONSTRAINT `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` FOREIGN KEY (`roleId_id`) REFERENCES `myuserapp_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.myuserapp_usersignup: ~2 rows (approximately)
/*!40000 ALTER TABLE `myuserapp_usersignup` DISABLE KEYS */;
INSERT INTO `myuserapp_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userAge`, `userAddress`, `userState`, `isActive`, `roleId_id`, `isverified`, `otpcolumn`, `otpconfirmation`, `otptime`, `usertoken`) VALUES
	('amit madaan', 'madaanamit367@gmail.com', '233', '2233', '20', 'mohan nagar', 'kkr', 1, 1, 0, '92642', ' http://127.0.0.1:8000/verifyuser/?email=madaanamit367@gmail.com&token=92642', '2019-10-04 04:40:15.309398', ''),
	('vishal', 'vshal55@gmail.com', '46566565', '789632541', '21', 'prem str', 'punjab', 1, 1, 0, '72043', ' http://127.0.0.1:8000/verifyuser/?email=vshal55@gmail.com&token=72043', '2019-10-04 04:44:22.241827', '');
/*!40000 ALTER TABLE `myuserapp_usersignup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
