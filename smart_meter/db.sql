/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.33 : Database - smart_meter
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`smart_meter` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `smart_meter`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add authority',7,'add_authority'),
(26,'Can change authority',7,'change_authority'),
(27,'Can delete authority',7,'delete_authority'),
(28,'Can view authority',7,'view_authority'),
(29,'Can add bill',8,'add_bill'),
(30,'Can change bill',8,'change_bill'),
(31,'Can delete bill',8,'delete_bill'),
(32,'Can view bill',8,'view_bill'),
(33,'Can add login',9,'add_login'),
(34,'Can change login',9,'change_login'),
(35,'Can delete login',9,'delete_login'),
(36,'Can view login',9,'view_login'),
(37,'Can add user',10,'add_user'),
(38,'Can change user',10,'change_user'),
(39,'Can delete user',10,'delete_user'),
(40,'Can view user',10,'view_user'),
(41,'Can add report_emergency',11,'add_report_emergency'),
(42,'Can change report_emergency',11,'change_report_emergency'),
(43,'Can delete report_emergency',11,'delete_report_emergency'),
(44,'Can view report_emergency',11,'view_report_emergency'),
(45,'Can add payment',12,'add_payment'),
(46,'Can change payment',12,'change_payment'),
(47,'Can delete payment',12,'delete_payment'),
(48,'Can view payment',12,'view_payment'),
(49,'Can add notification',13,'add_notification'),
(50,'Can change notification',13,'change_notification'),
(51,'Can delete notification',13,'delete_notification'),
(52,'Can view notification',13,'view_notification'),
(53,'Can add feedback',14,'add_feedback'),
(54,'Can change feedback',14,'change_feedback'),
(55,'Can delete feedback',14,'delete_feedback'),
(56,'Can view feedback',14,'view_feedback'),
(57,'Can add extra_usage',15,'add_extra_usage'),
(58,'Can change extra_usage',15,'change_extra_usage'),
(59,'Can delete extra_usage',15,'delete_extra_usage'),
(60,'Can view extra_usage',15,'view_extra_usage'),
(61,'Can add complaint',16,'add_complaint'),
(62,'Can change complaint',16,'change_complaint'),
(63,'Can delete complaint',16,'delete_complaint'),
(64,'Can view complaint',16,'view_complaint'),
(65,'Can add register',17,'add_register'),
(66,'Can change register',17,'change_register'),
(67,'Can delete register',17,'delete_register'),
(68,'Can view register',17,'view_register');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$uePt9JnRBpx8NVAkAr2tru$M4Zd80mDjEGiMqHQvhOJ5rlvqYBbeNOF2hY8eqxcCQ8=','2024-03-02 07:21:57.675581',1,'admin','','','admin@gmail.com',1,1,'2023-12-15 07:15:15.731320');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(6,'sessions','session'),
(7,'smartapp','authority'),
(8,'smartapp','bill'),
(16,'smartapp','complaint'),
(15,'smartapp','extra_usage'),
(14,'smartapp','feedback'),
(9,'smartapp','login'),
(13,'smartapp','notification'),
(12,'smartapp','payment'),
(17,'smartapp','register'),
(11,'smartapp','report_emergency'),
(10,'smartapp','user');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-10-15 06:43:07.512694'),
(2,'auth','0001_initial','2023-10-15 06:43:07.788646'),
(3,'admin','0001_initial','2023-10-15 06:43:07.883086'),
(4,'admin','0002_logentry_remove_auto_add','2023-10-15 06:43:07.883086'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-10-15 06:43:07.898714'),
(6,'contenttypes','0002_remove_content_type_name','2023-10-15 06:43:07.931634'),
(7,'auth','0002_alter_permission_name_max_length','2023-10-15 06:43:07.977943'),
(8,'auth','0003_alter_user_email_max_length','2023-10-15 06:43:08.010762'),
(9,'auth','0004_alter_user_username_opts','2023-10-15 06:43:08.010762'),
(10,'auth','0005_alter_user_last_login_null','2023-10-15 06:43:08.044346'),
(11,'auth','0006_require_contenttypes_0002','2023-10-15 06:43:08.058619'),
(12,'auth','0007_alter_validators_add_error_messages','2023-10-15 06:43:08.058619'),
(13,'auth','0008_alter_user_username_max_length','2023-10-15 06:43:08.104394'),
(14,'auth','0009_alter_user_last_name_max_length','2023-10-15 06:43:08.136960'),
(15,'auth','0010_alter_group_name_max_length','2023-10-15 06:43:08.152043'),
(16,'auth','0011_update_proxy_permissions','2023-10-15 06:43:08.167680'),
(17,'auth','0012_alter_user_first_name_max_length','2023-10-15 06:43:08.203883'),
(18,'sessions','0001_initial','2023-10-15 06:43:08.231867'),
(19,'smartapp','0001_initial','2023-10-15 06:43:08.659463'),
(20,'smartapp','0002_auto_20231007_1321','2023-10-15 06:43:08.707028'),
(21,'smartapp','0003_authority_designation','2023-12-09 07:36:41.537348'),
(22,'smartapp','0004_notification_status','2023-12-10 06:02:59.371271'),
(23,'smartapp','0005_auto_20240227_1057','2024-02-27 05:27:50.858311');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('4nyrd8868o8qia3kitmcdwublax1q70c','.eJxVjssOwiAUBf-FtSE8C7h0328gl8eVagNJaVfGf1eSLnR7ZjI5L-Lh2Is_et78ksiVcHL53QLEZ64DpAfUe6Ox1X1bAh0KPWmnc0t5vZ3uX6BALyMbHANrOTKODhygwYmbJLPFyNAlsMyoLJiNTKALEqVSAYUWWoccBX6j6_g3vT-1GjpQ:1rcNCn:2WSbEhLFv5qcuPLWopMnx3tn7zuNNBswXSFDmtcqu1Q','2024-03-05 10:18:29.729715'),
('ba2wpmn5dc5go6lw0dt2zuf4ko8lpgt1','.eJxVjsEOwiAQBf-FsyFAQcCjd7-BLLAr1QaS0p6M_64kPej1zWTyXizAvpWwd1zDnNmFSXb63SKkJ9YB8gPqvfHU6rbOkQ-FH7TzW8u4XA_3L1Cgl5GNXoBzkoQkDx7I0lnaPKGjJMhncMJqVMIlocjHiSatIymjjImYFH2jy_gn3x-1EDpL:1rE4Wn:f47ZLWWvKulAFxhvWFg_NgXISs4k-Dr0ZaoorP7X68k','2023-12-29 09:30:41.906623'),
('i6wn83o24y1kckfut7uz6d7emmue0n0c','.eJxVjssOwiAUBf-FtSE8C7h0328gl8eVagNJaVfGf1eSLnR7ZjI5L-Lh2Is_et78ksiVcHL53QLEZ64DpAfUe6Ox1X1bAh0KPWmnc0t5vZ3uX6BALyMbHANrOTKODhygwYmbJLPFyNAlsMyoLJiNTKALEqVSAYUWWoccBX6j6_g3vT-1GjpQ:1rgJgz:uoiJZnThMNNUgDu50X04Wbtu7hVWK4aZvwEIpg_tTNQ','2024-03-16 07:21:57.675581'),
('o2jx7l6eg7ox4jil0p5oe2c3va15b2f2','eyJsaWQiOjJ9:1qwezo:dwiSUTaJnnPcTT8m-rHYSyG_8Yrh14ytFtNHFwoBsKQ','2023-11-11 08:48:40.875939'),
('p9i1z8zr3nqfby9e55mpl1jr160zpcn1','.eJxVjsEOwiAQBf-FsyFAQcCjd7-BLLAr1QaS0p6M_64kPej1zWTyXizAvpWwd1zDnNmFSXb63SKkJ9YB8gPqvfHU6rbOkQ-FH7TzW8u4XA_3L1Cgl5GNXoBzkoQkDx7I0lnaPKGjJMhncMJqVMIlocjHiSatIymjjImYFH2jy_gn3x-1EDpL:1rQ7fN:G4TlmiFvr_Qnz9m0wnNyOIXEvm_qClDY3U5harxVYhU','2024-01-31 15:17:21.377472'),
('xtzdqotu8xqg021cxe2qdhkgmujv8bzi','eyJsaWQiOjZ9:1rCFwC:xsTicBL8LXn-SoUx2PZ-Aho5x-qRImJoHRQrjqM2elc','2023-12-24 09:17:24.999437'),
('yeeaz9we4k22z9vf1fcpztfyrqf7a5yw','eyJsaWQiOjJ9:1r7u2u:Sh5VENVFcgnvubA9rKQBifFuwRT7P7LgdZgsNg-bTlY','2023-12-12 09:06:20.578000'),
('yfc7edq4fwrzi1uvnvqfra8jwgyp2i6f','eyJsaWQiOjYsImF0aGlkIjo0LCJiaWxsaWQiOjJ9:1rCF4j:hic1tkXceBEXi2sHNHyJV05X3ncQc1i2MRSk476-J4M','2023-12-24 08:22:09.227766');

/*Table structure for table `smartapp_authority` */

DROP TABLE IF EXISTS `smartapp_authority`;

CREATE TABLE `smartapp_authority` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Phone` bigint NOT NULL,
  `Place` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Image` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `Designation` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_authority_LOGIN_id_f4be6ba2_fk_smartapp_login_id` (`LOGIN_id`),
  CONSTRAINT `smartapp_authority_LOGIN_id_f4be6ba2_fk_smartapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `smartapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_authority` */

insert  into `smartapp_authority`(`id`,`Name`,`Phone`,`Place`,`Email`,`Image`,`LOGIN_id`,`Designation`) values 
(4,'femisha',9876543211,'tirur','femishafebinkp@gmail.com','Photo by Yuichi Kageyama on Unsplash.jpg',6,'senior officer'),
(6,'rinsha',9876543211,'tirur','fathimarinsha@gmail.com','2023-07-12 (2)_K6hTih6.png',8,'hr');

/*Table structure for table `smartapp_bill` */

DROP TABLE IF EXISTS `smartapp_bill`;

CREATE TABLE `smartapp_bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Unit_used` varchar(50) NOT NULL,
  `Reading` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Last_date` date NOT NULL,
  `Amount` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_bill_USER_id_bd01e3bf_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_bill_USER_id_bd01e3bf_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_bill` */

insert  into `smartapp_bill`(`id`,`Unit_used`,`Reading`,`Status`,`Last_date`,`Amount`,`USER_id`) values 
(2,'12345','34567','pending','2023-12-26','4500',1),
(3,'5.0','5','pending','2024-02-27','16.5',5),
(4,'10.0','5','pending','2024-02-27','33.0',5),
(5,'10.0','5','Paid','2024-02-27','33.0',5),
(6,'10.0','5','pending','2024-02-27','33.0',5),
(7,'10.0','5','Paid','2024-02-27','33.0',5),
(8,'10.0','5','Paid','2024-02-27','33.0',5),
(9,'10.0','5','pending','2024-03-02','33.0',5),
(10,'10.0','5','pending','2024-03-02','33.0',5),
(11,'10.0','5','Paid','2024-03-02','33.0',5),
(12,'10.0','5','pending','2024-03-02','33.0',5),
(13,'10.0','5','pending','2024-03-02','33.0',5),
(14,'10.0','5','pending','2024-03-02','33.0',5),
(15,'10.0','5','pending','2024-03-02','33.0',5),
(16,'10.0','5','pending','2024-03-02','33.0',5),
(17,'10.0','5','pending','2024-03-02','33.0',5),
(18,'10.0','5','pending','2024-03-02','33.0',5),
(19,'10.0','5','pending','2024-03-02','33.0',5),
(20,'10.0','5','pending','2024-03-02','33.0',5),
(21,'10.0','5','pending','2024-03-02','33.0',5),
(22,'10.0','5','pending','2024-03-02','33.0',5),
(23,'10.0','5','pending','2024-03-02','33.0',5),
(24,'10.0','5','pending','2024-03-02','33.0',5),
(25,'10.0','5','pending','2024-03-02','33.0',5),
(26,'10.0','5','pending','2024-03-02','33.0',5),
(27,'10.0','5','pending','2024-03-02','33.0',5),
(28,'10.0','5','pending','2024-03-02','33.0',5),
(29,'125503.0','125498','pending','2024-03-02','1091876.0999999999',5),
(30,'125503.0','5','pending','2024-03-02','1091876.0999999999',5),
(31,'125503.0','125498','pending','2024-03-02','1091876.0999999999',5),
(32,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(33,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(34,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(35,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(36,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(37,'250996.0','125498','pending','2024-03-02','2183665.1999999997',5),
(38,'125503.0','5','pending','2024-03-02','1091876.0999999999',5),
(39,'10.0','5','pending','2024-03-02','33.0',5),
(40,'10.0','5','pending','2024-03-02','33.0',5),
(41,'10.0','5','pending','2024-03-02','33.0',5),
(42,'125503.0','125498','pending','2024-03-02','1091876.0999999999',5),
(43,'125503.0','5','pending','2024-03-02','1091876.0999999999',5),
(44,'979567.0','979562','pending','2024-03-02','8522232.899999999',5),
(45,'1105060.0','125498','pending','2024-03-02','9614022.0',5),
(46,'125503.0','5','pending','2024-03-02','1091876.0999999999',5),
(47,'325679.0','325674','pending','2024-03-02','2833407.3',5),
(48,'325679.0','5','pending','2024-03-02','2833407.3',5),
(49,'10.0','5','pending','2024-03-02','33.0',5),
(50,'10.0','5','pending','2024-03-02','33.0',5),
(51,'10.0','5','pending','2024-03-02','33.0',5),
(52,'10.0','5','pending','2024-03-02','33.0',5),
(53,'239.0','00234','pending','2024-03-02','1553.5',5);

/*Table structure for table `smartapp_complaint` */

DROP TABLE IF EXISTS `smartapp_complaint`;

CREATE TABLE `smartapp_complaint` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Complaint` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Reply` varchar(100) NOT NULL,
  `AUTHORITY_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_complaint_AUTHORITY_id_6b780955_fk_smartapp_` (`AUTHORITY_id`),
  KEY `smartapp_complaint_USER_id_51ab5ea2_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_complaint_AUTHORITY_id_6b780955_fk_smartapp_` FOREIGN KEY (`AUTHORITY_id`) REFERENCES `smartapp_authority` (`id`),
  CONSTRAINT `smartapp_complaint_USER_id_51ab5ea2_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_complaint` */

insert  into `smartapp_complaint`(`id`,`Complaint`,`Date`,`Reply`,`AUTHORITY_id`,`USER_id`) values 
(1,'jhgy','2024-01-17','pending',6,5),
(2,'bdbd','2024-01-17','Pending',4,5),
(3,'bdbd','2024-01-17','Pending',4,5),
(4,'bdbd','2024-01-17','Pending',4,5),
(5,'not bad','2024-01-17','Pending',4,5),
(6,'not bad','2024-01-17','Pending',4,5),
(7,'not bad','2024-01-17','Pending',4,5),
(8,'ryu','2024-01-17','Pending',4,5),
(9,'eyuj','2024-01-17','Pending',4,5),
(10,'rtu','2024-01-17','Pending',4,5),
(11,'helloo','2024-01-17','Pending',4,5),
(12,'hey','2024-01-18','Pending',4,5),
(13,'qpouytgh','2024-02-09','Pending',4,5),
(14,'','2024-02-09','Pending',4,5),
(15,'sfghjiiyg','2024-02-09','Pending',4,5),
(16,'heyyy','2024-02-09','Pending',4,5),
(17,'hy','2024-02-10','Pending',4,5),
(18,'hello','2024-02-10','Pending',4,5),
(19,'complete ','2024-02-27','Pending',4,5);

/*Table structure for table `smartapp_extra_usage` */

DROP TABLE IF EXISTS `smartapp_extra_usage`;

CREATE TABLE `smartapp_extra_usage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `F_Date` date NOT NULL,
  `T_Date` date NOT NULL,
  `Reason` varchar(100) NOT NULL,
  `Amount` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_extra_usage_USER_id_81ce3100_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_extra_usage_USER_id_81ce3100_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_extra_usage` */

insert  into `smartapp_extra_usage`(`id`,`F_Date`,`T_Date`,`Reason`,`Amount`,`Status`,`USER_id`) values 
(7,'2023-02-12','2023-02-15','thus','123','pending',5);

/*Table structure for table `smartapp_feedback` */

DROP TABLE IF EXISTS `smartapp_feedback`;

CREATE TABLE `smartapp_feedback` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Feedback` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_feedback_USER_id_86251789_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_feedback_USER_id_86251789_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_feedback` */

insert  into `smartapp_feedback`(`id`,`Feedback`,`Date`,`USER_id`) values 
(1,'eetyuiopkjhgfhjkl','2023-11-17',1),
(2,'heloo','2024-01-17',5),
(3,'heloo','2024-01-17',5),
(4,'hello','2024-01-17',5),
(5,'hello','2024-01-17',5),
(6,'hey','2024-01-17',5),
(7,'hey','2024-01-17',5),
(8,'hey','2024-01-17',5),
(9,'ncjx','2024-01-17',5),
(10,'tyr','2024-01-18',5),
(11,'qwe','2024-02-09',5),
(12,'qwe','2024-02-09',5),
(13,'qwertyg','2024-02-09',5),
(14,'fgjkmmnv','2024-02-09',5),
(15,'lqm','2024-02-09',5),
(16,'tujo','2024-02-10',5),
(17,'hello','2024-02-10',5),
(18,'thh','2024-02-10',5),
(19,'heyy','2024-02-19',5),
(20,'Fathima Rinsha','2024-02-27',5),
(21,'dcdhf','2024-02-27',5);

/*Table structure for table `smartapp_login` */

DROP TABLE IF EXISTS `smartapp_login`;

CREATE TABLE `smartapp_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_login` */

insert  into `smartapp_login`(`id`,`Username`,`Password`,`Type`) values 
(1,'admin','12345','admin'),
(2,'authority','1234','authority'),
(4,'wert','123','user'),
(6,'femisha','Febin123456','authority'),
(7,'femisha','Feb12345677','authority'),
(8,'rinsha','Rinsha2468','authority'),
(9,'Rinsha321','rinsha@123','User'),
(10,'Rinsha321','rinsha@123','User'),
(11,'Rinsha321','rinsha@123','User'),
(12,'Rinsha321','rinsha@123','User'),
(13,'Rinsha321','rinsha@123','User'),
(14,'Rinsha123','123','User'),
(15,'ckhibaa','hiba@123','User'),
(16,'femishaa ','febin@123','User'),
(17,'femisha','femisha123','User');

/*Table structure for table `smartapp_notification` */

DROP TABLE IF EXISTS `smartapp_notification`;

CREATE TABLE `smartapp_notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Notification` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `AUTHORITY_id` bigint NOT NULL,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_notificatio_AUTHORITY_id_1f85e68e_fk_smartapp_` (`AUTHORITY_id`),
  CONSTRAINT `smartapp_notificatio_AUTHORITY_id_1f85e68e_fk_smartapp_` FOREIGN KEY (`AUTHORITY_id`) REFERENCES `smartapp_authority` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_notification` */

insert  into `smartapp_notification`(`id`,`Notification`,`Date`,`AUTHORITY_id`,`status`) values 
(4,'fhjkqwertyuio','2023-12-10',4,'decline'),
(5,'ertyuiop\'','2023-12-10',4,'decline'),
(7,'hello','2023-12-10',4,'accept'),
(8,'hyyyyy','2023-12-10',4,'decline');

/*Table structure for table `smartapp_payment` */

DROP TABLE IF EXISTS `smartapp_payment`;

CREATE TABLE `smartapp_payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Amount` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Fine` varchar(50) NOT NULL,
  `BILL_id` bigint NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_payment_BILL_id_acac2c36_fk_smartapp_bill_id` (`BILL_id`),
  KEY `smartapp_payment_USER_id_d835e7bc_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_payment_BILL_id_acac2c36_fk_smartapp_bill_id` FOREIGN KEY (`BILL_id`) REFERENCES `smartapp_bill` (`id`),
  CONSTRAINT `smartapp_payment_USER_id_d835e7bc_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_payment` */

insert  into `smartapp_payment`(`id`,`Amount`,`Status`,`Date`,`Fine`,`BILL_id`,`USER_id`) values 
(1,'33.0','Paid','2024-02-27','0',5,5),
(2,'33.0','Paid','2024-02-27','0',7,5),
(3,'33.0','Paid','2024-02-27','0',8,5),
(4,'33.0','Paid','2024-03-02','0',11,5);

/*Table structure for table `smartapp_register` */

DROP TABLE IF EXISTS `smartapp_register`;

CREATE TABLE `smartapp_register` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Phone` bigint NOT NULL,
  `Place` varchar(50) NOT NULL,
  `Post` varchar(50) NOT NULL,
  `Pin` bigint NOT NULL,
  `Consumer_no` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_register_LOGIN_id_2ebdbe4b_fk_smartapp_login_id` (`LOGIN_id`),
  CONSTRAINT `smartapp_register_LOGIN_id_2ebdbe4b_fk_smartapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `smartapp_login` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_register` */

/*Table structure for table `smartapp_report_emergency` */

DROP TABLE IF EXISTS `smartapp_report_emergency`;

CREATE TABLE `smartapp_report_emergency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Image` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `Latitude` varchar(50) NOT NULL,
  `Longitude` varchar(50) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `USER_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_report_emergency_USER_id_9e76c158_fk_smartapp_user_id` (`USER_id`),
  CONSTRAINT `smartapp_report_emergency_USER_id_9e76c158_fk_smartapp_user_id` FOREIGN KEY (`USER_id`) REFERENCES `smartapp_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_report_emergency` */

insert  into `smartapp_report_emergency`(`id`,`Image`,`Description`,`Date`,`Latitude`,`Longitude`,`Status`,`USER_id`) values 
(1,'images.jpeg','thnk','2024-02-09','11.22','11.22','pending',5),
(2,'images_Vnwn1Oe.jpeg','thnkukk','2024-02-09','11.22','11.22','pending',5),
(3,'images_35TTXEv.jpeg','thnkukk','2024-02-09','11.22','11.22','pending',5),
(4,'images_26za1IW.jpeg','thnkukk','2024-02-09','11.22','11.22','pending',5),
(5,'images_liT7XGr.jpeg','quffdyjg','2024-02-09','11.22','11.22','pending',5),
(6,'images_IRayKko.jpeg','lfgjj','2024-02-10','11.22','11.22','pending',5),
(7,'IMG_20240227_093935_XWbVrAA.jpg','reschj','2024-02-27','11.22','11.22','pending',5);

/*Table structure for table `smartapp_user` */

DROP TABLE IF EXISTS `smartapp_user`;

CREATE TABLE `smartapp_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Phone` bigint NOT NULL,
  `Place` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Post` varchar(50) NOT NULL,
  `Pin` bigint NOT NULL,
  `Consumer_no` varchar(50) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `smartapp_user_LOGIN_id_b4895799_fk_smartapp_login_id` (`LOGIN_id`),
  CONSTRAINT `smartapp_user_LOGIN_id_b4895799_fk_smartapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `smartapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `smartapp_user` */

insert  into `smartapp_user`(`id`,`Name`,`Lname`,`Phone`,`Place`,`Email`,`Post`,`Pin`,`Consumer_no`,`LOGIN_id`) values 
(1,'qwerty','rtyu',34567,'werty','sdfghj','sdfghj',2345,'7908909-',4),
(2,'Fathima ',' Rinsha',80899920121,'tirur','rinshaparappara123@gmail.com','vailathur ',676320,'0075643',12),
(3,'Fathima ',' Rinsha',80899920121,'tirur','rinshaparappara123@gmail.com','vailathur ',676320,'0075643',13),
(4,'fathima','rinsha',8089920121,'tirur','rinshaparappara123@gmail.com','vailathur ',676320,'0087659',14),
(5,'fathima','hiba',7907802048,'thirunavaya','hiback@gmail.com','thirunavaya ',676301,'000123',15),
(6,'femisha','febin',789654321,'tirur','femishagmail.com','tirur',676307,'12345678909',16),
(7,'fem','feb',1234568911,'ozhur','femisha124@gmail.com','tirur',307337,'1234567891011',17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
