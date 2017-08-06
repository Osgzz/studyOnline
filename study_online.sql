/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : study_online

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-06 08:59:07
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='音频表';

-- ----------------------------
-- Records of audios
-- ----------------------------
INSERT INTO `audios` VALUES ('24', '防抖技术学习路径音频', '20170714023634.mp3', '31');
INSERT INTO `audios` VALUES ('25', '暗光高清技术路径音频', '20170714024043.mp3', '32');
INSERT INTO `audios` VALUES ('26', '暗光高清技术路径音频', '20170714025155.mp3', '33');
INSERT INTO `audios` VALUES ('27', '防抖技术测试1', '20170714030246.mp3', '36');
INSERT INTO `audios` VALUES ('28', '全景技术测试1', '20170714030420.mp3', '37');
INSERT INTO `audios` VALUES ('29', 'HDR技术测试1', '20170714030707.mp3', '38');
INSERT INTO `audios` VALUES ('30', '体感技术测试1', '20170714030941.mp3', '39');
INSERT INTO `audios` VALUES ('31', '3D立体成像技术1', '20170714031351.mp3', '40');
INSERT INTO `audios` VALUES ('32', 'AR/VR技术测试1', '20170714031600.mp3', '41');
INSERT INTO `audios` VALUES ('33', '防抖技术1', '20170716120048.mp3', '42');
INSERT INTO `audios` VALUES ('34', '暗光高清拍摄技术1', '20170716124000.mp3', '43');
INSERT INTO `audios` VALUES ('35', '全景技术1', '20170716124114.mp3', '44');
INSERT INTO `audios` VALUES ('36', '人脸技术3', '20170716124308.mp3', '45');
INSERT INTO `audios` VALUES ('37', 'HDR技术1', '20170716124633.mp3', '46');
INSERT INTO `audios` VALUES ('38', '场景检测与物体识别技术1', '20170716124851.mp3', '47');
INSERT INTO `audios` VALUES ('39', '防抖技术2', '20170716014040.mp3', '48');
INSERT INTO `audios` VALUES ('40', '防抖技术3', '20170716021200.mp3', '51');
INSERT INTO `audios` VALUES ('41', '暗光高清拍摄技术2', '20170716022947.mp3', '52');
INSERT INTO `audios` VALUES ('42', '防抖技术1音频', '20170716024958.mp3', '53');
INSERT INTO `audios` VALUES ('43', '暗光高清技术1', '20170716025130.mp3', '54');
INSERT INTO `audios` VALUES ('44', '全景技术1', '20170716025230.mp3', '55');
INSERT INTO `audios` VALUES ('45', '人脸技术1', '20170716025427.mp3', '57');
INSERT INTO `audios` VALUES ('46', 'HDR技术1', '20170716025520.mp3', '58');
INSERT INTO `audios` VALUES ('47', '体感技术1', '20170716025623.mp3', '59');
INSERT INTO `audios` VALUES ('48', '防抖技术2', '20170716030204.mp3', '60');
INSERT INTO `audios` VALUES ('49', '防抖技术3', '20170716030305.mp3', '61');
INSERT INTO `audios` VALUES ('50', '暗光高清技术1', '20170716030426.mp3', '62');
INSERT INTO `audios` VALUES ('51', '暗光高清技术3', '20170716030649.mp3', '63');
INSERT INTO `audios` VALUES ('52', '全景技术1', '20170716030742.mp3', '64');
INSERT INTO `audios` VALUES ('53', '全景技术3', '20170716031104.mp3', '65');
INSERT INTO `audios` VALUES ('54', '人脸技术2', '20170716031449.mp3', '66');
INSERT INTO `audios` VALUES ('55', '人脸技术3', '20170716031542.mp3', '67');
INSERT INTO `audios` VALUES ('56', 'HDR技术1', '20170716031633.mp3', '68');
INSERT INTO `audios` VALUES ('57', 'HDR技术3', '20170716031802.mp3', '69');
INSERT INTO `audios` VALUES ('58', '体感技术1', '20170716031900.mp3', '70');
INSERT INTO `audios` VALUES ('59', '体感技术3', '20170716032025.mp3', '71');
INSERT INTO `audios` VALUES ('60', '防抖技术4', '20170717031825.mp3', '72');
INSERT INTO `audios` VALUES ('61', '体感技术4', '20170717031944.mp3', '73');

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
  `pre_id` int(11) DEFAULT NULL COMMENT '上一条留言ID',
  `from_who` int(11) DEFAULT '0' COMMENT '员工为0，管理员为1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='讨论表';

