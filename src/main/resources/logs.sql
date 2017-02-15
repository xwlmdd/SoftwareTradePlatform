/*
SQLyog Ultimate v8.32 
MySQL - 5.5.45-log : Database - movieticket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movieticket` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movieticket`;

/*Table structure for table `t_cinema` */

DROP TABLE IF EXISTS `t_cinema`;

CREATE TABLE `t_cinema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(30) DEFAULT NULL,
  `area` varchar(30) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `cinemaName` varchar(100) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mapInfo` varchar(255) DEFAULT NULL,
  `detailScheduleUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_moive` */

DROP TABLE IF EXISTS `t_moive`;

CREATE TABLE `t_moive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movieName` varchar(255) DEFAULT NULL,
  `movieEnglishName` varchar(255) DEFAULT NULL,
  `director` varchar(100) DEFAULT NULL,
  `performer` varchar(255) DEFAULT NULL,
  `movieType` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `movieTime` varchar(30) DEFAULT NULL,
  `moiveStory` text,
  `posterUrl` varchar(255) DEFAULT NULL,
  `rescheduledTime` varchar(30) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `isShow` int(11) DEFAULT NULL,
  `movieDetailUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `t_moiveschedule` */

DROP TABLE IF EXISTS `t_moiveschedule`;

CREATE TABLE `t_moiveschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `moiveId` int(11) DEFAULT NULL,
  `cinemaId` int(11) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` varchar(30) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `videoHall` varchar(30) DEFAULT NULL,
  `seatCondition` varchar(30) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `buyUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
