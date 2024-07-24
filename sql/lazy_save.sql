/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : lazy_save

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 24/07/2024 19:47:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '日常饮食', NULL, 'admin');
INSERT INTO `category` VALUES (2, '烟酒', NULL, 'admin');
INSERT INTO `category` VALUES (3, '社交', NULL, 'admin');
INSERT INTO `category` VALUES (4, '通讯', NULL, 'admin');
INSERT INTO `category` VALUES (5, '存钱', NULL, 'admin');
INSERT INTO `category` VALUES (6, '水果', NULL, 'admin');
INSERT INTO `category` VALUES (7, '数码', NULL, 'admin');
INSERT INTO `category` VALUES (8, '交通', NULL, 'admin');
INSERT INTO `category` VALUES (9, '恋爱', NULL, 'admin');
INSERT INTO `category` VALUES (10, '日用', NULL, 'admin');
INSERT INTO `category` VALUES (11, '旅游', NULL, 'wang');
INSERT INTO `category` VALUES (12, '日用', NULL, 'wang');
INSERT INTO `category` VALUES (13, '吃饭', NULL, 'wang');
INSERT INTO `category` VALUES (14, '逛商场', '买衣服', 'zhangsan');
INSERT INTO `category` VALUES (15, '游戏', '寻欢', 'zhangsan');
INSERT INTO `category` VALUES (16, '代步', '跑腿', 'zhangsan');

