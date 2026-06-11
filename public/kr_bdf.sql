/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : kr_bdf

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2026-06-11 16:40:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for kr_config_group
-- ----------------------------
DROP TABLE IF EXISTS `kr_config_group`;
CREATE TABLE `kr_config_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10008 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_config_group
-- ----------------------------
INSERT INTO `kr_config_group` VALUES ('10001', '基本', 'base', '1770168895', '1770168895');
INSERT INTO `kr_config_group` VALUES ('10002', '分页', 'pagination', '1770169598', '1770169598');
INSERT INTO `kr_config_group` VALUES ('10003', '上传', 'upload', '1770173009', '1770173009');
INSERT INTO `kr_config_group` VALUES ('10004', '微信', 'wechat', '1770174248', '1770174248');
INSERT INTO `kr_config_group` VALUES ('10005', '微信小程序', 'wechat_mini', '1770174258', '1770174258');
INSERT INTO `kr_config_group` VALUES ('10006', '微信支付', 'wechat_pay', '1770348735', '1770348735');

-- ----------------------------
-- Table structure for kr_config_item
-- ----------------------------
DROP TABLE IF EXISTS `kr_config_item`;
CREATE TABLE `kr_config_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_config_item
-- ----------------------------
INSERT INTO `kr_config_item` VALUES ('10001', '10001', 'text', '站点标题', 'web_site_title', '徐州久久冷鲜', '', '', '1770168912', '1770362133');
INSERT INTO `kr_config_item` VALUES ('10002', '10001', 'text', '站点描述', 'web_site_description', '中后台前端设计解决方案', '', '', '1770168959', '1770169052');
INSERT INTO `kr_config_item` VALUES ('10003', '10001', 'image', '站点Logo', 'web_site_logo', '6982e1d1346fd', '', '', '1770169086', '1770185169');
INSERT INTO `kr_config_item` VALUES ('10004', '10001', 'select', '导航模式', 'web_site_layout', 'side', '', '顶部菜单布局:top\n侧边菜单布局:side\n混合菜单布局:mix', '1770169411', '1781146913');
INSERT INTO `kr_config_item` VALUES ('10005', '10001', 'text', '版权信息', 'web_site_copyright', 'Copyright © 2026 Kirin Team', '', '', '1770169439', '1770169445');
INSERT INTO `kr_config_item` VALUES ('10006', '10001', 'checkbox', '登录方式', 'web_site_login_type', 'wechat,password', '', '账号密码登录:password\n微信扫码登录:wechat', '1770169481', '1770169483');
INSERT INTO `kr_config_item` VALUES ('10007', '10002', 'number', '每页条数', 'default_page_size', '15', '', '', '1770169637', '1781159141');
INSERT INTO `kr_config_item` VALUES ('10008', '10002', 'text', '当前页字段', 'request_page_key', 'page', '', '', '1770169866', '1770169993');
INSERT INTO `kr_config_item` VALUES ('10009', '10002', 'text', '每页数量字段', 'request_page_size_key', 'list_rows', '', '', '1770170016', '1770170020');
INSERT INTO `kr_config_item` VALUES ('10010', '10002', 'text', '总条数字段', 'response_total_key', 'total', '', '', '1770170031', '1770170047');
INSERT INTO `kr_config_item` VALUES ('10011', '10002', 'text', '列表数据字段', 'response_data_key', 'data', '', '', '1770170043', '1770170049');
INSERT INTO `kr_config_item` VALUES ('10012', '10003', 'tags', '文件后缀', 'file_ext', 'doc,docx,xls,xlsx,rar,zip,pem', '允许上传的文件后缀，不填则不限制类型', '', '1770173899', '1770348913');
INSERT INTO `kr_config_item` VALUES ('10013', '10003', 'number', '文件大小', 'file_size', null, '图片上传大小限制，0为不限制大小，单位：KB', '', '1770174015', '1770174015');
INSERT INTO `kr_config_item` VALUES ('10014', '10003', 'tags', '图片后缀', 'image_ext', 'jpg,jpeg,png,gif', '允许上传的图片后缀，不填则不限制类型', '', '1770174037', '1770174048');
INSERT INTO `kr_config_item` VALUES ('10015', '10003', 'number', '图片大小', 'image_size', null, '图片上传大小限制，0为不限制大小，单位：KB', '', '1770174069', '1770174069');
INSERT INTO `kr_config_item` VALUES ('10016', '10003', 'switch', '图片缩放', 'is_thumb', '0', '', '', '1770174094', '1770184220');
INSERT INTO `kr_config_item` VALUES ('10017', '10003', 'number', '缩放宽度', 'thumb_width', '1024', '图片缩放后的最大宽度', '', '1770174123', '1770174131');
INSERT INTO `kr_config_item` VALUES ('10018', '10003', 'number', '缩放高度', 'thumb_height', '1024', '图片缩放后的最大高度', '', '1770174151', '1770174154');
INSERT INTO `kr_config_item` VALUES ('10019', '10003', 'number', '缩放质量', 'thumb_quality', '100', '图片缩放后的质量：0~100', '', '1770174194', '1770174197');
INSERT INTO `kr_config_item` VALUES ('10020', '10003', 'select', '缩放后缀', 'thumb_ext', 'jpg', '缩放后图像的扩展名', 'jpg:jpg\npng:png', '1770174224', '1770174227');
INSERT INTO `kr_config_item` VALUES ('10021', '10004', 'text', 'AppID', 'appid', 'wxdc1fde650ff92103', '', '', '1770174272', '1770185345');
INSERT INTO `kr_config_item` VALUES ('10022', '10004', 'text', 'AppSecret', 'appsecret', '6cd36a513d03353fdea11dd7485a15ba', '', '', '1770174328', '1770185501');
INSERT INTO `kr_config_item` VALUES ('10023', '10005', 'text', 'AppID', 'appid', 'wx31ccfafb7c027857', '', '', '1770174531', '1770360423');
INSERT INTO `kr_config_item` VALUES ('10024', '10005', 'text', 'AppSecret', 'appsecret', '4ae2e97087280f4ed7b0f7980f03a099', '', '', '1770174620', '1770360420');
INSERT INTO `kr_config_item` VALUES ('10025', '10006', 'text', '微信支付商户号', 'merchant_id', '1668224130', '', '', '1770348754', '1770359103');
INSERT INTO `kr_config_item` VALUES ('10026', '10006', 'text', '证书序列号', 'merchant_cert_serial', '58BCFF605D708A88D166EC4A83C8A245E3C1F07D', '「API安全」->「商户API证书」->「管理证书」', '', '1770348765', '1770361529');
INSERT INTO `kr_config_item` VALUES ('10027', '10006', 'file', '商户API私钥', 'merchant_private_key', '698587cbb99be', '「API安全」->「商户API证书」->「管理证书」', '', '1770358702', '1770358731');
INSERT INTO `kr_config_item` VALUES ('10028', '10006', 'text', '微信支付公钥ID', 'platform_public_key_id', '', '', '', '1770358805', '1770363722');
INSERT INTO `kr_config_item` VALUES ('10029', '10006', 'file', '微信支付公钥', 'platform_public_key', '', '', '', '1770358907', '1770363722');
INSERT INTO `kr_config_item` VALUES ('10030', '10006', 'text', '平台证书序列号', 'platform_cert_serial', '7686C222E8BDADDAE4090D2E989594182B9FAD48', '', '', '1770359004', '1770360935');
INSERT INTO `kr_config_item` VALUES ('10031', '10006', 'file', '平台证书', 'platform_cert', '698589dad34ea', '', '', '1770359215', '1770359258');
INSERT INTO `kr_config_item` VALUES ('10032', '10006', 'textarea', '回调地址', 'notify_url', 'http://1979f815.r15.cpolar.top/portal/callback/wechatNotify', '', '', '1770360019', '1770365313');
INSERT INTO `kr_config_item` VALUES ('10033', '10006', 'text', 'APIv3密钥', 'api_v3_key', 'P1wNTaBa8WQ36RNET3x7C7Ry5mf83SK3', '', '', '1770362469', '1770367160');

