/*
SQLyog Community v12.4.3 (64 bit)
MySQL - 5.7.18-log : Database - registracija
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`registracija` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `registracija`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can add permission',2,'add_permission'),
(5,'Can change permission',2,'change_permission'),
(6,'Can delete permission',2,'delete_permission'),
(7,'Can add group',3,'add_group'),
(8,'Can change group',3,'change_group'),
(9,'Can delete group',3,'delete_group'),
(10,'Can add user',4,'add_user'),
(11,'Can change user',4,'change_user'),
(12,'Can delete user',4,'delete_user'),
(13,'Can add content type',5,'add_contenttype'),
(14,'Can change content type',5,'change_contenttype'),
(15,'Can delete content type',5,'delete_contenttype'),
(16,'Can add session',6,'add_session'),
(17,'Can change session',6,'change_session'),
(18,'Can delete session',6,'delete_session'),
(19,'Can add podaci',7,'add_podaci'),
(20,'Can change podaci',7,'change_podaci'),
(21,'Can delete podaci',7,'delete_podaci'),
(22,'Can add vozni red',8,'add_voznired'),
(23,'Can change vozni red',8,'change_voznired'),
(24,'Can delete vozni red',8,'delete_voznired'),
(25,'Can add kupljene karte',9,'add_kupljenekarte'),
(26,'Can change kupljene karte',9,'change_kupljenekarte'),
(27,'Can delete kupljene karte',9,'delete_kupljenekarte');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$100000$bOIYIyEtWRxp$yXfnVWkrXYiXRV8Zn+vC93Aa2tnRamLVhmxcy65EERY=','2018-06-13 09:13:56.364575',1,'admin','','','',1,1,'2018-06-01 15:56:15.000000'),
(17,'pbkdf2_sha256$100000$r1SreWid4SIv$h1rdUosnCehS56vQ9fKR3Wfcx3nLuCaWPsFEmZ8yE9U=','2018-06-13 10:56:31.834843',0,'hamburger','','','ham@burger.com',0,1,'2018-06-11 09:56:47.557402'),
(22,'pbkdf2_sha256$100000$3foGiTh2bhq2$+fz/0u7al2zNa7CVkcJJbTwfuZmFYaiMVpC7MK3KCaI=','2018-06-13 07:50:55.484546',0,'novikorisnik','','','novi@korisnik.com',0,1,'2018-06-13 06:42:49.863397');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values 
(1,'2018-06-07 19:46:33.873618','1','VozniRed object (1)',1,'[{\"added\": {}}]',8,1),
(2,'2018-06-07 19:48:30.009073','2','VozniRed object (2)',1,'[{\"added\": {}}]',8,1),
(3,'2018-06-07 19:49:13.314442','3','VozniRed object (3)',1,'[{\"added\": {}}]',8,1),
(4,'2018-06-07 19:49:54.041021','4','VozniRed object (4)',1,'[{\"added\": {}}]',8,1),
(5,'2018-06-07 19:50:31.711854','5','VozniRed object (5)',1,'[{\"added\": {}}]',8,1),
(6,'2018-06-10 10:18:30.657050','1','admin',2,'[]',4,1),
(7,'2018-06-10 16:27:46.471697','2','mia',3,'',4,1),
(8,'2018-06-10 16:27:51.494795','3','hrvoje',3,'',4,1),
(9,'2018-06-10 16:27:56.550795','5','marija',3,'',4,1),
(10,'2018-06-10 16:28:01.871881','4','maja',3,'',4,1),
(11,'2018-06-10 16:55:21.355129','12','šunka',3,'',4,1),
(12,'2018-06-10 16:55:25.709130','11','pizza',3,'',4,1),
(13,'2018-06-10 16:55:29.756149','6','mia123',3,'',4,1),
(14,'2018-06-10 16:55:33.359151','9','mia',3,'',4,1),
(15,'2018-06-10 16:55:37.305158','10','marijana',3,'',4,1),
(16,'2018-06-10 16:55:42.163147','7','maja',3,'',4,1),
(17,'2018-06-10 16:55:46.552342','13','jana',3,'',4,1),
(18,'2018-06-10 16:55:50.697155','8','hrvoje',3,'',4,1),
(19,'2018-06-11 08:56:11.000370','14','mia',3,'',4,1),
(20,'2018-06-11 09:01:55.201630','15','hamburger',3,'',4,1),
(21,'2018-06-11 09:54:46.276183','16','pizza123',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),
(22,'2018-06-11 09:59:15.856512','17','hamburger',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1),
(23,'2018-06-11 10:57:14.010372','16','pizza123',3,'',4,1),
(24,'2018-06-11 10:57:19.839012','20','jana',3,'',4,1),
(25,'2018-06-11 10:57:23.020503','19','jana123',3,'',4,1),
(26,'2018-06-11 10:57:26.254357','18','marica',3,'',4,1),
(27,'2018-06-12 13:16:26.622914','6','VozniRed object (6)',1,'[{\"added\": {}}]',8,1),
(28,'2018-06-12 13:18:42.712826','1','VozniRed object (1)',3,'',8,1),
(29,'2018-06-12 13:18:50.840219','2','VozniRed object (2)',2,'[{\"changed\": {\"fields\": [\"datum\"]}}]',8,1),
(30,'2018-06-12 13:18:56.084261','3','VozniRed object (3)',2,'[{\"changed\": {\"fields\": [\"datum\"]}}]',8,1),
(31,'2018-06-12 13:19:06.049601','4','VozniRed object (4)',2,'[]',8,1),
(32,'2018-06-12 13:19:12.764057','5','VozniRed object (5)',2,'[{\"changed\": {\"fields\": [\"datum\"]}}]',8,1),
(33,'2018-06-12 16:31:16.853530','2','VozniRed object (2)',2,'[]',8,1),
(34,'2018-06-12 16:31:32.903631','5','VozniRed object (5)',2,'[{\"changed\": {\"fields\": [\"brojKar\"]}}]',8,1),
(35,'2018-06-13 09:14:39.534188','7','VozniRed object (7)',1,'[{\"added\": {}}]',8,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'registracija','podaci'),
(6,'sessions','session'),
(9,'sustav','kupljenekarte'),
(8,'sustav','voznired');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2018-06-01 13:35:50.222457'),
(2,'auth','0001_initial','2018-06-01 13:36:00.195385'),
(3,'admin','0001_initial','2018-06-01 13:36:03.042450'),
(4,'admin','0002_logentry_remove_auto_add','2018-06-01 13:36:03.089343'),
(5,'contenttypes','0002_remove_content_type_name','2018-06-01 13:36:04.323616'),
(6,'auth','0002_alter_permission_name_max_length','2018-06-01 13:36:05.208191'),
(7,'auth','0003_alter_user_email_max_length','2018-06-01 13:36:06.489372'),
(8,'auth','0004_alter_user_username_opts','2018-06-01 13:36:06.551868'),
(9,'auth','0005_alter_user_last_login_null','2018-06-01 13:36:07.208126'),
(10,'auth','0006_require_contenttypes_0002','2018-06-01 13:36:07.239371'),
(11,'auth','0007_alter_validators_add_error_messages','2018-06-01 13:36:07.286177'),
(12,'auth','0008_alter_user_username_max_length','2018-06-01 13:36:08.098620'),
(13,'auth','0009_alter_user_last_name_max_length','2018-06-01 13:36:08.958007'),
(14,'sessions','0001_initial','2018-06-01 13:36:10.279647'),
(15,'registracija','0001_initial','2018-06-01 15:45:51.251925'),
(16,'registracija','0002_auto_20180601_1742','2018-06-01 15:45:51.330031'),
(17,'registracija','0003_auto_20180605_2108','2018-06-05 19:10:00.529579'),
(18,'registracija','0004_auto_20180605_2123','2018-06-05 19:23:18.702570'),
(19,'registracija','0005_auto_20180607_1455','2018-06-07 12:55:42.326407'),
(20,'registracija','0006_auto_20180607_1911','2018-06-07 17:12:04.360893'),
(21,'registracija','0007_auto_20180607_1922','2018-06-07 17:22:40.846240'),
(22,'registracija','0008_auto_20180607_1927','2018-06-07 17:27:33.433910'),
(23,'registracija','0009_auto_20180607_1928','2018-06-07 17:28:55.537041'),
(24,'sustav','0001_initial','2018-06-07 19:42:45.831087'),
(25,'sustav','0002_kupljenekarte','2018-06-11 14:15:20.544425'),
(26,'sustav','0003_auto_20180613_1246','2018-06-13 10:47:03.941824'),
(27,'sustav','0004_auto_20180613_1249','2018-06-13 10:50:07.465881');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('ly33a62e6u16evzidpu5lq600xvgpk6v','M2IxYzcyOTc0ZGJhNGY5NDk0YWI0NTVjMDE1YjdjYjAyYWMzZmUxNDp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjgxZDMwYjUxMDNjMDE2YjhkMDhjYTZlNmJlYTQ2ZTI4M2ZhMDk2NiJ9','2018-06-27 10:56:31.906906');

/*Table structure for table `registracija_podaci` */

