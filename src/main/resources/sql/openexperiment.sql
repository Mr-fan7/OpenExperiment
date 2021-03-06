/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : openexperiment

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-21 15:54:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl
-- ----------------------------
DROP TABLE IF EXISTS `acl`;
CREATE TABLE `acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL COMMENT '对权限的具体描述',
  `name` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(255) DEFAULT NULL COMMENT '具体接口的url',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publisher_id` bigint(20) DEFAULT NULL COMMENT '发布者id',
  `title` varchar(255) DEFAULT NULL COMMENT '公告标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '公告主要内容',
  `publish_time` datetime DEFAULT NULL COMMENT '发布时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '通知标题',
  `sender_id` bigint(20) DEFAULT NULL COMMENT '发送者id',
  `message` varchar(255) DEFAULT NULL COMMENT '具体消息',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for polemic_group
-- ----------------------------
DROP TABLE IF EXISTS `polemic_group`;
CREATE TABLE `polemic_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '分组名称',
  `status` int(11) DEFAULT NULL COMMENT '答辩分组状态:1.立项答辩,2.中期答辩,3.结项答辩',
  `group_num` int(11) DEFAULT NULL COMMENT '一个答辩组限制的项目组数量',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_file
-- ----------------------------
DROP TABLE IF EXISTS `project_file`;
CREATE TABLE `project_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_group_id` bigint(20) DEFAULT NULL,
  `download_times` int(11) DEFAULT NULL COMMENT '下载次数',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_type` int(11) DEFAULT NULL COMMENT '文件类型：1.excel,2.word,3.viedo,4.image',
  `size` varchar(255) DEFAULT NULL COMMENT '文件大小',
  `upload_time` datetime DEFAULT NULL COMMENT '上传时间',
  `upload_user_id` bigint(20) DEFAULT NULL COMMENT '上传者id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_group
-- ----------------------------
DROP TABLE IF EXISTS `project_group`;
CREATE TABLE `project_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL COMMENT '实验地点',
  `create_time` datetime DEFAULT NULL COMMENT '小组申报时间',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '申报者id',
  `end_time` datetime DEFAULT NULL COMMENT '实验截止时间',
  `examination` varchar(255) DEFAULT NULL COMMENT '成果考核方式',
  `experiment_type` int(11) DEFAULT NULL COMMENT '实验类型：1.科研，2.科技活动，3.自选课题，4.计算机应用，5.人文素质',
  `fit_people_num` int(11) DEFAULT NULL COMMENT '适宜人数',
  `lab_name` varchar(255) DEFAULT NULL COMMENT '实验室名称',
  `project_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `project_type` int(11) DEFAULT NULL COMMENT '项目类型：1.普通，2.重点',
  `start_time` datetime DEFAULT NULL COMMENT '实验开始时间',
  `status` int(11) DEFAULT NULL COMMENT '实验开展进度，根据需求进行确定',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for project_polemic
-- ----------------------------
DROP TABLE IF EXISTS `project_polemic`;
CREATE TABLE `project_polemic` (
  `id` bigint(20) NOT NULL,
  `project_group_id` bigint(20) DEFAULT NULL COMMENT '项目组id',
  `polemic_group_id` bigint(20) DEFAULT NULL COMMENT '答辩组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for receive_notice
-- ----------------------------
DROP TABLE IF EXISTS `receive_notice`;
CREATE TABLE `receive_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_id` bigint(20) DEFAULT NULL COMMENT '通知id',
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '接收者id',
  `status` int(11) DEFAULT NULL COMMENT '消息状态(1.已读,2.未读)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role_acl
-- ----------------------------
DROP TABLE IF EXISTS `role_acl`;
CREATE TABLE `role_acl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL,
  `acl_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL COMMENT '学号或工号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `fix_phone` varchar(255) DEFAULT NULL COMMENT '固定电话',
  `id_card` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `mobile_phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码或者token',
  `qq_num` varchar(255) DEFAULT NULL COMMENT 'qq号',
  `real_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型：1.学生，2.教师',
  `institute` varchar(255) DEFAULT NULL COMMENT '学院',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `grade` int(11) DEFAULT NULL COMMENT '年级',
  `class_num` int(11) DEFAULT NULL COMMENT '班级',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_project_group
-- ----------------------------
DROP TABLE IF EXISTS `user_project_group`;
CREATE TABLE `user_project_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_group_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `technical_role` varchar(255) DEFAULT NULL COMMENT '技术职称',
  `status` int(11) DEFAULT NULL COMMENT '参与状态:1.申请,已加入',
  `member_role` int(4) DEFAULT NULL COMMENT '成员身份：1.指导教师2.项目组长3.普通成员',
  `personal_judge` varchar(2000) DEFAULT NULL COMMENT '自我评价',
  `join_time` datetime DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
