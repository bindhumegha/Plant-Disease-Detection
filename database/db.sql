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

/*Table structure for table `remidies` */

DROP TABLE IF EXISTS `remidies`;

CREATE TABLE `remidies` (
  `disease` varchar(100) DEFAULT NULL,
  `reasons` varchar(1000) DEFAULT NULL,
  `solutions` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remidies` */

insert  into `remidies`(`disease`,`reasons`,`solutions`) values ('Apple_Black_rot','Fungal infection caused by Botryosphaeria obtusa,Warm, humid conditions favor fungal growth,Infected leaves, fruit, or dead wood left in orchards.','Cultural Practices,Fungicide Application,Tree Care,Orchard Hygiene\n'),('Peach_Bacterial_spot','Caused by Xanthomonas arboricola pv. pruni,High humidity and prolonged leaf wetness,Injuries to leaves or fruit provide entry points for bacteria.','Preventive Measures,Chemical Control,Resistant Varieties\n'),('Pepper_bell_Bacterial_spot','Caused by Xanthomonas campestris pv. vesicatoria,Contaminated seeds or transplants,Poor crop rotation practices.','Seed Treatment,Crop Rotation,Protective Sprays'),('Potato_Early_blight','Caused by the fungus Alternaria solani,Infected plant debris or soil-borne spores,Prolonged periods of leaf wetness from rain, dew, or overhead irrigation.','Fertilization,Chemical Control,Cultural Practices'),('Strawberry_Leaf_scorch','Fungal infection caused by Diplocarpon earliana,Poorly drained soil,Excessive rain or overwatering leading to high humidity.','Good Cultivation Practices,Fungicide Use,Resistant Varieties'),('Tomato_Target_Spot','Caused by Corynespora cassiicola, a fungal pathogen,Poor air circulation around plants,Infected crop residues left in the field.','Cultural Control,Irrigation Management,Chemical Control');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `name` varchar(100) DEFAULT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobilenumber` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`name`,`userid`,`password`,`email`,`mobilenumber`) values ('CLOUDTECHNOLOGIES','ct123','ct123','ct@gmail.com','8121953811');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
