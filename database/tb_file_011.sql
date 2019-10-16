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

-- Dumping structure for table hotel_db1.admin_app_userrole
CREATE TABLE IF NOT EXISTS `admin_app_userrole` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(200) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.admin_app_userrole: ~2 rows (approximately)
/*!40000 ALTER TABLE `admin_app_userrole` DISABLE KEYS */;
INSERT INTO `admin_app_userrole` (`role_id`, `role_name`) VALUES
	(1, 'admin'),
	(2, 'manager');
/*!40000 ALTER TABLE `admin_app_userrole` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.admin_app_usersignup
CREATE TABLE IF NOT EXISTS `admin_app_usersignup` (
  `user_email` varchar(200) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `otp` varchar(200) DEFAULT NULL,
  `otp_time` varchar(200) DEFAULT NULL,
  `token` varchar(200) DEFAULT NULL,
  `user_address` varchar(500) DEFAULT NULL,
  `user_age` varchar(10) DEFAULT NULL,
  `user_fullname` varchar(200) DEFAULT NULL,
  `user_mobile` varchar(200) DEFAULT NULL,
  `user_password` varchar(200) DEFAULT NULL,
  `user_state` varchar(200) DEFAULT NULL,
  `verify_link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_email`),
  KEY `admin_app_usersignup_role_id_5fb8bc71_fk_admin_app` (`role_id`),
  CONSTRAINT `admin_app_usersignup_role_id_5fb8bc71_fk_admin_app` FOREIGN KEY (`role_id`) REFERENCES `admin_app_userrole` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.admin_app_usersignup: ~3 rows (approximately)
/*!40000 ALTER TABLE `admin_app_usersignup` DISABLE KEYS */;
INSERT INTO `admin_app_usersignup` (`user_email`, `role_id`, `is_active`, `is_verified`, `otp`, `otp_time`, `token`, `user_address`, `user_age`, `user_fullname`, `user_mobile`, `user_password`, `user_state`, `verify_link`) VALUES
	('amitmadaan9595@gmail.com', 2, 1, 1, 'j7012i7012q', '2019-10-15 14:44:50.694162', '', 'mohan nagar', '20', 'amit madaan', '2233', 'pbkdf2_sha256$100000$xyx44Mv5Nice$41xzDZYeJUneZMR502SUCy5sky9GdxXzWgZ8YuU6tlc=', 'kkr', ''),
	('basantitickoo59901@gmail.com', 1, 1, 1, 'w47082w47082x', '2019-10-13 15:10:12.008658', '', 'Roopnagar enclave lane no 2B hno9c', '22', 'sheikha Tickoo', '9149612720', 'pbkdf2_sha256$100000$31886Ai66gkr$9dSeMDjTuD7QXSxJbpL8zMI7p88v3AlBNXx287N0l8U=', 'J&K', ''),
	('madaanamit367@gmail.com', 1, 1, 1, 'Z93587y93587F', '2019-10-15 14:33:20.727549', '', 'mohan nagar', '20', 'amit madaan', '2233', 'pbkdf2_sha256$100000$2WYRu6spTzxe$FLwmw0LW9Y/j8aYA+O82eKSch00JfAJ0cXPQc0QQNBs=', 'kkr', '');