-- ----------------------------
-- Records of discuss
-- ----------------------------
INSERT INTO `discuss` VALUES ('1', '57', '1', '评论测试', '2017-08-05 23:31:39', null, '0');
INSERT INTO `discuss` VALUES ('2', '57', '1', '评论测试2', '2017-08-06 00:03:23', null, '0');
INSERT INTO `discuss` VALUES ('3', '57', '1', '测试3', '2017-08-06 00:12:24', null, '0');
INSERT INTO `discuss` VALUES ('4', '57', '1', '测试4', '2017-08-06 00:47:37', null, '0');
INSERT INTO `discuss` VALUES ('5', '57', '1', '我也来看看', '2017-08-06 00:57:11', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='员工表';

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '123', '1号', '123', '男', '3', '2', '18826101111', '71953604444@qq.com');
INSERT INTO `employee` VALUES ('2', 'chen', 'chen', 'chen', '男', '1', '2', '203423423', '981273@qq.com');
INSERT INTO `employee` VALUES ('3', 'dong', 'dong', 'dong', '女', '4', '1', '213123', '21313@qq.com');
INSERT INTO `employee` VALUES ('4', 'cai', 'cai', 'cai', '男', '3', '2', '1413241', '34322@qq.com');
INSERT INTO `employee` VALUES ('5', 'xixi', 'xixi', 'xixi', '女', '4', '2', '23424', '12312@qq.com');
INSERT INTO `employee` VALUES ('6', 'haha', 'haha', 'haha', '女', '3', '1', '31213', '12312@qq.com');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程表';

-- ----------------------------
-- Records of lesson
-- ----------------------------
INSERT INTO `lesson` VALUES ('34', '防抖技术', '1', '20170716023818.png', '防抖技术课程学习路径');
INSERT INTO `lesson` VALUES ('37', '暗光高清拍摄技术', '1', '20170716023827.png', '暗光高清拍摄技术课程学习路径');
INSERT INTO `lesson` VALUES ('40', '全景技术', '1', '20170716023834.png', '全景技术课程学习路径');
INSERT INTO `lesson` VALUES ('43', '人脸技术', '1', '20170716023844.jpg', '人脸技术课程学习路径');
INSERT INTO `lesson` VALUES ('46', 'HDR技术', '1', '20170716082712.png', 'HDR技术课程学习路径');
INSERT INTO `lesson` VALUES ('49', '场景检测与物体识别技术', '1', '20170716023907.jpg', '场景检测与物体识别技术课程学习路径');
INSERT INTO `lesson` VALUES ('52', '体感技术', '1', '20170716023914.png', '体感技术课程学习路径');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='ppt表';

