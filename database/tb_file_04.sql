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



 
 Drop table myuserapp_usersignup
/**Dumping structure for table hotel_db1.myuserapp_usersignup
CREATE TABLE IF NOT EXISTS `myuserapp_usersignup` (
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
  PRIMARY KEY (`userEmail`),
  KEY `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` (`roleId_id`),
  CONSTRAINT `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` FOREIGN KEY (`roleId_id`) REFERENCES `myuserapp_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;*/

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
