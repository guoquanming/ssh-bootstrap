/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : music2

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-05-28 22:59:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_collectmessage
-- ----------------------------
DROP TABLE IF EXISTS `tbl_collectmessage`;
CREATE TABLE `tbl_collectmessage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL,
  `magId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_collectmessage
-- ----------------------------
INSERT INTO `tbl_collectmessage` VALUES ('6', '1', '4');
INSERT INTO `tbl_collectmessage` VALUES ('7', '1', '1');

-- ----------------------------
-- Table structure for tbl_mag
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mag`;
CREATE TABLE `tbl_mag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `descri` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_mag
-- ----------------------------
INSERT INTO `tbl_mag` VALUES ('1', 'Only-The One', '1', 'http://www.opendrive.com/files/OF84NDU2NzgzM18xNWxCbA/1.jpg', '我是歌手，Only-The One。', '上网', '1');
INSERT INTO `tbl_mag` VALUES ('2', '流金岁月', '2', 'http://www.opendrive.com/files/OF84NDU2OTIwMV95YVg3eg/2.jpg', '宝丽金十年，倾情奉献。', '阅读', '1');
INSERT INTO `tbl_mag` VALUES ('3', '逃离遗弃的世界', '3', 'http://www.opendrive.com/files/OF84NDU2OTUyN19idlE0WA/3.jpg', '污浊的世界应当被遗弃，但请相信未知的美好。', '运动', '1');
INSERT INTO `tbl_mag` VALUES ('4', '小情歌', '4', 'http://www.opendrive.com/files/OF84NDU2OTg4OV9pYlhXbQ/4.jpg', '最是那一抹怜人的温柔。', '失恋', '1');
INSERT INTO `tbl_mag` VALUES ('5', '后会有期', '5', 'http://www.opendrive.com/files/OF84NjYyNjI4Ml9hRHFMNw/123.jpg', '后会有期，我要去更远的地方', '失恋', '0');

-- ----------------------------
-- Table structure for tbl_music
-- ----------------------------
DROP TABLE IF EXISTS `tbl_music`;
CREATE TABLE `tbl_music` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `album` varchar(255) DEFAULT NULL,
  `magId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKECA9CA64BD7EA33` (`magId`),
  CONSTRAINT `FKECA9CA64BD7EA33` FOREIGN KEY (`magId`) REFERENCES `tbl_mag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_music
-- ----------------------------
INSERT INTO `tbl_music` VALUES ('1', '听海', 'http://www.opendrive.com/files/OF84NDU2NzgyNl9LeTk2Qg/The%20One%20-%20听海.mp3', 'the one   ', '我是歌手', '1');
INSERT INTO `tbl_music` VALUES ('2', '暗香', 'http://www.opendrive.com/files/OF84NDUxNDA4MV9GbzVKNw/The%20One%20-%20暗香.mp3', 'the one', '我是歌手', '1');
INSERT INTO `tbl_music` VALUES ('3', '那片海', 'http://www.opendrive.com/files/OF84NDU2NzM1Ml9HNkx1Qw/The%20One%20-%20那片海.mp3', 'the one', '我是歌手', '1');
INSERT INTO `tbl_music` VALUES ('4', '一生不变', 'http://www.opendrive.com/files/OF84NDU2OTE5Nl9ORkdhaw/宝丽金%20-%20一生不变.mp3', '谭咏麟', '宝丽金', '2');
INSERT INTO `tbl_music` VALUES ('5', '堆积情感', 'http://www.opendrive.com/files/OF84NDU2OTAwMV9ac2N2aQ/宝丽金%20-%20堆积情感.mp3', '邝美云', '宝丽金', '2');
INSERT INTO `tbl_music` VALUES ('6', '爱多一次痛多一次', 'http://www.opendrive.com/files/OF84NDU2ODkxMV9INlI4Zg/宝丽金%20-%20爱多一次痛多一次.mp3', '谭咏麟', '宝丽金', '2');
INSERT INTO `tbl_music` VALUES ('7', '一万次悲伤', 'http://www.opendrive.com/files/OF84NDU2OTcyN19ha1NMYw/逃跑计划%20-%20一万次悲伤.mp3', '逃跑计划', '自由飞翔', '3');
INSERT INTO `tbl_music` VALUES ('8', '夜空中最亮的星', 'http://www.opendrive.com/files/OF84NDU2OTY4NF9udzcwSQ/逃跑计划%20-%20夜空中最亮的星.mp3', '逃跑计划', '自由飞翔', '3');
INSERT INTO `tbl_music` VALUES ('9', '阳光照进回忆', 'http://www.opendrive.com/files/OF84NDU2OTU5OF8yQnFFNQ/逃跑计划%20-%20阳光照进回忆里.mp3', '逃跑计划', '自由飞翔', '3');
INSERT INTO `tbl_music` VALUES ('10', '情歌', 'http://www.opendrive.com/files/OF84NDU2OTg4N19tYlY0eQ/梁静茹%20-%20情歌.mp3', '梁静茹', '十年精选', '4');
INSERT INTO `tbl_music` VALUES ('11', '暖暖', 'http://www.opendrive.com/files/OF84NDU2OTgzMl9BZ3BheQ/梁静茹%20-%20暖暖.mp3', '梁静茹', '十年精选', '4');
INSERT INTO `tbl_music` VALUES ('12', '如果云知道', 'http://www.opendrive.com/files/OF84NDU2OTk2NV9ybVk4cw/许茹芸%20-%20如果云知道.mp3', '许茹芸', '魅力', '4');
INSERT INTO `tbl_music` VALUES ('13', '时には昔の话を - 红猪 片尾曲', 'http://www.opendrive.com/files/OF84NjYyNjU5MV9lT0xWQg/加藤登纪子%20-%20时には昔の话を%20-%20红猪%20片尾曲.mp3', '加藤登纪子', '红猪', '5');
INSERT INTO `tbl_music` VALUES ('14', '菊次郎的夏天', 'http://www.opendrive.com/files/OF84NjYyNjkzMl9GRHdFag/久石让%20-%20菊次郎的夏天.mp3', '久石让', '菊次郎的夏天', '5');
INSERT INTO `tbl_music` VALUES ('15', '讲不出再见', 'http://www.opendrive.com/files/OF84NjYyNzcxM19TME4xUQ/谭咏麟%20-%20讲不出再见.mp3', '谭咏麟', '金曲十年', '5');

-- ----------------------------
-- Table structure for tbl_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `tbl_usermessage`;
CREATE TABLE `tbl_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `userPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_usermessage
-- ----------------------------
INSERT INTO `tbl_usermessage` VALUES ('1', '111', '111');
INSERT INTO `tbl_usermessage` VALUES ('2', '222', '222');

-- ----------------------------
-- Table structure for use_mag
-- ----------------------------
DROP TABLE IF EXISTS `use_mag`;
CREATE TABLE `use_mag` (
  `magId` bigint(20) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`magId`,`userId`),
  KEY `FKF7327E9BBD7EA33` (`magId`),
  KEY `FKF7327E9B1135DD6E` (`userId`),
  CONSTRAINT `FKF7327E9B1135DD6E` FOREIGN KEY (`userId`) REFERENCES `tbl_usermessage` (`id`),
  CONSTRAINT `FKF7327E9BBD7EA33` FOREIGN KEY (`magId`) REFERENCES `tbl_mag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of use_mag
-- ----------------------------
INSERT INTO `use_mag` VALUES ('5', '1');