-- ----------------------------
-- Table structure for kr_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `kr_dict_item`;
CREATE TABLE `kr_dict_item` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for kr_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `kr_dict_type`;
CREATE TABLE `kr_dict_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_dict_type
-- ----------------------------

-- ----------------------------
-- Table structure for kr_exception
-- ----------------------------
DROP TABLE IF EXISTS `kr_exception`;
CREATE TABLE `kr_exception` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) NOT NULL COMMENT '文件错误位置',
  `line` varchar(255) NOT NULL COMMENT '文件错误行数',
  `error_code` varchar(255) NOT NULL COMMENT '错误代码',
  `issue` varchar(255) NOT NULL COMMENT '错误具体原因',
  `request_ip` varchar(255) NOT NULL COMMENT '请求客户端IP地址',
  `request_url` varchar(255) NOT NULL COMMENT '请求URL',
  `request_method` varchar(255) NOT NULL COMMENT '请求类型',
  `request_time` int(11) NOT NULL COMMENT '请求时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100089 DEFAULT CHARSET=utf8 COMMENT='异常表';

-- ----------------------------
-- Records of kr_exception
-- ----------------------------
INSERT INTO `kr_exception` VALUES ('100059', 'D:\\Back End\\tp6-bdf-latest\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value', '127.0.0.1', '/wxapp/access/getAccessToken', 'POST', '1770435230', '1770435230', '1770435230', null);
INSERT INTO `kr_exception` VALUES ('100060', 'D:\\Back End\\tp6-bdf-latest\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value', '127.0.0.1', '/wxapp/access/getAccessToken', 'POST', '1770435304', '1770435304', '1770435304', null);
INSERT INTO `kr_exception` VALUES ('100061', 'D:\\Back End\\tp6-bdf-latest\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value', '127.0.0.1', '/wxapp/access/getAccessToken', 'POST', '1770435332', '1770435332', '1770435332', null);
INSERT INTO `kr_exception` VALUES ('100062', 'D:\\Back End\\tp6-bdf-latest\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'user_id\' doesn\'t have a default value', '127.0.0.1', '/wxapp/access/getAccessToken', 'POST', '1770435350', '1770435350', '1770435350', null);
INSERT INTO `kr_exception` VALUES ('100063', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40163：code been used, rid: 6986b5a3-516d9046-22148f70', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1770436003', '1770436003', '1770436003', null);
INSERT INTO `kr_exception` VALUES ('100064', 'D:\\Back End\\tp6-bdf-latest\\vendor\\topthink\\framework\\src\\think\\Container.php', '461', '0', '方法参数错误:key', '127.0.0.1', '/wxapp/file/delete/', 'GET', '1772172974', '1772172974', '1772172974', null);
INSERT INTO `kr_exception` VALUES ('100065', 'D:\\Back End\\tp6-bdf-latest\\app\\wxapp\\controller\\FileController.php', '83', '0', 'Call to a member function getData() on null', '127.0.0.1', '/wxapp/file/delete/?key=asd', 'GET', '1772183517', '1772183517', '1772183517', null);
INSERT INTO `kr_exception` VALUES ('100066', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb4a2-1cebc86d-6be11687', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773122720', '1773122723', '1773122723', null);
INSERT INTO `kr_exception` VALUES ('100067', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb4aa-11c238c2-50fc47c3', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773122729', '1773122730', '1773122730', null);
INSERT INTO `kr_exception` VALUES ('100068', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb556-636b0856-269ec371', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773122902', '1773122902', '1773122902', null);
INSERT INTO `kr_exception` VALUES ('100069', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb6ba-6d0e06e5-25633e84', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773123258', '1773123258', '1773123258', null);
INSERT INTO `kr_exception` VALUES ('100070', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb705-180cf11e-5f5f3d42', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773123333', '1773123333', '1773123333', null);
INSERT INTO `kr_exception` VALUES ('100071', 'D:\\Back End\\tp6-bdf-latest\\extend\\thirdconnect\\gateways\\WechatMini.php', '59', '0', '40029：invalid code, rid: 69afb719-1bb70423-1962fbcb', '127.0.0.1', '/wxapp/access/createAccessToken', 'POST', '1773123353', '1773123353', '1773123353', null);
INSERT INTO `kr_exception` VALUES ('100072', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'kr_bdf.kr_\' doesn\'t exist', '127.0.0.1', '/admin/menu/create', 'POST', '1780903084', '1780903084', '1780903084', null);
INSERT INTO `kr_exception` VALUES ('100073', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\Builder.php', '925', '10500', 'order express error:`order`', '127.0.0.1', '/admin/menu/tree', 'GET', '1780904536', '1780904536', '1780904536', null);
INSERT INTO `kr_exception` VALUES ('100074', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\Builder.php', '925', '10500', 'order express error:`order`', '127.0.0.1', '/admin/menu/tree', 'GET', '1780904536', '1780904536', '1780904536', null);
INSERT INTO `kr_exception` VALUES ('100075', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\Builder.php', '925', '10500', 'order express error:`order`', '127.0.0.1', '/admin/menu/tree', 'GET', '1780904579', '1780904579', '1780904579', null);
INSERT INTO `kr_exception` VALUES ('100076', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\Builder.php', '925', '10500', 'order express error:`order`', '127.0.0.1', '/admin/menu/tree', 'GET', '1780904599', '1780904599', '1780904599', null);
INSERT INTO `kr_exception` VALUES ('100077', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'kr_bdf.kr_role_menu\' doesn\'t exist', '127.0.0.1', '/admin/role/menus?id=10001', 'GET', '1781143921', '1781143921', '1781143921', null);
INSERT INTO `kr_exception` VALUES ('100078', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'kr_bdf.kr_role_menu\' doesn\'t exist', '127.0.0.1', '/admin/role/menus?id=10001', 'GET', '1781144031', '1781144031', '1781144031', null);
INSERT INTO `kr_exception` VALUES ('100079', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[42S02]: Base table or view not found: 1146 Table \'kr_bdf.kr_role_menu\' doesn\'t exist', '127.0.0.1', '/admin/role/menus?id=10001', 'GET', '1781144041', '1781144041', '1781144041', null);
INSERT INTO `kr_exception` VALUES ('100080', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'create_time\' doesn\'t have a default value', '127.0.0.1', '/admin/role/update_menus', 'POST', '1781144144', '1781144144', '1781144144', null);
INSERT INTO `kr_exception` VALUES ('100081', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'create_time\' doesn\'t have a default value', '127.0.0.1', '/admin/role/update_menus', 'POST', '1781144383', '1781144383', '1781144383', null);
INSERT INTO `kr_exception` VALUES ('100082', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'create_time\' doesn\'t have a default value', '127.0.0.1', '/admin/role/update_menus', 'POST', '1781144391', '1781144391', '1781144391', null);
INSERT INTO `kr_exception` VALUES ('100083', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\think-orm\\src\\db\\PDOConnection.php', '797', '10501', 'SQLSTATE[HY000]: General error: 1364 Field \'create_time\' doesn\'t have a default value', '127.0.0.1', '/admin/role/update_menus', 'POST', '1781144406', '1781144406', '1781144406', null);
INSERT INTO `kr_exception` VALUES ('100084', 'D:\\KirinBDF\\tp6-pro\\app\\portal\\controller\\EntryController.php', '9', '0', 'Call to undefined method app\\Request::routeInfo()', '127.0.0.1', '/', 'GET', '1781160733', '1781160733', '1781160733', null);
INSERT INTO `kr_exception` VALUES ('100085', 'D:\\KirinBDF\\tp6-pro\\app\\portal\\controller\\EntryController.php', '9', '0', 'Class \'app\\portal\\controller\\Request\' not found', '127.0.0.1', '/', 'GET', '1781160786', '1781160787', '1781160787', null);
INSERT INTO `kr_exception` VALUES ('100086', 'D:\\KirinBDF\\tp6-pro\\vendor\\topthink\\framework\\src\\think\\Facade.php', '96', '2', 'call_user_func_array() expects parameter 1 to be a valid callback, class \'app\\Request\' does not have a method \'routeInfo\'', '127.0.0.1', '/', 'GET', '1781160793', '1781160793', '1781160793', null);
INSERT INTO `kr_exception` VALUES ('100087', 'D:\\KirinBDF\\tp6-pro\\app\\portal\\controller\\EntryController.php', '10', '0', 'Cannot access protected property think\\route\\RuleItem::$rule', '127.0.0.1', '/portal/test/2', 'GET', '1781162957', '1781162957', '1781162957', null);
INSERT INTO `kr_exception` VALUES ('100088', 'D:\\KirinBDF\\tp6-pro\\app\\portal\\controller\\EntryController.php', '10', '0', 'Call to undefined method app\\Request::getMethod()', '127.0.0.1', '/portal/test/2', 'GET', '1781163139', '1781163139', '1781163139', null);

-- ----------------------------
-- Table structure for kr_file
-- ----------------------------
DROP TABLE IF EXISTS `kr_file`;
CREATE TABLE `kr_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL COMMENT 'key',
  `path` varchar(255) NOT NULL COMMENT '路径',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '源文件名',
  `extension` varchar(255) NOT NULL DEFAULT '' COMMENT '后缀名',
  `mime` varchar(255) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `size` int(11) NOT NULL COMMENT '文件大小',
  `md5` varchar(255) NOT NULL DEFAULT '' COMMENT '哈希值 md5',
  `sha1` varchar(255) NOT NULL DEFAULT '' COMMENT '哈希值 sha1',
  `width` mediumint(8) unsigned DEFAULT NULL COMMENT '宽',
  `height` mediumint(8) unsigned DEFAULT NULL COMMENT '高',
  `is_image` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0：不是图片；1：是图片',
  `app` varchar(255) NOT NULL COMMENT '来源应用',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=10042 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- ----------------------------
