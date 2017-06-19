/*
Navicat MySQL Data Transfer

Source Server         : test_1
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : study_online

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-19 11:51:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminstrator
-- ----------------------------
DROP TABLE IF EXISTS `adminstrator`;
CREATE TABLE `adminstrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员账号',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理员表';

-- ----------------------------
-- Records of adminstrator
-- ----------------------------
INSERT INTO `adminstrator` VALUES ('1', 'admin', '961ad5e4baa39870797f18faf592b750');

-- ----------------------------
-- Table structure for audios
-- ----------------------------
DROP TABLE IF EXISTS `audios`;
CREATE TABLE `audios` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '音频ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '音频名称',
  `path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '音频路径',
  `length` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '音频时长',
  `route_id` int(11) NOT NULL COMMENT '所属课程路径ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='音频表';

-- ----------------------------
-- Records of audios
-- ----------------------------

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '讨论留言ID',
  `vedio_id` int(11) NOT NULL COMMENT '留言视频ID',
  `commentators_id` int(11) NOT NULL COMMENT '留言者ID',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT '留言内容',
  `time` datetime NOT NULL COMMENT '留言时间',
  `pre_id` int(11) NOT NULL COMMENT '上一条留言ID',
  `from_who` int(11) NOT NULL DEFAULT '0' COMMENT '员工为0，管理员为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='讨论表';

-- ----------------------------
-- Records of discuss
-- ----------------------------

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `name` varchar(14) COLLATE utf8_unicode_ci NOT NULL COMMENT '员工名称',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录密码',
  `position_id` int(11) NOT NULL COMMENT '职位ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名称',
  `isshow` int(2) DEFAULT '1' COMMENT '是否上线课程',
  `cover` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程表';

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '防抖教程', '1', '20170619030549.png');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位ID',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '职位名称',
  `premission_level` int(11) NOT NULL COMMENT '职位权限级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for ppts
-- ----------------------------
DROP TABLE IF EXISTS `ppts`;
CREATE TABLE `ppts` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ppt的ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ppt名字',
  `path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT 'ppt路径',
  `route_id` int(11) NOT NULL COMMENT '所属课程路径ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ppt表';

-- ----------------------------
-- Records of ppts
-- ----------------------------

-- ----------------------------
-- Table structure for private_message
-- ----------------------------
DROP TABLE IF EXISTS `private_message`;
CREATE TABLE `private_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '私信Id',
  `user_id` bigint(20) NOT NULL COMMENT '发送者Id',
  `friend_id` bigint(20) NOT NULL COMMENT '接受者Id',
  `sender_id` bigint(20) NOT NULL COMMENT '发送者id',
  `receiver_id` bigint(20) NOT NULL COMMENT '接受者Id',
  `message_type` tinyint(4) NOT NULL COMMENT '消息类型,1：普通消息 2：系统消息',
  `message_content` varchar(500) NOT NULL COMMENT '消息内容',
  `send_time` datetime NOT NULL COMMENT '消息发送时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消息状态 1：未读 2：已读 3：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of private_message
-- ----------------------------

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程线路ID',
  `lesson_id` int(11) NOT NULL COMMENT '所属课程ID',
  `route_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '线路名',
  `time` datetime DEFAULT NULL COMMENT '路径创建时间',
  `cover` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图片路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程线路表';

-- ----------------------------
-- Records of route
-- ----------------------------

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频名称',
  `path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频路径',
  `views` int(10) NOT NULL COMMENT '观看次数',
  `cover_path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '封面路径',
  `route_id` int(11) NOT NULL COMMENT '所属课程路径ID',
  `length` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频长度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='视频表';

-- ----------------------------
-- Records of videos
-- ----------------------------

-- ----------------------------
-- Table structure for view_record
-- ----------------------------
DROP TABLE IF EXISTS `view_record`;
CREATE TABLE `view_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '观看记录ID',
  `employee_id` int(11) NOT NULL COMMENT '观看视频的员工ID',
  `lesson_id` int(11) NOT NULL COMMENT '课程ID',
  `view_time` datetime NOT NULL COMMENT '观看时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='观看视频记录';

-- ----------------------------
-- Records of view_record
-- ----------------------------
