CREATE TABLE `sg_vip` (
  `identifier` varchar(40) NOT NULL,
  `vip` tinyint(4) DEFAULT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
