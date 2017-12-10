/*
Navicat MySQL Data Transfer

Source Server         : cike.app
Source Server Version : 50717
Source Host           : cike.app:33060
Source Database       : cike

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-10 13:55:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ck_categories`
-- ----------------------------
DROP TABLE IF EXISTS `ck_categories`;
CREATE TABLE `ck_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `ck_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_categories
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_comments`
-- ----------------------------
DROP TABLE IF EXISTS `ck_comments`;
CREATE TABLE `ck_comments` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `referece` int(11) NOT NULL,
  `id_cms` int(11) NOT NULL,
  `comment` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_data_rows`
-- ----------------------------
DROP TABLE IF EXISTS `ck_data_rows`;
CREATE TABLE `ck_data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `ck_data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_data_rows
-- ----------------------------
INSERT INTO `ck_data_rows` VALUES ('1', '1', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('2', '1', 'author_id', 'text', 'Author', '1', '0', '1', '1', '0', '1', '', '2');
INSERT INTO `ck_data_rows` VALUES ('3', '1', 'category_id', 'text', 'Category', '1', '0', '1', '1', '1', '0', '', '3');
INSERT INTO `ck_data_rows` VALUES ('4', '1', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '', '4');
INSERT INTO `ck_data_rows` VALUES ('5', '1', 'excerpt', 'text_area', 'excerpt', '1', '0', '1', '1', '1', '1', '', '5');
INSERT INTO `ck_data_rows` VALUES ('6', '1', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', '', '6');
INSERT INTO `ck_data_rows` VALUES ('7', '1', 'image', 'image', 'Post Image', '0', '1', '1', '1', '1', '1', '\n{\n    \"resize\": {\n        \"width\": \"1000\",\n        \"height\": \"null\"\n    },\n    \"quality\": \"70%\",\n    \"upsize\": true,\n    \"thumbnails\": [\n        {\n            \"name\": \"medium\",\n            \"scale\": \"50%\"\n        },\n        {\n            \"name\": \"small\",\n            \"scale\": \"25%\"\n        },\n        {\n            \"name\": \"cropped\",\n            \"crop\": {\n                \"width\": \"300\",\n                \"height\": \"250\"\n            }\n        }\n    ]\n}', '7');
INSERT INTO `ck_data_rows` VALUES ('8', '1', 'slug', 'text', 'slug', '1', '0', '1', '1', '1', '1', '\n{\n    \"slugify\": {\n        \"origin\": \"title\",\n        \"forceUpdate\": true\n    }\n}', '8');
INSERT INTO `ck_data_rows` VALUES ('9', '1', 'meta_description', 'text_area', 'meta_description', '1', '0', '1', '1', '1', '1', '', '9');
INSERT INTO `ck_data_rows` VALUES ('10', '1', 'meta_keywords', 'text_area', 'meta_keywords', '1', '0', '1', '1', '1', '1', '', '10');
INSERT INTO `ck_data_rows` VALUES ('11', '1', 'status', 'select_dropdown', 'status', '1', '1', '1', '1', '1', '1', '\n{\n    \"default\": \"DRAFT\",\n    \"options\": {\n        \"PUBLISHED\": \"published\",\n        \"DRAFT\": \"draft\",\n        \"PENDING\": \"pending\"\n    }\n}', '11');
INSERT INTO `ck_data_rows` VALUES ('12', '1', 'created_at', 'timestamp', 'created_at', '0', '1', '1', '0', '0', '0', '', '12');
INSERT INTO `ck_data_rows` VALUES ('13', '1', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '13');
INSERT INTO `ck_data_rows` VALUES ('14', '2', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('15', '2', 'author_id', 'text', 'author_id', '1', '0', '0', '0', '0', '0', '', '2');
INSERT INTO `ck_data_rows` VALUES ('16', '2', 'title', 'text', 'title', '1', '1', '1', '1', '1', '1', '', '3');
INSERT INTO `ck_data_rows` VALUES ('17', '2', 'excerpt', 'text_area', 'excerpt', '1', '0', '1', '1', '1', '1', '', '4');
INSERT INTO `ck_data_rows` VALUES ('18', '2', 'body', 'rich_text_box', 'body', '1', '0', '1', '1', '1', '1', '', '5');
INSERT INTO `ck_data_rows` VALUES ('19', '2', 'slug', 'text', 'slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"title\"}}', '6');
INSERT INTO `ck_data_rows` VALUES ('20', '2', 'meta_description', 'text', 'meta_description', '1', '0', '1', '1', '1', '1', '', '7');
INSERT INTO `ck_data_rows` VALUES ('21', '2', 'meta_keywords', 'text', 'meta_keywords', '1', '0', '1', '1', '1', '1', '', '8');
INSERT INTO `ck_data_rows` VALUES ('22', '2', 'status', 'select_dropdown', 'status', '1', '1', '1', '1', '1', '1', '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', '9');
INSERT INTO `ck_data_rows` VALUES ('23', '2', 'created_at', 'timestamp', 'created_at', '1', '1', '1', '0', '0', '0', '', '10');
INSERT INTO `ck_data_rows` VALUES ('24', '2', 'updated_at', 'timestamp', 'updated_at', '1', '0', '0', '0', '0', '0', '', '11');
INSERT INTO `ck_data_rows` VALUES ('25', '2', 'image', 'image', 'image', '0', '1', '1', '1', '1', '1', '', '12');
INSERT INTO `ck_data_rows` VALUES ('26', '3', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('27', '3', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `ck_data_rows` VALUES ('28', '3', 'email', 'text', 'email', '1', '1', '1', '1', '1', '1', '', '3');
INSERT INTO `ck_data_rows` VALUES ('29', '3', 'password', 'password', 'password', '1', '0', '0', '1', '1', '0', '', '4');
INSERT INTO `ck_data_rows` VALUES ('30', '3', 'remember_token', 'text', 'remember_token', '0', '0', '0', '0', '0', '0', '', '5');
INSERT INTO `ck_data_rows` VALUES ('31', '3', 'created_at', 'timestamp', 'created_at', '0', '1', '1', '0', '0', '0', '', '6');
INSERT INTO `ck_data_rows` VALUES ('32', '3', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '7');
INSERT INTO `ck_data_rows` VALUES ('33', '3', 'avatar', 'image', 'avatar', '0', '1', '1', '1', '1', '1', '', '8');
INSERT INTO `ck_data_rows` VALUES ('34', '5', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('35', '5', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `ck_data_rows` VALUES ('36', '5', 'created_at', 'timestamp', 'created_at', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `ck_data_rows` VALUES ('37', '5', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `ck_data_rows` VALUES ('38', '4', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('39', '4', 'parent_id', 'select_dropdown', 'parent_id', '0', '0', '1', '1', '1', '1', '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', '2');
INSERT INTO `ck_data_rows` VALUES ('40', '4', 'order', 'text', 'order', '1', '1', '1', '1', '1', '1', '{\"default\":1}', '3');
INSERT INTO `ck_data_rows` VALUES ('41', '4', 'name', 'text', 'name', '1', '1', '1', '1', '1', '1', '', '4');
INSERT INTO `ck_data_rows` VALUES ('42', '4', 'slug', 'text', 'slug', '1', '1', '1', '1', '1', '1', '', '5');
INSERT INTO `ck_data_rows` VALUES ('43', '4', 'created_at', 'timestamp', 'created_at', '0', '0', '1', '0', '0', '0', '', '6');
INSERT INTO `ck_data_rows` VALUES ('44', '4', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '7');
INSERT INTO `ck_data_rows` VALUES ('45', '6', 'id', 'number', 'id', '1', '0', '0', '0', '0', '0', '', '1');
INSERT INTO `ck_data_rows` VALUES ('46', '6', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', '', '2');
INSERT INTO `ck_data_rows` VALUES ('47', '6', 'created_at', 'timestamp', 'created_at', '0', '0', '0', '0', '0', '0', '', '3');
INSERT INTO `ck_data_rows` VALUES ('48', '6', 'updated_at', 'timestamp', 'updated_at', '0', '0', '0', '0', '0', '0', '', '4');
INSERT INTO `ck_data_rows` VALUES ('49', '6', 'display_name', 'text', 'Display Name', '1', '1', '1', '1', '1', '1', '', '5');
INSERT INTO `ck_data_rows` VALUES ('50', '1', 'seo_title', 'text', 'seo_title', '0', '1', '1', '1', '1', '1', '', '14');
INSERT INTO `ck_data_rows` VALUES ('51', '1', 'featured', 'checkbox', 'featured', '1', '1', '1', '1', '1', '1', '', '15');
INSERT INTO `ck_data_rows` VALUES ('52', '3', 'role_id', 'text', 'role_id', '1', '1', '1', '1', '1', '1', '', '9');

-- ----------------------------
-- Table structure for `ck_data_types`
-- ----------------------------
DROP TABLE IF EXISTS `ck_data_types`;
CREATE TABLE `ck_data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_data_types
-- ----------------------------
INSERT INTO `ck_data_types` VALUES ('1', 'posts', 'posts', '文章', '文章', 'voyager-news', 'TCG\\Voyager\\Models\\Post', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_data_types` VALUES ('2', 'pages', 'pages', '单面', '单面', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_data_types` VALUES ('3', 'users', 'users', '用户', '用户', 'voyager-person', 'TCG\\Voyager\\Models\\User', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_data_types` VALUES ('4', 'categories', 'categories', '分类', '分类', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_data_types` VALUES ('5', 'menus', 'menus', '菜单', '菜单', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_data_types` VALUES ('6', 'roles', 'roles', '角色', '角色', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', '', '', '1', '0', '2017-05-18 11:22:33', '2017-05-18 11:22:33');

-- ----------------------------
-- Table structure for `ck_guest_users`
-- ----------------------------
DROP TABLE IF EXISTS `ck_guest_users`;
CREATE TABLE `ck_guest_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `guest_users_uid_unique` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_guest_users
-- ----------------------------
INSERT INTO `ck_guest_users` VALUES ('1', 'asdsdfdffasdffffasdfasdfadsfadsfadsfasdfadsf', '魁梧的小丸子', '2017-11-26 14:25:46', '2017-11-26 14:25:46');

-- ----------------------------
-- Table structure for `ck_likes`
-- ----------------------------
DROP TABLE IF EXISTS `ck_likes`;
CREATE TABLE `ck_likes` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `level` tinyint(1) NOT NULL,
  `id_cms` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_like`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_likes
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_menu_items`
-- ----------------------------
DROP TABLE IF EXISTS `ck_menu_items`;
CREATE TABLE `ck_menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `ck_menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_menu_items
-- ----------------------------
INSERT INTO `ck_menu_items` VALUES ('1', '1', '控制面板', '/admin', '_self', 'voyager-boat', '#000000', null, '1', '2017-05-18 11:22:33', '2017-05-19 01:49:30', null, '');
INSERT INTO `ck_menu_items` VALUES ('2', '1', '媒体', '/admin/media', '_self', 'voyager-images', '#000000', null, '4', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');
INSERT INTO `ck_menu_items` VALUES ('3', '1', '文章', '/admin/posts', '_self', 'voyager-news', '#000000', null, '5', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');
INSERT INTO `ck_menu_items` VALUES ('4', '1', '用户管理', '/admin/users', '_self', 'voyager-person', '#000000', null, '3', '2017-05-18 11:22:33', '2017-05-19 01:49:49', null, '');
INSERT INTO `ck_menu_items` VALUES ('5', '1', '分类', '/admin/categories', '_self', 'voyager-categories', '#000000', null, '7', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');
INSERT INTO `ck_menu_items` VALUES ('6', '1', '单页', '/admin/pages', '_self', 'voyager-file-text', '#000000', null, '6', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');
INSERT INTO `ck_menu_items` VALUES ('7', '1', '角色', '/admin/roles', '_self', 'voyager-lock', '#000000', null, '2', '2017-05-18 11:22:33', '2017-05-19 01:49:40', null, '');
INSERT INTO `ck_menu_items` VALUES ('8', '1', '工具', '', '_self', 'voyager-tools', '#000000', null, '8', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');
INSERT INTO `ck_menu_items` VALUES ('9', '1', '生成菜单', '/admin/menus', '_self', 'voyager-list', '#000000', '8', '1', '2017-05-18 11:22:33', '2017-05-19 01:51:09', null, '');
INSERT INTO `ck_menu_items` VALUES ('10', '1', '数据库', '/admin/database', '_self', 'voyager-data', '#000000', '8', '2', '2017-05-18 11:22:33', '2017-05-19 01:51:18', null, '');
INSERT INTO `ck_menu_items` VALUES ('11', '1', '设置', '/admin/settings', '_self', 'voyager-settings', '#000000', null, '9', '2017-05-18 11:22:33', '2017-05-19 01:50:46', null, '');

-- ----------------------------
-- Table structure for `ck_menus`
-- ----------------------------
DROP TABLE IF EXISTS `ck_menus`;
CREATE TABLE `ck_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_menus
-- ----------------------------
INSERT INTO `ck_menus` VALUES ('1', 'admin', '2017-05-18 11:22:33', '2017-05-18 11:22:33');

-- ----------------------------
-- Table structure for `ck_messages`
-- ----------------------------
DROP TABLE IF EXISTS `ck_messages`;
CREATE TABLE `ck_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `unique_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `has_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `messages_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_messages
-- ----------------------------
INSERT INTO `ck_messages` VALUES ('1', '1', '987984756', '如果生活抛弃了你，不要悲伤，那是什么玩意呢！', '1', '1', '2017-11-26 15:50:27', '2017-11-26 15:50:30');

-- ----------------------------
-- Table structure for `ck_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `ck_migrations`;
CREATE TABLE `ck_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_migrations
-- ----------------------------
INSERT INTO `ck_migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `ck_migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `ck_migrations` VALUES ('3', '2016_06_01_000001_create_oauth_auth_codes_table', '1');
INSERT INTO `ck_migrations` VALUES ('4', '2016_06_01_000002_create_oauth_access_tokens_table', '1');
INSERT INTO `ck_migrations` VALUES ('5', '2016_06_01_000003_create_oauth_refresh_tokens_table', '1');
INSERT INTO `ck_migrations` VALUES ('6', '2016_06_01_000004_create_oauth_clients_table', '1');
INSERT INTO `ck_migrations` VALUES ('7', '2016_06_01_000005_create_oauth_personal_access_clients_table', '1');
INSERT INTO `ck_migrations` VALUES ('19', '2016_01_01_000000_add_voyager_user_fields', '2');
INSERT INTO `ck_migrations` VALUES ('20', '2016_01_01_000000_create_data_types_table', '2');
INSERT INTO `ck_migrations` VALUES ('21', '2016_01_01_000000_create_pages_table', '2');
INSERT INTO `ck_migrations` VALUES ('22', '2016_01_01_000000_create_posts_table', '2');
INSERT INTO `ck_migrations` VALUES ('23', '2016_02_15_204651_create_categories_table', '2');
INSERT INTO `ck_migrations` VALUES ('24', '2016_05_19_173453_create_menu_table', '2');
INSERT INTO `ck_migrations` VALUES ('25', '2016_10_21_190000_create_roles_table', '2');
INSERT INTO `ck_migrations` VALUES ('26', '2016_10_21_190000_create_settings_table', '2');
INSERT INTO `ck_migrations` VALUES ('27', '2016_11_30_135954_create_permission_table', '2');
INSERT INTO `ck_migrations` VALUES ('28', '2016_11_30_141208_create_permission_role_table', '2');
INSERT INTO `ck_migrations` VALUES ('29', '2016_12_26_201236_data_types__add__server_side', '2');
INSERT INTO `ck_migrations` VALUES ('30', '2017_01_13_000000_add_route_to_menu_items_table', '2');
INSERT INTO `ck_migrations` VALUES ('31', '2017_01_14_005015_create_translations_table', '2');
INSERT INTO `ck_migrations` VALUES ('32', '2017_01_15_000000_add_permission_group_id_to_permissions_table', '2');
INSERT INTO `ck_migrations` VALUES ('33', '2017_01_15_000000_create_permission_groups_table', '2');
INSERT INTO `ck_migrations` VALUES ('34', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '2');
INSERT INTO `ck_migrations` VALUES ('35', '2017_03_06_000000_add_controller_to_data_types_table', '2');
INSERT INTO `ck_migrations` VALUES ('36', '2017_04_21_000000_add_order_to_data_rows_table', '2');
INSERT INTO `ck_migrations` VALUES ('40', '2017_11_26_093951_create_guest_users_table', '3');
INSERT INTO `ck_migrations` VALUES ('45', '2017_11_26_150038_create_messages_table', '4');

-- ----------------------------
-- Table structure for `ck_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `ck_mobile`;
CREATE TABLE `ck_mobile` (
  `id_mobile` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `os` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `os_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kernel` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uuid` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_mobile
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `ck_oauth_access_tokens`;
CREATE TABLE `ck_oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_oauth_access_tokens
-- ----------------------------
INSERT INTO `ck_oauth_access_tokens` VALUES ('1b9060c7b3ae8b5082f8b25cd825f9644bfca20194740068e7cb2a80ef891a7d77cf457f7120f721', '38', '6', null, '[\"*\"]', '0', '2017-06-29 16:49:39', '2017-06-29 16:49:39', '2018-06-29 16:49:39');
INSERT INTO `ck_oauth_access_tokens` VALUES ('2c30232e2b041821f5c16b27b70c9fe2166b21a5d511069472bc22ec09eeacafd4dfb3a30c9ce3da', '38', '6', null, '[\"*\"]', '0', '2017-06-29 17:50:25', '2017-06-29 17:50:25', '2018-06-29 17:50:25');
INSERT INTO `ck_oauth_access_tokens` VALUES ('3cefa0123cda06774052e8cc808f18d7c4125a7e47c3ec789fd22e70f7a2c8f2541142371758f704', '39', '6', null, '[\"*\"]', '0', '2017-07-04 19:00:00', '2017-07-04 19:00:00', '2018-07-04 19:00:00');
INSERT INTO `ck_oauth_access_tokens` VALUES ('5b8b7cd10bbcabc39bf8570e641967840cf51279323d630ef70a9e59135b8c9b06c2970fbc87c0c6', '38', '6', null, '[]', '0', '2017-07-05 18:44:19', '2017-07-05 18:44:19', '2018-07-05 18:44:19');
INSERT INTO `ck_oauth_access_tokens` VALUES ('8e75da811d83f7310efc002fe828b300c995bf86a50368f14578ce6b80649131d09cedf72b854561', '39', '6', null, '[\"*\"]', '0', '2017-06-29 17:29:02', '2017-06-29 17:29:02', '2018-06-29 17:29:02');
INSERT INTO `ck_oauth_access_tokens` VALUES ('b13a59ec692eae1d31c52460334a54ff1a659a6644f4c140691d81718ea9b3ecb0aef0a3c766f0c2', '39', '6', null, '[\"*\"]', '0', '2017-06-29 17:26:46', '2017-06-29 17:26:46', '2018-06-29 17:26:46');
INSERT INTO `ck_oauth_access_tokens` VALUES ('b67fffe39eb81d2ec7a376db0d2abcb94c5b57b0d5655dba87d1eca4f79430dc9065675ed16fca3c', '39', '6', null, '[\"*\"]', '0', '2017-06-29 17:28:01', '2017-06-29 17:28:01', '2018-06-29 17:28:01');
INSERT INTO `ck_oauth_access_tokens` VALUES ('c6d74bccd10e47bdbe92286832ecf2e142c20ab2f2b2ce4590e3285946de449a8a012bc58bb57ca8', '39', '6', null, '[\"*\"]', '0', '2017-07-04 19:04:49', '2017-07-04 19:04:49', '2018-07-04 19:04:49');
INSERT INTO `ck_oauth_access_tokens` VALUES ('d79bc294049abfed25f9680744ce2924c8de21e1ccb4a0900e5558ce5309cdd48f0c00e4b3ddb80a', '39', '6', null, '[\"*\"]', '0', '2017-07-05 18:59:23', '2017-07-05 18:59:23', '2018-07-05 18:59:23');
INSERT INTO `ck_oauth_access_tokens` VALUES ('dcc30bb6f1410ab850a458e141e432dfacaada87ab216e6cb95d791a44d6617998af2069b41e6ae2', '38', '6', null, '[\"*\"]', '0', '2017-06-29 17:48:47', '2017-06-29 17:48:47', '2018-06-29 17:48:47');
INSERT INTO `ck_oauth_access_tokens` VALUES ('dcd1ff0138d62cbfa42e495855e0154659e90286ca2efcb1c22304285755c2e6d356896a87cdffd1', '39', '6', null, '[\"*\"]', '0', '2017-06-29 17:51:46', '2017-06-29 17:51:46', '2018-06-29 17:51:46');

-- ----------------------------
-- Table structure for `ck_oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `ck_oauth_auth_codes`;
CREATE TABLE `ck_oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `ck_oauth_clients`;
CREATE TABLE `ck_oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_oauth_clients
-- ----------------------------
INSERT INTO `ck_oauth_clients` VALUES ('4', '2', 'auth', 'mG1fwkO5A2TXJxmGQk7UQ1IdvAGLRdiXQ4oEDgBq', 'http://cike.app:8000/auth/callback', '0', '0', '0', '2017-05-17 08:00:18', '2017-05-17 08:00:18');
INSERT INTO `ck_oauth_clients` VALUES ('5', null, 'Laravel Personal Access Client', 'BUrI2C8AVbSZhAG6UpSVRk9rn2JDrtXdUaWZImMU', 'http://localhost', '1', '0', '0', '2017-05-17 08:31:57', '2017-05-17 08:31:57');
INSERT INTO `ck_oauth_clients` VALUES ('6', null, 'Laravel Password Grant Client', 'ricgvGkY3fQz8sKBGFLsbP3nKrVP5rRgDfz6Qkej', 'http://localhost', '0', '1', '0', '2017-05-17 08:31:57', '2017-05-17 08:31:57');

-- ----------------------------
-- Table structure for `ck_oauth_personal_access_clients`
-- ----------------------------
DROP TABLE IF EXISTS `ck_oauth_personal_access_clients`;
CREATE TABLE `ck_oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_oauth_personal_access_clients
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `ck_oauth_refresh_tokens`;
CREATE TABLE `ck_oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_oauth_refresh_tokens
-- ----------------------------
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('2310f29a37ccfbc421eef67fac3fd9516a4956c9096d1bd5750a7d2c690693bc8cc9d367b9ae4f2a', 'c6d74bccd10e47bdbe92286832ecf2e142c20ab2f2b2ce4590e3285946de449a8a012bc58bb57ca8', '0', '2018-07-04 19:04:49');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('47b2fe37cbb2dfe2f0bfd12904f6c24d4c606b62fc5e08399974d83c6bd99f9b0dfab8074cfd9363', 'dcc30bb6f1410ab850a458e141e432dfacaada87ab216e6cb95d791a44d6617998af2069b41e6ae2', '0', '2018-06-29 17:48:47');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('6e318fe24cfdb7751cc41af6bbfe3e112f2484c7da470fe855af0a19ecd648a962d19d91146793fa', '1b9060c7b3ae8b5082f8b25cd825f9644bfca20194740068e7cb2a80ef891a7d77cf457f7120f721', '0', '2018-06-29 16:49:39');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('73981a649604eb4104fbe94c02d7ca6b8093cdf7300bccf8323122ff70b094db8f41233e91df3eab', '2c30232e2b041821f5c16b27b70c9fe2166b21a5d511069472bc22ec09eeacafd4dfb3a30c9ce3da', '0', '2018-06-29 17:50:25');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('8a0d6d316059a9b343c21e4ef744b1a100a7e3b860e90d8e85e3f3fd6d273bf2f549f47b0f389575', 'd79bc294049abfed25f9680744ce2924c8de21e1ccb4a0900e5558ce5309cdd48f0c00e4b3ddb80a', '0', '2018-07-05 18:59:23');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('8eba3eea37c9122604630b02a504118cdc8f15179066a6e5f8c25334ecaaaa278dcf4c8516e44c93', 'dcd1ff0138d62cbfa42e495855e0154659e90286ca2efcb1c22304285755c2e6d356896a87cdffd1', '0', '2018-06-29 17:51:46');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('a492e219c7d6a48e84f4eca5b89bca2e7f65649ac3e71e7fb986494587caa495c726d823c57dad63', '5b8b7cd10bbcabc39bf8570e641967840cf51279323d630ef70a9e59135b8c9b06c2970fbc87c0c6', '0', '2018-07-05 18:44:19');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('c57ee5c6db6250e89ca09aace7eb59de9435ad56e6f82c7cce344610ead68ed65308c6a4bd133e1a', 'b67fffe39eb81d2ec7a376db0d2abcb94c5b57b0d5655dba87d1eca4f79430dc9065675ed16fca3c', '0', '2018-06-29 17:28:01');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('d52a245885fb43ce26c638d869006113c2cf580b27436f28cda8f774d7a80043ca038bde403ca344', '3cefa0123cda06774052e8cc808f18d7c4125a7e47c3ec789fd22e70f7a2c8f2541142371758f704', '0', '2018-07-04 19:00:00');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('edbacecbd916881cdcb88dcdda64c8f00ee963c7e332d4ca701df4e0a7a9e2585d5ac610a3b60378', '8e75da811d83f7310efc002fe828b300c995bf86a50368f14578ce6b80649131d09cedf72b854561', '0', '2018-06-29 17:29:02');
INSERT INTO `ck_oauth_refresh_tokens` VALUES ('fcf6f92efcf52a15671a309f69ea605adee0a4e52c3738a77f9199cf09d17298a410f8c467ff5c67', 'b13a59ec692eae1d31c52460334a54ff1a659a6644f4c140691d81718ea9b3ecb0aef0a3c766f0c2', '0', '2018-06-29 17:26:46');

-- ----------------------------
-- Table structure for `ck_pages`
-- ----------------------------
DROP TABLE IF EXISTS `ck_pages`;
CREATE TABLE `ck_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8_unicode_ci,
  `body` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci,
  `meta_keywords` text COLLATE utf8_unicode_ci,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_pages
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_permission_groups`
-- ----------------------------
DROP TABLE IF EXISTS `ck_permission_groups`;
CREATE TABLE `ck_permission_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_groups_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_permission_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `ck_permission_role`;
CREATE TABLE `ck_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `ck_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `ck_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_permission_role
-- ----------------------------
INSERT INTO `ck_permission_role` VALUES ('1', '1');
INSERT INTO `ck_permission_role` VALUES ('2', '1');
INSERT INTO `ck_permission_role` VALUES ('3', '1');
INSERT INTO `ck_permission_role` VALUES ('4', '1');
INSERT INTO `ck_permission_role` VALUES ('5', '1');
INSERT INTO `ck_permission_role` VALUES ('6', '1');
INSERT INTO `ck_permission_role` VALUES ('7', '1');
INSERT INTO `ck_permission_role` VALUES ('8', '1');
INSERT INTO `ck_permission_role` VALUES ('9', '1');
INSERT INTO `ck_permission_role` VALUES ('10', '1');
INSERT INTO `ck_permission_role` VALUES ('11', '1');
INSERT INTO `ck_permission_role` VALUES ('12', '1');
INSERT INTO `ck_permission_role` VALUES ('13', '1');
INSERT INTO `ck_permission_role` VALUES ('14', '1');
INSERT INTO `ck_permission_role` VALUES ('15', '1');
INSERT INTO `ck_permission_role` VALUES ('16', '1');
INSERT INTO `ck_permission_role` VALUES ('17', '1');
INSERT INTO `ck_permission_role` VALUES ('18', '1');
INSERT INTO `ck_permission_role` VALUES ('19', '1');
INSERT INTO `ck_permission_role` VALUES ('20', '1');
INSERT INTO `ck_permission_role` VALUES ('21', '1');
INSERT INTO `ck_permission_role` VALUES ('22', '1');
INSERT INTO `ck_permission_role` VALUES ('23', '1');
INSERT INTO `ck_permission_role` VALUES ('24', '1');
INSERT INTO `ck_permission_role` VALUES ('25', '1');
INSERT INTO `ck_permission_role` VALUES ('26', '1');
INSERT INTO `ck_permission_role` VALUES ('27', '1');
INSERT INTO `ck_permission_role` VALUES ('28', '1');
INSERT INTO `ck_permission_role` VALUES ('29', '1');
INSERT INTO `ck_permission_role` VALUES ('30', '1');
INSERT INTO `ck_permission_role` VALUES ('31', '1');
INSERT INTO `ck_permission_role` VALUES ('32', '1');
INSERT INTO `ck_permission_role` VALUES ('33', '1');
INSERT INTO `ck_permission_role` VALUES ('34', '1');

-- ----------------------------
-- Table structure for `ck_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `ck_permissions`;
CREATE TABLE `ck_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_group_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_permissions
-- ----------------------------
INSERT INTO `ck_permissions` VALUES ('1', 'browse_admin', null, '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('2', 'browse_database', null, '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('3', 'browse_media', null, '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('4', 'browse_settings', null, '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('5', 'browse_menus', 'menus', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('6', 'read_menus', 'menus', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('7', 'edit_menus', 'menus', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('8', 'add_menus', 'menus', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('9', 'delete_menus', 'menus', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('10', 'browse_pages', 'pages', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('11', 'read_pages', 'pages', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('12', 'edit_pages', 'pages', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('13', 'add_pages', 'pages', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('14', 'delete_pages', 'pages', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('15', 'browse_roles', 'roles', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('16', 'read_roles', 'roles', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('17', 'edit_roles', 'roles', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('18', 'add_roles', 'roles', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('19', 'delete_roles', 'roles', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('20', 'browse_users', 'users', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('21', 'read_users', 'users', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('22', 'edit_users', 'users', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('23', 'add_users', 'users', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('24', 'delete_users', 'users', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('25', 'browse_posts', 'posts', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('26', 'read_posts', 'posts', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('27', 'edit_posts', 'posts', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('28', 'add_posts', 'posts', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('29', 'delete_posts', 'posts', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('30', 'browse_categories', 'categories', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('31', 'read_categories', 'categories', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('32', 'edit_categories', 'categories', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('33', 'add_categories', 'categories', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);
INSERT INTO `ck_permissions` VALUES ('34', 'delete_categories', 'categories', '2017-05-18 11:22:33', '2017-05-18 11:22:33', null);

-- ----------------------------
-- Table structure for `ck_posts`
-- ----------------------------
DROP TABLE IF EXISTS `ck_posts`;
CREATE TABLE `ck_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_posts
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_roles`
-- ----------------------------
DROP TABLE IF EXISTS `ck_roles`;
CREATE TABLE `ck_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_roles
-- ----------------------------
INSERT INTO `ck_roles` VALUES ('1', 'admin', 'Administrator', '2017-05-18 11:22:33', '2017-05-18 11:22:33');
INSERT INTO `ck_roles` VALUES ('2', 'user', 'Normal User', '2017-05-18 11:22:33', '2017-05-18 11:22:33');

-- ----------------------------
-- Table structure for `ck_settings`
-- ----------------------------
DROP TABLE IF EXISTS `ck_settings`;
CREATE TABLE `ck_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `details` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_settings
-- ----------------------------
INSERT INTO `ck_settings` VALUES ('1', 'admin_title', '网站标题', '此刻', null, 'text', '0');
INSERT INTO `ck_settings` VALUES ('2', 'admin_description', '网站描述', '从你的全世界路过', null, 'text', '1');

-- ----------------------------
-- Table structure for `ck_sms`
-- ----------------------------
DROP TABLE IF EXISTS `ck_sms`;
CREATE TABLE `ck_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `type` varchar(50) NOT NULL COMMENT '发送类型',
  `phone` varchar(50) NOT NULL COMMENT '发送手机',
  `contents` varchar(250) NOT NULL COMMENT '发送内容',
  `code` varchar(50) NOT NULL COMMENT '验证码',
  `code_status` int(2) NOT NULL DEFAULT '0' COMMENT '验证码状态',
  `code_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type` (`type`),
  KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ck_sms
-- ----------------------------
INSERT INTO `ck_sms` VALUES ('1', '0', 'register', '13688045082', '尊敬的用户：您在置上金融网站上的验证码是:7894，请及时输入，工作人员不会向您索取，请勿泄露。', '7894', '0', null, '2017-06-12 09:00:56', '2017-06-12 09:00:56');
INSERT INTO `ck_sms` VALUES ('28', '0', 'register', '13689050228', '尊敬的用户：您在置上金融网站上的验证码是:2590，请及时输入，工作人员不会向您索取，请勿泄露。', '2590', '0', null, '2017-06-29 16:40:49', '2017-06-29 16:40:49');

-- ----------------------------
-- Table structure for `ck_translations`
-- ----------------------------
DROP TABLE IF EXISTS `ck_translations`;
CREATE TABLE `ck_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_translations
-- ----------------------------

-- ----------------------------
-- Table structure for `ck_users`
-- ----------------------------
DROP TABLE IF EXISTS `ck_users`;
CREATE TABLE `ck_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ck_users
-- ----------------------------
INSERT INTO `ck_users` VALUES ('38', '1', '13688045082', '13688045082', '13688045082', 'users/September2017/VhhIqWLeCx15j5ajGF4f.jpg', '$2y$10$ecTnyXPtXrHNh58m0foN3OUzz7mPcva0wRL6xxvUVTlosJCKIjuR2', null, '2017-06-29 16:39:06', '2017-09-07 15:51:05');
INSERT INTO `ck_users` VALUES ('39', '2', '13689050228', '13689050228', null, 'users/June2017/yko1KeIVMWRaQ1Woxb3v.jpg', '$2y$10$IhiC7W3kZTARMhoCOuRGPuJrC8JCO/LEJZgROE/Goh4wkbiGu67uW', null, '2017-06-29 16:40:59', '2017-06-30 09:58:16');
