CREATE DATABASE `ace_account` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

use ace_account;

CREATE TABLE `account`  (
  `acc` int(11) DEFAULT NULL,
  `pw` varchar(128) DEFAULT '',
  `info` longtext DEFAULT null
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `cid` int(11) NOT NULL,
  `cn` varchar(256) DEFAULT '',
  `info` longtext,
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `cid` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `record` (
  `cid` int(11) NOT NULL,
  `cn` varchar(256) DEFAULT '',
  `list` varchar(1024) DEFAULT '',
  `info` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

