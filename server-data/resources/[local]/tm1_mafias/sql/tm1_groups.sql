CREATE TABLE `tm1_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `aprove` int(1) DEFAULT '0',
  `money` int(11) DEFAULT '0',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=4824 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
