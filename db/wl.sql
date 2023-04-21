/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50737
 Source Host           : localhost:3306
 Source Schema         : logistics

 Target Server Type    : MySQL
 Target Server Version : 50737
 File Encoding         : 65001

 Date: 07/03/2023 22:23:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '快递种类id',
  `cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递种类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '普通物品');
INSERT INTO `category` VALUES (2, '大件物品');
INSERT INTO `category` VALUES (3, '贵重物品');
INSERT INTO `category` VALUES (4, '易碎物品');
INSERT INTO `category` VALUES (5, '生鲜');
INSERT INTO `category` VALUES (6, '活物');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `status` int(11) NULL DEFAULT 0 COMMENT '订单状态(0,未收货;1,已收货;)',
  `position_id` int(11) NULL DEFAULT NULL COMMENT '订单位置id',
  `send_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人姓名',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '收件人id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '订单更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (8, '2021051719381112', 1, 1, 'admin', 1, '2023-03-07 19:38:23', '2023-03-07 19:38:31');
INSERT INTO `orders` VALUES (9, '2021051719392312', 0, 1, 'admin', 2, '2023-03-07 19:39:52', '2023-03-07 19:39:52');
INSERT INTO `orders` VALUES (10, '2021051719400712', 0, 2, 'admin', 1, '2023-03-07 19:40:21', '2021-05-17 19:40:21');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '储物柜id',
  `locker` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '储物柜位置',
  `status` int(11) NULL DEFAULT 0 COMMENT '储物柜状态(0没有东西,1有东西)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 'A柜1号', 1);
INSERT INTO `position` VALUES (2, 'A柜2号', 1);
INSERT INTO `position` VALUES (3, 'A柜3号', 0);
INSERT INTO `position` VALUES (4, 'A柜4号', 0);
INSERT INTO `position` VALUES (5, 'A柜5号', 0);
INSERT INTO `position` VALUES (6, 'A柜6号', 0);
INSERT INTO `position` VALUES (7, 'A柜7号', 0);
INSERT INTO `position` VALUES (8, 'A柜8号', 0);
INSERT INTO `position` VALUES (9, 'A柜9号', 0);
INSERT INTO `position` VALUES (10, 'A柜10号', 0);
INSERT INTO `position` VALUES (11, 'B柜1号', 0);
INSERT INTO `position` VALUES (12, 'B柜2号', 0);
INSERT INTO `position` VALUES (13, 'B柜3号', 0);
INSERT INTO `position` VALUES (14, 'B柜4号', 0);
INSERT INTO `position` VALUES (15, 'B柜5号', 0);
INSERT INTO `position` VALUES (16, 'B柜6号', 0);
INSERT INTO `position` VALUES (17, 'B柜7号', 0);
INSERT INTO `position` VALUES (18, 'B柜8号', 0);
INSERT INTO `position` VALUES (19, 'B柜9号', 0);
INSERT INTO `position` VALUES (20, 'B柜10号', 0);
INSERT INTO `position` VALUES (21, 'C柜1号', 0);
INSERT INTO `position` VALUES (22, 'C柜2号', 0);
INSERT INTO `position` VALUES (23, 'C柜3号', 0);
INSERT INTO `position` VALUES (24, 'C柜4号', 0);
INSERT INTO `position` VALUES (25, 'C柜5号', 0);
INSERT INTO `position` VALUES (26, 'C柜6号', 0);
INSERT INTO `position` VALUES (27, 'C柜7号', 0);
INSERT INTO `position` VALUES (28, 'C柜8号', 0);
INSERT INTO `position` VALUES (29, 'C柜9号', 0);
INSERT INTO `position` VALUES (30, 'C柜10号', 0);

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '寄件id',
  `num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件编号',
  `consignee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `consignee_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `consignee_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `weight` decimal(55, 2) NULL DEFAULT NULL COMMENT '快递重量',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '快递种类id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '寄件人id',
  `status` int(11) NULL DEFAULT 0 COMMENT '寄件状态(0未寄出,1已寄出,2已揽件,3已签收)',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '寄件创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '寄件更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (17, '2021051719381112', 'admin', '12345678910', 'aaaaaa', 1.00, 3, 1, 3, '2023-03-07 19:38:11', '2023-03-07 19:38:32');
INSERT INTO `post` VALUES (18, '2021051719385312', 'admin', '12345678910', 'aaaaaa', 1.00, 1, 1, 1, '2023-03-07 19:38:53', '2023-03-07 19:39:30');
INSERT INTO `post` VALUES (19, '2021051719390612', 'admin', '12345678910', 'aaaaaa', 2.00, 4, 1, 0, '2023-03-07 19:39:06', '2023-03-07 19:39:06');
INSERT INTO `post` VALUES (20, '2021051719392312', 'test', '12345678910', 'aaaaaa', 3.00, 3, 1, 2, '2023-03-07 19:39:24', '2023-03-07 19:39:52');
INSERT INTO `post` VALUES (21, '2021051719400712', 'admin', '12345678910', 'aaaaaa', 11.00, 5, 1, 2, '2023-03-07 19:40:08', '2021-05-17 19:40:21');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `role` int(11) NULL DEFAULT 1 COMMENT '角色(0为管理员，1为用户)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456', '123456', 'admin', 'https://ev-trading.oss-cn-beijing.aliyuncs.com/trading/2021-05-03/09a3b880f37441228c872b68384689de-aaa.jpg', '12345678910', '12345678910@qq.com', '2023-03-07 21:28:25', 0);
INSERT INTO `user` VALUES (2, '111111', '111111', 'test', NULL, '12345678910', '12345678910@qq.com', '2023-03-07 00:10:23', 1);
INSERT INTO `user` VALUES (3, 'a10086', '123456', '123456', NULL, '12345678910', '12344@qq.com', '2023-03-07 21:43:21', 1);

SET FOREIGN_KEY_CHECKS = 1;
