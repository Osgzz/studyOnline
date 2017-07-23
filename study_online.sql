/*
Navicat MySQL Data Transfer

Source Server         : test_1
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : study_online

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-17 21:16:42
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
  `route_id` int(11) NOT NULL COMMENT '所属课程路径ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='音频表';

-- ----------------------------
-- Records of audios
-- ----------------------------
INSERT INTO `audios` VALUES ('1', '防抖技术1', '神游八极.mp3', '7');
INSERT INTO `audios` VALUES ('2', '防抖技术2', '神游八极.mp3', '8');
INSERT INTO `audios` VALUES ('5', '全景技术1', '神游八极.mp3', '9');
INSERT INTO `audios` VALUES ('6', '全景技术2', '神游八极.mp3', '10');
INSERT INTO `audios` VALUES ('7', '暗影高光技术1', '神游八极.mp3', '11');
INSERT INTO `audios` VALUES ('8', '暗影高光技术2', '神游八极.mp3', '12');
INSERT INTO `audios` VALUES ('9', '暗影高光技术3', '神游八极.mp3', '13');
INSERT INTO `audios` VALUES ('10', 'HDR技术1', '神游八极.mp3', '14');
INSERT INTO `audios` VALUES ('11', '单摄像头智能手机1', '神游八极.mp3', '15');
INSERT INTO `audios` VALUES ('12', 'tian', '神游八极.mp3', '16');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '部门名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'IT部');
INSERT INTO `department` VALUES ('2', '产品部');
INSERT INTO `department` VALUES ('3', '人事部');
INSERT INTO `department` VALUES ('4', '测试部');

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
  `nickName` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录密码',
  `gender` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '性别',
  `dept_id` int(11) DEFAULT NULL COMMENT '所属部门ID',
  `position_id` int(11) DEFAULT NULL COMMENT '职位ID',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '123', null, '123', null, '0', null, null, null);

-- ----------------------------
-- Table structure for lesson
-- ----------------------------
DROP TABLE IF EXISTS `lesson`;
CREATE TABLE `lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '课程名称',
  `isshow` int(2) DEFAULT '1' COMMENT '是否上线课程',
  `cover` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图片路径',
  `detail` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程表';

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('1', '防抖技术', '1', '1.png', 'Test');
INSERT INTO `lesson` VALUES ('2', '全景技术', '1', '2.png', '全景技术');
INSERT INTO `lesson` VALUES ('9', '暗影高光技术', '1', '3.png', '暗影高光技术');
INSERT INTO `lesson` VALUES ('10', 'HDR技术', '1', '4.png', 'HDR技术');
INSERT INTO `lesson` VALUES ('11', '单摄像头智能手机', '1', '5.jpg', '单摄像头智能手机');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位ID',
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '职位名称',
  `premission_level` int(11) NOT NULL COMMENT '职位权限级别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '部长', '1');
INSERT INTO `position` VALUES ('2', '部员', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ppt表';

-- ----------------------------
-- Records of ppts
-- ----------------------------
INSERT INTO `ppts` VALUES ('1', '防抖技术1', '二周广东游.pptx', '7');
INSERT INTO `ppts` VALUES ('2', '防抖技术2', '二周广东游.pptx', '8');
INSERT INTO `ppts` VALUES ('5', '全景技术1', '二周广东游.pptx', '9');
INSERT INTO `ppts` VALUES ('6', '全景技术2', '二周广东游.pptx', '10');
INSERT INTO `ppts` VALUES ('7', '暗影高光技术1', '二周广东游.pptx', '11');
INSERT INTO `ppts` VALUES ('8', '暗影高光技术2', '二周广东游.pptx', '12');
INSERT INTO `ppts` VALUES ('9', '暗影高光技术3', '二周广东游.pptx', '13');
INSERT INTO `ppts` VALUES ('10', 'HDR技术1', '二周广东游.pptx', '14');
INSERT INTO `ppts` VALUES ('11', '单摄像头智能手机1', '二周广东游.pptx', '15');
INSERT INTO `ppts` VALUES ('12', 'tian', '二周广东游.pptx', '16');

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
  `detail` varchar(600) COLLATE utf8_unicode_ci NOT NULL COMMENT '简介说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程线路表';

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('7', '1', '防抖技术1', '2017-06-20 17:58:25', '1.png', '防抖技术1');
INSERT INTO `route` VALUES ('8', '1', '防抖技术2', '2017-06-20 18:01:18', '1.png', '防抖技术2');
INSERT INTO `route` VALUES ('9', '2', '全景技术1', '2017-06-21 01:45:56', '2.png', '全景技术1');
INSERT INTO `route` VALUES ('10', '2', '全景技术2', '2017-06-21 01:47:17', '2.png', '全景技术2');
INSERT INTO `route` VALUES ('11', '9', '暗影高光技术1', '2017-06-21 07:26:57', '3.png', '暗影高光技术1');
INSERT INTO `route` VALUES ('12', '9', '暗影高光技术2', '2017-06-21 07:29:04', '3.png', '暗影高光技术2');
INSERT INTO `route` VALUES ('13', '9', '暗影高光技术3', '2017-06-21 07:29:50', '3.png', '暗影高光技术3');
INSERT INTO `route` VALUES ('14', '10', 'HDR技术1', '2017-06-21 07:43:12', '4.png', 'HDR技术1');
INSERT INTO `route` VALUES ('15', '11', '单摄像头智能手机1', '2017-06-21 07:44:34', '5.png', '单摄像头智能手机1');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频名称',
  `path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '视频路径',
  `views` int(10) DEFAULT '0' COMMENT '观看次数',
  `cover_path` varchar(60) COLLATE utf8_unicode_ci NOT NULL COMMENT '封面路径',
  `route_id` int(11) NOT NULL COMMENT '所属课程路径ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='视频表';

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('1', '防抖技术1', 'oceans.mp4', '0', 'ocens.png', '7');
INSERT INTO `videos` VALUES ('2', '防抖技术2', 'oceans.mp4', '0', 'ocens.png', '8');
INSERT INTO `videos` VALUES ('5', '全景技术1', 'oceans.mp4', '0', 'ocens.png', '9');
INSERT INTO `videos` VALUES ('6', '全景技术2', 'oceans.mp4', '0', 'ocens.png', '10');
INSERT INTO `videos` VALUES ('7', '暗影高光技术1', 'oceans.mp4', '0', 'ocens.png', '11');
INSERT INTO `videos` VALUES ('8', '暗影高光技术2', 'oceans.mp4', '0', 'ocens.png', '12');
INSERT INTO `videos` VALUES ('9', '暗影高光技术3', 'oceans.mp4', '0', 'ocens.png', '13');
INSERT INTO `videos` VALUES ('10', 'HDR技术1', 'oceans.mp4', '0', 'ocens.png', '14');
INSERT INTO `videos` VALUES ('11', '单摄像头智能手机1', 'oceans.mp4', '0', 'ocens.png', '15');
INSERT INTO `videos` VALUES ('12', 'tian', 'oceans.mp4', '0', 'ocens.png', '16');

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
