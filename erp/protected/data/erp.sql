/*
SQLyog Enterprise - MySQL GUI v7.1 
MySQL - 5.5.34 : Database - erp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`erp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `erp`;

/*Table structure for table `advance_pay_recv` */

DROP TABLE IF EXISTS `advance_pay_recv`;

CREATE TABLE `advance_pay_recv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payOrReceive` int(11) DEFAULT NULL,
  `transaction_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `adv_pay_type` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `amount` double DEFAULT NULL,
  `installment` double DEFAULT NULL,
  `interest` double DEFAULT NULL,
  `is_approved` int(11) DEFAULT '15',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_advance_pay_recv` (`employee_id`),
  CONSTRAINT `FK_advance_pay_recv` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `advance_pay_recv` */

insert  into `advance_pay_recv`(`id`,`payOrReceive`,`transaction_date`,`employee_id`,`adv_pay_type`,`title`,`details`,`amount`,`installment`,`interest`,`is_approved`,`create_by`,`create_time`,`update_by`,`update_time`,`day`,`month`,`year`) values (3,22,'2014-03-01',1,21,'long term loan','',10000,10,0,16,1,'2014-10-20 12:51:28',1,'2014-10-20 12:52:28','01','03','2014'),(4,22,'2014-10-20',1,20,'current loan','',1000,NULL,NULL,16,1,'2014-10-20 12:53:17',NULL,NULL,'20','10','2014');

/*Table structure for table `advance_pay_recv_history` */

DROP TABLE IF EXISTS `advance_pay_recv_history`;

CREATE TABLE `advance_pay_recv_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adv_pay_recv_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_advance_pay_recv_history` (`adv_pay_recv_id`),
  CONSTRAINT `FK_advance_pay_recv_history` FOREIGN KEY (`adv_pay_recv_id`) REFERENCES `advance_pay_recv` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `advance_pay_recv_history` */

insert  into `advance_pay_recv_history`(`id`,`adv_pay_recv_id`,`status`,`status_changed_by`,`status_changed_time`) values (3,3,16,1,'2014-10-20 12:52:03'),(4,4,16,1,'2014-10-20 12:53:22');

/*Table structure for table `ah_amoun_proll_normal` */

DROP TABLE IF EXISTS `ah_amoun_proll_normal`;

CREATE TABLE `ah_amoun_proll_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `ah_proll_normal_id` int(11) DEFAULT NULL,
  `percentage_of_ah_proll_normal_id` int(11) DEFAULT NULL,
  `amount_adj` double DEFAULT NULL,
  `earn_deduct_type` int(11) DEFAULT NULL,
  `start_from` date DEFAULT NULL,
  `end_to` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ah_amoun_proll_normal` (`ah_proll_normal_id`),
  CONSTRAINT `FK_ah_amoun_proll_normal` FOREIGN KEY (`ah_proll_normal_id`) REFERENCES `ah_proll_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

/*Data for the table `ah_amoun_proll_normal` */

insert  into `ah_amoun_proll_normal`(`id`,`employee_id`,`ah_proll_normal_id`,`percentage_of_ah_proll_normal_id`,`amount_adj`,`earn_deduct_type`,`start_from`,`end_to`,`is_active`,`create_by`,`create_time`,`update_by`,`update_time`) values (4,1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(5,3,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(6,4,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(7,5,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(8,6,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(9,7,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(10,8,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(11,9,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(12,10,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(13,11,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(14,12,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(15,13,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(16,14,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(17,15,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(18,16,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(19,17,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(20,18,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(21,19,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(22,21,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(23,22,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(24,23,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(25,24,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(26,25,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(27,26,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(28,27,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(29,28,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(30,29,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(31,30,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(32,31,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(33,35,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(34,36,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(35,37,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(36,38,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(37,39,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(38,40,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(39,41,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(40,42,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(41,43,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL),(42,44,1,NULL,5500,79,'0000-00-00','0000-00-00',1,NULL,NULL,1,'2014-10-13 00:37:52'),(43,45,1,NULL,17250,79,'0000-00-00','0000-00-00',1,NULL,NULL,1,'2014-10-13 00:35:40'),(67,45,2,NULL,17250,79,'0000-00-00','0000-00-00',1,1,'2014-10-13 00:36:09',NULL,NULL),(68,45,8,NULL,1725,79,'0000-00-00','0000-00-00',1,1,'2014-10-13 00:36:36',NULL,NULL),(69,44,2,NULL,5500,79,'0000-00-00','0000-00-00',1,1,'2014-10-13 00:38:04',NULL,NULL),(70,44,4,NULL,575,79,'0000-00-00','0000-00-00',1,1,'2014-10-13 00:38:43',NULL,NULL),(71,44,8,NULL,550,79,'0000-00-00','0000-00-00',1,1,'2014-10-13 00:39:03',NULL,NULL);

/*Table structure for table `ah_amount_proll` */

DROP TABLE IF EXISTS `ah_amount_proll`;

CREATE TABLE `ah_amount_proll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ah_proll_id` int(11) DEFAULT NULL,
  `percentage_of_ah_proll_id` int(11) DEFAULT NULL,
  `amount_adj` double DEFAULT NULL,
  `earn_deduct_type` int(11) DEFAULT NULL,
  `start_from` date DEFAULT NULL,
  `end_to` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ah_amount_proll` (`ah_proll_id`),
  CONSTRAINT `FK_ah_amount_proll` FOREIGN KEY (`ah_proll_id`) REFERENCES `ah_proll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ah_amount_proll` */

insert  into `ah_amount_proll`(`id`,`ah_proll_id`,`percentage_of_ah_proll_id`,`amount_adj`,`earn_deduct_type`,`start_from`,`end_to`,`is_active`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,1,NULL,2000,79,'0000-00-00','0000-00-00',1,1,'2014-10-18 12:57:32',1,'2014-10-20 15:02:44'),(2,2,NULL,200,79,'0000-00-00','0000-00-00',1,1,'2014-10-18 12:58:42',1,'2014-10-20 15:01:00'),(3,3,1,800,79,'0000-00-00','0000-00-00',1,1,'2014-10-18 12:59:04',1,'2014-10-20 15:03:00'),(6,6,NULL,10,79,'0000-00-00','0000-00-00',1,1,'2014-10-20 12:02:51',NULL,NULL);

/*Table structure for table `ah_proll` */

DROP TABLE IF EXISTS `ah_proll`;

CREATE TABLE `ah_proll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paygrade_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `ac_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ah_proll` (`paygrade_id`),
  CONSTRAINT `FK_ah_proll` FOREIGN KEY (`paygrade_id`) REFERENCES `pay_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `ah_proll` */

insert  into `ah_proll`(`id`,`paygrade_id`,`title`,`ac_type`) values (1,1,'মূল বেতন',13),(2,1,'চিকিৎসা ভাতা',13),(3,1,'বাড়ী ভাড়া',13),(6,1,'স্ট্যাম্প কর্তন',14);

/*Table structure for table `ah_proll_normal` */

DROP TABLE IF EXISTS `ah_proll_normal`;

CREATE TABLE `ah_proll_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `ac_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ah_proll_normal` */

insert  into `ah_proll_normal`(`id`,`title`,`ac_type`) values (1,'Basic Salary',13),(2,'H.Rent & Medical',13),(4,'Fooding',14),(6,'Mobile',14),(7,'Others',14),(8,'P.F Cont',14);

/*Table structure for table `assigned_for_analize` */

DROP TABLE IF EXISTS `assigned_for_analize`;

CREATE TABLE `assigned_for_analize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_details_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `assigned_time` datetime DEFAULT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `assign_status` int(11) DEFAULT '11',
  `remarks` varchar(255) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_assigned_for_analize` (`complaint_details_id`),
  CONSTRAINT `FK_assigned_for_analize` FOREIGN KEY (`complaint_details_id`) REFERENCES `complaint_details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `assigned_for_analize` */

insert  into `assigned_for_analize`(`id`,`complaint_details_id`,`assigned_to`,`assigned_time`,`assigned_by`,`assign_status`,`remarks`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,28,1,'2014-08-27 19:13:00',1,47,'',1,'2014-08-27 19:13:37',1,'2014-08-31 13:21:39'),(2,28,2,'2014-08-27 23:21:00',1,47,'',1,'2014-08-27 23:21:23',1,'2014-08-31 13:21:44');

/*Table structure for table `authassignment` */

DROP TABLE IF EXISTS `authassignment`;

CREATE TABLE `authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authassignment` */

insert  into `authassignment`(`itemname`,`userid`,`bizrule`,`data`) values ('sub admin','2',NULL,'N;'),('SuperAdmin','1',NULL,'N;');

/*Table structure for table `authitem` */

DROP TABLE IF EXISTS `authitem`;

CREATE TABLE `authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitem` */

insert  into `authitem`(`name`,`type`,`description`,`bizrule`,`data`) values ('Inventory.*',1,NULL,NULL,'N;'),('Site.*',1,NULL,NULL,'N;'),('StockTransferHistory.*',1,NULL,NULL,'N;'),('sub admin',2,'sub admin',NULL,'N;'),('SuperAdmin',2,NULL,NULL,'N;');

/*Table structure for table `authitemchild` */

DROP TABLE IF EXISTS `authitemchild`;

CREATE TABLE `authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `authitemchild` */

insert  into `authitemchild`(`parent`,`child`) values ('sub admin','Inventory.*'),('sub admin','Site.*'),('sub admin','StockTransferHistory.*');

/*Table structure for table `bonus_amounts` */

DROP TABLE IF EXISTS `bonus_amounts`;

CREATE TABLE `bonus_amounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `is_approved` int(11) DEFAULT '15',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bonus_amounts` (`bonus_id`),
  KEY `FK_bonus_emp` (`employee_id`),
  CONSTRAINT `FK_bonus_amounts` FOREIGN KEY (`bonus_id`) REFERENCES `bonus_titles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_bonus_emp` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bonus_amounts` */

/*Table structure for table `bonus_status_history` */

DROP TABLE IF EXISTS `bonus_status_history`;

CREATE TABLE `bonus_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bonus_amount_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bonus_status_history` (`bonus_amount_id`),
  CONSTRAINT `FK_bonus_status_history` FOREIGN KEY (`bonus_amount_id`) REFERENCES `bonus_amounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bonus_status_history` */

/*Table structure for table `bonus_titles` */

DROP TABLE IF EXISTS `bonus_titles`;

CREATE TABLE `bonus_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `bonus_titles` */

insert  into `bonus_titles`(`id`,`title`,`details`) values (1,'Bonus One','Bonus\r\nDetails'),(2,'Bonus Two','Bonus Two\r\nDetails');

/*Table structure for table `branches` */

DROP TABLE IF EXISTS `branches`;

CREATE TABLE `branches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `branches` */

insert  into `branches`(`id`,`title`) values (1,'Branch One'),(2,'Branch Two');

/*Table structure for table `chart_of_ac` */

DROP TABLE IF EXISTS `chart_of_ac`;

CREATE TABLE `chart_of_ac` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(5) unsigned zerofill DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `root` int(11) DEFAULT '0',
  `bank_or_cash` int(11) DEFAULT NULL,
  `account_type` int(11) DEFAULT '2',
  `opening_amount` double DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `chart_of_ac` */