/*!40000 ALTER TABLE `admin_app_usersignup` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_group: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_group_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_permission: ~24 rows (approximately)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can add permission', 2, 'add_permission'),
	(5, 'Can change permission', 2, 'change_permission'),
	(6, 'Can delete permission', 2, 'delete_permission'),
	(7, 'Can add group', 3, 'add_group'),
	(8, 'Can change group', 3, 'change_group'),
	(9, 'Can delete group', 3, 'delete_group'),
	(10, 'Can add user', 4, 'add_user'),
	(11, 'Can change user', 4, 'change_user'),
	(12, 'Can delete user', 4, 'delete_user'),
	(13, 'Can add content type', 5, 'add_contenttype'),
	(14, 'Can change content type', 5, 'change_contenttype'),
	(15, 'Can delete content type', 5, 'delete_contenttype'),
	(16, 'Can add session', 6, 'add_session'),
	(17, 'Can change session', 6, 'change_session'),
	(18, 'Can delete session', 6, 'delete_session'),
	(19, 'Can add user role', 7, 'add_userrole'),
	(20, 'Can change user role', 7, 'change_userrole'),
	(21, 'Can delete user role', 7, 'delete_userrole'),
	(22, 'Can add user signup', 8, 'add_usersignup'),
	(23, 'Can change user signup', 8, 'change_usersignup'),
	(24, 'Can delete user signup', 8, 'delete_usersignup');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_user: ~1 rows (approximately)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$100000$dKzxMFSUqdEe$h/cTTA1lgByhslKvYoqSoXH7XqbAJeODhcOTq+rNjBA=', '2019-10-14 12:39:11', 1, 'sheikhatickoo', '', '', 'sheikhatickoo9@gmail.com', 1, 1, '2019-10-02 14:49:08');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_user_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.auth_user_user_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.django_admin_log: ~1 rows (approximately)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-10-14 12:39:48', '2', 'manager', 1, '[{"added": {}}]', 9, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.django_content_type: ~9 rows (approximately)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(9, 'admin_app', 'userrole'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'Myuserapp', 'userrole'),
	(8, 'Myuserapp', 'usersignup'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.django_migrations: ~24 rows (approximately)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'Myuserapp', '0001_initial', '2019-10-04 06:07:44'),
	(2, 'Myuserapp', '0002_usersignup', '2019-10-04 06:07:44'),
	(3, 'Myuserapp', '0003_auto_20191004_0932', '2019-10-04 06:07:45'),
	(4, 'Myuserapp', '0004_auto_20191004_0942', '2019-10-04 06:07:45'),
	(5, 'Myuserapp', '0005_usersignup_usertoken', '2019-10-04 06:07:46'),
	(6, 'contenttypes', '0001_initial', '2019-10-04 06:07:46'),
	(7, 'auth', '0001_initial', '2019-10-04 06:07:48'),
	(8, 'admin', '0001_initial', '2019-10-04 06:07:49'),
	(9, 'admin', '0002_logentry_remove_auto_add', '2019-10-04 06:07:49'),
	(10, 'contenttypes', '0002_remove_content_type_name', '2019-10-04 06:07:49'),
	(11, 'auth', '0002_alter_permission_name_max_length', '2019-10-04 06:07:50'),
	(12, 'auth', '0003_alter_user_email_max_length', '2019-10-04 06:07:50'),
	(13, 'auth', '0004_alter_user_username_opts', '2019-10-04 06:07:50'),
	(14, 'auth', '0005_alter_user_last_login_null', '2019-10-04 06:07:50'),
	(15, 'auth', '0006_require_contenttypes_0002', '2019-10-04 06:07:50'),
	(16, 'auth', '0007_alter_validators_add_error_messages', '2019-10-04 06:07:50'),
	(17, 'auth', '0008_alter_user_username_max_length', '2019-10-04 06:07:50'),
	(18, 'auth', '0009_alter_user_last_name_max_length', '2019-10-04 06:07:51'),
	(19, 'sessions', '0001_initial', '2019-10-04 06:07:51'),
	(20, 'admin_app', '0001_initial', '2019-10-14 03:46:16'),
	(21, 'admin_app', '0002_usersignup', '2019-10-14 03:46:17'),
	(22, 'admin_app', '0003_auto_20191004_0932', '2019-10-14 03:46:18'),
	(23, 'admin_app', '0004_auto_20191004_0942', '2019-10-14 03:46:18'),
	(24, 'admin_app', '0005_usersignup_usertoken', '2019-10-14 03:46:18');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.django_session: ~36 rows (approximately)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('2756c9bw1csa02ufynlqg54p2caajg1u', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 04:55:06'),
	('31kiowvheo6h3zw40v0q5u5qmzbpqqqf', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-15 03:30:19'),
	('3si3y6fx01qcd45owuqx4ew0g1b4p7pu', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 04:52:34'),
	('4wdxh8onf53fbj2tofk2psiyr2y6v6pm', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-14 14:18:59'),
	('4ykgn5d1el0vqlxha8c69t22fw9r7ybw', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 06:07:02'),
	('74jrc5dz359ks4gu6o8ccojjqam7cj2f', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 16:29:32'),
	('7kfcgnkd8xbern63raiuvtc4aftaeh9z', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 16:35:41'),
	('8x68p5ynz9fueuo25mt1qanoa2lnk3mg', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 05:41:01'),
	('9d4vbtdvd2zrfhk8uogor51xmgsc4p8q', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:26:14'),
	('e9pnsgwcu10830g6rc7086nb0i2rycyu', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-15 12:41:07'),
	('eb0b1ctfw5nq4pe9got0zgna3zfdxw2n', 'MmEyOTk5ZjA3NGJlNmUzMGMwMjBiNjhlY2ZjMzdiODFjOWE1OTlkNjp7InJvbGVfbmFtZSI6ImFkbWluIiwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoyLCJuYW1lIjoiYW1pdCBtYWRhYW4ifQ==', '2019-10-29 14:27:13'),
	('f3leg6zir4ia5h7adik5qecjx1cv7qgm', 'YWU2ZTY1NDg0MDQ2M2Y2MTQ4MDQ2MDAwYjUwYmUxZGUyNGY1NmMzYjp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6InNhaW5pbWFucmFqMDFAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 07:04:46'),
	('g9a4wurt5te45rfueh3iqsd7vzltmuu3', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:46:30'),
	('h69juhshdfprn8nknsy090rjq4no4vbg', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:46:30'),
	('ibk2bll9nfbuy9knqghyw3h6em3tv63x', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-15 12:28:47'),
	('ilr3t6swdmcptpat9sk0cuxyx13191em', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-14 15:28:30'),
	('iq5iugpwhez3kbbcgg4pbp4occzu0row', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 05:30:09'),
	('k2cvhiuyzvszfv1t7v634ehni5oyb5c7', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-14 15:44:13'),
	('m4kynb9coop8nw1umndu61x6o108tlv4', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 05:11:18'),
	('na77go2zei5nd03jki1jzbpjgfcdegun', 'MjA1YWVkMzE3N2VmMmM5ZThkMGIxNjI5OWZjYjJjMWQzNDhkOWZmMzp7InJvbGVfbmFtZSI6ImFkbWluIiwidmVyaWZ5X2xpbmsiOiJsaW5rIiwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6ImFtaXRtYWRhYW45NTk1QGdtYWlsLmNvbSIsInJvbGVJZCI6MiwibmFtZSI6ImFtaXQgbWFkYWFuIn0=', '2019-10-29 19:57:30'),
	('oozo47mh0r4rj45os0axe9ilij7p4wna', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 05:22:01'),
	('qah27sj4fhj5ce4xwmvvfedexnruyxeg', 'YWRlNTIyM2ZjZTQxOGQ4ZWIyZTY2ZDBhYjliNmU2NDFiNzczMDc3NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2I4YzhmMjk1MDNmNTAxMmVkZDkzZDhhMzU3YjM4ZTI0MjExZWQ0IiwiQXV0aGVudGljYXRpb24iOnRydWUsImVtYWlsIjoiYW1pdG1hZGFhbjk1OTVAZ21haWwuY29tIiwicm9sZUlkIjoyfQ==', '2019-10-12 04:46:20'),
	('qswi7h5la17cf97qcbksob65xwa3ntkq', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 04:48:24'),
	('rfso2o1rfr0vssrhyrju8dooxo7mwown', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:39:56'),
	('rla5ayoroofgzwompshoedec4k80967b', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-14 15:59:46'),
	('rupysc6k16qi1hexw9bmtbzm1kzthktl', 'ZDRjNTE2ZDI3ZjM4MjQ2NmRmMThkZDM2OTM2OGJjMGM4N2ZmMTczZDp7InJvbGVfbmFtZSI6InN1cGVydXNlciJ9', '2019-10-15 12:20:58'),
	('u5d1v5thmobvz26m2ul6k1kyc09je19k', 'ZjQyZGMyNmYyM2Y0OGVhOTVkMTcyYWM5Y2U3OTVjZjdjNmYzYWIxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlN2I4YzhmMjk1MDNmNTAxMmVkZDkzZDhhMzU3YjM4ZTI0MjExZWQ0In0=', '2019-10-14 12:44:48'),
	('ukb27t023vecatx5nr5tuwf4ictqqn8r', 'YWU2ZTY1NDg0MDQ2M2Y2MTQ4MDQ2MDAwYjUwYmUxZGUyNGY1NmMzYjp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6InNhaW5pbWFucmFqMDFAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 07:12:38'),
	('unq1s5rk3etjgyzr98irgerotif4szsb', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-14 14:30:02'),
	('up119udnsich4qj8tl1b2s1g3bcfqrxi', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 06:12:14'),
	('uzx4432e5j1bsk85vp1tjmy89vzz63gy', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:46:33'),
	('w5t2irrni6ijqucwu37hg6cxxyjs9szs', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:44:39'),
	('yumyc0ug0egtkq78x2yt00wngg2ovaej', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 16:46:28'),
	('yx11koyub69ejr6qpgur15umjts4mnhg', 'OWVlYzM4YWViYTJlNmM1MjE4MDZkY2E1NTgxNTA0YjgxYWJjOThiYTp7IkF1dGhlbnRpY2F0aW9uIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxfQ==', '2019-10-12 05:35:36'),
	('zltdkq9l99tscgmy1gi03p2cgkovx4ec', 'YjRlZGY5NjU3MTk4MmQwYmNkOWY3MTY0Zjc3MDI5ODVmYWNkZjJjNTp7InJvbGVfbmFtZSI6ImFkbWluIiwidmVyaWZ5X2xpbmsiOiJsaW5rIiwiYXV0aGVudGljYXRlIjp0cnVlLCJlbWFpbCI6Im1hZGFhbmFtaXQzNjdAZ21haWwuY29tIiwicm9sZUlkIjoxLCJuYW1lIjoiYW1pdCBtYWRhYW4ifQ==', '2019-10-29 19:00:34'),
	('zzubgkpfbh8a6lbvhfr7gezzg62uqng9', 'YWQ2MDQzNzgyYzc0YWZjNDE4ZDNhMmU1OGE4YzFhZmMyNDU1NWU0ZTp7fQ==', '2019-10-12 04:59:52');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.myuserapp_userrole
CREATE TABLE IF NOT EXISTS `myuserapp_userrole` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(200) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.myuserapp_userrole: ~2 rows (approximately)
/*!40000 ALTER TABLE `myuserapp_userrole` DISABLE KEYS */;
INSERT INTO `myuserapp_userrole` (`roleId`, `roleName`, `isActive`) VALUES
	(1, 'manager', 1),
	(2, 'customers', 1);
