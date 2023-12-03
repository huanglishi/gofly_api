/*
 Navicat Premium Data Transfer

 Source Server         : 本地mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : gofly_api

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 04/12/2023 00:34:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for business_article
-- ----------------------------
DROP TABLE IF EXISTS `business_article`;
CREATE TABLE `business_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '管理分类',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品名称',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品简介',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '产品封面',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0=正常，1=禁用',
  `createtime` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_article
-- ----------------------------

-- ----------------------------
-- Table structure for business_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `business_article_cate`;
CREATE TABLE `business_article_cate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `createtime` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_article_cate
-- ----------------------------

-- ----------------------------
-- Table structure for business_store_cate
-- ----------------------------
DROP TABLE IF EXISTS `business_store_cate`;
CREATE TABLE `business_store_cate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父级',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `createtime` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_store_cate
-- ----------------------------

-- ----------------------------
-- Table structure for business_store_product
-- ----------------------------
DROP TABLE IF EXISTS `business_store_product`;
CREATE TABLE `business_store_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT 0 COMMENT '管理分类',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简介',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态0=正常，1=禁用',
  `createtime` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business_store_product
-- ----------------------------

-- ----------------------------
-- Table structure for common_config
-- ----------------------------
DROP TABLE IF EXISTS `common_config`;
CREATE TABLE `common_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_from` enum('common','business') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'common' COMMENT '数据来源common=公共，business=商业端',
  `businessID` int(11) NOT NULL DEFAULT 0 COMMENT '业务主账号id',
  `keyname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置名称',
  `keyvalue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值',
  `des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `weigh` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置参数' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of common_config
-- ----------------------------
INSERT INTO `common_config` VALUES (2, 'common', 0, 'rooturl', 'https://sg.goflys.cn/common/uploadfile/get_image?url=', '图片路径', 0);

SET FOREIGN_KEY_CHECKS = 1;
