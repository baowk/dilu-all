/*
 Navicat Premium Data Transfer

 Source Server         : wsl
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36-0ubuntu0.20.04.1)
 Source Host           : 172.25.74.228:3306
 Source Schema         : dilu-db

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36-0ubuntu0.20.04.1)
 File Encoding         : 65001

 Date: 26/05/2024 11:24:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_columns
-- ----------------------------
DROP TABLE IF EXISTS `gen_columns`;
CREATE TABLE `gen_columns`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT,
  `table_id` bigint NULL DEFAULT NULL,
  `column_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `column_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `go_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `go_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `json_field` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_pk` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_increment` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_required` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_insert` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_edit` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_list` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_query` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `query_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `html_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `dict_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sort` bigint NULL DEFAULT NULL,
  `list` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pk` tinyint(1) NULL DEFAULT NULL,
  `required` tinyint(1) NULL DEFAULT NULL,
  `super_column` tinyint(1) NULL DEFAULT NULL,
  `usable_column` tinyint(1) NULL DEFAULT NULL,
  `increment` tinyint(1) NULL DEFAULT NULL,
  `insert` tinyint(1) NULL DEFAULT NULL,
  `edit` tinyint(1) NULL DEFAULT NULL,
  `query` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fk_table_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fk_table_name_class` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fk_table_name_package` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fk_label_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `fk_label_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_by` mediumint NULL DEFAULT NULL,
  `update_By` mediumint NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 722 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_columns
-- ----------------------------
INSERT INTO `gen_columns` VALUES (163, 14, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:05.987', '2023-09-26 13:44:05.987');
INSERT INTO `gen_columns` VALUES (164, 14, 'username', '用户名', 'varchar(32)', 'string', 'Username', 'username', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:05.992', '2023-09-26 13:44:05.992');
INSERT INTO `gen_columns` VALUES (165, 14, 'phone', '手机号', 'varchar(11)', 'string', 'Phone', 'phone', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:05.996', '2023-09-26 13:44:05.996');
INSERT INTO `gen_columns` VALUES (166, 14, 'email', '邮箱', 'varchar(128)', 'string', 'Email', 'email', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:05.999', '2023-09-26 13:44:05.999');
INSERT INTO `gen_columns` VALUES (167, 14, 'password', '密码', 'varchar(128)', 'string', 'Password', 'password', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.002', '2023-09-26 13:44:06.002');
INSERT INTO `gen_columns` VALUES (168, 14, 'nickname', '昵称', 'varchar(128)', 'string', 'Nickname', 'nickname', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.005', '2023-09-26 13:44:06.005');
INSERT INTO `gen_columns` VALUES (169, 14, 'name', '姓名', 'varchar(64)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.008', '2023-09-26 13:44:06.008');
INSERT INTO `gen_columns` VALUES (170, 14, 'avatar', '头像', 'varchar(255)', 'string', 'Avatar', 'avatar', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.011', '2023-09-26 13:44:06.011');
INSERT INTO `gen_columns` VALUES (171, 14, 'bio', '签名', 'varchar(255)', 'string', 'Bio', 'bio', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.015', '2023-09-26 13:44:06.015');
INSERT INTO `gen_columns` VALUES (172, 14, 'birthday', '生日 格式 yyyy-MM-dd', 'date', 'string', 'Birthday', 'birthday', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.018', '2023-09-26 13:44:06.018');
INSERT INTO `gen_columns` VALUES (173, 14, 'gender', '性别 1男 2女 3未知', 'char(1)', 'string', 'Gender', 'gender', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.021', '2023-09-26 13:44:06.021');
INSERT INTO `gen_columns` VALUES (174, 14, 'role_id', '角色ID', 'int unsigned', 'int', 'RoleId', 'roleId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.023', '2023-09-26 13:44:06.023');
INSERT INTO `gen_columns` VALUES (175, 14, 'post', '岗位', 'varchar(32)', 'string', 'Post', 'post', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.027', '2023-09-26 13:44:06.027');
INSERT INTO `gen_columns` VALUES (176, 14, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.031', '2023-09-26 13:44:06.031');
INSERT INTO `gen_columns` VALUES (177, 14, 'status', '状态 1冻结 2正常 3默认', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.034', '2023-09-26 13:44:06.034');
INSERT INTO `gen_columns` VALUES (178, 14, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.037', '2023-09-26 13:44:06.037');
INSERT INTO `gen_columns` VALUES (179, 14, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.039', '2023-09-26 13:44:06.039');
INSERT INTO `gen_columns` VALUES (180, 14, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.042', '2023-09-26 13:44:06.042');
INSERT INTO `gen_columns` VALUES (181, 14, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.045', '2023-09-26 13:44:06.045');
INSERT INTO `gen_columns` VALUES (182, 14, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 20, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:06.049', '2023-09-26 13:44:06.049');
INSERT INTO `gen_columns` VALUES (183, 15, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.539', '2023-09-26 13:44:51.539');
INSERT INTO `gen_columns` VALUES (184, 15, 'menu_name', '菜单名', 'varchar(128)', 'string', 'MenuName', 'menuName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.545', '2023-09-26 13:44:51.545');
INSERT INTO `gen_columns` VALUES (185, 15, 'title', '显示名称', 'varchar(128)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.549', '2023-09-26 13:44:51.549');
INSERT INTO `gen_columns` VALUES (186, 15, 'icon', '图标', 'varchar(128)', 'string', 'Icon', 'icon', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.564', '2023-09-26 13:44:51.564');
INSERT INTO `gen_columns` VALUES (187, 15, 'path', '路径', 'varchar(128)', 'string', 'Path', 'path', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.570', '2023-09-26 13:44:51.570');
INSERT INTO `gen_columns` VALUES (188, 15, 'paths', '路径ids/分割', 'varchar(128)', 'string', 'Paths', 'paths', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.574', '2023-09-26 13:44:51.574');
INSERT INTO `gen_columns` VALUES (189, 15, 'menu_type', '菜单类型 1 分类 2菜单 3方法按钮', 'tinyint', 'int', 'MenuType', 'menuType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.578', '2023-09-26 13:44:51.578');
INSERT INTO `gen_columns` VALUES (190, 15, 'permission', '权限', 'varchar(255)', 'string', 'Permission', 'permission', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.581', '2023-09-26 13:44:51.581');
INSERT INTO `gen_columns` VALUES (191, 15, 'parent_id', '菜单父id', 'int unsigned', 'int', 'ParentId', 'parentId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.583', '2023-09-26 13:44:51.583');
INSERT INTO `gen_columns` VALUES (192, 15, 'no_cache', '是否缓存', 'tinyint(1)', 'int', 'NoCache', 'noCache', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.585', '2023-09-26 13:44:51.585');
INSERT INTO `gen_columns` VALUES (193, 15, 'component', '前端组件路径', 'varchar(255)', 'string', 'Component', 'component', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.588', '2023-09-26 13:44:51.588');
INSERT INTO `gen_columns` VALUES (194, 15, 'sort', '排序倒叙', 'tinyint', 'int', 'Sort', 'sort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.590', '2023-09-26 13:44:51.590');
INSERT INTO `gen_columns` VALUES (195, 15, 'hidden', '是否隐藏', 'tinyint(1)', 'int', 'Hidden', 'hidden', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.595', '2023-09-26 13:44:51.595');
INSERT INTO `gen_columns` VALUES (196, 15, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.598', '2023-09-26 13:44:51.598');
INSERT INTO `gen_columns` VALUES (197, 15, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.600', '2023-09-26 13:44:51.600');
INSERT INTO `gen_columns` VALUES (198, 15, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.603', '2023-09-26 13:44:51.603');
INSERT INTO `gen_columns` VALUES (199, 15, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.605', '2023-09-26 13:44:51.605');
INSERT INTO `gen_columns` VALUES (200, 15, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:44:51.608', '2023-09-26 13:44:51.608');
INSERT INTO `gen_columns` VALUES (201, 16, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.901', '2023-09-26 13:45:11.901');
INSERT INTO `gen_columns` VALUES (202, 16, 'name', '角色名称', 'varchar(128)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.904', '2023-09-26 13:45:11.904');
INSERT INTO `gen_columns` VALUES (203, 16, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.910', '2023-09-26 13:45:11.910');
INSERT INTO `gen_columns` VALUES (204, 16, 'role_key', '角色代码', 'varchar(128)', 'string', 'RoleKey', 'roleKey', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.915', '2023-09-26 13:45:11.915');
INSERT INTO `gen_columns` VALUES (205, 16, 'role_sort', '排序', 'int unsigned', 'int', 'RoleSort', 'roleSort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.926', '2023-09-26 13:45:11.926');
INSERT INTO `gen_columns` VALUES (206, 16, 'flag', 'flag', 'varchar(128)', 'string', 'Flag', 'flag', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.932', '2023-09-26 13:45:11.932');
INSERT INTO `gen_columns` VALUES (207, 16, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.936', '2023-09-26 13:45:11.936');
INSERT INTO `gen_columns` VALUES (208, 16, 'admin', '管理员', 'tinyint(1)', 'int', 'Admin', 'admin', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.938', '2023-09-26 13:45:11.938');
INSERT INTO `gen_columns` VALUES (209, 16, 'data_scope', '数据权限', 'varchar(128)', 'string', 'DataScope', 'dataScope', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.942', '2023-09-26 13:45:11.942');
INSERT INTO `gen_columns` VALUES (210, 16, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.946', '2023-09-26 13:45:11.946');
INSERT INTO `gen_columns` VALUES (211, 16, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.949', '2023-09-26 13:45:11.949');
INSERT INTO `gen_columns` VALUES (212, 16, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.951', '2023-09-26 13:45:11.951');
INSERT INTO `gen_columns` VALUES (213, 16, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.953', '2023-09-26 13:45:11.953');
INSERT INTO `gen_columns` VALUES (214, 16, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-26 13:45:11.955', '2023-09-26 13:45:11.955');
INSERT INTO `gen_columns` VALUES (255, 20, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.365', '2023-09-29 08:33:06.365');
INSERT INTO `gen_columns` VALUES (256, 20, 'name', '团队名', 'varchar(32)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.373', '2023-09-29 08:33:06.373');
INSERT INTO `gen_columns` VALUES (257, 20, 'owner', '团队拥有者', 'int unsigned', 'int', 'Owner', 'owner', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.377', '2023-09-29 08:33:06.377');
INSERT INTO `gen_columns` VALUES (258, 20, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.382', '2023-09-29 08:33:06.382');
INSERT INTO `gen_columns` VALUES (259, 20, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.386', '2023-09-29 08:33:06.386');
INSERT INTO `gen_columns` VALUES (260, 20, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:06.389', '2023-09-29 08:33:06.389');
INSERT INTO `gen_columns` VALUES (261, 21, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.155', '2023-09-29 08:33:20.155');
INSERT INTO `gen_columns` VALUES (262, 21, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.182', '2023-09-29 08:33:20.182');
INSERT INTO `gen_columns` VALUES (263, 21, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.187', '2023-09-29 08:33:20.187');
INSERT INTO `gen_columns` VALUES (264, 21, 'nickname', '昵称', 'varchar(128)', 'string', 'Nickname', 'nickname', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.191', '2023-09-29 08:33:20.191');
INSERT INTO `gen_columns` VALUES (265, 21, 'name', '姓名', 'varchar(64)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.194', '2023-09-29 08:33:20.194');
INSERT INTO `gen_columns` VALUES (266, 21, 'phone', '电话', 'varchar(11)', 'string', 'Phone', 'phone', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.197', '2023-09-29 08:33:20.197');
INSERT INTO `gen_columns` VALUES (267, 21, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.201', '2023-09-29 08:33:20.201');
INSERT INTO `gen_columns` VALUES (268, 21, 'dept_id', '部门id', 'int unsigned', 'int', 'DeptId', 'deptId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.204', '2023-09-29 08:33:20.204');
INSERT INTO `gen_columns` VALUES (269, 21, 'post_tag', '职位标签 1主管 2副主管 3员工', 'tinyint unsigned', 'int', 'PostTag', 'postTag', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.208', '2023-09-29 08:33:20.208');
INSERT INTO `gen_columns` VALUES (270, 21, 'status', '状态 1正常 ', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.211', '2023-09-29 08:33:20.211');
INSERT INTO `gen_columns` VALUES (271, 21, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.215', '2023-09-29 08:33:20.215');
INSERT INTO `gen_columns` VALUES (272, 21, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.218', '2023-09-29 08:33:20.218');
INSERT INTO `gen_columns` VALUES (273, 21, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.221', '2023-09-29 08:33:20.221');
INSERT INTO `gen_columns` VALUES (274, 21, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.225', '2023-09-29 08:33:20.225');
INSERT INTO `gen_columns` VALUES (275, 21, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-29 08:33:20.229', '2023-09-29 08:33:20.229');
INSERT INTO `gen_columns` VALUES (276, 22, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.877', '2023-09-30 14:05:14.877');
INSERT INTO `gen_columns` VALUES (277, 22, 'no', '订单号', 'varchar(20)', 'string', 'No', 'no', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.887', '2023-09-30 14:05:14.887');
INSERT INTO `gen_columns` VALUES (278, 22, 'customer_id', '顾客', 'int unsigned', 'int', 'CustomerId', 'customerId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.892', '2023-09-30 14:05:14.892');
INSERT INTO `gen_columns` VALUES (279, 22, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.898', '2023-09-30 14:05:14.898');
INSERT INTO `gen_columns` VALUES (280, 22, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.902', '2023-09-30 14:05:14.902');
INSERT INTO `gen_columns` VALUES (281, 22, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.906', '2023-09-30 14:05:14.906');
INSERT INTO `gen_columns` VALUES (282, 22, 'total', '金额', 'decimal(10,2)', 'string', 'Total', 'total', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.910', '2023-09-30 14:05:14.910');
INSERT INTO `gen_columns` VALUES (283, 22, 'real_total', '折后金额', 'decimal(10,2)', 'string', 'RealTotal', 'realTotal', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.913', '2023-09-30 14:05:14.913');
INSERT INTO `gen_columns` VALUES (284, 22, 'paid_total', '已支付金额', 'decimal(10,2)', 'string', 'PaidTotal', 'paidTotal', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.917', '2023-09-30 14:05:14.917');
INSERT INTO `gen_columns` VALUES (285, 22, 'link_id', '关联订单', 'int unsigned', 'int', 'LinkId', 'linkId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.921', '2023-09-30 14:05:14.921');
INSERT INTO `gen_columns` VALUES (286, 22, 'trade_at', '交易日期', 'datetime', 'time.Time', 'TradeAt', 'tradeAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.924', '2023-09-30 14:05:14.924');
INSERT INTO `gen_columns` VALUES (287, 22, 'trade_status', '交易类型1 成交 2补尾款  3补上月欠款 10退款', 'tinyint', 'int', 'TradeStatus', 'tradeStatus', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.927', '2023-09-30 14:05:14.927');
INSERT INTO `gen_columns` VALUES (288, 22, 'dental_count', '颗数', 'tinyint', 'int', 'DentalCount', 'dentalCount', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.931', '2023-09-30 14:05:14.931');
INSERT INTO `gen_columns` VALUES (289, 22, 'brand', '品牌', 'tinyint', 'int', 'Brand', 'brand', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.934', '2023-09-30 14:05:14.934');
INSERT INTO `gen_columns` VALUES (290, 22, 'implanted_count', '已种颗数', 'tinyint', 'int', 'ImplantedCount', 'implantedCount', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.939', '2023-09-30 14:05:14.939');
INSERT INTO `gen_columns` VALUES (291, 22, 'implant', '是否已种', 'tinyint', 'int', 'Implant', 'implant', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.944', '2023-09-30 14:05:14.944');
INSERT INTO `gen_columns` VALUES (292, 22, 'implant_date', '植入日期', 'datetime', 'time.Time', 'ImplantDate', 'implantDate', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.947', '2023-09-30 14:05:14.947');
INSERT INTO `gen_columns` VALUES (293, 22, 'doctor', '医生', 'varchar(32)', 'string', 'Doctor', 'doctor', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.950', '2023-09-30 14:05:14.950');
INSERT INTO `gen_columns` VALUES (294, 22, 'pack', '1 普通 2 半口 3 全口', 'tinyint', 'int', 'Pack', 'pack', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.955', '2023-09-30 14:05:14.955');
INSERT INTO `gen_columns` VALUES (295, 22, 'payback_date', '预定回款日期', 'datetime', 'time.Time', 'PaybackDate', 'paybackDate', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 20, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.958', '2023-09-30 14:05:14.958');
INSERT INTO `gen_columns` VALUES (296, 22, 'tags', '标签', 'varchar(255)', 'string', 'Tags', 'tags', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 21, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.961', '2023-09-30 14:05:14.961');
INSERT INTO `gen_columns` VALUES (297, 22, 'prj_name', '项目', 'varchar(255)', 'string', 'PrjName', 'prjName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 22, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.965', '2023-09-30 14:05:14.965');
INSERT INTO `gen_columns` VALUES (298, 22, 'other_prj', '其他项目', 'varchar(255)', 'string', 'OtherPrj', 'otherPrj', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 23, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.969', '2023-09-30 14:05:14.969');
INSERT INTO `gen_columns` VALUES (299, 22, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 24, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.972', '2023-09-30 14:05:14.972');
INSERT INTO `gen_columns` VALUES (300, 22, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 25, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.977', '2023-09-30 14:05:14.977');
INSERT INTO `gen_columns` VALUES (301, 22, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 26, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:14.980', '2023-09-30 14:05:14.980');
INSERT INTO `gen_columns` VALUES (302, 23, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.624', '2023-09-30 14:05:22.624');
INSERT INTO `gen_columns` VALUES (303, 23, 'name', '姓名', 'varchar(32)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.631', '2023-09-30 14:05:22.631');
INSERT INTO `gen_columns` VALUES (304, 23, 'phone', '手机号', 'varchar(11)', 'string', 'Phone', 'phone', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.635', '2023-09-30 14:05:22.635');
INSERT INTO `gen_columns` VALUES (305, 23, 'wechat', '微信号', 'varchar(64)', 'string', 'Wechat', 'wechat', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.640', '2023-09-30 14:05:22.640');
INSERT INTO `gen_columns` VALUES (306, 23, 'gender', '性别', 'tinyint', 'int', 'Gender', 'gender', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.644', '2023-09-30 14:05:22.644');
INSERT INTO `gen_columns` VALUES (307, 23, 'age', '年龄', 'tinyint unsigned', 'int', 'Age', 'age', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.647', '2023-09-30 14:05:22.647');
INSERT INTO `gen_columns` VALUES (308, 23, 'birthday', '生日', 'bigint', 'int', 'Birthday', 'birthday', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.650', '2023-09-30 14:05:22.650');
INSERT INTO `gen_columns` VALUES (309, 23, 'source', '来源', 'varchar(64)', 'string', 'Source', 'source', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.654', '2023-09-30 14:05:22.654');
INSERT INTO `gen_columns` VALUES (310, 23, 'address', '地址', 'varchar(255)', 'string', 'Address', 'address', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.657', '2023-09-30 14:05:22.657');
INSERT INTO `gen_columns` VALUES (311, 23, 'remark', '描述', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.660', '2023-09-30 14:05:22.660');
INSERT INTO `gen_columns` VALUES (312, 23, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.663', '2023-09-30 14:05:22.663');
INSERT INTO `gen_columns` VALUES (313, 23, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.667', '2023-09-30 14:05:22.667');
INSERT INTO `gen_columns` VALUES (314, 23, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.670', '2023-09-30 14:05:22.670');
INSERT INTO `gen_columns` VALUES (315, 23, 'inviter', '邀请人', 'int unsigned', 'int', 'Inviter', 'inviter', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.674', '2023-09-30 14:05:22.674');
INSERT INTO `gen_columns` VALUES (316, 23, 'inviter_name', '邀请人名', 'varchar(32)', 'string', 'InviterName', 'inviterName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.677', '2023-09-30 14:05:22.677');
INSERT INTO `gen_columns` VALUES (317, 23, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.680', '2023-09-30 14:05:22.680');
INSERT INTO `gen_columns` VALUES (318, 23, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:22.683', '2023-09-30 14:05:22.683');
INSERT INTO `gen_columns` VALUES (332, 25, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.224', '2023-09-30 14:05:37.224');
INSERT INTO `gen_columns` VALUES (333, 25, 'day', '天', 'int unsigned', 'int', 'Day', 'day', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.250', '2023-09-30 14:05:37.250');
INSERT INTO `gen_columns` VALUES (334, 25, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.257', '2023-09-30 14:05:37.257');
INSERT INTO `gen_columns` VALUES (335, 25, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.261', '2023-09-30 14:05:37.261');
INSERT INTO `gen_columns` VALUES (336, 25, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.265', '2023-09-30 14:05:37.265');
INSERT INTO `gen_columns` VALUES (337, 25, 'summary', '今日总结', 'text', 'string', 'Summary', 'summary', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.269', '2023-09-30 14:05:37.269');
INSERT INTO `gen_columns` VALUES (338, 25, 'plan', '明日计划', 'text', 'string', 'Plan', 'plan', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.272', '2023-09-30 14:05:37.272');
INSERT INTO `gen_columns` VALUES (339, 25, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.276', '2023-09-30 14:05:37.276');
INSERT INTO `gen_columns` VALUES (340, 25, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-09-30 14:05:37.279', '2023-09-30 14:05:37.279');
INSERT INTO `gen_columns` VALUES (349, 27, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.384', '2023-10-03 16:12:23.384');
INSERT INTO `gen_columns` VALUES (350, 27, 'parent_id', '父id', 'int unsigned', 'int', 'ParentId', 'parentId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.390', '2023-10-03 16:12:23.390');
INSERT INTO `gen_columns` VALUES (351, 27, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.399', '2023-10-03 16:12:23.399');
INSERT INTO `gen_columns` VALUES (352, 27, 'name', '部门名', 'varchar(128)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.403', '2023-10-03 16:12:23.403');
INSERT INTO `gen_columns` VALUES (353, 27, 'type', '类型', 'tinyint', 'int', 'Type', 'type', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.407', '2023-10-03 16:12:23.407');
INSERT INTO `gen_columns` VALUES (354, 27, 'principal', '部门领导', 'varchar(128)', 'string', 'Principal', 'principal', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.411', '2023-10-03 16:12:23.411');
INSERT INTO `gen_columns` VALUES (355, 27, 'phone', '手机号', 'varchar(11)', 'string', 'Phone', 'phone', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.414', '2023-10-03 16:12:23.414');
INSERT INTO `gen_columns` VALUES (356, 27, 'email', '邮箱', 'varchar(128)', 'string', 'Email', 'email', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.418', '2023-10-03 16:12:23.418');
INSERT INTO `gen_columns` VALUES (357, 27, 'sort', '排序', 'tinyint', 'int', 'Sort', 'sort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.422', '2023-10-03 16:12:23.422');
INSERT INTO `gen_columns` VALUES (358, 27, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.425', '2023-10-03 16:12:23.425');
INSERT INTO `gen_columns` VALUES (359, 27, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.429', '2023-10-03 16:12:23.429');
INSERT INTO `gen_columns` VALUES (360, 27, 'team_id', '团队id', 'int', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.433', '2023-10-03 16:12:23.433');
INSERT INTO `gen_columns` VALUES (361, 27, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.436', '2023-10-03 16:12:23.436');
INSERT INTO `gen_columns` VALUES (362, 27, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.440', '2023-10-03 16:12:23.440');
INSERT INTO `gen_columns` VALUES (363, 27, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.443', '2023-10-03 16:12:23.443');
INSERT INTO `gen_columns` VALUES (364, 27, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.448', '2023-10-03 16:12:23.448');
INSERT INTO `gen_columns` VALUES (365, 27, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 16:12:23.452', '2023-10-03 16:12:23.452');
INSERT INTO `gen_columns` VALUES (366, 28, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.076', '2023-10-03 17:15:17.076');
INSERT INTO `gen_columns` VALUES (367, 28, 'day_type', '时间类型:月 30,周 7', 'tinyint unsigned', 'int', 'DayType', 'dayType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.083', '2023-10-03 17:15:17.083');
INSERT INTO `gen_columns` VALUES (368, 28, 'day', '时间:202310', 'int unsigned', 'int', 'Day', 'day', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.088', '2023-10-03 17:15:17.088');
INSERT INTO `gen_columns` VALUES (369, 28, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.092', '2023-10-03 17:15:17.092');
INSERT INTO `gen_columns` VALUES (370, 28, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.097', '2023-10-03 17:15:17.097');
INSERT INTO `gen_columns` VALUES (371, 28, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.100', '2023-10-03 17:15:17.100');
INSERT INTO `gen_columns` VALUES (372, 28, 'new_customer_cnt', '留存任务', 'int unsigned', 'int', 'NewCustomerCnt', 'newCustomerCnt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.104', '2023-10-03 17:15:17.104');
INSERT INTO `gen_columns` VALUES (373, 28, 'first_diagnosis', '导诊任务', 'int unsigned', 'int', 'FirstDiagnosis', 'firstDiagnosis', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.108', '2023-10-03 17:15:17.108');
INSERT INTO `gen_columns` VALUES (374, 28, 'deal', '成交任务', 'int unsigned', 'int', 'Deal', 'deal', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.112', '2023-10-03 17:15:17.112');
INSERT INTO `gen_columns` VALUES (375, 28, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.117', '2023-10-03 17:15:17.117');
INSERT INTO `gen_columns` VALUES (376, 28, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.120', '2023-10-03 17:15:17.120');
INSERT INTO `gen_columns` VALUES (377, 28, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.124', '2023-10-03 17:15:17.124');
INSERT INTO `gen_columns` VALUES (378, 28, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-03 17:15:17.128', '2023-10-03 17:15:17.128');
INSERT INTO `gen_columns` VALUES (379, 29, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.670', '2023-10-06 20:17:08.670');
INSERT INTO `gen_columns` VALUES (380, 29, 'day', '时间', 'int unsigned', 'int', 'Day', 'day', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.676', '2023-10-06 20:17:08.676');
INSERT INTO `gen_columns` VALUES (381, 29, 'team_id', '团队id', 'int unsigned', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.681', '2023-10-06 20:17:08.681');
INSERT INTO `gen_columns` VALUES (382, 29, 'user_id', '用户id', 'int unsigned', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.685', '2023-10-06 20:17:08.685');
INSERT INTO `gen_columns` VALUES (383, 29, 'dept_path', '部门路径', 'varchar(255)', 'string', 'DeptPath', 'deptPath', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.689', '2023-10-06 20:17:08.689');
INSERT INTO `gen_columns` VALUES (384, 29, 'new_customer_cnt', '留存', 'int unsigned', 'int', 'NewCustomerCnt', 'newCustomerCnt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.693', '2023-10-06 20:17:08.693');
INSERT INTO `gen_columns` VALUES (385, 29, 'first_diagnosis', '初诊', 'int unsigned', 'int', 'FirstDiagnosis', 'firstDiagnosis', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.697', '2023-10-06 20:17:08.697');
INSERT INTO `gen_columns` VALUES (386, 29, 'further_diagnosis', '复诊', 'int unsigned', 'int', 'FurtherDiagnosis', 'furtherDiagnosis', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.700', '2023-10-06 20:17:08.700');
INSERT INTO `gen_columns` VALUES (387, 29, 'deal', '成交', 'int unsigned', 'int', 'Deal', 'deal', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.705', '2023-10-06 20:17:08.705');
INSERT INTO `gen_columns` VALUES (388, 29, 'invitation', '明日邀约', 'int unsigned', 'int', 'Invitation', 'invitation', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.708', '2023-10-06 20:17:08.708');
INSERT INTO `gen_columns` VALUES (389, 29, 'rest', '休息', 'tinyint', 'int', 'Rest', 'rest', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.711', '2023-10-06 20:17:08.711');
INSERT INTO `gen_columns` VALUES (390, 29, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.716', '2023-10-06 20:17:08.716');
INSERT INTO `gen_columns` VALUES (391, 29, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.720', '2023-10-06 20:17:08.720');
INSERT INTO `gen_columns` VALUES (392, 29, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.724', '2023-10-06 20:17:08.724');
INSERT INTO `gen_columns` VALUES (393, 29, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-06 20:17:08.728', '2023-10-06 20:17:08.728');
INSERT INTO `gen_columns` VALUES (394, 30, 'table_id', '', 'bigint', 'int', 'TableId', 'tableId', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.943', '2023-10-28 16:27:31.943');
INSERT INTO `gen_columns` VALUES (395, 30, 'db_name', '', 'varchar(64)', 'string', 'DbName', 'dbName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.947', '2023-10-28 16:27:31.947');
INSERT INTO `gen_columns` VALUES (396, 30, 'table_name', '', 'varchar(128)', 'string', 'TableName', 'tableName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.951', '2023-10-28 16:27:31.951');
INSERT INTO `gen_columns` VALUES (397, 30, 'table_comment', '', 'varchar(128)', 'string', 'TableComment', 'tableComment', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.955', '2023-10-28 16:27:31.955');
INSERT INTO `gen_columns` VALUES (398, 30, 'class_name', '', 'varchar(128)', 'string', 'ClassName', 'className', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.958', '2023-10-28 16:27:31.958');
INSERT INTO `gen_columns` VALUES (399, 30, 'tpl_category', '', 'varchar(128)', 'string', 'TplCategory', 'tplCategory', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.962', '2023-10-28 16:27:31.962');
INSERT INTO `gen_columns` VALUES (400, 30, 'package_name', '', 'varchar(128)', 'string', 'PackageName', 'packageName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.965', '2023-10-28 16:27:31.965');
INSERT INTO `gen_columns` VALUES (401, 30, 'module_name', '', 'varchar(128)', 'string', 'ModuleName', 'moduleName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.969', '2023-10-28 16:27:31.969');
INSERT INTO `gen_columns` VALUES (402, 30, 'module_front_name', '前端文件名', 'varchar(255)', 'string', 'ModuleFrontName', 'moduleFrontName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.971', '2023-10-28 16:27:31.971');
INSERT INTO `gen_columns` VALUES (403, 30, 'business_name', '', 'varchar(255)', 'string', 'BusinessName', 'businessName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.974', '2023-10-28 16:27:31.974');
INSERT INTO `gen_columns` VALUES (404, 30, 'function_name', '', 'varchar(255)', 'string', 'FunctionName', 'functionName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.977', '2023-10-28 16:27:31.977');
INSERT INTO `gen_columns` VALUES (405, 30, 'function_author', '', 'varchar(255)', 'string', 'FunctionAuthor', 'functionAuthor', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.981', '2023-10-28 16:27:31.981');
INSERT INTO `gen_columns` VALUES (406, 30, 'pk_column', '', 'varchar(255)', 'string', 'PkColumn', 'pkColumn', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.985', '2023-10-28 16:27:31.985');
INSERT INTO `gen_columns` VALUES (407, 30, 'pk_go_field', '', 'varchar(255)', 'string', 'PkGoField', 'pkGoField', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.988', '2023-10-28 16:27:31.988');
INSERT INTO `gen_columns` VALUES (408, 30, 'pk_json_field', '', 'varchar(255)', 'string', 'PkJsonField', 'pkJsonField', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.990', '2023-10-28 16:27:31.990');
INSERT INTO `gen_columns` VALUES (409, 30, 'options', '', 'varchar(255)', 'string', 'Options', 'options', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.994', '2023-10-28 16:27:31.994');
INSERT INTO `gen_columns` VALUES (410, 30, 'tree_code', '', 'varchar(255)', 'string', 'TreeCode', 'treeCode', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:31.997', '2023-10-28 16:27:31.997');
INSERT INTO `gen_columns` VALUES (411, 30, 'tree_parent_code', '', 'varchar(255)', 'string', 'TreeParentCode', 'treeParentCode', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.000', '2023-10-28 16:27:32.000');
INSERT INTO `gen_columns` VALUES (412, 30, 'tree_name', '', 'varchar(255)', 'string', 'TreeName', 'treeName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.003', '2023-10-28 16:27:32.003');
INSERT INTO `gen_columns` VALUES (413, 30, 'tree', '', 'tinyint(1)', 'int', 'Tree', 'tree', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 20, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.005', '2023-10-28 16:27:32.005');
INSERT INTO `gen_columns` VALUES (414, 30, 'crud', '', 'tinyint(1)', 'int', 'Crud', 'crud', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 21, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.008', '2023-10-28 16:27:32.008');
INSERT INTO `gen_columns` VALUES (415, 30, 'remark', '', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 22, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.012', '2023-10-28 16:27:32.012');
INSERT INTO `gen_columns` VALUES (416, 30, 'is_data_scope', '', 'tinyint', 'int', 'IsDataScope', 'isDataScope', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 23, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.015', '2023-10-28 16:27:32.015');
INSERT INTO `gen_columns` VALUES (417, 30, 'is_actions', '', 'tinyint', 'int', 'IsActions', 'isActions', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 24, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.018', '2023-10-28 16:27:32.018');
INSERT INTO `gen_columns` VALUES (418, 30, 'is_auth', '', 'tinyint', 'int', 'IsAuth', 'isAuth', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 25, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.021', '2023-10-28 16:27:32.021');
INSERT INTO `gen_columns` VALUES (419, 30, 'is_logical_delete', '', 'varchar(1)', 'string', 'IsLogicalDelete', 'isLogicalDelete', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 26, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.024', '2023-10-28 16:27:32.024');
INSERT INTO `gen_columns` VALUES (420, 30, 'logical_delete', '', 'tinyint(1)', 'int', 'LogicalDelete', 'logicalDelete', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 27, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.027', '2023-10-28 16:27:32.027');
INSERT INTO `gen_columns` VALUES (421, 30, 'logical_delete_column', '', 'varchar(128)', 'string', 'LogicalDeleteColumn', 'logicalDeleteColumn', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 28, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.031', '2023-10-28 16:27:32.031');
INSERT INTO `gen_columns` VALUES (422, 30, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 29, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.034', '2023-10-28 16:27:32.034');
INSERT INTO `gen_columns` VALUES (423, 30, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 30, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.036', '2023-10-28 16:27:32.036');
INSERT INTO `gen_columns` VALUES (424, 30, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 31, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.039', '2023-10-28 16:27:32.039');
INSERT INTO `gen_columns` VALUES (425, 30, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 32, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.042', '2023-10-28 16:27:32.042');
INSERT INTO `gen_columns` VALUES (426, 30, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 33, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:27:32.045', '2023-10-28 16:27:32.045');
INSERT INTO `gen_columns` VALUES (427, 31, 'column_id', '', 'bigint', 'int', 'ColumnId', 'columnId', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.931', '2023-10-28 16:28:02.931');
INSERT INTO `gen_columns` VALUES (428, 31, 'table_id', '', 'bigint', 'int', 'TableId', 'tableId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.935', '2023-10-28 16:28:02.935');
INSERT INTO `gen_columns` VALUES (429, 31, 'column_name', '', 'varchar(128)', 'string', 'ColumnName', 'columnName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.938', '2023-10-28 16:28:02.938');
INSERT INTO `gen_columns` VALUES (430, 31, 'column_comment', '', 'varchar(128)', 'string', 'ColumnComment', 'columnComment', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.941', '2023-10-28 16:28:02.941');
INSERT INTO `gen_columns` VALUES (431, 31, 'column_type', '', 'varchar(128)', 'string', 'ColumnType', 'columnType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.946', '2023-10-28 16:28:02.946');
INSERT INTO `gen_columns` VALUES (432, 31, 'go_type', '', 'varchar(128)', 'string', 'GoType', 'goType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.949', '2023-10-28 16:28:02.949');
INSERT INTO `gen_columns` VALUES (433, 31, 'go_field', '', 'varchar(128)', 'string', 'GoField', 'goField', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.952', '2023-10-28 16:28:02.952');
INSERT INTO `gen_columns` VALUES (434, 31, 'json_field', '', 'varchar(128)', 'string', 'JsonField', 'jsonField', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.954', '2023-10-28 16:28:02.954');
INSERT INTO `gen_columns` VALUES (435, 31, 'is_pk', '', 'varchar(4)', 'string', 'IsPk', 'isPk', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.957', '2023-10-28 16:28:02.957');
INSERT INTO `gen_columns` VALUES (436, 31, 'is_increment', '', 'varchar(4)', 'string', 'IsIncrement', 'isIncrement', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.961', '2023-10-28 16:28:02.961');
INSERT INTO `gen_columns` VALUES (437, 31, 'is_required', '', 'varchar(4)', 'string', 'IsRequired', 'isRequired', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.964', '2023-10-28 16:28:02.964');
INSERT INTO `gen_columns` VALUES (438, 31, 'is_insert', '', 'varchar(4)', 'string', 'IsInsert', 'isInsert', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.967', '2023-10-28 16:28:02.967');
INSERT INTO `gen_columns` VALUES (439, 31, 'is_edit', '', 'varchar(4)', 'string', 'IsEdit', 'isEdit', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.969', '2023-10-28 16:28:02.969');
INSERT INTO `gen_columns` VALUES (440, 31, 'is_list', '', 'varchar(4)', 'string', 'IsList', 'isList', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.972', '2023-10-28 16:28:02.972');
INSERT INTO `gen_columns` VALUES (441, 31, 'is_query', '', 'varchar(4)', 'string', 'IsQuery', 'isQuery', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.975', '2023-10-28 16:28:02.975');
INSERT INTO `gen_columns` VALUES (442, 31, 'query_type', '', 'varchar(128)', 'string', 'QueryType', 'queryType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.978', '2023-10-28 16:28:02.978');
INSERT INTO `gen_columns` VALUES (443, 31, 'html_type', '', 'varchar(128)', 'string', 'HtmlType', 'htmlType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.981', '2023-10-28 16:28:02.981');
INSERT INTO `gen_columns` VALUES (444, 31, 'dict_type', '', 'varchar(128)', 'string', 'DictType', 'dictType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.985', '2023-10-28 16:28:02.985');
INSERT INTO `gen_columns` VALUES (445, 31, 'sort', '', 'bigint', 'int', 'Sort', 'sort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.987', '2023-10-28 16:28:02.987');
INSERT INTO `gen_columns` VALUES (446, 31, 'list', '', 'varchar(1)', 'string', 'List', 'list', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 20, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.990', '2023-10-28 16:28:02.990');
INSERT INTO `gen_columns` VALUES (447, 31, 'pk', '', 'tinyint(1)', 'int', 'Pk', 'pk', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 21, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.993', '2023-10-28 16:28:02.993');
INSERT INTO `gen_columns` VALUES (448, 31, 'required', '', 'tinyint(1)', 'int', 'Required', 'required', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 22, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.996', '2023-10-28 16:28:02.996');
INSERT INTO `gen_columns` VALUES (449, 31, 'super_column', '', 'tinyint(1)', 'int', 'SuperColumn', 'superColumn', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 23, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:02.999', '2023-10-28 16:28:02.999');
INSERT INTO `gen_columns` VALUES (450, 31, 'usable_column', '', 'tinyint(1)', 'int', 'UsableColumn', 'usableColumn', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 24, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.002', '2023-10-28 16:28:03.002');
INSERT INTO `gen_columns` VALUES (451, 31, 'increment', '', 'tinyint(1)', 'int', 'Increment', 'increment', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 25, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.004', '2023-10-28 16:28:03.004');
INSERT INTO `gen_columns` VALUES (452, 31, 'insert', '', 'tinyint(1)', 'int', 'Insert', 'insert', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 26, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.007', '2023-10-28 16:28:03.007');
INSERT INTO `gen_columns` VALUES (453, 31, 'edit', '', 'tinyint(1)', 'int', 'Edit', 'edit', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 27, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.011', '2023-10-28 16:28:03.011');
INSERT INTO `gen_columns` VALUES (454, 31, 'query', '', 'tinyint(1)', 'int', 'Query', 'query', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 28, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.014', '2023-10-28 16:28:03.014');
INSERT INTO `gen_columns` VALUES (455, 31, 'remark', '', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 29, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.017', '2023-10-28 16:28:03.017');
INSERT INTO `gen_columns` VALUES (456, 31, 'fk_table_name', '', 'longtext', 'string', 'FkTableName', 'fkTableName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 30, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.019', '2023-10-28 16:28:03.019');
INSERT INTO `gen_columns` VALUES (457, 31, 'fk_table_name_class', '', 'longtext', 'string', 'FkTableNameClass', 'fkTableNameClass', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 31, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.022', '2023-10-28 16:28:03.022');
INSERT INTO `gen_columns` VALUES (458, 31, 'fk_table_name_package', '', 'longtext', 'string', 'FkTableNamePackage', 'fkTableNamePackage', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 32, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.026', '2023-10-28 16:28:03.026');
INSERT INTO `gen_columns` VALUES (459, 31, 'fk_label_id', '', 'longtext', 'string', 'FkLabelId', 'fkLabelId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 33, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.029', '2023-10-28 16:28:03.029');
INSERT INTO `gen_columns` VALUES (460, 31, 'fk_label_name', '', 'varchar(255)', 'string', 'FkLabelName', 'fkLabelName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 34, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.032', '2023-10-28 16:28:03.032');
INSERT INTO `gen_columns` VALUES (461, 31, 'create_by', '', 'mediumint', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 35, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.035', '2023-10-28 16:28:03.035');
INSERT INTO `gen_columns` VALUES (462, 31, 'update_By', '', 'mediumint', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 36, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.037', '2023-10-28 16:28:03.037');
INSERT INTO `gen_columns` VALUES (463, 31, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 37, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.040', '2023-10-28 16:28:03.040');
INSERT INTO `gen_columns` VALUES (464, 31, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 38, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.044', '2023-10-28 16:28:03.044');
INSERT INTO `gen_columns` VALUES (465, 31, 'deleted_at', '删除时间', 'datetime(3)', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 39, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:28:03.047', '2023-10-28 16:28:03.047');
INSERT INTO `gen_columns` VALUES (466, 32, 'id', '主键编码', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.750', '2023-10-28 16:51:28.750');
INSERT INTO `gen_columns` VALUES (467, 32, 'title', '标题', 'varchar(128)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.754', '2023-10-28 16:51:28.754');
INSERT INTO `gen_columns` VALUES (468, 32, 'method', '请求类型', 'varchar(16)', 'string', 'Method', 'method', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.756', '2023-10-28 16:51:28.756');
INSERT INTO `gen_columns` VALUES (469, 32, 'path', '请求地址', 'varchar(128)', 'string', 'Path', 'path', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.758', '2023-10-28 16:51:28.758');
INSERT INTO `gen_columns` VALUES (470, 32, 'perm_type', '权限类型（1：无需认证 2:须token 3：须鉴权）', 'bigint', 'int', 'PermType', 'permType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.761', '2023-10-28 16:51:28.761');
INSERT INTO `gen_columns` VALUES (471, 32, 'status', '状态 3 DEF 2 OK 1 del', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.765', '2023-10-28 16:51:28.765');
INSERT INTO `gen_columns` VALUES (472, 32, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.768', '2023-10-28 16:51:28.768');
INSERT INTO `gen_columns` VALUES (473, 32, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-10-28 16:51:28.770', '2023-10-28 16:51:28.770');
INSERT INTO `gen_columns` VALUES (482, 35, 'id', '主键编码', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.234', '2023-11-05 20:31:12.234');
INSERT INTO `gen_columns` VALUES (483, 35, 'email', '邮箱地址', 'varchar(255)', 'string', 'Email', 'email', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.239', '2023-11-05 20:31:12.239');
INSERT INTO `gen_columns` VALUES (484, 35, 'code', '验证码', 'varchar(6)', 'string', 'Code', 'code', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.244', '2023-11-05 20:31:12.244');
INSERT INTO `gen_columns` VALUES (485, 35, 'type', '类型', 'varchar(6)', 'string', 'Type', 'type', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.250', '2023-11-05 20:31:12.250');
INSERT INTO `gen_columns` VALUES (486, 35, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.257', '2023-11-05 20:31:12.257');
INSERT INTO `gen_columns` VALUES (487, 35, 'use_status', '使用状态', 'tinyint', 'int', 'UseStatus', 'useStatus', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.261', '2023-11-05 20:31:12.261');
INSERT INTO `gen_columns` VALUES (488, 35, 'created_at', '创建时间', 'int unsigned', 'int', 'CreatedAt', 'createdAt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.266', '2023-11-05 20:31:12.266');
INSERT INTO `gen_columns` VALUES (489, 35, 'updated_at', '最后更新时间', 'int unsigned', 'int', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:31:12.272', '2023-11-05 20:31:12.272');
INSERT INTO `gen_columns` VALUES (490, 36, 'id', '主键编码', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.474', '2023-11-05 20:34:42.474');
INSERT INTO `gen_columns` VALUES (491, 36, 'phone', '手机号', 'varchar(16)', 'string', 'Phone', 'phone', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.479', '2023-11-05 20:34:42.479');
INSERT INTO `gen_columns` VALUES (492, 36, 'code', '验证码', 'varchar(6)', 'string', 'Code', 'code', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.484', '2023-11-05 20:34:42.484');
INSERT INTO `gen_columns` VALUES (493, 36, 'type', '类型', 'varchar(6)', 'string', 'Type', 'type', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.488', '2023-11-05 20:34:42.488');
INSERT INTO `gen_columns` VALUES (494, 36, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.492', '2023-11-05 20:34:42.492');
INSERT INTO `gen_columns` VALUES (495, 36, 'use_status', '使用状态', 'tinyint', 'int', 'UseStatus', 'useStatus', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.499', '2023-11-05 20:34:42.499');
INSERT INTO `gen_columns` VALUES (496, 36, 'created_at', '创建时间', 'int unsigned', 'int', 'CreatedAt', 'createdAt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.505', '2023-11-05 20:34:42.505');
INSERT INTO `gen_columns` VALUES (497, 36, 'updated_at', '最后更新时间', 'int unsigned', 'int', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-05 20:34:42.511', '2023-11-05 20:34:42.511');
INSERT INTO `gen_columns` VALUES (533, 42, 'id', '主键编码', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.595', '2023-11-08 00:16:43.595');
INSERT INTO `gen_columns` VALUES (534, 42, 'name', '名字', 'varchar(128)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.600', '2023-11-08 00:16:43.600');
INSERT INTO `gen_columns` VALUES (535, 42, 'key', 'key', 'varchar(128)', 'string', 'Key', 'key', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.604', '2023-11-08 00:16:43.604');
INSERT INTO `gen_columns` VALUES (536, 42, 'value', 'Value', 'json', 'string', 'Value', 'value', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.607', '2023-11-08 00:16:43.607');
INSERT INTO `gen_columns` VALUES (537, 42, 'type', 'Type', 'varchar(64)', 'string', 'Type', 'type', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.611', '2023-11-08 00:16:43.611');
INSERT INTO `gen_columns` VALUES (538, 42, 'remark', 'Remark', 'varchar(128)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.615', '2023-11-08 00:16:43.615');
INSERT INTO `gen_columns` VALUES (539, 42, 'status', 'Status', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.618', '2023-11-08 00:16:43.618');
INSERT INTO `gen_columns` VALUES (540, 42, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.623', '2023-11-08 00:16:43.623');
INSERT INTO `gen_columns` VALUES (541, 42, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-08 00:16:43.626', '2023-11-08 00:16:43.626');
INSERT INTO `gen_columns` VALUES (542, 43, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.450', '2023-11-09 21:58:35.450');
INSERT INTO `gen_columns` VALUES (543, 43, 'title', '操作模块', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.454', '2023-11-09 21:58:35.454');
INSERT INTO `gen_columns` VALUES (544, 43, 'business_type', '操作类型', 'varchar(128)', 'string', 'BusinessType', 'businessType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.461', '2023-11-09 21:58:35.461');
INSERT INTO `gen_columns` VALUES (545, 43, 'business_types', 'BusinessTypes', 'varchar(128)', 'string', 'BusinessTypes', 'businessTypes', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.465', '2023-11-09 21:58:35.465');
INSERT INTO `gen_columns` VALUES (546, 43, 'method', '函数', 'varchar(128)', 'string', 'Method', 'method', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.471', '2023-11-09 21:58:35.471');
INSERT INTO `gen_columns` VALUES (547, 43, 'request_method', '请求方式 GET POST PUT DELETE', 'varchar(128)', 'string', 'RequestMethod', 'requestMethod', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.476', '2023-11-09 21:58:35.476');
INSERT INTO `gen_columns` VALUES (548, 43, 'operator_type', '操作类型', 'varchar(128)', 'string', 'OperatorType', 'operatorType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.482', '2023-11-09 21:58:35.482');
INSERT INTO `gen_columns` VALUES (549, 43, 'oper_name', '操作者', 'varchar(128)', 'string', 'OperName', 'operName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.486', '2023-11-09 21:58:35.486');
INSERT INTO `gen_columns` VALUES (550, 43, 'dept_name', '部门名称', 'varchar(128)', 'string', 'DeptName', 'deptName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.492', '2023-11-09 21:58:35.492');
INSERT INTO `gen_columns` VALUES (551, 43, 'oper_url', '访问地址', 'varchar(255)', 'string', 'OperUrl', 'operUrl', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.498', '2023-11-09 21:58:35.498');
INSERT INTO `gen_columns` VALUES (552, 43, 'oper_ip', '客户端ip', 'varchar(128)', 'string', 'OperIp', 'operIp', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.503', '2023-11-09 21:58:35.503');
INSERT INTO `gen_columns` VALUES (553, 43, 'oper_location', '访问位置', 'varchar(128)', 'string', 'OperLocation', 'operLocation', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.508', '2023-11-09 21:58:35.508');
INSERT INTO `gen_columns` VALUES (554, 43, 'oper_param', '请求参数', 'longtext', 'string', 'OperParam', 'operParam', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.513', '2023-11-09 21:58:35.513');
INSERT INTO `gen_columns` VALUES (555, 43, 'status', '操作状态 1:成功 2:失败', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.518', '2023-11-09 21:58:35.518');
INSERT INTO `gen_columns` VALUES (556, 43, 'oper_time', '操作时间', 'datetime(3)', 'time.Time', 'OperTime', 'operTime', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.525', '2023-11-09 21:58:35.525');
INSERT INTO `gen_columns` VALUES (557, 43, 'json_result', '返回数据', 'varchar(255)', 'string', 'JsonResult', 'jsonResult', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.530', '2023-11-09 21:58:35.530');
INSERT INTO `gen_columns` VALUES (558, 43, 'remark', '备注', 'varchar(255)', 'string', 'Remark', 'remark', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.535', '2023-11-09 21:58:35.535');
INSERT INTO `gen_columns` VALUES (559, 43, 'latency_time', '耗时', 'varchar(128)', 'string', 'LatencyTime', 'latencyTime', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.539', '2023-11-09 21:58:35.539');
INSERT INTO `gen_columns` VALUES (560, 43, 'user_agent', 'ua', 'varchar(255)', 'string', 'UserAgent', 'userAgent', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.544', '2023-11-09 21:58:35.544');
INSERT INTO `gen_columns` VALUES (561, 43, 'created_at', '创建时间', 'datetime(3)', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 20, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.548', '2023-11-09 21:58:35.548');
INSERT INTO `gen_columns` VALUES (562, 43, 'updated_at', '最后更新时间', 'datetime(3)', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 21, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.552', '2023-11-09 21:58:35.552');
INSERT INTO `gen_columns` VALUES (563, 43, 'create_by', '创建者', 'int unsigned', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 22, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.556', '2023-11-09 21:58:35.556');
INSERT INTO `gen_columns` VALUES (564, 43, 'update_by', '更新者', 'int unsigned', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 23, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-09 21:58:35.560', '2023-11-09 21:58:35.560');
INSERT INTO `gen_columns` VALUES (565, 44, 'id', '主键', 'int', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.718', '2023-11-22 21:44:52.718');
INSERT INTO `gen_columns` VALUES (566, 44, 'team_id', '针对组消息', 'int', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.725', '2023-11-22 21:44:52.725');
INSERT INTO `gen_columns` VALUES (567, 44, 'title', '标题', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.729', '2023-11-22 21:44:52.729');
INSERT INTO `gen_columns` VALUES (568, 44, 'content', '内容', 'varchar(1024)', 'string', 'Content', 'content', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.733', '2023-11-22 21:44:52.733');
INSERT INTO `gen_columns` VALUES (569, 44, 'notice_type', '消息类型', 'tinyint', 'int', 'NoticeType', 'noticeType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.737', '2023-11-22 21:44:52.737');
INSERT INTO `gen_columns` VALUES (570, 44, 'op', '操作类型', 'tinyint', 'int', 'Op', 'op', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.741', '2023-11-22 21:44:52.741');
INSERT INTO `gen_columns` VALUES (571, 44, 'op_id', '操作id', 'int', 'int', 'OpId', 'opId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.745', '2023-11-22 21:44:52.745');
INSERT INTO `gen_columns` VALUES (572, 44, 'status', '状态', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.749', '2023-11-22 21:44:52.749');
INSERT INTO `gen_columns` VALUES (573, 44, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.754', '2023-11-22 21:44:52.754');
INSERT INTO `gen_columns` VALUES (574, 44, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.758', '2023-11-22 21:44:52.758');
INSERT INTO `gen_columns` VALUES (575, 44, 'expired', '到期时间', 'datetime', 'time.Time', 'Expired', 'expired', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.763', '2023-11-22 21:44:52.763');
INSERT INTO `gen_columns` VALUES (576, 44, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.766', '2023-11-22 21:44:52.766');
INSERT INTO `gen_columns` VALUES (577, 44, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.771', '2023-11-22 21:44:52.771');
INSERT INTO `gen_columns` VALUES (578, 45, 'id', '主键', 'bigint unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.786', '2023-11-22 21:44:52.786');
INSERT INTO `gen_columns` VALUES (579, 45, 'team_id', '团队id', 'int', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.789', '2023-11-22 21:44:52.789');
INSERT INTO `gen_columns` VALUES (580, 45, 'user_id', '用户id', 'int', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.794', '2023-11-22 21:44:52.794');
INSERT INTO `gen_columns` VALUES (581, 45, 'title', '标题', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.797', '2023-11-22 21:44:52.797');
INSERT INTO `gen_columns` VALUES (582, 45, 'content', '内容', 'varchar(1024)', 'string', 'Content', 'content', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.800', '2023-11-22 21:44:52.800');
INSERT INTO `gen_columns` VALUES (583, 45, 'notice_type', '消息类型', 'tinyint', 'int', 'NoticeType', 'noticeType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.805', '2023-11-22 21:44:52.805');
INSERT INTO `gen_columns` VALUES (584, 45, 'op', '操作类型', 'tinyint', 'int', 'Op', 'op', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.809', '2023-11-22 21:44:52.809');
INSERT INTO `gen_columns` VALUES (585, 45, 'op_id', '操作对象id', 'int', 'int', 'OpId', 'opId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.812', '2023-11-22 21:44:52.812');
INSERT INTO `gen_columns` VALUES (586, 45, 'status', '状态 1未读 2已读 -1回收站', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.817', '2023-11-22 21:44:52.817');
INSERT INTO `gen_columns` VALUES (587, 45, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.820', '2023-11-22 21:44:52.820');
INSERT INTO `gen_columns` VALUES (588, 45, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.823', '2023-11-22 21:44:52.823');
INSERT INTO `gen_columns` VALUES (589, 45, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.828', '2023-11-22 21:44:52.828');
INSERT INTO `gen_columns` VALUES (590, 45, 'delete_at', '删除时间', 'datetime', 'time.Time', 'DeleteAt', 'deleteAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-22 21:44:52.831', '2023-11-22 21:44:52.831');
INSERT INTO `gen_columns` VALUES (591, 46, 'id', '主键', 'bigint unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.265', '2023-11-24 15:39:11.265');
INSERT INTO `gen_columns` VALUES (592, 46, 'team_id', '团队id', 'int', 'int', 'TeamId', 'teamId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.271', '2023-11-24 15:39:11.271');
INSERT INTO `gen_columns` VALUES (593, 46, 'user_id', '用户id', 'int', 'int', 'UserId', 'userId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.275', '2023-11-24 15:39:11.275');
INSERT INTO `gen_columns` VALUES (594, 46, 'title', '任务标题', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.281', '2023-11-24 15:39:11.281');
INSERT INTO `gen_columns` VALUES (595, 46, 'content', '任务内容', 'varchar(1024)', 'string', 'Content', 'content', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.286', '2023-11-24 15:39:11.286');
INSERT INTO `gen_columns` VALUES (596, 46, 'task_type', '任务类型', 'tinyint', 'int', 'TaskType', 'taskType', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.291', '2023-11-24 15:39:11.291');
INSERT INTO `gen_columns` VALUES (597, 46, 'op', '操作类型', 'int', 'int', 'Op', 'op', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.294', '2023-11-24 15:39:11.294');
INSERT INTO `gen_columns` VALUES (598, 46, 'op_id', '操作id', 'int', 'int', 'OpId', 'opId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.300', '2023-11-24 15:39:11.300');
INSERT INTO `gen_columns` VALUES (599, 46, 'begin_at', '开始时间', 'datetime', 'time.Time', 'BeginAt', 'beginAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.306', '2023-11-24 15:39:11.306');
INSERT INTO `gen_columns` VALUES (600, 46, 'end_at', '结束时间', 'datetime', 'time.Time', 'EndAt', 'endAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.312', '2023-11-24 15:39:11.312');
INSERT INTO `gen_columns` VALUES (601, 46, 'reminder_time', '提醒时间', 'datetime', 'time.Time', 'ReminderTime', 'reminderTime', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.319', '2023-11-24 15:39:11.319');
INSERT INTO `gen_columns` VALUES (602, 46, 'status', '状态1开启2关闭', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.323', '2023-11-24 15:39:11.323');
INSERT INTO `gen_columns` VALUES (603, 46, 'reminder_status', '提醒状态 1开启 2关闭', 'tinyint', 'int', 'ReminderStatus', 'reminderStatus', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.331', '2023-11-24 15:39:11.331');
INSERT INTO `gen_columns` VALUES (604, 46, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.335', '2023-11-24 15:39:11.335');
INSERT INTO `gen_columns` VALUES (605, 46, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.341', '2023-11-24 15:39:11.341');
INSERT INTO `gen_columns` VALUES (606, 46, 'deleted_at', '删除时间', 'datetime', 'time.Time', 'DeletedAt', 'deletedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2023-11-24 15:39:11.346', '2023-11-24 15:39:11.346');
INSERT INTO `gen_columns` VALUES (607, 47, 'id', 'id', 'bigint', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.592', '2024-03-13 19:57:08.592');
INSERT INTO `gen_columns` VALUES (608, 47, 'uuid', 'uuid', 'varchar(32)', 'string', 'Uuid', 'uuid', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.599', '2024-03-13 19:57:08.599');
INSERT INTO `gen_columns` VALUES (609, 47, 'title', '文章标题', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.605', '2024-03-13 19:57:08.605');
INSERT INTO `gen_columns` VALUES (610, 47, 'image', '图片', 'varchar(255)', 'string', 'Image', 'image', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.610', '2024-03-13 19:57:08.610');
INSERT INTO `gen_columns` VALUES (611, 47, 'subtitle', '子标题', 'varchar(255)', 'string', 'Subtitle', 'subtitle', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.616', '2024-03-13 19:57:08.616');
INSERT INTO `gen_columns` VALUES (612, 47, 'keywords', '关键字', 'varchar(255)', 'string', 'Keywords', 'keywords', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.622', '2024-03-13 19:57:08.622');
INSERT INTO `gen_columns` VALUES (613, 47, 'abstract', '摘要', 'varchar(1024)', 'string', 'Abstract', 'abstract', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.629', '2024-03-13 19:57:08.629');
INSERT INTO `gen_columns` VALUES (614, 47, 'site_column_id', '栏目id', 'int', 'int', 'SiteColumnId', 'siteColumnId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.635', '2024-03-13 19:57:08.635');
INSERT INTO `gen_columns` VALUES (615, 47, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.641', '2024-03-13 19:57:08.641');
INSERT INTO `gen_columns` VALUES (616, 47, 'out_link', '外链', 'varchar(255)', 'string', 'OutLink', 'outLink', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.650', '2024-03-13 19:57:08.650');
INSERT INTO `gen_columns` VALUES (617, 47, 'comment', '1 可评论', 'tinyint', 'int', 'Comment', 'comment', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.656', '2024-03-13 19:57:08.656');
INSERT INTO `gen_columns` VALUES (618, 47, 'comment_cnt', '评论数', 'int', 'int', 'CommentCnt', 'commentCnt', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.668', '2024-03-13 19:57:08.668');
INSERT INTO `gen_columns` VALUES (619, 47, 'status', '状态 1草稿 2正常 -1 删除', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.677', '2024-03-13 19:57:08.677');
INSERT INTO `gen_columns` VALUES (620, 47, 'pub_time', '发布时间', 'datetime', 'time.Time', 'PubTime', 'pubTime', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.683', '2024-03-13 19:57:08.683');
INSERT INTO `gen_columns` VALUES (621, 47, 'price', '价格', 'decimal(10,2)', 'string', 'Price', 'price', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.689', '2024-03-13 19:57:08.689');
INSERT INTO `gen_columns` VALUES (622, 47, 'discount_price', '折扣价', 'decimal(10,2)', 'string', 'DiscountPrice', 'discountPrice', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.695', '2024-03-13 19:57:08.695');
INSERT INTO `gen_columns` VALUES (623, 47, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.700', '2024-03-13 19:57:08.700');
INSERT INTO `gen_columns` VALUES (624, 47, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 18, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.706', '2024-03-13 19:57:08.706');
INSERT INTO `gen_columns` VALUES (625, 47, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 19, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.712', '2024-03-13 19:57:08.712');
INSERT INTO `gen_columns` VALUES (626, 47, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 20, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.718', '2024-03-13 19:57:08.718');
INSERT INTO `gen_columns` VALUES (627, 48, 'id', 'id', 'bigint unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.735', '2024-03-13 19:57:08.735');
INSERT INTO `gen_columns` VALUES (628, 48, 'article_id', '文章id', 'bigint', 'int', 'ArticleId', 'articleId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.741', '2024-03-13 19:57:08.741');
INSERT INTO `gen_columns` VALUES (629, 48, 'content', '评论内容', 'varchar(1024)', 'string', 'Content', 'content', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.747', '2024-03-13 19:57:08.747');
INSERT INTO `gen_columns` VALUES (630, 48, 'status', '状态 1 正常 2删除', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.752', '2024-03-13 19:57:08.752');
INSERT INTO `gen_columns` VALUES (631, 48, 'create_by', '评论人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.758', '2024-03-13 19:57:08.758');
INSERT INTO `gen_columns` VALUES (632, 48, 'created_at', '评论时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.766', '2024-03-13 19:57:08.766');
INSERT INTO `gen_columns` VALUES (633, 49, 'id', 'id', 'bigint', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.780', '2024-03-13 19:57:08.780');
INSERT INTO `gen_columns` VALUES (634, 49, 'article_id', '文章id', 'bigint', 'int', 'ArticleId', 'articleId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.791', '2024-03-13 19:57:08.791');
INSERT INTO `gen_columns` VALUES (635, 49, 'subject', '主题', 'varchar(16)', 'string', 'Subject', 'subject', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.798', '2024-03-13 19:57:08.798');
INSERT INTO `gen_columns` VALUES (636, 49, 'content', '内容', 'text', 'string', 'Content', 'content', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.803', '2024-03-13 19:57:08.803');
INSERT INTO `gen_columns` VALUES (637, 49, 'sort', '排序', 'int', 'int', 'Sort', 'sort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.808', '2024-03-13 19:57:08.808');
INSERT INTO `gen_columns` VALUES (638, 50, 'id', 'id', 'int', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.826', '2024-03-13 19:57:08.826');
INSERT INTO `gen_columns` VALUES (639, 50, 'article_id', '文章id', 'bigint', 'int', 'ArticleId', 'articleId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.830', '2024-03-13 19:57:08.830');
INSERT INTO `gen_columns` VALUES (640, 50, 'tag_id', '标签id', 'int', 'int', 'TagId', 'tagId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.836', '2024-03-13 19:57:08.836');
INSERT INTO `gen_columns` VALUES (641, 50, 'status', '状态 1正常 -1删除', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.841', '2024-03-13 19:57:08.841');
INSERT INTO `gen_columns` VALUES (642, 50, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.848', '2024-03-13 19:57:08.848');
INSERT INTO `gen_columns` VALUES (643, 50, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.853', '2024-03-13 19:57:08.853');
INSERT INTO `gen_columns` VALUES (644, 51, 'id', 'id', 'int', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.868', '2024-03-13 19:57:08.868');
INSERT INTO `gen_columns` VALUES (645, 51, 'article_id', '文章id', 'bigint', 'int', 'ArticleId', 'articleId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.875', '2024-03-13 19:57:08.875');
INSERT INTO `gen_columns` VALUES (646, 51, 'topic_id', '主题id', 'int', 'int', 'TopicId', 'topicId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.880', '2024-03-13 19:57:08.880');
INSERT INTO `gen_columns` VALUES (647, 51, 'status', '状态 1正常 -1删除', 'tinyint', 'int', 'Status', 'status', '0', '', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.885', '2024-03-13 19:57:08.885');
INSERT INTO `gen_columns` VALUES (648, 51, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.889', '2024-03-13 19:57:08.889');
INSERT INTO `gen_columns` VALUES (649, 51, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.896', '2024-03-13 19:57:08.896');
INSERT INTO `gen_columns` VALUES (650, 52, 'id', 'id', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.911', '2024-03-13 19:57:08.911');
INSERT INTO `gen_columns` VALUES (651, 52, 'title', '名字', 'varchar(255)', 'string', 'Title', 'title', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.918', '2024-03-13 19:57:08.918');
INSERT INTO `gen_columns` VALUES (652, 52, 'desc', '描述', 'varchar(1024)', 'string', 'Desc', 'desc', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.925', '2024-03-13 19:57:08.925');
INSERT INTO `gen_columns` VALUES (653, 52, 'image', '图片', 'varchar(255)', 'string', 'Image', 'image', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.930', '2024-03-13 19:57:08.930');
INSERT INTO `gen_columns` VALUES (654, 52, 'site_column_id', '模块id', 'int', 'int', 'SiteColumnId', 'siteColumnId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.936', '2024-03-13 19:57:08.936');
INSERT INTO `gen_columns` VALUES (655, 52, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.940', '2024-03-13 19:57:08.940');
INSERT INTO `gen_columns` VALUES (656, 52, 'url', '链接', 'varchar(255)', 'string', 'Url', 'url', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.946', '2024-03-13 19:57:08.946');
INSERT INTO `gen_columns` VALUES (657, 52, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.953', '2024-03-13 19:57:08.953');
INSERT INTO `gen_columns` VALUES (658, 52, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.959', '2024-03-13 19:57:08.959');
INSERT INTO `gen_columns` VALUES (659, 52, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.965', '2024-03-13 19:57:08.965');
INSERT INTO `gen_columns` VALUES (660, 52, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.971', '2024-03-13 19:57:08.971');
INSERT INTO `gen_columns` VALUES (661, 53, 'id', 'id', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.986', '2024-03-13 19:57:08.986');
INSERT INTO `gen_columns` VALUES (662, 53, 'name', '名字', 'varchar(32)', 'string', 'Name', 'name', '0', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.992', '2024-03-13 19:57:08.992');
INSERT INTO `gen_columns` VALUES (663, 53, 'link_url', '连接', 'varchar(256)', 'string', 'LinkUrl', 'linkUrl', '0', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:08.997', '2024-03-13 19:57:08.997');
INSERT INTO `gen_columns` VALUES (664, 53, 'logo', 'logo', 'varchar(255)', 'string', 'Logo', 'logo', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.003', '2024-03-13 19:57:09.003');
INSERT INTO `gen_columns` VALUES (665, 53, 'sort', '排序', 'int', 'int', 'Sort', 'sort', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.009', '2024-03-13 19:57:09.009');
INSERT INTO `gen_columns` VALUES (666, 53, 'site_column_id', '栏目id', 'int', 'int', 'SiteColumnId', 'siteColumnId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.015', '2024-03-13 19:57:09.015');
INSERT INTO `gen_columns` VALUES (667, 53, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.020', '2024-03-13 19:57:09.020');
INSERT INTO `gen_columns` VALUES (668, 53, 'creatd_at', '创建时间', 'datetime', 'time.Time', 'CreatdAt', 'creatdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.026', '2024-03-13 19:57:09.026');
INSERT INTO `gen_columns` VALUES (669, 53, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.033', '2024-03-13 19:57:09.033');
INSERT INTO `gen_columns` VALUES (670, 54, 'id', '主键', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.047', '2024-03-13 19:57:09.047');
INSERT INTO `gen_columns` VALUES (671, 54, 'name', '站点名称', 'varchar(255)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.053', '2024-03-13 19:57:09.053');
INSERT INTO `gen_columns` VALUES (672, 54, 'logo', 'logo', 'varchar(255)', 'string', 'Logo', 'logo', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.059', '2024-03-13 19:57:09.059');
INSERT INTO `gen_columns` VALUES (673, 54, 'keyword', '关键字', 'varchar(255)', 'string', 'Keyword', 'keyword', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.065', '2024-03-13 19:57:09.065');
INSERT INTO `gen_columns` VALUES (674, 54, 'desc', '描述', 'varchar(255)', 'string', 'Desc', 'desc', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.071', '2024-03-13 19:57:09.071');
INSERT INTO `gen_columns` VALUES (675, 54, 'template', '模板', 'varchar(64)', 'string', 'Template', 'template', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.078', '2024-03-13 19:57:09.078');
INSERT INTO `gen_columns` VALUES (676, 54, 'domain', '域名', 'varchar(255)', 'string', 'Domain', 'domain', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.084', '2024-03-13 19:57:09.084');
INSERT INTO `gen_columns` VALUES (677, 54, 'icp', 'icp备案', 'varchar(255)', 'string', 'Icp', 'icp', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.095', '2024-03-13 19:57:09.095');
INSERT INTO `gen_columns` VALUES (678, 54, 'copyright', '版权', 'varchar(255)', 'string', 'Copyright', 'copyright', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.106', '2024-03-13 19:57:09.106');
INSERT INTO `gen_columns` VALUES (679, 54, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.118', '2024-03-13 19:57:09.118');
INSERT INTO `gen_columns` VALUES (680, 54, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.123', '2024-03-13 19:57:09.123');
INSERT INTO `gen_columns` VALUES (681, 54, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.130', '2024-03-13 19:57:09.130');
INSERT INTO `gen_columns` VALUES (682, 54, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.142', '2024-03-13 19:57:09.142');
INSERT INTO `gen_columns` VALUES (683, 55, 'id', 'id', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.170', '2024-03-13 19:57:09.170');
INSERT INTO `gen_columns` VALUES (684, 55, 'name', '栏目名', 'varchar(255)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.178', '2024-03-13 19:57:09.178');
INSERT INTO `gen_columns` VALUES (685, 55, 'en_name', '英文名', 'varchar(255)', 'string', 'EnName', 'enName', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.183', '2024-03-13 19:57:09.183');
INSERT INTO `gen_columns` VALUES (686, 55, 'code', '栏目路径', 'varchar(255)', 'string', 'Code', 'code', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.188', '2024-03-13 19:57:09.188');
INSERT INTO `gen_columns` VALUES (687, 55, 'keyword', '关键字', 'varchar(255)', 'string', 'Keyword', 'keyword', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.194', '2024-03-13 19:57:09.194');
INSERT INTO `gen_columns` VALUES (688, 55, 'desc', '描述', 'varchar(2048)', 'string', 'Desc', 'desc', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.200', '2024-03-13 19:57:09.200');
INSERT INTO `gen_columns` VALUES (689, 55, 'image', '图片', 'varchar(255)', 'string', 'Image', 'image', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.206', '2024-03-13 19:57:09.206');
INSERT INTO `gen_columns` VALUES (690, 55, 'parent_id', '父级栏目', 'int', 'int', 'ParentId', 'parentId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.210', '2024-03-13 19:57:09.210');
INSERT INTO `gen_columns` VALUES (691, 55, 'path', '栏目路径', 'varchar(255)', 'string', 'Path', 'path', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.216', '2024-03-13 19:57:09.216');
INSERT INTO `gen_columns` VALUES (692, 55, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.222', '2024-03-13 19:57:09.222');
INSERT INTO `gen_columns` VALUES (693, 55, 'hidden', '公开选项（1公开；2：内部；3：专家）', 'tinyint', 'int', 'Hidden', 'hidden', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.228', '2024-03-13 19:57:09.228');
INSERT INTO `gen_columns` VALUES (694, 55, 'submit', '投稿 1开放 2关闭', 'tinyint', 'int', 'Submit', 'submit', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 12, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.234', '2024-03-13 19:57:09.234');
INSERT INTO `gen_columns` VALUES (695, 55, 'tmpl_index', '模板路径', 'varchar(255)', 'string', 'TmplIndex', 'tmplIndex', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 13, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.239', '2024-03-13 19:57:09.239');
INSERT INTO `gen_columns` VALUES (696, 55, 'tmpl_item', '内部文章模板', 'varchar(255)', 'string', 'TmplItem', 'tmplItem', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 14, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.246', '2024-03-13 19:57:09.246');
INSERT INTO `gen_columns` VALUES (697, 55, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 15, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.253', '2024-03-13 19:57:09.253');
INSERT INTO `gen_columns` VALUES (698, 55, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 16, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.258', '2024-03-13 19:57:09.258');
INSERT INTO `gen_columns` VALUES (699, 55, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 17, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.263', '2024-03-13 19:57:09.263');
INSERT INTO `gen_columns` VALUES (700, 55, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 18, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.270', '2024-03-13 19:57:09.270');
INSERT INTO `gen_columns` VALUES (701, 56, 'id', 'id', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.287', '2024-03-13 19:57:09.287');
INSERT INTO `gen_columns` VALUES (702, 56, 'tag_name', '标签名称', 'varchar(128)', 'string', 'TagName', 'tagName', '0', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.294', '2024-03-13 19:57:09.294');
INSERT INTO `gen_columns` VALUES (703, 56, 'pinyin', '拼音', 'varchar(256)', 'string', 'Pinyin', 'pinyin', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.299', '2024-03-13 19:57:09.299');
INSERT INTO `gen_columns` VALUES (704, 56, 'first_char', '首字母', 'varchar(2)', 'string', 'FirstChar', 'firstChar', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.305', '2024-03-13 19:57:09.305');
INSERT INTO `gen_columns` VALUES (705, 56, 'tag_count', '标签使用次数', 'varchar(64)', 'string', 'TagCount', 'tagCount', '0', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.311', '2024-03-13 19:57:09.311');
INSERT INTO `gen_columns` VALUES (706, 56, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.317', '2024-03-13 19:57:09.317');
INSERT INTO `gen_columns` VALUES (707, 56, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.322', '2024-03-13 19:57:09.322');
INSERT INTO `gen_columns` VALUES (708, 56, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.328', '2024-03-13 19:57:09.328');
INSERT INTO `gen_columns` VALUES (709, 56, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.335', '2024-03-13 19:57:09.335');
INSERT INTO `gen_columns` VALUES (710, 56, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '1', '1', '', '1', '', 'EQ', 'datetime', '', 10, '', 0, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.340', '2024-03-13 19:57:09.340');
INSERT INTO `gen_columns` VALUES (711, 57, 'id', 'id', 'int unsigned', 'int', 'Id', 'id', '1', '', '1', '1', '1', '1', '', 'EQ', 'input', '', 1, '', 1, 1, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.356', '2024-03-13 19:57:09.356');
INSERT INTO `gen_columns` VALUES (712, 57, 'name', '名字', 'varchar(32)', 'string', 'Name', 'name', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 2, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.362', '2024-03-13 19:57:09.362');
INSERT INTO `gen_columns` VALUES (713, 57, 'pinyin', '拼音', 'varchar(255)', 'string', 'Pinyin', 'pinyin', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 3, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.367', '2024-03-13 19:57:09.367');
INSERT INTO `gen_columns` VALUES (714, 57, 'desc', '描述', 'varchar(1024)', 'string', 'Desc', 'desc', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 4, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.373', '2024-03-13 19:57:09.373');
INSERT INTO `gen_columns` VALUES (715, 57, 'image', '图片', 'varchar(255)', 'string', 'Image', 'image', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 5, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.379', '2024-03-13 19:57:09.379');
INSERT INTO `gen_columns` VALUES (716, 57, 'site_id', '站点id', 'int', 'int', 'SiteId', 'siteId', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 6, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.385', '2024-03-13 19:57:09.385');
INSERT INTO `gen_columns` VALUES (717, 57, 'count', '数', 'int', 'int', 'Count', 'count', '0', '', '0', '1', '1', '1', '', 'EQ', 'input', '', 7, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.392', '2024-03-13 19:57:09.392');
INSERT INTO `gen_columns` VALUES (718, 57, 'created_at', '创建时间', 'datetime', 'time.Time', 'CreatedAt', 'createdAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 8, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.397', '2024-03-13 19:57:09.397');
INSERT INTO `gen_columns` VALUES (719, 57, 'create_by', '创建人', 'int', 'int', 'CreateBy', 'createBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 9, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.404', '2024-03-13 19:57:09.404');
INSERT INTO `gen_columns` VALUES (720, 57, 'updated_at', '更新时间', 'datetime', 'time.Time', 'UpdatedAt', 'updatedAt', '0', '', '0', '1', '', '1', '', 'EQ', 'datetime', '', 10, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.409', '2024-03-13 19:57:09.409');
INSERT INTO `gen_columns` VALUES (721, 57, 'update_by', '更新人', 'int', 'int', 'UpdateBy', 'updateBy', '0', '', '0', '1', '', '1', '', 'EQ', 'input', '', 11, '', 0, 0, 0, 0, 0, 1, 0, 0, '', '', '', '', '', '', 0, 0, '2024-03-13 19:57:09.414', '2024-03-13 19:57:09.414');

-- ----------------------------
-- Table structure for gen_tables
-- ----------------------------
DROP TABLE IF EXISTS `gen_tables`;
CREATE TABLE `gen_tables`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT,
  `db_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `table_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `table_comment` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `class_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tpl_category` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `package_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `module_front_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端文件名',
  `business_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `function_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `function_author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pk_column` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pk_go_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `pk_json_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `options` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree_parent_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tree` tinyint(1) NULL DEFAULT 0,
  `crud` tinyint(1) NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_data_scope` tinyint NULL DEFAULT NULL,
  `is_actions` tinyint NULL DEFAULT NULL,
  `is_auth` tinyint NULL DEFAULT NULL,
  `is_logical_delete` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `logical_delete` tinyint(1) NULL DEFAULT NULL,
  `logical_delete_column` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`table_id`) USING BTREE,
  INDEX `idx_gen_tables_create_by`(`create_by` ASC) USING BTREE,
  INDEX `idx_gen_tables_update_by`(`update_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_tables
-- ----------------------------
INSERT INTO `gen_tables` VALUES (14, 'dilu-db', 'sys_user', '用户', 'SysUser', 'crud', 'sys', 'sys-user', '', 'sysUser', '用户', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-26 13:44:05.983', '2023-09-26 13:44:05.983', 0, 0);
INSERT INTO `gen_tables` VALUES (15, 'dilu-db', 'sys_menu', '菜单', 'SysMenu', 'crud', 'sys', 'sys-menu', '', 'sysMenu', '菜单', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-26 13:44:51.533', '2023-09-26 13:44:51.533', 0, 0);
INSERT INTO `gen_tables` VALUES (16, 'dilu-db', 'sys_role', '角色', 'SysRole', 'crud', 'sys', 'sys-role', '', 'sysRole', '角色', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-26 13:45:11.897', '2023-09-26 13:45:11.897', 0, 0);
INSERT INTO `gen_tables` VALUES (20, 'dilu-db', 'sys_team', '团队', 'SysTeam', 'crud', 'sys', 'sys-team', '', 'sysTeam', 'SysTeam', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-29 08:33:06.345', '2023-09-29 08:33:06.345', 0, 0);
INSERT INTO `gen_tables` VALUES (21, 'dilu-db', 'sys_member', '会员', 'SysMember', 'crud', 'sys', 'sys-member', '', 'sysMember', 'SysMember', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-29 08:33:20.152', '2023-09-29 08:33:20.152', 0, 0);
INSERT INTO `gen_tables` VALUES (22, 'dental-db', 'bill', '账单', 'Bill', 'crud', 'dental', 'bill', '', 'bill', 'Bill', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-30 14:05:14.853', '2023-09-30 14:05:14.853', 0, 0);
INSERT INTO `gen_tables` VALUES (23, 'dental-db', 'customer', '客户', 'Customer', 'crud', 'dental', 'customer', '', 'customer', 'Customer', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-30 14:05:22.598', '2023-09-30 14:05:22.598', 0, 0);
INSERT INTO `gen_tables` VALUES (25, 'dental-db', 'summary_plan_day', '总结与计划', 'SummaryPlanDay', 'crud', 'dental', 'summary-plan-day', '', 'summaryPlanDay', 'SummaryPlanDay', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-09-30 14:05:37.221', '2023-09-30 14:05:37.221', 0, 0);
INSERT INTO `gen_tables` VALUES (27, 'dilu-db', 'sys_dept', '部门', 'SysDept', 'crud', 'sys', 'sys-dept', '', 'sysDept', '部门', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-03 16:12:23.378', '2023-10-03 16:12:23.378', 0, 0);
INSERT INTO `gen_tables` VALUES (28, 'dental-db', 'target_task', 'TargetTask', 'TargetTask', 'crud', 'dental', 'target-task', '', 'targetTask', 'TargetTask', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-03 17:15:17.051', '2023-10-03 17:15:17.051', 0, 0);
INSERT INTO `gen_tables` VALUES (29, 'dental-db', 'event_day_st', 'EventDaySt', 'EventDaySt', 'crud', 'dental', 'event-day-st', '', 'eventDaySt', 'EventDaySt', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-06 20:17:08.646', '2023-10-06 20:17:08.646', 0, 0);
INSERT INTO `gen_tables` VALUES (30, 'dilu-db', 'gen_tables', 'GenTables', 'GenTables', 'crud', 'sys', 'gen-tables', '', 'genTables', 'GenTables', 'baowk', 'table_id', 'TableId', 'tableId', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-28 16:27:31.937', '2023-10-28 16:27:31.937', 0, 0);
INSERT INTO `gen_tables` VALUES (31, 'dilu-db', 'gen_columns', 'GenColumns', 'GenColumns', 'crud', 'sys', 'gen-columns', '', 'genColumns', 'GenColumns', 'baowk', 'column_id', 'ColumnId', 'columnId', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-28 16:28:02.925', '2023-10-28 16:28:02.925', 0, 0);
INSERT INTO `gen_tables` VALUES (32, 'dilu-db', 'sys_api', '接口', 'SysApi', 'crud', 'sys', 'sys-api', '', 'sysApi', '接口', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-10-28 16:51:28.742', '2023-10-28 16:51:28.742', 0, 0);
INSERT INTO `gen_tables` VALUES (35, 'dilu-db', 'sys_email', '邮件', 'SysEmail', 'crud', 'sys', 'sys-email', '', 'sysEmail', '邮件', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-05 20:31:12.227', '2023-11-05 20:31:12.227', 0, 0);
INSERT INTO `gen_tables` VALUES (36, 'dilu-db', 'sys_sms', '短信', 'SysSms', 'crud', 'sys', 'sys-sms', '', 'sysSms', '短信', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-05 20:34:42.469', '2023-11-05 20:34:42.469', 0, 0);
INSERT INTO `gen_tables` VALUES (42, 'dilu-db', 'sys_cfg', '配置', 'SysCfg', 'crud', 'sys', 'sys-cfg', '', 'sysCfg', '配置', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-08 00:16:43.591', '2023-11-08 00:16:43.591', 0, 0);
INSERT INTO `gen_tables` VALUES (43, 'dilu-db', 'sys_opera_log', '操作日志', 'SysOperaLog', 'crud', 'sys', 'sys-opera-log', '', 'sysOperaLog', '操作日志', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-09 21:58:35.441', '2023-11-09 21:58:35.441', 0, 0);
INSERT INTO `gen_tables` VALUES (44, 'notice-db', 'pub_notice', '公用通知', 'PubNotice', 'crud', 'notice', 'pub-notice', '', 'pubNotice', '公用通知', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-22 21:44:52.710', '2023-11-22 21:44:52.710', 0, 0);
INSERT INTO `gen_tables` VALUES (45, 'notice-db', 'user_notice', '用户通知', 'UserNotice', 'crud', 'notice', 'user-notice', '', 'userNotice', '用户通知', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-22 21:44:52.782', '2023-11-22 21:44:52.782', 0, 0);
INSERT INTO `gen_tables` VALUES (46, 'notice-db', 'task', 'Task', 'Task', 'crud', 'notice', 'task', '', 'task', 'Task', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2023-11-24 15:39:11.257', '2023-11-24 15:39:11.257', 0, 0);
INSERT INTO `gen_tables` VALUES (47, 'dilu-cms', 'article', '文章', 'Article', 'crud', 'cms', 'article', '', 'article', '文章', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.583', '2024-03-13 19:57:08.583', 0, 0);
INSERT INTO `gen_tables` VALUES (48, 'dilu-cms', 'article_comment', '文章评论', 'ArticleComment', 'crud', 'cms', 'article-comment', '', 'articleComment', 'ArticleComment', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.728', '2024-03-13 20:01:46.110', 0, 0);
INSERT INTO `gen_tables` VALUES (49, 'dilu-cms', 'article_item', '文章内容', 'ArticleItem', 'crud', 'cms', 'article-item', '', 'articleItem', 'ArticleItem', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.774', '2024-03-13 20:01:32.213', 0, 0);
INSERT INTO `gen_tables` VALUES (50, 'dilu-cms', 'article_tag', '文章标签', 'ArticleTag', 'crud', 'cms', 'article-tag', '', 'articleTag', 'ArticleTag', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.817', '2024-03-13 20:01:20.391', 0, 0);
INSERT INTO `gen_tables` VALUES (51, 'dilu-cms', 'article_topic', '文章主题', 'ArticleTopic', 'crud', 'cms', 'article-topic', '', 'articleTopic', 'ArticleTopic', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.861', '2024-03-13 20:01:11.588', 0, 0);
INSERT INTO `gen_tables` VALUES (52, 'dilu-cms', 'banner', 'Banner', 'Banner', 'crud', 'cms', 'banner', '', 'banner', 'Banner', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.905', '2024-03-13 19:57:08.905', 0, 0);
INSERT INTO `gen_tables` VALUES (53, 'dilu-cms', 'link', '友链', 'Link', 'crud', 'cms', 'link', '', 'link', '友链', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:08.981', '2024-03-13 19:57:08.981', 0, 0);
INSERT INTO `gen_tables` VALUES (54, 'dilu-cms', 'site', '站点', 'Site', 'crud', 'cms', 'site', '', 'site', 'Site', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:09.042', '2024-03-13 20:00:54.848', 0, 0);
INSERT INTO `gen_tables` VALUES (55, 'dilu-cms', 'site_column', '栏目', 'SiteColumn', 'crud', 'cms', 'site-column', '', 'siteColumn', 'SiteColumn', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:09.159', '2024-03-13 20:00:48.044', 0, 0);
INSERT INTO `gen_tables` VALUES (56, 'dilu-cms', 'tag', '标签', 'Tag', 'crud', 'cms', 'tag', '', 'tag', 'Tag', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:09.282', '2024-03-13 20:00:36.540', 0, 0);
INSERT INTO `gen_tables` VALUES (57, 'dilu-cms', 'topic', '主题', 'Topic', 'crud', 'cms', 'topic', '', 'topic', 'Topic', 'baowk', 'id', 'Id', 'id', '', '', '', '', 0, 1, '', 1, 2, 1, '1', 1, 'is_del', '2024-03-13 19:57:09.349', '2024-03-13 20:00:29.498', 0, 0);

-- ----------------------------
-- Table structure for sys_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_api`;
CREATE TABLE `sys_api`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标题',
  `method` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求类型',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求地址',
  `perm_type` bigint NULL DEFAULT NULL COMMENT '权限类型（1：无需认证 2:须token 3：须鉴权）',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态 3 DEF 2 OK 1 del',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_method_path`(`method` ASC, `path` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '接口' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_api
-- ----------------------------
INSERT INTO `sys_api` VALUES (1, '分页获取用户', 'POST', '/api/v1/sys/sys-user/page', 3, 3, 0, '2023-09-26 13:46:59.488');
INSERT INTO `sys_api` VALUES (2, '根据id获取用户', 'POST', '/api/v1/sys/sys-user/get', 3, 3, 0, '2023-09-26 13:46:59.518');
INSERT INTO `sys_api` VALUES (3, '创建用户', 'POST', '/api/v1/sys/sys-user/create', 3, 3, 0, '2023-09-26 13:46:59.532');
INSERT INTO `sys_api` VALUES (4, '修改用户', 'POST', '/api/v1/sys/sys-user/update', 3, 3, 0, '2023-09-26 13:46:59.539');
INSERT INTO `sys_api` VALUES (5, '删除用户', 'POST', '/api/v1/sys/sys-user/del', 3, 3, 0, '2023-09-26 13:46:59.550');
INSERT INTO `sys_api` VALUES (6, '分页获取菜单', 'POST', '/api/v1/sys/sys-menu/all', 3, 3, 0, '2023-09-26 13:47:37.020');
INSERT INTO `sys_api` VALUES (7, '根据id获取菜单', 'POST', '/api/v1/sys/sys-menu/get', 3, 3, 0, '2023-09-26 13:47:37.038');
INSERT INTO `sys_api` VALUES (8, '创建菜单', 'POST', '/api/v1/sys/sys-menu/create', 3, 3, 0, '2023-09-26 13:47:37.064');
INSERT INTO `sys_api` VALUES (9, '修改菜单', 'POST', '/api/v1/sys/sys-menu/update', 3, 3, 0, '2023-09-26 13:47:37.073');
INSERT INTO `sys_api` VALUES (10, '删除菜单', 'POST', '/api/v1/sys/sys-menu/del', 3, 3, 0, '2023-09-26 13:47:37.082');
INSERT INTO `sys_api` VALUES (11, '分页获取角色', 'POST', '/api/v1/sys/sys-role/page', 3, 3, 0, '2023-09-26 13:47:39.685');
INSERT INTO `sys_api` VALUES (12, '根据id获取角色', 'POST', '/api/v1/sys/sys-role/get', 3, 3, 0, '2023-09-26 13:47:39.701');
INSERT INTO `sys_api` VALUES (13, '创建角色', 'POST', '/api/v1/sys/sys-role/create', 3, 3, 0, '2023-09-26 13:47:39.734');
INSERT INTO `sys_api` VALUES (14, '修改角色', 'POST', '/api/v1/sys/sys-role/update', 3, 3, 0, '2023-09-26 13:47:39.762');
INSERT INTO `sys_api` VALUES (15, '删除角色', 'POST', '/api/v1/sys/sys-role/del', 3, 3, 0, '2023-09-26 13:47:39.773');
INSERT INTO `sys_api` VALUES (16, '分页获取部门', 'POST', '/api/v1/sys/sys-dept/all', 3, 3, 0, '2023-09-26 13:47:42.136');
INSERT INTO `sys_api` VALUES (17, '根据id获取部门', 'POST', '/api/v1/sys/sys-dept/get', 3, 3, 0, '2023-09-26 13:47:42.152');
INSERT INTO `sys_api` VALUES (18, '创建部门', 'POST', '/api/v1/sys/sys-dept/create', 3, 3, 0, '2023-09-26 13:47:42.172');
INSERT INTO `sys_api` VALUES (19, '修改部门', 'POST', '/api/v1/sys/sys-dept/update', 3, 3, 0, '2023-09-26 13:47:42.186');
INSERT INTO `sys_api` VALUES (20, '删除部门', 'POST', '/api/v1/sys/sys-dept/del', 3, 3, 0, '2023-09-26 13:47:42.197');
INSERT INTO `sys_api` VALUES (21, '分页获取用户部门', 'POST', '/api/v1/sys/sys-user-dept/page', 3, 3, 0, '2023-09-26 13:47:45.447');
INSERT INTO `sys_api` VALUES (22, '根据id获取用户部门', 'POST', '/api/v1/sys/sys-user-dept/get', 3, 3, 0, '2023-09-26 13:47:45.459');
INSERT INTO `sys_api` VALUES (23, '创建用户部门', 'POST', '/api/v1/sys/sys-user-dept/create', 3, 3, 0, '2023-09-26 13:47:45.483');
INSERT INTO `sys_api` VALUES (24, '修改用户部门', 'POST', '/api/v1/sys/sys-user-dept/update', 3, 3, 0, '2023-09-26 13:47:45.495');
INSERT INTO `sys_api` VALUES (25, '删除用户部门', 'POST', '/api/v1/sys/sys-user-dept/del', 3, 3, 0, '2023-09-26 13:47:45.503');
INSERT INTO `sys_api` VALUES (26, '分页获取成员', 'POST', '/api/v1/sys/sys-member/page', 3, 3, 0, '2023-09-26 14:09:40.443');
INSERT INTO `sys_api` VALUES (27, '根据id获取成员', 'POST', '/api/v1/sys/sys-member/get', 3, 3, 0, '2023-09-26 14:09:40.459');
INSERT INTO `sys_api` VALUES (28, '创建成员', 'POST', '/api/v1/sys/sys-member/create', 3, 3, 0, '2023-09-26 14:09:40.483');
INSERT INTO `sys_api` VALUES (29, '修改成员', 'POST', '/api/v1/sys/sys-member/update', 3, 3, 0, '2023-09-26 14:09:40.493');
INSERT INTO `sys_api` VALUES (30, '删除成员', 'POST', '/api/v1/sys/sys-member/del', 3, 3, 0, '2023-09-26 14:09:40.502');
INSERT INTO `sys_api` VALUES (31, '分页获取团队', 'POST', '/api/v1/sys/sys-team/page', 3, 3, 0, '2023-09-29 08:40:00.840');
INSERT INTO `sys_api` VALUES (32, '根据id获取团队', 'POST', '/api/v1/sys/sys-team/get', 3, 3, 0, '2023-09-29 08:40:00.855');
INSERT INTO `sys_api` VALUES (33, '创建团队', 'POST', '/api/v1/sys/sys-team/create', 3, 3, 0, '2023-09-29 08:40:00.867');
INSERT INTO `sys_api` VALUES (34, '修改团队', 'POST', '/api/v1/sys/sys-team/update', 3, 3, 0, '2023-09-29 08:40:00.879');
INSERT INTO `sys_api` VALUES (35, '删除团队', 'POST', '/api/v1/sys/sys-team/del', 3, 3, 0, '2023-09-29 08:40:00.891');
INSERT INTO `sys_api` VALUES (36, '分页获取账单', 'POST', '/api/v1/dental/bill/page', 3, 3, 0, '2023-09-29 08:45:53.790');
INSERT INTO `sys_api` VALUES (37, '根据id获取账单', 'POST', '/api/v1/dental/bill/get', 3, 3, 0, '2023-09-29 08:45:53.800');
INSERT INTO `sys_api` VALUES (38, '创建账单', 'POST', '/api/v1/dental/bill/create', 3, 3, 0, '2023-09-29 08:45:53.814');
INSERT INTO `sys_api` VALUES (39, '修改账单', 'POST', '/api/v1/dental/bill/update', 3, 3, 0, '2023-09-29 08:45:53.827');
INSERT INTO `sys_api` VALUES (40, '删除账单', 'POST', '/api/v1/dental/bill/del', 3, 3, 0, '2023-09-29 08:45:53.838');
INSERT INTO `sys_api` VALUES (41, '分页获取客户', 'POST', '/api/v1/dental/customer/page', 3, 3, 0, '2023-09-29 08:46:25.136');
INSERT INTO `sys_api` VALUES (42, '根据id获取客户', 'POST', '/api/v1/dental/customer/get', 3, 3, 0, '2023-09-29 08:46:25.149');
INSERT INTO `sys_api` VALUES (43, '创建客户', 'POST', '/api/v1/dental/customer/create', 3, 3, 0, '2023-09-29 08:46:25.162');
INSERT INTO `sys_api` VALUES (44, '修改客户', 'POST', '/api/v1/dental/customer/update', 3, 3, 0, '2023-09-29 08:46:25.173');
INSERT INTO `sys_api` VALUES (45, '删除客户', 'POST', '/api/v1/dental/customer/del', 3, 3, 0, '2023-09-29 08:46:25.184');
INSERT INTO `sys_api` VALUES (46, '分页获取日统计', 'POST', '/api/v1/dental/event-day-st/page', 3, 3, 0, '2023-09-29 08:46:27.734');
INSERT INTO `sys_api` VALUES (47, '根据id获取日统计', 'POST', '/api/v1/dental/event-day-st/get', 3, 3, 0, '2023-09-29 08:46:27.768');
INSERT INTO `sys_api` VALUES (48, '创建日统计', 'POST', '/api/v1/dental/event-day-st/create', 3, 3, 0, '2023-09-29 08:46:27.778');
INSERT INTO `sys_api` VALUES (49, '修改日统计', 'POST', '/api/v1/dental/event-day-st/update', 3, 3, 0, '2023-09-29 08:46:27.787');
INSERT INTO `sys_api` VALUES (50, '删除日统计', 'POST', '/api/v1/dental/event-day-st/del', 3, 3, 0, '2023-09-29 08:46:27.798');
INSERT INTO `sys_api` VALUES (51, '分页获取日总结与计划', 'POST', '/api/v1/dental/summary-plan-day/page', 3, 3, 0, '2023-09-29 08:46:30.205');
INSERT INTO `sys_api` VALUES (52, '根据id获取日总结与计划', 'POST', '/api/v1/dental/summary-plan-day/get', 3, 3, 0, '2023-09-29 08:46:30.219');
INSERT INTO `sys_api` VALUES (53, '创建日总结与计划', 'POST', '/api/v1/dental/summary-plan-day/create', 3, 3, 0, '2023-09-29 08:46:30.230');
INSERT INTO `sys_api` VALUES (54, '修改日总结与计划', 'POST', '/api/v1/dental/summary-plan-day/update', 3, 3, 0, '2023-09-29 08:46:30.241');
INSERT INTO `sys_api` VALUES (55, '删除日总结与计划', 'POST', '/api/v1/dental/summary-plan-day/del', 3, 3, 0, '2023-09-29 08:46:30.252');
INSERT INTO `sys_api` VALUES (56, '分页获取任务目标', 'POST', '/api/v1/dental/target-task/page', 3, 3, 0, '2023-09-29 08:46:32.788');
INSERT INTO `sys_api` VALUES (57, '根据id获取任务目标', 'POST', '/api/v1/dental/target-task/get', 3, 3, 0, '2023-09-29 08:46:32.824');
INSERT INTO `sys_api` VALUES (58, '创建任务目标', 'POST', '/api/v1/dental/target-task/create', 3, 3, 0, '2023-09-29 08:46:32.834');
INSERT INTO `sys_api` VALUES (59, '修改任务目标', 'POST', '/api/v1/dental/target-task/update', 3, 3, 0, '2023-09-29 08:46:32.844');
INSERT INTO `sys_api` VALUES (60, '删除任务目标', 'POST', '/api/v1/dental/target-task/del', 3, 3, 0, '2023-09-29 08:46:32.854');
INSERT INTO `sys_api` VALUES (61, '账单智能识别', 'POST', '/api/v1/dental/bill/identify', 3, 3, 0, '2023-10-15 10:45:32.000');
INSERT INTO `sys_api` VALUES (62, '日统计', 'POST', '/api/v1/dental/st/day', 3, 3, 0, '2023-10-16 13:51:54.000');
INSERT INTO `sys_api` VALUES (63, '月统计', 'POST', '/api/v1/dental/st/month', 3, 3, 0, '2023-10-16 14:30:58.000');
INSERT INTO `sys_api` VALUES (64, '分页获取GenTables', 'POST', '/api/v1/sys/gen-tables/page', 3, 3, 0, '2023-10-28 16:31:47.687');
INSERT INTO `sys_api` VALUES (65, '根据id获取GenTables', 'POST', '/api/v1/sys/gen-tables/get', 3, 3, 0, '2023-10-28 16:31:47.701');
INSERT INTO `sys_api` VALUES (66, '创建GenTables', 'POST', '/api/v1/sys/gen-tables/create', 3, 3, 0, '2023-10-28 16:31:47.710');
INSERT INTO `sys_api` VALUES (67, '修改GenTables', 'POST', '/api/v1/sys/gen-tables/update', 3, 3, 0, '2023-10-28 16:31:47.720');
INSERT INTO `sys_api` VALUES (68, '删除GenTables', 'POST', '/api/v1/sys/gen-tables/del', 3, 3, 0, '2023-10-28 16:31:47.728');
INSERT INTO `sys_api` VALUES (69, '分页获取GenColumns', 'POST', '/api/v1/sys/gen-columns/page', 3, 3, 0, '2023-10-28 16:35:01.328');
INSERT INTO `sys_api` VALUES (70, '根据id获取GenColumns', 'POST', '/api/v1/sys/gen-columns/get', 3, 3, 0, '2023-10-28 16:35:01.350');
INSERT INTO `sys_api` VALUES (71, '创建GenColumns', 'POST', '/api/v1/sys/gen-columns/create', 3, 3, 0, '2023-10-28 16:35:01.360');
INSERT INTO `sys_api` VALUES (72, '修改GenColumns', 'POST', '/api/v1/sys/gen-columns/update', 3, 3, 0, '2023-10-28 16:35:01.368');
INSERT INTO `sys_api` VALUES (73, '删除GenColumns', 'POST', '/api/v1/sys/gen-columns/del', 3, 3, 0, '2023-10-28 16:35:01.388');
INSERT INTO `sys_api` VALUES (74, '分页获取接口', 'POST', '/api/v1/sys/sys-api/page', 3, 3, 0, '2023-10-28 16:51:44.921');
INSERT INTO `sys_api` VALUES (75, '根据id获取接口', 'POST', '/api/v1/sys/sys-api/get', 3, 3, 0, '2023-10-28 16:51:44.933');
INSERT INTO `sys_api` VALUES (76, '创建接口', 'POST', '/api/v1/sys/sys-api/create', 3, 3, 0, '2023-10-28 16:51:44.943');
INSERT INTO `sys_api` VALUES (77, '修改接口', 'POST', '/api/v1/sys/sys-api/update', 3, 3, 0, '2023-10-28 16:51:44.952');
INSERT INTO `sys_api` VALUES (78, '删除接口', 'POST', '/api/v1/sys/sys-api/del', 3, 3, 0, '2023-10-28 16:51:44.960');
INSERT INTO `sys_api` VALUES (79, '账单查询统计', 'POST', '/api/v1/dental/st/query', 3, 3, 0, '2023-10-29 18:56:28.000');
INSERT INTO `sys_api` VALUES (80, '所有角色', 'POST', '/api/v1/sys/sys-role/list', 3, 3, 0, '2023-11-04 11:51:22.000');
INSERT INTO `sys_api` VALUES (81, '分页获取配置', 'POST', '/api/v1/sys/sys-cfg/page', 3, 3, 0, '2023-11-08 20:34:50.872');
INSERT INTO `sys_api` VALUES (82, '根据id获取配置', 'POST', '/api/v1/sys/sys-cfg/get', 3, 3, 0, '2023-11-08 20:34:50.885');
INSERT INTO `sys_api` VALUES (83, '创建配置', 'POST', '/api/v1/sys/sys-cfg/create', 3, 3, 0, '2023-11-08 20:34:50.898');
INSERT INTO `sys_api` VALUES (84, '修改配置', 'POST', '/api/v1/sys/sys-cfg/update', 3, 3, 0, '2023-11-08 20:34:50.912');
INSERT INTO `sys_api` VALUES (85, '删除配置', 'POST', '/api/v1/sys/sys-cfg/del', 3, 3, 0, '2023-11-08 20:34:50.925');
INSERT INTO `sys_api` VALUES (86, '分页获取操作日志', 'POST', '/api/v1/sys/sys-opera-log/page', 3, 3, 0, '2023-11-09 22:07:17.252');
INSERT INTO `sys_api` VALUES (87, '根据id获取操作日志', 'POST', '/api/v1/sys/sys-opera-log/get', 3, 3, 0, '2023-11-09 22:07:17.268');
INSERT INTO `sys_api` VALUES (88, '创建操作日志', 'POST', '/api/v1/sys/sys-opera-log/create', 3, 3, 0, '2023-11-09 22:07:17.284');
INSERT INTO `sys_api` VALUES (89, '修改操作日志', 'POST', '/api/v1/sys/sys-opera-log/update', 3, 3, 0, '2023-11-09 22:07:17.297');
INSERT INTO `sys_api` VALUES (90, '删除操作日志', 'POST', '/api/v1/sys/sys-opera-log/del', 3, 3, 0, '2023-11-09 22:07:17.310');
INSERT INTO `sys_api` VALUES (92, '修改我的企业信息', 'POST', '/api/v1/sys/sys-team/change', 3, 3, 0, '2023-11-18 15:45:42.000');
INSERT INTO `sys_api` VALUES (93, '监控', 'POST', '/api/v1/tools/monitor', 3, 3, 0, '2023-11-20 19:42:50.000');
INSERT INTO `sys_api` VALUES (94, '分页获取用户通知', 'POST', '/api/v1/notice/user-notice/page', 3, 3, 0, '2023-11-22 21:45:33.859');
INSERT INTO `sys_api` VALUES (95, '根据id获取用户通知', 'POST', '/api/v1/notice/user-notice/get', 3, 3, 0, '2023-11-22 21:45:33.885');
INSERT INTO `sys_api` VALUES (96, '创建用户通知', 'POST', '/api/v1/notice/user-notice/create', 3, 3, 0, '2023-11-22 21:45:33.902');
INSERT INTO `sys_api` VALUES (97, '修改用户通知', 'POST', '/api/v1/notice/user-notice/update', 3, 3, 0, '2023-11-22 21:45:33.918');
INSERT INTO `sys_api` VALUES (98, '删除用户通知', 'POST', '/api/v1/notice/user-notice/del', 3, 3, 0, '2023-11-22 21:45:33.936');
INSERT INTO `sys_api` VALUES (99, '分页获取公用通知', 'POST', '/api/v1/notice/pub-notice/page', 3, 3, 0, '2023-11-22 21:45:36.388');
INSERT INTO `sys_api` VALUES (100, '根据id获取公用通知', 'POST', '/api/v1/notice/pub-notice/get', 3, 3, 0, '2023-11-22 21:45:36.400');
INSERT INTO `sys_api` VALUES (101, '创建公用通知', 'POST', '/api/v1/notice/pub-notice/create', 3, 3, 0, '2023-11-22 21:45:36.411');
INSERT INTO `sys_api` VALUES (102, '修改公用通知', 'POST', '/api/v1/notice/pub-notice/update', 3, 3, 0, '2023-11-22 21:45:36.422');
INSERT INTO `sys_api` VALUES (103, '删除公用通知', 'POST', '/api/v1/notice/pub-notice/del', 3, 3, 0, '2023-11-22 21:45:36.433');
INSERT INTO `sys_api` VALUES (104, '分页获取Task', 'POST', '/api/v1/notice/task/page', 3, 3, 0, '2023-11-24 15:39:24.097');
INSERT INTO `sys_api` VALUES (105, '根据id获取Task', 'POST', '/api/v1/notice/task/get', 3, 3, 0, '2023-11-24 15:39:24.113');
INSERT INTO `sys_api` VALUES (106, '创建Task', 'POST', '/api/v1/notice/task/create', 3, 3, 0, '2023-11-24 15:39:24.125');
INSERT INTO `sys_api` VALUES (107, '修改Task', 'POST', '/api/v1/notice/task/update', 3, 3, 0, '2023-11-24 15:39:24.139');
INSERT INTO `sys_api` VALUES (108, '删除Task', 'POST', '/api/v1/notice/task/del', 3, 3, 0, '2023-11-24 15:39:24.150');
INSERT INTO `sys_api` VALUES (109, '账单统计导出', 'POST', '/api/v1/dental/st/export', 3, 3, 0, '2023-12-09 11:17:59.000');
INSERT INTO `sys_api` VALUES (110, '账单导出', 'POST', '/api/v1/dental/bill/export', 3, 3, 0, '2023-12-09 16:57:59.000');
INSERT INTO `sys_api` VALUES (166, '占比统计导出', 'POST', '/api/v1/dental/st/exportrate', 3, 3, 0, '2023-12-09 11:17:59.000');

-- ----------------------------
-- Table structure for sys_cfg
-- ----------------------------
DROP TABLE IF EXISTS `sys_cfg`;
CREATE TABLE `sys_cfg`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名字',
  `key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'key',
  `value` json NULL COMMENT 'Value',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Type',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Remark',
  `status` tinyint NULL DEFAULT NULL COMMENT 'Status',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_cfg
-- ----------------------------

-- ----------------------------
-- Table structure for sys_data_access_peam
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_access_peam`;
CREATE TABLE `sys_data_access_peam`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_id` int NULL DEFAULT NULL COMMENT '团队id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `data_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表',
  `level` tinyint NULL DEFAULT NULL COMMENT '权限等级',
  `access_id` int NULL DEFAULT NULL COMMENT '可访问的id',
  `create_by` int NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_data_access_peam
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int UNSIGNED NULL DEFAULT NULL COMMENT '父id',
  `dept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门路径',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名',
  `type` tinyint NULL DEFAULT NULL COMMENT '类型 1分公司 2部门',
  `principal` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门领导',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` tinyint NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态 1正常 2关闭',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `team_id` int NULL DEFAULT NULL COMMENT '团队id',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_dept_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '/0/1/', '销售一部', 2, '糖糖', '13800138000', NULL, 1, 1, NULL, 1, NULL, 2, NULL, '2023-10-26 20:57:48.321', NULL);
INSERT INTO `sys_dept` VALUES (2, 1, '/0/1/2/', '糖糖组', 2, '', '', NULL, NULL, 1, NULL, 1, NULL, 2, NULL, '2023-10-26 21:03:59.644', NULL);
INSERT INTO `sys_dept` VALUES (9, 10, '/0/10/9/', '哈哈组', 2, '哈哈', '', '', 0, 1, '', 1, 2, 2, '2023-10-26 20:50:45.790', '2023-10-26 20:59:33.924', NULL);
INSERT INTO `sys_dept` VALUES (10, 0, '/0/10/', '销售二部', 0, '', '', '', 0, 1, '', 1, 2, 0, '2023-10-26 20:51:11.338', '2023-10-26 20:51:11.342', NULL);
INSERT INTO `sys_dept` VALUES (11, 0, '/0/11/', '销售三部', 1, '', '', '', 0, 1, '', 1, 2, 2, '2023-10-26 21:00:05.460', '2023-10-26 21:04:04.980', NULL);
INSERT INTO `sys_dept` VALUES (12, 11, '/0/11/12/', '呵呵组', 2, '', '', '', 0, 1, '', 1, 2, 2, '2023-10-26 21:00:22.635', '2023-10-26 21:00:45.968', NULL);

-- ----------------------------
-- Table structure for sys_email
-- ----------------------------
DROP TABLE IF EXISTS `sys_email`;
CREATE TABLE `sys_email`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '验证码',
  `type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `use_status` tinyint NULL DEFAULT NULL COMMENT '使用状态',
  `created_at` int UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int UNSIGNED NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '邮件' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_email
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `job_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `job_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组',
  `job_type` tinyint NULL DEFAULT NULL COMMENT '类型',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表达式',
  `invoke_target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调用目标',
  `args` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '参数',
  `misfire_policy` bigint NULL DEFAULT NULL COMMENT '策略',
  `concurrent` tinyint NULL DEFAULT NULL COMMENT '并发',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `entry_id` smallint NULL DEFAULT NULL COMMENT '任务id',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_job_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_member
-- ----------------------------
DROP TABLE IF EXISTS `sys_member`;
CREATE TABLE `sys_member`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `team_id` int NULL DEFAULT NULL COMMENT '团队id',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `nickname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `py` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名拼音',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `dept_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门路径',
  `dept_id` int UNSIGNED NULL DEFAULT NULL COMMENT '部门id',
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色id',
  `post_id` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '职位 1系统超管 2 团队拥有者 4主管 8副主管 16员工',
  `entry_time` datetime(3) NULL DEFAULT NULL COMMENT '入职时间',
  `retire_time` datetime(3) NULL DEFAULT NULL COMMENT '离职时间',
  `gender` tinyint(1) NULL DEFAULT 2 COMMENT '性别 1男 2女 3未知',
  `birthday` date NULL DEFAULT NULL COMMENT '生日 格式 yyyy-MM-dd',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态 1正常 ',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_member
-- ----------------------------
INSERT INTO `sys_member` VALUES (1, 1, 2, '糖糖', '小唐', 'xiao-tang', '', '/0/1/2/', 2, '-1', 2, '2023-02-20 00:00:00.000', NULL, 2, '1991-02-01', 1, NULL, NULL, NULL, '2023-11-18 20:10:52.435');
INSERT INTO `sys_member` VALUES (2, 1, 3, '梅梅', '小梅', 'xiao-mei', NULL, '/0/1/2/', 2, '8', 8, '2021-01-13 00:00:00.000', NULL, 2, NULL, 1, NULL, NULL, NULL, '2023-11-16 19:34:27.378');
INSERT INTO `sys_member` VALUES (3, 1, 4, '小雷', '大雷', 'da-lei', NULL, '/0/1/2/', 2, '5,6', 2, '2023-06-19 00:00:00.000', '2023-11-30 00:00:00.000', 1, '2023-11-30', 2, NULL, NULL, NULL, '2023-11-30 22:21:43.622');
INSERT INTO `sys_member` VALUES (4, 1, 5, '小丽', '小丽', 'xiao-li', NULL, '/0/1/2/', 2, NULL, 8, '2022-11-18 00:00:00.000', NULL, 2, NULL, 1, NULL, NULL, NULL, '2023-11-16 16:40:46.733');
INSERT INTO `sys_member` VALUES (5, 1, 6, '小珊', '小珊', 'xiao-shan', NULL, '/0/1/2/', 2, '6,7,8', 8, '2023-06-02 00:00:00.000', NULL, 2, NULL, 1, NULL, NULL, NULL, '2023-11-16 17:21:26.525');
INSERT INTO `sys_member` VALUES (6, 1, 7, '大雁', '大雁', 'da-yan', NULL, '/0/1/2/', 2, '7', 8, '2023-08-07 00:00:00.000', NULL, 2, NULL, 1, NULL, NULL, NULL, '2023-11-16 17:22:18.461');
INSERT INTO `sys_member` VALUES (7, 1, 9, '小琪', '小琪', 'xiao-qi', '', '/0/1/2/', 2, '', 8, '2023-11-23 00:00:00.000', '2023-11-30 00:00:00.000', 2, '2023-11-30', 2, 0, 0, '2023-11-30 22:26:39.916', '2024-05-05 09:47:44.778');
INSERT INTO `sys_member` VALUES (8, 1, 8, '大金', '大金', 'da-jin', '', '/0/10/9/', 9, '-1', 2, '2023-11-30 00:00:00.000', NULL, 2, NULL, 2, 0, 0, '2023-11-30 22:54:28.922', '2024-05-05 09:47:36.440');
INSERT INTO `sys_member` VALUES (9, -1, 1, 'dilu', 'dilu', 'dilu', NULL, NULL, NULL, '-1', 1, NULL, NULL, 2, NULL, 1, NULL, NULL, '2024-05-26 10:45:55.000', '2024-05-26 10:45:58.000');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单名',
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示名称',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路径',
  `platform_type` bigint NULL DEFAULT NULL COMMENT '平台类型 1 平台管理 2团队管理',
  `menu_type` tinyint NULL DEFAULT NULL COMMENT '菜单类型 1 分类 2菜单 3方法按钮',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限',
  `parent_id` int UNSIGNED NULL DEFAULT NULL COMMENT '菜单父id',
  `no_cache` tinyint(1) NULL DEFAULT NULL COMMENT '是否缓存',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前端组件路径',
  `sort` tinyint NULL DEFAULT NULL COMMENT '排序倒叙',
  `hidden` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_menu_deleted_at`(`deleted_at` ASC) USING BTREE,
  INDEX `idx_sys_menu_create_by`(`create_by` ASC) USING BTREE,
  INDEX `idx_sys_menu_update_by`(`update_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '', '系统管理', 'setting', '/sys', 2, 1, '', 0, 0, 'Layout', 50, 0, 1, 0, '2023-09-26 13:46:59.480', '2024-03-13 20:49:05.368', NULL);
INSERT INTO `sys_menu` VALUES (2, 'SysUserManage', '用户管理', 'flUser', '/sys/sys-user', 1, 2, 'sys:sysUser:list', 1, 0, '/sys/sys-user/index', 0, 0, 1, 1, '2023-09-26 13:46:59.493', '2023-09-26 13:46:59.503', NULL);
INSERT INTO `sys_menu` VALUES (3, '', '用户详情', '', 'sys_user_detail', 1, 3, 'sys:sysUser:query', 2, 0, '', 0, 0, 1, 1, '2023-09-26 13:46:59.522', '2023-09-26 13:46:59.526', NULL);
INSERT INTO `sys_menu` VALUES (4, '', '用户创建', '', 'sys_user_create', 1, 3, 'sys:sysUser:add', 2, 0, '', 0, 0, 1, 1, '2023-09-26 13:46:59.534', '2023-09-26 13:46:59.536', NULL);
INSERT INTO `sys_menu` VALUES (5, '', '用户修改', '', 'sys_user_update', 1, 3, 'sys:sysUser:edit', 2, 0, '', 0, 0, 1, 1, '2023-09-26 13:46:59.543', '2023-09-26 13:46:59.546', NULL);
INSERT INTO `sys_menu` VALUES (6, '', '用户删除', '', 'sys_user_del', 1, 3, 'sys:sysUser:remove', 2, 0, '', 0, 0, 1, 1, '2023-09-26 13:46:59.553', '2023-09-26 13:46:59.555', NULL);
INSERT INTO `sys_menu` VALUES (7, 'SysMenuManage', '菜单管理', 'menu', '/sys/sys-menu', 1, 2, 'sys:sysMenu:list', 91, 0, '/sys/sys-menu/index', 0, 0, 1, 1, '2023-09-26 13:47:37.025', '2024-05-24 22:47:05.611', NULL);
INSERT INTO `sys_menu` VALUES (8, '', '菜单详情', '', 'sys_menu_detail', 1, 3, 'sys:sysMenu:query', 7, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:37.042', '2023-09-26 13:47:37.055', NULL);
INSERT INTO `sys_menu` VALUES (9, '', '菜单创建', '', 'sys_menu_create', 1, 3, 'sys:sysMenu:add', 7, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:37.067', '2023-09-26 13:47:37.069', NULL);
INSERT INTO `sys_menu` VALUES (10, '', '菜单修改', '', 'sys_menu_update', 1, 3, 'sys:sysMenu:edit', 7, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:37.076', '2023-09-26 13:47:37.079', NULL);
INSERT INTO `sys_menu` VALUES (11, '', '菜单删除', '', 'sys_menu_del', 1, 3, 'sys:sysMenu:remove', 7, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:37.084', '2023-09-26 13:47:37.086', NULL);
INSERT INTO `sys_menu` VALUES (12, 'SysRoleManage', '角色管理', 'role', '/sys/sys-role', 2, 2, 'sys:sysRole:list', 1, 0, '/sys/sys-role/index', 0, 0, 1, 1, '2023-09-26 13:47:39.688', '2023-09-26 13:47:39.694', NULL);
INSERT INTO `sys_menu` VALUES (13, '', '角色详情', '', 'sys_role_detail', 2, 3, 'sys:sysRole:query', 12, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:39.714', '2023-09-26 13:47:39.717', NULL);
INSERT INTO `sys_menu` VALUES (14, '', '角色创建', '', 'sys_role_create', 2, 3, 'sys:sysRole:add', 12, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:39.747', '2023-09-26 13:47:39.752', NULL);
INSERT INTO `sys_menu` VALUES (15, '', '角色修改', '', 'sys_role_update', 2, 3, 'sys:sysRole:edit', 12, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:39.765', '2023-09-26 13:47:39.769', NULL);
INSERT INTO `sys_menu` VALUES (16, '', '角色删除', '', 'sys_role_del', 2, 3, 'sys:sysRole:remove', 12, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:39.776', '2023-09-26 13:47:39.778', NULL);
INSERT INTO `sys_menu` VALUES (17, 'SysDeptManage', '部门管理', 'dept', '/sys/sys-dept', 2, 2, 'sys:sysDept:list', 1, 0, '/sys/sys-dept/index', 0, 0, 1, 1, '2023-09-26 13:47:42.140', '2023-09-26 13:47:42.144', NULL);
INSERT INTO `sys_menu` VALUES (18, '', '部门详情', '', 'sys_dept_detail', 2, 3, 'sys:sysDept:query', 17, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:42.155', '2023-09-26 13:47:42.167', NULL);
INSERT INTO `sys_menu` VALUES (19, '', '部门创建', '', 'sys_dept_create', 2, 3, 'sys:sysDept:add', 17, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:42.180', '2023-09-26 13:47:42.182', NULL);
INSERT INTO `sys_menu` VALUES (20, '', '部门修改', '', 'sys_dept_update', 2, 3, 'sys:sysDept:edit', 17, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:42.188', '2023-09-26 13:47:42.190', NULL);
INSERT INTO `sys_menu` VALUES (21, '', '部门删除', '', 'sys_dept_del', 2, 3, 'sys:sysDept:remove', 17, 0, '', 0, 0, 1, 1, '2023-09-26 13:47:42.200', '2023-09-26 13:47:42.202', NULL);
INSERT INTO `sys_menu` VALUES (52, 'SysTeamManage', '团队管理', 'team', '/sys/sys-team', 1, 2, 'sys:sysTeam:list', 1, 0, '/sys/sys-team/index', 0, 0, 1, 1, '2023-09-29 08:44:07.932', '2023-09-29 08:44:07.935', NULL);
INSERT INTO `sys_menu` VALUES (53, '', '团队详情', '', 'sys_team_detail', 1, 3, 'sys:sysTeam:query', 52, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:07.941', '2023-09-29 08:44:07.945', NULL);
INSERT INTO `sys_menu` VALUES (54, '', '团队创建', '', 'sys_team_create', 1, 3, 'sys:sysTeam:add', 52, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:07.951', '2023-09-29 08:44:07.954', NULL);
INSERT INTO `sys_menu` VALUES (55, '', '团队修改', '', 'sys_team_update', 1, 3, 'sys:sysTeam:edit', 52, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:07.958', '2023-09-29 08:44:07.961', NULL);
INSERT INTO `sys_menu` VALUES (56, '', '团队删除', '', 'sys_team_del', 1, 3, 'sys:sysTeam:remove', 52, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:07.966', '2023-09-29 08:44:07.971', NULL);
INSERT INTO `sys_menu` VALUES (57, 'SysMemberManage', '成员管理', 'openArm', '/sys/sys-member', 2, 2, 'sys:sysMember:list', 1, 0, '/sys/sys-member/index', 0, 0, 1, 1, '2023-09-29 08:44:33.484', '2023-09-29 08:44:33.508', NULL);
INSERT INTO `sys_menu` VALUES (58, '', '成员详情', '', 'sys_member_detail', 2, 3, 'sys:sysMember:query', 57, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:33.517', '2023-09-29 08:44:33.520', NULL);
INSERT INTO `sys_menu` VALUES (59, '', '成员创建', '', 'sys_member_create', 2, 3, 'sys:sysMember:add', 57, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:33.526', '2023-09-29 08:44:33.529', NULL);
INSERT INTO `sys_menu` VALUES (60, '', '成员修改', '', 'sys_member_update', 2, 3, 'sys:sysMember:edit', 57, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:33.534', '2023-09-29 08:44:33.538', NULL);
INSERT INTO `sys_menu` VALUES (61, '', '会员删除', '', 'sys_member_del', 2, 3, 'sys:sysMember:remove', 57, 0, '', 0, 0, 1, 1, '2023-09-29 08:44:33.543', '2023-09-29 08:44:33.546', NULL);
INSERT INTO `sys_menu` VALUES (62, '', '营销管理', 'bill', '/dental', 2, 1, '', 0, 0, 'Layout', 11, 0, 1, 1, '2023-09-29 08:45:53.780', '2024-05-24 22:47:43.544', NULL);
INSERT INTO `sys_menu` VALUES (63, 'BillManage', '账单管理', 'bill', '/dental/bill', 2, 2, 'dental:bill:list', 62, 0, '/dental/bill/index', 1, 0, 1, 1, '2023-09-29 08:45:53.794', '2024-05-24 23:34:12.073', NULL);
INSERT INTO `sys_menu` VALUES (64, '', '账单详情', '', 'bill_detail', 2, 3, 'dental:bill:query', 63, 0, '', 0, 0, 1, 1, '2023-09-29 08:45:53.803', '2023-09-29 08:45:53.806', NULL);
INSERT INTO `sys_menu` VALUES (65, '', '账单创建', '', 'bill_create', 2, 3, 'dental:bill:add', 63, 0, '', 0, 0, 1, 1, '2023-09-29 08:45:53.818', '2023-09-29 08:45:53.821', NULL);
INSERT INTO `sys_menu` VALUES (66, '', '账单修改', '', 'bill_update', 2, 3, 'dental:bill:edit', 63, 0, '', 0, 0, 1, 1, '2023-09-29 08:45:53.829', '2023-09-29 08:45:53.833', NULL);
INSERT INTO `sys_menu` VALUES (67, '', '账单删除', '', 'bill_del', 2, 3, 'dental:bill:remove', 63, 0, '', 0, 0, 1, 1, '2023-09-29 08:45:53.840', '2023-09-29 08:45:53.843', NULL);
INSERT INTO `sys_menu` VALUES (68, 'CustomerManage', '客户管理', 'customer', '/dental/customer', 2, 2, 'dental:customer:list', 62, 0, '/dental/customer/index', 11, 0, 1, 1, '2023-09-29 08:46:25.139', '2024-05-24 23:35:10.258', NULL);
INSERT INTO `sys_menu` VALUES (69, '', '客户详情', '', 'customer_detail', 2, 3, 'dental:customer:query', 68, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:25.153', '2023-09-29 08:46:25.156', NULL);
INSERT INTO `sys_menu` VALUES (70, '', '客户创建', '', 'customer_create', 2, 3, 'dental:customer:add', 68, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:25.165', '2023-09-29 08:46:25.168', NULL);
INSERT INTO `sys_menu` VALUES (71, '', '客户修改', '', 'customer_update', 2, 3, 'dental:customer:edit', 68, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:25.176', '2023-09-29 08:46:25.179', NULL);
INSERT INTO `sys_menu` VALUES (72, '', '客户删除', '', 'customer_del', 2, 3, 'dental:customer:remove', 68, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:25.187', '2023-09-29 08:46:25.190', NULL);
INSERT INTO `sys_menu` VALUES (73, 'EventDayStManage', '日统计管理', 'calendarCheck', '/dental/event-day-st', 2, 2, 'dental:eventDaySt:list', 62, 0, '/dental/event-day-st/index', 2, 0, 1, 1, '2023-09-29 08:46:27.736', '2024-05-24 23:34:24.798', NULL);
INSERT INTO `sys_menu` VALUES (74, '', '日统计详情', '', 'event_day_st_detail', 2, 3, 'dental:eventDaySt:query', 73, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:27.771', '2023-09-29 08:46:27.774', NULL);
INSERT INTO `sys_menu` VALUES (75, '', '日统计创建', '', 'event_day_st_create', 2, 3, 'dental:eventDaySt:add', 73, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:27.780', '2023-09-29 08:46:27.783', NULL);
INSERT INTO `sys_menu` VALUES (76, '', '日统计修改', '', 'event_day_st_update', 2, 3, 'dental:eventDaySt:edit', 73, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:27.790', '2023-09-29 08:46:27.794', NULL);
INSERT INTO `sys_menu` VALUES (77, '', '日统计删除', '', 'event_day_st_del', 2, 3, 'dental:eventDaySt:remove', 73, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:27.801', '2023-09-29 08:46:27.806', NULL);
INSERT INTO `sys_menu` VALUES (78, 'SummaryPlanDayManage', '日总结与计划管理', 'planet', '/dental/summary-plan-day', 2, 2, 'dental:summaryPlanDay:list', 62, 0, '/dental/summary-plan-day/index', 3, 0, 1, 1, '2023-09-29 08:46:30.209', '2024-05-24 23:34:33.018', NULL);
INSERT INTO `sys_menu` VALUES (79, '', '日总结与计划详情', '', 'summary_plan_day_detail', 2, 3, 'dental:summaryPlanDay:query', 78, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:30.222', '2023-09-29 08:46:30.225', NULL);
INSERT INTO `sys_menu` VALUES (80, '', '日总结与计划创建', '', 'summary_plan_day_create', 2, 3, 'dental:summaryPlanDay:add', 78, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:30.233', '2023-09-29 08:46:30.236', NULL);
INSERT INTO `sys_menu` VALUES (81, '', '日总结与计划修改', '', 'summary_plan_day_update', 2, 3, 'dental:summaryPlanDay:edit', 78, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:30.244', '2023-09-29 08:46:30.247', NULL);
INSERT INTO `sys_menu` VALUES (82, '', '日总结与计划删除', '', 'summary_plan_day_del', 2, 3, 'dental:summaryPlanDay:remove', 78, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:30.254', '2023-09-29 08:46:30.258', NULL);
INSERT INTO `sys_menu` VALUES (83, 'TargetTaskManage', '任务目标管理', 'task', '/dental/target-task', 2, 2, 'dental:targetTask:list', 62, 0, '/dental/target-task/index', 5, 0, 1, 1, '2023-09-29 08:46:32.790', '2024-05-24 23:34:58.311', NULL);
INSERT INTO `sys_menu` VALUES (84, '', '任务目标详情', '', 'target_task_detail', 2, 3, 'dental:targetTask:query', 83, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:32.828', '2023-09-29 08:46:32.830', NULL);
INSERT INTO `sys_menu` VALUES (85, '', '任务目标创建', '', 'target_task_create', 2, 3, 'dental:targetTask:add', 83, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:32.837', '2023-09-29 08:46:32.840', NULL);
INSERT INTO `sys_menu` VALUES (86, '', '任务目标修改', '', 'target_task_update', 2, 3, 'dental:targetTask:edit', 83, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:32.847', '2023-09-29 08:46:32.850', NULL);
INSERT INTO `sys_menu` VALUES (87, '', '任务目标删除', '', 'target_task_del', 2, 3, 'dental:targetTask:remove', 83, 0, '', 0, 0, 1, 1, '2023-09-29 08:46:32.857', '2023-09-29 08:46:32.861', NULL);
INSERT INTO `sys_menu` VALUES (88, NULL, '账单智能识别', NULL, 'bill_identify', 2, 3, 'dental:bill:identify', 63, 0, '', 0, 0, 1, 1, '2023-10-15 00:00:00.000', '2023-10-15 00:00:00.000', NULL);
INSERT INTO `sys_menu` VALUES (89, NULL, '日统计', NULL, 'st_day', 2, 3, 'dental:st:day', 108, 0, NULL, 0, 0, 1, 1, '2023-10-16 13:53:40.000', '2023-10-16 13:53:44.000', NULL);
INSERT INTO `sys_menu` VALUES (90, NULL, '月统计', NULL, 'st_month', 2, 3, 'dental:st:month', 108, 0, NULL, 0, 0, 1, 1, '2023-10-16 14:32:02.000', '2023-10-16 14:32:06.000', NULL);
INSERT INTO `sys_menu` VALUES (91, '', '工具管理', 'setUp', '/tools', 1, 1, NULL, 0, 0, 'Layout', 111, 0, 1, 1, '2023-10-28 09:41:26.000', '2024-05-24 22:47:52.057', NULL);
INSERT INTO `sys_menu` VALUES (93, 'GenTablesManage', '代码生成', 'table', '/sys/gen-tables', 1, 2, 'sys:genTables:list', 91, 0, '/tool/gen-tables/index', 0, 0, 1, 1, '2023-10-28 16:31:47.693', '2023-10-28 16:31:47.693', NULL);
INSERT INTO `sys_menu` VALUES (94, '', 'GenTables详情', '', 'gen_tables_detail', 1, 3, 'sys:genTables:query', 93, 0, '', 0, 0, 1, 1, '2023-10-28 16:31:47.704', '2023-10-28 16:31:47.704', NULL);
INSERT INTO `sys_menu` VALUES (95, '', 'GenTables创建', '', 'gen_tables_create', 1, 3, 'sys:genTables:add', 93, 0, '', 0, 0, 1, 1, '2023-10-28 16:31:47.714', '2023-10-28 16:31:47.714', NULL);
INSERT INTO `sys_menu` VALUES (96, '', 'GenTables修改', '', 'gen_tables_update', 1, 3, 'sys:genTables:edit', 93, 0, '', 0, 0, 1, 1, '2023-10-28 16:31:47.723', '2023-10-28 16:31:47.723', NULL);
INSERT INTO `sys_menu` VALUES (97, '', 'GenTables删除', '', 'gen_tables_del', 1, 3, 'sys:genTables:remove', 93, 0, '', 0, 0, 1, 1, '2023-10-28 16:31:47.731', '2023-10-28 16:31:47.731', NULL);
INSERT INTO `sys_menu` VALUES (103, 'SysApiManage', '接口管理', 'swapLine', '/sys/sys-api', 1, 2, 'sys:sysApi:list', 91, 0, '/tool/sys-api/index', 0, 0, 1, 1, '2023-10-28 16:51:44.924', '2023-10-28 16:51:44.924', NULL);
INSERT INTO `sys_menu` VALUES (104, '', '接口详情', '', 'sys_api_detail', 1, 3, 'sys:sysApi:query', 103, 0, '', 0, 0, 1, 1, '2023-10-28 16:51:44.938', '2023-10-28 16:51:44.938', NULL);
INSERT INTO `sys_menu` VALUES (105, '', '接口创建', '', 'sys_api_create', 1, 3, 'sys:sysApi:add', 103, 0, '', 0, 0, 1, 1, '2023-10-28 16:51:44.947', '2023-10-28 16:51:44.947', NULL);
INSERT INTO `sys_menu` VALUES (106, '', '接口修改', '', 'sys_api_update', 1, 3, 'sys:sysApi:edit', 103, 0, '', 0, 0, 1, 1, '2023-10-28 16:51:44.955', '2023-10-28 16:51:44.955', NULL);
INSERT INTO `sys_menu` VALUES (107, '', '接口删除', '', 'sys_api_del', 1, 3, 'sys:sysApi:remove', 103, 0, '', 0, 0, 1, 1, '2023-10-28 16:51:44.964', '2023-10-28 16:51:44.964', NULL);
INSERT INTO `sys_menu` VALUES (108, 'BillStQuery', '统计查询', 'histogram', '/dental/st', 2, 2, 'dental:st:list', 62, 0, '/dental/billst/index', 4, 0, 1, 1, '2023-10-29 14:34:14.000', '2024-05-24 23:34:47.939', NULL);
INSERT INTO `sys_menu` VALUES (109, NULL, '查询统计', NULL, 'st_bill_query', 2, 3, 'dental:st:query', 108, 0, NULL, 0, 0, 1, 1, '2023-10-29 18:47:57.000', '2023-10-29 18:48:02.000', NULL);
INSERT INTO `sys_menu` VALUES (111, 'SysCfgManage', '配置管理', 'operation', '/sys/sys-cfg', 2, 2, 'sys:sysCfg:list', 1, 0, '/sys/sys-cfg/index', 0, 0, 1, 1, '2023-11-08 20:34:50.875', '2023-11-08 20:34:50.875', NULL);
INSERT INTO `sys_menu` VALUES (112, '', '配置详情', '', 'sys_cfg_detail', 2, 3, 'sys:sysCfg:query', 111, 0, '', 0, 0, 1, 1, '2023-11-08 20:34:50.889', '2023-11-08 20:34:50.889', NULL);
INSERT INTO `sys_menu` VALUES (113, '', '配置创建', '', 'sys_cfg_create', 2, 3, 'sys:sysCfg:add', 111, 0, '', 0, 0, 1, 1, '2023-11-08 20:34:50.903', '2023-11-08 20:34:50.903', NULL);
INSERT INTO `sys_menu` VALUES (114, '', '配置修改', '', 'sys_cfg_update', 2, 3, 'sys:sysCfg:edit', 111, 0, '', 0, 0, 1, 1, '2023-11-08 20:34:50.916', '2023-11-08 20:34:50.916', NULL);
INSERT INTO `sys_menu` VALUES (115, '', '配置删除', '', 'sys_cfg_del', 2, 3, 'sys:sysCfg:remove', 111, 0, '', 0, 0, 1, 1, '2023-11-08 20:34:50.929', '2023-11-08 20:34:50.929', NULL);
INSERT INTO `sys_menu` VALUES (117, 'SysOperaLogManage', '操作日志管理', 'generate', '/sys/sys-opera-log', 2, 2, 'sys:sysOperaLog:list', 1, 0, '/sys/sys-opera-log/index', 0, 0, 1, 1, '2023-11-09 22:07:17.257', '2023-11-09 22:07:17.257', NULL);
INSERT INTO `sys_menu` VALUES (118, '', '操作日志详情', '', 'sys_opera_log_detail', 2, 3, 'sys:sysOperaLog:query', 117, 0, '', 0, 0, 1, 1, '2023-11-09 22:07:17.272', '2023-11-09 22:07:17.272', NULL);
INSERT INTO `sys_menu` VALUES (119, '', '操作日志创建', '', 'sys_opera_log_create', 2, 3, 'sys:sysOperaLog:add', 117, 0, '', 0, 0, 1, 1, '2023-11-09 22:07:17.288', '2023-11-09 22:07:17.288', NULL);
INSERT INTO `sys_menu` VALUES (120, '', '操作日志修改', '', 'sys_opera_log_update', 2, 3, 'sys:sysOperaLog:edit', 117, 0, '', 0, 0, 1, 1, '2023-11-09 22:07:17.301', '2023-11-09 22:07:17.301', NULL);
INSERT INTO `sys_menu` VALUES (121, '', '操作日志删除', '', 'sys_opera_log_del', 2, 3, 'sys:sysOperaLog:remove', 117, 0, '', 0, 0, 1, 1, '2023-11-09 22:07:17.313', '2023-11-09 22:07:17.313', NULL);
INSERT INTO `sys_menu` VALUES (122, 'My', '我的', NULL, '/my', 2, 1, '', 0, 0, 'Layout', 123, 1, 1, 1, '2023-11-18 15:25:44.000', '2024-05-24 23:19:32.049', NULL);
INSERT INTO `sys_menu` VALUES (123, NULL, '修改企业信息', NULL, 'my_team', 2, 3, 'my:change:team', 122, 0, NULL, 0, 0, 1, 1, '2023-11-18 15:33:28.000', '2023-11-18 15:33:31.000', NULL);
INSERT INTO `sys_menu` VALUES (124, 'Monitor', '监控', 'monitor', '/tools/monitor', 1, 2, 'sys:monitor', 91, 0, '/tool/monitor', 0, 0, 1, 1, '2023-11-20 19:46:04.000', '2023-11-20 19:46:06.000', NULL);
INSERT INTO `sys_menu` VALUES (126, 'UserNoticeManage', '用户通知管理', 'bell', '/notice/user-notice', 2, 2, 'notice:userNotice:list', 1, 0, '/notice/user-notice/index', 0, 0, 1, 1, '2023-11-22 21:45:33.866', '2023-11-22 21:45:33.866', NULL);
INSERT INTO `sys_menu` VALUES (127, '', '用户通知详情', '', 'user_notice_detail', 2, 3, 'notice:userNotice:query', 126, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:33.889', '2023-11-22 21:45:33.889', NULL);
INSERT INTO `sys_menu` VALUES (128, '', '用户通知创建', '', 'user_notice_create', 2, 3, 'notice:userNotice:add', 126, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:33.907', '2023-11-22 21:45:33.907', NULL);
INSERT INTO `sys_menu` VALUES (129, '', '用户通知修改', '', 'user_notice_update', 2, 3, 'notice:userNotice:edit', 126, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:33.925', '2023-11-22 21:45:33.925', NULL);
INSERT INTO `sys_menu` VALUES (130, '', '用户通知删除', '', 'user_notice_del', 2, 3, 'notice:userNotice:remove', 126, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:33.941', '2023-11-22 21:45:33.941', NULL);
INSERT INTO `sys_menu` VALUES (132, 'PubNoticeManage', '公用通知管理', 'bellFill', '/notice/pub-notice', 2, 2, 'notice:pubNotice:list', 1, 0, '/notice/pub-notice/index', 0, 0, 1, 1, '2023-11-22 21:45:36.391', '2023-11-22 21:45:36.391', NULL);
INSERT INTO `sys_menu` VALUES (133, '', '公用通知详情', '', 'pub_notice_detail', 2, 3, 'notice:pubNotice:query', 132, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:36.405', '2023-11-22 21:45:36.405', NULL);
INSERT INTO `sys_menu` VALUES (134, '', '公用通知创建', '', 'pub_notice_create', 2, 3, 'notice:pubNotice:add', 132, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:36.416', '2023-11-22 21:45:36.416', NULL);
INSERT INTO `sys_menu` VALUES (135, '', '公用通知修改', '', 'pub_notice_update', 2, 3, 'notice:pubNotice:edit', 132, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:36.427', '2023-11-22 21:45:36.427', NULL);
INSERT INTO `sys_menu` VALUES (136, '', '公用通知删除', '', 'pub_notice_del', 2, 3, 'notice:pubNotice:remove', 132, 0, '', 0, 0, 1, 1, '2023-11-22 21:45:36.439', '2023-11-22 21:45:36.439', NULL);
INSERT INTO `sys_menu` VALUES (138, 'TaskManage', 'Task管理', 'task', '/notice/task', 2, 2, 'notice:task:list', 1, 0, '/notice/task/index', 0, 0, 1, 1, '2023-11-24 15:39:24.103', '2023-11-24 15:39:24.103', NULL);
INSERT INTO `sys_menu` VALUES (139, '', 'Task详情', '', 'task_detail', 2, 3, 'notice:task:query', 138, 0, '', 0, 0, 1, 1, '2023-11-24 15:39:24.118', '2023-11-24 15:39:24.118', NULL);
INSERT INTO `sys_menu` VALUES (140, '', 'Task创建', '', 'task_create', 2, 3, 'notice:task:add', 138, 0, '', 0, 0, 1, 1, '2023-11-24 15:39:24.131', '2023-11-24 15:39:24.131', NULL);
INSERT INTO `sys_menu` VALUES (141, '', 'Task修改', '', 'task_update', 2, 3, 'notice:task:edit', 138, 0, '', 0, 0, 1, 1, '2023-11-24 15:39:24.142', '2023-11-24 15:39:24.142', NULL);
INSERT INTO `sys_menu` VALUES (142, '', 'Task删除', '', 'task_del', 2, 3, 'notice:task:remove', 138, 0, '', 0, 0, 1, 1, '2023-11-24 15:39:24.155', '2023-11-24 15:39:24.155', NULL);
INSERT INTO `sys_menu` VALUES (143, 'AiChat', 'AiChat', 'ai', '/ai/chat', 2, 2, 'ai:chat', 1, 0, '/ai/chat/index', 123, 0, 1, 1, '2023-11-27 21:09:36.000', '2024-05-24 23:20:02.083', NULL);
INSERT INTO `sys_menu` VALUES (144, NULL, '账单统计导出', NULL, 'st_bill_export', 2, 3, 'st:bill:export', 63, 0, '/st/bill/export', 0, 0, 1, 1, '2023-12-09 11:21:15.000', '2024-05-24 23:36:27.429', NULL);
INSERT INTO `sys_menu` VALUES (145, NULL, '账单导出', NULL, 'bill_export', 2, 3, 'bill:export', 108, 0, '/bill/export', 0, 0, 1, 1, '2023-12-09 16:58:57.000', '2024-05-24 23:38:17.739', NULL);
INSERT INTO `sys_menu` VALUES (213, NULL, '占比统计导出', NULL, 'st_bill_exportrate', 2, 3, 'st:bill:exportrate', 108, 0, '/st/bill/exportrate', 0, 0, 1, 1, '2023-12-09 11:21:15.000', '2024-05-24 23:38:41.908', NULL);

-- ----------------------------
-- Table structure for sys_menu_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_api_rule`;
CREATE TABLE `sys_menu_api_rule`  (
  `sys_menu_id` int UNSIGNED NOT NULL COMMENT '主键',
  `sys_api_id` int UNSIGNED NOT NULL COMMENT '主键编码',
  PRIMARY KEY (`sys_menu_id`, `sys_api_id`) USING BTREE,
  INDEX `fk_sys_menu_api_rule_sys_api`(`sys_api_id` ASC) USING BTREE,
  CONSTRAINT `fk_sys_menu_api_rule_sys_api` FOREIGN KEY (`sys_api_id`) REFERENCES `sys_api` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sys_menu_api_rule_sys_menu` FOREIGN KEY (`sys_menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu_api_rule
-- ----------------------------
INSERT INTO `sys_menu_api_rule` VALUES (2, 1);
INSERT INTO `sys_menu_api_rule` VALUES (3, 2);
INSERT INTO `sys_menu_api_rule` VALUES (4, 3);
INSERT INTO `sys_menu_api_rule` VALUES (5, 4);
INSERT INTO `sys_menu_api_rule` VALUES (6, 5);
INSERT INTO `sys_menu_api_rule` VALUES (7, 6);
INSERT INTO `sys_menu_api_rule` VALUES (8, 7);
INSERT INTO `sys_menu_api_rule` VALUES (9, 8);
INSERT INTO `sys_menu_api_rule` VALUES (10, 9);
INSERT INTO `sys_menu_api_rule` VALUES (11, 10);
INSERT INTO `sys_menu_api_rule` VALUES (12, 11);
INSERT INTO `sys_menu_api_rule` VALUES (13, 12);
INSERT INTO `sys_menu_api_rule` VALUES (14, 13);
INSERT INTO `sys_menu_api_rule` VALUES (15, 14);
INSERT INTO `sys_menu_api_rule` VALUES (16, 15);
INSERT INTO `sys_menu_api_rule` VALUES (17, 16);
INSERT INTO `sys_menu_api_rule` VALUES (18, 17);
INSERT INTO `sys_menu_api_rule` VALUES (19, 18);
INSERT INTO `sys_menu_api_rule` VALUES (20, 19);
INSERT INTO `sys_menu_api_rule` VALUES (21, 20);
INSERT INTO `sys_menu_api_rule` VALUES (57, 26);
INSERT INTO `sys_menu_api_rule` VALUES (58, 27);
INSERT INTO `sys_menu_api_rule` VALUES (59, 28);
INSERT INTO `sys_menu_api_rule` VALUES (60, 29);
INSERT INTO `sys_menu_api_rule` VALUES (61, 30);
INSERT INTO `sys_menu_api_rule` VALUES (52, 31);
INSERT INTO `sys_menu_api_rule` VALUES (53, 32);
INSERT INTO `sys_menu_api_rule` VALUES (54, 33);
INSERT INTO `sys_menu_api_rule` VALUES (55, 34);
INSERT INTO `sys_menu_api_rule` VALUES (56, 35);
INSERT INTO `sys_menu_api_rule` VALUES (63, 36);
INSERT INTO `sys_menu_api_rule` VALUES (64, 37);
INSERT INTO `sys_menu_api_rule` VALUES (65, 38);
INSERT INTO `sys_menu_api_rule` VALUES (66, 39);
INSERT INTO `sys_menu_api_rule` VALUES (67, 40);
INSERT INTO `sys_menu_api_rule` VALUES (68, 41);
INSERT INTO `sys_menu_api_rule` VALUES (69, 42);
INSERT INTO `sys_menu_api_rule` VALUES (70, 43);
INSERT INTO `sys_menu_api_rule` VALUES (71, 44);
INSERT INTO `sys_menu_api_rule` VALUES (72, 45);
INSERT INTO `sys_menu_api_rule` VALUES (73, 46);
INSERT INTO `sys_menu_api_rule` VALUES (74, 47);
INSERT INTO `sys_menu_api_rule` VALUES (75, 48);
INSERT INTO `sys_menu_api_rule` VALUES (76, 49);
INSERT INTO `sys_menu_api_rule` VALUES (77, 50);
INSERT INTO `sys_menu_api_rule` VALUES (78, 51);
INSERT INTO `sys_menu_api_rule` VALUES (79, 52);
INSERT INTO `sys_menu_api_rule` VALUES (80, 53);
INSERT INTO `sys_menu_api_rule` VALUES (81, 54);
INSERT INTO `sys_menu_api_rule` VALUES (82, 55);
INSERT INTO `sys_menu_api_rule` VALUES (83, 56);
INSERT INTO `sys_menu_api_rule` VALUES (84, 57);
INSERT INTO `sys_menu_api_rule` VALUES (85, 58);
INSERT INTO `sys_menu_api_rule` VALUES (86, 59);
INSERT INTO `sys_menu_api_rule` VALUES (87, 60);
INSERT INTO `sys_menu_api_rule` VALUES (88, 61);
INSERT INTO `sys_menu_api_rule` VALUES (89, 62);
INSERT INTO `sys_menu_api_rule` VALUES (90, 63);
INSERT INTO `sys_menu_api_rule` VALUES (93, 64);
INSERT INTO `sys_menu_api_rule` VALUES (94, 65);
INSERT INTO `sys_menu_api_rule` VALUES (95, 66);
INSERT INTO `sys_menu_api_rule` VALUES (96, 67);
INSERT INTO `sys_menu_api_rule` VALUES (97, 68);
INSERT INTO `sys_menu_api_rule` VALUES (103, 74);
INSERT INTO `sys_menu_api_rule` VALUES (104, 75);
INSERT INTO `sys_menu_api_rule` VALUES (105, 76);
INSERT INTO `sys_menu_api_rule` VALUES (106, 77);
INSERT INTO `sys_menu_api_rule` VALUES (107, 78);
INSERT INTO `sys_menu_api_rule` VALUES (109, 79);
INSERT INTO `sys_menu_api_rule` VALUES (12, 80);
INSERT INTO `sys_menu_api_rule` VALUES (111, 81);
INSERT INTO `sys_menu_api_rule` VALUES (112, 82);
INSERT INTO `sys_menu_api_rule` VALUES (113, 83);
INSERT INTO `sys_menu_api_rule` VALUES (114, 84);
INSERT INTO `sys_menu_api_rule` VALUES (115, 85);
INSERT INTO `sys_menu_api_rule` VALUES (117, 86);
INSERT INTO `sys_menu_api_rule` VALUES (118, 87);
INSERT INTO `sys_menu_api_rule` VALUES (119, 88);
INSERT INTO `sys_menu_api_rule` VALUES (120, 89);
INSERT INTO `sys_menu_api_rule` VALUES (121, 90);
INSERT INTO `sys_menu_api_rule` VALUES (123, 92);
INSERT INTO `sys_menu_api_rule` VALUES (124, 93);
INSERT INTO `sys_menu_api_rule` VALUES (126, 94);
INSERT INTO `sys_menu_api_rule` VALUES (127, 95);
INSERT INTO `sys_menu_api_rule` VALUES (128, 96);
INSERT INTO `sys_menu_api_rule` VALUES (129, 97);
INSERT INTO `sys_menu_api_rule` VALUES (130, 98);
INSERT INTO `sys_menu_api_rule` VALUES (132, 99);
INSERT INTO `sys_menu_api_rule` VALUES (133, 100);
INSERT INTO `sys_menu_api_rule` VALUES (134, 101);
INSERT INTO `sys_menu_api_rule` VALUES (135, 102);
INSERT INTO `sys_menu_api_rule` VALUES (136, 103);
INSERT INTO `sys_menu_api_rule` VALUES (138, 104);
INSERT INTO `sys_menu_api_rule` VALUES (139, 105);
INSERT INTO `sys_menu_api_rule` VALUES (140, 106);
INSERT INTO `sys_menu_api_rule` VALUES (141, 107);
INSERT INTO `sys_menu_api_rule` VALUES (142, 108);
INSERT INTO `sys_menu_api_rule` VALUES (144, 109);
INSERT INTO `sys_menu_api_rule` VALUES (145, 110);
INSERT INTO `sys_menu_api_rule` VALUES (213, 166);

-- ----------------------------
-- Table structure for sys_opera_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_opera_log`;
CREATE TABLE `sys_opera_log`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作模块',
  `business_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作类型',
  `business_types` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'BusinessTypes',
  `method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '函数',
  `request_method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求方式 GET POST PUT DELETE',
  `operator_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作类型',
  `oper_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作者',
  `dept_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问地址',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户端ip',
  `oper_location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问位置',
  `oper_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '请求参数',
  `status` tinyint NULL DEFAULT NULL COMMENT '操作状态 1:成功 2:失败',
  `oper_time` datetime(3) NULL DEFAULT NULL COMMENT '操作时间',
  `json_result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '返回数据',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `latency_time` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '耗时',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ua',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_opera_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色代码',
  `role_sort` int UNSIGNED NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `team_id` tinyint(1) NULL DEFAULT NULL COMMENT '团队',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` int UNSIGNED NULL DEFAULT NULL COMMENT '创建者',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  `deleted_at` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_role_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理', 'superadmin', NULL, NULL, -1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role` VALUES (5, 'test1', 'test1', 0, 0, 1, 'string', 0, 2, '2023-11-15 11:25:21.346', '2023-11-15 16:31:21.931', NULL);
INSERT INTO `sys_role` VALUES (6, 'test2', 'test2', 0, 0, 1, 'string', 2, 2, '2023-11-15 13:38:10.292', '2023-11-15 16:31:07.397', NULL);
INSERT INTO `sys_role` VALUES (7, 'test3', 'test3', 0, 0, 1, 'string', 2, 2, '2023-11-15 14:06:39.197', '2023-11-15 17:05:39.289', NULL);
INSERT INTO `sys_role` VALUES (8, '角色1', 'test4', 0, 1, 1, '', 2, 0, '2023-11-15 16:33:01.325', '2023-11-15 16:33:01.325', NULL);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int UNSIGNED NOT NULL COMMENT '主键',
  `menu_id` int UNSIGNED NOT NULL COMMENT '主键',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `fk_sys_role_menu_sys_menu`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `fk_sys_role_menu_sys_menu` FOREIGN KEY (`menu_id`) REFERENCES `sys_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_sys_role_menu_sys_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (5, 1);
INSERT INTO `sys_role_menu` VALUES (6, 1);
INSERT INTO `sys_role_menu` VALUES (7, 1);
INSERT INTO `sys_role_menu` VALUES (8, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (7, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (7, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (7, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (7, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (7, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (7, 8);
INSERT INTO `sys_role_menu` VALUES (7, 9);
INSERT INTO `sys_role_menu` VALUES (7, 10);
INSERT INTO `sys_role_menu` VALUES (7, 11);
INSERT INTO `sys_role_menu` VALUES (5, 12);
INSERT INTO `sys_role_menu` VALUES (6, 12);
INSERT INTO `sys_role_menu` VALUES (8, 12);
INSERT INTO `sys_role_menu` VALUES (5, 13);
INSERT INTO `sys_role_menu` VALUES (6, 13);
INSERT INTO `sys_role_menu` VALUES (8, 13);
INSERT INTO `sys_role_menu` VALUES (5, 14);
INSERT INTO `sys_role_menu` VALUES (8, 14);
INSERT INTO `sys_role_menu` VALUES (5, 15);
INSERT INTO `sys_role_menu` VALUES (8, 15);
INSERT INTO `sys_role_menu` VALUES (5, 16);
INSERT INTO `sys_role_menu` VALUES (8, 16);
INSERT INTO `sys_role_menu` VALUES (5, 17);
INSERT INTO `sys_role_menu` VALUES (7, 17);
INSERT INTO `sys_role_menu` VALUES (8, 17);
INSERT INTO `sys_role_menu` VALUES (5, 18);
INSERT INTO `sys_role_menu` VALUES (7, 18);
INSERT INTO `sys_role_menu` VALUES (8, 18);
INSERT INTO `sys_role_menu` VALUES (5, 19);
INSERT INTO `sys_role_menu` VALUES (7, 19);
INSERT INTO `sys_role_menu` VALUES (8, 19);
INSERT INTO `sys_role_menu` VALUES (7, 20);
INSERT INTO `sys_role_menu` VALUES (8, 20);
INSERT INTO `sys_role_menu` VALUES (7, 21);
INSERT INTO `sys_role_menu` VALUES (8, 21);
INSERT INTO `sys_role_menu` VALUES (7, 52);
INSERT INTO `sys_role_menu` VALUES (7, 53);
INSERT INTO `sys_role_menu` VALUES (7, 54);
INSERT INTO `sys_role_menu` VALUES (7, 55);
INSERT INTO `sys_role_menu` VALUES (7, 56);
INSERT INTO `sys_role_menu` VALUES (7, 57);
INSERT INTO `sys_role_menu` VALUES (8, 57);
INSERT INTO `sys_role_menu` VALUES (7, 58);
INSERT INTO `sys_role_menu` VALUES (8, 58);
INSERT INTO `sys_role_menu` VALUES (7, 59);
INSERT INTO `sys_role_menu` VALUES (8, 59);
INSERT INTO `sys_role_menu` VALUES (7, 60);
INSERT INTO `sys_role_menu` VALUES (8, 60);
INSERT INTO `sys_role_menu` VALUES (7, 61);
INSERT INTO `sys_role_menu` VALUES (8, 61);
INSERT INTO `sys_role_menu` VALUES (7, 111);
INSERT INTO `sys_role_menu` VALUES (8, 111);
INSERT INTO `sys_role_menu` VALUES (7, 112);
INSERT INTO `sys_role_menu` VALUES (8, 112);
INSERT INTO `sys_role_menu` VALUES (7, 113);
INSERT INTO `sys_role_menu` VALUES (8, 113);
INSERT INTO `sys_role_menu` VALUES (7, 114);
INSERT INTO `sys_role_menu` VALUES (8, 114);
INSERT INTO `sys_role_menu` VALUES (7, 115);
INSERT INTO `sys_role_menu` VALUES (8, 115);
INSERT INTO `sys_role_menu` VALUES (7, 117);
INSERT INTO `sys_role_menu` VALUES (8, 117);
INSERT INTO `sys_role_menu` VALUES (7, 118);
INSERT INTO `sys_role_menu` VALUES (8, 118);
INSERT INTO `sys_role_menu` VALUES (7, 119);
INSERT INTO `sys_role_menu` VALUES (8, 119);
INSERT INTO `sys_role_menu` VALUES (7, 120);
INSERT INTO `sys_role_menu` VALUES (8, 120);
INSERT INTO `sys_role_menu` VALUES (7, 121);
INSERT INTO `sys_role_menu` VALUES (8, 121);

-- ----------------------------
-- Table structure for sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `sys_sms`;
CREATE TABLE `sys_sms`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `code` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '验证码',
  `type` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `use_status` tinyint NULL DEFAULT NULL COMMENT '使用状态',
  `created_at` int UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int UNSIGNED NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sms
-- ----------------------------

-- ----------------------------
-- Table structure for sys_team
-- ----------------------------
DROP TABLE IF EXISTS `sys_team`;
CREATE TABLE `sys_team`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '团队名',
  `owner` int UNSIGNED NULL DEFAULT NULL COMMENT '团队拥有者',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态',
  `created_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_team
-- ----------------------------
INSERT INTO `sys_team` VALUES (-1, 'dilu管理系统', 1, 2, '2024-05-26 10:43:09', '2024-05-26 10:43:13');
INSERT INTO `sys_team` VALUES (1, '好牙销售管理系统', 2, 2, '2023-09-30 00:22:43', '2024-05-24 22:55:41');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '签名',
  `birthday` date NULL DEFAULT NULL COMMENT '生日 格式 yyyy-MM-dd',
  `gender` tinyint(1) NULL DEFAULT 2 COMMENT '性别 1男 2女 3未知',
  `platform_role_id` mediumint NULL DEFAULT NULL COMMENT '平台角色ID 大于0为平台账户,0为团队账户',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `lock_time` datetime(3) NULL DEFAULT NULL COMMENT '锁定结束时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态 1正常 ',
  `update_by` int UNSIGNED NULL DEFAULT NULL COMMENT '更新者',
  `created_at` datetime(3) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(3) NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sys_user_update_by`(`update_by` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'dilu', '', NULL, '$2a$10$2OxaPJviu7NMSKMk5c2mPOvvb41Xg5ZiQB0153QpB77THK4sIXF1a', 'dilu', 'dilu', NULL, NULL, NULL, 2, -1, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 'tangtang', '13800138001', NULL, '$2a$10$hpISaioe30s6d3LYPdFaw.23rm29Yw9a44t8hl9G.tCNYKYoA72iW', '糖糖', '小唐', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, '2023-11-18 20:35:24.140');
INSERT INTO `sys_user` VALUES (3, 'zcm', NULL, NULL, '$2a$10$8ZbmdrNu22DMnRFDjfBugOwvK0fVOixMX.AAeLFbgOkjS9frXHjVW', '小梅', '小梅', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, '2023-11-12 19:59:39.849');
INSERT INTO `sys_user` VALUES (4, 'liyanlei', NULL, NULL, '$2a$10$sPJOyDdh/J4OFVa27z4LCuz2xtu3KwhyNegkp27hL.G9D3xMMYoKW', '阿雷', '阿雷', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, 1, NULL, '2023-11-12 20:03:10.441');
INSERT INTO `sys_user` VALUES (5, NULL, NULL, NULL, NULL, '小丽', '小丽', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (6, NULL, NULL, NULL, NULL, '小珊', '小珊', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (7, NULL, NULL, NULL, NULL, '大雁', '大雁', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (8, 'dajin', '', '', '$2a$10$hpISaioe30s6d3LYPdFaw.23rm29Yw9a44t8hl9G.tCNYKYoA72iW', '大金', '大金', '', NULL, NULL, 2, 0, '', NULL, 1, 0, '2023-11-30 22:54:28.914', '2023-11-30 22:54:28.914');
INSERT INTO `sys_user` VALUES (9, 'xiaoqi', NULL, NULL, NULL, '小琪', '小琪', NULL, NULL, NULL, 2, NULL, NULL, NULL, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for third_login
-- ----------------------------
DROP TABLE IF EXISTS `third_login`;
CREATE TABLE `third_login`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键编码',
  `user_id` int UNSIGNED NULL DEFAULT NULL COMMENT '用户id',
  `platform` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '平台 1 微信 2 钉钉',
  `open_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方open_id',
  `union_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '第三方union_id',
  `third_data` json NULL COMMENT '第三方返回数据',
  `created_at` int UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` int UNSIGNED NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '三方登录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of third_login
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