DROP TABLE IF EXISTS `registracija_podaci`;

CREATE TABLE `registracija_podaci` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `datumRod` date NOT NULL,
  `adresa` varchar(50) NOT NULL,
  `posBr` int(10) unsigned NOT NULL,
  `grad` varchar(30) NOT NULL,
  `drzava` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lozinka` varchar(10) NOT NULL,
  `brKartice` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `registracija_podaci` */

insert  into `registracija_podaci`(`id`,`ime`,`prezime`,`datumRod`,`adresa`,`posBr`,`grad`,`drzava`,`email`,`lozinka`,`brKartice`) values 
(23,'Mia','Blažeković','1997-02-27','Ul. Lovre Matačića 26',43000,'Bjelovar','Hrvatska','mblazekov@tvz.hr','abc12345',1234567890123456),
(24,'Hrvoje','Horvat','1995-04-13','Trg svetog Marka 2',10000,'Zagreb','Hrvatska','hrvoje.horvat@gmail.com','lozinka123',1234567890123456),
(25,'Marko','Marković','1992-01-01','Zrinski trg 1',21000,'Split','Hrvatska','marko.markovic@yahoo.com','pass123',1234567891234567);

/*Table structure for table `sustav_kupljenekarte` */

DROP TABLE IF EXISTS `sustav_kupljenekarte`;

CREATE TABLE `sustav_kupljenekarte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `korIme` varchar(30) NOT NULL,
  `brKartice` bigint(20) NOT NULL,
  `datum` date NOT NULL,
  `vrijemePol` time(6) NOT NULL,
  `vrijemeDol` time(6) NOT NULL,
  `cijena` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Data for the table `sustav_kupljenekarte` */