insert  into `chart_of_ac`(`id`,`code`,`title`,`remarks`,`root`,`bank_or_cash`,`account_type`,`opening_amount`,`transaction_type`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,00001,'ASSET',NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,00002,'LIABILITY',NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(3,00003,'INCOME/REVENUE',NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(4,00004,'EXPENSE',NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(5,00005,'EQUITY',NULL,0,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(6,00006,'FIXED ASSET',NULL,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(7,00007,'CURRENT ASSET',NULL,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(8,00008,'INVESTMENT',NULL,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(9,00009,'CAPITAL A/C',NULL,5,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(10,00010,'CURRENT LIABILITY',NULL,2,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(11,00011,'LONG TERM LIABILITY',NULL,2,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(12,00012,'DIRECT INCOME',NULL,3,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(13,00013,'INDIRECT INCOME',NULL,3,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(14,00014,'SALE',NULL,3,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(15,00015,'DIRECT EXPENSE',NULL,4,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(16,00016,'INDIRECT EXPENSE',NULL,4,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(17,00017,'PURCHASE',NULL,4,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(18,00018,'CASH','',7,0,2,NULL,3,NULL,NULL,1,'2014-10-02 14:05:15'),(19,00019,'ACCOUNT PAYABLE',NULL,10,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(20,00020,'ACCOUNT RECEIVABLE',NULL,7,0,1,NULL,NULL,NULL,NULL,NULL,NULL),(54,00021,'BANK LOAN','',11,0,2,NULL,3,1,'2014-08-31 18:32:19',NULL,NULL),(55,00022,'INTEREST INCOME','',13,0,2,NULL,3,1,'2014-08-31 18:33:10',NULL,NULL),(56,00023,'ADDITIONAL CAPITAL','',5,0,2,NULL,3,1,'2014-08-31 18:43:15',NULL,NULL),(57,00024,'DRAWING','',5,0,2,NULL,3,1,'2014-08-31 18:43:50',NULL,NULL),(58,00025,'DEPRECIASION','',16,0,2,NULL,3,1,'2014-08-31 18:49:30',NULL,NULL),(59,00026,'FURNITURE','',6,0,2,NULL,3,1,'2014-08-31 18:49:40',NULL,NULL),(60,00027,'BANK','',7,1,2,NULL,3,1,'2014-09-01 14:48:36',1,'2014-09-01 15:07:47'),(61,00028,'test','',6,0,2,NULL,3,1,'2014-09-01 16:21:13',NULL,NULL),(62,00029,'Employee Salary','',16,1,2,NULL,3,1,'2014-09-09 11:46:08',NULL,NULL),(63,00030,'office','',6,0,2,NULL,3,1,'2014-10-02 14:07:46',NULL,NULL),(64,00031,'Insurance','',11,0,2,NULL,3,1,'2014-10-02 14:08:54',NULL,NULL),(65,00032,'Service','',13,0,2,NULL,3,1,'2014-10-02 14:11:03',1,'2014-10-02 14:12:41'),(66,00033,'Employee Salary One','',62,0,2,NULL,3,1,'2014-10-04 13:27:58',NULL,NULL);

/*Table structure for table `complaint_details` */

DROP TABLE IF EXISTS `complaint_details`;

CREATE TABLE `complaint_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_form_id` int(11) DEFAULT NULL,
  `complaint_details` varchar(255) DEFAULT NULL,
  `work_status` int(11) DEFAULT '1',
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_complaint_details` (`complaint_form_id`),
  CONSTRAINT `FK_complaint_details` FOREIGN KEY (`complaint_form_id`) REFERENCES `complaint_form` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `complaint_details` */

insert  into `complaint_details`(`id`,`complaint_form_id`,`complaint_details`,`work_status`,`remarks`) values (1,3,'Problem One',49,''),(2,3,'Problem Two',49,''),(3,3,'Problem Three',49,''),(4,3,'Problem Four',49,''),(5,3,'Problem Five',49,''),(17,3,'Problem Six',49,''),(24,3,'Problem Seven',49,''),(25,4,'problem 1',49,''),(26,4,'problem 2',49,''),(27,4,'problem 3',49,''),(28,5,'Problem i',50,''),(29,5,'Problem ii',49,''),(30,5,'Problem iii',51,''),(31,5,'Problem iv',52,''),(32,5,'Problem v',53,''),(33,5,'Problem vi',49,'');

/*Table structure for table `complaint_form` */

DROP TABLE IF EXISTS `complaint_form`;

CREATE TABLE `complaint_form` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `complainer_name` varchar(255) DEFAULT NULL,
  `complainer_contact_no` varchar(255) DEFAULT NULL,
  `complainer_occopation` varchar(255) DEFAULT NULL,
  `complainer_address` varchar(255) DEFAULT NULL,
  `complaint_title` varchar(255) DEFAULT NULL,
  `complaint_date` date DEFAULT NULL,
  `contact_date` date DEFAULT NULL,
  `work_status` int(11) DEFAULT '1',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `complaint_form` */

insert  into `complaint_form`(`id`,`complainer_name`,`complainer_contact_no`,`complainer_occopation`,`complainer_address`,`complaint_title`,`complaint_date`,`contact_date`,`work_status`,`create_by`,`create_time`,`update_by`,`update_time`) values (3,'Complainer Name One','0339843','Business','Complainer Address and details','Complaint Title One','2014-08-26','2014-08-26',49,1,'2014-08-26 19:16:38',1,'2014-08-31 13:22:03'),(4,'Complainer Name Two','0339843','Business','Complainer Address and details','Complaint Title Two','2014-08-27','2014-08-27',49,1,'2014-08-27 12:26:52',1,'2014-08-31 13:21:57'),(5,'Complainer Name Three','0339843','Business','Complainer Address and details','Complaint Title Three','2014-08-27','2014-08-27',49,1,'2014-08-27 12:28:43',1,'2014-08-31 13:20:32');

/*Table structure for table `countries` */

DROP TABLE IF EXISTS `countries`;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso2` char(2) DEFAULT NULL,
  `iso3` char(3) DEFAULT NULL,
  `country` varchar(62) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;

/*Data for the table `countries` */

insert  into `countries`(`id`,`iso2`,`iso3`,`country`) values (1,'AF','AFG','Afghanistan'),(2,'AX','ALA','Åland Islands'),(3,'AL','ALB','Albania'),(4,'DZ','DZA','Algeria (El Djazaïr)'),(5,'AS','ASM','American Samoa'),(6,'AD','AND','Andorra'),(7,'AO','AGO','Angola'),(8,'AI','AIA','Anguilla'),(9,'AQ','ATA','Antarctica'),(10,'AG','ATG','Antigua and Barbuda'),(11,'AR','ARG','Argentina'),(12,'AM','ARM','Armenia'),(13,'AW','ABW','Aruba'),(14,'AU','AUS','Australia'),(15,'AT','AUT','Austria'),(16,'AZ','AZE','Azerbaijan'),(17,'BS','BHS','Bahamas'),(18,'BH','BHR','Bahrain'),(19,'BD','BGD','Bangladesh'),(20,'BB','BRB','Barbados'),(21,'BY','BLR','Belarus'),(22,'BE','BEL','Belgium'),(23,'BZ','BLZ','Belize'),(24,'BJ','BEN','Benin'),(25,'BM','BMU','Bermuda'),(26,'BT','BTN','Bhutan'),(27,'BO','BOL','Bolivia'),(28,'BA','BIH','Bosnia and Herzegovina'),(29,'BW','BWA','Botswana'),(30,'BV','BVT','Bouvet Island'),(31,'BR','BRA','Brazil'),(32,'IO','IOT','British Indian Ocean Territory'),(33,'BN','BRN','Brunei Darussalam'),(34,'BG','BGR','Bulgaria'),(35,'BF','BFA','Burkina Faso'),(36,'BI','BDI','Burundi'),(37,'KH','KHM','Cambodia'),(38,'CM','CMR','Cameroon'),(39,'CA','CAN','Canada'),(40,'CV','CPV','Cape Verde'),(41,'KY','CYM','Cayman Islands'),(42,'CF','CAF','Central African Republic'),(43,'TD','TCD','Chad (T\'Chad)'),(44,'CL','CHL','Chile'),(45,'CN','CHN','China'),(46,'CX','CXR','Christmas Island'),(47,'CC','CCK','Cocos (Keeling) Islands'),(48,'CO','COL','Colombia'),(49,'KM','COM','Comoros'),(50,'CG','COG','Congo, Republic Of'),(51,'CD','COD','Congo, The Democratic Republic of the (formerly Zaire)'),(52,'CK','COK','Cook Islands'),(53,'CR','CRI','Costa Rica'),(54,'CI','CIV','CÔte D\'Ivoire (Ivory Coast)'),(55,'HR','HRV','Croatia (hrvatska)'),(56,'CU','CUB','Cuba'),(57,'CY','CYP','Cyprus'),(58,'CZ','CZE','Czech Republic'),(59,'DK','DNK','Denmark'),(60,'DJ','DJI','Djibouti'),(61,'DM','DMA','Dominica'),(62,'DO','DOM','Dominican Republic'),(63,'EC','ECU','Ecuador'),(64,'EG','EGY','Egypt'),(65,'SV','SLV','El Salvador'),(66,'GQ','GNQ','Equatorial Guinea'),(67,'ER','ERI','Eritrea'),(68,'EE','EST','Estonia'),(69,'ET','ETH','Ethiopia'),(70,'FO','FRO','Faeroe Islands'),(71,'FK','FLK','Falkland Islands (Malvinas)'),(72,'FJ','FJI','Fiji'),(73,'FI','FIN','Finland'),(74,'FR','FRA','France'),(75,'GF','GUF','French Guiana'),(76,'PF','PYF','French Polynesia'),(77,'TF','ATF','French Southern Territories'),(78,'GA','GAB','Gabon'),(79,'GM','GMB','Gambia, The'),(80,'GE','GEO','Georgia'),(81,'DE','DEU','Germany (Deutschland)'),(82,'GH','GHA','Ghana'),(83,'GI','GIB','Gibraltar'),(84,'GB','GBR','Great Britain'),(85,'GR','GRC','Greece'),(86,'GL','GRL','Greenland'),(87,'GD','GRD','Grenada'),(88,'GP','GLP','Guadeloupe'),(89,'GU','GUM','Guam'),(90,'GT','GTM','Guatemala'),(91,'GN','GIN','Guinea'),(92,'GW','GNB','Guinea-bissau'),(93,'GY','GUY','Guyana'),(94,'HT','HTI','Haiti'),(95,'HM','HMD','Heard Island and Mcdonald Islands'),(96,'HN','HND','Honduras'),(97,'HK','HKG','Hong Kong (Special Administrative Region of China)'),(98,'HU','HUN','Hungary'),(99,'IS','ISL','Iceland'),(100,'IN','IND','India'),(101,'ID','IDN','Indonesia'),(102,'IR','IRN','Iran (Islamic Republic of Iran)'),(103,'IQ','IRQ','Iraq'),(104,'IE','IRL','Ireland'),(105,'IL','ISR','Israel'),(106,'IT','ITA','Italy'),(107,'JM','JAM','Jamaica'),(108,'JP','JPN','Japan'),(109,'JO','JOR','Jordan (Hashemite Kingdom of Jordan)'),(110,'KZ','KAZ','Kazakhstan'),(111,'KE','KEN','Kenya'),(112,'KI','KIR','Kiribati'),(113,'KP','PRK','Korea (Democratic Peoples Republic pf [North] Korea)'),(114,'KR','KOR','Korea (Republic of [South] Korea)'),(115,'KW','KWT','Kuwait'),(116,'KG','KGZ','Kyrgyzstan'),(117,'LA','LAO','Lao People\'s Democratic Republic'),(118,'LV','LVA','Latvia'),(119,'LB','LBN','Lebanon'),(120,'LS','LSO','Lesotho'),(121,'LR','LBR','Liberia'),(122,'LY','LBY','Libya (Libyan Arab Jamahirya)'),(123,'LI','LIE','Liechtenstein (Fürstentum Liechtenstein)'),(124,'LT','LTU','Lithuania'),(125,'LU','LUX','Luxembourg'),(126,'MO','MAC','Macao (Special Administrative Region of China)'),(127,'MK','MKD','Macedonia (Former Yugoslav Republic of Macedonia)'),(128,'MG','MDG','Madagascar'),(129,'MW','MWI','Malawi'),(130,'MY','MYS','Malaysia'),(131,'MV','MDV','Maldives'),(132,'ML','MLI','Mali'),(133,'MT','MLT','Malta'),(134,'MH','MHL','Marshall Islands'),(135,'MQ','MTQ','Martinique'),(136,'MR','MRT','Mauritania'),(137,'MU','MUS','Mauritius'),(138,'YT','MYT','Mayotte'),(139,'MX','MEX','Mexico'),(140,'FM','FSM','Micronesia (Federated States of Micronesia)'),(141,'MD','MDA','Moldova'),(142,'MC','MCO','Monaco'),(143,'MN','MNG','Mongolia'),(144,'MS','MSR','Montserrat'),(145,'MA','MAR','Morocco'),(146,'MZ','MOZ','Mozambique (Moçambique)'),(147,'MM','MMR','Myanmar (formerly Burma)'),(148,'NA','NAM','Namibia'),(149,'NR','NRU','Nauru'),(150,'NP','NPL','Nepal'),(151,'NL','NLD','Netherlands'),(152,'AN','ANT','Netherlands Antilles'),(153,'NC','NCL','New Caledonia'),(154,'NZ','NZL','New Zealand'),(155,'NI','NIC','Nicaragua'),(156,'NE','NER','Niger'),(157,'NG','NGA','Nigeria'),(158,'NU','NIU','Niue'),(159,'NF','NFK','Norfolk Island'),(160,'MP','MNP','Northern Mariana Islands'),(161,'NO','NOR','Norway'),(162,'OM','OMN','Oman'),(163,'PK','PAK','Pakistan'),(164,'PW','PLW','Palau'),(165,'PS','PSE','Palestinian Territories'),(166,'PA','PAN','Panama'),(167,'PG','PNG','Papua New Guinea'),(168,'PY','PRY','Paraguay'),(169,'PE','PER','Peru'),(170,'PH','PHL','Philippines'),(171,'PN','PCN','Pitcairn'),(172,'PL','POL','Poland'),(173,'PT','PRT','Portugal'),(174,'PR','PRI','Puerto Rico'),(175,'QA','QAT','Qatar'),(176,'RE','REU','RÉunion'),(177,'RO','ROU','Romania'),(178,'RU','RUS','Russian Federation'),(179,'RW','RWA','Rwanda'),(180,'SH','SHN','Saint Helena'),(181,'KN','KNA','Saint Kitts and Nevis'),(182,'LC','LCA','Saint Lucia'),(183,'PM','SPM','Saint Pierre and Miquelon'),(184,'VC','VCT','Saint Vincent and the Grenadines'),(185,'WS','WSM','Samoa (formerly Western Samoa)'),(186,'SM','SMR','San Marino (Republic of)'),(187,'ST','STP','Sao Tome and Principe'),(188,'SA','SAU','Saudi Arabia (Kingdom of Saudi Arabia)'),(189,'SN','SEN','Senegal'),(190,'CS','SCG','Serbia and Montenegro (formerly Yugoslavia)'),(191,'SC','SYC','Seychelles'),(192,'SL','SLE','Sierra Leone'),(193,'SG','SGP','Singapore'),(194,'SK','SVK','Slovakia (Slovak Republic)'),(195,'SI','SVN','Slovenia'),(196,'SB','SLB','Solomon Islands'),(197,'SO','SOM','Somalia'),(198,'ZA','ZAF','South Africa (zuid Afrika)'),(199,'GS','SGS','South Georgia and the South Sandwich Islands'),(200,'ES','ESP','Spain (españa)'),(201,'LK','LKA','Sri Lanka'),(202,'SD','SDN','Sudan'),(203,'SR','SUR','Suriname'),(204,'SJ','SJM','Svalbard and Jan Mayen'),(205,'SZ','SWZ','Swaziland'),(206,'SE','SWE','Sweden'),(207,'CH','CHE','Switzerland (Confederation of Helvetia)'),(208,'SY','SYR','Syrian Arab Republic'),(209,'TW','TWN','Taiwan (\"Chinese Taipei\" for IOC)'),(210,'TJ','TJK','Tajikistan'),(211,'TZ','TZA','Tanzania'),(212,'TH','THA','Thailand'),(213,'TL','TLS','Timor-Leste (formerly East Timor)'),(214,'TG','TGO','Togo'),(215,'TK','TKL','Tokelau'),(216,'TO','TON','Tonga'),(217,'TT','TTO','Trinidad and Tobago'),(218,'TN','TUN','Tunisia'),(219,'TR','TUR','Turkey'),(220,'TM','TKM','Turkmenistan'),(221,'TC','TCA','Turks and Caicos Islands'),(222,'TV','TUV','Tuvalu'),(223,'UG','UGA','Uganda'),(224,'UA','UKR','Ukraine'),(225,'AE','ARE','United Arab Emirates'),(226,'GB','GBR','United Kingdom (Great Britain)'),(227,'US','USA','United States'),(228,'UM','UMI','United States Minor Outlying Islands'),(229,'UY','URY','Uruguay'),(230,'UZ','UZB','Uzbekistan'),(231,'VU','VUT','Vanuatu'),(232,'VA','VAT','Vatican City (Holy See)'),(233,'VE','VEN','Venezuela'),(234,'VN','VNM','Viet Nam'),(235,'VG','VGB','Virgin Islands, British'),(236,'VI','VIR','Virgin Islands, U.S.'),(237,'WF','WLF','Wallis and Futuna'),(238,'EH','ESH','Western Sahara (formerly Spanish Sahara)'),(239,'YE','YEM','Yemen (Arab Republic)'),(240,'ZM','ZMB','Zambia'),(241,'ZW','ZWE','Zimbabwe');

/*Table structure for table `credit_limit` */

DROP TABLE IF EXISTS `credit_limit`;

CREATE TABLE `credit_limit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_credit_limit` (`customer_id`),
  CONSTRAINT `FK_credit_limit` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `credit_limit` */

/*Table structure for table `criteria_values` */

DROP TABLE IF EXISTS `criteria_values`;

CREATE TABLE `criteria_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color_or_size` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`),
  KEY `FK_criteria_values` (`color_or_size`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `criteria_values` */

insert  into `criteria_values`(`id`,`color_or_size`,`value`,`remarks`) values (1,16,'XXL',''),(2,15,'DARK BLUE',''),(3,16,'XL',''),(4,15,'BLACK',''),(5,15,'MILD BLUE',''),(6,15,'WHITE',''),(7,15,'GREEN',''),(8,15,'GRAY',''),(9,15,'RED',''),(10,15,'PURPLE',''),(11,16,'16','Inch'),(12,16,'16.5','Inch'),(13,16,'LARGE',''),(14,16,'SMALL',''),(15,15,'PRINTED',''),(16,15,'sadsdaf','');

/*Table structure for table `csv_tab` */

DROP TABLE IF EXISTS `csv_tab`;

CREATE TABLE `csv_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(255) DEFAULT NULL,
  `date` varchar(10) DEFAULT NULL,
  `in_time` varchar(5) DEFAULT NULL,
  `out_time` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `csv_tab` */

/*Table structure for table `custom_field1` */

DROP TABLE IF EXISTS `custom_field1`;

CREATE TABLE `custom_field1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `custom_field1` */

insert  into `custom_field1`(`id`,`title`,`details`) values (4,'adsf','');

/*Table structure for table `custom_field2` */

DROP TABLE IF EXISTS `custom_field2`;

CREATE TABLE `custom_field2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `custom_field2` */

insert  into `custom_field2`(`id`,`title`,`details`) values (7,'ddd',''),(8,'aaaa',''),(9,'fffff',''),(10,'eeeeeee','');

/*Table structure for table `custom_prod_fields` */

DROP TABLE IF EXISTS `custom_prod_fields`;

CREATE TABLE `custom_prod_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_id` int(11) DEFAULT NULL,
  `vehicle_brand` int(11) DEFAULT NULL,
  `suported_model1` int(11) DEFAULT NULL,
  `suported_model2` int(11) DEFAULT NULL,
  `suported_model3` int(11) DEFAULT NULL,
  `suported_model4` int(11) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_custom_prod_fields` (`prod_id`),
  CONSTRAINT `FK_custom_prod_fields` FOREIGN KEY (`prod_id`) REFERENCES `prod_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `custom_prod_fields` */

insert  into `custom_prod_fields`(`id`,`prod_id`,`vehicle_brand`,`suported_model1`,`suported_model2`,`suported_model3`,`suported_model4`,`cc`) values (3,2,4,7,8,9,10,'2500 CC'),(4,1,4,10,9,8,7,'2500 CC');

/*Table structure for table `customer_ab_validation` */

DROP TABLE IF EXISTS `customer_ab_validation`;

CREATE TABLE `customer_ab_validation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_field` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customer_ab_validation` */

insert  into `customer_ab_validation`(`id`,`validation_field`,`is_active`) values (1,'Customer Available Balance Validation On Sale Orders',2),(2,'Price Editable On Sale Orders & POS',2);

/*Table structure for table `customer_contact_persons` */

DROP TABLE IF EXISTS `customer_contact_persons`;

CREATE TABLE `customer_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_contact_persons2` (`company_id`),
  KEY `FK_contact_persons_designation` (`designation_id`),
  CONSTRAINT `FK_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer_contact_persons` */

/*Table structure for table `customers` */

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depot_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `customers` */

insert  into `customers`(`id`,`depot_id`,`company_name`,`company_address`,`company_contact_no`,`company_fax`,`company_email`,`company_web`,`opening_amount`) values (2,NULL,'Customer One','Customer One Address','334444443343','','','',0);

/*Table structure for table `departments` */

DROP TABLE IF EXISTS `departments`;

CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `departments` */

insert  into `departments`(`id`,`department_name`) values (9,'Support'),(10,'Marketing'),(11,'inventory'),(14,'Admin'),(15,'Account & Finance'),(17,'Sales'),(18,'Purchase'),(19,'Software Development');

/*Table structure for table `depot` */

DROP TABLE IF EXISTS `depot`;

CREATE TABLE `depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `contact_num` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `gureenty_money` double DEFAULT '0',
  `trade_licence` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `depot` */

insert  into `depot`(`id`,`name`,`address`,`contact_num`,`email`,`web`,`gureenty_money`,`trade_licence`) values (1,'Test Depot','','','','',0,'');

/*Table structure for table `designations` */

DROP TABLE IF EXISTS `designations`;

CREATE TABLE `designations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `designations` */

insert  into `designations`(`id`,`designation`) values (9,'Operator'),(11,'Assit. Operator'),(12,'Reporter'),(16,'Cutting Assist.'),(17,'Cleaner'),(18,'Loader'),(19,'Sweeper');

/*Table structure for table `discount_tab` */

DROP TABLE IF EXISTS `discount_tab`;

CREATE TABLE `discount_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` varchar(255) DEFAULT NULL,
  `discount` double DEFAULT '0',
  `no_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `discount_tab` */

insert  into `discount_tab`(`id`,`no`,`discount`,`no_type`) values (29,'1',NULL,40),(30,'2',NULL,40);

/*Table structure for table `discount_type` */

DROP TABLE IF EXISTS `discount_type`;

CREATE TABLE `discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `discount_type` */

insert  into `discount_type`(`id`,`title`,`is_active`) values (1,'PERCENTAGE',2),(2,'AMOUNT',1);

/*Table structure for table `emp_attendance` */

DROP TABLE IF EXISTS `emp_attendance`;

CREATE TABLE `emp_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_no` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `in_time` varchar(255) DEFAULT NULL,
  `out_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2690 DEFAULT CHARSET=utf8;

/*Data for the table `emp_attendance` */

insert  into `emp_attendance`(`id`,`card_no`,`date`,`in_time`,`out_time`) values (2390,'1461017','2014-10-15','07:35','21:56'),(2391,'1461666','2014-10-15','07:43','18:19'),(2392,'1463757','2014-10-15','07:45','22:03'),(2393,'1463822','2014-10-15','07:52','21:56'),(2394,'1464151','2014-10-15','07:43','20:20'),(2395,'1464683','2014-10-15','07:56','21:54'),(2396,'1465882','2014-10-15','07:53','21:55'),(2397,'1466292','2014-10-15','07:53','21:54'),(2398,'1467278','2014-10-15','07:48','22:00'),(2399,'1469885','2014-10-15','07:34','19:51'),(2400,'1471999','2014-10-15','07:53','22:02'),(2401,'1472521','2014-10-15','07:48','21:54'),(2402,'1472691','2014-10-15','07:50','22:03'),(2403,'1473134','2014-10-15','07:53','21:54'),(2404,'1474206','2014-10-15','07:57','22:30'),(2405,'1477313','2014-10-15','07:53','21:55'),(2406,'1477946','2014-10-15','07:49','21:59'),(2407,'1478016','2014-10-15','07:41','19:51'),(2408,'1480925','2014-10-15','07:51','19:51'),(2409,'1483328','2014-10-15','07:42','21:55'),(2410,'1484575','2014-10-15','07:47','21:56'),(2411,'1487145','2014-10-15','07:32','22:05'),(2412,'3571952','2014-10-15','07:46','19:59'),(2413,'3797587','2014-10-15','07:55','19:59'),(2414,'4118807','2014-10-15','07:53','21:52'),(2415,'5199417','2014-10-15','07:51','17:53'),(2416,'5207987','2014-10-15','07:48','21:55'),(2417,'5210243','2014-10-15','07:50','19:55'),(2418,'5217295','2014-10-15','07:56','20:01'),(2419,'5219951','2014-10-15','07:48','20:04'),(2420,'5240671','2014-10-15','07:55','19:58'),(2421,'5246304','2014-10-15','07:55','21:56'),(2422,'5260952','2014-10-15','07:47','21:55'),(2423,'5262907','2014-10-15','07:57','19:59'),(2424,'5264599','2014-10-15','07:54','19:59'),(2425,'5290806','2014-10-15','07:53','21:58'),(2426,'5354725','2014-10-15','07:53','19:59'),(2427,'5390518','2014-10-15','07:56','21:56'),(2428,'5392050','2014-10-15','07:50','21:56'),(2429,'5392571','2014-10-15','07:47','21:53'),(2430,'5392572','2014-10-15','07:37','19:59'),(2431,'5392573','2014-10-15','07:53','19:58'),(2432,'5392675','2014-10-15','06:37','20:06'),(2433,'5392688','2014-10-15','06:46','22:05'),(2434,'5392690','2014-10-15','07:53','17:10'),(2435,'5392692','2014-10-15','07:55','21:56'),(2436,'5392693','2014-10-15','07:43','19:54'),(2437,'5392696','2014-10-15','07:54','21:56'),(2438,'5393938','2014-10-15','07:51','19:55'),(2439,'5394342','2014-10-15','07:46','21:56'),(2440,'5395545','2014-10-15','07:52','17:24'),(2441,'5395724','2014-10-15','07:46','19:59'),(2442,'5396007','2014-10-15','07:49','19:56'),(2443,'5396023','2014-10-15','07:51','19:58'),(2444,'5396027','2014-10-15','07:51','21:55'),(2445,'5396041','2014-10-15','07:57','21:55'),(2446,'5396044','2014-10-15','07:49','19:56'),(2447,'5396310','2014-10-15','07:54','23:10'),(2448,'5396314','2014-10-15','07:42','19:58'),(2449,'5396315','2014-10-15','07:50','19:58'),(2450,'5396576','2014-10-15','07:41','21:56'),(2451,'5396579','2014-10-15','07:43','21:52'),(2452,'5396580','2014-10-15','07:57','20:04'),(2453,'5396581','2014-10-15','07:56','21:55'),(2454,'5396583','2014-10-15','07:57','21:56'),(2455,'5396584','2014-10-15','07:56','21:55'),(2456,'5397626','2014-10-15','07:56','17:10'),(2457,'5397721','2014-10-15','07:44','21:56'),(2458,'5398734','2014-10-15','07:45','19:59'),(2459,'5398736','2014-10-15','07:54','21:56'),(2460,'5399082','2014-10-15','07:45','17:08'),(2461,'5399084','2014-10-15','07:49','17:28'),(2462,'5399088','2014-10-15','07:55','21:55'),(2463,'5399324','2014-10-15','07:48','17:07'),(2464,'5399325','2014-10-15','07:52','21:58'),(2465,'5399328','2014-10-15','07:47','21:56'),(2466,'5399331','2014-10-15','07:47','21:59'),(2467,'5399332','2014-10-15','07:53','21:56'),(2468,'5399387','2014-10-15','07:54','21:56'),(2469,'5399995','2014-10-15','07:47','17:07'),(2470,'5400183','2014-10-15','07:52','19:57'),(2471,'5400186','2014-10-15','07:53','23:10'),(2472,'5400672','2014-10-15','07:52','21:56'),(2473,'5401960','2014-10-15','07:54','19:57'),(2474,'5406884','2014-10-15','07:47','17:21'),(2475,'5407541','2014-10-15','07:47','21:56'),(2476,'5407544','2014-10-15','07:58','20:00'),(2477,'5408081','2014-10-15','07:43','21:56'),(2478,'5408276','2014-10-15','07:53','21:56'),(2479,'5408280','2014-10-15','07:45','19:57'),(2480,'5408723','2014-10-15','07:55','21:55'),(2481,'5409424','2014-10-15','07:57','21:55'),(2482,'5409425','2014-10-15','07:42','21:56'),(2483,'5409428','2014-10-15','07:54','21:55'),(2484,'5409815','2014-10-15','07:49','17:53'),(2485,'5409816','2014-10-15','07:56','19:58'),(2486,'5409817','2014-10-15','07:46','21:55'),(2487,'5409946','2014-10-15','07:52','21:54'),(2488,'5410039','2014-10-15','07:34','21:57'),(2489,'5410093','2014-10-15','07:46','20:01'),(2490,'5410111','2014-10-15','07:55','19:59'),(2491,'5410517','2014-10-15','07:53','21:56'),(2492,'5410860','2014-10-15','07:52','19:57'),(2493,'5410896','2014-10-15','07:48','17:26'),(2494,'5410899','2014-10-15','07:53','19:58'),(2495,'5410902','2014-10-15','07:55','21:55'),(2496,'5411074','2014-10-15','07:44','19:59'),(2497,'5411622','2014-10-15','07:44','21:55'),(2498,'5411628','2014-10-15','21:55','21:55'),(2499,'5412204','2014-10-15','07:29','21:51'),(2500,'5412206','2014-10-15','07:48','19:59'),(2501,'5414720','2014-10-15','07:47','21:55'),(2502,'5414721','2014-10-15','07:51','21:55'),(2503,'5414722','2014-10-15','07:44','21:56'),(2504,'5414725','2014-10-15','07:49','21:54'),(2505,'5415743','2014-10-15','07:47','19:56'),(2506,'5415858','2014-10-15','07:51','21:53'),(2507,'5415873','2014-10-15','07:56','21:56'),(2508,'5417105','2014-10-15','08:29','20:00'),(2509,'5417107','2014-10-15','07:53','21:56'),(2510,'5417924','2014-10-15','07:53','19:58'),(2511,'5417925','2014-10-15','07:46','21:56'),(2512,'5417928','2014-10-15','07:56','21:56'),(2513,'5417930','2014-10-15','07:52','21:55'),(2514,'5420899','2014-10-15','07:33','19:57'),(2515,'5420901','2014-10-15','07:46','17:08'),(2516,'5420902','2014-10-15','07:46','21:56'),(2517,'5420920','2014-10-15','07:52','19:55'),(2518,'5421492','2014-10-15','07:48','21:54'),(2519,'5421493','2014-10-15','07:56','21:56'),(2520,'5422203','2014-10-15','07:49','21:54'),(2521,'5422205','2014-10-15','07:52','21:55'),(2522,'5422206','2014-10-15','07:53','21:56'),(2523,'5422207','2014-10-15','07:48','21:54'),(2524,'5422715','2014-10-15','07:41','20:01'),(2525,'5423707','2014-10-15','07:47','21:56'),(2526,'5432057','2014-10-15','07:56','21:56'),(2527,'5432555','2014-10-15','07:54','20:01'),(2528,'5435208','2014-10-15','07:52','21:56'),(2529,'5435621','2014-10-15','07:50','21:54'),(2530,'5435623','2014-10-15','07:50','21:56'),(2531,'5436922','2014-10-15','07:58','19:51'),(2532,'5436924','2014-10-15','07:56','21:56'),(2533,'5436925','2014-10-15','07:54','19:57'),(2534,'5436926','2014-10-15','07:44','21:55'),(2535,'5440495','2014-10-15','06:53','22:03'),(2536,'5440496','2014-10-15','07:45','19:55'),(2537,'5440498','2014-10-15','07:50','21:54'),(2538,'5440499','2014-10-15','07:44','20:00'),(2539,'5440657','2014-10-15','06:53','22:03'),(2540,'5441567','2014-10-15','07:52','19:58'),(2541,'5444172','2014-10-15','07:54','19:58'),(2542,'5444174','2014-10-15','07:46','19:58'),(2543,'5444180','2014-10-15','07:50','21:56'),(2544,'5444796','2014-10-15','07:48','21:56'),(2545,'5444799','2014-10-15','07:50','17:24'),(2546,'5444800','2014-10-15','07:44','19:57'),(2547,'5444801','2014-10-15','07:50','19:58'),(2548,'5444804','2014-10-15','07:43','21:57'),(2549,'5978440','2014-10-15','07:25','16:40'),(2550,'5979100','2014-10-15','07:55','21:52'),(2551,'5979300','2014-10-15','07:48','20:50'),(2552,'5980453','2014-10-15','07:51','17:19'),(2553,'5980997','2014-10-15','07:51','21:54'),(2554,'5981168','2014-10-15','07:34','20:55'),(2555,'5982978','2014-10-15','07:59','21:55'),(2556,'5985202','2014-10-15','08:00','19:33'),(2557,'5985209','2014-10-15','08:08','19:33'),(2558,'5985852','2014-10-15','07:53','19:54'),(2559,'5986516','2014-10-15','07:26','22:07'),(2560,'5987445','2014-10-15','07:26','20:03'),(2561,'5988523','2014-10-15','07:43','19:32'),(2562,'5989246','2014-10-15','07:19','20:07'),(2563,'5989516','2014-10-15','08:00','19:33'),(2564,'5990403','2014-10-15','07:49','19:30'),(2565,'5991967','2014-10-15','07:43','19:51'),(2566,'5993022','2014-10-15','07:49','19:51'),(2567,'5997401','2014-10-15','07:53','19:52'),(2568,'5997831','2014-10-15','07:57','20:05'),(2569,'6000737','2014-10-15','07:52','21:57'),(2570,'6004916','2014-10-15','07:25','20:06'),(2571,'6006027','2014-10-15','07:44','20:07'),(2572,'8035271','2014-10-15','07:40','21:55'),(2573,'8037263','2014-10-15','07:48','19:55'),(2574,'8050931','2014-10-15','07:40','23:09'),(2575,'8055411','2014-10-15','07:53','19:56'),(2576,'8056200','2014-10-15','07:37','20:04'),(2577,'8056397','2014-10-15','07:49','21:57'),(2578,'8056398','2014-10-15','07:40','21:58'),(2579,'8056401','2014-10-15','07:55','22:03'),(2580,'8056402','2014-10-15','07:45','17:21'),(2581,'8056403','2014-10-15','07:50','07:50'),(2582,'8056548','2014-10-15','07:55','19:58'),(2583,'8057130','2014-10-15','07:54','17:08'),(2584,'8058142','2014-10-15','07:52','21:55'),(2585,'8058813','2014-10-15','07:53','21:58'),(2586,'8058995','2014-10-15','07:51','19:59'),(2587,'8058996','2014-10-15','07:53','19:54'),(2588,'8059575','2014-10-15','07:31','21:55'),(2589,'8059581','2014-10-15','07:53','19:59'),(2590,'8059753','2014-10-15','07:48','19:58'),(2591,'8059754','2014-10-15','07:49','17:10'),(2592,'8060511','2014-10-15','07:54','19:58'),(2593,'8060585','2014-10-15','07:32','21:54'),(2594,'8060587','2014-10-15','07:51','20:01'),(2595,'8060588','2014-10-15','07:46','21:56'),(2596,'8060591','2014-10-15','07:41','21:55'),(2597,'8060667','2014-10-15','07:54','20:00'),(2598,'8060673','2014-10-15','07:55','17:21'),(2599,'8060676','2014-10-15','07:55','20:02'),(2600,'8061022','2014-10-15','07:53','19:59'),(2601,'8061322','2014-10-15','07:52','19:58'),(2602,'8062703','2014-10-15','07:47','19:58'),(2603,'8062704','2014-10-15','07:52','17:24'),(2604,'8063316','2014-10-15','07:42','21:54'),(2605,'8063429','2014-10-15','07:48','20:01'),(2606,'8063600','2014-10-15','07:47','21:55'),(2607,'8064034','2014-10-15','07:43','21:58'),(2608,'8064037','2014-10-15','07:56','21:59'),(2609,'8064782','2014-10-15','07:57','19:58'),(2610,'8064856','2014-10-15','07:45','21:57'),(2611,'8064857','2014-10-15','07:26','22:56'),(2612,'8064861','2014-10-15','07:53','19:58'),(2613,'8064864','2014-10-15','07:50','21:56'),(2614,'8064865','2014-10-15','07:55','19:58'),(2615,'8066156','2014-10-15','07:48','19:59'),(2616,'8066158','2014-10-15','06:48','22:02'),(2617,'8066160','2014-10-15','07:52','21:54'),(2618,'8066161','2014-10-15','07:45','21:56'),(2619,'8066164','2014-10-15','07:52','21:54'),(2620,'8067125','2014-10-15','07:48','21:54'),(2621,'8067126','2014-10-15','07:42','20:00'),(2622,'8067127','2014-10-15','07:56','21:53'),(2623,'8067143','2014-10-15','07:53','19:55'),(2624,'8067144','2014-10-15','07:56','21:56'),(2625,'8067146','2014-10-15','08:29','19:56'),(2626,'8067149','2014-10-15','07:43','21:57'),(2627,'8068877','2014-10-15','07:45','19:57'),(2628,'8068900','2014-10-15','07:54','23:10'),(2629,'8068901','2014-10-15','07:47','23:09'),(2630,'8068918','2014-10-15','07:43','17:07'),(2631,'8068919','2014-10-15','07:53','21:55'),(2632,'8070277','2014-10-15','07:43','21:55'),(2633,'8070953','2014-10-15','07:57','17:07'),(2634,'8070954','2014-10-15','07:47','20:05'),(2635,'8070955','2014-10-15','07:52','19:58'),(2636,'8070956','2014-10-15','07:52','21:56'),(2637,'8071107','2014-10-15','07:53','17:07'),(2638,'8071109','2014-10-15','07:55','17:20'),(2639,'8071113','2014-10-15','07:51','17:08'),(2640,'8071124','2014-10-15','07:47','21:57'),(2641,'8071161','2014-10-15','07:46','19:57'),(2642,'8071316','2014-10-15','07:42','21:57'),(2643,'8071317','2014-10-15','07:53','20:00'),(2644,'8071320','2014-10-15','07:56','21:56'),(2645,'8071342','2014-10-15','07:54','21:53'),(2646,'8071384','2014-10-15','07:54','19:56'),(2647,'8071495','2014-10-15','07:53','21:55'),(2648,'8071497','2014-10-15','07:47','17:06'),(2649,'8071498','2014-10-15','07:54','21:53'),(2650,'8071617','2014-10-15','07:49','21:53'),(2651,'8071621','2014-10-15','07:53','21:56'),(2652,'8073683','2014-10-15','07:51','19:59'),(2653,'8073684','2014-10-15','07:50','21:56'),(2654,'8073689','2014-10-15','07:48','21:55'),(2655,'8073691','2014-10-15','07:48','23:10'),(2656,'8073692','2014-10-15','07:46','20:10'),(2657,'8074382','2014-10-15','07:55','20:02'),(2658,'8074384','2014-10-15','07:54','19:57'),(2659,'8075080','2014-10-15','07:56','21:53'),(2660,'8075088','2014-10-15','07:54','19:58'),(2661,'8075112','2014-10-15','07:55','20:00'),(2662,'8075508','2014-10-15','07:42','23:03'),(2663,'8075510','2014-10-15','07:47','21:56'),(2664,'8075529','2014-10-15','07:48','20:09'),(2665,'8075781','2014-10-15','07:50','21:55'),(2666,'8075784','2014-10-15','07:37','17:12'),(2667,'8075785','2014-10-15','07:50','21:57'),(2668,'8076237','2014-10-15','07:47','21:54'),(2669,'8076243','2014-10-15','07:52','17:08'),(2670,'8076640','2014-10-15','07:56','21:53'),(2671,'8076642','2014-10-15','07:42','21:53'),(2672,'8077921','2014-10-15','07:54','21:57'),(2673,'8077923','2014-10-15','07:51','21:54'),(2674,'8080653','2014-10-15','07:48','23:10'),(2675,'8080721','2014-10-15','07:56','17:07'),(2676,'8080723','2014-10-15','07:49','23:10'),(2677,'8081116','2014-10-15','07:48','21:53'),(2678,'8081306','2014-10-15','07:47','21:55'),(2679,'8082512','2014-10-15','07:50','21:54'),(2680,'8082549','2014-10-15','07:36','21:53'),(2681,'8082553','2014-10-15','07:56','17:06'),(2682,'8082555','2014-10-15','07:55','19:58'),(2683,'8082560','2014-10-15','07:51','21:55'),(2684,'8082665','2014-10-15','07:50','19:56'),(2685,'8082673','2014-10-15','07:57','21:56'),(2686,'8082879','2014-10-15','07:53','21:59'),(2687,'8083091','2014-10-15','06:42','19:59'),(2688,'2233445566778899','2014-10-20','08:04','13:00'),(2689,'2233445566778899','2014-10-21','08:00','14:15');

/*Table structure for table `emp_leave_normal_status_history` */

DROP TABLE IF EXISTS `emp_leave_normal_status_history`;

CREATE TABLE `emp_leave_normal_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_leave_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_leave_normal_status_history` (`emp_leave_id`),
  CONSTRAINT `FK_emp_leave_normal_status_history` FOREIGN KEY (`emp_leave_id`) REFERENCES `emp_leaves_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `emp_leave_normal_status_history` */

insert  into `emp_leave_normal_status_history`(`id`,`emp_leave_id`,`status`,`status_changed_by`,`status_changed_time`) values (1,1,16,1,'2014-10-08 10:38:21'),(2,2,16,1,'2014-10-08 10:51:00'),(3,2,16,1,'2014-10-08 10:51:02');

/*Table structure for table `emp_leave_status_history` */

DROP TABLE IF EXISTS `emp_leave_status_history`;

CREATE TABLE `emp_leave_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_leave_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_leave_status_history` (`emp_leave_id`),
  CONSTRAINT `FK_emp_leave_status_history` FOREIGN KEY (`emp_leave_id`) REFERENCES `emp_leaves` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_leave_status_history` */

insert  into `emp_leave_status_history`(`id`,`emp_leave_id`,`status`,`status_changed_by`,`status_changed_time`) values (1,1,16,1,'2014-10-18 14:04:48');

/*Table structure for table `emp_leaves` */

DROP TABLE IF EXISTS `emp_leaves`;

CREATE TABLE `emp_leaves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `lh_proll_id` int(11) DEFAULT NULL,
  `day_to_leave` double DEFAULT NULL,
  `hour_to_leave` double DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `details` text,
  `is_approved` int(11) DEFAULT '15',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_leaves` (`emp_id`),
  CONSTRAINT `FK_emp_leaves` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `emp_leaves` */

insert  into `emp_leaves`(`id`,`transaction_date`,`emp_id`,`lh_proll_id`,`day_to_leave`,`hour_to_leave`,`subj`,`details`,`is_approved`,`create_by`,`create_time`,`update_by`,`update_time`,`day`,`month`,`year`) values (1,'2014-10-18',1,1,2,48,'asdf','',16,1,'2014-10-18 14:04:43',NULL,NULL,'18','10','2014');

/*Table structure for table `emp_leaves_normal` */

DROP TABLE IF EXISTS `emp_leaves_normal`;

CREATE TABLE `emp_leaves_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `lh_proll_normal_id` int(11) DEFAULT NULL,
  `day_to_leave` double DEFAULT NULL,
  `hour_to_leave` double DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `details` text,
  `is_approved` int(11) DEFAULT '15',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `day` varchar(2) DEFAULT NULL,
  `month` varchar(2) DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_leaves_normal` (`lh_proll_normal_id`),
  KEY `FK_employees` (`emp_id`),
  CONSTRAINT `FK_employees` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `emp_leaves_normal` */

insert  into `emp_leaves_normal`(`id`,`transaction_date`,`emp_id`,`lh_proll_normal_id`,`day_to_leave`,`hour_to_leave`,`subj`,`details`,`is_approved`,`create_by`,`create_time`,`update_by`,`update_time`,`day`,`month`,`year`) values (1,'2014-10-08',1,2,4,96,'Application For 5 Days Off','',16,1,'2014-10-08 10:37:44',NULL,NULL,'08','10','2014'),(2,'2014-09-10',1,2,3,72,'Application For 3 Days Off','',16,1,'2014-10-08 10:50:56',NULL,NULL,'10','09','2014');

/*Table structure for table `emp_resign` */

DROP TABLE IF EXISTS `emp_resign`;

CREATE TABLE `emp_resign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text,
  `date` date DEFAULT NULL,
  `is_approved` int(11) DEFAULT '15',
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_resign` (`employee_id`),
  CONSTRAINT `FK_emp_resign` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_resign` */

/*Table structure for table `emp_resign_history` */

DROP TABLE IF EXISTS `emp_resign_history`;

CREATE TABLE `emp_resign_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_resign_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_resign_history` (`employee_resign_id`),
  CONSTRAINT `FK_emp_resign_history` FOREIGN KEY (`employee_resign_id`) REFERENCES `emp_resign` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `emp_resign_history` */

/*Table structure for table `employees` */

DROP TABLE IF EXISTS `employees`;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id_no` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `national_id_no` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `contact_no_office` varchar(255) DEFAULT NULL,
  `contact_no_home` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` text,
  `team_id` int(11) DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `permanent_date` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `permanent_address` text,
  `father_name` varchar(255) DEFAULT NULL,
  `father_occupation` varchar(255) DEFAULT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `mother_occopation` varchar(255) DEFAULT NULL,
  `spouse_name` varchar(255) DEFAULT NULL,
  `spouse_details` text,
  `spouse_relation` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `marital_status` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `blood_group` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `sub_section_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `employee_type` int(11) DEFAULT NULL,
  `bank_ac_no` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `prev_info` text,
  `edu_info` text,
  `contact_end` date DEFAULT NULL,
  `skills` text,
  `photo` varchar(255) DEFAULT NULL,
  `stuff_cat_id` int(11) DEFAULT NULL,
  `stuff_sub_cat_id` int(11) DEFAULT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `paygrade_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

/*Data for the table `employees` */

insert  into `employees`(`id`,`emp_id_no`,`full_name`,`designation_id`,`department_id`,`id_no`,`national_id_no`,`contact_no`,`contact_no_office`,`contact_no_home`,`email`,`address`,`team_id`,`join_date`,`permanent_date`,`is_active`,`permanent_address`,`father_name`,`father_occupation`,`mother_name`,`mother_occopation`,`spouse_name`,`spouse_details`,`spouse_relation`,`gender`,`marital_status`,`country_id`,`blood_group`,`dob`,`section_id`,`sub_section_id`,`branch_id`,`employee_type`,`bank_ac_no`,`bank`,`prev_info`,`edu_info`,`contact_end`,`skills`,`photo`,`stuff_cat_id`,`stuff_sub_cat_id`,`shift_id`,`paygrade_id`) values (1,'20141004011029','Md. Mohallil Haque Tanim',19,19,'2233445566778899','','','','','','',1,'2014-10-04','0000-00-00',1,'','','','','','','',NULL,56,NULL,NULL,NULL,'1986-02-27',1,NULL,NULL,69,'','','','','0000-00-00','','46_Desert.jpg',NULL,NULL,1,1),(3,'0509-1029','মোসাঃ মঞ্জুুয়ারা',16,19,'8069774','','','','','','',1,'2009-05-13','0000-00-00',1,'গ্রাম -চানদাস পোঃচানদাস থানা -মহাদেবপুর জেলা -নওগাঁ','','','নাছরিন','','মৃত সমসের মন্ডল','',NULL,57,NULL,NULL,NULL,'1988-02-01',1,NULL,NULL,69,'','','','','0000-00-00','','',NULL,NULL,1,1),(4,'1009-1174','মোসাঃ নাসরিন',11,15,'5402344','','','','','','',1,'2009-10-01','0000-00-00',1,'গ্রাম -দুবরাজপুর পোঃলালদিঘী ফতেপুর থানা -পীরগঞ্জ জেলা -রংপুর','','','রিনা বেগম','','ওসমান গনি ','',NULL,57,NULL,NULL,NULL,'1985-01-01',1,NULL,NULL,69,'','','','','0000-00-00','','',NULL,NULL,NULL,NULL),(5,'0310-1532','রুমা আক্তার',19,19,'8061024',NULL,NULL,NULL,NULL,NULL,NULL,2,'2010-03-11',NULL,1,'গ্রাম -মঙ্গলশ্রী পোঃসুঘারী বাজার থানা -আটপাড়া জেলা -নেত্রকোনা',NULL,NULL,'জহুরা আক্তার',NULL,'রোশন আলী',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'0310-1550','লিলি খাতুন',19,19,'8068874',NULL,NULL,NULL,NULL,NULL,NULL,2,'2010-03-10',NULL,1,'গ্রাম -বড় আমবাড়ী পোঃগুর্জিপাড়া থানা -পীরগঞ্জ জেলা -রংপুর',NULL,NULL,'সুফিয়া',NULL,'গোলাম মোস্তফা',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'1210-2086','মোসাঃ মিনারা বেগম',19,19,'8055380',NULL,NULL,NULL,NULL,NULL,NULL,2,'2010-12-14',NULL,1,'গ্রাম -টাংগাবো পোঃটাংগাবো থানা -গফরগাও জেলা -ময়মনসিংহ',NULL,NULL,'জায়ফল',NULL,'মো: কাশেম',NULL,NULL,NULL,NULL,NULL,NULL,'1980-02-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'0511-2468','মোসাঃ পারভিন নাহার',19,19,'8063564',NULL,NULL,NULL,NULL,NULL,NULL,3,'2011-05-11',NULL,1,'গ্রাম -বিশগিরি পাড়া পোঃ ঝাকরকান্দি থানা - নালিতা বাড়ী জেলা - শেরপুর',NULL,NULL,'মুশিদা খাতুন',NULL,'শাহ্ আলম',NULL,NULL,NULL,NULL,NULL,NULL,'1987-05-09',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'0511-2470','রেবেকা বেগম',19,19,'5390353',NULL,NULL,NULL,NULL,NULL,NULL,3,'2011-05-12',NULL,1,'গ্রাম -মাঝবাড়ী পোঃ মাঝবাড়ী থানা - কোটালীগপাড়া জেলা - গোপলগঞ্জ',NULL,NULL,'হাফিজা বেগম',NULL,'আজহার গাজী',NULL,NULL,NULL,NULL,NULL,NULL,'1978-06-05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'0611-2486','মোসাঃ রোজিনা বেগম',19,19,'5413010',NULL,NULL,NULL,NULL,NULL,NULL,3,'2011-06-01',NULL,1,'গ্রাম -তুলসীপুর পোঃ মিঠাপুকুর থানা - মিঠাপুকুর জেলা - রংপুর',NULL,NULL,'ফিরোজা বেগম',NULL,'মো: শাহিন',NULL,NULL,NULL,NULL,NULL,NULL,'1984-02-10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'0611-2552','মোসাঃ মুন্নি খাতুন',19,19,'5395982',NULL,NULL,NULL,NULL,NULL,NULL,4,'2011-06-18',NULL,1,'গ্রাম -বগেরবাড়ী পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'মহিরন নেছা',NULL,'মৃত হানিফ',NULL,NULL,NULL,NULL,NULL,NULL,'1992-01-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'1111-2643','রুমা বেগম',19,19,'5407448',NULL,NULL,NULL,NULL,NULL,NULL,4,'2011-11-15',NULL,1,'গ্রাম -বক্সিচর পোঃ চাঁদপাশা থানা - বাবুগঞ্জ জেলা - বরিশাল',NULL,NULL,'সালমা বেগম',NULL,'জাহাঙ্গীর',NULL,NULL,NULL,NULL,NULL,NULL,'1982-08-03',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'0412-2887','মাহমুদা খাতুন',19,19,'5413394',NULL,NULL,NULL,NULL,NULL,NULL,4,'2012-04-11',NULL,1,'গ্রাম -কুমেদপুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'জাহানারা বেগম',NULL,'আতাহার আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1992-10-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'1112-3295','মোঃ জিয়ারুল',19,19,'5394918',NULL,NULL,NULL,NULL,NULL,NULL,5,'2012-11-06',NULL,1,'গ্রাম -কানিনগর পোঃ আহম্মদ নগর থানা - ঝিনাগাজী জেলা - শেরপুর',NULL,NULL,'জিবনা',NULL,'সংশের আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1985-03-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'1112-3382','আলমগীর মোল্লা',19,19,'8059749',NULL,NULL,NULL,NULL,NULL,NULL,5,'2012-11-10',NULL,1,'গ্রাম -বানিয়ারী পোঃ সুলতানপুর থানা - রাজবাড়ী জেলা - রাজবাড়ী',NULL,NULL,'আলেয়া বেগম',NULL,'সামছেল মোল্লা',NULL,NULL,NULL,NULL,NULL,NULL,'1993-11-10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'1212-3432','ফেরদৌসি আক্তার',19,19,'5404945',NULL,NULL,NULL,NULL,NULL,NULL,5,'2012-12-09',NULL,1,'গ্রাম -ক্ষদ্রা শিধনী পোঃ বিষমপুর থানা - কমলা কান্দা জেলা - নেত্রকোনা',NULL,NULL,'আল্লাদুনেছা',NULL,'ফরিদ মিয়া',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'0113-3554','নার্গিস বেগম',19,19,'5406423',NULL,NULL,NULL,NULL,NULL,NULL,6,'2013-01-09',NULL,1,'গ্রাম -তেতুলিয়া পোঃ তেতুলিয়া থানা - উল্লাপাড়া জেলা - সিরাজগঞ্জ',NULL,NULL,'হাজেরা বেগম',NULL,'রেজাউল করিম',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'0113-3573','রোজিনা বেগম',19,19,'5391566',NULL,NULL,NULL,NULL,NULL,NULL,6,'2013-01-12',NULL,1,'গ্রাম -খোলাহাট পোঃ শানেরহাট থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'জরিনা বেগম',NULL,'আছাদ আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1982-05-10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'0213-3657','সালেহা খাতুন',19,19,'5402343',NULL,NULL,NULL,NULL,NULL,NULL,6,'2013-02-09',NULL,1,'গ্রাম -কুমারগাতী পোঃ মাজড়াকুরা থানা - হালুয়া ঘাট জেলা - ময়মনসিংহ',NULL,NULL,'লাইলী বেগম',NULL,'মৃত জয়নাল',NULL,NULL,NULL,NULL,NULL,NULL,'0993-11-18',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'0413-3853','মোসাঃ সুইটি আক্তার',19,19,'',NULL,NULL,NULL,NULL,NULL,NULL,7,'2013-04-11',NULL,1,'গ্রাম -মাহমুদ পুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'সুপিয়া বেগম',NULL,'হেলাল উদ্দীন',NULL,NULL,NULL,NULL,NULL,NULL,'1992-07-05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'0613-4026','নাসরিন আক্তার',19,19,'5404120',NULL,NULL,NULL,NULL,NULL,NULL,7,'2013-06-02',NULL,1,'গ্রাম -শালিয়া পোঃ শালিয়া থানা - ফুলপুর জেলা - ময়মনসিংহ',NULL,NULL,'মারজিনা খাতুন',NULL,'আব্দুল হাই',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'0613-4036','আইরিন বেগম',19,19,'5390351',NULL,NULL,NULL,NULL,NULL,NULL,7,'2013-06-11',NULL,1,'গ্রাম -বড়রসুলপুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'মালেকা বেগম',NULL,'ইস্তাদুল',NULL,NULL,NULL,NULL,NULL,NULL,'1986-06-05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'1113-4262','আঁখি আক্তার',19,19,'5402340',NULL,NULL,NULL,NULL,NULL,NULL,8,'2013-11-11',NULL,1,'গ্রাম -ফরাজীপাড়া পোঃ ফারাজী পাড়া থানা - দেওয়ানগঞ্জ জেলা - জামালপুর',NULL,NULL,'বানিয়া খাতুন',NULL,'সুরুত আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1990-01-10',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'1213-4332','সুরভী খাতুন',19,19,'5390354',NULL,NULL,NULL,NULL,NULL,NULL,8,'2013-12-18',NULL,1,'গ্রাম -শিতলপুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'মিনারা বেগম',NULL,'আফছার আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1994-07-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'1213-4352','শাহানাজ বেগম',19,19,'5411139',NULL,NULL,NULL,NULL,NULL,NULL,8,'2013-12-26',NULL,1,'গ্রাম -ভাংগামোড় পোঃ ভরতখালী থানা - সাঘাটা জেলা - গাইবান্ধা',NULL,NULL,'দুলালী বেগম',NULL,'রাজা রহমান',NULL,NULL,NULL,NULL,NULL,NULL,'0986-11-21',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'0114-4371','রূপালী বেগম',19,19,'8059745',NULL,NULL,NULL,NULL,NULL,NULL,1,'2014-01-14',NULL,1,'গ্রাম -মাদারটারী পোঃ ধরনীবাড়ী থানা - উলিপুর জেলা - কুড়িগ্রাম',NULL,NULL,'আছমা বেগম',NULL,'আলম মিয়া',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'0114-4376','আলামিন মিয়া',19,19,'5395977',NULL,NULL,NULL,NULL,NULL,NULL,9,'2014-01-12',NULL,1,'গ্রাম -হরিপুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'হাজেরা বেগম',NULL,'সুলতান আলী',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'0114-4378','মিম বেগম',11,19,'5395978',NULL,NULL,NULL,NULL,NULL,NULL,9,'2014-01-11',NULL,1,'গ্রাম -মির্জাপুর পোঃ ভেন্ডাবাড়ী থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'মাহমুদা বেগম',NULL,'হাফিজার রহমান',NULL,NULL,NULL,NULL,NULL,NULL,'1992-02-05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'0114-4379','মিতুলী বেগম',11,19,'5395981',NULL,NULL,NULL,NULL,NULL,NULL,9,'2014-01-13',NULL,1,'গ্রাম -বগেরবাড়ী পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'আনোয়ারা বেগম',NULL,'মোস্তাফিজার',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'0214-4416','হোসনে আরা',11,19,'5393613',NULL,NULL,NULL,NULL,NULL,NULL,10,'2014-02-02',NULL,1,'গ্রাম -ধোপাকল পোঃ নরুলহুদা থানা - পার্বতীপুর জেলা - দিনাজপুর',NULL,NULL,'মহুরা খাতুন',NULL,'মন্জুরুল',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'0314-4465','রেহেনা খাতুন',11,19,'5388971',NULL,NULL,NULL,NULL,NULL,NULL,10,'2014-03-05',NULL,1,'গ্রাম -প্রাননাথপুর পোঃ ভেন্ডাবাড়ী থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'জহুরা বেগম',NULL,'আব্দুর রাজ্জাক',NULL,NULL,NULL,NULL,NULL,NULL,'1988-12-25',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'0314-4472','মাহমুদা বেগম',9,19,'',NULL,NULL,NULL,NULL,NULL,NULL,10,'2014-03-15',NULL,1,'গ্রাম -ভরট্রজানপুর পোঃ অনন্তরামপুর থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'মৌলুদা খাতুন',NULL,'আমিনুল',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'0611-2498','মোসাঃ মোসলেমা বেগম',9,19,'5394902',NULL,NULL,NULL,NULL,NULL,NULL,10,'2011-06-07',NULL,1,'গ্রাম -দুবরাজপুর পোঃ ফতেপুর লালদিঘী থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'আজুপা খাতুন',NULL,'রফিকুল',NULL,NULL,NULL,NULL,NULL,NULL,'1982-10-04',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'1111-2608','শ্রীমতি শান্তনা রানী',12,19,'8059605',NULL,NULL,NULL,NULL,NULL,NULL,10,'2011-11-13',NULL,1,'গ্রাম -এশরামপুর পোঃ পানবাজার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'পপিল রানী',NULL,'সুশান্ত চন্দ্রবর্মন',NULL,NULL,NULL,NULL,NULL,NULL,'1981-10-05',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'1112-3340','শ্রীমতি সবিতা বানী',12,19,'8071105',NULL,NULL,NULL,NULL,NULL,NULL,10,'2012-11-03',NULL,1,'গ্রাম -কাঞ্চনপুর পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'সম্পা রানী',NULL,'কৃঞ্চ চন্দ্রপাল',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'1212-3418','স্বপ্না আক্তার',17,19,'8068920',NULL,NULL,NULL,NULL,NULL,NULL,0,'2012-12-08',NULL,1,'গ্রাম -হরিপুর লুড়াপাড় পোঃ উসিৃ থানা - গফরগাও জেলা - ময়মনসিংহ',NULL,NULL,'সেবিনা খাতুন',NULL,'মোহাম্মদ আলী',NULL,NULL,NULL,NULL,NULL,NULL,'1993-01-01',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'0413-3812','মোসাঃ কাজলী খাতুন ',16,19,'5399870',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-04-01',NULL,1,'গ্রাম -দামোদারপুর পোঃ শানেরহাট থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'লাভলী বেগম',NULL,'কাশেম',NULL,NULL,NULL,NULL,NULL,NULL,'1995-03-10',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'0613-3999','নাজমা বেগম',17,19,'5413392',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-04',NULL,1,'গ্রাম -এনায়েতপুর পোঃ জাহাঙ্গীরাবাদ থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'ছালিমা বেগম',NULL,'লাল মিয়া',NULL,NULL,NULL,NULL,NULL,NULL,'1989-01-01',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'0613-4045','রোকিয়া বেগম',16,19,'8060672',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-12',NULL,1,'গ্রাম -বদরপুর পোঃ রাজিবপুর থানা - রাজিবপুর জেলা - কুড়িগ্রাম',NULL,NULL,'তছিরন বেগম',NULL,'ইফসুব আলী',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'0613-4054','লাবনী বেগম',18,19,'5167464',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-10',NULL,1,'গ্রাম -মেষ্টা পোঃ শানেরহাট থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'হালিমা',NULL,'মুনজুর মিয়া',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'0613-4060','রোজিনা খাতুন',19,19,'5429351',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-12',NULL,1,'গ্রাম -সংকর মাধবপুর পোঃ কোদাল কাটি থানা - রাজিবপুর জেলা - কুড়িগ্রাম',NULL,NULL,'লাল ভানু',NULL,'মোঃ আঃ রহিম',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'0613-4064','রফিকুল ইসলাম',19,19,'8082673',NULL,NULL,NULL,NULL,NULL,NULL,0,'2013-06-10',NULL,1,'গ্রাম -চকপাট্টা কাটা পোঃ চকপাট্টা কাটা থানা - নকলা জেলা - শেরপুর',NULL,NULL,'সমলা বেগম',NULL,'আব্দুস সালাম',NULL,NULL,NULL,NULL,NULL,NULL,'1983-01-02',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'0314-4429','রুমি খাতুন',18,19,'8055382',NULL,NULL,NULL,NULL,NULL,NULL,0,'2014-03-03',NULL,1,'গ্রাম -দিগদুয়ার পোঃ বাগদুয়ার থানা - পীরগঞ্জ জেলা - রংপুর',NULL,NULL,'আয়েশা বেগম',NULL,'আব্দুর রহমান',NULL,NULL,NULL,NULL,NULL,NULL,'1995-05-01',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `stock_in` double DEFAULT '0',
  `stock_out` double DEFAULT '0',
  `sell_price` double DEFAULT '0',
  `transaction_date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `is_agree` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `inventory` */

insert  into `inventory`(`id`,`store_id`,`item_id`,`brand_id`,`model_id`,`code`,`stock_in`,`stock_out`,`sell_price`,`transaction_date`,`month`,`year`,`is_agree`) values (1,2,1,1,2,'343qaefadfadf',200,0,0,'2014-09-16',09,2014,0),(2,2,1,1,2,'343qaefadfadf',0,10,0,'2014-09-16',09,2014,0),(3,2,1,1,2,'343qaefadfadf',0,10,0,'2014-09-16',09,2014,0),(4,2,1,1,2,'343qaefadfadf',0,10,0,'2014-09-16',09,2014,0),(5,3,1,1,2,'343qaefadfadf',8,0,0,'2014-09-16',09,2014,0),(6,2,1,1,2,'343qaefadfadf',0,1,0,'2014-09-16',09,2014,0);

/*Table structure for table `journal_entry` */

DROP TABLE IF EXISTS `journal_entry`;

CREATE TABLE `journal_entry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `narration` varchar(255) DEFAULT NULL,
  `entry_no` int(5) unsigned zerofill DEFAULT NULL,
  `entry_date` date DEFAULT NULL,
  `ca_id` int(11) DEFAULT NULL,
  `transaction_type` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `main_ca` int(11) DEFAULT NULL,
  `voucher_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;

/*Data for the table `journal_entry` */

insert  into `journal_entry`(`id`,`narration`,`entry_no`,`entry_date`,`ca_id`,`transaction_type`,`amount`,`create_by`,`create_time`,`update_by`,`update_time`,`main_ca`,`voucher_type`) values (90,'',00001,'2014-08-31',18,3,500,1,'2014-08-31 18:31:17',NULL,NULL,1,7),(91,'',00001,'2014-08-31',14,4,500,1,'2014-08-31 18:31:17',NULL,NULL,3,7),(92,'',00002,'2014-08-31',18,3,1000,1,'2014-08-31 18:31:44',NULL,NULL,1,7),(93,'',00002,'2014-08-31',20,4,1000,1,'2014-08-31 18:31:44',NULL,NULL,1,7),(94,'',00003,'2014-08-31',19,3,500,1,'2014-08-31 18:32:04',NULL,NULL,2,7),(95,'',00003,'2014-08-31',18,4,500,1,'2014-08-31 18:32:04',NULL,NULL,1,7),(96,'',00004,'2014-08-31',18,3,5000,1,'2014-08-31 18:32:40',NULL,NULL,1,7),(97,'',00004,'2014-08-31',54,4,5000,1,'2014-08-31 18:32:40',NULL,NULL,2,7),(98,'',00005,'2014-08-31',18,3,6000,1,'2014-08-31 18:33:38',NULL,NULL,1,7),(99,'',00005,'2014-08-31',55,4,6000,1,'2014-08-31 18:33:38',1,'2014-08-31 18:37:50',3,7),(100,'',00006,'2014-08-31',17,3,400,1,'2014-08-31 18:34:00',NULL,NULL,4,7),(101,'',00006,'2014-08-31',18,4,400,1,'2014-08-31 18:34:00',NULL,NULL,1,7),(102,'',00007,'2014-08-31',18,3,4500,1,'2014-08-31 18:34:37',NULL,NULL,1,7),(103,'',00007,'2014-08-31',9,4,4500,1,'2014-08-31 18:34:37',NULL,NULL,5,7),(104,'PURCHASE FURNITURE ON CASH TK 5000',00008,'2014-08-31',59,3,5000,1,'2014-08-31 18:50:23',NULL,NULL,1,7),(105,'PURCHASE FURNITURE ON CASH TK 5000',00008,'2014-08-31',18,4,5000,1,'2014-08-31 18:50:23',NULL,NULL,1,7),(106,'DEPRECIASION ON FURNITURE 10% of TK 500',00009,'2014-08-31',58,3,500,1,'2014-08-31 18:51:14',NULL,NULL,4,7),(107,'DEPRECIASION ON FURNITURE 10% of TK 500',00009,'2014-08-31',59,4,500,1,'2014-08-31 18:51:14',NULL,NULL,1,7),(108,'',00010,'2014-08-31',60,3,1000,1,'2014-09-01 15:44:42',NULL,NULL,1,8),(109,'',00010,'2014-08-31',18,4,1000,1,'2014-09-01 15:44:42',NULL,NULL,1,8),(110,'purchased 2 wheel chair for office on cash 2000 and account payable 1000',00011,'2014-09-09',59,3,3000,1,'2014-09-09 11:51:49',NULL,NULL,1,9),(111,'purchased 2 wheel chair for office on cash 2000 and account payable 1000',00011,'2014-09-09',18,4,2000,1,'2014-09-09 11:51:49',NULL,NULL,1,9),(112,'purchased 2 wheel chair for office on cash 2000 and account payable 1000',00011,'2014-09-09',19,4,1000,1,'2014-09-09 11:51:49',NULL,NULL,2,9),(113,'',00012,'2014-05-01',8,3,50000,1,'2014-10-02 14:05:59',NULL,NULL,1,7),(114,'',00012,'2014-05-01',18,4,50000,1,'2014-10-02 14:05:59',NULL,NULL,1,7),(115,'',00013,'2014-05-01',63,3,15000,1,'2014-10-02 14:08:03',NULL,NULL,1,7),(116,'',00013,'2014-05-01',18,4,15000,1,'2014-10-02 14:08:03',NULL,NULL,1,7),(117,'',00014,'2014-05-01',64,3,12000,1,'2014-10-02 14:09:21',NULL,NULL,2,7),(118,'',00014,'2014-05-01',18,4,12000,1,'2014-10-02 14:09:21',NULL,NULL,1,7),(119,'',00015,'2014-05-02',17,3,800,1,'2014-10-02 14:10:27',NULL,NULL,4,7),(120,'',00015,'2014-05-02',18,4,800,1,'2014-10-02 14:10:27',NULL,NULL,1,7),(121,'',00016,'2014-05-04',18,3,12000,1,'2014-10-02 14:11:51',NULL,NULL,1,7),(122,'',00016,'2014-05-04',65,4,12000,1,'2014-10-02 14:11:51',NULL,NULL,4,7),(123,'',00017,'2014-05-15',20,3,6000,1,'2014-10-02 14:13:29',NULL,NULL,1,7),(124,'',00017,'2014-05-15',65,4,6000,1,'2014-10-02 14:13:29',NULL,NULL,3,7),(125,'',00018,'2014-05-20',18,3,4500,1,'2014-10-02 14:14:37',NULL,NULL,1,7),(126,'',00018,'2014-05-20',20,4,4500,1,'2014-10-02 14:14:37',NULL,NULL,1,7);

/*Table structure for table `lh_amount_proll` */

DROP TABLE IF EXISTS `lh_amount_proll`;

CREATE TABLE `lh_amount_proll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lh_proll_id` int(11) DEFAULT NULL,
  `day` double DEFAULT NULL,
  `hour` double DEFAULT NULL,
  `percentage_of_ah_proll_id` int(11) DEFAULT NULL,
  `amount_adj` double DEFAULT NULL,
  `start_from` date DEFAULT NULL,
  `end_to` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lh_amount_proll` (`lh_proll_id`),
  CONSTRAINT `FK_lh_amount_proll` FOREIGN KEY (`lh_proll_id`) REFERENCES `lh_proll` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lh_amount_proll` */

insert  into `lh_amount_proll`(`id`,`lh_proll_id`,`day`,`hour`,`percentage_of_ah_proll_id`,`amount_adj`,`start_from`,`end_to`,`is_active`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,1,10,240,NULL,0,'0000-00-00','0000-00-00',1,1,'2014-10-18 14:03:43',NULL,NULL),(2,2,5,120,NULL,0,'0000-00-00','0000-00-00',1,1,'2014-10-18 14:04:03',NULL,NULL);

/*Table structure for table `lh_amount_proll_normal` */

DROP TABLE IF EXISTS `lh_amount_proll_normal`;

CREATE TABLE `lh_amount_proll_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `lh_proll_normal_id` int(11) DEFAULT NULL,
  `day` double DEFAULT NULL,
  `hour` double DEFAULT NULL,
  `start_from` date DEFAULT NULL,
  `end_to` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `create_by` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lh_amount_proll_normal` (`lh_proll_normal_id`),
  CONSTRAINT `FK_lh_amount_proll_normal` FOREIGN KEY (`lh_proll_normal_id`) REFERENCES `lh_proll_normal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lh_amount_proll_normal` */

insert  into `lh_amount_proll_normal`(`id`,`employee_id`,`lh_proll_normal_id`,`day`,`hour`,`start_from`,`end_to`,`is_active`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,1,2,5,120,'0000-00-00','0000-00-00',1,1,'2014-10-08 10:27:37',NULL,NULL),(2,1,3,10,240,'0000-00-00','0000-00-00',1,1,'2014-10-08 10:27:48',NULL,NULL);

/*Table structure for table `lh_proll` */

DROP TABLE IF EXISTS `lh_proll`;

CREATE TABLE `lh_proll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paygrade_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lh_proll` (`paygrade_id`),
  CONSTRAINT `FK_lh_proll` FOREIGN KEY (`paygrade_id`) REFERENCES `pay_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `lh_proll` */

insert  into `lh_proll`(`id`,`paygrade_id`,`title`) values (1,1,'Causal Leave'),(2,1,'Medical Leave');

/*Table structure for table `lh_proll_normal` */

DROP TABLE IF EXISTS `lh_proll_normal`;

CREATE TABLE `lh_proll_normal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `lh_proll_normal` */

insert  into `lh_proll_normal`(`id`,`title`) values (1,'Early Leave'),(2,'Casual Leave'),(3,'Medical Leave'),(4,'My Leave'),(5,'My Leave Two'),(6,'My Leave Three'),(7,'fdfdf');

/*Table structure for table `lookup` */

DROP TABLE IF EXISTS `lookup`;

CREATE TABLE `lookup` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` int(10) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;

/*Data for the table `lookup` */

insert  into `lookup`(`id`,`name`,`code`,`type`) values (1,'ACTIVE',1,'is_active'),(2,'INACTIVE',2,'is_active'),(3,'NOT RECEIVED',5,'is_received'),(4,'RECEIVED',6,'is_received'),(5,'CURRENCY',7,'unit_type'),(6,'QUANTITY',8,'unit_type'),(7,'PENDING',9,'approved_status'),(8,'APPROVED',10,'approved_status'),(9,'COLOR',15,'color_or_size'),(10,'SIZE',16,'color_or_size'),(11,'MEASUREMENT',17,'unit_type'),(12,'WEIGHT',18,'unit_type'),(13,'NOT ADDED',21,'isAddedToInventory'),(14,'ADDED',22,'isAddedToInventory'),(15,'ALL NOT DELIVERED',23,'is_all_delivered'),(16,'ALL DELIVERED',24,'is_all_delivered'),(17,'PO',27,'voucher_type'),(18,'SO',28,'voucher_type'),(19,'POS',29,'voucher_type'),(20,'STOCK',30,'voucher_type'),(21,'DELIVERY VOUCHER',31,'voucher_type'),(22,'RECEIVE VOUCHER',32,'voucher_type'),(23,'PO',33,'operation_type'),(24,'SO',34,'operation_type'),(25,'POS',35,'operation_type'),(26,'ALL NOT RECEIVED',36,'is_all_received'),(27,'ALL RECEIVED',37,'is_all_received'),(30,'SO',40,'no_type'),(31,'POS',41,'no_type'),(32,'Dr',42,'amount_type'),(33,'Cr',43,'amount_type'),(34,'ESTABLISHED',44,'order_status'),(36,'CANCELED',45,'order_status'),(37,'COMPLAIN NO',46,'report_type'),(38,'ASSIGNED',47,'assign_status'),(39,'REVOKED',48,'assign_status'),(40,'PENDING',49,'work_status'),(41,'ANALYZING',50,'work_status'),(42,'DONE',51,'work_status'),(43,'UNDONE',52,'work_status'),(44,'WORKING',53,'work_status'),(45,'NOT EDIT/DELETABLE',1,'account_type'),(46,'EDIT/DELETABLE',2,'account_type'),(47,'Dr',3,'transaction_type'),(48,'Cr',4,'transaction_type'),(49,'JOURNAL',7,'voucher_type'),(50,'CONTRA',8,'voucher_type'),(51,'PAYMENT',9,'voucher_type'),(52,'RECEIPT',10,'voucher_type'),(53,'FIXED',11,'is_fixed'),(54,'NOT FIXED',12,'is_fixed'),(55,'EARNING',13,'ac_type'),(56,'DEDUCTION',14,'ac_type'),(57,'PENDING',15,'is_approved'),(58,'APPROVED',16,'is_approved'),(59,'DENIED',17,'is_approved'),(60,'ABSENT',18,'is_present'),(61,'PRESENT',19,'is_present'),(63,'CURRENT',20,'adv_pay_type'),(64,'LONG-TERM',21,'adv_pay_type'),(66,'PAY',22,'payOrReceive'),(67,'RECEIVE',23,'payOrReceive'),(68,'LOCAL',54,'local_import'),(69,'IMPORT',55,'local_import'),(70,'MALE',56,'gender'),(71,'FEMALE',57,'gender'),(72,'SINGLE',58,'marital_status'),(73,'MARRIED',59,'marital_status'),(74,'DIVORCED',60,'marital_status'),(75,'A (+ve)',61,'blood_group'),(76,'B (+ve)',62,'blood_group'),(77,'O (+ve)',63,'blood_group'),(78,'AB (+ve)',64,'blood_group'),(79,'AB (-ve)',65,'blood_group'),(80,'O (-ve)',66,'blood_group'),(81,'B (-ve)',67,'blood_group'),(82,'A (-ve)',68,'blood_group'),(83,'REGULAR',69,'employee_type'),(84,'PART-TIME',70,'employee_type'),(85,'FATHER',71,'spouse_relation'),(86,'MOTHER',72,'spouse_relation'),(87,'SISTER',73,'spouse_relation'),(88,'BROTHER',74,'spouse_relation'),(89,'HUSBAND',75,'spouse_relation'),(90,'WIFE',76,'spouse_relation'),(91,'UNCLE',77,'spouse_relation'),(92,'OTHER',78,'spouse_relation'),(93,'MONTHLY',79,'earn_deduct_type'),(94,'DAILY',80,'earn_deduct_type');

/*Table structure for table `manual` */

DROP TABLE IF EXISTS `manual`;

CREATE TABLE `manual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `manual` */

insert  into `manual`(`id`,`name`,`desc`) values (1,'Product Information','Configure -> Products\r\n\r\nThen\r\n\r\nAdd Category, Sub-Category, Code, Model, Brand, Color, Size ETC\r\n\r\n<i>\r\nyou can add product code manually OR automatic by selecting \"Manufacturer\"\r\n</i>\r\n'),(2,'Sale Price','Configure -> Add sale price\r\n\r\n<u>OR</u>\r\n\r\nYou can add sale price while adding Products, check carefully,\r\n\r\nthere is a BLUE BUTTON named \"Add Sale Price\", after adding that product info.\r\n\r\nALSO,\r\n\r\nyou can add sale price from sale order window'),(3,'Add Products To The Inventory','There are two ways for adding the product to your inventory stock,\r\n\r\n<ol>\r\n<li>Adding through by purchasing products and approving then by <font =\'red\'><b><i>add to inventory option</i></b></font> (exist in the menu-> purchase)</li>\r\n<li>And Adding through manual</li>\r\n</ol>\r\n\r\n<b>1</b>. If products are purchased, then by approving process and add to inventory option, they will be automatically added to the inventory stock.\r\n\r\n<b>2</b>. If you want to add products into the inventory stock by manual, go through manu-> inventory -> manual stock entry'),(4,'Sale the products','Sale through \"Credit Sale (Sale Order) then Deliver\"\r\n\r\n<u>OR</u>\r\n\r\nSale through \"Quick Sale (POS)\" if you want to sale products through the retail process.'),(5,'Reports','All reports will be available in Manu -> Reports \r\n\r\nHere you can find these options-\r\n\r\n<ol>\r\n<li>Date Wise, Party Wise, Store Wise, Product Wise (For, Purchase, Credit Sales (Sale Order) AND Quick Sale (POS))</li>\r\n<li>Purchase-Sales Combined Report</li>\r\n<li>Stock Report (Product Quantity In Hand)</li>\r\n<li>Stock Report (Amount($) Of Product In Hand)</li>\r\n<li>Product Cost-Revenue Report</li>\r\n<li>Party Ledger (Customer AND Supplier)</li>\r\n<li>Costing Price (Product Wise)</li>\r\n<li>Make A Product Proposal For Your Company (Extra)</li>\r\n</ol>'),(6,'Sale Price Editable','If you want to edit sale prices while sales, you can turn this option <b><i>ON</i></b> from configure->sale price editable Option'),(7,'Customer Available Balance Validation','If you want that, the software will check the customer\'s available balance in your company, and if his/her available balance is zero, you want that software will stop the sale process and notify you that his/her available balance is zero, can not sale to him.\r\n\r\n\r\nIf you want above type of scenario in you software, simply turn this option <b></i>ON</i></b> from configure -> customer AB'),(8,'Discount Type','You can set the Discount Type to AMOUNT/ PERCENTAGE, from\r\nconfigure -> Discount Type (If one is activate, the other will be automatically inactivated)'),(9,'Costing Method','You can choose your product costing price methods ( LIFO / FIFO / AVERAGE ), you can active you desired method from\r\n\r\nconfigure -> costing method'),(10,'Touch Pad','If you use touch screen for POS, simply turn ON touch pad from\r\n\r\nConfigure -> Touch Pad ON/OFF'),(11,'Number Format','Set your Purchase Order , Sale Order , POS , Delivery/Challan Voucher AND Purchase Receive Voucher Number Formats from\r\n\r\nConfigure -> Number Format'),(12,'Time Range For Edit / Delete','You can set the time range for update/edit and delete your transaction data (Purchase Order, Sale Order, Quick Sale) from\r\n\r\nConfigure -> Time Range EDIT / DELETE'),(13,'Product Description For Vouchers','You can choose which product options will be shown in you vouchers ( Brand, Model, Additional Features, Color, Sizes ETC ) \r\n\r\nfrom Configure -> Prod Desc For Report'),(14,'Software Basic Setup','<u>If you are not understanding the process, do the following</u>\r\n\r\n<i>All the options will brief here, will found in menu -> configure (Check Carefully)</i>\r\n\r\n<b>First Of All</b>\r\n\r\n<ol>\r\n<li>Configure Your Company Information</li>\r\n<li>Configure Your Supplier AND Customer</li>\r\n<li>Create Your Stores</li>\r\n<li>Assign Your Stores To A User <b><i>( If You are a super admin, no need to assign, you have all the access of all process that means, you can have the access to all stores )</i></b></li>\r\n<li>Setup Your Products</li>\r\n<li>Set Your Product Sale Prices</li>\r\n<li>Add Product To Your Inventory Through Purchase -> Receive -> Approve -> Add To Inventory <b><i>OR</i></b> By Manual Stock Entry ( From Menu, Inventory - > Manual Stock Entry )</li>\r\n<li>Sale Through Sale Order (Credit Sale) -> Delivery <b><i>OR</i></b> By Quick Sale (POS) </li>\r\n<li>Generate Report (From menu, Reports)</li>\r\n</ol>\r\n\r\n\r\nWow.. you just ran the software as it should be. Thanks for being patient.  :) ');

/*Table structure for table `manufacturers` */

DROP TABLE IF EXISTS `manufacturers`;

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(255) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `manufacturers` */

insert  into `manufacturers`(`id`,`manufacturer`,`code`) values (2,'Manufacturer One','20649');

/*Table structure for table `money_receipt` */

DROP TABLE IF EXISTS `money_receipt`;

CREATE TABLE `money_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_money_receipt` (`customer_id`),
  CONSTRAINT `FK_money_receipt` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `money_receipt` */

insert  into `money_receipt`(`id`,`customer_id`,`order_no`,`amount`,`date`,`month`,`year`) values (00000000009,2,'1',23000,'2014-07-10',07,2014);

/*Table structure for table `months` */

DROP TABLE IF EXISTS `months`;

CREATE TABLE `months` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `month_name` varchar(10) DEFAULT NULL,
  `code` varchar(2) DEFAULT NULL,
  `short_name` varchar(3) DEFAULT NULL,
  `bangla_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `months` */

insert  into `months`(`id`,`month_name`,`code`,`short_name`,`bangla_name`) values (1,'JANUARY','01','JAN','জানুয়ারী'),(2,'FEBRUARY','02','FEB','ফেব্রুয়ারী'),(3,'MARCH','03','MAR','মার্চ'),(4,'APRIL','04','APR','এপ্রিল'),(5,'MAY','05','MAY','মে'),(6,'JUNE','06','JUN','জুন'),(7,'JULY','07','JLY','জুলাই'),(8,'AUGUST','08','AUG','আগষ্ট'),(9,'SEPTEMBER','09','SEP','সেপ্টেম্বর'),(10,'OCTOBER','10','OCT','অক্টোবর'),(11,'NOVEMBER','11','NOV','নভেম্বর'),(12,'DECEMBER','12','DEC','ডিসেম্বর');

/*Table structure for table `ot_rate` */

DROP TABLE IF EXISTS `ot_rate`;

CREATE TABLE `ot_rate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paygrade_id` int(11) DEFAULT NULL,
  `percentage_of_ah_proll_id` int(11) DEFAULT NULL,
  `amount_adj` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ot_rate` (`paygrade_id`),
  CONSTRAINT `FK_ot_rate` FOREIGN KEY (`paygrade_id`) REFERENCES `pay_grades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ot_rate` */

insert  into `ot_rate`(`id`,`paygrade_id`,`percentage_of_ah_proll_id`,`amount_adj`) values (1,1,1,19.230769230769);

/*Table structure for table `p_brand` */

DROP TABLE IF EXISTS `p_brand`;

CREATE TABLE `p_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `p_brand` */

/*Table structure for table `p_model` */

DROP TABLE IF EXISTS `p_model`;

CREATE TABLE `p_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `p_model` */

insert  into `p_model`(`id`,`name`) values (1,'TX-6610'),(2,'TX-VG1530'),(3,'TD-W8980 /TD-W8980B'),(4,'TD-8817'),(5,'TD-VG3631'),(6,'TD-VG3511'),(7,'Archer C7'),(8,'Archer C5'),(9,'TL-WR843ND'),(10,'TL-WA7110ND');

/*Table structure for table `pay_grade_onoff` */

DROP TABLE IF EXISTS `pay_grade_onoff`;

CREATE TABLE `pay_grade_onoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `pay_grade_onoff` */

insert  into `pay_grade_onoff`(`id`,`title`,`is_active`) values (1,'PAY GRADE',1);

/*Table structure for table `pay_grades` */

DROP TABLE IF EXISTS `pay_grades`;

CREATE TABLE `pay_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `pay_grades` */

insert  into `pay_grades`(`id`,`title`) values (1,'১'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7');

/*Table structure for table `payment_receipt` */

DROP TABLE IF EXISTS `payment_receipt`;

CREATE TABLE `payment_receipt` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_payment_receipt` (`supplier_id`),
  CONSTRAINT `FK_payment_receipt` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payment_receipt` */

/*Table structure for table `po_sts_chng_history` */

DROP TABLE IF EXISTS `po_sts_chng_history`;

CREATE TABLE `po_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `po_sts_chng_history` */

insert  into `po_sts_chng_history`(`id`,`po_no`,`order_status`,`status_changed_by`,`status_changed_time`) values (1,'3',45,1,'2014-08-21 00:56:47'),(2,'3',44,1,'2014-08-21 00:58:56');

/*Table structure for table `pois_approved_chng_hstry` */

DROP TABLE IF EXISTS `pois_approved_chng_hstry`;

CREATE TABLE `pois_approved_chng_hstry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `pois_approved_chng_hstry` */

insert  into `pois_approved_chng_hstry`(`id`,`po_no`,`status`,`status_changed_by`,`status_changed_time`) values (1,'1',16,1,'2014-09-15 17:54:43');

/*Table structure for table `pp_selection_type` */

DROP TABLE IF EXISTS `pp_selection_type`;

CREATE TABLE `pp_selection_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `pp_selection_type` */

insert  into `pp_selection_type`(`id`,`title`,`is_active`) values (1,'FIFO (First In First Out)',2),(2,'LIFO (Last In First Out)',2),(3,'AVERAGE',1);

/*Table structure for table `prod_brands` */

DROP TABLE IF EXISTS `prod_brands`;

CREATE TABLE `prod_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_brands` (`item_id`),
  CONSTRAINT `FK_prod_brands` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `prod_brands` */

insert  into `prod_brands`(`id`,`item_id`,`brand_name`) values (1,1,'dsaasdf');

/*Table structure for table `prod_desc_choice_for_report` */

DROP TABLE IF EXISTS `prod_desc_choice_for_report`;

CREATE TABLE `prod_desc_choice_for_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_type` int(11) DEFAULT NULL,
  `option1` int(11) DEFAULT '0',
  `option2` int(11) DEFAULT '0',
  `option3` int(11) DEFAULT '0',
  `option4` int(11) DEFAULT '0',
  `option5` int(11) DEFAULT '0',
  `option6` int(11) DEFAULT '0',
  `option7` int(11) DEFAULT '0',
  `option8` int(11) DEFAULT '0',
  `option9` int(11) DEFAULT '0',
  `option10` int(11) DEFAULT '0',
  `option11` int(11) DEFAULT '0',
  `option12` int(11) DEFAULT '0',
  `option13` int(11) DEFAULT '0',
  `option14` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `prod_desc_choice_for_report` */

insert  into `prod_desc_choice_for_report`(`id`,`voucher_type`,`option1`,`option2`,`option3`,`option4`,`option5`,`option6`,`option7`,`option8`,`option9`,`option10`,`option11`,`option12`,`option13`,`option14`) values (1,27,0,0,3,0,0,0,0,8,9,0,0,0,13,0),(2,28,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(3,29,0,0,3,0,0,0,7,8,9,10,0,0,0,0),(4,30,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(5,31,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(6,32,1,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*Table structure for table `prod_items` */

DROP TABLE IF EXISTS `prod_items`;

CREATE TABLE `prod_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `prod_items` */

insert  into `prod_items`(`id`,`item_name`) values (1,'Ne');

/*Table structure for table `prod_models` */

DROP TABLE IF EXISTS `prod_models`;

CREATE TABLE `prod_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `size_id` int(11) DEFAULT NULL,
  `color_id` int(11) DEFAULT NULL,
  `measurement` varchar(255) DEFAULT NULL,
  `measurement_unit_id` int(11) DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_unit_id` int(11) DEFAULT NULL,
  `features` text,
  `pmodel` int(11) DEFAULT NULL,
  `pbrand` int(11) DEFAULT NULL,
  `warranty` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_prod_models` (`brand_id`),
  KEY `FK_prod_models_2` (`item_id`),
  CONSTRAINT `FK_prod_models` FOREIGN KEY (`brand_id`) REFERENCES `prod_brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_prod_models_2` FOREIGN KEY (`item_id`) REFERENCES `prod_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `prod_models` */

insert  into `prod_models`(`id`,`item_id`,`brand_id`,`model_name`,`code`,`manufacturer_id`,`country_id`,`size_id`,`color_id`,`measurement`,`measurement_unit_id`,`weight`,`weight_unit_id`,`features`,`pmodel`,`pbrand`,`warranty`) values (1,1,1,'dasdasdsfds','23222321355434',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL),(2,1,1,'aasdasfadsf','343qaefadfadf',NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'',NULL,NULL,NULL);

/*Table structure for table `prod_proposal` */

DROP TABLE IF EXISTS `prod_proposal`;

CREATE TABLE `prod_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `to_whom` text,
  `why_writing` text,
  `prev_discusion` text,
  `before_product_list` text,
  `product_list` text,
  `after_product_list` text,
  `make_deal` text,
  `from` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `prod_proposal` */

/*Table structure for table `purchase_items` */

DROP TABLE IF EXISTS `purchase_items`;

CREATE TABLE `purchase_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subj` varchar(255) DEFAULT NULL,
  `ref_no` varchar(255) DEFAULT NULL,
  `po_no` int(11) DEFAULT NULL,
  `order_by_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expected_receive_date` date DEFAULT NULL,
  `delivery_expired_day` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `order_qty` double DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `is_all_received` int(11) DEFAULT '36',
  `bill_to` text,
  `ship_to` text,
  `ship_by` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `is_approved` int(11) DEFAULT '15',
  `local_import` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_items` */

insert  into `purchase_items`(`id`,`subj`,`ref_no`,`po_no`,`order_by_id`,`supplier_id`,`issue_date`,`expected_receive_date`,`delivery_expired_day`,`item_id`,`brand_id`,`model_id`,`code`,`purchase_price`,`order_qty`,`initiated_by`,`is_received`,`is_all_received`,`bill_to`,`ship_to`,`ship_by`,`sell_month`,`sell_year`,`order_status`,`is_approved`,`local_import`) values (1,'','',1,NULL,2,'2014-09-15','2014-09-15',7,1,1,1,'23222321355434',200,1,1,5,36,'','EXCEL TECHNOLOGIES LTD, ROAD-02, HOUSE - 02, DHANMONDI, DHAKA-1205, BANGLADESH',NULL,09,2014,44,16,54);

/*Table structure for table `purchase_prices` */

DROP TABLE IF EXISTS `purchase_prices`;

CREATE TABLE `purchase_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `po_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `purchase_prices` */

insert  into `purchase_prices`(`id`,`po_no`,`model_id`,`purchase_price`,`qty`,`month`,`year`,`date`) values (1,'1',2,200,200,09,2014,'2014-09-16'),(2,'5',2,200,8,09,2014,'2014-09-16');

/*Table structure for table `quick_sell` */

DROP TABLE IF EXISTS `quick_sell`;

CREATE TABLE `quick_sell` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_no` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `initiated_by` int(11) DEFAULT NULL,
  `stockQty` double DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `given_amount` double DEFAULT NULL,
  `change_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `quick_sell` */

/*Table structure for table `quick_sell_return` */

DROP TABLE IF EXISTS `quick_sell_return`;

CREATE TABLE `quick_sell_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quick_sell_id` int(11) DEFAULT NULL,
  `quick_sell_no` varchar(255) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `month` int(2) unsigned zerofill DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `remarks` text,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quick_sell_return` (`quick_sell_id`),
  CONSTRAINT `FK_quick_sell_return` FOREIGN KEY (`quick_sell_id`) REFERENCES `quick_sell` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `quick_sell_return` */

/*Table structure for table `received_purchase` */

DROP TABLE IF EXISTS `received_purchase`;

CREATE TABLE `received_purchase` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receive_no` int(11) DEFAULT NULL,
  `purchase_id` int(11) unsigned DEFAULT NULL,
  `po_no` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `return_qty` double DEFAULT '0',
  `remarks` varchar(255) DEFAULT NULL,
  `isAddedToInventory` int(11) DEFAULT '21',
  `received_by_id` int(11) DEFAULT NULL,
  `approved_status` int(11) DEFAULT '9',
  `approved_by_id` int(11) DEFAULT NULL,
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_received_purchase` (`purchase_id`),
  CONSTRAINT `FK_received_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchase_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `received_purchase` */

/*Table structure for table `rights` */

DROP TABLE IF EXISTS `rights`;

CREATE TABLE `rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `rights` */

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sections` */

insert  into `sections`(`id`,`title`) values (1,'Swing'),(2,'Cutting'),(3,'Quality Assurance');

/*Table structure for table `sections_sub` */

DROP TABLE IF EXISTS `sections_sub`;

CREATE TABLE `sections_sub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sections_sub` (`section_id`),
  CONSTRAINT `FK_sections_sub` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sections_sub` */

insert  into `sections_sub`(`id`,`section_id`,`title`) values (1,1,'Sub Section One'),(2,3,'Sub Section Two'),(3,1,'Sub Section Three'),(4,2,'Sub Section Four');

/*Table structure for table `sell_delivery` */

DROP TABLE IF EXISTS `sell_delivery`;

CREATE TABLE `sell_delivery` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_no` int(11) DEFAULT NULL,
  `sell_items_id` int(11) unsigned DEFAULT NULL,
  `so_no` varchar(255) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `delivery_qty` double DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `return_qty` double DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sell_delivery` (`sell_items_id`),
  CONSTRAINT `FK_sell_delivery` FOREIGN KEY (`sell_items_id`) REFERENCES `sell_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sell_delivery` */

/*Table structure for table `sell_items` */

DROP TABLE IF EXISTS `sell_items`;

CREATE TABLE `sell_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `so_no` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `date_of_sell` date DEFAULT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sell_qty` double DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `initiated_by` int(11) DEFAULT NULL,
  `is_all_delivered` int(11) DEFAULT '23',
  `sell_month` int(2) unsigned zerofill DEFAULT NULL,
  `sell_year` int(4) DEFAULT NULL,
  `authorized_by` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL DEFAULT '44',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sell_items` */

/*Table structure for table `sell_price` */

DROP TABLE IF EXISTS `sell_price`;

CREATE TABLE `sell_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `sell_price` double DEFAULT NULL,
  `discount` double DEFAULT '0',
  `ideal_qty` int(11) DEFAULT NULL,
  `warn_qty` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `add_by` int(11) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK_sell_price` (`model_id`),
  CONSTRAINT `FK_sell_price` FOREIGN KEY (`model_id`) REFERENCES `prod_models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sell_price` */

/*Table structure for table `shift_heads` */

DROP TABLE IF EXISTS `shift_heads`;

CREATE TABLE `shift_heads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `in_time` varchar(255) DEFAULT NULL,
  `out_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `shift_heads` */

insert  into `shift_heads`(`id`,`title`,`in_time`,`out_time`) values (1,'Shift A','08:00','12:00'),(2,'Shift B','12:00','16:00'),(3,'Normal Shift','10:00','18:00');

/*Table structure for table `ship_by` */

DROP TABLE IF EXISTS `ship_by`;

CREATE TABLE `ship_by` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ship_by` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ship_by` */

/*Table structure for table `so_sts_chng_history` */

DROP TABLE IF EXISTS `so_sts_chng_history`;

CREATE TABLE `so_sts_chng_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so_no` varchar(255) DEFAULT NULL,
  `order_status` int(11) DEFAULT NULL,
  `status_changed_by` int(11) DEFAULT NULL,
  `status_changed_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `so_sts_chng_history` */

insert  into `so_sts_chng_history`(`id`,`so_no`,`order_status`,`status_changed_by`,`status_changed_time`) values (1,'1',45,1,'2014-07-10 17:24:12'),(2,'1',44,1,'2014-07-10 17:24:21');

/*Table structure for table `stock_transfer_history` */

DROP TABLE IF EXISTS `stock_transfer_history`;

CREATE TABLE `stock_transfer_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent_from_store_id` int(11) DEFAULT NULL,
  `sent_qty` double DEFAULT NULL,
  `sent_date` date DEFAULT NULL,
  `received_to_store_id` int(11) DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `is_received` int(11) DEFAULT '5',
  `item_id` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `sent_by_id` int(11) DEFAULT NULL,
  `received_by_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `stock_transfer_history` */

insert  into `stock_transfer_history`(`id`,`sent_from_store_id`,`sent_qty`,`sent_date`,`received_to_store_id`,`received_qty`,`received_date`,`is_received`,`item_id`,`brand_id`,`model_id`,`code`,`sent_by_id`,`received_by_id`) values (3,2,10,'2014-09-16',3,8,'2014-09-16',6,1,1,2,'343qaefadfadf',1,2),(4,2,1,'2014-09-16',3,NULL,NULL,5,1,1,2,'343qaefadfadf',2,NULL);

/*Table structure for table `stores` */

DROP TABLE IF EXISTS `stores`;

CREATE TABLE `stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(255) NOT NULL,
  `location` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stores` */

insert  into `stores`(`id`,`store_name`,`location`) values (2,'Store One','Store Location'),(3,'Store Two','');

/*Table structure for table `stuff_cat` */

DROP TABLE IF EXISTS `stuff_cat`;

CREATE TABLE `stuff_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `stuff_cat` */

insert  into `stuff_cat`(`id`,`title`) values (1,'Stuff Cat One'),(2,'Stuff Cat Two');

/*Table structure for table `stuff_sub_cat` */

DROP TABLE IF EXISTS `stuff_sub_cat`;

CREATE TABLE `stuff_sub_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuff_cat_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_stuff_sub_cat` (`stuff_cat_id`),
  CONSTRAINT `FK_stuff_sub_cat` FOREIGN KEY (`stuff_cat_id`) REFERENCES `stuff_cat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `stuff_sub_cat` */

insert  into `stuff_sub_cat`(`id`,`stuff_cat_id`,`title`) values (1,1,'Stuff Sub Cat One'),(2,2,'Stuff Sub Cat Two'),(3,2,'Stuff Sub Cat Three'),(4,1,'Stuff Sub Cat Four');

/*Table structure for table `supplier_contact_persons` */

DROP TABLE IF EXISTS `supplier_contact_persons`;

CREATE TABLE `supplier_contact_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `contact_number1` varchar(20) DEFAULT NULL,
  `contact_number2` varchar(20) DEFAULT NULL,
  `contact_number3` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_supplier_contact_persons` (`company_id`),
  CONSTRAINT `FK_supplier_contact_persons` FOREIGN KEY (`company_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier_contact_persons` */

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` text,
  `company_contact_no` varchar(20) DEFAULT NULL,
  `company_fax` varchar(20) DEFAULT NULL,
  `company_email` varchar(50) DEFAULT NULL,
  `company_web` varchar(50) DEFAULT NULL,
  `opening_amount` double DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `suppliers` */

insert  into `suppliers`(`id`,`company_name`,`company_address`,`company_contact_no`,`company_fax`,`company_email`,`company_web`,`opening_amount`) values (2,'Supplier One','Supplier One Address','+88012121212','','supplierOne@email.com','',0);

/*Table structure for table `teams` */

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `teams` */

insert  into `teams`(`id`,`title`,`details`) values (1,'A',''),(2,'B',NULL),(3,'C',NULL),(4,'D',NULL),(5,'E',NULL),(6,'F',NULL),(7,'G',NULL),(8,'H',NULL),(9,'I',NULL),(10,'J',NULL);

/*Table structure for table `touch_pad` */

DROP TABLE IF EXISTS `touch_pad`;

CREATE TABLE `touch_pad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `touch_pad` */

insert  into `touch_pad`(`id`,`title`,`is_active`) values (1,'TOUCH PAD',2);

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `value` double DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `units` */

insert  into `units`(`id`,`unit_type`,`label`,`value`,`remarks`) values (1,7,'USD',77.58,'1 USD = 77.58 TK'),(2,7,'AUS',71.56,'1 AUS = 71.56 TK'),(5,8,'Pcs',NULL,''),(6,8,'Packages',NULL,''),(14,17,'CM',NULL,''),(16,17,'INCH',NULL,''),(17,18,'KGs',NULL,''),(18,18,'GM',NULL,''),(20,18,'Pound',NULL,''),(21,17,'Feet',NULL,''),(22,7,'TK',1,'1 TK = 1 TK'),(25,8,'BOX',NULL,NULL),(26,7,'RUPEE',1.32,'1 RUPEE = 1.32 TK'),(27,7,'EURO',105.45,'1 EURO = 105.45 TK'),(28,7,'RINGGIT',24.04,'1 RINGGIT = 24.04 TK');

/*Table structure for table `update_delete_time` */

DROP TABLE IF EXISTS `update_delete_time`;

CREATE TABLE `update_delete_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_type` int(11) NOT NULL,
  `updatable_day` int(11) NOT NULL DEFAULT '0',
  `deletable_day` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `update_delete_time` */

insert  into `update_delete_time`(`id`,`operation_type`,`updatable_day`,`deletable_day`) values (1,33,365,365),(2,34,365,365),(3,35,365,365);

/*Table structure for table `user_store` */

DROP TABLE IF EXISTS `user_store`;

CREATE TABLE `user_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_user_store` (`user_id`),
  CONSTRAINT `FK_user_store` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user_store` */

insert  into `user_store`(`id`,`user_id`,`store_id`,`is_active`) values (1,2,3,1);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`employee_id`,`username`,`password`,`create_by`,`create_time`,`update_by`,`update_time`) values (1,1,'superadmin','17c4520f6cfd1ab53d8745e84681eb49',NULL,NULL,'superadmin','2014-05-28 23:20:30'),(2,2,'tanim123','12f3315cf1ba3c9164ecceea3bbf3a86','superadmin','2014-09-16 22:43:48',NULL,NULL),(3,1,'adminadmin','a4a46434d69427240e05721b14e0e685','superadmin','2014-10-08 19:13:29','superadmin','2014-10-08 19:19:46');

/*Table structure for table `voucher_no_formate` */

DROP TABLE IF EXISTS `voucher_no_formate`;

CREATE TABLE `voucher_no_formate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `type_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `voucher_no_formate` */

insert  into `voucher_no_formate`(`id`,`type`,`type_format`) values (1,27,'PO'),(2,28,'SO'),(3,29,'INV'),(4,31,'CHALLAN'),(5,32,'RV'),(6,7,'Journal'),(7,8,'Contra'),(8,9,'Payment'),(9,10,'Receipt');

/*Table structure for table `working_day` */

DROP TABLE IF EXISTS `working_day`;

CREATE TABLE `working_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(4) DEFAULT NULL,
  `month_id` int(2) DEFAULT NULL,
  `days_of_month` int(2) DEFAULT NULL,
  `working_day` double DEFAULT NULL,
  `working_hour_per_day` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `working_day` */

insert  into `working_day`(`id`,`year`,`month_id`,`days_of_month`,`working_day`,`working_hour_per_day`) values (1,2014,9,30,26,NULL),(2,2014,10,31,31,NULL);

/*Table structure for table `years` */

DROP TABLE IF EXISTS `years`;

CREATE TABLE `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year_name` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `years` */

insert  into `years`(`id`,`year_name`) values (1,2013),(2,2014),(3,2015),(4,2016),(5,2017),(6,2018),(7,2019),(8,2020);

/*Table structure for table `your_company` */

DROP TABLE IF EXISTS `your_company`;

CREATE TABLE `your_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `road` varchar(20) DEFAULT NULL,
  `house` varchar(50) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL,
  `is_active` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `your_company` */

insert  into `your_company`(`id`,`company_name`,`location`,`road`,`house`,`contact`,`email`,`web`,`is_active`) values (1,'নেটওয়ার্ক ক্লথিং লিমিটেড','চৌধুরীবাড়ী, ভোগরা, গাজীপুর','','','','','',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