-- ----------------------------
-- Records of ppts
-- ----------------------------
INSERT INTO `ppts` VALUES ('25', '防抖技术学习路径PPT', '20170714023634.pptx', '31');
INSERT INTO `ppts` VALUES ('26', '暗光高清技术路径PPT', '20170714024043.pptx', '32');
INSERT INTO `ppts` VALUES ('27', '暗光高清技术路径PPT', '20170714025155.pptx', '33');
INSERT INTO `ppts` VALUES ('28', '防抖技术测试1', '20170714030246.pptx', '36');
INSERT INTO `ppts` VALUES ('29', '全景技术测试1', '20170714030420.pptx', '37');
INSERT INTO `ppts` VALUES ('30', 'HDR技术测试1', '20170714030707.pptx', '38');
INSERT INTO `ppts` VALUES ('31', '体感技术测试1', '20170714030941.pptx', '39');
INSERT INTO `ppts` VALUES ('32', '3D立体成像技术1', '20170714031351.pptx', '40');
INSERT INTO `ppts` VALUES ('33', 'AR/VR技术测试1', '20170714031600.pptx', '41');
INSERT INTO `ppts` VALUES ('34', '防抖技术1', '20170716120048.mp4', '42');
INSERT INTO `ppts` VALUES ('35', '暗光高清拍摄技术1', '20170716124000.pptx', '43');
INSERT INTO `ppts` VALUES ('36', '全景技术1', '20170716124114.pptx', '44');
INSERT INTO `ppts` VALUES ('37', '人脸技术2', '20170716124308.pptx', '45');
INSERT INTO `ppts` VALUES ('38', 'HDR技术1', '20170716124633.pptx', '46');
INSERT INTO `ppts` VALUES ('39', '场景检测与物体识别技术1', '20170716124851.pptx', '47');
INSERT INTO `ppts` VALUES ('40', '防抖技术2', '20170716014040.pptx', '48');
INSERT INTO `ppts` VALUES ('41', '防抖技术3', '20170716021200.pptx', '51');
INSERT INTO `ppts` VALUES ('42', '暗光高清拍摄技术2', '20170716022947.pptx', '52');
INSERT INTO `ppts` VALUES ('43', '防抖技术1ppt', '20170716024958.pptx', '53');
INSERT INTO `ppts` VALUES ('44', '暗光高清技术1', '20170716025130.pptx', '54');
INSERT INTO `ppts` VALUES ('45', '全景技术1', '20170716025230.pptx', '55');
INSERT INTO `ppts` VALUES ('46', '人脸技术1', '20170716025427.pptx', '57');
INSERT INTO `ppts` VALUES ('47', 'HDR技术1', '20170716025520.pptx', '58');
INSERT INTO `ppts` VALUES ('48', '体感技术1', '20170716025623.pptx', '59');
INSERT INTO `ppts` VALUES ('49', '防抖技术2', '20170716030204.pptx', '60');
INSERT INTO `ppts` VALUES ('50', '防抖技术3', '20170716030305.pptx', '61');
INSERT INTO `ppts` VALUES ('51', '暗光高清技术1', '20170716030426.pptx', '62');
INSERT INTO `ppts` VALUES ('52', '暗光高清技术3', '20170716030649.pptx', '63');
INSERT INTO `ppts` VALUES ('53', '全景技术1', '20170716030742.pptx', '64');
INSERT INTO `ppts` VALUES ('54', '全景技术3', '20170716031103.pptx', '65');
INSERT INTO `ppts` VALUES ('55', '人脸技术2', '20170716031449.pptx', '66');
INSERT INTO `ppts` VALUES ('56', '人脸技术3', '20170716031542.pptx', '67');
INSERT INTO `ppts` VALUES ('57', 'HDR技术1', '20170716031633.pptx', '68');
INSERT INTO `ppts` VALUES ('58', 'HDR技术3', '20170716031802.pptx', '69');
INSERT INTO `ppts` VALUES ('59', '体感技术1', '20170716031900.pptx', '70');
INSERT INTO `ppts` VALUES ('60', '体感技术3', '20170716032025.pptx', '71');
INSERT INTO `ppts` VALUES ('61', '防抖技术4', '20170717031824.pptx', '72');
INSERT INTO `ppts` VALUES ('62', '体感技术4', '20170717031944.pptx', '73');

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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程线路表';

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES ('53', '34', '防抖技术1', '2017-07-16 06:48:50', '20170716024957.png', '防抖技术1课程描述');
INSERT INTO `route` VALUES ('54', '37', '暗光高清技术1', '2017-07-16 06:50:31', '20170716025129.png', '暗光高清技术1课程描述');
INSERT INTO `route` VALUES ('55', '40', '全景技术1', '2017-07-16 06:51:50', '20170716025230.png', '全景技术1课程描述');
INSERT INTO `route` VALUES ('57', '43', '人脸技术1', '2017-07-16 06:53:49', '20170716025427.jpg', '人脸技术1课程描述');
INSERT INTO `route` VALUES ('58', '46', 'HDR技术1', '2017-07-16 06:55:03', '20170716025520.jpg', 'HDR技术1课程描述');
INSERT INTO `route` VALUES ('59', '52', '体感技术1', '2017-07-16 06:55:33', '20170716025623.png', '体感技术1课程描述');
INSERT INTO `route` VALUES ('60', '34', '防抖技术2', '2017-07-16 06:57:25', '20170716030204.jpg', '防抖技术2课程描述');
INSERT INTO `route` VALUES ('61', '34', '防抖技术3', '2017-07-16 07:02:15', '20170716030305.jpg', '防抖技术3课程描述');
INSERT INTO `route` VALUES ('62', '37', '暗光高清技术2', '2017-07-16 07:03:52', '20170716030426.jpg', '暗光高清技术2课程描述');
INSERT INTO `route` VALUES ('63', '37', '暗光高清技术3', '2017-07-16 07:06:11', '20170716030649.jpg', '暗光高清技术3课程描述');
INSERT INTO `route` VALUES ('64', '40', '全景技术2', '2017-07-16 07:07:15', '20170716030742.jpg', '全景技术2课程描述');
INSERT INTO `route` VALUES ('65', '40', '全景技术3', '2017-07-16 07:10:47', '20170716031103.jpg', '全景技术3课程描述');
INSERT INTO `route` VALUES ('66', '43', '人脸技术2', '2017-07-16 07:14:05', '20170716031449.jpg', '人脸技术2课程描述');
INSERT INTO `route` VALUES ('67', '43', '人脸技术3', '2017-07-16 07:15:06', '20170716031541.jpg', '人脸技术3课程描述');
INSERT INTO `route` VALUES ('68', '46', 'HDR技术2', '2017-07-16 07:15:59', '20170716031633.jpg', 'HDR技术2课程描述');
INSERT INTO `route` VALUES ('69', '46', 'HDR技术3', '2017-07-16 07:17:33', '20170716031802.jpg', 'HDR技术3课程描述');
INSERT INTO `route` VALUES ('70', '52', '体感技术2', '2017-07-16 07:18:19', '20170716031900.jpg', '体感技术2课程描述');
INSERT INTO `route` VALUES ('71', '52', '体感技术3', '2017-07-16 07:19:59', '20170716032025.jpg', '体感技术3课程描述');
INSERT INTO `route` VALUES ('72', '34', '防抖技术4', '2017-07-17 07:17:07', '20170717031819.png', '防抖技术4课程描述');

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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='视频表';

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('27', '防抖技术学习路径视频', 'oceans.mp4', '0', 'oceans.png', '31');
INSERT INTO `videos` VALUES ('28', '暗光高清技术路径视频', 'oceans.mp4', '0', 'oceans.png', '32');
INSERT INTO `videos` VALUES ('29', '暗光高清技术路径视频', 'oceans.mp4', '0', 'oceans.png', '33');
INSERT INTO `videos` VALUES ('32', '防抖技术测试1', 'oceans.mp4', '0', 'oceans.png', '36');
INSERT INTO `videos` VALUES ('33', '全景技术测试1', 'oceans.mp4', '0', 'oceans.png', '37');
INSERT INTO `videos` VALUES ('34', 'HDR技术测试1', 'oceans.mp4', '0', 'oceans.png', '38');
INSERT INTO `videos` VALUES ('35', '体感技术测试1', 'oceans.mp4', '0', 'oceans.png', '39');
INSERT INTO `videos` VALUES ('36', '3D立体成像技术1', 'oceans.mp4', '0', 'oceans.png', '40');
INSERT INTO `videos` VALUES ('37', 'AR/VR技术测试1', 'oceans.mp4', '0', 'oceans.png', '41');
INSERT INTO `videos` VALUES ('38', '防抖技术1', 'oceans.mp4', '0', 'oceans.png', '42');
INSERT INTO `videos` VALUES ('39', '暗光高清拍摄技术1', 'oceans.mp4', '0', 'oceans.png', '43');
INSERT INTO `videos` VALUES ('40', '全景技术1', 'oceans.mp4', '0', 'oceans.png', '44');
INSERT INTO `videos` VALUES ('41', '人脸技术1', 'oceans.mp4', '0', 'oceans.png', '45');
INSERT INTO `videos` VALUES ('42', 'HDR技术1', 'oceans.mp4', '0', 'oceans.png', '46');
INSERT INTO `videos` VALUES ('43', '场景检测与物体识别技术1', 'oceans.mp4', '0', 'oceans.png', '47');
INSERT INTO `videos` VALUES ('44', '防抖技术2', 'oceans.mp4', '0', 'oceans.png', '48');
INSERT INTO `videos` VALUES ('47', '防抖技术3', 'oceans.mp4', '0', 'oceans.png', '51');
INSERT INTO `videos` VALUES ('48', '暗光高清拍摄技术2', 'oceans.mp4', '0', 'oceans.png', '52');
INSERT INTO `videos` VALUES ('49', '防抖技术1视频', 'oceans.mp4', '0', 'oceans.png', '53');
INSERT INTO `videos` VALUES ('50', '暗光高清技术1', 'oceans.mp4', '0', 'oceans.png', '54');
INSERT INTO `videos` VALUES ('51', '全景技术1', 'oceans.mp4', '0', 'oceans.png', '55');
INSERT INTO `videos` VALUES ('52', '人脸技术1', 'oceans.mp4', '0', 'oceans.png', '57');
INSERT INTO `videos` VALUES ('53', 'HDR技术1', 'oceans.mp4', '0', 'oceans.png', '58');
INSERT INTO `videos` VALUES ('54', '体感技术1', 'oceans.mp4', '0', 'oceans.png', '59');
INSERT INTO `videos` VALUES ('55', '防抖技术2', 'oceans.mp4', '0', 'oceans.png', '60');
INSERT INTO `videos` VALUES ('56', '防抖技术3', 'oceans.mp4', '0', 'oceans.png', '61');
INSERT INTO `videos` VALUES ('57', '暗光高清技术1', 'oceans.mp4', '0', 'oceans.png', '62');
INSERT INTO `videos` VALUES ('58', '暗光高清技术3', 'oceans.mp4', '0', 'oceans.png', '63');
INSERT INTO `videos` VALUES ('59', '全景技术1', 'oceans.mp4', '0', 'oceans.png', '64');
INSERT INTO `videos` VALUES ('60', '全景技术3', 'oceans.mp4', '0', 'oceans.png', '65');
INSERT INTO `videos` VALUES ('61', '人脸技术2', 'oceans.mp4', '0', 'oceans.png', '66');
INSERT INTO `videos` VALUES ('62', '人脸技术3', 'oceans.mp4', '0', 'oceans.png', '67');
INSERT INTO `videos` VALUES ('63', 'HDR技术1', 'oceans.mp4', '0', 'oceans.png', '68');
INSERT INTO `videos` VALUES ('64', 'HDR技术3', 'oceans.mp4', '0', 'oceans.png', '69');
INSERT INTO `videos` VALUES ('65', '体感技术1', 'oceans.mp4', '0', 'oceans.png', '70');
INSERT INTO `videos` VALUES ('66', '体感技术3', 'oceans.mp4', '0', 'oceans.png', '71');
INSERT INTO `videos` VALUES ('67', '防抖技术4', 'oceans.mp4', '0', 'oceans.png', '72');
INSERT INTO `videos` VALUES ('68', '体感技术4', 'oceans.mp4', '0', 'oceans.png', '73');

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
