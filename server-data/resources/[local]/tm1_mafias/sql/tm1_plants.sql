CREATE TABLE `tm1_plants` (
  `name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '',
  `finalobject` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `tm1_plants` VALUES ('cocaseed','Cocaina','Prop_weed_01','cocaplant');