-- ----------------------------
-- Table structure for consumption
-- ----------------------------
DROP TABLE IF EXISTS `consumption`;
CREATE TABLE `consumption`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消费项目',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消费人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '消费时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of consumption
-- ----------------------------
INSERT INTO `consumption` VALUES (2, '吃火锅', 199.00, '日常饮食', '吃火锅', 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', 'admin', '2022-03-02 22:06:02');
INSERT INTO `consumption` VALUES (3, '旅行', 599.00, '交通', '旅行', 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', 'admin', '2022-04-02 22:06:02');
INSERT INTO `consumption` VALUES (4, '吃火锅', 199.00, '日用', '吃火锅', 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', 'admin', '2022-05-02 22:06:02');
INSERT INTO `consumption` VALUES (7, '买冰淇淋', 10.00, '日常饮食', '11', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', 'qwe', '2022-05-03 20:06:05');
INSERT INTO `consumption` VALUES (10, '111', 22.00, '旅游', '11', NULL, 'wangwu', '2022-05-17');
INSERT INTO `consumption` VALUES (11, '11', 222.00, '旅游', '222', NULL, 'wangwu', '2022-05-04');
INSERT INTO `consumption` VALUES (13, '泡妞', 1000.00, '游戏', '', 'http://localhost:9090/file/ded8709384704e71b72ab309660b97d9.jpg', 'zhangsan', '2023-09-21');
INSERT INTO `consumption` VALUES (14, '买衣服', 200.00, '逛商场', NULL, 'http://localhost:9090/file/3e716aea3bec4b169f542fbe73cf4ccc.jpg', 'zhangsan', '2023-09-19');
INSERT INTO `consumption` VALUES (15, '买车', 20000.00, '代步', '买二手车', 'http://localhost:9090/file/bd68d29bd386439b9a3c51579948835f.jpg', 'zhangsan', '2023-09-20');

-- ----------------------------
-- Table structure for plan
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '计划名称',
  `duration` int(0) NULL DEFAULT NULL COMMENT '周期',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '每日存入金额',
  `money_in` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '已存入金额',
  `remain` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '剩余金额',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建日期',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES (1, '每天10块钱', 365, 3650.00, 10.00, 20.00, 3630.00, 'admin', '2020-05-01 10:00:00', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png');
INSERT INTO `plan` VALUES (2, '计划存1000元', 50, 1000.00, 10.00, 120.00, 880.00, 'admin', '2020-05-01 10:00:00', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png');
INSERT INTO `plan` VALUES (5, '存1000元', 100, 1000.00, 10.00, 20.00, 980.00, 'qwe', '2022-05-03 20:04:54', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png');
INSERT INTO `plan` VALUES (7, '测试1000元存钱', 100, 1000.00, 10.00, 0.00, 0.00, 'wang', '2022-05-03 22:27:15', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png');
INSERT INTO `plan` VALUES (8, '存钱365', 365, 3650.00, 10.00, 0.00, 0.00, 'wang', '2022-05-03 22:27:41', 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png');
INSERT INTO `plan` VALUES (9, '买房', 360, 36000.00, 100.00, 200.00, 35800.00, 'zhangsan', '2023-09-17 21:29:25', 'http://localhost:9090/file/ded8709384704e71b72ab309660b97d9.jpg');
INSERT INTO `plan` VALUES (10, '买车', 360, 360.00, 1.00, 2.00, 358.00, 'zhangsan', '2023-09-17 21:30:21', 'http://localhost:9090/file/9153167525174f6a8a542caa32af9395.jpg');
INSERT INTO `plan` VALUES (11, '逛商场', 30, 1200.00, 40.00, 80.00, 1120.00, 'zhangsan', '2023-09-19 14:19:33', 'http://localhost:9090/file/3e716aea3bec4b169f542fbe73cf4ccc.jpg');

-- ----------------------------
-- Table structure for plan_item
-- ----------------------------
DROP TABLE IF EXISTS `plan_item`;
CREATE TABLE `plan_item`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `plan_id` int(0) NULL DEFAULT NULL COMMENT '计划id',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `total` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计金额',
  `date` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日期',
  `user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plan_item
-- ----------------------------
INSERT INTO `plan_item` VALUES (5, 2, 10.00, 10.00, '2022-03-03', 'admin');
INSERT INTO `plan_item` VALUES (6, 2, 10.00, 20.00, '2022-03-03', 'admin');
INSERT INTO `plan_item` VALUES (7, 2, 10.00, 30.00, '2022-05-03', 'admin');
INSERT INTO `plan_item` VALUES (8, 2, 10.00, 40.00, '2022-05-03', 'admin');
INSERT INTO `plan_item` VALUES (17, 1, 10.00, 10.00, '2022-04-03', 'admin');
INSERT INTO `plan_item` VALUES (18, 1, 10.00, 20.00, '2022-04-03', 'admin');
INSERT INTO `plan_item` VALUES (19, 1, 10.00, 10.00, '2022-04-03', 'admin');
INSERT INTO `plan_item` VALUES (20, 1, 10.00, 20.00, '2022-04-03', 'admin');
INSERT INTO `plan_item` VALUES (22, 5, 10.00, 10.00, '2022-05-03', 'qwe');
INSERT INTO `plan_item` VALUES (23, 5, 10.00, 20.00, '2022-05-03', 'qwe');
INSERT INTO `plan_item` VALUES (24, 6, 100.00, 100.00, '2022-05-03', 'qwe');
INSERT INTO `plan_item` VALUES (25, 11, 40.00, 40.00, '2023-09-19', 'zhang');
INSERT INTO `plan_item` VALUES (26, 9, 100.00, 100.00, '2023-09-19', 'zhang');
INSERT INTO `plan_item` VALUES (27, 10, 1.00, 1.00, '2023-09-19', 'zhang');
INSERT INTO `plan_item` VALUES (28, 11, 40.00, 80.00, '2023-09-20', 'zhang');
INSERT INTO `plan_item` VALUES (29, 10, 1.00, 2.00, '2023-09-20', 'zhang');
INSERT INTO `plan_item` VALUES (30, 9, 100.00, 200.00, '2023-09-20', 'zhang');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES (2, 'house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES (3, 'menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES (4, 's-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES (5, 's-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES (6, 'document', 'el-icon-document', 'icon');
INSERT INTO `sys_dict` VALUES (7, 'coffee', 'el-icon-coffee\r\n', 'icon');
INSERT INTO `sys_dict` VALUES (8, 's-marketing', 'el-icon-s-marketing', 'icon');
INSERT INTO `sys_dict` VALUES (9, 'phone-outline', 'el-icon-phone-outline', 'icon');
INSERT INTO `sys_dict` VALUES (10, 'platform-eleme', 'el-icon-platform-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (11, 'eleme', 'el-icon-eleme', 'icon');
INSERT INTO `sys_dict` VALUES (12, 'delete-solid', 'el-icon-delete-solid', 'icon');
INSERT INTO `sys_dict` VALUES (13, 'delete', 'el-icon-delete', 'icon');
INSERT INTO `sys_dict` VALUES (14, 's-tools', 'el-icon-s-tools', 'icon');
INSERT INTO `sys_dict` VALUES (15, 'setting', 'el-icon-setting', 'icon');
INSERT INTO `sys_dict` VALUES (16, 'user-solid', 'el-icon-user-solid', 'icon');
INSERT INTO `sys_dict` VALUES (17, 'phone', 'el-icon-phone', 'icon');
INSERT INTO `sys_dict` VALUES (18, 'more', 'el-icon-more', 'icon');
INSERT INTO `sys_dict` VALUES (19, 'more-outline', 'el-icon-more-outline', 'icon');
INSERT INTO `sys_dict` VALUES (20, 'star-on', 'el-icon-star-on', 'icon');
INSERT INTO `sys_dict` VALUES (21, 'star-off', 'el-icon-star-off', 'icon');
INSERT INTO `sys_dict` VALUES (22, 's-goods', 'el-icon-s-goods', 'icon');
INSERT INTO `sys_dict` VALUES (23, 'goods', 'el-icon-goods', 'icon');
INSERT INTO `sys_dict` VALUES (24, 'warning', 'el-icon-warning', 'icon');
INSERT INTO `sys_dict` VALUES (25, 'warning-outline', 'el-icon-warning-outline', 'icon');
INSERT INTO `sys_dict` VALUES (26, 'question', 'el-icon-question', 'icon');
INSERT INTO `sys_dict` VALUES (27, 'info', 'el-icon-info', 'icon');
INSERT INTO `sys_dict` VALUES (28, 'remove', 'el-icon-remove', 'icon');
INSERT INTO `sys_dict` VALUES (29, 'circle-plus', 'el-icon-circle-plus', 'icon');
INSERT INTO `sys_dict` VALUES (30, 'success', 'el-icon-success', 'icon');
INSERT INTO `sys_dict` VALUES (31, 'error', 'el-icon-error', 'icon');
INSERT INTO `sys_dict` VALUES (32, 'zoom-in', 'el-icon-zoom-in', 'icon');
INSERT INTO `sys_dict` VALUES (33, 'zoom-out', 'el-icon-zoom-out', 'icon');
INSERT INTO `sys_dict` VALUES (34, 'remove-outline', 'el-icon-remove-outline', 'icon');
INSERT INTO `sys_dict` VALUES (35, 'circle-plus-outline', 'el-icon-circle-plus-outline', 'icon');
INSERT INTO `sys_dict` VALUES (36, 'circle-check', 'el-icon-circle-check', 'icon');
INSERT INTO `sys_dict` VALUES (37, 'circle-close', 'el-icon-circle-close', 'icon');
INSERT INTO `sys_dict` VALUES (38, 's-help', 'el-icon-s-help', 'icon');
INSERT INTO `sys_dict` VALUES (39, 'help', 'el-icon-help', 'icon');
INSERT INTO `sys_dict` VALUES (40, 'minus', 'el-icon-minus', 'icon');
INSERT INTO `sys_dict` VALUES (41, 'plus', 'el-icon-plus', 'icon');
INSERT INTO `sys_dict` VALUES (42, 'check', 'el-icon-check', 'icon');
INSERT INTO `sys_dict` VALUES (43, 'close', 'el-icon-close', 'icon');
INSERT INTO `sys_dict` VALUES (44, 'picture', 'el-icon-picture', 'icon');
INSERT INTO `sys_dict` VALUES (45, 'picture-outline', 'el-icon-picture-outline', 'icon');
INSERT INTO `sys_dict` VALUES (46, 'picture-outline-round', 'el-icon-picture-outline-round', 'icon');
INSERT INTO `sys_dict` VALUES (47, 'upload', 'el-icon-upload', 'icon');
INSERT INTO `sys_dict` VALUES (48, 'upload2', 'el-icon-upload2', 'icon');
INSERT INTO `sys_dict` VALUES (49, 'download', 'el-icon-download', 'icon');
INSERT INTO `sys_dict` VALUES (50, 'camera-solid', 'el-icon-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (51, 'camera', 'el-icon-camera', 'icon');
INSERT INTO `sys_dict` VALUES (52, 'video-camera-solid', 'el-icon-video-camera-solid', 'icon');
INSERT INTO `sys_dict` VALUES (53, 'video-camera', 'el-icon-video-camera', 'icon');
INSERT INTO `sys_dict` VALUES (54, 'message-solid', 'el-icon-message-solid', 'icon');
INSERT INTO `sys_dict` VALUES (55, 'bell', 'el-icon-bell', 'icon');
INSERT INTO `sys_dict` VALUES (56, 's-cooperation', 'el-icon-s-cooperation', 'icon');
INSERT INTO `sys_dict` VALUES (57, 's-order', 'el-icon-s-order', 'icon');
INSERT INTO `sys_dict` VALUES (58, 's-platform', 'el-icon-s-platform', 'icon');
INSERT INTO `sys_dict` VALUES (59, 's-fold', 'el-icon-s-fold', 'icon');
INSERT INTO `sys_dict` VALUES (60, 's-unfold', 'el-icon-s-unfold', 'icon');
INSERT INTO `sys_dict` VALUES (61, 's-operation', 'el-icon-s-operation', 'icon');
INSERT INTO `sys_dict` VALUES (62, 's-promotion', 'el-icon-s-promotion', 'icon');
INSERT INTO `sys_dict` VALUES (63, 's-home', 'el-icon-s-home', 'icon');
INSERT INTO `sys_dict` VALUES (64, 's-release', 'el-icon-s-release', 'icon');
INSERT INTO `sys_dict` VALUES (65, 's-ticket', 'el-icon-s-ticket', 'icon');
INSERT INTO `sys_dict` VALUES (66, 's-management', 'el-icon-s-management', 'icon');
INSERT INTO `sys_dict` VALUES (67, 's-open', 'el-icon-s-open', 'icon');
INSERT INTO `sys_dict` VALUES (68, 's-shop', 'el-icon-s-shop', 'icon');
INSERT INTO `sys_dict` VALUES (69, 's-flag', 'el-icon-s-flag', 'icon');
INSERT INTO `sys_dict` VALUES (70, 's-comment', 'el-icon-s-comment', 'icon');
INSERT INTO `sys_dict` VALUES (71, 's-finance', 'el-icon-s-finance', 'icon');
INSERT INTO `sys_dict` VALUES (72, 's-claim', 'el-icon-s-claim', 'icon');
INSERT INTO `sys_dict` VALUES (73, 's-opportunity', 'el-icon-s-opportunity', 'icon');
INSERT INTO `sys_dict` VALUES (74, 's-data', 'el-icon-s-data', 'icon');
INSERT INTO `sys_dict` VALUES (75, 's-check', 'el-icon-s-check', 'icon');
INSERT INTO `sys_dict` VALUES (76, 'share', 'el-icon-share', 'icon');
INSERT INTO `sys_dict` VALUES (77, 'd-caret', 'el-icon-d-caret', 'icon');
INSERT INTO `sys_dict` VALUES (78, 'caret-left', 'el-icon-caret-left', 'icon');
INSERT INTO `sys_dict` VALUES (79, 'caret-right', 'el-icon-caret-right', 'icon');
INSERT INTO `sys_dict` VALUES (80, 'caret-bottom', 'el-icon-caret-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (81, 'caret-top', 'el-icon-caret-top', 'icon');
INSERT INTO `sys_dict` VALUES (82, 'bottom-left', 'el-icon-bottom-left', 'icon');
INSERT INTO `sys_dict` VALUES (83, 'bottom-right', 'el-icon-bottom-right', 'icon');
INSERT INTO `sys_dict` VALUES (84, 'back', 'el-icon-back', 'icon');
INSERT INTO `sys_dict` VALUES (85, 'right', 'el-icon-right', 'icon');
INSERT INTO `sys_dict` VALUES (86, 'bottom', 'el-icon-bottom', 'icon');
INSERT INTO `sys_dict` VALUES (87, 'top', 'el-icon-top', 'icon');
INSERT INTO `sys_dict` VALUES (88, 'top-left', 'el-icon-top-left', 'icon');
INSERT INTO `sys_dict` VALUES (89, 'top-right', 'el-icon-top-right', 'icon');
INSERT INTO `sys_dict` VALUES (90, 'arrow-left', 'el-icon-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (91, 'arrow-right', 'el-icon-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (92, 'arrow-down', 'el-icon-arrow-down', 'icon');
INSERT INTO `sys_dict` VALUES (93, 'arrow-up', 'el-icon-arrow-up', 'icon');
INSERT INTO `sys_dict` VALUES (94, 'd-arrow-left', 'el-icon-d-arrow-left', 'icon');
INSERT INTO `sys_dict` VALUES (95, 'd-arrow-right', 'el-icon-d-arrow-right', 'icon');
INSERT INTO `sys_dict` VALUES (96, 'video-pause', 'el-icon-video-pause', 'icon');
INSERT INTO `sys_dict` VALUES (97, 'video-play', 'el-icon-video-play', 'icon');
INSERT INTO `sys_dict` VALUES (98, 'refresh', 'el-icon-refresh', 'icon');
INSERT INTO `sys_dict` VALUES (99, 'refresh-right', 'el-icon-refresh-right', 'icon');
INSERT INTO `sys_dict` VALUES (100, 'refresh-left', 'el-icon-refresh-left', 'icon');
INSERT INTO `sys_dict` VALUES (101, 'finished', 'el-icon-finished', 'icon');
INSERT INTO `sys_dict` VALUES (102, 'sort', 'el-icon-sort', 'icon');
INSERT INTO `sys_dict` VALUES (103, 'sort-up', 'el-icon-sort-up', 'icon');
INSERT INTO `sys_dict` VALUES (104, 'sort-down', 'el-icon-sort-down', 'icon');
INSERT INTO `sys_dict` VALUES (105, 'rank', 'el-icon-rank', 'icon');
INSERT INTO `sys_dict` VALUES (106, 'loading', 'el-icon-loading', 'icon');
INSERT INTO `sys_dict` VALUES (107, 'view', 'el-icon-view', 'icon');
INSERT INTO `sys_dict` VALUES (108, 'c-scale-to-original', 'el-icon-c-scale-to-original', 'icon');
INSERT INTO `sys_dict` VALUES (109, 'date', 'el-icon-date', 'icon');
INSERT INTO `sys_dict` VALUES (110, 'edit', 'el-icon-edit', 'icon');
INSERT INTO `sys_dict` VALUES (111, 'edit-outline', 'el-icon-edit-outline', 'icon');
INSERT INTO `sys_dict` VALUES (112, 'folder', 'el-icon-folder', 'icon');
INSERT INTO `sys_dict` VALUES (113, 'folder-opened', 'el-icon-folder-opened', 'icon');
INSERT INTO `sys_dict` VALUES (114, 'folder-add', 'el-icon-folder-add', 'icon');
INSERT INTO `sys_dict` VALUES (115, 'folder-remove', 'el-icon-folder-remove', 'icon');
INSERT INTO `sys_dict` VALUES (116, 'folder-delete', 'el-icon-folder-delete', 'icon');
INSERT INTO `sys_dict` VALUES (117, 'folder-checked', 'el-icon-folder-checked', 'icon');
INSERT INTO `sys_dict` VALUES (118, 'tickets', 'el-icon-tickets', 'icon');
INSERT INTO `sys_dict` VALUES (119, 'document-remove', 'el-icon-document-remove', 'icon');
INSERT INTO `sys_dict` VALUES (120, 'document-delete', 'el-icon-document-delete', 'icon');
INSERT INTO `sys_dict` VALUES (121, 'document-copy', 'el-icon-document-copy', 'icon');
INSERT INTO `sys_dict` VALUES (122, 'document-checked', 'el-icon-document-checked', 'icon');
INSERT INTO `sys_dict` VALUES (123, 'document-add', 'el-icon-document-add', 'icon');
INSERT INTO `sys_dict` VALUES (124, 'printer', 'el-icon-printer', 'icon');
INSERT INTO `sys_dict` VALUES (125, 'paperclip', 'el-icon-paperclip', 'icon');
INSERT INTO `sys_dict` VALUES (126, 'takeaway-box', 'el-icon-takeaway-box', 'icon');
INSERT INTO `sys_dict` VALUES (127, 'search', 'el-icon-search', 'icon');
INSERT INTO `sys_dict` VALUES (128, 'monitor', 'el-icon-monitor', 'icon');
INSERT INTO `sys_dict` VALUES (129, 'attract', 'el-icon-attract', 'icon');
INSERT INTO `sys_dict` VALUES (130, 'mobile', 'el-icon-mobile', 'icon');
INSERT INTO `sys_dict` VALUES (131, 'scissors', 'el-icon-scissors', 'icon');
INSERT INTO `sys_dict` VALUES (132, 'umbrella', 'el-icon-umbrella', 'icon');
INSERT INTO `sys_dict` VALUES (133, 'headset', 'el-icon-headset', 'icon');
INSERT INTO `sys_dict` VALUES (134, 'brush', 'el-icon-brush', 'icon');
INSERT INTO `sys_dict` VALUES (135, 'mouse', 'el-icon-mouse', 'icon');
INSERT INTO `sys_dict` VALUES (136, 'coordinate', 'el-icon-coordinate', 'icon');
INSERT INTO `sys_dict` VALUES (137, 'magic-stick', 'el-icon-magic-stick', 'icon');
INSERT INTO `sys_dict` VALUES (138, 'reading', 'el-icon-reading', 'icon');
INSERT INTO `sys_dict` VALUES (139, 'data-line', 'el-icon-data-line', 'icon');
INSERT INTO `sys_dict` VALUES (140, 'data-board', 'el-icon-data-board', 'icon');
INSERT INTO `sys_dict` VALUES (141, 'pie-chart', 'el-icon-pie-chart', 'icon');
INSERT INTO `sys_dict` VALUES (142, 'data-analysis', 'el-icon-data-analysis', 'icon');
INSERT INTO `sys_dict` VALUES (143, 'collection-tag', 'el-icon-collection-tag', 'icon');
INSERT INTO `sys_dict` VALUES (144, 'film', 'el-icon-film', 'icon');
INSERT INTO `sys_dict` VALUES (145, 'suitcase', 'el-icon-suitcase', 'icon');
INSERT INTO `sys_dict` VALUES (146, 'suitcase-1', 'el-icon-suitcase-1', 'icon');
INSERT INTO `sys_dict` VALUES (147, 'receiving', 'el-icon-receiving', 'icon');
INSERT INTO `sys_dict` VALUES (148, 'collection', 'el-icon-collection', 'icon');
INSERT INTO `sys_dict` VALUES (149, 'files', 'el-icon-files', 'icon');
INSERT INTO `sys_dict` VALUES (150, 'notebook-1', 'el-icon-notebook-1', 'icon');
INSERT INTO `sys_dict` VALUES (151, 'notebook-2', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES (152, 'toilet-paper', 'el-icon-toilet-paper', 'icon');
INSERT INTO `sys_dict` VALUES (153, 'office-building', 'el-icon-office-building', 'icon');
INSERT INTO `sys_dict` VALUES (154, 'school', 'el-icon-school', 'icon');
INSERT INTO `sys_dict` VALUES (155, 'table-lamp', 'el-icon-table-lamp', 'icon');
INSERT INTO `sys_dict` VALUES (156, 'no-smoking', 'el-icon-no-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (157, 'smoking', 'el-icon-smoking', 'icon');
INSERT INTO `sys_dict` VALUES (158, 'shopping-cart-full', 'el-icon-shopping-cart-full', 'icon');
INSERT INTO `sys_dict` VALUES (159, 'shopping-cart-1', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` VALUES (160, 'shopping-cart-2', 'el-icon-shopping-cart-2', 'icon');
INSERT INTO `sys_dict` VALUES (161, 'shopping-bag-1', 'el-icon-shopping-bag-1', 'icon');
INSERT INTO `sys_dict` VALUES (162, 'shopping-bag-2', 'el-icon-shopping-bag-2', 'icon');
INSERT INTO `sys_dict` VALUES (163, 'sold-out', 'el-icon-sold-out', 'icon');
INSERT INTO `sys_dict` VALUES (164, 'sell', 'el-icon-sell', 'icon');
INSERT INTO `sys_dict` VALUES (165, 'present', 'el-icon-present', 'icon');
INSERT INTO `sys_dict` VALUES (166, 'box', 'el-icon-box', 'icon');
INSERT INTO `sys_dict` VALUES (167, 'bank-card', 'el-icon-bank-card', 'icon');
INSERT INTO `sys_dict` VALUES (168, 'money', 'el-icon-money', 'icon');
INSERT INTO `sys_dict` VALUES (169, 'coin', 'el-icon-coin', 'icon');
INSERT INTO `sys_dict` VALUES (170, 'wallet', 'el-icon-wallet', 'icon');
INSERT INTO `sys_dict` VALUES (171, 'discount', 'el-icon-discount', 'icon');
INSERT INTO `sys_dict` VALUES (172, 'price-tag', 'el-icon-price-tag', 'icon');
INSERT INTO `sys_dict` VALUES (173, 'news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` VALUES (174, 'guide', 'el-icon-guide', 'icon');
INSERT INTO `sys_dict` VALUES (175, 'male', 'el-icon-male', 'icon');
INSERT INTO `sys_dict` VALUES (176, 'female', 'el-icon-female', 'icon');
INSERT INTO `sys_dict` VALUES (177, 'thumb', 'el-icon-thumb', 'icon');
INSERT INTO `sys_dict` VALUES (178, 'cpu', 'el-icon-cpu', 'icon');
INSERT INTO `sys_dict` VALUES (179, 'link', 'el-icon-link', 'icon');
INSERT INTO `sys_dict` VALUES (180, 'connection', 'el-icon-connection', 'icon');
INSERT INTO `sys_dict` VALUES (181, 'open', 'el-icon-open', 'icon');
INSERT INTO `sys_dict` VALUES (182, 'turn-off', 'el-icon-turn-off', 'icon');
INSERT INTO `sys_dict` VALUES (183, 'set-up', 'el-icon-set-up', 'icon');
INSERT INTO `sys_dict` VALUES (184, 'chat-round', 'el-icon-chat-round', 'icon');
INSERT INTO `sys_dict` VALUES (185, 'chat-line-round', 'el-icon-chat-line-round', 'icon');
INSERT INTO `sys_dict` VALUES (186, 'chat-square', 'el-icon-chat-square', 'icon');
INSERT INTO `sys_dict` VALUES (187, 'chat-dot-round', 'el-icon-chat-dot-round', 'icon');
INSERT INTO `sys_dict` VALUES (188, 'chat-dot-square', 'el-icon-chat-dot-square', 'icon');
INSERT INTO `sys_dict` VALUES (189, 'chat-line-square', 'el-icon-chat-line-square', 'icon');
INSERT INTO `sys_dict` VALUES (190, 'message', 'el-icon-message', 'icon');
INSERT INTO `sys_dict` VALUES (191, 'postcard', 'el-icon-postcard', 'icon');
INSERT INTO `sys_dict` VALUES (192, 'position', 'el-icon-position', 'icon');
INSERT INTO `sys_dict` VALUES (193, 'turn-off-microphone', 'el-icon-turn-off-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (194, 'microphone', 'el-icon-microphone', 'icon');
INSERT INTO `sys_dict` VALUES (195, 'close-notification', 'el-icon-close-notification', 'icon');
INSERT INTO `sys_dict` VALUES (196, 'bangzhu', 'el-icon-bangzhu', 'icon');
INSERT INTO `sys_dict` VALUES (197, 'time', 'el-icon-time', 'icon');
INSERT INTO `sys_dict` VALUES (198, 'odometer', 'el-icon-odometer', 'icon');
INSERT INTO `sys_dict` VALUES (199, 'crop', 'el-icon-crop', 'icon');
INSERT INTO `sys_dict` VALUES (200, 'aim', 'el-icon-aim', 'icon');
INSERT INTO `sys_dict` VALUES (201, 'switch-button', 'el-icon-switch-button', 'icon');
INSERT INTO `sys_dict` VALUES (202, 'full-screen', 'el-icon-full-screen', 'icon');
INSERT INTO `sys_dict` VALUES (203, 'copy-document', 'el-icon-copy-document', 'icon');
INSERT INTO `sys_dict` VALUES (204, 'mic', 'el-icon-mic', 'icon');
INSERT INTO `sys_dict` VALUES (205, 'stopwatch', 'el-icon-stopwatch', 'icon');
INSERT INTO `sys_dict` VALUES (206, 'medal-1', 'el-icon-medal-1', 'icon');
INSERT INTO `sys_dict` VALUES (207, 'medal', 'el-icon-medal', 'icon');
INSERT INTO `sys_dict` VALUES (208, 'trophy', 'el-icon-trophy', 'icon');
INSERT INTO `sys_dict` VALUES (209, 'trophy-1', 'el-icon-trophy-1', 'icon');
INSERT INTO `sys_dict` VALUES (210, 'first-aid-kit', 'el-icon-first-aid-kit', 'icon');
INSERT INTO `sys_dict` VALUES (211, 'discover', 'el-icon-discover', 'icon');
INSERT INTO `sys_dict` VALUES (212, 'place', 'el-icon-place', 'icon');
INSERT INTO `sys_dict` VALUES (213, 'location', 'el-icon-location', 'icon');
INSERT INTO `sys_dict` VALUES (214, 'location-outline', 'el-icon-location-outline', 'icon');
INSERT INTO `sys_dict` VALUES (215, 'location-information', 'el-icon-location-information', 'icon');
INSERT INTO `sys_dict` VALUES (216, 'add-location', 'el-icon-add-location', 'icon');
INSERT INTO `sys_dict` VALUES (217, 'delete-location', 'el-icon-delete-location', 'icon');
INSERT INTO `sys_dict` VALUES (218, 'map-location', 'el-icon-map-location', 'icon');
INSERT INTO `sys_dict` VALUES (219, 'alarm-clock', 'el-icon-alarm-clock', 'icon');
INSERT INTO `sys_dict` VALUES (220, 'timer', 'el-icon-timer', 'icon');
INSERT INTO `sys_dict` VALUES (221, 'watch-1', 'el-icon-watch-1', 'icon');
INSERT INTO `sys_dict` VALUES (222, 'watch', 'el-icon-watch', 'icon');
INSERT INTO `sys_dict` VALUES (223, 'lock', 'el-icon-lock', 'icon');
INSERT INTO `sys_dict` VALUES (224, 'unlock', 'el-icon-unlock', 'icon');
INSERT INTO `sys_dict` VALUES (225, 'key', 'el-icon-key', 'icon');
INSERT INTO `sys_dict` VALUES (226, 'service', 'el-icon-service', 'icon');
INSERT INTO `sys_dict` VALUES (227, 'mobile-phone', 'el-icon-mobile-phone', 'icon');
INSERT INTO `sys_dict` VALUES (228, 'bicycle', 'el-icon-bicycle', 'icon');
INSERT INTO `sys_dict` VALUES (229, 'truck', 'el-icon-truck', 'icon');
INSERT INTO `sys_dict` VALUES (230, 'ship', 'el-icon-ship', 'icon');
INSERT INTO `sys_dict` VALUES (231, 'basketball', 'el-icon-basketball', 'icon');
INSERT INTO `sys_dict` VALUES (232, 'football', 'el-icon-football', 'icon');
INSERT INTO `sys_dict` VALUES (233, 'soccer', 'el-icon-soccer', 'icon');
INSERT INTO `sys_dict` VALUES (234, 'baseball', 'el-icon-baseball', 'icon');
INSERT INTO `sys_dict` VALUES (235, 'wind-power', 'el-icon-wind-power', 'icon');
INSERT INTO `sys_dict` VALUES (236, 'light-rain', 'el-icon-light-rain', 'icon');
INSERT INTO `sys_dict` VALUES (237, 'lightning', 'el-icon-lightning', 'icon');
INSERT INTO `sys_dict` VALUES (238, 'heavy-rain', 'el-icon-heavy-rain', 'icon');
INSERT INTO `sys_dict` VALUES (239, 'sunrise', 'el-icon-sunrise', 'icon');
INSERT INTO `sys_dict` VALUES (240, 'sunrise-1', 'el-icon-sunrise-1', 'icon');
INSERT INTO `sys_dict` VALUES (241, 'sunset', 'el-icon-sunset', 'icon');
INSERT INTO `sys_dict` VALUES (242, 'sunny', 'el-icon-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (243, 'cloudy', 'el-icon-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (244, 'partly-cloudy', 'el-icon-partly-cloudy', 'icon');
INSERT INTO `sys_dict` VALUES (245, 'cloudy-and-sunny', 'el-icon-cloudy-and-sunny', 'icon');
INSERT INTO `sys_dict` VALUES (246, 'moon', 'el-icon-moon', 'icon');
INSERT INTO `sys_dict` VALUES (247, 'moon-night', 'el-icon-moon-night', 'icon');
INSERT INTO `sys_dict` VALUES (248, 'dish', 'el-icon-dish', 'icon');
INSERT INTO `sys_dict` VALUES (249, 'dish-1', 'el-icon-dish-1', 'icon');
INSERT INTO `sys_dict` VALUES (250, 'food', 'el-icon-food', 'icon');
INSERT INTO `sys_dict` VALUES (251, 'chicken', 'el-icon-chicken', 'icon');
INSERT INTO `sys_dict` VALUES (252, 'fork-spoon', 'el-icon-fork-spoon', 'icon');
INSERT INTO `sys_dict` VALUES (253, 'knife-fork', 'el-icon-knife-fork', 'icon');
INSERT INTO `sys_dict` VALUES (254, 'burger', 'el-icon-burger', 'icon');
INSERT INTO `sys_dict` VALUES (255, 'tableware', 'el-icon-tableware', 'icon');
INSERT INTO `sys_dict` VALUES (256, 'sugar', 'el-icon-sugar', 'icon');
INSERT INTO `sys_dict` VALUES (257, 'dessert', 'el-icon-dessert', 'icon');
INSERT INTO `sys_dict` VALUES (258, 'ice-cream', 'el-icon-ice-cream', 'icon');
INSERT INTO `sys_dict` VALUES (259, 'hot-water', 'el-icon-hot-water', 'icon');
INSERT INTO `sys_dict` VALUES (260, 'water-cup', 'el-icon-water-cup', 'icon');
INSERT INTO `sys_dict` VALUES (261, 'coffee-cup', 'el-icon-coffee-cup', 'icon');
INSERT INTO `sys_dict` VALUES (262, 'cold-drink', 'el-icon-cold-drink', 'icon');
INSERT INTO `sys_dict` VALUES (263, 'goblet', 'el-icon-goblet', 'icon');
INSERT INTO `sys_dict` VALUES (264, 'goblet-full', 'el-icon-goblet-full', 'icon');
INSERT INTO `sys_dict` VALUES (265, 'goblet-square', 'el-icon-goblet-square', 'icon');
INSERT INTO `sys_dict` VALUES (266, 'goblet-square-full', 'el-icon-goblet-square-full', 'icon');
INSERT INTO `sys_dict` VALUES (267, 'refrigerator', 'el-icon-refrigerator', 'icon');
INSERT INTO `sys_dict` VALUES (268, 'grape', 'el-icon-grape', 'icon');
INSERT INTO `sys_dict` VALUES (269, 'watermelon', 'el-icon-watermelon', 'icon');
INSERT INTO `sys_dict` VALUES (270, 'cherry', 'el-icon-cherry', 'icon');
INSERT INTO `sys_dict` VALUES (271, 'apple', 'el-icon-apple', 'icon');
INSERT INTO `sys_dict` VALUES (272, 'pear', 'el-icon-pear', 'icon');
INSERT INTO `sys_dict` VALUES (273, 'orange', 'el-icon-orange', 'icon');
INSERT INTO `sys_dict` VALUES (274, 'ice-tea', 'el-icon-ice-tea', 'icon');
INSERT INTO `sys_dict` VALUES (275, 'ice-drink', 'el-icon-ice-drink', 'icon');
INSERT INTO `sys_dict` VALUES (276, 'milk-tea', 'el-icon-milk-tea', 'icon');
INSERT INTO `sys_dict` VALUES (277, 'potato-strips', 'el-icon-potato-strips', 'icon');
INSERT INTO `sys_dict` VALUES (278, 'lollipop', 'el-icon-lollipop', 'icon');
INSERT INTO `sys_dict` VALUES (279, 'ice-cream-square', 'el-icon-ice-cream-square', 'icon');
INSERT INTO `sys_dict` VALUES (280, 'ice-cream-round', 'el-icon-ice-cream-round', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint(0) NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, '微信截图_20220502220127.png', 'png', 1358, 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', '18723476d9fb0879c368e7205d5d1a29', 0, 1);
INSERT INTO `sys_file` VALUES (2, '微信截图_20220502220127.png', 'png', 1358, 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', '18723476d9fb0879c368e7205d5d1a29', 0, 1);
INSERT INTO `sys_file` VALUES (3, '二手交易.png', 'png', 16, 'http://localhost:9090/file/715c49961f664cfeb4053e858aad4f85.png', '8aacca91f5f489e8a5cb907f0452633d', 0, 1);
INSERT INTO `sys_file` VALUES (4, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (5, '二手交易.png', 'png', 16, 'http://localhost:9090/file/715c49961f664cfeb4053e858aad4f85.png', '8aacca91f5f489e8a5cb907f0452633d', 0, 1);
INSERT INTO `sys_file` VALUES (6, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (7, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/8874d86b00a54d20932adfaf112fd04a.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (8, '1622011842830-5.jpg', 'jpg', 14, 'http://localhost:9090/file/8874d86b00a54d20932adfaf112fd04a.jpg', '2dcd5d60c696c47fdfe0b482c18de0ea', 0, 1);
INSERT INTO `sys_file` VALUES (9, '1626102561055-2.jpg', 'jpg', 24, 'http://localhost:9090/file/1a3ebeee403d413e83567ae5cc2c7e2d.jpg', 'adb0481b283645af3809e3d8a1bdb294', 0, 1);
INSERT INTO `sys_file` VALUES (10, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (11, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (12, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (13, '交易.png', 'png', 8, 'http://localhost:9090/file/1409adcbf6fe41aab63314b3cd30c2c4.png', '51a25f4ae10f9ab4e7e45a5780dd49de', 0, 1);
INSERT INTO `sys_file` VALUES (14, '二手交易.png', 'png', 16, 'http://localhost:9090/file/715c49961f664cfeb4053e858aad4f85.png', '8aacca91f5f489e8a5cb907f0452633d', 0, 1);
INSERT INTO `sys_file` VALUES (15, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (16, '钱袋.png', 'png', 15, 'http://localhost:9090/file/3b8a4a34fb5a40298f5f96e1124a113c.png', '42987abed177a46fe643277caf24ddc1', 0, 1);
INSERT INTO `sys_file` VALUES (17, '微信截图_20220502220127.png', 'png', 1358, 'http://localhost:9090/file/9c38d622771648d68631ce07b39d515d.png', '18723476d9fb0879c368e7205d5d1a29', 0, 1);
INSERT INTO `sys_file` VALUES (18, 'VCG41N1418795769.jpg', 'jpg', 158, 'http://localhost:9090/file/ded8709384704e71b72ab309660b97d9.jpg', '16c4e3f9983c7f34a9b26a1fde2fe0b6', 0, 1);
INSERT INTO `sys_file` VALUES (19, 'VCG41N804569984.jpg', 'jpg', 212, 'http://localhost:9090/file/9153167525174f6a8a542caa32af9395.jpg', 'f745ba1d3e45d77dc80b7ab4a02fd679', 0, 1);
INSERT INTO `sys_file` VALUES (20, 'VCG41N1033287206.jpg', 'jpg', 225, 'http://localhost:9090/file/d27cec0d465746bd9452f727db676d3a.jpg', '2227b71aacb5a5fa28313380551390f9', 0, 1);
INSERT INTO `sys_file` VALUES (21, 'VCG41N1418795769.jpg', 'jpg', 158, 'http://localhost:9090/file/ded8709384704e71b72ab309660b97d9.jpg', '16c4e3f9983c7f34a9b26a1fde2fe0b6', 0, 1);
INSERT INTO `sys_file` VALUES (22, 'VCG41N826420374.jpg', 'jpg', 116, 'http://localhost:9090/file/3e716aea3bec4b169f542fbe73cf4ccc.jpg', 'c47759690e26630fe9375924b5f43fcd', 0, 1);
INSERT INTO `sys_file` VALUES (23, 'VCG41N826420374.jpg', 'jpg', 116, 'http://localhost:9090/file/3e716aea3bec4b169f542fbe73cf4ccc.jpg', 'c47759690e26630fe9375924b5f43fcd', 0, 1);
INSERT INTO `sys_file` VALUES (24, 'VCG41N1170856476.jpg', 'jpg', 213, 'http://localhost:9090/file/bd68d29bd386439b9a3c51579948835f.jpg', '554d6a7e4916f8b49efd6b5332364364', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(0) NULL DEFAULT NULL COMMENT '父级id',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `sort_num` int(0) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (4, '系统管理', NULL, 'el-icon-s-grid', NULL, NULL, NULL, 300);
INSERT INTO `sys_menu` VALUES (5, '用户管理', '/user', 'el-icon-user', NULL, 4, 'User', 301);
INSERT INTO `sys_menu` VALUES (6, '角色管理', '/role', 'el-icon-s-custom', NULL, 4, 'Role', 302);
INSERT INTO `sys_menu` VALUES (7, '菜单管理', '/menu', 'el-icon-menu', NULL, 4, 'Menu', 303);
INSERT INTO `sys_menu` VALUES (8, '文件管理', '/file', 'el-icon-document', NULL, 4, 'File', 304);
INSERT INTO `sys_menu` VALUES (10, '主页', '/home', 'el-icon-house', NULL, NULL, 'Home', 0);
INSERT INTO `sys_menu` VALUES (11, '消费分类管理', '/category', 'el-icon-menu', NULL, NULL, 'Category', 999);
INSERT INTO `sys_menu` VALUES (12, '个人消费管理', '/consumption', 'el-icon-menu', NULL, NULL, 'Consumption', 999);
INSERT INTO `sys_menu` VALUES (14, '存钱明细管理', '/planItem', 'el-icon-menu', NULL, NULL, 'PlanItem', 999);
INSERT INTO `sys_menu` VALUES (15, '存钱计划管理', '/plan', 'el-icon-menu', NULL, NULL, 'Plan', 999);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(0) NOT NULL COMMENT '角色id',
  `menu_id` int(0) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 10);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', '管理员', 'admin@qq.com', '13988997788', '安徽合肥', '2022-01-22 21:10:27', 'http://localhost:9090/file/715c49961f664cfeb4053e858aad4f85.png', 'ROLE_ADMIN');
INSERT INTO `sys_user` VALUES (2, 'zhangsan', '123456', '张张', 'zhang@qq.com', '13677889900', '南京', '2022-02-26 22:10:14', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (3, 'wang', '123456', '我是王五', 'wang@qq.com', '13877668855', '上海', '2022-02-26 22:10:18', 'http://localhost:9090/file/1a3ebeee403d413e83567ae5cc2c7e2d.jpg', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (4, 'lisi', '123456', '李四', NULL, NULL, NULL, '2022-05-03 20:04:22', 'http://localhost:9090/file/715c49961f664cfeb4053e858aad4f85.png', 'ROLE_USER');
INSERT INTO `sys_user` VALUES (5, 'zhaoliu', '123456', '赵六', '333333', '188888', '哈哈哈哈', '2024-05-08 16:23:02', NULL, 'ROLE_USER');
INSERT INTO `sys_user` VALUES (6, 'sunqi', '123456', '孙七', NULL, NULL, NULL, '2024-05-08 16:25:25', NULL, 'ROLE_USER');

SET FOREIGN_KEY_CHECKS = 1;