insert  into `sustav_kupljenekarte`(`id`,`korIme`,`brKartice`,`datum`,`vrijemePol`,`vrijemeDol`,`cijena`) values 
(55,'hamburger',1234567890123456,'2018-06-15','21:00:00.000000','22:36:00.000000',56.84);

/*Table structure for table `sustav_voznired` */

DROP TABLE IF EXISTS `sustav_voznired`;

CREATE TABLE `sustav_voznired` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vrijemePol` time(6) NOT NULL,
  `vrijemeDol` time(6) NOT NULL,
  `datum` date NOT NULL,
  `brojKar` smallint(5) unsigned NOT NULL,
  `cijena` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `sustav_voznired` */

insert  into `sustav_voznired`(`id`,`vrijemePol`,`vrijemeDol`,`datum`,`brojKar`,`cijena`) values 
(2,'07:00:00.000000','08:53:00.000000','2018-06-17',0,63.80),
(3,'10:00:00.000000','11:44:00.000000','2018-06-30',10,56.80),
(4,'12:00:00.000000','13:39:00.000000','2018-06-10',8,56.80),
(5,'14:00:00.000000','15:32:00.000000','2018-06-14',1,56.80),
(6,'21:00:00.000000','22:36:00.000000','2018-06-15',11,56.84),
(7,'09:15:00.000000','11:00:00.000000','2018-06-13',4,63.80);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
