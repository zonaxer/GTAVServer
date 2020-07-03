-- Changed version of owned_vehicles to remove issues with car's not showing up

USE `essentialmode`;

CREATE TABLE `owned_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(12) NOT NULL,
  `owner` varchar(60) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Etat de la voiture',
  `vehicle` longtext NOT NULL,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `job` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT '0',
  `impounded` tinyint(1) NOT NULL DEFAULT '0',
  `vehiclename` varchar(50) NOT NULL DEFAULT 'voiture',
  `last_pound` int(20) DEFAULT NULL,
  `fuel` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;