/*!40000 ALTER TABLE `myuserapp_userrole` ENABLE KEYS */;

-- Dumping structure for table hotel_db1.myuserapp_usersignup
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
  `usertoken` varchar(200) NOT NULL,
  PRIMARY KEY (`userEmail`),
  KEY `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` (`roleId_id`),
  CONSTRAINT `Myuserapp_usersignup_roleId_id_4e992217_fk_Myuserapp` FOREIGN KEY (`roleId_id`) REFERENCES `myuserapp_userrole` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table hotel_db1.myuserapp_usersignup: ~8 rows (approximately)
/*!40000 ALTER TABLE `myuserapp_usersignup` DISABLE KEYS */;
INSERT INTO `myuserapp_usersignup` (`userFullName`, `userEmail`, `userPassword`, `userMobile`, `userAge`, `userAddress`, `userState`, `isActive`, `roleId_id`, `isverified`, `otpcolumn`, `otpconfirmation`, `otptime`, `usertoken`) VALUES
	('goru', 'AMITMADAA', 'pbkdf2_sha256$100000$qzyM4bcJD62R$f2IuBBdsbdParf0ba5KI/s0uk/lxd2XcbvDzr0aXsjM=', '', '', '', '', 1, 2, 0, 'P64643S64643p', ' http://127.0.0.1:8000/verifyuser/?email=AMITMADAA&token=pbkdf2_sha256$100000$5sGlrpOlklTb$jItA1MAtsvSbxqhOxYrTOOqpKq9wvU/vkwjGHiSaN4w=', '2019-10-10 06:33:52.871467', 'pbkdf2_sha256$100000$5sGlrpOlklTb$jItA1MAtsvSbxqhOxYrTOOqpKq9wvU/vkwjGHiSaN4w='),
	('goru', 'amitmadaan9595@gmail.com', 'pbkdf2_sha256$100000$i1I0AL8NLdN7$HIMbnA3c1SwisuEiTnl6bq41Tsg8wEss6X6PD0xQEQg=', '2233', '20', 'mohan nagar', 'kkr', 1, 2, 1, '', '', '2019-10-10 08:01:05.723292', ''),
	('goru', 'amitmadaan9595@gmail.comm', 'pbkdf2_sha256$100000$eHSoAhJ23Ndn$xbpDuf7eQo1ZTWyXNbGDisTzFPys7NxmHrkQ/M0ffeM=', '2233', '20', 'mohan nagar', 'kkr', 1, 2, 0, 'M55921r55921h', ' http://127.0.0.1:8000/verifyuser/?email=amitmadaan9595@gmail.comm&token=pbkdf2_sha256$100000$KCPkB5g7MUob$/XKEBbCnr7F0qpxr0KYPgP4Tu9UNCmmGCe/ZcSGlbw=', '2019-10-10 06:34:36.291236', 'pbkdf2_sha256$100000$KCPkB5g7MUob$/XKEBbCnr7F0qpxr0KYPgP4Tu9UNCmmGCe/ZcSGlbw='),
	('amit madaan', 'm', 'pbkdf2_sha256$100000$EUYdRA1NfaH2$BsutuUNeTIndGnlWO0W95zuOs4nZs6FxmdTei8Jj9s8=', '', '', '', '', 1, 2, 0, 'W18107z18107Q', ' http://127.0.0.1:8000/verifyuser/?email=m&token=pbkdf2_sha256$100000$diECXVanGkQ4$ZrlnW9zdxHHy1UnMFiJrovkU2/UwLdBXjgL0FLl2es=', '2019-10-10 06:40:46.921004', 'pbkdf2_sha256$100000$diECXVanGkQ4$ZrlnW9zdxHHy1UnMFiJrovkU2/UwLdBXjgL0FLl2es='),
	('amit madaan', 'madaanamit367@gmail.com', 'pbkdf2_sha256$100000$NxCtO82I51Lr$SC8Z0yOxw8GhmiP33HiwRNsbvF+laRPovAqCIODaxhU=', '2233', '20', 'mohan nagar', 'kkr', 1, 1, 1, '', '', '2019-10-12 01:07:39.640768', ''),
	('RAJAN', 'sainimanraj01@gmail.com', 'pbkdf2_sha256$100000$HG751BikZr4W$nawwWGodVc1z2SBVTwvVhOPygUZIM9Z2mr0kvnvm3WE=', '2233', '20', 'mohan nagar', 'kkr', 1, 1, 1, '', '', '2019-10-12 12:19:36.040264', ''),
	('vishal', 'vshal55@gmail.com', '46566565', '2233', '21', 'punjab', 'punjab', 1, 1, 0, '12028', ' http://127.0.0.1:8000/verifyuser/?email=vshal55@gmail.com&token=12028', '2019-10-04 08:44:27.319104', '12028'),
	('vishal', 'yatin.soni.35@gmail.com', '46566565', '2233', '20', 'prem str', 'punjab', 1, 1, 0, '24874', ' http://127.0.0.1:8000/verifyuser/?email=yatin.soni.35@gmail.com&token=24874', '2019-10-04 11:18:43.289807', '24874');
/*!40000 ALTER TABLE `myuserapp_usersignup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
