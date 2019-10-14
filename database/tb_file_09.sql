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

-- Dumping data for table hotel_db1.admin_app_userrole: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin_app_userrole` DISABLE KEYS */;
INSERT INTO `admin_app_userrole` (`role_id`, `role_name`) VALUES
	(1, 'admin');
/*!40000 ALTER TABLE `admin_app_userrole` ENABLE KEYS */;

-- Dumping data for table hotel_db1.admin_app_usersignup: ~1 rows (approximately)
/*!40000 ALTER TABLE `admin_app_usersignup` DISABLE KEYS */;
INSERT INTO `admin_app_usersignup` (`user_email`, `role_id`, `is_active`, `is_verified`, `otp`, `otp_time`, `token`, `user_address`, `user_age`, `user_fullname`, `user_mobile`, `user_password`, `user_state`, `verify_link`) VALUES
	('basantitickoo59901@gmail.com', 1, 1, 1, 'w47082w47082x', '2019-10-13 15:10:12.008658', '', 'Roopnagar enclave lane no 2B hno9c', '22', 'sheikha Tickoo', '9149612720', 'pbkdf2_sha256$100000$31886Ai66gkr$9dSeMDjTuD7QXSxJbpL8zMI7p88v3AlBNXx287N0l8U=', 'J&K', '');
/*!40000 ALTER TABLE `admin_app_usersignup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