-- Records of kr_file
-- ----------------------------
INSERT INTO `kr_file` VALUES ('10001', '6982e1d1346fd', '/uploads/images/20260204/2bba14f7dab0991793357d9aa8f6793e.png', 'logo.png', 'png', 'image/png', '7791', 'b188d24144a01a835e6b2dcc73929821', 'b7e6f8347cd2e24a01fbd9a1e1918214cf63c31b', '480', '119', '1', 'admin', '1770185169', '1770185169');
INSERT INTO `kr_file` VALUES ('10002', '6982e201848d9', '/uploads/images/20260204/8613c0b930ff8e9aca36820db4394296.jpg', 'avatar.jpg', 'jpg', 'image/jpeg', '71146', '1fd423e556a702a31f9643e36fef0106', '893ace707c990249395ec6dc55b4829a94b79c1b', '425', '425', '1', 'admin', '1770185217', '1770185217');
INSERT INTO `kr_file` VALUES ('10003', '69a114e19b746', '/uploads/images/20260227/f29ef1b6ed4a8a9f5bf002cc98ff764f.png', 'EL7-WXEJCgJ_990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772164322', '1772164322');
INSERT INTO `kr_file` VALUES ('10004', '69a1154d1294d', '/uploads/images/20260227/f0936da67d65c900edee90efabad67fe.png', 'ZnIqkYiy0H7_990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772164429', '1772164429');
INSERT INTO `kr_file` VALUES ('10005', '69a115facbfbd', '/uploads/images/20260227/b262550307ad00c0cd8755d697a8937d.png', 'PJhyOJ1JwlJP990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772164602', '1772164602');
INSERT INTO `kr_file` VALUES ('10006', '69a1166de58ad', '/uploads/images/20260227/0f2ed06e209809cfa78412a50b62385a.jpg', '77HWNVovg_vU1fd423e556a702a31f9643e36fef0106.jpg', 'jpg', 'image/jpeg', '71146', '1fd423e556a702a31f9643e36fef0106', '893ace707c990249395ec6dc55b4829a94b79c1b', '425', '425', '1', 'wxapp', '1772164717', '1772164717');
INSERT INTO `kr_file` VALUES ('10007', '69a117f965af8', '/uploads/images/20260227/1662ef7484e8a485cf988c717f9a81de.jpg', 'OUmtwTeKrdQKa4065ebd23b200f73c3ec799eeda66a1.jpg', 'jpg', 'image/jpeg', '338755', 'a4065ebd23b200f73c3ec799eeda66a1', 'f0208a00958883b04f0e17f196174f5705fe6079', '1280', '1707', '1', 'wxapp', '1772165113', '1772165113');
INSERT INTO `kr_file` VALUES ('10008', '69a1187469be1', '/uploads/images/20260227/279aab18e825594ac04f788871c938ea.jpeg', 'ShONCaexSttO5fd37d890afea3641142d511543306cc.jpeg', 'jpeg', 'image/jpeg', '24465', '5fd37d890afea3641142d511543306cc', '9205572ff24355fd5aef65afa117bfeca1257e31', '1080', '1108', '1', 'wxapp', '1772165236', '1772165236');
INSERT INTO `kr_file` VALUES ('10009', '69a118900982f', '/uploads/images/20260227/5eceb5b7f3112e4cdc4c305fe2e8bade.png', 'J7Mox1Jo_gTf990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772165264', '1772165264');
INSERT INTO `kr_file` VALUES ('10011', '69a136b74fc5c', '/uploads/images/20260227/9522d6c254b32fe3c2fc2fd7d64258ef.jpeg', 'vivQalDunIJX5fd37d890afea3641142d511543306cc.jpeg', 'jpeg', 'image/jpeg', '24465', '5fd37d890afea3641142d511543306cc', '9205572ff24355fd5aef65afa117bfeca1257e31', '1080', '1108', '1', 'wxapp', '1772172983', '1772172983');
INSERT INTO `kr_file` VALUES ('10012', '69a13a9379c63', '/uploads/images/20260227/f8d8d3b0ed63c8144f3bebcb1ef24908.png', 'G9TxbAKcYha7f987d949d0210c474cdc7076baa8e9b0.png', 'png', 'image/png', '488977', 'f987d949d0210c474cdc7076baa8e9b0', '7f7910bbdbfbf5302bf4653fd024c8e2628e9615', '1917', '1025', '1', 'wxapp', '1772173971', '1772173971');
INSERT INTO `kr_file` VALUES ('10013', '69a13a95942dd', '/uploads/images/20260227/865e6104d0c9c605dae73bfc235e499c.png', 'YmjMaHSS7mcN1180cc16556e01fc90c05c38f9cade39.png', 'png', 'image/png', '1637600', '1180cc16556e01fc90c05c38f9cade39', 'cf33388cc5acc78aa1b8eea5c390721413cee010', '1920', '1080', '1', 'wxapp', '1772173973', '1772173973');
INSERT INTO `kr_file` VALUES ('10014', '69a13d58537da', '/uploads/images/20260227/f941c8ffa58772e6fbeef89ac56a17f5.png', 'bl11C5C_6UCce147bdebf32ef9cb7ce137ed0ed5d3a6.png', 'png', 'image/png', '12259', 'e147bdebf32ef9cb7ce137ed0ed5d3a6', 'cf9b8b05cfbc48d3701aca946bbb48f566053555', '400', '400', '1', 'wxapp', '1772174681', '1772174681');
INSERT INTO `kr_file` VALUES ('10015', '69a13d5b4e77a', '/uploads/images/20260227/60e508831092e57f161e66963b52925b.png', 'A4WA1hL4v7-4990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772174683', '1772174683');
INSERT INTO `kr_file` VALUES ('10016', '69a13d7271891', '/uploads/images/20260227/2035c19100f9b223173b9ece39cb62dc.png', 'WjyYGDZx3Fin8e9e4a0ef02b0c0386e0cf07d7464564.png', 'png', 'image/png', '41731', '8e9e4a0ef02b0c0386e0cf07d7464564', 'c38cd8276ac396c6e5d94d4e110ee78fadb089f4', '275', '59', '1', 'wxapp', '1772174706', '1772174706');
INSERT INTO `kr_file` VALUES ('10017', '69a13d7488bea', '/uploads/images/20260227/e4ef082ea0a1024ef87b302cfc8ab26e.jpeg', 'V1wYDRd74Bs75fd37d890afea3641142d511543306cc.jpeg', 'jpeg', 'image/jpeg', '24465', '5fd37d890afea3641142d511543306cc', '9205572ff24355fd5aef65afa117bfeca1257e31', '1080', '1108', '1', 'wxapp', '1772174708', '1772174708');
INSERT INTO `kr_file` VALUES ('10018', '69a13d7f0a32d', '/uploads/images/20260227/249fcd2404dfb216ac55275c09588ae8.png', '9YzXuGL2OVCs8e9e4a0ef02b0c0386e0cf07d7464564.png', 'png', 'image/png', '41731', '8e9e4a0ef02b0c0386e0cf07d7464564', 'c38cd8276ac396c6e5d94d4e110ee78fadb089f4', '275', '59', '1', 'wxapp', '1772174719', '1772174719');
INSERT INTO `kr_file` VALUES ('10019', '69a13d811dda7', '/uploads/images/20260227/df28c1e3415843cc5aff383b733e8456.jpeg', 'A20pJUjkA79q5fd37d890afea3641142d511543306cc.jpeg', 'jpeg', 'image/jpeg', '24465', '5fd37d890afea3641142d511543306cc', '9205572ff24355fd5aef65afa117bfeca1257e31', '1080', '1108', '1', 'wxapp', '1772174721', '1772174721');
INSERT INTO `kr_file` VALUES ('10020', '69a13d8338ac7', '/uploads/images/20260227/9e8a3bcab82d043cdc2e267d663c9d23.jpg', '677b2iWcZxC1a95197a4c7454a50db95b987d34517ff.jpg', 'jpg', 'image/jpeg', '931399', 'a95197a4c7454a50db95b987d34517ff', 'ea01ee54edd0391d91f64078ff885ab821e170ed', '1206', '1158', '1', 'wxapp', '1772174723', '1772174723');
INSERT INTO `kr_file` VALUES ('10021', '69a13d8a0f310', '/uploads/images/20260227/2e80e216a2b766f843d4790739b4aaeb.jpg', 'L-IsCNJxsiXF1fd423e556a702a31f9643e36fef0106.jpg', 'jpg', 'image/jpeg', '71146', '1fd423e556a702a31f9643e36fef0106', '893ace707c990249395ec6dc55b4829a94b79c1b', '425', '425', '1', 'wxapp', '1772174730', '1772174730');
INSERT INTO `kr_file` VALUES ('10022', '69a13d8c25ab1', '/uploads/images/20260227/c5e82743305462c5d44b7853cb1fe041.png', '7HgETL7Y6-bAe147bdebf32ef9cb7ce137ed0ed5d3a6.png', 'png', 'image/png', '12259', 'e147bdebf32ef9cb7ce137ed0ed5d3a6', 'cf9b8b05cfbc48d3701aca946bbb48f566053555', '400', '400', '1', 'wxapp', '1772174732', '1772174732');
INSERT INTO `kr_file` VALUES ('10023', '69a13d8e36e3f', '/uploads/images/20260227/cef45632b0f615c9e4941f00b4a844c2.png', '_Zo_TZfQ-uqE990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772174734', '1772174734');
INSERT INTO `kr_file` VALUES ('10024', '69a13d904b2da', '/uploads/images/20260227/c325e1f453f1de6d4a77e57ca545e57b.ico', 'u4e-cb27hPdc2e4a98491d48124f075890f6243ffdc4.ico', 'ico', 'image/vnd.microsoft.icon', '16958', '2e4a98491d48124f075890f6243ffdc4', '029d0d5659c0d6cdc71c86c67c4cafe0d46df613', '64', '64', '1', 'wxapp', '1772174736', '1772174736');
INSERT INTO `kr_file` VALUES ('10025', '69a13d925f6f3', '/uploads/files/20260227/ae6e85931c8fc4231c8a79542475ecd3.svg', 'DWALo1DDlSgc128df25275aa95249324fcdcacb80f82.svg', 'svg', 'image/svg+xml', '3134', '128df25275aa95249324fcdcacb80f82', '698af3b0afaa2163734c2dca697ff829512f4d17', null, null, '0', 'wxapp', '1772174738', '1772174738');
INSERT INTO `kr_file` VALUES ('10026', '69a13d9476483', '/uploads/images/20260227/fce4786e727e1d1e13764e1d2d370cfc.jpg', 'oURJli7G7c7_a4065ebd23b200f73c3ec799eeda66a1.jpg', 'jpg', 'image/jpeg', '338755', 'a4065ebd23b200f73c3ec799eeda66a1', 'f0208a00958883b04f0e17f196174f5705fe6079', '1280', '1707', '1', 'wxapp', '1772174740', '1772174740');
INSERT INTO `kr_file` VALUES ('10027', '69a13db216250', '/uploads/images/20260227/8e1e679001e8208d8fd0715d81393491.png', 'BNWB7QJ4bCDu990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772174770', '1772174770');
INSERT INTO `kr_file` VALUES ('10028', '69a13dbc338c3', '/uploads/images/20260227/2f82d41810ffc033ee6bb7c0967bab6e.png', '7wJwtlPP6uWWe147bdebf32ef9cb7ce137ed0ed5d3a6.png', 'png', 'image/png', '12259', 'e147bdebf32ef9cb7ce137ed0ed5d3a6', 'cf9b8b05cfbc48d3701aca946bbb48f566053555', '400', '400', '1', 'wxapp', '1772174780', '1772174780');
INSERT INTO `kr_file` VALUES ('10029', '69a13dbe4844e', '/uploads/images/20260227/6f9a68d487e03e720f7460bb5b178313.png', '1G78YHWtJLfc990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772174782', '1772174782');
INSERT INTO `kr_file` VALUES ('10030', '69a13dc05adef', '/uploads/images/20260227/95b5bc8f68ee6563f890702aa35d1234.png', 'AFDFuXQ4XiX1b188d24144a01a835e6b2dcc73929821.png', 'png', 'image/png', '7791', 'b188d24144a01a835e6b2dcc73929821', 'b7e6f8347cd2e24a01fbd9a1e1918214cf63c31b', '480', '119', '1', 'wxapp', '1772174784', '1772174784');
INSERT INTO `kr_file` VALUES ('10031', '69a13dc26dbab', '/uploads/images/20260227/fdcf200066f0dc9f8279628f427d96d8.jpg', 'ujzUU_1d2dvra4065ebd23b200f73c3ec799eeda66a1.jpg', 'jpg', 'image/jpeg', '338755', 'a4065ebd23b200f73c3ec799eeda66a1', 'f0208a00958883b04f0e17f196174f5705fe6079', '1280', '1707', '1', 'wxapp', '1772174786', '1772174786');
INSERT INTO `kr_file` VALUES ('10039', '69a145ff31f82', '/uploads/images/20260227/acc7ea2a1a95237922429eb0ea46fb83.png', 'gAMaSPs3ohTH990edbc9f82258f136f7b1b6a4288fc8.png', 'png', 'image/png', '33017', '990edbc9f82258f136f7b1b6a4288fc8', '72e76b53d143a01df4537159539d4449e5dc920e', '83', '83', '1', 'wxapp', '1772176895', '1772176895');
INSERT INTO `kr_file` VALUES ('10037', '69a13e7bc7a99', '/uploads/images/20260227/3aa43c3882324584844528b6b937ffe2.png', '70gf2uPYwqfn8e9e4a0ef02b0c0386e0cf07d7464564.png', 'png', 'image/png', '41731', '8e9e4a0ef02b0c0386e0cf07d7464564', 'c38cd8276ac396c6e5d94d4e110ee78fadb089f4', '275', '59', '1', 'wxapp', '1772174971', '1772174971');
INSERT INTO `kr_file` VALUES ('10038', '69a13e7dd9f6e', '/uploads/images/20260227/0c88642be64840f78f9af9b3ce0eb6f3.jpeg', '7t-rvmK2_4K-5fd37d890afea3641142d511543306cc.jpeg', 'jpeg', 'image/jpeg', '24465', '5fd37d890afea3641142d511543306cc', '9205572ff24355fd5aef65afa117bfeca1257e31', '1080', '1108', '1', 'wxapp', '1772174973', '1772174973');
INSERT INTO `kr_file` VALUES ('10040', '69a14787d9e46', '/uploads/images/20260227/263909874fdee1a6ec4151c8cb4355c7.jpg', 'Q5zukZj1VPdea95197a4c7454a50db95b987d34517ff.jpg', 'jpg', 'image/jpeg', '931399', 'a95197a4c7454a50db95b987d34517ff', 'ea01ee54edd0391d91f64078ff885ab821e170ed', '1206', '1158', '1', 'wxapp', '1772177287', '1772177287');

