/*
SQLyog Community Edition- MySQL GUI v6.07
Host - 5.5.30 : Database - plant_leaf_disease
*********************************************************************
Server version : 5.5.30
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `plant_leaf_disease`;

USE `plant_leaf_disease`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `history` */

DROP TABLE IF EXISTS `history`;

CREATE TABLE `history` (
  `userid` varchar(100) DEFAULT NULL,
  `plant_name` varchar(100) DEFAULT NULL,
  `disease` varchar(100) DEFAULT NULL,
  `possibilities` varchar(1000) DEFAULT NULL,
  `solutions` varchar(1000) DEFAULT NULL,
  `date` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `remidies` */

DROP TABLE IF EXISTS `remidies`;

CREATE TABLE `remidies` (
  `disease` varchar(100) DEFAULT NULL,
  `reasons` varchar(1000) DEFAULT NULL,
  `solutions` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobilenumber` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
