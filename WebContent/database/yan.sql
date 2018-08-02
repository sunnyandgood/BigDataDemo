/*
MySQL Data Transfer
Source Host: localhost
Source Database: yan
Target Host: localhost
Target Database: yan
Date: 2018/7/31 15:38:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for vip
-- ----------------------------
CREATE TABLE `vip` (
  `ip` varchar(100) NOT NULL,
  `times` varchar(255) NOT NULL,
  PRIMARY KEY  (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `vip` VALUES ('111.42.252.202', '503');
INSERT INTO `vip` VALUES ('119.255.57.50', '575');
INSERT INTO `vip` VALUES ('122.70.237.247', '805');
INSERT INTO `vip` VALUES ('123.126.50.182', '512');
INSERT INTO `vip` VALUES ('123.147.245.79', '1571');
INSERT INTO `vip` VALUES ('125.45.155.27', '735');
INSERT INTO `vip` VALUES ('139.227.126.111', '575');
INSERT INTO `vip` VALUES ('157.56.93.85', '561');
INSERT INTO `vip` VALUES ('173.199.114.195', '672');
INSERT INTO `vip` VALUES ('180.173.113.181', '969');
INSERT INTO `vip` VALUES ('220.181.89.156', '1877');
INSERT INTO `vip` VALUES ('221.221.153.8', '632');
INSERT INTO `vip` VALUES ('222.133.189.179', '3942');
INSERT INTO `vip` VALUES ('222.141.54.75', '533');
INSERT INTO `vip` VALUES ('49.72.74.77', '1160');
INSERT INTO `vip` VALUES ('58.63.138.37', '520');
INSERT INTO `vip` VALUES ('60.10.5.65', '1889');
INSERT INTO `vip` VALUES ('61.135.249.206', '508');
INSERT INTO `vip` VALUES ('61.135.249.210', '1378');
INSERT INTO `vip` VALUES ('61.50.141.7', '4855');