-- ----------------------------
-- Table structure for kr_manager
-- ----------------------------
DROP TABLE IF EXISTS `kr_manager`;
CREATE TABLE `kr_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码 ',
  `avatar_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1：开启 0：禁用',
  `openid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unionid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_top` int(11) NOT NULL DEFAULT '0' COMMENT '最高管理员',
  `last_login_ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '最后一次登录ip',
  `last_login_time` int(11) DEFAULT NULL COMMENT '最后一次登录时间 ',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of kr_manager
-- ----------------------------
INSERT INTO `kr_manager` VALUES ('100001', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '硕硕', '', '6982e201848d9', '1', 'oftII6d4qesedHYqQiVtmpyuNVf4', 'ozVaf5-Q8V60ggn4Pa6X9vVS2LeI', '1', '127.0.0.1', '1781166472', '1769506538', '1781166472', null);
INSERT INTO `kr_manager` VALUES ('100002', 'test', 'e10adc3949ba59abbe56e057f20f883e', '测试', '', null, '1', null, null, '0', '127.0.0.1', '1781166465', '1781147494', '1781166465', null);
INSERT INTO `kr_manager` VALUES ('100003', 'hhh', 'e10adc3949ba59abbe56e057f20f883e', '123', '', null, '1', null, null, '0', null, null, '1781147567', '1781147724', '1781147724');
INSERT INTO `kr_manager` VALUES ('100004', '123213', '202cb962ac59075b964b07152d234b70', '123123', '', null, '1', null, null, '0', null, null, '1781147576', '1781147722', '1781147722');
INSERT INTO `kr_manager` VALUES ('100005', '123213', '4297f44b13955235245b2497399d7a93', '123213', '', null, '1', null, null, '0', null, null, '1781147717', '1781147721', '1781147721');

-- ----------------------------
-- Table structure for kr_manager_role
-- ----------------------------
DROP TABLE IF EXISTS `kr_manager_role`;
CREATE TABLE `kr_manager_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manager_id` int(11) NOT NULL COMMENT '用户id ',
  `role_id` int(11) NOT NULL COMMENT '角色key',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户角色关系';

-- ----------------------------
-- Records of kr_manager_role
-- ----------------------------
INSERT INTO `kr_manager_role` VALUES ('10001', '100002', '10001');

-- ----------------------------
-- Table structure for kr_menu
-- ----------------------------
DROP TABLE IF EXISTS `kr_menu`;
CREATE TABLE `kr_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_menu
-- ----------------------------
INSERT INTO `kr_menu` VALUES ('1', '0', '工作台', '/workplace', 'PieChart', '1', '1780903132', '1781158815');
INSERT INTO `kr_menu` VALUES ('2', '0', '设置', '/setting', 'Setting', '2', '1780903141', '1781158776');
INSERT INTO `kr_menu` VALUES ('3', '2', '管理员', '/setting/manager', '', '1', '1780903188', '1781164223');
INSERT INTO `kr_menu` VALUES ('9', '2', '菜单管理', '/setting/menu', '', '3', '1781143572', '1781143572');
INSERT INTO `kr_menu` VALUES ('8', '2', '配置管理', '/setting/config', '', '4', '1781143572', '1781143572');
INSERT INTO `kr_menu` VALUES ('7', '2', '角色管理', '/setting/role', '', '2', '1781143572', '1781150523');
INSERT INTO `kr_menu` VALUES ('10', '0', '异常管理', '/exception', 'CircleClose', '3', '1781158759', '1781166482');
INSERT INTO `kr_menu` VALUES ('11', '2', '字典管理', '/setting/dict', '', '5', '1781158856', '1781158856');

-- ----------------------------
-- Table structure for kr_menu_api
-- ----------------------------
DROP TABLE IF EXISTS `kr_menu_api`;
CREATE TABLE `kr_menu_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kr_menu_api
-- ----------------------------
INSERT INTO `kr_menu_api` VALUES ('19', '10', 'admin/exception/pagination', '1781166482', '1781166482');

-- ----------------------------
-- Table structure for kr_role
-- ----------------------------
DROP TABLE IF EXISTS `kr_role`;
CREATE TABLE `kr_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色名称 ',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10002 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色表';

-- ----------------------------
-- Records of kr_role
-- ----------------------------
INSERT INTO `kr_role` VALUES ('10001', 'test', '测试角色', '1', '1781143589', '1781143589');

-- ----------------------------
-- Table structure for kr_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `kr_role_menu`;
CREATE TABLE `kr_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL COMMENT '角色名称 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10017 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色菜单关联表';

-- ----------------------------
-- Records of kr_role_menu
-- ----------------------------
INSERT INTO `kr_role_menu` VALUES ('10016', '10001', '10');
INSERT INTO `kr_role_menu` VALUES ('10015', '10001', '1');

-- ----------------------------
-- Table structure for kr_user
-- ----------------------------
DROP TABLE IF EXISTS `kr_user`;
CREATE TABLE `kr_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像地址',
  `gender` tinyint(1) DEFAULT '1' COMMENT '性别 1：男 2：女',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1：正常 0：禁用',
  `last_login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kr_user
-- ----------------------------
INSERT INTO `kr_user` VALUES ('100002', '13337935576', '13337935576', '', '1', '1', '127.0.0.1', '1772183514', '1770447503', '1772183514', null);

-- ----------------------------
-- Table structure for kr_user_wechat_mini
-- ----------------------------
DROP TABLE IF EXISTS `kr_user_wechat_mini`;
CREATE TABLE `kr_user_wechat_mini` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `wechat_unionid` varchar(32) DEFAULT NULL,
  `wechat_mini_openid` varchar(32) NOT NULL,
  `last_login_ip` varchar(15) DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of kr_user_wechat_mini
-- ----------------------------
INSERT INTO `kr_user_wechat_mini` VALUES ('100002', '100002', '', 'oTXlW7ACdNN8DEnfG5Ckogofkv2s', '127.0.0.1', '1772183514', '1770435849', '1772183514', null);
