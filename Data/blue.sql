-- -----------------------------
-- Think MySQL Data Transfer 
-- 
-- Host     : localhost
-- Port     : 3306
-- Database : jie
-- 
-- Part : #1
-- Date : 2015-07-30 13:40:56
-- -----------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- -----------------------------
-- Table structure for `blue_action`
-- -----------------------------
DROP TABLE IF EXISTS `blue_action`;
CREATE TABLE `blue_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- -----------------------------
-- Records of `blue_action`
-- -----------------------------
INSERT INTO `blue_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `blue_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `blue_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `blue_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `blue_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `blue_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `blue_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `blue_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `blue_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `blue_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `blue_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- -----------------------------
-- Table structure for `blue_action_log`
-- -----------------------------
DROP TABLE IF EXISTS `blue_action_log`;
CREATE TABLE `blue_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- -----------------------------
-- Records of `blue_action_log`
-- -----------------------------
INSERT INTO `blue_action_log` VALUES ('1', '1', '1', '1900334795', 'member', '1', 'admin在2015-07-13 10:08登录了后台', '1', '1436753305');
INSERT INTO `blue_action_log` VALUES ('2', '8', '1', '1900334795', 'attribute', '33', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436754961');
INSERT INTO `blue_action_log` VALUES ('3', '8', '1', '1900334795', 'attribute', '34', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436754961');
INSERT INTO `blue_action_log` VALUES ('4', '8', '1', '1900334795', 'attribute', '35', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436754961');
INSERT INTO `blue_action_log` VALUES ('5', '7', '1', '1900334795', 'model', '4', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436755010');
INSERT INTO `blue_action_log` VALUES ('6', '7', '1', '1900334795', 'model', '4', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436755027');
INSERT INTO `blue_action_log` VALUES ('7', '8', '1', '1900334795', 'attribute', '35', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436755039');
INSERT INTO `blue_action_log` VALUES ('8', '8', '1', '1900334795', 'attribute', '34', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436755047');
INSERT INTO `blue_action_log` VALUES ('9', '8', '1', '1900334795', 'attribute', '36', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436756386');
INSERT INTO `blue_action_log` VALUES ('10', '8', '1', '1900334795', 'attribute', '37', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436756386');
INSERT INTO `blue_action_log` VALUES ('11', '8', '1', '1900334795', 'attribute', '38', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436756386');
INSERT INTO `blue_action_log` VALUES ('12', '7', '1', '1900334795', 'model', '5', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436756417');
INSERT INTO `blue_action_log` VALUES ('13', '7', '1', '1900334795', 'model', '5', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436756427');
INSERT INTO `blue_action_log` VALUES ('14', '8', '1', '1900334795', 'attribute', '38', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436756456');
INSERT INTO `blue_action_log` VALUES ('15', '8', '1', '1900334795', 'attribute', '37', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436756467');
INSERT INTO `blue_action_log` VALUES ('16', '8', '1', '1900334795', 'attribute', '36', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436756477');
INSERT INTO `blue_action_log` VALUES ('17', '1', '1', '244539190', 'member', '1', 'admin在2015-07-14 11:17登录了后台', '1', '1436843831');
INSERT INTO `blue_action_log` VALUES ('18', '8', '1', '244539190', 'attribute', '36', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436843867');
INSERT INTO `blue_action_log` VALUES ('19', '8', '1', '244539190', 'attribute', '39', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436844098');
INSERT INTO `blue_action_log` VALUES ('20', '8', '1', '244539190', 'attribute', '40', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436844098');
INSERT INTO `blue_action_log` VALUES ('21', '8', '1', '244539190', 'attribute', '41', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436844098');
INSERT INTO `blue_action_log` VALUES ('22', '7', '1', '244539190', 'model', '6', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436844118');
INSERT INTO `blue_action_log` VALUES ('23', '7', '1', '244539190', 'model', '6', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436844130');
INSERT INTO `blue_action_log` VALUES ('24', '8', '1', '244539190', 'attribute', '41', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436844141');
INSERT INTO `blue_action_log` VALUES ('25', '8', '1', '244539190', 'attribute', '42', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436845579');
INSERT INTO `blue_action_log` VALUES ('26', '8', '1', '244539190', 'attribute', '43', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436845579');
INSERT INTO `blue_action_log` VALUES ('27', '8', '1', '244539190', 'attribute', '44', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436845579');
INSERT INTO `blue_action_log` VALUES ('28', '8', '1', '244539190', 'attribute', '45', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436845579');
INSERT INTO `blue_action_log` VALUES ('29', '7', '1', '244539190', 'model', '7', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436845601');
INSERT INTO `blue_action_log` VALUES ('30', '7', '1', '244539190', 'model', '7', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436845613');
INSERT INTO `blue_action_log` VALUES ('31', '8', '1', '244539190', 'attribute', '45', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436845625');
INSERT INTO `blue_action_log` VALUES ('32', '8', '1', '244539190', 'attribute', '44', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436845634');
INSERT INTO `blue_action_log` VALUES ('33', '8', '1', '244539190', 'attribute', '46', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436861944');
INSERT INTO `blue_action_log` VALUES ('34', '8', '1', '244539190', 'attribute', '47', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436861944');
INSERT INTO `blue_action_log` VALUES ('35', '8', '1', '244539190', 'attribute', '48', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436861944');
INSERT INTO `blue_action_log` VALUES ('36', '8', '1', '244539190', 'attribute', '49', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436861944');
INSERT INTO `blue_action_log` VALUES ('37', '8', '1', '244539190', 'attribute', '50', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1436861944');
INSERT INTO `blue_action_log` VALUES ('38', '7', '1', '244539190', 'model', '8', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436861976');
INSERT INTO `blue_action_log` VALUES ('39', '7', '1', '244539190', 'model', '8', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1436861992');
INSERT INTO `blue_action_log` VALUES ('40', '8', '1', '244539190', 'attribute', '50', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436862007');
INSERT INTO `blue_action_log` VALUES ('41', '8', '1', '244539190', 'attribute', '49', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436862018');
INSERT INTO `blue_action_log` VALUES ('42', '8', '1', '244539190', 'attribute', '48', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1436862026');
INSERT INTO `blue_action_log` VALUES ('43', '1', '1', '244539362', 'member', '1', 'admin在2015-07-21 15:20登录了后台', '1', '1437463249');
INSERT INTO `blue_action_log` VALUES ('44', '8', '1', '244539362', 'attribute', '51', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437463343');
INSERT INTO `blue_action_log` VALUES ('45', '8', '1', '244539362', 'attribute', '36', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437463379');
INSERT INTO `blue_action_log` VALUES ('46', '8', '1', '244539362', 'attribute', '52', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463563');
INSERT INTO `blue_action_log` VALUES ('47', '8', '1', '244539362', 'attribute', '53', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463563');
INSERT INTO `blue_action_log` VALUES ('48', '8', '1', '244539362', 'attribute', '54', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463563');
INSERT INTO `blue_action_log` VALUES ('49', '8', '1', '244539362', 'attribute', '55', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463563');
INSERT INTO `blue_action_log` VALUES ('50', '8', '1', '244539362', 'attribute', '56', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('51', '8', '1', '244539362', 'attribute', '57', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('52', '8', '1', '244539362', 'attribute', '58', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('53', '8', '1', '244539362', 'attribute', '59', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('54', '8', '1', '244539362', 'attribute', '60', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('55', '8', '1', '244539362', 'attribute', '61', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('56', '8', '1', '244539362', 'attribute', '62', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437463571');
INSERT INTO `blue_action_log` VALUES ('57', '7', '1', '244539362', 'model', '9', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437463604');
INSERT INTO `blue_action_log` VALUES ('58', '7', '1', '244539362', 'model', '10', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437463635');
INSERT INTO `blue_action_log` VALUES ('59', '8', '1', '244539362', 'attribute', '62', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437464302');
INSERT INTO `blue_action_log` VALUES ('60', '8', '1', '244539362', 'attribute', '61', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437464337');
INSERT INTO `blue_action_log` VALUES ('61', '7', '1', '244539362', 'model', '10', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464405');
INSERT INTO `blue_action_log` VALUES ('62', '8', '1', '244539362', 'attribute', '55', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437464424');
INSERT INTO `blue_action_log` VALUES ('63', '8', '1', '244539362', 'attribute', '54', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437464446');
INSERT INTO `blue_action_log` VALUES ('64', '7', '1', '244539362', 'model', '9', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464461');
INSERT INTO `blue_action_log` VALUES ('65', '7', '1', '244539362', 'model', '8', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464560');
INSERT INTO `blue_action_log` VALUES ('66', '7', '1', '244539362', 'model', '6', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464572');
INSERT INTO `blue_action_log` VALUES ('67', '7', '1', '244539362', 'model', '5', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464585');
INSERT INTO `blue_action_log` VALUES ('68', '7', '1', '244539362', 'model', '4', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437464621');
INSERT INTO `blue_action_log` VALUES ('69', '8', '1', '244539362', 'attribute', '53', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437464742');
INSERT INTO `blue_action_log` VALUES ('70', '9', '1', '244539362', 'channel', '0', '操作url：/blueflame/index.php?s=/admin/channel/del/id/1.html', '1', '1437466030');
INSERT INTO `blue_action_log` VALUES ('71', '9', '1', '244539362', 'channel', '0', '操作url：/blueflame/index.php?s=/admin/channel/del/id/2.html', '1', '1437466034');
INSERT INTO `blue_action_log` VALUES ('72', '9', '1', '244539362', 'channel', '0', '操作url：/blueflame/index.php?s=/admin/channel/del/id/3.html', '1', '1437466056');
INSERT INTO `blue_action_log` VALUES ('73', '10', '1', '244539362', 'Menu', '2', '操作url：/blueflame/index.php?s=/admin/menu/edit.html', '1', '1437466076');
INSERT INTO `blue_action_log` VALUES ('74', '10', '1', '244539362', 'Menu', '68', '操作url：/blueflame/index.php?s=/admin/menu/edit.html', '1', '1437466093');
INSERT INTO `blue_action_log` VALUES ('75', '1', '1', '244539362', 'member', '1', 'admin在2015-07-22 13:34登录了后台', '1', '1437543262');
INSERT INTO `blue_action_log` VALUES ('76', '8', '1', '244539362', 'attribute', '63', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437543276');
INSERT INTO `blue_action_log` VALUES ('77', '8', '1', '244539362', 'attribute', '64', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437543276');
INSERT INTO `blue_action_log` VALUES ('78', '8', '1', '244539362', 'attribute', '65', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437543276');
INSERT INTO `blue_action_log` VALUES ('79', '8', '1', '244539362', 'attribute', '66', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437543276');
INSERT INTO `blue_action_log` VALUES ('80', '8', '1', '244539362', 'attribute', '67', '操作url：/blueflame/index.php?s=/admin/model/generate.html', '1', '1437543276');
INSERT INTO `blue_action_log` VALUES ('81', '7', '1', '244539362', 'model', '11', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437543316');
INSERT INTO `blue_action_log` VALUES ('82', '7', '1', '244539362', 'model', '11', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437543332');
INSERT INTO `blue_action_log` VALUES ('83', '7', '1', '244539362', 'model', '11', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437543355');
INSERT INTO `blue_action_log` VALUES ('84', '8', '1', '244539362', 'attribute', '67', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437543368');
INSERT INTO `blue_action_log` VALUES ('85', '8', '1', '244539362', 'attribute', '66', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437543377');
INSERT INTO `blue_action_log` VALUES ('86', '8', '1', '244539362', 'attribute', '65', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437543383');
INSERT INTO `blue_action_log` VALUES ('87', '8', '1', '244539362', 'attribute', '64', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437543392');
INSERT INTO `blue_action_log` VALUES ('88', '1', '1', '244538893', 'member', '1', 'admin在2015-07-23 16:34登录了后台', '1', '1437640446');
INSERT INTO `blue_action_log` VALUES ('89', '7', '1', '244538893', 'model', '12', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437640473');
INSERT INTO `blue_action_log` VALUES ('90', '8', '1', '244538893', 'attribute', '68', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437640542');
INSERT INTO `blue_action_log` VALUES ('91', '8', '1', '244538893', 'attribute', '69', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437640582');
INSERT INTO `blue_action_log` VALUES ('92', '8', '1', '244538893', 'attribute', '70', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437640603');
INSERT INTO `blue_action_log` VALUES ('93', '7', '1', '244538893', 'model', '12', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437640686');
INSERT INTO `blue_action_log` VALUES ('94', '1', '1', '244538893', 'member', '1', 'admin在2015-07-24 08:37登录了后台', '1', '1437698251');
INSERT INTO `blue_action_log` VALUES ('95', '1', '1', '244538893', 'member', '1', 'admin在2015-07-24 14:31登录了后台', '1', '1437719462');
INSERT INTO `blue_action_log` VALUES ('96', '8', '1', '244538893', 'attribute', '69', '操作url：/blueflame/index.php?s=/admin/attribute/remove/id/69.html', '1', '1437719533');
INSERT INTO `blue_action_log` VALUES ('97', '7', '1', '244538893', 'model', '13', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437722446');
INSERT INTO `blue_action_log` VALUES ('98', '8', '1', '244538893', 'attribute', '71', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437722524');
INSERT INTO `blue_action_log` VALUES ('99', '8', '1', '244538893', 'attribute', '72', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437722548');
INSERT INTO `blue_action_log` VALUES ('100', '8', '1', '244538893', 'attribute', '73', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437722578');
INSERT INTO `blue_action_log` VALUES ('101', '8', '1', '244538893', 'attribute', '74', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1437722606');
INSERT INTO `blue_action_log` VALUES ('102', '7', '1', '244538893', 'model', '13', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437722626');
INSERT INTO `blue_action_log` VALUES ('103', '7', '1', '244538893', 'model', '13', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1437722657');
INSERT INTO `blue_action_log` VALUES ('104', '1', '1', '-1224345485', 'member', '1', 'admin在2015-07-26 11:36登录了后台', '1', '1437881816');
INSERT INTO `blue_action_log` VALUES ('105', '1', '1', '244536385', 'member', '1', 'admin在2015-07-27 10:03登录了后台', '1', '1437962588');
INSERT INTO `blue_action_log` VALUES ('106', '1', '1', '244537539', 'member', '1', 'admin在2015-07-28 09:57登录了后台', '1', '1438048662');
INSERT INTO `blue_action_log` VALUES ('107', '7', '1', '244537539', 'model', '14', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1438071614');
INSERT INTO `blue_action_log` VALUES ('108', '8', '1', '244537539', 'attribute', '75', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1438071642');
INSERT INTO `blue_action_log` VALUES ('109', '8', '1', '244537539', 'attribute', '76', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1438071663');
INSERT INTO `blue_action_log` VALUES ('110', '8', '1', '244537539', 'attribute', '77', '操作url：/blueflame/index.php?s=/admin/attribute/update.html', '1', '1438071683');
INSERT INTO `blue_action_log` VALUES ('111', '7', '1', '244537539', 'model', '14', '操作url：/blueflame/index.php?s=/admin/model/update.html', '1', '1438071700');
INSERT INTO `blue_action_log` VALUES ('112', '1', '1', '244537539', 'member', '1', 'admin在2015-07-29 09:00登录了后台', '1', '1438131619');
INSERT INTO `blue_action_log` VALUES ('113', '1', '1', '244539082', 'member', '1', 'admin在2015-07-29 17:13登录了后台', '1', '1438161191');
INSERT INTO `blue_action_log` VALUES ('114', '1', '1', '-1224345120', 'member', '1', 'admin在2015-07-29 20:15登录了后台', '1', '1438172145');
INSERT INTO `blue_action_log` VALUES ('115', '1', '1', '244539082', 'member', '1', 'admin在2015-07-30 08:45登录了后台', '1', '1438217151');
INSERT INTO `blue_action_log` VALUES ('116', '1', '1', '244539082', 'member', '1', 'admin在2015-07-30 10:16登录了后台', '1', '1438222593');
INSERT INTO `blue_action_log` VALUES ('117', '1', '1', '244539082', 'member', '1', 'admin在2015-07-30 13:37登录了后台', '1', '1438234643');
INSERT INTO `blue_action_log` VALUES ('118', '10', '1', '244539082', 'Menu', '93', '操作url：/blueflame/index.php?s=/admin/menu/edit.html', '1', '1438234820');
INSERT INTO `blue_action_log` VALUES ('119', '10', '1', '244539082', 'Menu', '93', '操作url：/blueflame/index.php?s=/admin/menu/edit.html', '1', '1438234826');

-- -----------------------------
-- Table structure for `blue_addons`
-- -----------------------------
DROP TABLE IF EXISTS `blue_addons`;
CREATE TABLE `blue_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- -----------------------------
-- Records of `blue_addons`
-- -----------------------------
INSERT INTO `blue_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `blue_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `blue_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `blue_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `blue_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `blue_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `blue_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- -----------------------------
-- Table structure for `blue_attachment`
-- -----------------------------
DROP TABLE IF EXISTS `blue_attachment`;
CREATE TABLE `blue_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';


-- -----------------------------
-- Table structure for `blue_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `blue_attribute`;
CREATE TABLE `blue_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- -----------------------------
-- Records of `blue_attribute`
-- -----------------------------
INSERT INTO `blue_attribute` VALUES ('68', 'title', '内容标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '0', '1', '1437640542', '1437640542', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('67', 'thumb', '缩略图', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '11', '0', '1', '1437543368', '1437543277', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('66', 'addtime', '添加时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '11', '0', '1', '1437543377', '1437543277', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('65', 'url', '案例链接', 'varchar(255) NOT NULL ', 'textarea', '', '', '1', '', '11', '0', '1', '1437543383', '1437543277', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('64', 'intro', '案例简介', 'text NOT NULL ', 'editor', '', '', '1', '', '11', '0', '1', '1437543392', '1437543277', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('63', 'title', '案例标题', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '11', '0', '1', '1437543277', '1437543277', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('62', 'addtime', '留言时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '10', '0', '1', '1437464302', '1437463571', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('61', 'content', '留言内容', 'text NOT NULL ', 'editor', '', '', '1', '', '10', '0', '1', '1437464337', '1437463571', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('59', 'phone', '联系电话', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1437463571', '1437463571', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('60', 'email', 'Email', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1437463571', '1437463571', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('58', 'sex', '性别', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1437463571', '1437463571', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('57', 'username', '联系人', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1437463571', '1437463571', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('56', 'company', '公司名称', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '10', '0', '1', '1437463571', '1437463571', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('54', 'content', '个人简历', 'text NOT NULL ', 'editor', '', '', '1', '', '9', '0', '1', '1437464446', '1437463563', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('55', 'addtime', '添加时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '9', '0', '1', '1437464424', '1437463563', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('53', 'head_img', '头像', 'text NOT NULL ', 'picture', '', '', '1', '', '9', '0', '1', '1437464742', '1437463563', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('52', 'info', '个人简介', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1437463563', '1437463563', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('51', 'thumb', '缩略图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '5', '0', '1', '1437463343', '1437463343', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('49', 'addtime', '添加时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '8', '0', '1', '1436862018', '1436861944', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('50', 'logo', '案例logo', 'int(10) unsigned NOT NULL ', 'picture', '', '', '1', '', '8', '0', '1', '1436862007', '1436861944', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('48', 'content', '案例内容', 'text NOT NULL ', 'editor', '', '', '1', '', '8', '0', '1', '1436862026', '1436861944', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('33', 'title', '', 'varchar(30) NOT NULL ', 'string', '', '', '1', '', '4', '0', '1', '1436754961', '1436754961', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('34', 'content', '', 'varchar(255) NOT NULL ', 'editor', '', '', '1', '', '4', '0', '1', '1436755047', '1436754961', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('35', 'createtime', '', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '4', '0', '1', '1436755039', '1436754961', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('36', 'title', '新闻标题', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1437463379', '1436756386', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('37', 'content', '新闻内容', 'text NOT NULL ', 'editor', '', '', '1', '', '5', '0', '1', '1436756467', '1436756386', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('38', 'createtime', '添加时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '5', '0', '1', '1436756456', '1436756386', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('39', 'category', '案例类型', 'varchar(200) NOT NULL ', 'string', '', '', '1', '', '6', '0', '1', '1436844098', '1436844098', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('40', 'cid', '案例类型id', 'int(11) NOT NULL ', 'string', '', '', '1', '', '6', '0', '1', '1436844098', '1436844098', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('41', 'createtime', '添加时间', 'timestamp NOT NULL ', 'string', 'CURRENT_TIMESTAMP', '', '0', '', '6', '0', '1', '1436844141', '1436844098', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `blue_attribute` VALUES ('47', 'cid', '所属类型', 'int(11) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1436861944', '1436861944', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('46', 'title', '案例名称', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1436861944', '1436861944', '', '0', '', '', '', '0', '');
INSERT INTO `blue_attribute` VALUES ('71', 'title', '影视标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '13', '0', '1', '1437722524', '1437722524', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('70', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '12', '0', '1', '1437640604', '1437640604', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('72', 'intro', '影视简介', 'text NOT NULL', 'editor', '', '', '1', '', '13', '0', '1', '1437722549', '1437722549', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('73', 'thumb', '缩略图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '13', '0', '1', '1437722578', '1437722578', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('74', 'addtime', '添加时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '13', '0', '1', '1437722606', '1437722606', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('75', 'title', '名称', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '14', '0', '1', '1438071642', '1438071642', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('76', 'logo', '缩略图', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', '1', '', '14', '0', '1', '1438071663', '1438071663', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `blue_attribute` VALUES ('77', 'content', '内容', 'text NOT NULL', 'editor', '', '', '1', '', '14', '0', '1', '1438071683', '1438071683', '', '3', '', 'regex', '', '3', 'function');

-- -----------------------------
-- Table structure for `blue_auth_extend`
-- -----------------------------
DROP TABLE IF EXISTS `blue_auth_extend`;
CREATE TABLE `blue_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- -----------------------------
-- Records of `blue_auth_extend`
-- -----------------------------
INSERT INTO `blue_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `blue_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `blue_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `blue_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `blue_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `blue_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `blue_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `blue_auth_extend` VALUES ('1', '37', '1');

-- -----------------------------
-- Table structure for `blue_auth_group`
-- -----------------------------
DROP TABLE IF EXISTS `blue_auth_group`;
CREATE TABLE `blue_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_auth_group`
-- -----------------------------
INSERT INTO `blue_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `blue_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- -----------------------------
-- Table structure for `blue_auth_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `blue_auth_group_access`;
CREATE TABLE `blue_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `blue_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `blue_auth_rule`;
CREATE TABLE `blue_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_auth_rule`
-- -----------------------------
INSERT INTO `blue_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `blue_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `blue_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- -----------------------------
-- Table structure for `blue_case`
-- -----------------------------
DROP TABLE IF EXISTS `blue_case`;
CREATE TABLE `blue_case` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL COMMENT '案例类型',
  `cid` int(11) NOT NULL COMMENT '案例类型id',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_case`
-- -----------------------------
INSERT INTO `blue_case` VALUES ('1', '奢侈品/服饰类', '1', '2015-07-14 11:23:03');
INSERT INTO `blue_case` VALUES ('2', '电子/手机类', '2', '2015-07-14 16:38:08');
INSERT INTO `blue_case` VALUES ('3', '建材家居类', '3', '2015-07-14 16:41:10');
INSERT INTO `blue_case` VALUES ('4', '服务业/药品/保健品', '4', '2015-07-14 16:41:21');
INSERT INTO `blue_case` VALUES ('5', '汽车/化妆品/房地产类', '5', '2015-07-14 16:41:32');
INSERT INTO `blue_case` VALUES ('6', '食品/化妆品', '6', '2015-07-14 16:41:41');

-- -----------------------------
-- Table structure for `blue_cases`
-- -----------------------------
DROP TABLE IF EXISTS `blue_cases`;
CREATE TABLE `blue_cases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '案例名称',
  `cid` int(11) NOT NULL COMMENT '所属类型',
  `content` text NOT NULL COMMENT '案例内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `logo` int(10) unsigned NOT NULL COMMENT '案例logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_cases`
-- -----------------------------
INSERT INTO `blue_cases` VALUES ('1', '芙蓉王', '1', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899626e671.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8996302949.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8996356e38.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89963ba4dd.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89964ef0c7.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899652ca33.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2015-07-14 16:23:10', '1');
INSERT INTO `blue_cases` VALUES ('2', '金立手机', '2', '<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899e8569ac.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899e8ce68c.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899ea52d50.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b899eb80b4f.jpg\" alt=\"\" />', '2015-07-14 16:39:11', '2');
INSERT INTO `blue_cases` VALUES ('4', '奥康', '1', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89a81ce78a.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89a941afef.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ac562a59.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ad0a1820.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89aeb54689.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89af84cf7c.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b0603ef8.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b0eec898.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b28a8a74.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b301ab7e.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b38358e5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b446e58a.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b4c84ad5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89b5595b9d.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bb5d039e.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bbf3d3a5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bc544a8d.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bcc4ecde.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bd46af69.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bddc030e.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89be657f4f.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89bec13ebe.jpg\" alt=\"\" />\r\n</p>', '2015-07-27 10:14:38', '32');
INSERT INTO `blue_cases` VALUES ('5', '法派西服', '1', '<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59429aeef3.JPG\" alt=\"\" />', '2015-07-27 10:15:07', '33');
INSERT INTO `blue_cases` VALUES ('6', '家谱酒', '1', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59450b56b0.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b5945a4b75a.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59461c43f0.jpg\" alt=\"\" /> \r\n</p>', '2015-07-27 10:16:05', '34');
INSERT INTO `blue_cases` VALUES ('7', '康龙休闲鞋', '1', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n从快乐体验到轻生活方式<br />\r\n康龙品牌重塑<br />\r\n<br />\r\n策划背景:<br />\r\n国内休闲市场正处于高速发展初期，康龙休闲鞋要如何进行品牌重塑，实现休闲鞋行业第一领导品牌的梦想？<br />\r\n<br />\r\n2010-2011、挖掘品牌内涵，清晰品牌形象<br />\r\n<br />\r\n品牌策略:<br />\r\n高速运转的时代给人们带来更多压力与焦虑，倍感压抑，向往快乐。以“放松一下”为品牌主张的康龙倡导低碳环保、健康快乐的都市休闲方式。从中，我们提炼出一个关键词——“快乐”，定下2010年度推广主题：快乐就在脚下！于2010年8月签约湖南卫视当红主持天团“快乐家族”，康龙快乐营销全面强势启动。<br />\r\n<br />\r\n推广实施：<br />\r\n1、快乐产品：以快乐家族纪念版休闲鞋为代表；<br />\r\n2、快乐音乐：快乐家族第一张专辑《快乐你懂的》主打歌定为康龙品牌广告歌；<br />\r\n3、快乐舞步：专门针对都市人群的康龙快乐舞步也随着《快乐你懂的》的音乐而诞生。<br />\r\n4、快乐形象： 线上“快乐TVC”，线下根据康龙“快乐家族”卡通形象，开发系列“快乐礼品”，为活化终端。<br />\r\n5、快乐促销：在提供产品优惠的同时，让消费者感受到快乐。<br />\r\n6、快乐活动：“快乐家族，快乐出发”康龙时尚顾问新闻发布会；“快乐家族”首张音乐专辑现场签售会；“龙飞凤舞耀全城”品牌招商会及“星尚之夜”新品鉴赏秀。<br />\r\n<br />\r\n实施效果<br />\r\n通过快乐家族的代言和系列推广活动，将快乐因子融入到品牌中，传递出真实自然、轻松愉悦、注重个人感受的品牌个性，为品牌建立了高识别度，提升了康龙的知名度和美誉度。<br />\r\n<br />\r\n2012、产品落地，深度沟通，终端战略提升<br />\r\n<br />\r\n品牌策略：<br />\r\n“快乐”成为消费者对品牌的感受后，如何实现产品力、传播力和终端力的全面突破？基于对消费群体沉重生存状态的洞察，为康龙休闲鞋全新推出“轻生活“的品牌价值主张，打通品牌理念和产品利益，并藉此建立了清晰完整的品牌体系。<br />\r\n<br />\r\n推广实施：<br />\r\n为实现康龙品牌产品力、推广力、终端力“三力”落地，打造真正具有领先竞争优势的休闲鞋领导品牌，康龙全面发力，推出六大“创新工程”。<br />\r\n第一， 产品创新：聚焦功能定位，大力开发功能鞋；设计升级，以“全民设计”概念结合“微电影中国”的众包微电影制作，打造康龙设计年。<br />\r\n第二， 模式创新：打造富有活力与效率并区别于奥康的全新营销模式；<br />\r\n第三， 管理创新：建设积极进取、勇于开拓的“狼群”团队；<br />\r\n第四， 品牌创新：全面升级品牌CI、VI和SI系统，建立品牌新形象；<br />\r\n第五， 传播创新：整合跨媒体传播平台，强化微电影、微博等社会化媒体效应，并谋求与湖南卫视“快乐大本营”专场互动。<br />\r\n第六， 服务创新：加强终端店员培训，打造终端服务亮点<br />\r\n<br />\r\n效果预估：<br />\r\n<p>\r\n	“轻生活”品牌价值得到有效传播和推广，系统创新以实现康龙品牌力和销售力的双提升，康龙休闲鞋将朝着“中国休闲鞋第一品牌”的梦想再进一大步。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89d3b89f68.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;康龙时尚发布会\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89d5c7fb23.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;康龙新品鉴赏会\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89d76bdc38.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;康龙促销活动\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89d8f14911.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89d9df28a2.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89da7b3533.jpg\" alt=\"\" /> \r\n</p>', '2015-07-27 10:22:08', '35');
INSERT INTO `blue_cases` VALUES ('8', '红火鸟韩版鞋', '1', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b597567dd86.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b5975c4711b.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b597618822f.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b597695cbd8.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e0ef3997.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2293b65.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2310e24.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e23a19a5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2523365.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2615ecd.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e274eed2.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e28200f3.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e28df2e8.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2a3b141.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2b15449.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2bd01d5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2d791d4.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2e9e30b.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e2f5dc7e.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e3084cfa.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89e30bd122.jpg\" alt=\"\" />\r\n</p>', '2015-07-27 10:29:02', '36');
INSERT INTO `blue_cases` VALUES ('9', '珠江钢琴', '1', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59dc291161.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59dc94eebc.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59dcf8d6d5.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-27/55b59dd6cead3.jpg\" alt=\"\" /> \r\n</p>', '2015-07-27 10:56:25', '37');
INSERT INTO `blue_cases` VALUES ('10', '威尔萨斯', '1', '<p>\r\n	<strong><span style=\"font-size:16px;\"><br />\r\n</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:16px;\">每一款经典的女包，都有她自己的故事</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:16px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89f0045045.png\" alt=\"\" /><br />\r\n</span></strong>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\">项目背景：</span><br />\r\n<span style=\"font-size:14px;\">VSVELSUS威尔萨斯品牌源自意大利佛罗伦萨，专做女包，在企业找到蓝火的时候已做了近十年，虽然进入了国内大部分城市的商场，销售渠道和网络已初具规模，但利润比较偏低，品牌认知度不够，且品牌形象和产品形象缺乏规范化和统一性，令人无法将“奢侈品”这一概念与VS的终端形象联系起来。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">传统的奢侈品除了具有独一无二的性质外还可以为消费者提供一种高高在上的优越感，这些商品只是为某种阶层的人所拥有。而新奢侈品就避免了等级的区分，它们凭借的是能被社会各界，许多收入层的人所能够接受的价值。</span><br />\r\n<span style=\"font-size:14px;\">索尔斯坦.凡博伦（thorstein veblen）美国的经济学家和社会学家。在《有闲阶级论》谈到“商品已经不再是一个简单的生产和消费的问题，而变成了一种社会对话的语言”。“显示金钱力量的方式是对商品的炫耀性消费和休闲。”新奢侈品基于一种情感需求之上，消费者对于它所倾注的感情要远胜于其他产品。</span><br />\r\n<span style=\"font-size:14px;\">例如：苹果机, levi’s 的限量版牛仔裤、依云矿泉水、CK、Tommy Hilfiger这些产品被称为新奢侈品。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">策略方向：</span><br />\r\n<span style=\"font-size:14px;\">女人为什么肯花钱在大量的化妆品、服装、手袋、及奢侈品上面？大部分的女人是冲动型消费的动物，购物和装扮自己是女人的本性！</span><br />\r\n<span style=\"font-size:14px;\">那么，是什么促使她们购买？——从心智上去征服女性，才是根本。</span><br />\r\n<span style=\"font-size:14px;\">VS不是卖包，VS卖的是【内涵】</span><br />\r\n<span style=\"font-size:14px;\">美丽女人，不仅仅是外表吸引，更重要是永恒的内涵；VS，不仅仅是一种产品，更应该是一种文化、一种信仰！</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">消费群定位：</span><br />\r\n<span style=\"font-size:14px;\">小资女人——25岁-35岁的“年轻”女性（所谓“年轻”，在这里更多的是指心态，和她们追求的那种永葆青春的生活态度。）</span><br />\r\n<span style=\"font-size:14px;\">何谓小资？具有一定的经济收入，素质高，喜欢新事物，具有一定的生活品味，崇洋媚外，对物质生活有追求、讲品味、追时尚；崇尚名牌但囊中又略嫌羞涩的女性。</span><br />\r\n<span style=\"font-size:14px;\">——她们是品牌最大的向往者，也是最大的传播者！</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">品牌定位：</span><br />\r\n<span style=\"font-size:14px;\">让消费者崇拜VS，给VS一个百分百的纯正血统</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">100%意大利——极致、纯粹、无可挑剔</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;如果一件衣服不能让你穿着舒适，那它绝不够意大利；</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;如果一把椅子不能令你叹为观止，那肯定不是意大利；</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;每年定期在米兰举办的时装展、家具展、艺术展依然代表了世界最高水平。</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;如果你对极度热烈或者绝对简洁的色彩一见钟情，那可能是意大利元素在作怪；</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;如果你对触感和细节具有令人无法忍受的挑剔，就离意大利味道不远了。</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;意大利的味道来源于那片土地上渊源的文化和生长在那里的创意。</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;意大利不但拥有正宗的欧洲古典风格，同时也是现代设计最具活力的地方。</span><br />\r\n<span style=\"font-size:14px;\">• &nbsp; &nbsp;&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">——如果你不知道意大利的魅力，那你就称不上是一个地道的“小资女人”！</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">品牌策略：</span><br />\r\n<span style=\"font-size:14px;\">打造血统纯正的意大利时尚【精品】女包</span><br />\r\n<span style=\"font-size:14px;\">l &nbsp; &nbsp; &nbsp; &nbsp; 纯正——强调来源、突出优势、形成差异</span><br />\r\n<span style=\"font-size:14px;\">l &nbsp; &nbsp; &nbsp; &nbsp; 时尚——不守旧、不落后、不古板</span><br />\r\n<span style=\"font-size:14px;\">l &nbsp; &nbsp; &nbsp; &nbsp; 精品——培养一种意识、倡导一种行为、建立一种标准</span><br />\r\n<span style=\"font-size:14px;\">——形成一种精品文化</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">战术实施：</span><br />\r\n<span style=\"font-size:14px;\">如何把意大利的元素融入我们的品牌中？——体验意大利的浪漫和优雅</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">我们制作一个个关于VS的故事：当一个男人邂逅一个女人……当咖啡遇上红酒……当时尚遇到潮流……当女人看到VS……我们的故事一直都在延续……</span><br />\r\n<span style=\"font-size:14px;\">我们制作一个个，关于Love的故事：男人和女人经典的爱情主题，每一天都在不同的角落发生……</span><br />\r\n<span style=\"font-size:14px;\">品牌故事、品牌视频、画册设计、杂志广告、店面布置、网站宣传……VS的故事无处不在……</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">VS概念店的延伸——白天找找咖啡的感觉；晚上延续红酒的情调</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<br />\r\n<span style=\"font-size:14px;\">VS品牌核心价值：</span><br />\r\n<span style=\"font-size:14px;\">爱与美</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89f3ec894e.jpg\" alt=\"\" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\">品牌广告语：<br />\r\n爱在优雅，与生俱来<br />\r\nlove &amp; elegance, born with you<br />\r\n&nbsp;<br />\r\n推广策略：<br />\r\n品牌层面——传递“爱在优雅，与生俱来”的品牌主张，倡导优雅的女性生活做派<br />\r\n产品层面——强化产品质量方面的“精品”意识，使用体验为优雅<br />\r\n终端层面——加强终端的“优雅”体验，提升品牌好感度，增加试用与购买<br />\r\n&nbsp;<br />\r\n活动案例：<br />\r\n以VS引领城中潮人聚会，联合酒商赞助，共同打造主题类私人party；利用明星（或圈中人）的魅力，带出VS的潮流，营造娱乐类媒体追捧的焦点。<br />\r\n&nbsp;<br />\r\n十年挚爱，从心开始——相约佛罗伦萨发布会<br />\r\n公元2010年9月15日，VSVELSUS迎来了辉煌的一天。<br />\r\n全国经销商及嘉宾近千人参加了由广州市威尔萨斯服饰皮具有限公司主办的“十年挚爱、从心开始——再遇佛罗伦萨”十周年盛大庆典活动。<br />\r\n活动在充满欧陆小镇风情的广州花都玖珑湖公主酒店举行，除了由30位名模表演的女包秀这一重头戏之外，大会还专门安排了意大利冷餐会、意大利歌剧、灰雁名酒品鉴会、街头行为艺术表演等内容。涉身其中的来宾就如同经历了一次难得的佛罗伦萨之旅，尽情领略了热情洋溢的意大利风情，也更加体会到VSVELSUS那种从希腊女神维纳斯身上延伸出来的“爱”与“美”的优雅品牌内涵。<br />\r\n当晚由国内外30名模特同台展示了VSVELSUS的2010/2011年度新产品，其制作工艺和款式花色令到场行家们赞不绝口。整整2个小时的T台时尚秀令人目不暇接，全程沸腾。<br />\r\n<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89f5d620d8.jpg\" alt=\"\" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\"><br />\r\n除了名模T台秀外，主演《娜娜的玫瑰战争》的韩国新生代的偶像级明星李承铉与Joanne Lee以黑白双煞的服装造型搭配亮相舞台，时尚感十足。他们带来劲歌热舞，令到现场的来宾热情高涨。<br />\r\n而特邀明星伊能静小姐以一袭粉红色露背长裙靓丽现身，精致的妆容搭配娇媚的礼服，瞬间惊艳全场，她的压轴演唱《月亮儿弯弯 》和《你是我的幸福吗》两首歌曲，掀起全场高潮。<br />\r\n活动成功举办，嘉宾赞不绝口，且很多后续的报道及网络新闻持续了三个多月，余温不断。<br />\r\n<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89f795f9c9.jpg\" alt=\"\" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fddb12d5.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fe131e37.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fe344a83.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fe5a9d3a.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fe85f025.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89feb278be.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fee49bdf.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ff05dcc5.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ff28d5a8.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ff57b314.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ff7e2c29.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ff9a8cbc.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ffb16abe.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ffd270d7.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89ffe831de.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b89fff918da.jpg\" alt=\"\" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a01f5814b.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a01fd2fd6.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a02122f8f.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0232a633.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a02462e1a.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a025f3d9c.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0276298c.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0290c4cc.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a02b166ea.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a02c90cba.jpg\" alt=\"\" /><br />\r\n</span></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><span style=\"font-size:14px;\"><br />\r\n</span></span>\r\n</p>', '2015-07-27 10:57:47', '38');
INSERT INTO `blue_cases` VALUES ('11', '创维电视', '2', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a08a97532.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a08aec115.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a08b50fe3.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a08c7300c.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a08dc32ae.jpg\" alt=\"\" />\r\n</p>', '2015-07-27 14:04:33', '39');
INSERT INTO `blue_cases` VALUES ('12', '好帮手电子', '2', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f2ccbb2.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f3f054d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f4bf40d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f56e985.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f6371fc.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f70f5b8.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f7d6bb2.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f8af422.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a0f9bc044.JPG\" alt=\"\" />\r\n</p>', '2015-07-27 14:06:15', '40');
INSERT INTO `blue_cases` VALUES ('13', '万利达', '2', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1a949de9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1aa5d15e.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1aaadad4.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ab37e4c.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ac00e6e.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ac6f34e.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1acd2f66.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ad436ad.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ade699e.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1aeb07af.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1afd0673.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1b0511e0.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1b095474.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1b104b6b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1e812894.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1e8b3fd9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1e9bc934.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a1ea5ca1a.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a20dc4b4b.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a20ec37b3.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a20f9a312.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2101b331.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2107ac18.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2110675d.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a21180c93.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a212135c0.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2129f17f.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2131473d.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2138045b.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a213f22c9.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2147fb6a.JPG\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a214cb44f.JPG\" alt=\"\" />\r\n</p>', '2015-07-27 14:12:51', '41');
INSERT INTO `blue_cases` VALUES ('14', '欧派', '3', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a278499b9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a27979798.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a279c6f31.JPG\" alt=\"\" />\r\n</p>', '2015-07-27 14:18:51', '42');
INSERT INTO `blue_cases` VALUES ('15', '慕思寝具', '1', '<p>\r\n	<span style=\"color:#092B6F;font-family:宋体;font-size:20px;line-height:32px;\"> </span> \r\n</p>\r\n<h2 class=\"rich_media_title\" id=\"activity-name\" style=\"font-weight:400;font-size:24px;font-family:\'Helvetica Neue\', Helvetica, \'Hiragino Sans GB\', \'Microsoft YaHei\', Arial, sans-serif;\">\r\n	慕思寝具<br />\r\n</h2>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-28/55b6e4c6d9d97.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">背景</span><br />\r\n<span style=\"font-size:12px;\">睡眠产业已经成为中国健康消费领域新的经济增长点。2011 年中国已成为全球第二大床垫市场，年消费增长率达 24%。众多改善睡眠产品的竞相上市，睡眠产业“前景”广阔。</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">高端寝具领导品牌慕思寝具经过近 10 年发展，推出 7 个子品牌，市场覆盖广泛。但子品牌的目标市场有所重叠，产品开发有所趋同，品牌形象有所冲突，同时，慕思企业设定百亿级的战略目标，因此必须对品牌进行进一步的提升；以协同企业各品牌之间的关系，共同推动企业战略目标的实现。</span><br />\r\n<br />\r\n<span style=\"font-size:14px;\">品牌课题</span><br />\r\n<span style=\"font-size:12px;\">1、品牌架构规划：对旗下 7 个子产品线品牌化与否及与母品牌慕思的品牌关系策略提出解决方案，以获得品牌建设资源的投入产出效益最大化。</span><br />\r\n<span style=\"font-size:12px;\">2、品牌定位拟定：为母品牌及旗下所有子产品线进行有市场竞争力的战略定位，规避品牌冲突，应对竞争对手对高端寝具市场的争夺。</span><br />\r\n<span style=\"font-size:12px;\">3、提升品牌形象内涵：提升慕思母子品牌</span>\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-28/55b6e4fb7de08.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">品牌战略规划</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\">1、市场调研</span><br />\r\n<span style=\"font-size:12px;\">通过 15 天对北京、上海、广州、深圳、东莞五大城的潜在消费者进行的深度定性调研，发现慕思主要消费人群为社会主流的富裕阶层或中产阶级，他们渴望在人生的1/3 时间里得到充分的健康睡眠，为人生其余 2/3 时间提供支持，实现精彩的人生梦想。但同时慕思旗下不同品牌所指向的细分市场又呈现出不同的消费需求和行为特征。</span><br />\r\n	<p>\r\n		<img src=\"/blueflame/Uploads/Editor/2015-07-28/55b6e522ece15.jpg\" alt=\"\" />\r\n	</p>\r\n	<p>\r\n		<span style=\"font-size:14px;\">2、品牌架构重新规划</span><br />\r\n品牌 / 产品架构的本质是资源分配，只有先明确整体的品牌架构及品牌相互关系，才能清晰慕思及各产品品牌作为其中之一扮演什么角色，采取什么品牌定位与价值主张。根据调研结果，对慕思现有各品牌之间的关系进行重新规划，以更清晰地界定各品牌之间的关系及在整个慕思中的角色。<br />\r\n1）纠正简单地以价位和风格区分产品品牌的做法，代之以对应不同价值需求市场将产品系列品牌化的策略，以谋求长远可持续发展的空间。<br />\r\n2）缩减品牌数量，将部分子品牌回归为慕思旗下产品系列，切断多品牌对营销资源的不恰当争夺。<br />\r\n3）采用混合品牌架构模式。兼顾母品牌慕思作为企业品牌、业务品牌、产品品牌 3方面角色的价值和任务，各个子产品品牌采取主副品牌关系策略作为向独立子品牌的过渡手段，以充分借用母品牌品牌资产。品牌的发展与打造是一个长期的过程，并非一蹴而就，需要经过长期的积累与沉淀。\r\n	</p>\r\n	<p>\r\n		<img src=\"/blueflame/Uploads/Editor/2015-07-28/55b6e53dd5bd5.jpg\" alt=\"\" /><br />\r\n		<div>\r\n			<br />\r\n		</div>\r\n	</p>\r\n	<p>\r\n		<br />\r\n	</p>\r\n<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2015-07-28 10:00:40', '43');
INSERT INTO `blue_cases` VALUES ('16', 'TSD手机', '2', '<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2c622bb8.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2c85d837.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2ca45fd8.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a2cbdeb57.jpg\" alt=\"\" />', '2015-07-29 17:54:34', '56');
INSERT INTO `blue_cases` VALUES ('17', 'TCL移动电话', '2', '<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a361ee9eb.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a362db0cb.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a3640af17.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a364a1bfc.jpg\" alt=\"\" />', '2015-07-29 17:56:56', '57');
INSERT INTO `blue_cases` VALUES ('18', '山水音响', '2', '<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a3bf93520.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a3bfe48b6.jpg\" alt=\"\" />', '2015-07-29 17:58:26', '58');
INSERT INTO `blue_cases` VALUES ('19', '爱多电器', '2', '<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a41271b54.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8a41352916.jpg\" alt=\"\" />', '2015-07-29 17:59:51', '59');
INSERT INTO `blue_cases` VALUES ('20', '杜邦', '3', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b974cfbfec2.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b974d015e6e.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b974d109931.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b974d292d3a.jpg\" alt=\"\" />', '2015-07-30 08:50:40', '60');
INSERT INTO `blue_cases` VALUES ('21', '华帝热水器', '3', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b975476e220.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97547b797a.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97548d3b74.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97549bd43b.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9754a382d8.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9754a923c3.jpg\" alt=\"\" />', '2015-07-30 08:52:32', '61');
INSERT INTO `blue_cases` VALUES ('22', '大自然地板', '3', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97629e4ba7.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762a2c8b9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762a58d6a.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762a92cb1.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762ad4a8d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762b2c319.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762b638a5.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762bb29f2.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762bf06d7.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762c5ebcc.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762cc7be2.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762e27abf.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762e8248b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762ed4b6d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762f33f06.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762f84deb.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9762fc4430.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b976300ab37.JPG\" alt=\"\" />\r\n</p>', '2015-07-30 08:56:56', '62');
INSERT INTO `blue_cases` VALUES ('23', '尚高卫浴', '3', '<p>\r\n	<span style=\"font-size:16px;\"><strong><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong>非凡的生活体验</strong></span>\r\n</p>\r\n<span style=\"font-size:16px;\"><strong>尚高卫浴品牌规划与整合推广方案</strong></span><br />\r\n&nbsp;<br />\r\n<strong>策划背景：</strong><br />\r\n&nbsp; &nbsp; 作为中国的十大卫浴品牌——尚高卫浴设计出色、产品线丰富并且连续6年浴室柜市场领导者。虽然尚高卫浴品牌核心清晰，但价值尚未确立，品牌建设及传播缺乏系统，过去的主要传播方式是以线下活动、公关宣传为主，缺乏大规模品牌推广线上（ATL)传播，因此品牌难以积聚力量，知名度不如其他几大品牌，没有将品牌的核心竞争力发挥出来，难以再市场上更进一步。<br />\r\n<strong>策划思路：</strong><br />\r\n&nbsp; &nbsp; 面对以上的问题，尚高如何寻求突破？蓝火经过对于市场的洞察，领导的访谈，消费者的沟通，发现尚高卫浴的优势在于：1、符合年轻一代生活方式的产品设计；2、注重具使用性的实际功能 ，3、科技环保的技术含量。而我们主要消费人群80后的内心情感：渴望美好新生活、对时尚的需求、希望与众不同，与尚高卫浴的理念相吻合，因此我们将尚高定位为：创新的时尚卫浴，建立尚高品牌的核心价值：非凡的生活体验，策划以卫浴新兴品类同时又是尚高的优势产品——浴室柜，作为突破点，聚焦浴室柜的品牌传播作为一把尖刀，迅速占领市场和消费者认知，以优势产品打造品牌核心价值，进而延伸全卫浴产品， 建立整体卫浴强大品牌。<br />\r\n<strong>传播策略与执行：</strong><br />\r\n&nbsp; &nbsp; &nbsp;呼应策略需求，在传播上从品牌形象开始着手，以尚高浴室柜“柜族”片作为中心，对主要产品进行了归类，推出一系列的品牌新广告，让市场感受到尚高卫浴品牌形象质的飞跃；<br />\r\n&nbsp; &nbsp; 爱在卫浴：通过网络创建尚高卫浴创新卫浴生活方式站点，旨在传播尚高品牌的全新的卫浴生活方式，制造网络话题，引起全民关注，配合公关事件进行网络炒作。<br />\r\n&nbsp; &nbsp; 让子弹飞：以315促销作为一个试金石，借势当时上映的“让子弹飞”电影，推出“315，让黄金飞”促销活动，让市场销售火了一把；&nbsp;<br />\r\n&nbsp; &nbsp; 51柜族：在五一促销期间与尚高市场部人员进行了产品的探讨，推出“51做柜族，只要799”的震撼性促销，销售极其火爆；<br />\r\n<strong>效果评估：</strong><br />\r\n1、 尚高不仅建立了清晰的核心价值而且整体形象得到提高，获得了消费者的认同尝试；<br />\r\n2、 按照尚高市场部提供的数据，315活动同比去年销售增长50%以上；<br />\r\n3、五一促销的活动，主推单品卖销售量达到10000套以上，全国罕见，在整个卫浴市场引起了轰动；<br />\r\n<strong>总结：</strong><br />\r\n<p>\r\n	1、经过半年时间的品牌建立工程，尚高卫浴通过创意表现，品牌传播媒体，以及产品渠道上给了消费者焕然一新的感觉，品牌形象得到了质的飞跃，销量也上了一个台阶，客户对于蓝火工作相当认可。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97720677b3.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97720be6d2.jpg\" alt=\"\" /> \r\n</p>', '2015-07-30 09:00:20', '63');
INSERT INTO `blue_cases` VALUES ('24', '日丰卫浴', '3', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a00500d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a0552b5.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a09464b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a0c9fc7.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a10998f.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a15798a.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a1a3777.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b977a28a188.JPG\" alt=\"\" />\r\n</p>', '2015-07-30 09:02:41', '64');
INSERT INTO `blue_cases` VALUES ('25', '九牧集团', '3', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97963e4df5.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979642f8e6.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97964630b8.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9796495294.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97964c35e3.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97965142c6.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97965539ab.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979659a76d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97965e4cd6.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9796630e0c.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97966725a4.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97966b639b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9796701ce9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979674210c.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979678bec4.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97967d6c24.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9796833a0b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979688ea8b.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97968c75f5.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9796901547.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979a827643.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979a87ae08.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979a982acb.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979aa92155.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979ab1cb93.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979abcc0db.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979ace30ed.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979ae1922f.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979aec6e0f.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979af6ff26.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b046fc6.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b136615.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b1ea9ae.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b2b1f4d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b36c9b3.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b42aab9.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b4b758a.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b5627cc.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b6055ad.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b979b6b6d62.JPG\" alt=\"\" />\r\n</p>', '2015-07-30 09:11:58', '65');
INSERT INTO `blue_cases` VALUES ('26', '安华卫浴', '3', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97a30ebf1e.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97a3212463.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97a32c5314.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97a33b1acd.jpg\" alt=\"\" />', '2015-07-30 09:13:27', '66');
INSERT INTO `blue_cases` VALUES ('27', '中国南方航空', '4', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97b81a73f9.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97b833c1fa.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97b8454404.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97b85c2d7a.jpg\" alt=\"\" />', '2015-07-30 09:19:05', '67');
INSERT INTO `blue_cases` VALUES ('28', '金蝶', '4', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97bd4b5cbe.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97bd50afbf.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97bd53e031.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97bd5bf407.jpg\" alt=\"\" />', '2015-07-30 09:20:26', '68');
INSERT INTO `blue_cases` VALUES ('29', '中国网通', '4', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97c2547934.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97c25b32e9.jpg\" alt=\"\" />', '2015-07-30 09:21:44', '69');
INSERT INTO `blue_cases` VALUES ('30', '中国电信', '4', '<br />\r\n<br />\r\n<span style=\"font-size:16px;\"><strong>迎风破浪 我来领航</strong></span><br />\r\n<span style=\"font-size:16px;\"><strong>湖南电信商务领航推广策划策划背景：</strong></span><br />\r\n&nbsp;<br />\r\n&nbsp;<br />\r\n&nbsp; &nbsp; “商务领航”是中国电信建立在优势资源基础上推出的面向所有企业客户的、旨在服务于企业信息化的全新客户品牌，是中国电信战略转型的重要业务，目前主要服务对象为中小企业。<br />\r\n&nbsp; &nbsp; &nbsp;2009年限制“商务领航”发展的最大障碍便是中国中小企业存在信息化的“四低”现状，即认知度低、普及率低、投入低、信息化层次低，虽然目前的市场现状给商务领航的推广带来一定的困难，但同时也意味着巨大市场潜力和发展前景。但是如何将困难化为有利条件是当时商务领航面对的的重大问题。<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>策划思路：</strong>\r\n</p>\r\n&nbsp; &nbsp; 截止2007年9月，全省中小企业和个体工商户总数已突破110万户。中小企业占到了湖南企业的99%以上，不仅创造了60%的工业总产值、40%的利税，还提供了大约75%的城镇就业机会。由此可以看出中小企业占湖南经济重要比重，潜在信息化市场大。<br />\r\n然而，在110万湖南中小型企业和个体工商用户中，湖南电信商务领航套餐用户不足20万，商务领航整体市场占有率不足20%，并且信息化应用普遍处于初级阶段，造成了推广上的困难。<br />\r\n&nbsp; &nbsp; 从目标市场上来看，商务领航的知名度较高，目标客户普遍知道有商务领航品牌，但是了解普遍不甚。从大众市场来看，其知名度较低，大部分普通人不知道有商务领航品牌，品牌社会影响力受限。从区域市场来看，区域认知并不平衡，少数几个大城市知名度高，其他地区知名度低。现有的市场状况和品牌生存需求要求湖南电信商务领航必须制定一个长久发展的目标：成为目标客户第一印象品牌。<br />\r\n再从品牌内部来分析，商务领航最大问题和障碍首先在于品牌业务太复杂，自己人推广时说不清楚，客户了解和接受也很困难。其次产品和业务多层次、多系列，分别有通信版系列应用、信息版系列应用和行业版系列应用，导致了目标对象多类别性、需求多差异化。最后，商务领航在推广上手段略显单一 ，主要是通过直销渠道，即通过专门客户经理上门推广，点对点宣传，其中配合巡展、体验会等手段宣传。造成商务领航的种种问题与障碍的症结在于两点：一是面对复杂品牌业务的传播口径提炼在广告中没有得到解决；二是面对复杂的目标客户的的针对性宣传在传播中也没有解决。<br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	那么蓝火的解决方案是什么？\r\n</p>\r\n<strong>解决方案：</strong><br />\r\n首先，确定我们的品牌优势：三位一体，即依托于“固话+宽带+手机”客户和资源优势，融合“固话+宽带+手机”全业务的“融合业务”优势。电信在南方市场拥有最大的固话和宽带用户群，有强大的固话、宽带基础和资源优势，整合后又将快速发展的移动业务融入商务领航中，形成以“固话+宽带+手机”为基础的综合信息服务平台。<br />\r\n在我们的品牌优势上，蓝火提出了整合传播的解决方案，即整合目标受众、整合传播信息、整合传播推广手段的360度的整合传播。整合传播分为5个层级，针对不同的目标受众诉求不同的内容：<br />\r\n1、针对所有的目标受众，包括意见领袖进行品牌传播活动，通过电视广告/平面广告/网络/大众媒体传播品牌形象“远见成就价值”，从而定义商务领航为企业信息化领航者。<br />\r\n2、针对业务和技术决策者以及意见领袖，进行业务和技术优势传播活动电视广告/平面广告/网络广告，商务领航的优势（融合业务、组合营销、综合优惠）帮助中小企业实现信息化，节约成本，推动企业发展，在企业信息化服务领域里打造并拓展商务领航的领导地位。<br />\r\n3、针对行业内的业务和专业决策者进行行业传播活动，通过平面和网络和活动诉求商务领航有不同的解决方案对应不同行业的问题和需求（对于目标受众按不同企业类别/行业/性质划分后进行的直效行销），对他们演示解决方案与各行业的相关性，激发客户企业的需求<br />\r\n4、针对已有寻求服务意向的业务和技术决策者，通过获取销售名单，吸引用户发现商务领航的好处（根据不同受众进行DM和网络广告），从而获得的销售线索和需求，整理数据。<br />\r\n5、针对现有用户及生物链上的合作伙伴，用户教育，研讨会，网络，新闻邮件，活动等忠诚度营销，把客户带进另一个逻辑销售环节。<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>执行配合：</strong>\r\n</p>\r\n&nbsp; &nbsp; 在既定的策略上，蓝火把大众传播分为三个阶段来实施，包括建立领导形象的品牌广告，业务/技术领先优势广告和垂直行业广告。通过与本地最有影响力展会的战略合作，同时开设中国电信商务领航媒体专栏的公关活动，强势宣传品牌广告和领先优势广告。在前两个阶段奠定的基础下，通过金融危机和企业信息化论坛，配合电子直邮广告，打造信息化示范企业。在大众传播的全程中，通过营业厅渠道、电子渠道、服务热线、大客户渠道、商客渠道等渠道不断进行自身推广宣传渠道的整合和强化。<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>效果评估：</strong>\r\n</p>\r\n&nbsp; &nbsp; 在整合传播的强势宣传下，湖南电信商务领航品牌在面对复杂品牌业务的传播口径都得到了精准的提炼；传播中配合的活动也有效的解决了复杂目标客户的针对性问题。不仅有力地提升了商务领航的品牌形象，而且大大地提高了商务领航品牌在市场中的占有率，湖南电信商务领航业务得以蓬勃发展，实现了目标客户第一印象品牌的目标。<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>总结：</strong>\r\n</p>\r\n&nbsp; &nbsp; 在湖南电信商务领航品牌的推广策划中，蓝火通过深入的分析，清晰的了解，为商务领航品牌量身定制了“整合传播”的推广策略，让商务领航品牌在用户心目中形象清晰，占位明确。事实证明，在方案的推广中，商务领航品牌逐渐了打开市场，占据了优势，为用户带来了人性化的办公体验，中石化湖南公司加油站就是“商务领航”业务的典型受益者。<br />\r\n&nbsp;<br />', '2015-07-30 09:23:31', '70');
INSERT INTO `blue_cases` VALUES ('31', '德国默克药业', '4', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97d00c2d37.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97d0140e13.jpg\" alt=\"\" />', '2015-07-30 09:25:24', '71');
INSERT INTO `blue_cases` VALUES ('32', '陈李济', '4', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>陈李济</strong></span>\r\n</p>', '2015-07-30 09:26:16', '72');
INSERT INTO `blue_cases` VALUES ('33', '天年科技', '4', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97d948c4b3.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97d95187d4.jpg\" alt=\"\" />', '2015-07-30 09:27:52', '73');
INSERT INTO `blue_cases` VALUES ('34', '同一首歌', '4', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de74d94e.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de78a72d.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de7c4750.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de8221c4.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de84aee0.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de892d03.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97de8e40a4.JPG\" alt=\"\" />\r\n</p>', '2015-07-30 09:29:26', '74');
INSERT INTO `blue_cases` VALUES ('35', '中华轿车', '5', '<br />\r\n<span style=\"font-size:18px;\"><strong>让中华奏响自主品牌主旋律</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>中华轿车品牌价值规划方案</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>引子</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>华晨祁总曾说过：</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>走自主创新路 &nbsp; &nbsp;造中华精品车</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>走自主品牌之路 做中华民族车</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>在国际上树立一个中国的自主品牌，在国内树立一个民族自豪的品牌</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>……</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>中华轿车能做到吗？</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>中华轿车一定能做到!!</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>看蓝火如何让中华奏响自主品牌主旋律</strong></span><br />\r\n&nbsp;<br />\r\n<strong>策划背景：</strong><br />\r\n&nbsp; &nbsp; &nbsp; 2007年是汽车行业发展火热的一年，此背景下中华轿车可谓尽占天时地利人和，<br />\r\n&nbsp; &nbsp; &nbsp;天时：根据最新数据显示，2007年，中国汽车市场仍然维持着井喷式发展，近10年来，我国私人汽车的拥有量在以20％以上的速度增长，市场规模的增长超过了22%。中国已经步入汽车时代，我国汽车市场需求将持续旺盛，市场潜力巨大。<br />\r\n同时中国轿车市场进入民族自主品牌的跳跃发展期， 国内市场占有率到06年年底自主品牌23%，07年上半年又有改变，升到将近百分之二十七八，现在自主品牌的车发展速度非常快，而且处在稳中有升的发展趋势。<br />\r\n&nbsp; &nbsp; &nbsp;地利：全球范围内汽车市场的更新率在不断提升,中国是其中的主体市场，专家预计国内汽车更新率若能达到三十至四十的水平，每年四百万辆的更新规模已完全能够确保中国汽车业的发展步入良性化的轨道。以自主品牌为主的乘用车的出口仍将维持强势.<br />\r\n&nbsp; &nbsp; 人和：外得人心，中华轿车作为华晨集团旗下最受欢迎的国内汽车品牌之一，名列第二，与第一名的奇瑞差距不大，内功踏实，凭借中华轿车已积累的优质资产有很大机会超越奇瑞。<br />\r\n中华轿车尽得天时、地利、人和，必能实现抱负，成为民族汽车品牌领航者，走向世界！而今面临如此大好时机，中华轿车如何凭借已有优势超越奇瑞成为国内第一自主品牌？<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>策划思路：</strong>\r\n</p>\r\n&nbsp;<br />\r\n目前，中华轿车主要面向中端市场，竞争压力不断增大，竞争市场中上有日系德系车不断向下发展新品，下有国产向中高端进军，而中华轿车还处在成长期，需要一个品牌发展目标，经过蓝火专家组讨论得出以下发展目标，即近期目标即在保持规模的前提下，提升中华品牌的溢价能力，实现品牌规模与品牌价值的双赢。长远目标是中华欲超越奇瑞成为国内自主品牌第一，前提是要有系统性的规划和发展，在新阶段的市场竞争中要有新思维，要按照有明确目标的战略导向进行战略化拓展，对品牌进行再造，分步实施品牌战略。<br />\r\n<strong>市场策略分析</strong><br />\r\n针对此市场背景，我们为中华轿车企业及产品本身的优势及不足进行整合，通过SWOT分析我们得到中华轿车的优势在于其作为华晨汽车的子品牌，可以凭借华晨集团与宝马集团合作的优势，在自主创新的起点高于其他企业上进行宣传，同时具有先进技术及优势价格的高性价比，为企业迎来很多好评。而中华轿车的劣势在于，作为新兴企业，中华轿车自主研发时间略短，只有四年，且产品线不宽，产品售后服务质量也待改进。但是目前市场仍有很多机会可以抓住，如抢占目前二三线市场，利用好刚刚起步的品牌营销，拥有自主创新技术优势的中华轿车如何抢占市场是是一个重要的关键。<br />\r\n<strong>消费者分析</strong><br />\r\n&nbsp; &nbsp; 在产品准备上市前提下，我们首先针对产品进行了消费群使用态度和习惯分析，得出以下结论<br />\r\n他们相信知识的力量，科技可以改变生活，他们是把工作当作自己的事业,重视过程尊重过程，并以此为享受的一群人,他们重视过程中的价值创造,这是他们的生活态度。<br />\r\n随即我们将消费者定位在30-45之间的中坚主流层，他们的性格特点是性格沉稳、实在、可靠。他们的生活态度务实、稳重、顾家、有责任感，进取心、事业心，注重传统文化，注重好友圈层，有自信的、有主见、成熟有见地，在可控的经济范围内，追求更好品质的生活。他们希望受人尊重、被社会和家人认同、有稳定可靠朋友的不懈支持，了解更大的未知世界，有更好的抗风险能力和安全感。<br />\r\n他们是70后80后数量众多的中产准入者．他们的一部分在为自己的第一辆车做准备工作，他们是中坚主流圈层，正选择第一辆车．他们也是中坚精英圈层，下一辆车向上看齐．<br />\r\n那么他们想要什么样的第一辆，下一辆，让我们聆听一下中坚主流的声音<br />\r\n我喜欢谈论国家大事，<br />\r\n大家都叫我卫国，<br />\r\n我喜欢去旅行，<br />\r\n看看不同的文化，<br />\r\n有了自己的轿车,<br />\r\n生活越来越精彩!<br />\r\n未来,我看好中国。<br />\r\n中国有我！<br />\r\n&nbsp; &nbsp;这就是他们的需求，我们以此定位中华轿车.<br />\r\n<p>\r\n	<strong><br />\r\n</strong>\r\n</p>\r\n<p>\r\n	<strong>品牌定位</strong>\r\n</p>\r\n&nbsp; &nbsp;中华轿车要传播品牌的立体价值，在产品品类上要将产品独特的价值和意义表现出来，也要将品牌独特理想的个性特征完美体现，以此持续统一地传递中华轿车的核心价值，并给予消费者诱人的品牌附加值，与消费者互动。<br />\r\n&nbsp; &nbsp;同时中华轿车在品牌上进行了双向增值，首先在理性上对产品的品质系统升级，中华轿车拥有着欧式主流车型的外观，保时捷的底盘技术、低能耗的1.8T中国芯，大气舒适超值体现，那么在情感附加值上中华轿车应该进行怎样的升级，如何定位品牌？因此依据对中华轿车的swot分析和消费者洞察,我们对中华轿车品牌进行了整体规划<br />\r\n中华轿车品牌理念：做世界尊重的中国轿车领航者<br />\r\n中华轿车的品牌战略目标：做世界级的轿车品牌<br />\r\n同时将中华轿车品牌使命的内涵延伸为以世界的眼光，融汇世界造车科技，并用中国智慧不断创新超越，给东西方的主流家庭，提供高品质和物超所值的多元轿车产品。<br />\r\n&nbsp; &nbsp; 中华轿车品牌定位“世界级的国民精品轿车，为中坚主流家庭，创造超值的精品轿车”对目标顾客群来说，中华轿车是物超所值的精品国民车；中华轿车的法宝就是价格与品质的双刃剑，兼顾中等收入的中青家庭与年轻家庭，带来温暖而快捷的现代新生活。<br />\r\n在规划中最重要的就是中华轿车的品牌核心价值，蓝火专家组将中华轿车品牌核心诉求点定在精品与超值上，精品指的是值得信赖的领先创新新势力，而超值指的是主流价值愉悦的共享，经过分析，我们认为中华轿车价值内涵是以世界为起点,锐意进取,融汇世界先进造车技术,并用中国智慧不断创新超越现在的科技,创造出全新的可让中坚主流家庭共享的超值精品轿车,可以带领大家进入温暖快捷的现代新生活.是大家可信赖的、与大家分享愉悦的伙伴。<br />\r\n在此我们确定了中华品牌文化观、价值观、生活观、服务观以实施品牌与产品双赢的营销模式。<br />\r\n首先中华意味着，回归中国主流所期望的公平公正：世界之央,国为中，科技与智慧之间，德为中，天地之间,人为中，世界就在你左右，中华轿车，主流的价值!不偏不倚，为中，不卑不亢，为中，中兴盛世！<br />\r\n&nbsp; &nbsp;中华轿车品牌价值观：世界科技 ，中国智慧，见证世界的方向<br />\r\n&nbsp; &nbsp;中华轿车品牌生活观：世界进行，无限精彩<br />\r\n&nbsp; &nbsp;中华轿车品牌服务观：专业 关爱<br />\r\n因此在理性层面上通过满足消费者产品定位，品质性能的需求，体现了中华轿车的竞争性优势，实现产品的规模目标，在感性层面上通过文化观、价值观、生活观、服务观上满足消费和的感性需求，实现了品牌增值目标。<br />\r\n我们卖的不仅仅是一辆与众不同的中华轿车，他还是一种文化精神、生活方式、独特的价值观、服务体验。<br />\r\n&nbsp; &nbsp; 综上分析，中华的品牌口号应运而生——“精于中 华于形”中华轿车，精于中（内在精品），华于形（外在超值），满足目标消费群体（中坚力量）的核心需求，车如其人，中华品牌价值观和他们一样，人在路上，内炼能力与涵养，外炼形象，执着进取，事业生活一定可达更高！<br />\r\n传播执行方略<br />\r\n&nbsp;<br />\r\n我们的传播核心：精品=中华，通过品质升级、技术过技术、科技创新的信息建立精品印象。通过人性舒适空间和精细的内饰对产品进行品质升级，我们的技术国际化：凭借欧式主流车型外观与集成的安全系统达到国际化的水平，我们的科技创新：拥有自主知识产权降低油耗的节能芯及简明智能系统完成科技创新领先国内自主品牌。<br />\r\n推广核心：超值=中华，我们的新品拥有高性价比，配合店员热情促销，凭借优质配件及服务选择中华，超值！<br />\r\n传播手段<br />\r\n我们选择360度全方位立体传播手段<br />\r\n&nbsp; 首先我们对TVC组合投播，主要分为形象片、新品上市片、专题片，我们选择在直播国际赛事深度植入，例如CCTV5、搜狐网等等。同时进行车模展示、节目联合促销、背景版ＬＯＧＯ、ＴＶ广告等一系列宣传活动。最后选择一些大型赛事进行活动地面互动，我们建议一下赛事：中国篮球之队、欧洲杯、德甲、中国蓝球之奥运会热身赛、城市车友、准车友互动。我们凭此让中华08唱响主流媒体最强音<br />\r\n推广成果：<br />\r\n通过一系列的造势及宣传，经过半年时间的品牌建立工程，中华轿车通过创意表现品牌传播媒体，中华轿车建立了清晰的核心价值而且整体形象得到提高，获得了消费者的认同，以及品牌宣传上给了消费者焕然一新的感觉，品牌形象得到了质的飞跃，“精于中，华于形”的口号已经传遍大江南北，2009年轿车销售量增长率为24.28%，，销量也上了一个台阶，其品牌价值在国产自主品牌市场中独树一帜，做到精于中华，惠及消费者的第一品牌，同时为争取国产第一品牌奠定了良好的基础。让中华奏响自主品牌主旋律<br />\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b97fc62d4e3.jpg\" alt=\"\" />\r\n</p>\r\n&nbsp;<br />', '2015-07-30 09:37:12', '75');
INSERT INTO `blue_cases` VALUES ('36', '猎豹汽车', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9801ebb6a0.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9801f38da3.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9801fdab22.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980207e4e7.jpg\" alt=\"\" />', '2015-07-30 09:38:45', '76');
INSERT INTO `blue_cases` VALUES ('37', '比亚迪汽车', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9806499c59.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980652b6a2.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9806578f35.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98065f3e2d.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9806652bf4.jpg\" alt=\"\" />', '2015-07-30 09:39:54', '77');
INSERT INTO `blue_cases` VALUES ('38', '招商地产', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980a0da406.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980a152d1d.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980a2085b0.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980a24f6b2.jpg\" alt=\"\" />', '2015-07-30 09:40:55', '78');
INSERT INTO `blue_cases` VALUES ('39', '山水黔城', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980f33d835.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980f3b1057.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980f409a5a.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b980f46df7e.jpg\" alt=\"\" />', '2015-07-30 09:42:15', '79');
INSERT INTO `blue_cases` VALUES ('40', '星河地产', '5', '<br />\r\n<span style=\"font-size:18px;\"><strong>创想无界 心筑未来</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>星河地产整合推广方案</strong></span><br />\r\n&nbsp;<br />\r\n<strong>策划背景：</strong><br />\r\n&nbsp; &nbsp; &nbsp;竞标期间，蓝火对星河进行了初步分析：星河旗下拥有众多子品牌，而且开发了许多风格各异、品牌不一的地产项目，但正是过多的子品牌，使得子品牌各自为政，造成了集团资源的极大浪费，企业管理障碍，从而导致了星河品牌核心价值及相应的形象模糊不清，损害了星河品牌的竞争力与凝聚力。<br />\r\n因而，星河地产要整合品牌形象，必须找到品牌的优势差异，将优势差异转化为品牌核心价值，对品牌核心价值进行形象塑造，整合传播品牌新形象，完成品牌价值再造的目的，达到提升品牌力，成就中国地产业强势品牌的目标。<br />\r\n&nbsp;<br />\r\n<strong>策划思路：</strong><br />\r\n正式签订合同书后，蓝火进行了对星河地产全面了解，并且联合第三方调研公司对星河内外多个层面进行了一次深入的调研，为品牌的提升指引方向。这次调研是以星河企业为主体，从星河地产整体形象到星河地产整体覆盖。<br />\r\n&nbsp; &nbsp;通过调研，我们总结出星河沉淀下来的品牌资产和面临的挑战。资产：品质好的产品；中高端的、成熟的顾客；强势到位的项目宣传、关注公益事业的公关活动；大气、稳健、有实力、可信赖的形象；美誉度高、发展快、有影响力；视觉商标。挑战：知名度待提升；品牌价值空心化、标知晓度低；缺乏统一的视觉联想，品牌形象稀释化。<br />\r\n&nbsp; &nbsp;那么在此背景下如何整合星河品牌？<br />\r\n首先，进行品牌发展战略规划。结合星河现状，蓝火提出了四大基本战略：其一，减少顾客成本，在产业链的各环节上进行成本的控制，从成本控制的角度来追求品牌价值最大化。其二，增加顾客总价值，通过增加产品的品质感和品牌内涵等，从品牌运营手法上追求品牌价值最大化。其三，多样化，通过多类别的多样化开发，实现产品的综合效应。其四，专业化，通过单品类的深耕细作，实现产品品质的最优化。<br />\r\n基于星河多业态的发展现状和坚持打造精品的态度，融合四大基本战略，我们的战略选择是：多样化总价值优势品牌战略。坚持多样化总价值优势的战略方向，发挥多业态复合发展的经营优势，以深圳为轴心，以珠三角为扇面，布局二线城市，五年内成为珠三角主流地产企业和长三角知名地产企业，十年内成为全国知名地产企业。<br />\r\n其次，进行品牌价值规划。<br />\r\n星河品牌愿景：成为创新型价值生活的领航者；品牌使命：为都市精英提供独特价值的品质生活；品牌定位：价值创新和个性化都市生活的提供者；品牌个性：有创见、稳健的、人文关怀的；星河核心价值：创想和用心，创想——技术创见，理念创新，用心——精益求精，苛求完美，至诚服务。<br />\r\n根据大量的调查与分析，锁定目标消费者：城市中高端人群，年龄在35~50岁，他们是价值的追寻着和坚守者，他们活在当下，追求现实享受，同时对未来满怀期许并充满信心；他们关注房子内在价值，而不是只关注购买时机；这种生活价值的选择和判断取决于自己的内心，取决于自己独特的价值观和信念。而不是大多数人的看法；他们坚守的纯粹价值：独特、领先、创想。<br />\r\n于是，我们的广告语自然而然的出现了：创想无界心筑未来，这将是我们跟消费者强势沟通的有力途径。<br />\r\n再次，建立企业文化系统。<br />\r\n蓝火梳理了星河企业文化，在与品牌核心价值形成区别的基础上，再次确定了以“诚信、精品、服务”为核心的文化价值观，作为星河人的作业准则、精神标杆。<br />\r\n最后，建立品牌管理框架。<br />\r\n品牌战略管理与传统的战术性品牌管理相比，差别甚多，品牌管理的最终目的是要保持品牌的一致性，企业的品牌管理不可能实现完全的，绝对的一致性。所以为了能使所有的品牌资源集中在一点上，就要通过品牌管理来规范品牌输出的方方面面，以便实现标识的规范性，传播内容的统一性，使得消费者可以通过解读这些信息，从而对品牌产生一致的印象。一旦公司各品牌定位确认之后，公司领导必须成立品牌战略管理委员会。<br />\r\n&nbsp;<br />\r\n<strong>传播策略：</strong><br />\r\n在传播策略上，我们的主题是：聚合城市空间新价值。产品环节上，我们主张通过运动会、竞赛等形式的星河大家庭活动来团结内部，让目标客户对品牌与属下项目有清晰、统一认识。围绕品牌传播主题的联展广告，不同楼盘结合品牌主题的宣传，在品牌形象与不同风格、定位的项目形象之间保持有机的联系。通路环节上，创建围绕传播主题的星河会刊，制作企业新形象发布专题，统一所有销售现场布置，强化“聚合城市空间新价值”的信息，利用星河网站进行整合，建立系统、有效的品牌传播通路。商誉环节上，建立购房/投资咨询中心（hotline、公开咨询、报章介绍等），制作与投放企业形象TVC，通过大众传媒树立企业形象，提高品牌在大众消费者中的认知及了解。消费者环节上，组织既有客户和目标客户进行星河生活一日游，参观体验星河项目的生活方式（住宅、写字楼、购物中心、休闲旅游等等，为住宅客户提供商业项目的会员资格和优惠为商业客户提供住宅项目的购房优惠，以此来加强目标客户对品牌的认同，并愿意传播。视觉管理环节上，品牌管理委员会领导CI 管理，区分主副品牌关系，主张使用星河地产LOGO，设计VI系统，形成统一、清晰的视觉传播方法。形象环节上，举办城市价值论坛，建立统一、清晰、有实质内涵的品牌形象。<br />\r\n执行回顾：<br />\r\n百分之八十的利润由百分之二十的客户产生，因此我们要全面整合企业现有客户资源，建设以客户资源整合平台为核心的推广模式，以明星产品打造明星品牌，以连续不断的新产品推广带动品牌知名度与美誉度的持续上升。<br />\r\n会员营销：针对会员的超值服务，即能够通过品牌所提供的全面性服务，为会员客户在生活与社交中提供更为丰富的资源；精英会员特享服务，通过对会员客户进行不同权利的设定，使会员的服务根据不同阶层的客户设定不同权限的服务内容；积分制度，各种积分途径不仅能够给会员带来各种奖励，还能进行帮助会员升级，享受更多优惠。<br />\r\n星河会：通过星河品牌宣传手册，形象平面展示，星河商业中心购物指南等，深入传播星河品牌形象及内涵；利用品牌新形象发布会，借力明星会员，启动星河宣传新篇章；发布会员卡，包含两种类型，金卡（贵宾卡）和普通卡，这也是通过有限的资源为更多的会员进行服务的一种表现形式，通过更为细致的划分使不同的会员间产生不同的服务等级。<br />\r\n商业论坛：商业运营的典型问题和未来的发展方向进行论坛探讨，与后续的产品、业务传播进行有机结合。<br />\r\n星河会员网站：开辟星河会员网站BBS及活动专区，有利于会员互动和增加俱乐部忠诚度。<br />\r\n明星会员招募会：每月持续举办明星会员系列活动，扩大影响，以明星会员招募为会员增添光环。<br />\r\n新项目开盘典礼：邀请星河明星会员数据库客户参、明星和时尚传媒与新闻传媒参与开盘典礼，在强势的宣传下，新项目得以足够的曝光。<br />\r\n&nbsp;<br />\r\n<strong>实施效果：</strong><br />\r\n建立了清晰的品牌形象，增强了品牌竞争力与凝聚力；破除了子品牌各自为政的局面，将品牌力凝聚到一个点上，更加有利于星河未来新项目的开发与执行。<br />\r\n建立了星河独特会员营销，有力的创造了与消费者沟通的平台，提高了知名度，扩大宣传效果。<br />\r\n建立了深厚品牌内涵，品牌核心价值凝实，运用“创想无界心筑未来”的口号，形成强有力的宣传。<br />\r\n&nbsp;<br />\r\n<strong>总结：</strong><br />\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; 2010年星河总开发面积超过100万平方米，是其开发量最大的一年，开发项目包括位于广州南沙的星河丹堤、江苏常州的星河国际、深圳龙华的民乐旧改项目以及龙岗中心城项目，星河集团已经深入到深圳地产界的第一军团，并且在不断地壮大其在珠三角与长三角的影响力，成为珠三角主流地产企业和长三角知名地产企业，为将星河打造成价值创新型地产领先品牌夯实了基础，为新项目的开发与执行创造了有利的环境，同时也为进军全国市场提供了强有力的后盾。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9816930e38.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981699ce3b.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98169e3f92.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9816a57f25.jpg\" alt=\"\" />\r\n</p>', '2015-07-30 09:44:14', '80');
INSERT INTO `blue_cases` VALUES ('41', '星河湾', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9819e3938b.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9819ec6af4.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9819fbe49c.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981a01b4fc.jpg\" alt=\"\" />', '2015-07-30 09:45:08', '81');
INSERT INTO `blue_cases` VALUES ('42', '爱涛天成', '5', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981ead11bd.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981eb5063c.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981eb90967.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981ebd975d.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b981ec6e15a.jpg\" alt=\"\" />', '2015-07-30 09:46:24', '82');
INSERT INTO `blue_cases` VALUES ('43', '鲁花花生油', '6', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9825d7d178.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9825e9d89e.jpg\" alt=\"\" />', '2015-07-30 09:48:19', '83');
INSERT INTO `blue_cases` VALUES ('44', '燕京啤酒', '6', '<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9828d93c1f.jpg\" alt=\"\" /><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9828e1164a.jpg\" alt=\"\" />', '2015-07-30 09:49:04', '84');
INSERT INTO `blue_cases` VALUES ('45', '徐福记', '6', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\"><strong>徐福记</strong></span>\r\n</p>', '2015-07-30 09:49:30', '85');
INSERT INTO `blue_cases` VALUES ('46', '男性主义化妆品', '6', '<br />\r\n<span style=\"font-size:18px;\"><strong>MENPLUS品牌年度推广策略</strong></span><br />\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>策划背景：</strong>2010年，男性化妆品市场烽烟四起，众多知名品牌纷纷加入战火当中。作为专注于男性化妆品的男性主义品牌，要想在激烈的竞争中占一席地，必须有自己独特鲜明的个性，精准的传播。\r\n</p>\r\n<p>\r\n	策划思路：在2010年一季度男士护肤品中欧莱雅男士关注度排名第一，关注度占比20.45%，同时欧莱雅男士关注度也首次超过20%，并逐步扩大与其他品牌的差距。妮维雅关注度为15.43%排名第二。2010年3月刚刚上市的玉兰油男士系列产品，网民关注度占比7.01%，排名第六。 而menplus几乎没有关注度，在众多占据市场主位的品牌的重重包围下，男性主义如何突围而出？经过一系列的市场分析，我们发现80后、90后男孩，已普遍使用清洁及滋润护肤品，每年步入社会的大学生600万，男生占50%以上；在男士自主购买和女士作为礼品性购买双重增长的刺激下，男士护肤市场已经达到整个护肤品市场20%的权重，并且仍在持续增长中。因此80后、90后作为一个男性消费品切入的机会，是主要的目标消费群。他们非常有自己的个性，认为自己是不一样的，但是同时又喜欢自由，需要被关注；因而年轻、自由，个性化将是男性主义的整体调性方向。结合男性主义的诞生基因，同时作为后发制人的挑战者，我们认为差异化的品牌策略才是男性主义的出路。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>传播策略: </strong>&nbsp; 在符合消费者产品利益和情感利益的原则上，作为挑战者的差异化竞争策略，我们的产品概念以“无倦容醒肤”跟进，起到了明显的借力效果，在广告诉求点上针对齐明显的短板——用“咖啡因、清凉薄荷、维C醒肤”攻击其弱势，推进消费者的对醒肤概念的深化认知。在创意实施方向表现为引领潮流的外观造型，有效成分、技术、沟通情感与个性，交互式体验缺一不可；同时避开众多大品牌的广告攻势，以终端表现、明星路演等方式进行差异化传播。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>执行回顾：</strong>在差异化战略的基础上，蓝火提出以体验营销为理念，音乐营销为形式的执行战略，通过线上网络和线下终端平台互动，注入文化和情感，让目标消费群体能以自己喜欢的方式充分分体验MENPLUS的品牌和产品。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>MTV病毒营销：</strong>将男性主义的主题曲 Shine Your Light 制作成 MTV《2010+1》，并将其上传到优酷、土豆、酷6和YouTuBe等视频网站上，并设置相关网站（如人人网、开心网、QQ空间等）链接，由网民自由传播，形成病毒营销之势。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>主题活动公关：</strong>通过男性主义活动网站，进行视频病毒营销，同时以明星同台演绎作为奖励的互动活动。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>路演：</strong>在男性主义路演中，音乐营销主要体现在以下两个方面：将男性主义的主题曲用于路演的背景音乐，不停播放；在路演中增设主题曲音乐PK、与明星同台演唱主题曲、与明星PK主题曲演唱等环节。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>广告片背景音乐：</strong>将男性主义的主题曲 Shine Your Light 作为广告片背景音乐并通过广告的播放增强受众的记忆度和认知度。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>手机铃声：</strong>不仅可以将男性主义主题曲 Shine Your Light 制作成手机铃声以供下载，还可以将“Shine Your Light”主题活动中的人气演唱和优秀演唱制作成手机铃声以供下载。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<strong>音乐风云榜：</strong>通过各地电台和各种音乐节目的打榜，李承铉新歌 Shine Your Light 得到进一步的宣传，必将进一步受到歌迷的追捧。<br />\r\n&nbsp;<br />\r\n<p>\r\n	<strong>效果评估：</strong> &nbsp;通过一系列的品牌创意、巡回展示、明星签售等活动，男性主义在各大城市取得了相当好的效果，销量是去年同期的三倍之多，品牌知名度也逐步提高，在年轻一代的消费者当中占据了一定的位置。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>总结：</strong> &nbsp;大品牌大投入，小品牌差异化的论点再次在男性主义得到验证；精准的传播，奔放的创意及合适的代言人是男性主义的三大成功因素。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9835856840.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98366581b5.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98371d135c.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98378b0b4e.jpg\" alt=\"\" />\r\n</p>\r\n&nbsp;<br />', '2015-07-30 09:53:00', '86');
INSERT INTO `blue_cases` VALUES ('47', '爱膜逆', '5', '<p>\r\n	<span style=\"font-size:18px;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>直击人心，</strong></span> \r\n</p>\r\n<span style=\"font-size:18px;\"><strong>打造高端面膜品牌</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>爱膜逆</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>逆转时光 &nbsp;真爱传奇</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b98702a8d27.jpg\" alt=\"\" /><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\"><strong>项目背景</strong></span><br />\r\n<span style=\"font-size:12px;\">近两年，面膜市场迅速升温，不断扩容，预计2015年，面膜市场总额将达300亿元。从目前的竞争状况来看，面膜市场整体还比较杂乱，竞争大多还只是停留于中低端领域，主打价格战。在越来越追求生活品质的时代，高端面膜市场悄然地崛起。2013年二季度高档化妆品中分类关注度排行榜中，面膜品类排在最后。但到了第三季度，高档化妆品中分类关注度排行榜中，面膜占比4.7%，排进前七。2014年，有越来越多的面膜品牌向高端市场发起进攻。</span><br />\r\n<span style=\"font-size:12px;\">&nbsp;</span><br />\r\n<span style=\"font-size:12px;\"><strong>品牌课题</strong></span><br />\r\n<span style=\"font-size:12px;\">针对高端成功女性，打造一个品牌溢价突出的高端面膜品牌。</span><br />\r\n<br />\r\n<span style=\"font-size:12px;\"><strong>品牌策略：被爱的女人，永远最美</strong></span><br />\r\n<span style=\"font-size:12px;\">首先锁定目标消费人群——独立成功的中青年高端事业女性、中年富家阔太。她们本身最大的压力则是来自于自身的烦恼，随着年龄增长，身体机能下降，日益走样的曲线，逐渐失色的面容，都令她们感到忧虑，她们害怕青春的消逝，害怕失去关注，甚至于失去爱人的青睐。她们渴望跨越时光，回复年轻时的状态，渴望再次获得更多的爱。</span><br />\r\n<span style=\"font-size:12px;\">&nbsp;</span><br />\r\n<span style=\"font-size:12px;\">洞察到消费者对“爱”的深层需求，爱膜逆，将要打造的就是一个“由爱传递美”高端女性品牌。爱膜逆相信：被爱的女人，永远最美。一个始终被爱包围的女人，一定是越来越美的。在品牌命名上，Amor是爱神丘比特的别称，代表爱的升华。Amorstory正是以爱神丘比特的爱情故事为由头命名的。</span><br />\r\n<span style=\"font-size:12px;\">&nbsp;</span><br />\r\n<span style=\"font-size:12px;\">竞争定位上，根据爱的特性——爱自己，别人给予爱，将品牌定位为奢侈礼品面膜。对于男性来说，爱膜逆是对女性表达至爱的最佳方式。对于女性来说，爱膜逆是对女性最高的宠爱，是爱的体现。</span><br />\r\n<span style=\"font-size:12px;\">&nbsp;</span><br />\r\n<span style=\"font-size:12px;\"><strong>产品卖点：</strong>给女人极致宠爱</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9873e1f702.jpg\" alt=\"\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\">在产品层面，以稀缺的成分、极致的品质构筑爱膜逆，给女性消费者带来的极致宠爱。爱膜逆面膜，护肤精华源自新西兰南岛世界第一牧场——摩斯沃斯牧场(MolesworthStation)的金羊毛。<br />\r\n&nbsp;<br />\r\n顶级金羊毛不仅光泽好，弹性强，强力高；并含高达90%的优质Keratin活性逆转蛋白，溶解性高，分子小，极易于分解和人体吸收。100只出产最好的美利奴细羊毛的羊仅能出产1000g顶级羊毛。每1kg金羊毛仅仅能够萃取出80克Keratin活性逆转蛋白。而每一片爱膜逆面膜就等于满满30克Keratin活性逆转蛋白精华液！<br />\r\n&nbsp;<br />\r\n爱膜逆面膜蕴含活性极高的Keratin蛋白，能促进细胞赋活，帮助肌肤紧致新生，抚褪岁月痕迹，重现饱满鲜活的理想状态，焕发逆生长的年轻光彩。<br />\r\n&nbsp;<br />\r\n<strong>品牌形象与传播：</strong>美丽奇迹，因爱而生在形象塑造上，以爱神丘比特(Cupid)与普绪克(Psyche)的动人故事为品牌故事，传达由爱生美的品牌理念。品牌色选用蒂芙尼的蓝绿色与白色配合，高雅、迷人。简洁大方优雅的蝴蝶结是爱膜逆的专属符号，代表着爱的礼物。独特的书籍礼盒外包装和情书，满载着浓浓的宠爱。<br />\r\n&nbsp;<br />\r\n<strong>在传播上，与各种高端商务活动进行互动，强化品牌的高端形象价值。</strong><br />\r\n2014年太平洋经济合作理事(PECC)第二十二届大会赞助商<br />\r\n领军新丝路2014商业能量挑战赛唯一指定护肤品<br />\r\n冠名“马克西姆和他的乐队”中国巡演(广州站)<br />\r\n<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9876696b45.jpg\" alt=\"\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\"><br />\r\n在以价值观为核心驱动力的营销3.0时代中，除了常规大众传播外，移动互联网的媒体互动是品牌传播的重要部分。通过网络，树立品牌形象的同时，将大众资源发展为会员，激发人际口碑传播<br />\r\n&nbsp;<br />\r\n1)爱膜逆官网www.amory.cn品牌形象，网上商城，会员管理平台，合作伙伴管理平台<br />\r\n2)爱膜逆微信公共平台amorstory：微官网、微商城、每日信息发布、会员管理<br />\r\n3)腾讯微博、新浪微博<br />\r\n<img src=\"/blueflame/Uploads/Editor/2015-07-30/55b9878712a73.jpg\" alt=\"\" /><br />\r\n</span></span> \r\n</p>', '2015-07-30 10:10:18', '89');

-- -----------------------------
-- Table structure for `blue_category`
-- -----------------------------
DROP TABLE IF EXISTS `blue_category`;
CREATE TABLE `blue_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- -----------------------------
-- Records of `blue_category`
-- -----------------------------
INSERT INTO `blue_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `blue_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');

-- -----------------------------
-- Table structure for `blue_channel`
-- -----------------------------
DROP TABLE IF EXISTS `blue_channel`;
CREATE TABLE `blue_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `blue_config`
-- -----------------------------
DROP TABLE IF EXISTS `blue_config`;
CREATE TABLE `blue_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_config`
-- -----------------------------
INSERT INTO `blue_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', '蓝色火焰', '0');
INSERT INTO `blue_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', '广州蓝火文化传播公司（蓝色火焰广告）是老牌4A广告公司，经典案例有阿拉善、爱膜逆、创维电视、中华轿车南航等', '1');
INSERT INTO `blue_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', '4A广告公司 蓝色火焰 蓝火文化 广告策划 品牌策划 广州蓝火', '8');
INSERT INTO `blue_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `blue_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `blue_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '粤ICP备13010657号', '9');
INSERT INTO `blue_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `blue_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `blue_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'blue_color', '10');
INSERT INTO `blue_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `blue_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `blue_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `blue_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `blue_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `blue_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `blue_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '0', '3');
INSERT INTO `blue_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `blue_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `blue_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `blue_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `blue_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `blue_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `blue_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `blue_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `blue_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `blue_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `blue_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- -----------------------------
-- Table structure for `blue_content`
-- -----------------------------
DROP TABLE IF EXISTS `blue_content`;
CREATE TABLE `blue_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '内容标题',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `blue_content`
-- -----------------------------
INSERT INTO `blue_content` VALUES ('1', '联系我们', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;color:#FFFFFF;\"><strong>广州市蓝火文化传播有限公司</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;font-size:14px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;font-size:14px;\">Address：广州市天河区天河路208号粤海天河城大厦31楼01-03</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;font-size:14px;\">Tel：+86-020-87377708</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;font-size:14px;\">Fax：+86-020-87377709</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;font-size:14px;\">Email：</span><span style=\"color:#FFFFFF;font-size:14px;\">87377708@163.com</span><span style=\"color:#FFFFFF;font-size:14px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;\"><span style=\"line-height:21px;color:#FFFFFF;\">扫一扫关注蓝火微信公众号</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FFFFFF;\"><span style=\"line-height:21px;color:#FFFFFF;\"><img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0a7d1ae5ad.jpg\" alt=\"蓝火微信公众号二维码\" /><br />\r\n</span></span> \r\n</p>');
INSERT INTO `blue_content` VALUES ('2', '关于蓝火', '<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#CCCCCC;font-size:32px;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<strong><span style=\"font-size:32px;color:#CCCCCC;\">广州蓝火文化传播有限公司</span></strong> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"font-size:16px;color:#FFFFFF;\"><strong>蓝火，品牌全面解决之道。</strong></span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"font-size:16px;color:#FFFFFF;\"><strong>核心价值观：创新，共享，人本，尊客。</strong></span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"font-size:16px;color:#FFFFFF;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"font-size:16px;color:#FFFFFF;\"><strong> </strong></span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<strong><span style=\"color:#CCCCCC;\">蓝火在行业中一直保持着领先的影响力：</span> </strong> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">广州 4A 协会的创始成员之一</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">广东省广告协会专委会副秘书长单位</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">广东省广告创作实力十强单位</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">本土第一家入围美国金铅笔奖的广告公司</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">中国十强策划企业之一，两次获得中国策划案例金奖</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">中国大陆广告公司创作实力 50 强排名之 11 位（《IAI 年鉴》评选）</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">IAI 年鉴十年最具持久创作力广告公司奖</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">荣获首届“金凤凰”营销奖评选——首届中国诚信营销机构奖</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">2010 年被评为“中国最具创作实力广告公司前十强”</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">2010 年十大新粤商 100 强单位</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">2012 年被中广协评为“2012 中国最具影响力广告服务机构”</span> \r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;\">2013 年被中国企业领袖与媒体领袖年会评为“影响中国 2013 年中国十大创新广告公司”</span> \r\n</p>\r\n<strong><br />\r\n</strong> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;font-size:16px;\">•蓝火累计服务过的品牌超过 100\r\n个，在中国营销史上创造了中国南方航空、创维电视、慕思寝具、 欧派橱柜、芙蓉王卷烟、华晨汽车、默克药业、奥康皮鞋、华帝厨电、中国娱乐第一品牌《同一首歌》、爱多VCD等众多经典品牌的成功传播案例。</span> \r\n</div>\r\n<div style=\"vertical-align:baseline;\">\r\n	<br />\r\n<!--[endif]-->\r\n</div>\r\n<div style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;font-size:16px;\">•蓝火自身拥有 120\r\n人的品牌管理专业团队，并于 2012\r\n年收购 1995\r\n年由著名日本品牌设计公司 PAOS\r\n在中国全资设立的 PAOS\r\n博奥司（北京）企业设计有限公司；同时，与欧洲著名的迪拜塔品牌设计第一人 John\r\nBrash 成立合资公司，成为其创办的 Brash\r\nBrands 在大中华地区的唯一合作伙伴。</span> \r\n</div>\r\n<div style=\"vertical-align:baseline;\">\r\n	<br />\r\n<!--[endif]-->\r\n</div>\r\n<div style=\"vertical-align:baseline;\">\r\n	<span style=\"color:#FFFFFF;font-size:16px;\">•通过这两大品牌设计专家团队资源的并购整合，蓝火同时借助 PAOS\r\n的东方品牌设计思想体系和 Brash\r\n的西方品牌设计方法体系丰富了蓝火的品牌战略咨询服务能力。</span> \r\n</div>\r\n<span style=\"color:#FFFFFF;font-size:16px;\"></span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"vertical-align:baseline;\">\r\n	<span style=\"font-size:16px;color:#FFFFFF;\"><strong><br />\r\n</strong></span> \r\n</p>');
INSERT INTO `blue_content` VALUES ('4', '多元化媒体运作', '<br />\r\n<br />\r\n<br />\r\n<span style=\"font-size:24px;\"><strong>媒体运作</strong></span><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;今日蓝火的媒介，提供的是集合消费者媒体接触洞察与趋势研究、媒体全案策划、全媒体优化购买以及媒体代理为一体的全方位整合型服务。<br />\r\n&nbsp;<br />\r\n<span style=\"font-size:24px;\"><strong>整合型媒体平台运作</strong></span><br />\r\n<p>\r\n	&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;从公司成立以来，蓝火在媒体运营与媒体服务领域上就不断创新完善，与国内众多的媒体机构建立起长期的战略合作关系，为多个广告客户提供了高效、综合性的媒体传播平台。我们利用自身专业的策划、购买能力，以及丰富多样的媒体资源，实现客户在传播效益上的最优化。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0b8daa1380.jpg\" alt=\"多元化媒体运作\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n<br />\r\n<span style=\"font-size:24px;\"><strong>数字互动领域上拓展</strong></span><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;蓝火立足与客户共同长远发展，除了在传统传播平台上的运营外，我们与时俱进，对数字互动营销以及其他创新精准技术领域进行有针对性的拓展延伸，满足日新月异的传播需求。在数字营销方面，我们不断引入领先的互联网投放技术与数字化工具，并顺应数字营销领域的发展，通过策略的不断更新改良，持续优化客户在互联网传播领域上的媒体投资，令其数字传播效果更为高效、节省。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0b902d63b2.jpg\" alt=\"多元化媒体运作\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n<span style=\"font-size:24px;\"><strong>精准营销大力发展</strong></span><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;与此同时，我们认为随着信息化社会的到来，建立在网络和信息技术基础上的精准模式将是现代化企业营销发展的方向，基于此判断，我们大力发展展精准营销领域，利用详尽的数据分析，洞察目标消费者日常的媒体接触习惯，合理调动互联网（包括门户、垂直、视频、SNS或电商网站等手段）、WAP网络、SMS手机短信、DM、精准户外等各类媒体模式，实现品牌建立、互动营销和销售推动的无缝协作，同时建立并利用受众数据库，帮助广告客户积累消费者更客观、更深入的数据，进而实现与目标消费者“一对一”的深度沟通。简单而言，就是在合适的时间，找到合适的人，做合适的传播。<br />\r\n<br />\r\n<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0b90c5af47.jpg\" alt=\"多元化媒体运作\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n<br />\r\n<span style=\"font-size:24px;\"><strong>航空媒体强势代理</strong></span><br />\r\n&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;航空媒体代理无疑是我们对精准传播的成功实践运用之一。近年来，航空市场高速发展，加上航空乘客的高消费能力，让每一个广告客户都高度关注。而能精准锁定商务人群、政府官员以及社会富裕阶层构成的“三高”人群（高学历、高收入、高消费）的航空媒体，无疑占领了精准传播的制高点。这群对中国经济影响力高达80%以上，个体含金量超高的“三高”群体是众多商家竞相追逐的对象，为此不惜花重金进行品牌沟通。而在芸芸众多的航空媒体中，我们重点选取了能在封闭空间中进行长时间、高频次到达的飞机座椅头巾、飞机桌板胶贴以及航空杂志等强势媒体进行整合代理，为众多客户对高端人群的精准传播提供了最具性价比的传播武器。\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0b9157e502.png\" alt=\"多元化媒体运作\" /> \r\n</p>');
INSERT INTO `blue_content` VALUES ('3', '高端品牌研究中心', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0a8c140f94.jpg\" alt=\"高端品牌研究中心\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-23/55b0a8c9d65ad.jpg\" alt=\"高端品牌研究中心\" /> \r\n</p>');
INSERT INTO `blue_content` VALUES ('6', '蓝火名片', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc17dad8d.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc20c9ada.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc28057fa.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc2e7044e.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc3615322.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc3ce88d5.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc45ef7e9.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc4ee3297.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc5847426.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc6024a32.JPG\" alt=\"蓝火名片\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-24/55b1dc662208f.JPG\" alt=\"蓝火名片\" /> \r\n</p>');

-- -----------------------------
-- Table structure for `blue_document_article`
-- -----------------------------
DROP TABLE IF EXISTS `blue_document_article`;
CREATE TABLE `blue_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- -----------------------------
-- Records of `blue_document_article`
-- -----------------------------
INSERT INTO `blue_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- -----------------------------
-- Table structure for `blue_document_download`
-- -----------------------------
DROP TABLE IF EXISTS `blue_document_download`;
CREATE TABLE `blue_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';


-- -----------------------------
-- Table structure for `blue_file`
-- -----------------------------
DROP TABLE IF EXISTS `blue_file`;
CREATE TABLE `blue_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';


-- -----------------------------
-- Table structure for `blue_hooks`
-- -----------------------------
DROP TABLE IF EXISTS `blue_hooks`;
CREATE TABLE `blue_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_hooks`
-- -----------------------------
INSERT INTO `blue_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `blue_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `blue_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `blue_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `blue_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `blue_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `blue_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `blue_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `blue_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `blue_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `blue_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- -----------------------------
-- Table structure for `blue_join`
-- -----------------------------
DROP TABLE IF EXISTS `blue_join`;
CREATE TABLE `blue_join` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='????????';

-- -----------------------------
-- Records of `blue_join`
-- -----------------------------
INSERT INTO `blue_join` VALUES ('1', '美术指导 Art Director', '<p>\r\n	1.2年以上相关工作经验\r\n</p>\r\n<p>\r\n	2.良好的策略思考能力，理解能力强，能够准确把握策略的需求；\r\n</p>\r\n<p>\r\n	3.具有扎实的美术功底和艺术修养，思维活跃，创意层出不穷；\r\n</p>\r\n<p>\r\n	4.富于团队协作精神和协调指导能力；\r\n</p>\r\n<p>\r\n	5.能独立高效地完成工作，吃苦耐劳，富于敬业精神；\r\n</p>', '2015-07-13 10:38:37');
INSERT INTO `blue_join` VALUES ('2', '文案 Copy', '<p>\r\n	1.2年以上相关工作经验\r\n</p>\r\n<p>\r\n	2.具备较强的文字功底，能抓住产品核心，分析目标受众，根据客户需求，进行广告创作和相关广告策划\r\n</p>\r\n<p>\r\n	3.了解电视电台媒体，广告、市场营销、中文或新闻专业\r\n</p>', '2015-07-13 10:57:33');
INSERT INTO `blue_join` VALUES ('3', '品牌经理Brand Manager', '<p>\r\n	<span style=\"color:#000000;\">1. 3年以上相关工作经验<br />\r\n2.团队精神,善于沟通，学习意识强，有强烈的责任心，工作积极主动；<br />\r\n3.对品牌塑造及管理有见解，有丰富的品牌服务经验及维护能力；<br />\r\n4.具有敏锐的洞察力及丰富的营销策划经验及市场分析能力；<br />\r\n5.熟悉企业及广告公司运作流程。<br />\r\n</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2015-07-13 10:58:42');
INSERT INTO `blue_join` VALUES ('4', '撰文指导 Copy', '<span style=\"color:#000000;\">1. 3年以上相关工作经验<br />\r\n2.熟悉各类创意类文案的撰写；<br />\r\n3.对文案创作有激情有耐心&nbsp;<br />\r\n4.良好的表达能力和提案能力&nbsp;<br />\r\n5.工作细致严谨.责任心强.积极主动.有良好的团队合作精神和职业素养；<br />\r\n</span><span style=\"color:#000000;\"></span><br />', '2015-07-21 16:27:13');
INSERT INTO `blue_join` VALUES ('5', '策划经理Planning Manager', '1. 2年以上相关工作经验<br />\r\n2. 具有敏锐的洞察力、丰富的营销策划经验及市场分析能力&nbsp;<br />\r\n3.具备思想敏捷、文笔流畅、长于沟通、擅长撰写各类策划方案&nbsp;<br />\r\n4.有操作、管理过大型项目策划经验，有严密的逻辑思维&nbsp;<br />\r\n5. 有较好的策略思考及理解能力，对创意概念有较强的发想与把握；<br />', '2015-07-21 16:28:19');
INSERT INTO `blue_join` VALUES ('6', '电脑制作经理', '1. 3年以上相关工作经验<br />\r\n2.艺术设计类大本科以上学历； 精通photoshop、illustrator、indesign、coreldraw等平面设计软件；<br />\r\n3.能充分认识客户品牌核心，有较强的原创方案能力，视觉传达表现出色。<br />\r\n4.严格守时，保证工作效率，能承受加班压力； 擅于与人沟通协调，组织能力强，有团队合作精神。<br />', '2015-07-21 16:28:41');
INSERT INTO `blue_join` VALUES ('7', '电脑制作Computer Artist', '<span style=\"color:#000000;\">1.2年以上相关工作经验</span><br />\r\n<span style=\"color:#000000;\"> 2.熟练各类设计软件 ，会做正稿者优先</span><br />\r\n<span style=\"color:#000000;\"> 3.认真负责 思维敏捷 工作效率高 有团队精神</span><br />', '2015-07-21 16:30:05');

-- -----------------------------
-- Table structure for `blue_media`
-- -----------------------------
DROP TABLE IF EXISTS `blue_media`;
CREATE TABLE `blue_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '影视标题',
  `intro` text NOT NULL COMMENT '影视简介',
  `thumb` int(10) unsigned NOT NULL COMMENT '缩略图',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `blue_media`
-- -----------------------------
INSERT INTO `blue_media` VALUES ('2', '日丰卫浴---海清代言', '<p>\r\n	日丰卫浴---海清代言\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=q01418bqmx2&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '16', '2015-07-24 15:26:48');
INSERT INTO `blue_media` VALUES ('3', '康龙休闲鞋---轻生活', '<p>\r\n	康龙休闲鞋---轻生活\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=z0141c0tc17&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '17', '2015-07-24 15:27:27');
INSERT INTO `blue_media` VALUES ('4', '欧派橱柜---蒋雯丽', '<p>\r\n	欧派橱柜---蒋雯丽\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=g01413hz7gh&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '18', '2015-07-24 15:28:14');
INSERT INTO `blue_media` VALUES ('5', '法派西服', '<p>\r\n	法派西服\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=h01415sidrx&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '19', '2015-07-24 15:29:02');
INSERT INTO `blue_media` VALUES ('6', '芙蓉王---传递价值，成就你我', '<p>\r\n	烟草领先品牌的文化再造\r\n越成就越为你成就\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=g0141b15sf6&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '20', '2015-07-24 15:29:29');
INSERT INTO `blue_media` VALUES ('7', '奥康皮鞋---父子篇', '<p>\r\n	奥康皮鞋---父子篇\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=a0141ct4gmn&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '21', '2015-07-24 15:30:42');
INSERT INTO `blue_media` VALUES ('8', '广州蓝火文化传播有限公司影视广告合集', '<p>\r\n	<strong>蓝火在行业中一直保持着领先的影响力：</strong> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\">广州 4A 协会的创始成员之一、</span><span style=\"line-height:1.5;\">广东省广告协会专委会副秘书长单位、</span><span style=\"line-height:1.5;\">广东省广告创作实力十强单位、</span><span style=\"line-height:1.5;\">本土第一家入围美国金铅笔奖的广告公司、</span><span style=\"line-height:1.5;\">中国十强策划企业之一，两次获得中国策划案例金奖、</span><span style=\"line-height:1.5;\">中国大陆广告公司创作实力 50 强排名之 11 位（《IAI 年鉴》评选）</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=n0140s4hfq7&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '22', '2015-07-24 15:31:26');
INSERT INTO `blue_media` VALUES ('9', '高端品牌的战略升级---慕思案例', '<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过此次的品牌战略升级后，慕思整个品牌系统形成了一个井然有序的良性运转局面。协同进军高端寝具市场；</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高端、国际化的视觉形象更让慕思一下子从同质化地竞争中跳脱出来，慕思旗下各品牌的识别度大大提高，并在消费者心目中逐步清晰起来。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌战略的升级工程使得慕思向百亿级的企业目标更进了一步，也为慕思进军国际市场奠定了坚实的基础。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><embed src=\"http://static.video.qq.com/TPout.swf?vid=c0160030yfm&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" /><br />\r\n</span> \r\n</p>', '23', '2015-07-24 15:32:32');
INSERT INTO `blue_media` VALUES ('10', '挚爱之礼，为爱呈现---爱膜逆', '<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美丽奇迹，因爱而生在形象塑造上，以爱神丘比特(Cupid)与普绪克(Psyche)的动人故事为品牌故事，传达由爱生美的品牌理念。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌色选用蒂芙尼的蓝绿色与白色配合，高雅、迷人。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简洁大方优雅的蝴蝶结是爱膜逆的专属符号，代表着爱的礼物。独特的书籍礼盒外包装和情书，满载着浓浓的宠爱。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><embed src=\"http://static.video.qq.com/TPout.swf?vid=y0155uyuht3&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" /><br />\r\n</span> \r\n</p>\r\n<br />', '24', '2015-07-24 15:33:04');
INSERT INTO `blue_media` VALUES ('11', '阿拉善SEE3.22世界水日大型公益活动回顾', '<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;水日论坛整合了SEE老会员（兴业银行、艺康、君泽君、嘉富诚、书堂画院及万科）的商业资源，引进了国际强势品牌（可口可乐）的商业力量，为水日论坛的分论坛内容搭建提供了强有力的保障，并发展了大批有实力的新会员现场入会；</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而水日音乐会更体现商业力量与公益慈善是相辅相成的，通过SEE新老会员（荣昱地产、流行美）的商业资源与世界级著名指挥家谭盾的水音乐艺术融合，联合国教科文组织UNESCO总干事伊琳娜•博科娃特意发来祝贺及公益宣讲视频，将水日活动的国际影响力推到高潮。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<embed src=\"http://static.video.qq.com/TPout.swf?vid=z0155no0zcs&auto=0\" type=\"application/x-shockwave-flash\" width=\"1024\" height=\"576\" autostart=\"false\" loop=\"true\" />\r\n</p>', '25', '2015-07-24 15:33:33');

-- -----------------------------
-- Table structure for `blue_member`
-- -----------------------------
DROP TABLE IF EXISTS `blue_member`;
CREATE TABLE `blue_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- -----------------------------
-- Records of `blue_member`
-- -----------------------------
INSERT INTO `blue_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '50', '17', '0', '1436753279', '244539082', '1438234643', '1');

-- -----------------------------
-- Table structure for `blue_menu`
-- -----------------------------
DROP TABLE IF EXISTS `blue_menu`;
CREATE TABLE `blue_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_menu`
-- -----------------------------
INSERT INTO `blue_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `blue_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `blue_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `blue_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `blue_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `blue_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `blue_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `blue_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `blue_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `blue_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `blue_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `blue_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `blue_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `blue_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `blue_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `blue_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `blue_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `blue_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `blue_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `blue_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `blue_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `blue_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `blue_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `blue_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `blue_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `blue_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `blue_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `blue_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `blue_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `blue_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `blue_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `blue_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `blue_menu` VALUES ('58', '数据管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `blue_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('68', '网站管理', '0', '4', 'Config/group', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '1', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `blue_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `blue_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `blue_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `blue_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '1', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '1', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `blue_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `blue_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `blue_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `blue_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `blue_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `blue_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `blue_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `blue_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `blue_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `blue_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `blue_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `blue_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `blue_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `blue_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `blue_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `blue_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');

-- -----------------------------
-- Table structure for `blue_message`
-- -----------------------------
DROP TABLE IF EXISTS `blue_message`;
CREATE TABLE `blue_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company` varchar(255) NOT NULL COMMENT '公司名称',
  `username` varchar(255) NOT NULL COMMENT '联系人',
  `sex` varchar(255) NOT NULL COMMENT '性别',
  `phone` varchar(255) NOT NULL COMMENT '联系电话',
  `email` varchar(255) NOT NULL COMMENT 'Email',
  `content` text NOT NULL COMMENT '留言内容',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='留言表';

-- -----------------------------
-- Records of `blue_message`
-- -----------------------------
INSERT INTO `blue_message` VALUES ('1', '爱膜逆', '罗', '女士', '13672599854', '123456@qq.com', '测试用的', '2015-07-21 15:37:50');
INSERT INTO `blue_message` VALUES ('2', '格力', '莫杰', '先生', '13672599853', '23232323@qq.com', '希望有机会合作。', '2015-07-21 16:38:15');
INSERT INTO `blue_message` VALUES ('3', '腾讯', '马云', '先生', '13672599858', '362514@qq.com', '测试而已', '2015-07-26 21:46:40');

-- -----------------------------
-- Table structure for `blue_model`
-- -----------------------------
DROP TABLE IF EXISTS `blue_model`;
CREATE TABLE `blue_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- -----------------------------
-- Records of `blue_model`
-- -----------------------------
INSERT INTO `blue_model` VALUES ('4', 'join', '加入我们', '0', '', '1', '{\"1\":[\"33\",\"34\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:职位名称\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436754961', '1437464621', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('5', 'news', '新闻热报', '0', '', '1', '{\"1\":[\"36\",\"51\",\"37\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:新闻标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436756386', '1437464585', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('6', 'case', '蓝火案例', '0', '', '1', '{\"1\":[\"39\",\"40\"]}', '1:基础', '', '', '', '', 'id:编号\r\ncategory:案例类型\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436844098', '1437464572', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('8', 'cases', '具体案例', '0', '', '1', '{\"1\":[\"46\",\"47\",\"50\",\"48\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:案例名称\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436861944', '1437464560', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('9', 'team', '精英团队', '0', '', '1', '{\"1\":[\"52\",\"53\",\"54\"]}', '1:基础', '', '', '', '', 'id:编号\r\ninfo:个人简介\r\nid:操作:[EDIT]|编辑', '10', '', '', '1437463563', '1437464461', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('10', 'message', '留言板', '0', '', '1', '{\"1\":[\"56\",\"57\",\"58\",\"59\",\"60\",\"61\"]}', '1:基础', '', '', '', '', 'id:编号\r\ncompany:公司名称\r\nusername:联系人\r\nphone:联系电话\r\nemail:Email\r\naddtime:留言时间\r\nid:操作:[EDIT]|查看详细内容', '10', '', '', '1437463571', '1437464405', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('11', 'newcase', '微信公众号最新案例', '0', '', '1', '{\"1\":[\"63\",\"65\",\"67\",\"64\",\"66\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:案例标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1437543276', '1437543355', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('12', 'content', '内容', '0', '', '1', '{\"1\":[\"68\",\"69\",\"70\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:内容标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1437640473', '1437640686', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('13', 'media', '影视作品', '0', '', '1', '{\"1\":[\"71\",\"73\",\"72\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:影视标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1437722446', '1437722657', '1', 'MyISAM');
INSERT INTO `blue_model` VALUES ('14', 'partner', '品牌战略合作伙伴', '0', '', '1', '{\"1\":[\"75\",\"76\",\"77\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:名称\r\nid:操作:[EDIT]|编辑', '10', '', '', '1438071614', '1438071700', '1', 'MyISAM');

-- -----------------------------
-- Table structure for `blue_newcase`
-- -----------------------------
DROP TABLE IF EXISTS `blue_newcase`;
CREATE TABLE `blue_newcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '案例标题',
  `intro` text NOT NULL COMMENT '案例简介',
  `url` varchar(255) NOT NULL COMMENT '案例链接',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `thumb` int(10) unsigned NOT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='最新案例表';

-- -----------------------------
-- Records of `blue_newcase`
-- -----------------------------
INSERT INTO `blue_newcase` VALUES ('1', '阿拉善SEE3.22世界水日大型公益活动回顾', '<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;水日论坛整合了SEE老会员（兴业银行、艺康、君泽君、嘉富诚、书堂画院及万科）的商业资源，引进了国际强势品牌（可口可乐）的商业力量，为水日论坛的分论坛内容搭建提供了强有力的保障，并发展了大批有实力的新会员现场入会；</span><br />\r\n<span style=\"font-size:14px;\"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;而水日音乐会更体现商业力量与公益慈善是相辅相成的，通过SEE新老会员（荣昱地产、流行美）的商业资源与世界级著名指挥家谭盾的水音乐艺术融合，联合国教科文组织UNESCO总干事伊琳娜•博科娃特意发来祝贺及公益宣讲视频，将水日活动的国际影响力推到高潮。</span><br />', '<iframe frameborder=\"0\" width=\"100%\" height=\"auto\" src=\"http://v.qq.com/iframe/player.html?vid=z0155no0zcs&tiny=0&auto=0\" allowfullscreen></iframe>', '2015-07-22 13:37:22', '15');
INSERT INTO `blue_newcase` VALUES ('2', '挚爱之礼，为爱呈现---爱膜逆', '<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;美丽奇迹，因爱而生在形象塑造上，以爱神丘比特(Cupid)与普绪克(Psyche)的动人故事为品牌故事，传达由爱生美的品牌理念。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌色选用蒂芙尼的蓝绿色与白色配合，高雅、迷人。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;简洁大方优雅的蝴蝶结是爱膜逆的专属符号，代表着爱的礼物。独特的书籍礼盒外包装和情书，满载着浓浓的宠爱。</span> \r\n</p>\r\n<br />', '<iframe frameborder=\"0\" width=\"100%\" height=\"auto\" src=\"http://v.qq.com/iframe/player.html?vid=y0155uyuht3&tiny=0&auto=0\" allowfullscreen></iframe>', '2015-07-22 13:47:30', '12');
INSERT INTO `blue_newcase` VALUES ('3', '高端品牌的战略升级---慕思案例', '<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;通过此次的品牌战略升级后，慕思整个品牌系统形成了一个井然有序的良性运转局面。协同进军高端寝具市场；</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;高端、国际化的视觉形象更让慕思一下子从同质化地竞争中跳脱出来，慕思旗下各品牌的识别度大大提高，并在消费者心目中逐步清晰起来。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌战略的升级工程使得慕思向百亿级的企业目标更进了一步，也为慕思进军国际市场奠定了坚实的基础。</span> \r\n</p>', '<iframe frameborder=\"0\" width=\"100%\" height=\"auto\" src=\"http://v.qq.com/iframe/player.html?vid=c0160030yfm&tiny=0&auto=0\" allowfullscreen></iframe>', '2015-07-22 13:48:18', '13');

-- -----------------------------
-- Table structure for `blue_news`
-- -----------------------------
DROP TABLE IF EXISTS `blue_news`;
CREATE TABLE `blue_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '新闻标题',
  `content` text NOT NULL COMMENT '新闻内容',
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `thumb` int(10) unsigned NOT NULL COMMENT '缩略图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='新闻热报';

-- -----------------------------
-- Records of `blue_news`
-- -----------------------------
INSERT INTO `blue_news` VALUES ('1', '蓝火高端品牌研究中心正式成立！', '<p>\r\n	<span style=\"font-size:14px;\">2012年初，由广州蓝火文化传播有限公司、新生代市场调查机构、深圳汇品源营销策划有限公司、</span><br />\r\n<span style=\"font-size:14px;\">深圳维基飞翔科技有限公司联合发起，蓝火高端品牌研究中心正式成立，</span><br />\r\n<span style=\"font-size:14px;\">广州蓝火文化传播有限公司成为第一届常务理事单位。</span><br />\r\n<span style=\"font-size:14px;\">专门针对各行业的高端品牌，比如烟草行业的高端品牌芙蓉王、科技电子行业的创维电视、</span><br />\r\n<span style=\"font-size:14px;\">家居建材类的大自然地板、日丰管/日丰卫浴、中国男鞋第一品牌奥康等，</span><br />\r\n<span style=\"font-size:14px;\">蓝火品牌专家组专门针对其高端品牌性及行业领导地位，提出了一系列更符合高端品牌发展的品牌战略规划，</span><br />\r\n<span style=\"font-size:14px;\">大大增加了品牌的高溢价能力，开创出更符合其的定位服务。</span><br />\r\n<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82e108f045.jpg\" alt=\"蓝火高端品牌研究中心正式成立！\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82e17d1365.jpg\" alt=\"蓝火高端品牌研究中心正式成立！\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '2015-07-13 11:01:55', '6');
INSERT INTO `blue_news` VALUES ('2', '广州蓝火总裁袁莹女士荣获2011年度中国经济女性！', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">2012年4月14日，广州蓝火袁总刚刚荣获“2011年中国经济女性年度人物优秀经济女性”称号。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n<span style=\"font-size:14px;\">此奖是由国资委群工局，中国市长协会女市长分会等机构颁发，是中国经济女性的最高奖项！</span><br />\r\n<span style=\"font-size:14px;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b828340504a.jpg\" alt=\"图为中国妇女报2012年4月16日版照片，左二是中国船舶工业集团副总路小彦，右一为袁总\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">图为中国妇女报2012年4月16日版照片，左二是中国船舶工业集团副总路小彦，右一为袁总</span><span style=\"font-size:12px;\"></span><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8286db447a.jpg\" alt=\"《经济女性人物邮票册》\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">《经济女性人物邮票册》</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8288d21886.jpg\" alt=\"《经济女性人物邮票册》\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">《经济女性人物邮票册》</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b828a6a1cf3.jpg\" alt=\"《经济女性人物邮票册》\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">《经济女性人物邮票册》</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b828bd78302.jpg\" alt=\"袁总经济女性奖项\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">袁总经济女性奖项</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b828d6c550c.jpg\" alt=\"袁总已获三次【中国经济女性年度人物】奖\" /><br />\r\n</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><span style=\"font-size:12px;\">袁总已获三次【中国经济女性年度人物】奖<br />\r\n</span></span> \r\n</p>', '2015-07-13 11:03:50', '5');
INSERT INTO `blue_news` VALUES ('3', '祝贺蓝火品牌全案代理客户奥康国际A股挂牌上市！', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">历时24年，浙江奥康鞋业股份有限公司终于2012年4月27日于上海证券交易所A股挂牌上市！</span> \r\n</p>\r\n<span style=\"font-size:14px;\">股票名称：奥康国际，股票代码：603001，被称为“中国男鞋第一股”。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">目前，浙江全省皮鞋企业近8000家，规模以上的占3000多家，年均产量30亿双，</span><br />\r\n<span style=\"font-size:14px;\">占全国市场的份额接近30%，在奥康之前却没有一家上市公司。</span><br />\r\n<span style=\"font-size:14px;\">同样整个A股市场上专注于鞋业制造与零售的上市公司寥寥无几。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">奥康国际此次共募集资金10.2236亿元，将投向营销网络建设项目、</span><br />\r\n<span style=\"font-size:14px;\">信息化系统建设项目、研发中心技改项目三个项目，</span><br />\r\n<span style=\"font-size:14px;\">资金比分配分别为8.7625亿元、9610万元，5001万元。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">在完成国内投资布局和制鞋产业链深耕后，奥康早将目光投向了全球，</span><br />\r\n<span style=\"font-size:14px;\">在国际化进程中与国际同行在竞争中合作，披上高科技的外衣。</span><br />\r\n<span style=\"font-size:14px;\">目前该公司的数字化研发基地在国内是比较领先的，</span><br />\r\n<span style=\"font-size:14px;\">完全实现3D设计、2D开板式地研究，告别了手工打鞋板的时代，</span><br />\r\n<span style=\"font-size:14px;\">并实现了24小时就可研发一个新型鞋板的速度。</span> \r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82992424b8.jpg\" alt=\"上海证券交易所的[奥康国际]A股敲钟仪式\" />&nbsp;<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8299dd739c.jpg\" alt=\"醒狮点睛\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-family:Verdana, Arial, Helvetica, sans-serif;line-height:24px;\">&nbsp; &nbsp; &nbsp; 上海证券交易所的[奥康国际]A股敲钟仪式 &nbsp;</span>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 醒狮点睛\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b829d066558.jpg\" alt=\"奥康国际董事长王振滔致辞\" />&nbsp;<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b829f41c2f9.jpg\" alt=\"共同举起庆功酒\" /> \r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 奥康国际董事长王振滔致辞 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;共同举起庆功酒\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82a1506c70.jpg\" alt=\"嘉宾合影\" />&nbsp;<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82a2dd75d3.jpg\" alt=\"酒会上王振滔董事长与贵宾共同注入金沙，启动奥康国际股票代码\" /> \r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 嘉宾合影 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style=\"font-family:Verdana, Arial, Helvetica, sans-serif;line-height:24px;\">酒会上王振滔董事长与贵宾共同注入金沙，启动奥康国际股票代码&nbsp;</span> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82a534b224.jpg\" alt=\"王振滔董事长敬嘉宾酒\" />&nbsp;<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82a680e550.jpg\" alt=\"王振滔董事长与嘉宾共同欣赏精彩节目\" /> \r\n</p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 王振滔董事长敬嘉宾酒 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;王振滔董事长与嘉宾共同欣赏精彩节目&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82a8b265b1.jpg\" alt=\"王振滔董事长与嘉宾合影\" />&nbsp;<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82aa08447b.jpg\" alt=\"蓝火对奥康的贺礼——油画《真牛》\" /> \r\n</p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;王振滔董事长与嘉宾合影&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"line-height:24px;font-size:10.5pt;font-family:宋体;\">蓝火对奥康的贺礼——油画《真牛》（作者：</span><span style=\"line-height:24px;font-size:10.5pt;font-family:宋体;\">广东画院院长，广东美协副主席林永康&nbsp;</span><span style=\"line-height:24px;font-size:10.5pt;font-family:宋体;\">）</span> \r\n</p>', '2015-07-13 11:04:36', '4');
INSERT INTO `blue_news` VALUES ('4', '芙蓉王项目投标比稿脱颖而出成功中标！', '<p>\r\n	<span style=\"font-size:16px;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong>芙蓉王项目投标比稿脱颖而出成功中标！</strong></span> \r\n</p>\r\n<span style=\"font-size:14px;\">自2006年蓝火提出“传递价值，成就你我”的经典广告语，</span><br />\r\n<span style=\"font-size:14px;\">为芙蓉王《回馈篇》TVC的成功制作，种下了芙蓉王与蓝火后续合作的一颗缘分种子。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp; &nbsp;</span><br />\r\n<span style=\"font-size:14px;\">2011年6月，广州蓝火再次参与了《湖南中烟品牌文化理念提升与传播推广创新项目》</span><br />\r\n<span style=\"font-size:14px;\">及《芙蓉王系列产品营销推广咨询服务项目》的招标，</span><br />\r\n<span style=\"font-size:14px;\">此次招标范围容纳了全国的优秀广告公司，最终有6家公司与蓝火一起参与竞标。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">广州蓝火对此次招标十分重视，经过多次的研讨与分析，一次一次的创意火花碰撞，</span><br />\r\n<span style=\"font-size:14px;\">全案人员精心的准备、全力打造之下，芙蓉王初次竞标中，蓝火从其他6家广告公司中脱颖而出，顺利中标。</span><br />\r\n<span style=\"font-size:14px;\">中标后，蓝色火焰专组人员信心满满，再次进入了第二次竞标的奋战之中，功夫不负有心人，</span><br />\r\n<p>\r\n	<span style=\"font-size:14px;\">蓝色火焰不负众望再次夺标，于是，芙蓉王与蓝火再一次演绎了烟与火的不解情缘。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8278482ff8.jpg\" alt=\"芙蓉王项目成功中标\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8278a69c60.jpg\" alt=\"芙蓉王项目成功中标\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8279902793.jpg\" alt=\"芙蓉王项目成功中标\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8279202005.jpg\" alt=\"芙蓉王项目成功中标\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b827aa9291c.jpg\" alt=\"芙蓉王项目成功中标\" /><br />\r\n</span> \r\n</p>', '2015-07-13 11:05:27', '3');
INSERT INTO `blue_news` VALUES ('5', '蓝火签约韩国艺人李民赫！', '<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">蓝火与韩国艺人李民赫正式签署合约，成为其大中华区独家经纪代理公司！</span> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82f14b2b8a.jpg\" alt=\"韩国艺人李民赫\" /><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82f1a72000.jpg\" alt=\"韩国艺人李民赫\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">李民赫，韩国新生代美男。</span><br />\r\n<span style=\"font-size:14px;\">韩文名：이민혁（Lee Min Hyuk）</span><br />\r\n<span style=\"font-size:14px;\">出生年月：1982年9月29日 　　</span><br />\r\n<span style=\"font-size:14px;\">生肖：狗 　　</span><br />\r\n<span style=\"font-size:14px;\">星座：天秤座 　　出生地点：韩国首尔 　　</span><br />\r\n<span style=\"font-size:14px;\">身高：177cm 　　体重：60kg 　　</span><br />\r\n<span style=\"font-size:14px;\">血型：B</span><br />\r\n<span style=\"font-size:14px;\">2003年以韩国5人男子组合T.A.K.E成员身份出道。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;line-height:21px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b82f3e479d2.jpg\" alt=\"韩国5人男子组合T.A.K.E\" /><br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">（韩国T.A.K.E.组合：李承铉、金度完、李民赫、张成宰、申承熙）</span><br />\r\n<span style=\"font-size:14px;\">李民赫因花美男的外貌获得众多FANS们的喜爱。</span><br />\r\n<span style=\"font-size:14px;\">在拍摄了SKY广告之后，李民赫发现演戏更加适合自己，</span><br />\r\n<span style=\"font-size:14px;\">从而决定放弃歌手生涯转型做演员。</span><br />\r\n<span style=\"font-size:14px;\">电影/电视剧</span><br />\r\n<span style=\"font-size:14px;\">2004年 《那小子真帅》 饰 金哲凝 （合作演员：宋承宪、郑多彬） 　　</span><br />\r\n<span style=\"font-size:14px;\">2005年 《可爱还是疯狂》 （合作演员：苏幼贞、柳承洙、朴俊锡、朴信惠）</span><br />\r\n<span style=\"font-size:14px;\">2005年 《这该死的爱》 饰 车载锡 （合作演员：郑智薰、申敏儿、李基宇、金莎朗）</span><br />\r\n<span style=\"font-size:14px;\">2006年 《多细胞少女》 （合作演员：金玉彬、朴镇宇）</span>\r\n</p>', '2015-07-24 16:24:37', '48');
INSERT INTO `blue_news` VALUES ('6', '广州亚运会期间，共青团广州市委书记王焕清给广州蓝火袁总颁发亚运顾问证书', '<p>\r\n	&nbsp;2009年3月3日下午，由广州亚组委志愿者部、共青团广州市委、广州青年志愿者协会共同主办的“亚运会·志愿服务·城市发展”高峰论坛在广州亚体中心拉开帷幕。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	广州亚运会志愿者项目专家顾问委员会宣告成立，广州亚组委志愿者部部长、共青团广州市委书记王焕清等领导现场为16名专家顾问颁授了聘书。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	该委员会将在广州亚运会志愿者项目，包括名称、口号、主题、载体、推广方式等多个方面进行专业性指导，提出具有实操价值的建设性意见及建议，为2010年广州亚运志愿服务的顺利开展奠定良好基础。&nbsp;\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b826d0a03f4.jpg\" alt=\"共青团广州市委书记王焕清给广州蓝火袁总颁发亚运顾问证书\" /> \r\n</p>\r\n<p>\r\n	共青团广州市委书记王焕清给广州蓝火袁总颁发亚运顾问证书\r\n</p>', '2015-07-29 09:05:38', '47');

-- -----------------------------
-- Table structure for `blue_partner`
-- -----------------------------
DROP TABLE IF EXISTS `blue_partner`;
CREATE TABLE `blue_partner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '名称',
  `logo` int(10) unsigned NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `blue_partner`
-- -----------------------------
INSERT INTO `blue_partner` VALUES ('1', '中国国际城市建设博览会', '44', '');
INSERT INTO `blue_partner` VALUES ('2', '亚奥理事会', '45', '');
INSERT INTO `blue_partner` VALUES ('3', '微益网', '46', '');

-- -----------------------------
-- Table structure for `blue_picture`
-- -----------------------------
DROP TABLE IF EXISTS `blue_picture`;
CREATE TABLE `blue_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `blue_picture`
-- -----------------------------
INSERT INTO `blue_picture` VALUES ('1', '/Uploads/Picture/2015-07-14/55a4c6c6e097c.jpg', '', '1ce002df20028735fa1e197af186bf4a', '3a4417e6854e1db31aa70d88df2d93a67288ebb1', '1', '1436862150');
INSERT INTO `blue_picture` VALUES ('2', '/Uploads/Picture/2015-07-14/55a4ca9320aa5.jpg', '', 'c25f8a45de020ac18855520c4618a6d2', '073eca8d65ce5f539e6af5861fe91fe3c27f754f', '1', '1436863122');
INSERT INTO `blue_picture` VALUES ('3', '/Uploads/Picture/2015-07-21/55adf5acdfde0.jpg', '', '34e5d63249c6d8d28c80d5df25bff8f8', 'd5d39e1a8d672883f3db8791228b1a7874104e90', '1', '1437463980');
INSERT INTO `blue_picture` VALUES ('4', '/Uploads/Picture/2015-07-21/55adf5d7b1d45.jpg', '', '49dbdc5d55a9848cdc28560864ce8749', '47ad7c290ba94ba1fe115bbe2520dcdb187a8c3c', '1', '1437464023');
INSERT INTO `blue_picture` VALUES ('5', '/Uploads/Picture/2015-07-21/55adf5e6b56a6.jpg', '', '2932f6b56227113ba3c171385b030b8f', '823547010c6c846bf266e508f3a91e3ea39ad587', '1', '1437464038');
INSERT INTO `blue_picture` VALUES ('6', '/Uploads/Picture/2015-07-21/55adf60fc9100.jpg', '', '8d7c5960e7c69d3afc03c4ff9707637c', '4aa66064a0791b0ad71d05f5512817d9f0f8b0b3', '1', '1437464079');
INSERT INTO `blue_picture` VALUES ('7', '/Uploads/Picture/2015-07-21/55adf9015dfe0.jpg', '', '8598dd2b3a9b60645900c222f0d15029', 'd8ad2d8c4d54b8d00302c3b48e8d901c8ad5ca2c', '1', '1437464833');
INSERT INTO `blue_picture` VALUES ('8', '/Uploads/Picture/2015-07-21/55adf995f11b1.jpg', '', 'c6453e8a047072ded304806a3794001d', 'f1c18f6c81a3f2146e8642637c5d1e12d69fe814', '1', '1437464981');
INSERT INTO `blue_picture` VALUES ('9', '/Uploads/Picture/2015-07-21/55adfa1acb849.jpg', '', '0dc734b2b596df41f60c6bea365b5892', 'f0cc957be91b1ce324942ce2c00e0f823989bfeb', '1', '1437465114');
INSERT INTO `blue_picture` VALUES ('10', '/Uploads/Picture/2015-07-21/55adfa97d6f8c.jpg', '', '817d1ad9231780fcde06480e6074126c', '2d37428d7e0f60cb138173494d37ea009e9022bd', '1', '1437465239');
INSERT INTO `blue_picture` VALUES ('11', '/Uploads/Picture/2015-07-22/55af2c0a98c87.jpg', '', '465e60f7a385bdec11ad8e0376ee6225', '7d2b5e59019636c410eb03216e21773ad10e0334', '1', '1437543434');
INSERT INTO `blue_picture` VALUES ('12', '/Uploads/Picture/2015-07-22/55af2e7133b88.jpg', '', 'd8722a3649beeb1a8cda394594f8dcd6', '5a12c5d50e3b24a10b409d3c19331cf9301b5745', '1', '1437544048');
INSERT INTO `blue_picture` VALUES ('13', '/Uploads/Picture/2015-07-22/55af2e99ee973.jpg', '', '997078530a35999d6401d20d7f6788c9', 'cf1d251f3a47c2d2ecff221c1e2058f74f578ac9', '1', '1437544089');
INSERT INTO `blue_picture` VALUES ('14', '/Uploads/Picture/2015-07-22/55af3d0bd4c33.png', '', '96925e89d3eceebe15c4b270a3007d0d', '69b939904cdc38844ff57f55deaea98148589d62', '1', '1437547784');
INSERT INTO `blue_picture` VALUES ('15', '/Uploads/Picture/2015-07-22/55af3f1529411.jpg', '', 'f7f878105d04f86148d7d4d6e85a4893', '03eb302d0aa5a1d6f939d622bdfe3950b62b003a', '1', '1437548307');
INSERT INTO `blue_picture` VALUES ('16', '/Uploads/Picture/2015-07-24/55b1e831be5ad.jpg', '', 'cd91894c4c79962048bd0a2f69d9cea3', '89f48914c0dd288fb787d0357a74e012cdc1f0e1', '1', '1437722672');
INSERT INTO `blue_picture` VALUES ('17', '/Uploads/Picture/2015-07-24/55b1e8cf209ae.jpg', '', 'f3d20b2ee94d6f1cbb3ffb1f9e1ed10a', '4cb76aa8cfa8acbcd3d6a1925d09764a5b13b873', '1', '1437722828');
INSERT INTO `blue_picture` VALUES ('18', '/Uploads/Picture/2015-07-24/55b1e906cd260.jpg', '', '56e7530a1b6b31c0e416d52d7ac200a8', 'd4e1728d5a9977222340de0fd15e208b2b833596', '1', '1437722885');
INSERT INTO `blue_picture` VALUES ('19', '/Uploads/Picture/2015-07-24/55b1e92f5ee51.jpg', '', '45dbc19879b93d268d9b6807e17834fe', 'df991f199dc2f694e40c3c2739e069c2c5bb203b', '1', '1437722925');
INSERT INTO `blue_picture` VALUES ('20', '/Uploads/Picture/2015-07-24/55b1e95301665.jpg', '', '4667b4d6443bc25bd1f49721c8a92019', '033690c8befff606f9408bc223a1a300340b8791', '1', '1437722960');
INSERT INTO `blue_picture` VALUES ('21', '/Uploads/Picture/2015-07-24/55b1e99816f45.jpg', '', '6c760be6ee9179e6e3963358ff6cb446', '617428576f16a9bba1c847cd5692dab1f877c826', '1', '1437723030');
INSERT INTO `blue_picture` VALUES ('22', '/Uploads/Picture/2015-07-24/55b1e9b7e0040.jpg', '', 'a061af4405d0706cc2a87c35eff510fd', 'ffd47dae54341facd0dd576f2a6bf215b26c4be9', '1', '1437723060');
INSERT INTO `blue_picture` VALUES ('23', '/Uploads/Picture/2015-07-24/55b1ea085a136.jpg', '', 'e9d1d776d14395c141c302ec46e7f47f', '9c6c25834e5858c1ac0470bb6a137b8251ad40b2', '1', '1437723140');
INSERT INTO `blue_picture` VALUES ('24', '/Uploads/Picture/2015-07-24/55b1ea291d830.jpg', '', 'c3def15c3e65042e82cecb32ed79f8a8', '2b1d6277453a90f01e0f707a51b7dc70629a58ba', '1', '1437723172');
INSERT INTO `blue_picture` VALUES ('25', '/Uploads/Picture/2015-07-24/55b1ea470cbef.jpg', '', '7e12a5041379e491eb6a11ab23f0ca3e', '7985426cf54cd69dce704443a868dc69ac256958', '1', '1437723203');
INSERT INTO `blue_picture` VALUES ('26', '/Uploads/Picture/2015-07-24/55b1f60ac8d01.jpg', '', '15ec8ee31360a52c8ada85e53c3fd6b5', '093f12d14223f8b12f78378100255e3c15aa0c2b', '1', '1437726218');
INSERT INTO `blue_picture` VALUES ('27', '/Uploads/Picture/2015-07-26/55b4574c27431.jpg', '', '41aa4aed2fbcf8d678dd0dd048dffedc', 'c3bd17224694495a540185672f72346c0188ac22', '1', '1437882187');
INSERT INTO `blue_picture` VALUES ('28', '/Uploads/Picture/2015-07-27/55b5925d43e88.jpg', '', 'db751c344b2ad31870e81f5253f096bb', '1ed57ad0aa34492ef88221c00efbbc53f3a16ae2', '1', '1437962845');
INSERT INTO `blue_picture` VALUES ('29', '/Uploads/Picture/2015-07-27/55b592b3a3552.jpg', '', '4bca1894678e90d31fb14c0c1b8b495d', 'c583c81c1dd4cd163114e932b1259af656238b77', '1', '1437962931');
INSERT INTO `blue_picture` VALUES ('30', '/Uploads/Picture/2015-07-27/55b592f2727b0.jpg', '', '6d71307b9ea2cf55e6154447c94755bc', '47459118b0ce161a692064b0f8e7b0574f10e7df', '1', '1437962994');
INSERT INTO `blue_picture` VALUES ('31', '/Uploads/Picture/2015-07-27/55b59325639c3.jpg', '', '37bd04fac91bd95d875ecfe517cbe68a', '498facb669b6e368968e0165df66a92f9e494d2d', '1', '1437963045');
INSERT INTO `blue_picture` VALUES ('32', '/Uploads/Picture/2015-07-27/55b593f3d6b0c.jpg', '', 'ed22350955a53310544be4578dc80fa8', '447cc91278214ecb20c6ef1eb8f8ead78a3dc3cc', '1', '1437963251');
INSERT INTO `blue_picture` VALUES ('33', '/Uploads/Picture/2015-07-27/55b594254a6c0.jpg', '', '17678e54e66391431f1d59803142cbdd', '120a0153203325641cd0c3e3d851f4a887bce70f', '1', '1437963301');
INSERT INTO `blue_picture` VALUES ('34', '/Uploads/Picture/2015-07-27/55b59448bfea2.jpg', '', 'd3896bd365730c16483d6c94d57e1cb5', '15d527bc54fcf1e5b74d6012ccf777bee01c4158', '1', '1437963336');
INSERT INTO `blue_picture` VALUES ('35', '/Uploads/Picture/2015-07-27/55b595572635e.jpg', '', '9514f2e99d3e76e76b54bfb69db731de', 'fe50acb56ad0cd7a55bb413556e8dc0b36cb8a1f', '1', '1437963607');
INSERT INTO `blue_picture` VALUES ('36', '/Uploads/Picture/2015-07-27/55b59750e0df5.jpg', '', '8ed40fed44a83f3943f9a802aeb6ada8', 'f8396c771210049f6aa04f2b231b80a051839ad4', '1', '1437964112');
INSERT INTO `blue_picture` VALUES ('37', '/Uploads/Picture/2015-07-27/55b59dbdc5d57.jpg', '', '2944fb6f283a051d9a4c85653781aae4', 'd9d24d9a4a5a1fab520b213231ce5949d5847afc', '1', '1437965757');
INSERT INTO `blue_picture` VALUES ('38', '/Uploads/Picture/2015-07-27/55b59e1190f66.jpg', '', 'cb54ca1394371fa79759fcd58a50e645', 'd089a4b7c355909001ef0d3e78e231cc8505cf0a', '1', '1437965841');
INSERT INTO `blue_picture` VALUES ('39', '/Uploads/Picture/2015-07-27/55b5c9e7c003f.jpg', '', '20621707ef043bbacdeb0f2f2a202ebb', 'a3034c910b617c6c474d97b67e503cf313aaae76', '1', '1437977063');
INSERT INTO `blue_picture` VALUES ('40', '/Uploads/Picture/2015-07-27/55b5ca4e525c9.jpg', '', 'd26701f00cd9819fbc0c9a7cb6cc413d', '5367e939d35199e1169e62846d5bac29678f35d5', '1', '1437977166');
INSERT INTO `blue_picture` VALUES ('41', '/Uploads/Picture/2015-07-27/55b5cbd74fe2a.jpg', '', 'f704cfa331668443c58cdadf542586e3', 'e54a2fe609faaf6d657385c8516bda1543b4a9ef', '1', '1437977559');
INSERT INTO `blue_picture` VALUES ('42', '/Uploads/Picture/2015-07-27/55b5cd153ebda.jpg', '', '96a9e073261cd6f33fca396157b49376', '77b9cd599bd338299839d9d286fd1117169d4d47', '1', '1437977876');
INSERT INTO `blue_picture` VALUES ('43', '/Uploads/Picture/2015-07-28/55b6e1dc72da9.jpg', '', '2306b382ecf5f7bd4feaf9e8dd5b46b8', 'a4f3008a465029be91d7384ed02b22c1e3a3fa83', '1', '1438048732');
INSERT INTO `blue_picture` VALUES ('44', '/Uploads/Picture/2015-07-28/55b73baf49360.jpg', '', 'fa5a8721158458f52ea45b500f4cbc46', '43fdd6f058a9844752b779c8fcef87e08777827a', '1', '1438071727');
INSERT INTO `blue_picture` VALUES ('45', '/Uploads/Picture/2015-07-28/55b73bb9e1217.jpg', '', '9df66f64b5a21baa3441a7603fbfb0bc', 'a7b81c9ed4dc02d59ee92f5b4ae86841d9582377', '1', '1438071737');
INSERT INTO `blue_picture` VALUES ('46', '/Uploads/Picture/2015-07-28/55b73bc99d609.jpg', '', '40d09b7265c33b5381d59809b8da8b6d', '7ee5f1f1c389cc3b1b738d38c16467fc90cc1ca8', '1', '1438071753');
INSERT INTO `blue_picture` VALUES ('47', '/Uploads/Picture/2015-07-29/55b8268c69f41.jpg', '', '871e8be2e193842886214efcd4e4cd79', 'cca4e40e6122894ba8b917f461062ddbb003d15b', '1', '1438131852');
INSERT INTO `blue_picture` VALUES ('48', '/Uploads/Picture/2015-07-29/55b82ee71b719.jpg', '', '98af5016e5a86e304ace688fef1eebe9', 'e09989a3c87e02af4d108af16b371e194c7aa137', '1', '1438133990');
INSERT INTO `blue_picture` VALUES ('49', '/Uploads/Picture/2015-07-29/55b83067c6f26.jpg', '', '30abff0d65df6b700d932145a28de4f8', '04aa478d1cd3873255070ba7c5d1c64317a01707', '1', '1438134375');
INSERT INTO `blue_picture` VALUES ('50', '/Uploads/Picture/2015-07-29/55b830e345584.jpg', '', '4f0f74616b917b1a05872d89ec18401b', '74faffb734c8d9bca3f198407b10bbb53106c0c7', '1', '1438134499');
INSERT INTO `blue_picture` VALUES ('51', '/Uploads/Picture/2015-07-29/55b831544fd06.jpg', '', '494d6bcf40a6580a1c37f5689f623882', 'cbeb9266f82d0dc0b1a8078158844c5ba1c11da8', '1', '1438134612');
INSERT INTO `blue_picture` VALUES ('52', '/Uploads/Picture/2015-07-29/55b8319623165.jpg', '', '9db6cf572dafe175cc9412a4740263f1', '86611e32b12e84bd2473465451aa41d66f242bdf', '1', '1438134677');
INSERT INTO `blue_picture` VALUES ('53', '/Uploads/Picture/2015-07-29/55b831e1d206f.jpg', '', '9f5ba71a5e7f556982c4665ec4a7f582', '3612eac6059f0b6751dc02024befee8ed825df66', '1', '1438134753');
INSERT INTO `blue_picture` VALUES ('54', '/Uploads/Picture/2015-07-29/55b83214a8fca.jpg', '', '517451a59c16b609e8d09b6f7f86016b', '7cb8f4b9321845fd5d69ee03a8460a59c0e262a1', '1', '1438134804');
INSERT INTO `blue_picture` VALUES ('55', '/Uploads/Picture/2015-07-29/55b832fa1895f.png', '', 'b1d1c8bc7acc5dadb30f20f140d5fb33', 'daf19bc3b73b3564acf74d5429d1c22883c9de25', '1', '1438135032');
INSERT INTO `blue_picture` VALUES ('56', '/Uploads/Picture/2015-07-29/55b8a2a696064.jpg', '', '122525f044283d924ae3289ac9b8e7cc', 'afaf9fef258a283c3c05fb6a517f6245c2cb0fde', '1', '1438163622');
INSERT INTO `blue_picture` VALUES ('57', '/Uploads/Picture/2015-07-29/55b8a33245bc3.jpg', '', 'f587d4835a10cb53981d388360ecd7e6', '84d9eb84762acae0aca352596dcd80953c8dabcb', '1', '1438163762');
INSERT INTO `blue_picture` VALUES ('58', '/Uploads/Picture/2015-07-29/55b8a39d99e9c.jpg', '', 'b93cded1c104c08bb1f17aca70af323f', '1d8d83478f25045e500e72ec38bf3e8770aac37d', '1', '1438163869');
INSERT INTO `blue_picture` VALUES ('59', '/Uploads/Picture/2015-07-29/55b8a3f0bc595.jpg', '', 'd45637e17906602eadfa436c96844537', '97462ee62b1c4a5aa6ee343128ce7e701432c9e9', '1', '1438163952');
INSERT INTO `blue_picture` VALUES ('60', '/Uploads/Picture/2015-07-30/55b974c7c076f.jpg', '', '7ee667937bd449ac98b88373280c0e18', '07475b61699abcf2f22ba61b35e8398105f03c1f', '1', '1438217415');
INSERT INTO `blue_picture` VALUES ('61', '/Uploads/Picture/2015-07-30/55b9753fb662c.jpg', '', 'a2349fe4dddb9875bdaf43b00d5ee617', '3c9f607c7ed4801d0dd2aa5bbb7119a42960a94c', '1', '1438217535');
INSERT INTO `blue_picture` VALUES ('62', '/Uploads/Picture/2015-07-30/55b9760846c73.jpg', '', 'f3aa1a4123da9078d82fd9e75ed72466', '4a64810288a43c4864b6ac3f0992f5eb8524f57c', '1', '1438217736');
INSERT INTO `blue_picture` VALUES ('63', '/Uploads/Picture/2015-07-30/55b976e4b1ccc.jpg', '', '79b4e2fded23da63d175b578c6e28bb4', '0035c205031156e618746f146161e4d6e3ab2b26', '1', '1438217956');
INSERT INTO `blue_picture` VALUES ('64', '/Uploads/Picture/2015-07-30/55b977946bdbf.jpg', '', '83a3ea21966e2ac9e94331986294b2cc', '30422c702c1a052de93d769662d27bc3e703602d', '1', '1438218132');
INSERT INTO `blue_picture` VALUES ('65', '/Uploads/Picture/2015-07-30/55b979123de71.jpg', '', '4264c8b67b82a51342bb7210447bcda1', 'd8310fe0e2be4c0956565bb122f20ee907145b5a', '1', '1438218514');
INSERT INTO `blue_picture` VALUES ('66', '/Uploads/Picture/2015-07-30/55b97a2adfba2.jpg', '', 'b63921a99ed322129558faab209e7a2f', '1c4139811e3040e03b1c4ec11dea8cc3f8100f66', '1', '1438218794');
INSERT INTO `blue_picture` VALUES ('67', '/Uploads/Picture/2015-07-30/55b97b0a5927c.jpg', '', '1deb61f38634560a2a17de731031df27', 'cae5ed73b814c715ec4123144d9bae147d3613e6', '1', '1438219018');
INSERT INTO `blue_picture` VALUES ('68', '/Uploads/Picture/2015-07-30/55b97bcf67297.jpg', '', 'b467ca0f3f231f96b2d8ec2f151a10d5', 'fe4a52766a947e0980977c7f6d61a4743ef9a751', '1', '1438219215');
INSERT INTO `blue_picture` VALUES ('69', '/Uploads/Picture/2015-07-30/55b97c1f662c5.jpg', '', 'e14f7e0e549b0083623bb1e3e94aac6f', 'b891308783e3580fb633b58327c3f06984e55097', '1', '1438219295');
INSERT INTO `blue_picture` VALUES ('70', '/Uploads/Picture/2015-07-30/55b97c737de54.jpg', '', 'a3cc568dc5de64c92cc392faaa86318e', 'fa5b11efe302fca60dfe2b0928a62d82e35211b5', '1', '1438219379');
INSERT INTO `blue_picture` VALUES ('71', '/Uploads/Picture/2015-07-30/55b97cf9f0e34.jpg', '', '3f6a53875cf3851330832b2f171ff96b', 'd685c07d7c77848f10c215f8e88e3c481f85abe5', '1', '1438219513');
INSERT INTO `blue_picture` VALUES ('72', '/Uploads/Picture/2015-07-30/55b97d1cb3070.jpg', '', '070054ccf3c4d91789af38ff5674a34a', 'f5f9bf8f465d82a63428a67d1ae61d4e8879d566', '1', '1438219548');
INSERT INTO `blue_picture` VALUES ('73', '/Uploads/Picture/2015-07-30/55b97d7fc8c88.jpg', '', 'e191e9eecbaca4973d7bb38a8473a324', 'fc1a0c4fd7b844ed65bad026e5f53332f4ae1591', '1', '1438219647');
INSERT INTO `blue_picture` VALUES ('74', '/Uploads/Picture/2015-07-30/55b97ddf32bf8.jpg', '', 'ee4cf26e53885044c44860b928142511', '12f4a9d9393c8fa381c290e686a67b5ce3a83e9b', '1', '1438219743');
INSERT INTO `blue_picture` VALUES ('75', '/Uploads/Picture/2015-07-30/55b97f408a743.jpg', '', '3771c789e0304ec0e8a4119abc26c29b', 'ae7bdb7ffe694e557019d96e93d70757dfb4e7a5', '1', '1438220096');
INSERT INTO `blue_picture` VALUES ('76', '/Uploads/Picture/2015-07-30/55b98006572ba.jpg', '', '5b2ba54019dadca1d0ea94809a519f04', 'b5bb3b45bae49f06e9361e905c4dfae1efcd4bff', '1', '1438220294');
INSERT INTO `blue_picture` VALUES ('77', '/Uploads/Picture/2015-07-30/55b9805f2fe52.jpg', '', '7d39dc676d53ba776e768ed51cb06c2c', 'b85fdf9d071a72f9b6f24309c4040b33f277dd12', '1', '1438220383');
INSERT INTO `blue_picture` VALUES ('78', '/Uploads/Picture/2015-07-30/55b9809a47bd0.jpg', '', '8fce4fdeaa43dfe6a918a4aa0c6aa019', '8f40d77d3658748aa6e0c82502127369da5b5fc1', '1', '1438220442');
INSERT INTO `blue_picture` VALUES ('79', '/Uploads/Picture/2015-07-30/55b980ecf2909.jpg', '', '23bcd20c49ef6b243fb706af433d3f6f', 'e994df2643e5289a4ff7666ad517557cd3d71d5b', '1', '1438220524');
INSERT INTO `blue_picture` VALUES ('80', '/Uploads/Picture/2015-07-30/55b98160a320c.jpg', '', '7197f18f0f79f5a88dbc71b51da69327', 'cc16527461bf9ed0f53a9b08cbdddd40a2b1d5ea', '1', '1438220640');
INSERT INTO `blue_picture` VALUES ('81', '/Uploads/Picture/2015-07-30/55b98197b28c0.jpg', '', '42e2ea9ba6eaab1c616fc60806e81cb5', '67c49e2ca2554cba4e5f02ab610ff94ccb2a89cc', '1', '1438220695');
INSERT INTO `blue_picture` VALUES ('82', '/Uploads/Picture/2015-07-30/55b981e301201.jpg', '', '5aea10395ec2ad43ec8d26b7f4af4e76', '46500fc3c1723c6a9dc27c5c6395d23f1b206b4e', '1', '1438220770');
INSERT INTO `blue_picture` VALUES ('83', '/Uploads/Picture/2015-07-30/55b982580c50b.jpg', '', '79062f3cd742e3a6a835e62c527f75c4', '2c2396f931c2441f7c5ba5819874d87057cde0ae', '1', '1438220887');
INSERT INTO `blue_picture` VALUES ('84', '/Uploads/Picture/2015-07-30/55b9828836c02.jpg', '', 'd353b8435bb14e5323c42f9112cfe22d', '09e1cb55e737f5fe3f889a2c037f4e7bb7c28d17', '1', '1438220936');
INSERT INTO `blue_picture` VALUES ('85', '/Uploads/Picture/2015-07-30/55b982a0bf226.jpg', '', 'c7e8ea0c38d36a9bc5bfa3bd94e2d06d', '801a4cc9984e0c894ad72663cda435e3420bacae', '1', '1438220960');
INSERT INTO `blue_picture` VALUES ('86', '/Uploads/Picture/2015-07-30/55b982c1682cb.jpg', '', 'bc77d66deb7dfc9dc56930aeb2959e77', 'c1087b7d02a5bfd823096be96ec5a35a579cb837', '1', '1438220993');
INSERT INTO `blue_picture` VALUES ('87', '/Uploads/Picture/2015-07-30/55b986dfe0d4e.jpg', '', 'a781a1a3b57e405c34382e474d54a193', 'ccd89a8f01a32e55bfb0e183ef66c18d9dcae55d', '1', '1438222047');
INSERT INTO `blue_picture` VALUES ('88', '/Uploads/Picture/2015-07-30/55b987c3455df.jpg', '', 'd4e02e0a3ef7c580f95e53488c0545c0', 'f79800ea0253dd959e26e36be0f3bc5bef924698', '1', '1438222275');
INSERT INTO `blue_picture` VALUES ('89', '/Uploads/Picture/2015-07-30/55b9880725e57.jpg', '', '4119152c83aa5a3a9a8b852a024977c8', 'ee6200c49d0ff6912ddc3736540bc3b7f152b43f', '1', '1438222342');

-- -----------------------------
-- Table structure for `blue_team`
-- -----------------------------
DROP TABLE IF EXISTS `blue_team`;
CREATE TABLE `blue_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info` varchar(255) NOT NULL COMMENT '个人简介',
  `head_img` text NOT NULL COMMENT '头像',
  `content` text NOT NULL COMMENT '个人简历',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='精英团队';

-- -----------------------------
-- Records of `blue_team`
-- -----------------------------
INSERT INTO `blue_team` VALUES ('1', 'Cathy /袁莹 CEO', '7', '<p>\r\n	<strong><span style=\"font-size:18px;\">袁莹 【广州蓝火总裁】</span></strong> \r\n</p>\r\n<p>\r\n	<strong><img src=\"/blueflame/Uploads/Editor/2015-07-21/55adf91793117.jpg\" alt=\"\" /><br />\r\n</strong> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:14px;\">北京大学国际经济系毕业，获剑桥大学“国际项目管理”优秀级证书。</span><br />\r\n<span style=\"font-size:14px;\">中国十大策划人；</span><br />\r\n<span style=\"font-size:14px;\">2006\\2008\\2011年中国经济女性突出成就奖获得者；</span><br />\r\n<span style=\"font-size:14px;\">2010年广州亚运会专家委员会委员；</span><br />\r\n<span style=\"font-size:14px;\">广东今日集团的命名者，亦是该集团的永久名誉顾问；</span><br />\r\n<span style=\"font-size:14px;\">以其对市场、策划、创意、媒介的高超认识，担当起蓝火品牌组的领军人物。</span><br />\r\n<span style=\"font-size:14px;\">成功的策划包括：奥康集团，华帝集团奥运攻略。《同一首歌》策划；</span><br />\r\n<span style=\"font-size:14px;\">中国奥委会合办《放歌奥运》策划与执行；</span><br />\r\n<span style=\"font-size:14px;\">中国南方航空、欧派、创维、比亚迪、华晨汽车等诸多大品牌的整合推广。</span><span style=\"font-size:12px;\"></span> \r\n</p>', '2015-07-21 15:47:54');
INSERT INTO `blue_team` VALUES ('2', 'Bear Chan/陈雄 S-Director', '8', '<span style=\"font-size:18px;\"><strong>陈雄Bear Chan【品牌战略规划专家】&nbsp;</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Brand Strategy Director</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-21/55adf9b91de69.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">品牌战略规划专家</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">1997年，毕业于厦门大学新闻传播系广告学专业</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">曾任奥美广告（国际4A）企划经理、蓝色火焰广告（广州4A）品牌总监、</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">旭日因赛传播（广州4A）策略总监；</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">2004年创办厦门边界广告、2008年创办广州腾动品牌顾问，</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">帮助恒安集团成功创建七度空间品牌，</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">帮助黑眼睛休闲布包从区域品牌成长为全国性品牌。</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">主要服务的品牌有：福田雷沃重工、创维、康佳、科龙、美的、欧普、</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">百得、快译通、默克、联邦制药、白兰氏、陈李济、盘龙云海灵丹草颗粒、</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">合生创展、南国奥园、怡宝、黑妹、康妮雅、安尔乐七度空间、中华轿车、</span><br />\r\n<span style=\"color:#2F2F2F;font-family:Tahoma, Helvetica, Arial, sans-serif;font-size:12px;\">南方航空、大自然木地板、泰山企业、黑眼睛休闲包等</span><span style=\"font-size:12px;\"></span></span>\r\n</p>', '2015-07-21 15:50:34');
INSERT INTO `blue_team` VALUES ('3', 'Guo Yadong/郭亚东ECD', '9', '<p>\r\n	<strong><span style=\"font-size:18px;\">郭亚东Guo yadong【执行创意总监】</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:18px;\">&nbsp;Executive Creative Director</span></strong>\r\n</p>\r\n<p>\r\n	<strong><span style=\"font-size:18px;\"><img src=\"/blueflame/Uploads/Editor/2015-07-21/55adfa2d65a2d.jpg\" alt=\"\" /><br />\r\n</span></strong>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\">毕业于武汉大学中文系</span><br />\r\n<span style=\"font-size:12px;\">96年进入广告界，中国十大创意总监</span><br />\r\n<span style=\"font-size:12px;\">历任多家国际及本土4A广告公司的执行创意总监，</span><br />\r\n<span style=\"font-size:12px;\">打通策略及创意，具有丰富的本土经验与国际视野的资深广告创意人。</span><br />\r\n<span style=\"font-size:12px;\">屡获国内国际广告大奖，大擅品牌广告运动的创意与执行。</span><br />\r\n<span style=\"font-size:12px;\">成功的策划包括：奥康08年奥运会及刘翔代言全面整合推广、</span><br />\r\n<span style=\"font-size:12px;\">芙蓉王品牌、创维品牌、华晨汽车、三九药业、华帝等。</span><span style=\"font-size:12px;\"></span></span>\r\n</p>', '2015-07-21 15:52:34');
INSERT INTO `blue_team` VALUES ('4', 'Boom /彭致邦GCD', '10', '<p>\r\n	<span style=\"font-size:18px;\"><strong>彭致邦【创意群总监】</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>&nbsp;Boom,Group Creative Director</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-21/55adfab00ce43.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:12px;\">清华大学德国汉堡传播学院艺术总监专业文凭；</span><br />\r\n<span style=\"font-size:12px;\">资深广告人，1995年进入广告界，</span><br />\r\n<span style=\"font-size:12px;\">先后服务于麦肯光明、DDB恒美多家国际及本土4A广告公司，</span><br />\r\n<span style=\"font-size:12px;\">历任电通东派、喜马拉雅等著名广告公司创意群总监。</span><br />\r\n<span style=\"font-size:12px;\">对各类广告的创作炉火纯青，</span><br />\r\n<span style=\"font-size:12px;\">有了他的支持，美好策划会变成最有冲击力的广告。</span><br />\r\n<span style=\"font-size:12px;\">成功作品包括：鲁花、德国大众、惠普、思科、微软、</span><br />\r\n<span style=\"font-size:12px;\">通用汽车、诺华制药等国际品牌</span><span style=\"font-size:12px;\"></span></span>\r\n</p>', '2015-07-21 15:56:22');
INSERT INTO `blue_team` VALUES ('5', 'Joe/周志泉 Media director', '28', '<p>\r\n	<span style=\"font-size:18px;\"><strong>周志泉 【媒介总监】</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-27/55b5927f9c2b8.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">中山大学市场营销专业毕业，</span><br />\r\n<span style=\"font-size:14px;\">10年4A广告专业经验，</span><br />\r\n<span style=\"font-size:14px;\">曾供职麦肯光明等国际4A广告公司、健力宝集团市场部经理；</span><br />\r\n<span style=\"font-size:14px;\">长期负责各大型客户的媒介工作。</span><br />\r\n<span style=\"font-size:14px;\">服务过的客户有：健力宝、摩托罗拉、高露洁、黑人牙膏、</span><br />\r\n<span style=\"font-size:14px;\">科龙、平安保险、奥康、华帝、金龙鱼、徐福记等。</span></span>\r\n</p>', '2015-07-27 10:08:18');
INSERT INTO `blue_team` VALUES ('6', 'Susan/陈素素 SAD', '29', '<span style=\"font-size:18px;\"><strong>陈素素【客户总监】</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Susan, Senior Account Director</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-27/55b592c70ef97.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">香港籍客户总监，擅长于客户打交道。</span><br />\r\n<span style=\"font-size:14px;\">工商行政管理专业大学毕业，做过空姐、演员、广告模特，</span><br />\r\n<span style=\"font-size:14px;\">从台前走到幕后、从娱乐策划走进快销品市场，有超人的领悟力和敏锐的时尚触觉。</span><br />\r\n<span style=\"font-size:14px;\">曾任职香港东峻集团推广部经理、力美健全国连锁健身机构市场总监、狼道营销机构客户总监</span><br />\r\n<span style=\"font-size:14px;\">具有丰富的市场执行经验及行政管理经验，尤其擅长运动类时尚类产品。</span><br />\r\n<span style=\"font-size:14px;\">服务过的客户有奥康鞋业、威尔萨斯皮具、万利达手机、同洲电子、福格森保健食品、</span><br />\r\n<span style=\"font-size:14px;\">双恒集团、百润集团、精准腕表、安冬电器、大自然地板、日丰集团等。</span><br />\r\n<span style=\"font-size:14px;\">信奉100%工作投入精神，富勇于承担的勇气。</span><br />\r\n<span style=\"font-size:14px;\"></span></span>\r\n</p>', '2015-07-27 10:09:26');
INSERT INTO `blue_team` VALUES ('7', 'Sam/钟钢 Cheif Operating Officer', '30', '<span style=\"font-size:18px;\"><strong>钟钢【终端行销顾问/华夏复星金融投资有限公司运营总监】</strong></span><br />\r\n<span style=\"font-size:18px;\"><strong>&nbsp;</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Sam, Store marketing consultant/Cheif Operating Officer</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-27/55b5930722c9d.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">工商管理专业毕业。</span><br />\r\n<span style=\"font-size:14px;\">长期徘徊于4A广告公司及企业市场部之间，</span><br />\r\n<span style=\"font-size:14px;\">曾任职暇步士、嘉顿等多间外资公司的市场部经理，</span><br />\r\n<span style=\"font-size:14px;\">具备服务国际品牌和本土品牌的品牌策划和终端管理经验。</span><br />\r\n<span style=\"font-size:14px;\">曾服务品牌：</span><br />\r\n<span style=\"font-size:14px;\">Hush puppies，Wolrine，SONY，Casio，Garden，</span><br />\r\n<span style=\"font-size:14px;\">Fitti，MERCK，奥康，康龙，Vitop</span><br />\r\n<span style=\"font-size:14px;\"></span></span>\r\n</p>', '2015-07-27 10:10:30');
INSERT INTO `blue_team` VALUES ('8', 'Sugar/唐琛Strategy director', '31', '<span style=\"font-size:18px;\"><strong>唐琛【策略副总监】</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Sugar,Strategy Asociate Director</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-27/55b5933964c98.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">厦门大学广告学专业毕业</span><br />\r\n<span style=\"font-size:14px;\">9年专业广告工作经验，负责蓝火核心客户策略制订和策略撰写，</span><br />\r\n<span style=\"font-size:14px;\">曾服务过的客户包括华帝、创维电视、TSD手机、山水黔城、</span><br />\r\n<span style=\"font-size:14px;\">锦绣香江、家谱酒、奥康皮鞋、奥康皮具、美丽佳人、芙蓉王等。</span></span>\r\n</p>', '2015-07-27 10:11:23');
INSERT INTO `blue_team` VALUES ('9', 'Lili/农丽丽Producer', '49', '<p>\r\n	<span style=\"font-size:18px;\"><strong>农丽丽【制片统筹】Lili, Producer</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b830870f85a.jpg\" alt=\"\" /><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:24px;\"><span style=\"font-size:14px;\">毕业于服装设计专业，任蓝火制作统筹多年</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">1998年入行广告至今，有着丰富的广告从业经验</span><br />\r\n<span style=\"font-size:14px;\">尤其在平面制作、及影视广告制作方面的制片及统筹能力卓越</span><br />\r\n<span style=\"font-size:14px;\">每次的广告执行上有自己的理解和把控力</span><br />\r\n<span style=\"font-size:14px;\">使画面和造型上有张力</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">总结多年的广告执行经验，深切的认识到：</span><br />\r\n<span style=\"font-size:14px;\">漂亮的画面才能抓住人的眼球，同时才能达到广告目的！</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">平面执行案例：</span><br />\r\n<span style=\"font-size:14px;\">贵州山水黔城、杜邦建材、安华卫浴等</span><br />\r\n<span style=\"font-size:14px;\">影视执行案例：</span><br />\r\n<span style=\"font-size:14px;\">奥康皮鞋、万利达音乐手机、欧洲卫浴、创维云电视等</span></span> \r\n</p>', '2015-07-29 09:47:11');
INSERT INTO `blue_team` VALUES ('10', 'Elilin/林艺澜Artist Director', '53', '<span style=\"font-size:18px;\"><strong>林艺澜 【北京艺人部总监】</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Elilin,Artist Director(Beijing)</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b830fbbfd02.jpg\" alt=\"\" /><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">教育背景：</span><br />\r\n<span style=\"font-size:14px;\">江苏连云港大学商务韩国语系；韩国木浦大学语言研修</span><br />\r\n<span style=\"font-size:14px;\">曾任北京扩纳文化传播有限公司艺人经纪，</span><br />\r\n<span style=\"font-size:14px;\">负责韩国艺人在中国大陆地区的演艺活动。</span><br />\r\n<span style=\"font-size:14px;\">担当艺人有：米娜 MINA，简美妍，TAKE,BATTLE,李承铉，</span><br />\r\n<span style=\"font-size:14px;\">主要负责带领艺人完成公司所指派的工作任务，</span><br />\r\n<span style=\"font-size:14px;\">例如CCTV中华情演唱会，湖南卫视《舞动奇迹》（李承铉）</span><br />\r\n<span style=\"font-size:14px;\">2009年开始北京华音·鼎天音乐文化有限公司艺人总监</span><br />\r\n<span style=\"font-size:14px;\">韩国艺人李承铉专职经纪，负责其所有经纪事务，韩国艺人中国活动个案代理。</span><br />\r\n<span style=\"font-size:14px;\">华音·鼎天新人唱片宣传总监。其他韩国艺人工作包括：</span><br />\r\n<span style=\"font-size:14px;\">2010年 张根硕亚洲巡演</span><br />\r\n<span style=\"font-size:14px;\">2011年 李多海 现代电视广告代言</span><br />\r\n<span style=\"font-size:14px;\">2011年 蔡妍 东方卫视《舞林大会》</span><br />\r\n<span style=\"font-size:14px;\">2011年 元彬《大叔》内地首映及宣传</span><br />\r\n<span style=\"font-size:14px;\">2011年 韩国UBOYS组合中国投资参与</span><br />\r\n<span style=\"font-size:14px;\">2011年 韩国BEAST,4MINUTES,A-PINK组合代理。</span><br />\r\n<span style=\"font-size:14px;\">2011年 韩国知名音乐制作人 J-TRAX中国代理</span><br />\r\n<span style=\"font-size:14px;\">内地新人汪妤凌《MISS CAT》专辑首发宣传总监</span><br />\r\n<span style=\"font-size:14px;\">独立，创新，具有开拓精神。做事有目标，有方向，责任感极强。熟悉中韩两国文化市场。</span></span> \r\n</p>', '2015-07-29 09:49:04');
INSERT INTO `blue_team` VALUES ('11', 'Larry/白磊Artist Director', '52', '<span style=\"font-size:18px;\"><strong>白磊 【北京艺人部副总监】</strong></span><br />\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong>Larry,Artist Director(Beijing)</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b831aa46faa.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><br />\r\n<span style=\"font-size:14px;\">2005年加入韩国最大娱乐公司S.M.Entertainment，</span><br />\r\n<span style=\"font-size:14px;\">负责SuperJunior、BOA、东方神起、安七炫、少女时代等的在华经纪；</span><br />\r\n<span style=\"font-size:14px;\">离开SM之后也一直从事韩国娱乐的相关工作，</span><br />\r\n<span style=\"font-size:14px;\">负责过活动有：韩国歌手MAYA参加奥运唱响演唱会；</span><br />\r\n<span style=\"font-size:14px;\">神话组合成员JUNJIN，ANDY的武汉歌友会；</span><br />\r\n<span style=\"font-size:14px;\">HOT成员李在元上海歌迷见面会；</span><br />\r\n<span style=\"font-size:14px;\">Rain内地演唱会的前期筹备合作沟通工作；</span><br />\r\n<span style=\"font-size:14px;\">李贞贤代言现代手机广告；李多海代言现代电视机广告；</span><br />\r\n<span style=\"font-size:14px;\">金敏智代言内地丝袜广告；</span><br />\r\n<span style=\"font-size:14px;\">SuperJunior代言森马品牌服饰广告等。</span></span>\r\n</p>', '2015-07-29 09:52:05');
INSERT INTO `blue_team` VALUES ('12', 'Simon 周永强 Account director', '54', '<p>\r\n	<span style=\"font-size:18px;\"><strong>Simon Zhou / 周永强 【客户总监】</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><strong><img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8322a89e97.jpg\" alt=\"\" /><br />\r\n</strong></span>\r\n</p>\r\n<p>\r\n	<span style=\"font-size:18px;\"><span style=\"font-size:14px;\">工作经验:</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">曾任职于可口可乐、康胜啤酒等国际企业市场部</span><br />\r\n<span style=\"font-size:14px;\">11年国际广告公司经验，包括：灵智精实、意识形态等，负责管理客户关系工作。</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">服务客户经验:</span><br />\r\n<span style=\"font-size:14px;\">南京世界贸易中心、泉州世界贸易中心、</span><br />\r\n<span style=\"font-size:14px;\">华发新城、万科地产品牌、广州丽江花园、南京中央商场、新光房地产、广晟国际、中凯集团等</span><br />\r\n<span style=\"font-size:14px;\">&nbsp;</span><br />\r\n<span style=\"font-size:14px;\">中国银联、农业银行、柯达、福特汽车、艾美特电器、佰草集、PIZZA Family、F&amp;N Dairy Goods等</span></span>\r\n</p>', '2015-07-29 09:54:03');
INSERT INTO `blue_team` VALUES ('13', '团队风采', '55', '<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b833c92fd3d.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	2004年蓝火主办&lt;美国品牌第一顾问“金手指“麦奎尔访华演讲&gt;\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b833f7eba55.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b834e591eef.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b834f4a7944.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b83500a22ab.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	首届创业家总裁班（前排左4为蓝火袁总）\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8350e8cd14.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	首届创业家总裁班\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b83524bc3c6.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	蓝火袁总主持日本山水音响(舒淇代言)新闻发布会\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8353be6e23.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	日本山水音响新闻发布会现场——右二袁总，右三舒淇\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8354cdd837.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	世界冠军张珊与关清子华小朋友合影\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8355d8a2d6.JPG\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	袁总与著名主持人鲁豫合影\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b8357162080.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n2003年奥康全球形象发布会蓝火执行团队\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b83580bf944.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	2010年威尔萨斯皮具【相约佛罗伦萨】新品发布暨酒会，蓝火执行团队\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b835ba98492.JPG\" alt=\"\" />\r\n</p>\r\n<p>\r\n	蓝火为湖南卫视著名主持\\娱乐第一天团【快乐家族】拍摄广告的花絮照\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b835cc285a0.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	蓝火为韩星李承铉、李妍智拍摄广告的花絮照\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b835e0f189a.jpg\" alt=\"\" />\r\n</p>\r\n<p>\r\n	蓝火客户部的美眉们\r\n</p>\r\n<p>\r\n	<img src=\"/blueflame/Uploads/Editor/2015-07-29/55b835f268093.jpg\" alt=\"\" />\r\n</p>', '2015-07-29 09:57:15');

-- -----------------------------
-- Table structure for `blue_ucenter_admin`
-- -----------------------------
DROP TABLE IF EXISTS `blue_ucenter_admin`;
CREATE TABLE `blue_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';


-- -----------------------------
-- Table structure for `blue_ucenter_app`
-- -----------------------------
DROP TABLE IF EXISTS `blue_ucenter_app`;
CREATE TABLE `blue_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';


-- -----------------------------
-- Table structure for `blue_ucenter_member`
-- -----------------------------
DROP TABLE IF EXISTS `blue_ucenter_member`;
CREATE TABLE `blue_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -----------------------------
-- Records of `blue_ucenter_member`
-- -----------------------------
INSERT INTO `blue_ucenter_member` VALUES ('1', 'admin', '5e9d0c4c2a044a27d6131ca68b904bc4', '736884783@qq.com', '', '1436753279', '1900334795', '1438234643', '244539082', '1436753279', '1');

-- -----------------------------
-- Table structure for `blue_ucenter_setting`
-- -----------------------------
DROP TABLE IF EXISTS `blue_ucenter_setting`;
CREATE TABLE `blue_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';


-- -----------------------------
-- Table structure for `blue_url`
-- -----------------------------
DROP TABLE IF EXISTS `blue_url`;
CREATE TABLE `blue_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';


-- -----------------------------
-- Table structure for `blue_userdata`
-- -----------------------------
DROP TABLE IF EXISTS `blue_userdata`;
CREATE TABLE `blue_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `customer`
-- -----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `sex` varchar(255) NOT NULL COMMENT '性别',
  `province` varchar(255) NOT NULL COMMENT '省份',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `headimgurl` varchar(255) NOT NULL COMMENT '头像URL',
  `age` varchar(255) NOT NULL COMMENT '年龄',
  `stage` varchar(255) NOT NULL COMMENT '所处的阶段',
  `attention` varchar(255) NOT NULL COMMENT '关注的皮肤问题',
  `feeling` varchar(255) NOT NULL COMMENT '皮肤的类型',
  `allergy` varchar(255) NOT NULL COMMENT '皮肤过敏情况',
  `nursing` varchar(255) NOT NULL COMMENT '护理情况',
  `createtime` varchar(255) NOT NULL COMMENT '测试时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='顾客信息表';

-- -----------------------------
-- Records of `customer`
-- -----------------------------
INSERT INTO `customer` VALUES ('1', 'oqDv8t3GTGFDKrkX9fFcVHSr4il4', 'John', '男', '广东', '广州', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6pGFwVnJBNzeec5EtHAXhP4ryUcvMgU9LgpIf0W79de7gTgzEu5FUQYKhOibSPPdHprHNKrUcvBpeAo4ZZicJw4vmsFa2LgOtDw/0', '49岁以上', '自由职业,现代辣妈', '干燥、毛孔', '油性', '无过敏', '日护理、周护理', '2015/06/06 10:15:41');
INSERT INTO `customer` VALUES ('2', 'oqDv8tyumet7UqoCERJ58EV_VOUw', 'john', '男', '广东', '广州', 'http://wx.qlogo.cn/mmopen/Vfyet5JWzY1bAM0sQJaHlPJNa1xzuUTjLnibV4yWs3q1JYWeLXg9ed7Or01az2JI4URtvapZzhEt9nCia9uQEpic4uFnob5w124/0', '29-39岁', '职场女性,准妈妈', '紧致/提拉、眼部', '油性', '有过敏', '日护理', '2015/06/08 09:34:41');

-- -----------------------------
-- Table structure for `number`
-- -----------------------------
DROP TABLE IF EXISTS `number`;
CREATE TABLE `number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `number`
-- -----------------------------
INSERT INTO `number` VALUES ('1', '18470');

-- -----------------------------
-- Table structure for `onethink_action`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_action`;
CREATE TABLE `onethink_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- -----------------------------
-- Records of `onethink_action`
-- -----------------------------
INSERT INTO `onethink_action` VALUES ('1', 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了后台', '1', '1', '1387181220');
INSERT INTO `onethink_action` VALUES ('2', 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', '2', '0', '1380173180');
INSERT INTO `onethink_action` VALUES ('3', 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', '2', '1', '1383285646');
INSERT INTO `onethink_action` VALUES ('4', 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', '2', '0', '1386139726');
INSERT INTO `onethink_action` VALUES ('5', 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', '2', '0', '1383285551');
INSERT INTO `onethink_action` VALUES ('6', 'update_config', '更新配置', '新增或修改或删除配置', '', '', '1', '1', '1383294988');
INSERT INTO `onethink_action` VALUES ('7', 'update_model', '更新模型', '新增或修改模型', '', '', '1', '1', '1383295057');
INSERT INTO `onethink_action` VALUES ('8', 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', '1', '1', '1383295963');
INSERT INTO `onethink_action` VALUES ('9', 'update_channel', '更新导航', '新增或修改或删除导航', '', '', '1', '1', '1383296301');
INSERT INTO `onethink_action` VALUES ('10', 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', '1', '1', '1383296392');
INSERT INTO `onethink_action` VALUES ('11', 'update_category', '更新分类', '新增或修改或删除分类', '', '', '1', '1', '1383296765');

-- -----------------------------
-- Table structure for `onethink_action_log`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_action_log`;
CREATE TABLE `onethink_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

-- -----------------------------
-- Records of `onethink_action_log`
-- -----------------------------
INSERT INTO `onethink_action_log` VALUES ('1', '1', '1', '244537157', 'member', '1', 'admin在2015-06-10 10:41登录了后台', '1', '1433904102');
INSERT INTO `onethink_action_log` VALUES ('2', '8', '1', '244537157', 'attribute', '33', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907376');
INSERT INTO `onethink_action_log` VALUES ('3', '8', '1', '244537157', 'attribute', '34', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907376');
INSERT INTO `onethink_action_log` VALUES ('4', '7', '1', '244537157', 'model', '4', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907452');
INSERT INTO `onethink_action_log` VALUES ('5', '8', '1', '244537157', 'attribute', '34', '操作url：/glow1/index.php?s=/admin/attribute/update.html', '1', '1433907535');
INSERT INTO `onethink_action_log` VALUES ('6', '8', '1', '244537157', 'attribute', '35', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('7', '8', '1', '244537157', 'attribute', '36', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('8', '8', '1', '244537157', 'attribute', '37', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('9', '8', '1', '244537157', 'attribute', '38', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('10', '8', '1', '244537157', 'attribute', '39', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('11', '8', '1', '244537157', 'attribute', '40', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('12', '8', '1', '244537157', 'attribute', '41', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907574');
INSERT INTO `onethink_action_log` VALUES ('13', '7', '1', '244537157', 'model', '5', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907637');
INSERT INTO `onethink_action_log` VALUES ('14', '8', '1', '244537157', 'attribute', '42', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907664');
INSERT INTO `onethink_action_log` VALUES ('15', '8', '1', '244537157', 'attribute', '43', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907664');
INSERT INTO `onethink_action_log` VALUES ('16', '7', '1', '244537157', 'model', '6', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907685');
INSERT INTO `onethink_action_log` VALUES ('17', '8', '1', '244537157', 'attribute', '44', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907707');
INSERT INTO `onethink_action_log` VALUES ('18', '8', '1', '244537157', 'attribute', '45', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907707');
INSERT INTO `onethink_action_log` VALUES ('19', '8', '1', '244537157', 'attribute', '46', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907707');
INSERT INTO `onethink_action_log` VALUES ('20', '7', '1', '244537157', 'model', '7', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907740');
INSERT INTO `onethink_action_log` VALUES ('21', '7', '1', '244537157', 'model', '5', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907872');
INSERT INTO `onethink_action_log` VALUES ('22', '8', '1', '244537157', 'attribute', '47', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('23', '8', '1', '244537157', 'attribute', '48', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('24', '8', '1', '244537157', 'attribute', '49', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('25', '8', '1', '244537157', 'attribute', '50', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('26', '8', '1', '244537157', 'attribute', '51', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('27', '8', '1', '244537157', 'attribute', '52', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('28', '8', '1', '244537157', 'attribute', '53', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('29', '8', '1', '244537157', 'attribute', '54', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('30', '8', '1', '244537157', 'attribute', '55', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907887');
INSERT INTO `onethink_action_log` VALUES ('31', '7', '1', '244537157', 'model', '8', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907915');
INSERT INTO `onethink_action_log` VALUES ('32', '8', '1', '244537157', 'attribute', '55', '操作url：/glow1/index.php?s=/admin/attribute/update.html', '1', '1433907951');
INSERT INTO `onethink_action_log` VALUES ('33', '8', '1', '244537157', 'attribute', '56', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907977');
INSERT INTO `onethink_action_log` VALUES ('34', '8', '1', '244537157', 'attribute', '57', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907977');
INSERT INTO `onethink_action_log` VALUES ('35', '8', '1', '244537157', 'attribute', '58', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907977');
INSERT INTO `onethink_action_log` VALUES ('36', '8', '1', '244537157', 'attribute', '59', '操作url：/glow1/index.php?s=/admin/model/generate.html', '1', '1433907977');
INSERT INTO `onethink_action_log` VALUES ('37', '7', '1', '244537157', 'model', '9', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433907991');
INSERT INTO `onethink_action_log` VALUES ('38', '7', '1', '244537157', 'model', '8', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433908007');
INSERT INTO `onethink_action_log` VALUES ('39', '7', '1', '244537157', 'model', '5', '操作url：/glow1/index.php?s=/admin/model/update.html', '1', '1433915993');
INSERT INTO `onethink_action_log` VALUES ('40', '1', '1', '244537157', 'member', '1', 'admin在2015-06-10 14:21登录了后台', '1', '1433917270');
INSERT INTO `onethink_action_log` VALUES ('41', '8', '1', '244537157', 'attribute', '52', '操作url：/glow1/index.php?s=/admin/attribute/update.html', '1', '1433917478');
INSERT INTO `onethink_action_log` VALUES ('42', '1', '1', '244536954', 'member', '1', 'admin在2015-07-08 15:15登录了后台', '1', '1436339723');
INSERT INTO `onethink_action_log` VALUES ('43', '1', '1', '244536954', 'member', '1', 'admin在2015-07-08 16:01登录了后台', '1', '1436342469');
INSERT INTO `onethink_action_log` VALUES ('44', '7', '1', '244536954', 'model', '7', '操作url：/index.php?s=/admin/model/update.html', '1', '1436344490');
INSERT INTO `onethink_action_log` VALUES ('45', '7', '1', '244536954', 'model', '7', '操作url：/index.php?s=/admin/model/update.html', '1', '1436344544');
INSERT INTO `onethink_action_log` VALUES ('46', '7', '1', '244536954', 'model', '10', '操作url：/index.php?s=/admin/model/update.html', '1', '1436344846');
INSERT INTO `onethink_action_log` VALUES ('47', '8', '1', '244536954', 'attribute', '60', '操作url：/index.php?s=/admin/model/generate.html', '1', '1436344974');
INSERT INTO `onethink_action_log` VALUES ('48', '8', '1', '244536954', 'attribute', '61', '操作url：/index.php?s=/admin/model/generate.html', '1', '1436344974');
INSERT INTO `onethink_action_log` VALUES ('49', '8', '1', '244536954', 'attribute', '62', '操作url：/index.php?s=/admin/model/generate.html', '1', '1436344974');
INSERT INTO `onethink_action_log` VALUES ('50', '8', '1', '244536954', 'attribute', '63', '操作url：/index.php?s=/admin/model/generate.html', '1', '1436344974');
INSERT INTO `onethink_action_log` VALUES ('51', '7', '1', '244536954', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345126');
INSERT INTO `onethink_action_log` VALUES ('52', '7', '1', '244536954', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345239');
INSERT INTO `onethink_action_log` VALUES ('53', '7', '1', '244536954', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345285');
INSERT INTO `onethink_action_log` VALUES ('54', '7', '1', '244536954', 'model', '11', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345371');
INSERT INTO `onethink_action_log` VALUES ('55', '7', '1', '244536954', 'model', '12', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345451');
INSERT INTO `onethink_action_log` VALUES ('56', '8', '1', '244536954', 'attribute', '64', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436345520');
INSERT INTO `onethink_action_log` VALUES ('57', '8', '1', '244536954', 'attribute', '65', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436345554');
INSERT INTO `onethink_action_log` VALUES ('58', '8', '1', '244536954', 'attribute', '66', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436345580');
INSERT INTO `onethink_action_log` VALUES ('59', '8', '1', '244536954', 'attribute', '67', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436345602');
INSERT INTO `onethink_action_log` VALUES ('60', '7', '1', '244536954', 'model', '12', '操作url：/index.php?s=/admin/model/update.html', '1', '1436345660');
INSERT INTO `onethink_action_log` VALUES ('61', '1', '1', '244536954', 'member', '1', 'admin在2015-07-09 13:51登录了后台', '1', '1436421079');
INSERT INTO `onethink_action_log` VALUES ('62', '1', '1', '244539038', 'member', '1', 'admin在2015-07-10 16:56登录了后台', '1', '1436518596');
INSERT INTO `onethink_action_log` VALUES ('63', '1', '1', '1900334795', 'member', '1', 'admin在2015-07-13 14:47登录了后台', '1', '1436770072');
INSERT INTO `onethink_action_log` VALUES ('64', '7', '1', '244538119', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1436770152');
INSERT INTO `onethink_action_log` VALUES ('65', '8', '1', '244538119', 'attribute', '68', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770194');
INSERT INTO `onethink_action_log` VALUES ('66', '8', '1', '244539190', 'attribute', '69', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770250');
INSERT INTO `onethink_action_log` VALUES ('67', '8', '1', '244539190', 'attribute', '70', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770274');
INSERT INTO `onethink_action_log` VALUES ('68', '8', '1', '244539190', 'attribute', '71', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770307');
INSERT INTO `onethink_action_log` VALUES ('69', '8', '1', '244539190', 'attribute', '72', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770350');
INSERT INTO `onethink_action_log` VALUES ('70', '7', '1', '244539190', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1436770436');
INSERT INTO `onethink_action_log` VALUES ('71', '8', '1', '244539190', 'attribute', '72', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770759');
INSERT INTO `onethink_action_log` VALUES ('72', '8', '1', '244539190', 'attribute', '72', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436770997');
INSERT INTO `onethink_action_log` VALUES ('73', '8', '1', '244539190', 'attribute', '69', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436772287');
INSERT INTO `onethink_action_log` VALUES ('74', '1', '1', '244539190', 'member', '1', 'admin在2015-07-14 09:08登录了后台', '1', '1436836124');
INSERT INTO `onethink_action_log` VALUES ('75', '1', '1', '244539190', 'member', '1', 'admin在2015-07-14 11:11登录了后台', '1', '1436843504');
INSERT INTO `onethink_action_log` VALUES ('76', '1', '1', '244539190', 'member', '1', 'admin在2015-07-15 10:14登录了后台', '1', '1436926458');
INSERT INTO `onethink_action_log` VALUES ('77', '8', '1', '244539190', 'attribute', '71', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1436926574');
INSERT INTO `onethink_action_log` VALUES ('78', '1', '1', '2130706433', 'member', '1', 'admin在2015-07-16 11:38登录了后台', '1', '1437017911');
INSERT INTO `onethink_action_log` VALUES ('79', '1', '1', '244536377', 'member', '1', 'admin在2015-07-16 11:39登录了后台', '1', '1437017953');
INSERT INTO `onethink_action_log` VALUES ('80', '8', '1', '244536377', 'attribute', '70', '操作url：/index.php?s=/admin/attribute/remove/id/70.html', '1', '1437027878');
INSERT INTO `onethink_action_log` VALUES ('81', '1', '1', '244536377', 'member', '1', 'admin在2015-07-16 16:34登录了后台', '1', '1437035689');
INSERT INTO `onethink_action_log` VALUES ('82', '8', '1', '244536377', 'attribute', '73', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437035820');
INSERT INTO `onethink_action_log` VALUES ('83', '8', '1', '244536377', 'attribute', '74', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437035921');
INSERT INTO `onethink_action_log` VALUES ('84', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437036077');
INSERT INTO `onethink_action_log` VALUES ('85', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437036642');
INSERT INTO `onethink_action_log` VALUES ('86', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437037552');
INSERT INTO `onethink_action_log` VALUES ('87', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437037666');
INSERT INTO `onethink_action_log` VALUES ('88', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437040010');
INSERT INTO `onethink_action_log` VALUES ('89', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437040296');
INSERT INTO `onethink_action_log` VALUES ('90', '1', '1', '244536377', 'member', '1', 'admin在2015-07-17 09:27登录了后台', '1', '1437096421');
INSERT INTO `onethink_action_log` VALUES ('91', '7', '1', '244536377', 'model', '13', '操作url：/index.php?s=/admin/model/update.html', '1', '1437101044');
INSERT INTO `onethink_action_log` VALUES ('92', '8', '1', '244539180', 'attribute', '75', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437117002');
INSERT INTO `onethink_action_log` VALUES ('93', '8', '1', '244539180', 'attribute', '76', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437117030');
INSERT INTO `onethink_action_log` VALUES ('94', '1', '1', '244539180', 'member', '1', 'admin在2015-07-17 16:02登录了后台', '1', '1437120120');
INSERT INTO `onethink_action_log` VALUES ('95', '1', '1', '244539020', 'member', '1', 'admin在2015-07-20 15:22登录了后台', '1', '1437376979');
INSERT INTO `onethink_action_log` VALUES ('96', '8', '1', '244539020', 'attribute', '77', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437380784');
INSERT INTO `onethink_action_log` VALUES ('97', '8', '1', '244539020', 'attribute', '78', '操作url：/index.php?s=/admin/attribute/update.html', '1', '1437380804');
INSERT INTO `onethink_action_log` VALUES ('98', '1', '1', '244539020', 'member', '1', 'admin在2015-07-21 09:02登录了后台', '1', '1437440523');

-- -----------------------------
-- Table structure for `onethink_addons`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_addons`;
CREATE TABLE `onethink_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

-- -----------------------------
-- Records of `onethink_addons`
-- -----------------------------
INSERT INTO `onethink_addons` VALUES ('15', 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1383126253', '0');
INSERT INTO `onethink_addons` VALUES ('2', 'SiteStat', '站点统计信息', '统计站点的基础信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}', 'thinkphp', '0.1', '1379512015', '0');
INSERT INTO `onethink_addons` VALUES ('3', 'DevTeam', '开发团队信息', '开发团队成员信息', '1', '{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512022', '0');
INSERT INTO `onethink_addons` VALUES ('4', 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', '1', '{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"2\",\"display\":\"1\"}', 'thinkphp', '0.1', '1379512036', '0');
INSERT INTO `onethink_addons` VALUES ('5', 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', '1', '{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}', 'thinkphp', '0.1', '1379830910', '0');
INSERT INTO `onethink_addons` VALUES ('6', 'Attachment', '附件', '用于文档模型上传附件', '1', 'null', 'thinkphp', '0.1', '1379842319', '1');
INSERT INTO `onethink_addons` VALUES ('9', 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', '1', '{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}', 'thinkphp', '0.1', '1380273962', '0');

-- -----------------------------
-- Table structure for `onethink_article`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_article`;
CREATE TABLE `onethink_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `img_url` varchar(255) NOT NULL COMMENT '图片链接',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `article` text NOT NULL COMMENT '文章',
  `keywords` text NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `onethink_article`
-- -----------------------------
INSERT INTO `onethink_article` VALUES ('1', '爱发光面膜系列产品强势进驻美国市场和东南亚市场！', '4', '2015-04-28 10:18:01', '<p>\r\n	2015年4月27日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜正式进驻美国市场及东南亚市场。\r\n</p>\r\n<p>\r\n	自从2015年4月20日，爱发光面膜系列产品全面上线，便获得海内外各个国家地区的广大消费者的好评，一度出现旗舰门店供货不足， 供不应求的场面。\r\n</p>\r\n<p>\r\n	顺应着这样的爱发光抢购热潮，4月24日上午9时，爱发光系列面膜产品发言人对外宣称爱发光系列面膜强势进驻美国 华盛顿和洛杉矶等多个城市，此外，爱发光系列面膜还成功开拓了东南亚地区的市场\r\n</p>', '爱发光面膜,面膜市场', '2015年4月27日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜正式进驻美国市场及东南亚市场。');
INSERT INTO `onethink_article` VALUES ('2', '爱发光面膜系列产品新闻发布会成功召开！', '5', '2015-04-21 12:01:21', '<p>\r\n	<span>2015年4月20日，爱膜力（中国）生物科技有限公司成功召开关于爱发光品牌系列面膜的新闻发布会。</span>\r\n</p>\r\n<p>\r\n	4月27号当天，爱膜力（中国）生物科技有限公司高层，总裁沈海航先生、执行董事袁莹女士等领导均有出席发布会现场。\r\n</p>\r\n<p>\r\n	在该发布会上，沈总裁对于爱发光系列面膜取得的巨大成功，并且成功在短短时间就打开了广阔的海外市场，这一现象作出了合理恰当的分析。此外，沈总裁给出了关于爱发光品质的保证，也对广大的支持者表达了感谢之情。\r\n</p>\r\n<p>\r\n	多家媒体以及参与发布会的商家都对爱发光面膜系列产品表示了肯定和美好的展望，更有多个商家当场与爱膜力（中国）生物科技有限公司签下了爱发光系列产品的订单。\r\n</p>', '新闻发布会,面膜', '2015年4月20日，爱膜力（中国）生物科技有限公司成功召开关于爱发光品牌系列面膜的新闻发布会。');
INSERT INTO `onethink_article` VALUES ('3', '爱发光面膜系列产品全面上线！', '6', '2015-04-25 10:56:10', '<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-16/55a76af592bdf.png\" width=\"500\" height=\"336\" align=\"left\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	2015年4月24日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜全面上线。\r\n</p>\r\n<p>\r\n	爱发光系列面膜采用美国BIO-TECH国家实验室配方，汇聚多名顶级皮肤科研专家科研成果和精力，凭借着其研发的精致细腻而又高性价比的产品在短短时间便享誉全球。\r\n</p>\r\n<p>\r\n	爱发光品牌系列面膜旨在让年轻的一代\"想秀就秀，想发光就发光，秀出最美的自己，Glow Now！\"其理念一经传达，便受到广大8090后女性的热烈追捧。\r\n</p>', '爱发光品牌系列面膜全面上线', '2015年4月24日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜全面上线。');
INSERT INTO `onethink_article` VALUES ('11', '中大岭南学院校友会高尔夫季度赛举行  爱膜逆成校友热捧品牌', '10', '2015-05-27 10:32:47', '<p>\r\n	5月26日上午，中山大学岭南学院校友会高尔夫俱乐部于南湖高尔夫球会及云来斯堡酒店举行会员杯季度赛暨年度庆典晚宴，近70位来自各界的会员精英参加了此次季度赛及晚宴。爱膜逆品牌面膜作为唯一指定赞助商，为此次大型活动提供全程支持及服务。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc35565f1b.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc3722867e.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc372f1440.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p>\r\n	中午12点15分，比赛正式开始。参赛的选手们不仅是商场好手，也是赛场猛将。个个动作之标准、技巧之精熟，丝毫不比专业级选手逊色，其中更不乏推杆高手，随着比赛进程激烈，球场上的气氛也越来越活跃，队友们本着“友谊第一，比赛第二”的原则，在一片欢声笑语中结束了白天的季度赛。\r\n</p>\r\n<p>\r\n	晚宴于云来斯堡酒店鸿云厅举行，数十位领导嘉宾及俱乐部成员欢聚一堂。会员们对此次季度赛的主办方中大岭南学院校友会高尔夫俱乐部以及赞助方爱膜逆品牌面膜表示感谢，让他们有机会聚在一起，交流各自心得，联络感情。晚会中，爱膜逆特地为每位与会者发送了爱膜逆活性蛋白（Keratin）修护精华蚕丝面膜系列礼盒。会员们对这份代表着爱与美的礼品表现出了浓厚的兴趣。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc3d72d60c.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p>\r\n	“这个牌子我知道，我太太是它的忠实粉丝。”会员雷先生兴奋地说，他和太太均在一家金融机构担任要职，“我太太说这个面膜效果特别好，每天晚上都要敷。今天居然能在这里看到它，刚好回去送给太太当礼物。”雷先生表示，自己不懂护肤品，但是爱膜逆的这款面膜包装精美，而且它所传达的理念：用爱成就美丽，也是自己和太太都十分认同的。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc3ed8ce18.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p>\r\n	更有许多女性会员如此漂亮的面膜包装都惊叹不已，表示晚上回去就敷一片试试效果，如果好用就考虑长期购买。李小姐则说，自己以前就用过这个牌子的面膜，这次在校友会上又看到它熟悉的身影，并且比以前做得更好，很有点“他乡遇故知”的惊喜。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc41338fed.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc413dd67d.jpg\" alt=\"中大岭南学院校友会高尔夫季度赛\" /><span style=\"line-height:1.5;\"></span> \r\n</p>', '中大岭南学院校友会高尔夫季度赛', '5月26日上午，中山大学岭南学院校友会高尔夫俱乐部于南湖高尔夫球会及云来斯堡酒店举行会员杯季度赛暨年度庆典晚宴，近70位来自各界的会员精英参加了此次季度赛及晚宴。爱膜逆品牌面膜作为唯一指定赞助商，为此次大型活动提供全程支持及服务。');
INSERT INTO `onethink_article` VALUES ('15', '「爱膜力」助力2015首届领军广交汇 共商企业未来 ', '11', '2015-06-07 11:00:23', '<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; 2015年6月6日，中山大学领军班将在佛山中企绿色总部举办“首届领军广交汇”活动，本着“弘扬领军互助精神，搭建资源共享平台”的宗旨，此次广交汇吸引了不少各行各业的精英，他们将共聚一堂，畅言企业未来。「爱膜力」作为此次活动指定的护肤品赞助商，将向广大来宾展示最新的美容、健康、生活新潮流，带领大伙一起感受关于爱的奇迹。\r\n</p>\r\n<p style=\"text-indent:28px;\">\r\n	作为首届“领军广交汇”指定的护肤品赞助商，「爱膜力」一直致力打造有效、健康、安全的日常护肤产品，一直以来，以高品质产品和服务赢得了市场和消费者的信任。在品牌建设上，「爱膜力」旨在向大家传递一种爱美丽、爱健康、爱生活的理念，引领大众追求和拥有美丽健康的容颜，将对美的爱、健康的爱、生活的爱及各种大爱通过「爱膜力」传递和影响更多的人。\r\n</p>\r\n<p style=\"text-indent:28px;\">\r\n	首届领军广交汇作为一个汇聚各路精英的平台，必将为中国民营企业的发展起到领航的作用，「爱膜力」为能够参与如此富有影响力的商业盛事而深感荣幸。其实，「爱膜力」所倡导的理念也与各路领军一致，我们一直致力于做行业的领军，用一流的技术和一流的原料，为消费者提供一流的服务和产品。我们将和各路领军一起前进，为亚洲女性打造更美丽的未来。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc5f67b2b1.jpg\" alt=\"爱膜逆\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc5f6bffcf.jpg\" alt=\"爱膜逆\" /> \r\n</p>\r\n<p style=\"text-indent:28px;\">\r\n	当问到“领军广交汇”名字的缘由时，中山大学岭南学院领军班同学联谊会的负责人告诉我们：“作为目前中国规模最大、层次最高的国际贸易盛会，广交会承担起连接中国与世界的桥梁作用，而国家工信部在全国各地名校举办的领军人才班，也是汇聚了各地的企业精英，在领军的平台上共享互助，共同进步。中大作为岭南的最高学府，有责任肩负起弘扬领军精神的重担。我们将学习广交会搭建平台的特点，拟定于6月6日举办首届‘领军广交汇’活动，搭建领军人才交流平台，共享领军资源，拓展人才视野，为促进中国民营企业的发展作出一份努力”<br />\r\n　　在此次活动中，组委会特别邀请了香港凤凰卫视评论员石齐平发表题为《一带一路：中国新世纪发展大战略》的演讲，中国中小企业股份转让系统有限公司副总经理陈永民也将与各位探讨关于《新三板改革方向、思路及政策下一步走向》的内容。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc67f201ef.jpg\" alt=\"石齐平\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<div style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc68083cd7.jpg\" alt=\"陈永民\" /> \r\n</div>\r\n', '2015首届领军广交汇,爱膜力', '2015年6月6日，中山大学领军班将在佛山中企绿色总部举办“首届领军广交汇”活动，本着“弘扬领军互助精神，搭建资源共享平台”的宗旨，此次广交汇吸引了不少各行各业的精英，他们将共聚一堂，畅言企业未来。「爱膜力」作为此次活动指定的护肤品赞助商，将向广大来宾展示最新的美容、健康、生活新潮流，带领大伙一起感受关于爱的奇迹。');
INSERT INTO `onethink_article` VALUES ('12', '心怀感恩，「爱膜力」受邀广东狮子会粤合服务队慈善晚宴 ', '12', '2015-06-04 10:17:01', '<p>\r\n	6月3日，广东狮子会粤合服务队在广州珍宝明珠园林食府1楼宴会厅举办“越来粤合•让爱飞扬” 换届庆典暨慈善感恩晚宴。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc9853c840.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc98681a3e.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	作为一个热心公益，倡导关爱的企业，「爱膜力」也受邀参加此次活动，不仅积极参与到各项环节，更赞助了精美的礼盒装面膜。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc9c339c96.jpg\" alt=\"\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acc9c41c64f.jpg\" alt=\"\" /> \r\n</p>\r\n<p>\r\n	晚会上，广东狮子会粤合服务队成功换届，并且通过拍卖、募捐等形式募集善款高达41万元，该款项将用于建设相关慈善事业。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca0380ca8.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴签到处\" /> \r\n</p>\r\n<p>\r\n	作为此次活动的赞助商，「爱膜力」赞助的礼盒装面膜吸引了不少来宾的围观，很多「爱膜力」的“膜粉们”纷纷和我们分享使用心得，表达她们对「爱膜力」面膜产品的喜爱。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca2e99433.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca2f90147.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca30f0c7f.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca31d56cc.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴\" /> \r\n</p>\r\n<p>\r\n	在此我们衷心感谢各位支持者的陪伴和关爱，我们也承诺在未来的道路将一如既往地专注于美丽事业，让爱传播。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acca5aecdab.jpg\" alt=\"广东狮子会粤合服务队慈善晚宴\" /> \r\n</p>', '广东狮子会粤合服务队慈善晚宴 ,爱膜力', '6月3日，广东狮子会粤合服务队在广州珍宝明珠园林食府1楼宴会厅举办“越来粤合•让爱飞扬” 换届庆典暨慈善感恩晚宴。作为一个热心公益，倡导关爱的企业，「爱膜力」也受邀参加此次活动，不仅积极参与到各项环节，更赞助了精美的礼盒装面膜。');
INSERT INTO `onethink_article` VALUES ('14', '「爱膜力」特邀礼仪导师 助你形象提升百万价值', '13', '2015-06-06 10:27:49', '<p>\r\n	6月5日上午，「爱膜力」特邀爱膜力天使投资人兼联合创始人、广州合地实业投资股份有限公司、全国连锁堂会KTV总裁张奎为「爱膜力」的员工进行礼仪形象指导。一上台，张总得体的衣着和形象，优雅的举止和谈吐，立马吸引了员工们的注意力。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55accc2bbbf77.jpg\" alt=\"张奎\" /> \r\n</p>\r\n<p>\r\n	出席此次活动的，还有「爱膜力」的六位创始人，他们分别是华夏复星金融投资股份有限公司执行董事沈海航，广州好迪集团有限公司副总裁刘佩华，广州蓝色火焰文化传播有限公司董事长袁莹，广东合地实业投资股份有限公司、全国连锁堂会KTV总裁张奎，广州市奥迪诗音响科技有限公司董事长赵志伟，广东维迅实业公司董事长梁彤。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55accc487a856.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p>\r\n	在这次培训中，张总从仪容仪表、仪态礼仪两方面对如何提升形象做了全面的介绍，深入浅出的讲解赢来员工们的阵阵掌声。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55accc5ec7260.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p>\r\n	此外，张总也和「爱膜力」的员工们分享了他的创业经历，他用自身的经历，告诉员工们形象的价值。张总告诉我们，他人对公司的第一印象，产生于员工的仪表，如果每个员工都注意自己的形象，对于公司的业务发展会起到促进的作用，会给公司创造无限的价值。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55accc7f6f52d.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55accc8fd7223.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p>\r\n	而对于每一个人也是如此，你的形象就是你自己的代言人，如果我们能注重自己的容貌、衣着和举止，对自己的事业和感情而言都是一笔巨大的财富。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccb7b5efa.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p>\r\n	培训结束后，广州蓝色火焰文化传播有限公司董事长袁莹为张总颁发了“最具魅力形象时尚先生”奖状，感谢张总在白忙之中抽出时间为员工们进行礼仪形象指导。不少员工也表示在这次培训中受益匪浅，纷纷和张总合照留念。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccd2edf9b.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccd3329e4.jpg\" alt=\"\"你的形象价值百万 /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccd35cb5c.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccd4640c6.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-20/55acccd55a893.jpg\" alt=\"你的形象价值百万\" /> \r\n</p>', '仪容仪表,仪态礼仪,你的形象价值百万', '6月5日上午，「爱膜力」特邀爱膜力天使投资人兼联合创始人、广州合地实业投资股份有限公司、全国连锁堂会KTV总裁张奎为「爱膜力」的员工进行礼仪形象指导。一上台，张总得体的衣着和形象，优雅的举止和谈吐，立马吸引了员工们的注意力。');
INSERT INTO `onethink_article` VALUES ('16', '「爱膜逆」赞助“敏睿高杯”高尔夫球会 收获大批粉丝 ', '14', '2015-06-27 11:27:05', '<p>\r\n	6月26日，“敏睿高杯”遂商高尔夫球队缤纷夏季球赛在云东海高尔夫球会场举行，吸引了众多高尔夫爱好者前来参加。「爱膜逆」作为此次活动的赞助商，为与会嘉宾提供了精美的面膜礼盒套装，深得各界人士的喜爱。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f0c69805.jpg\" alt=\"签到处\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f0cae07d.jpg\" alt=\"爱膜逆\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f0d8b440.jpg\" alt=\"颁奖\" /> \r\n</p>\r\n<p>\r\n	不少来宾对这份代表着爱与美的产品表现出了浓厚的兴趣。“我第一次看到这么有格调的面膜，一开始我还以为是一套书呢，打开来看居然是面膜，十分惊喜。”“以前看到央视新闻美女主播李梓萌有推荐过这款面膜，没想到居然能在这里看到它。”\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f345cbde.jpg\" alt=\"爱膜逆产品\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f34aa75f.jpg\" alt=\"爱膜逆宣传板\" /> \r\n</p>\r\n<p>\r\n	而在某知名企业任职的王小姐看到会场内的「爱膜力」面膜更是激动万分，原来，她是「爱膜力」的忠实粉丝。而说起她和「爱膜力」的缘份，王小姐羞涩地告诉我们：“第一次知道这款面膜，是今年情人节的时候，我老公送了一套「爱膜逆」的礼盒装面膜给我。第一眼看到这么精美的包装就觉得非常喜欢，使用后效果也非常好，我老公都说我变年轻了，所以一直都有在用。今晚在这里看到它，感觉非常亲切。希望「爱膜力」能越做越好，让更多的人变得更美更自信。”\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f5853579.jpg\" alt=\"美女\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f587acfe.jpg\" alt=\"现场\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ad9f595d2a7.jpg\" alt=\"合照\" /> \r\n</p>', '爱膜逆,高尔夫球活动,敏睿高杯', '6月26日，“敏睿高杯”遂商高尔夫球队缤纷夏季球赛在云东海高尔夫球会场举行，吸引了众多高尔夫爱好者前来参加。「爱膜逆」作为此次活动的赞助商，为与会嘉宾提供了精美的面膜礼盒套装，深得各界人士的喜爱。​');
INSERT INTO `onethink_article` VALUES ('17', '「爱膜逆」2015年世界少年棒球联赛：挥洒汗水，发光青春', '15', '2015-07-04 09:40:03', '<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada1f110c2e.jpg\" alt=\"现场\" /> \r\n</p>\r\n<p>\r\n	棒球界的年度赛事——2015国际中少棒球联盟亚太区冠军赛7月3日早上在广州华夏职业学院正式拉开序幕，宣告为期一周的冠军争夺赛正式进入激烈的比拼中。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada1fa48183.jpg\" alt=\"爱膜逆\" /> \r\n</p>\r\n<p>\r\n	作为此次棒球联盟赛的赞助商，「爱膜力」的工作人员6点从广州出发赶往从化，布置现场，只为给参赛人员营造视觉上的享受。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada20207140.jpg\" alt=\"爱膜逆美女\" /> \r\n</p>\r\n<p>\r\n	看！「爱膜力」的美女同事细致地将「爱膜逆」和「爱发光」系列面膜陈列于展位前，等候队员们及其亲属的到来。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada290d97c0.jpg\" alt=\"进场\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada20c16600.jpg\" alt=\"队列\" /> \r\n</p>\r\n<p>\r\n	开幕仪式上，来自中国、香港、韩国、日本、巴基斯坦、菲律宾6个代表队的120名队员聚精会神，等待比赛开始。\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada2157995c.jpg\" alt=\"合照\" /> \r\n</p>\r\n<p>\r\n	终于要正式进入比赛了，参赛队员们在赛场下互相交流，噢~好多小鲜肉，帅气阳光\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada22cdd5c7.jpg\" alt=\"各国合照\" /> \r\n</p>\r\n<p>\r\n	来自菲律宾的选手们整装待发，精神饱满，上场前和啦啦队的美女们来一张合照~\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada2702a86f.jpg\" alt=\"观众\" /> \r\n</p>\r\n<p>\r\n	赛场外，陪伴参赛的家长们和前来观赛的同学们纷纷驻足，似乎被骚年们的青春光芒给震撼到~\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<img src=\"/Uploads/Editor/2015-07-21/55ada27b31c11.jpg\" alt=\"爱膜逆宣传标题\" /> \r\n</p>\r\n<p>\r\n	此次比赛将会持续到7月11日，「爱膜力」在此先预祝赛事圆满结束，各位参赛者加油，你们都是棒棒哒~在赛场上挥洒汗水，让青春发光发亮。\r\n</p>', '爱膜逆活动,2015年世界少年棒球联赛,棒球联赛', '2015国际中少棒球联盟亚太区冠军赛7月3日早上在广州华夏职业学院正式拉开序幕，宣告为期一周的冠军争夺赛正式进入激烈的比拼中。作为此次棒球联盟赛的赞助商，「爱膜力」的工作人员6点从广州出发赶往从化，布置现场，只为给参赛人员营造视觉上的享受。​');

-- -----------------------------
-- Table structure for `onethink_attachment`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_attachment`;
CREATE TABLE `onethink_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';


-- -----------------------------
-- Table structure for `onethink_attribute`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_attribute`;
CREATE TABLE `onethink_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

-- -----------------------------
-- Records of `onethink_attribute`
-- -----------------------------
INSERT INTO `onethink_attribute` VALUES ('74', 'description', '描述', 'text NOT NULL', 'textarea', '', '', '1', '', '4', '0', '1', '1437035921', '1437035921', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('72', 'article', '文章', 'text NOT NULL', 'editor', '', '', '1', '', '13', '0', '1', '1436770997', '1436770350', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('73', 'keywords', '关键词', 'text NOT NULL', 'textarea', '', '', '1', '', '4', '0', '1', '1437035820', '1437035820', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('71', 'time', '时间', 'int(10) NOT NULL', 'datetime', '', '', '0', '', '13', '0', '1', '1436926574', '1436770307', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('69', 'img_url', '图片链接', 'varchar(255) NOT NULL', 'picture', '', '', '1', '', '13', '0', '1', '1436772287', '1436770250', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('68', 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '13', '0', '1', '1436770194', '1436770194', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('67', 'alt', '图片描述', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '0', '1', '1436345602', '1436345602', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('59', 'sort', '排序', 'int(10) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1433907977', '1433907977', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('65', 'img_url', '图片链接', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '0', '1', '1436345554', '1436345554', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('57', 'url', '链接', 'text NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1433907977', '1433907977', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('58', 'pid', '上级id', 'int(10) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1433907977', '1433907977', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('56', 'title', '标题', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '9', '0', '1', '1433907977', '1433907977', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('54', 'price', '价格', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('55', 'content', '详情', 'text NOT NULL ', 'editor', '', '', '1', '', '8', '0', '1', '1433907951', '1433907887', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('53', 'quarity', '净含量', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('52', 'logo', '图片', 'varchar(50) NOT NULL ', 'picture', '', '', '1', '', '8', '0', '1', '1433917478', '1433907887', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('51', 'intro_ch', '中文简介', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('50', 'intro_en', '英文简介', 'text NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('49', 'name_ch', '中文名称', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('48', 'name_en', '英文名称', 'varchar(50) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('47', 'title', '标题', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '8', '0', '1', '1433907887', '1433907887', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('66', 'url', '链接', 'text NOT NULL', 'textarea', '', '', '1', '', '12', '0', '1', '1436345580', '1436345580', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('33', 'name', '名称', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '4', '0', '1', '1433907376', '1433907376', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('34', 'content', '内容', 'text NOT NULL ', 'editor', '', '', '1', '', '4', '0', '1', '1433907535', '1433907376', '', '0', '', 'regex', '', '0', 'function');
INSERT INTO `onethink_attribute` VALUES ('35', 'name', '名字', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('36', 'xingsi', '姓氏', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('37', 'email', '电邮', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('38', 'address', '地址', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('39', 'city', '城市', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('40', 'number', '邮政编码', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('41', 'country', '国家', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '5', '0', '1', '1433907575', '1433907575', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('42', 'title', '底部标题', 'varchar(255) NOT NULL ', 'string', '', '', '1', '', '6', '0', '1', '1433907664', '1433907664', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('43', 'url', '链接', 'text NOT NULL ', 'string', '', '', '1', '', '6', '0', '1', '1433907664', '1433907664', '', '0', '', '', '', '0', '');
INSERT INTO `onethink_attribute` VALUES ('64', 'img_name', '图片名', 'varchar(255) NOT NULL', 'string', '', '', '1', '', '12', '0', '1', '1436345520', '1436345520', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('75', 'keywords', '关键词', 'text NOT NULL', 'textarea', '', '', '1', '', '13', '0', '1', '1437117002', '1437117002', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('76', 'description', '描述', 'text NOT NULL', 'textarea', '', '', '1', '', '13', '0', '1', '1437117030', '1437117030', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('77', 'keywords', '关键词', 'text NOT NULL', 'textarea', '', '', '1', '', '8', '0', '1', '1437380784', '1437380784', '', '3', '', 'regex', '', '3', 'function');
INSERT INTO `onethink_attribute` VALUES ('78', 'description', '描述', 'text NOT NULL', 'textarea', '', '', '1', '', '8', '0', '1', '1437380804', '1437380804', '', '3', '', 'regex', '', '3', 'function');

-- -----------------------------
-- Table structure for `onethink_auth_extend`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_auth_extend`;
CREATE TABLE `onethink_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

-- -----------------------------
-- Records of `onethink_auth_extend`
-- -----------------------------
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '1', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '2', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '3', '2');
INSERT INTO `onethink_auth_extend` VALUES ('1', '4', '1');
INSERT INTO `onethink_auth_extend` VALUES ('1', '37', '1');

-- -----------------------------
-- Table structure for `onethink_auth_group`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_auth_group`;
CREATE TABLE `onethink_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_auth_group`
-- -----------------------------
INSERT INTO `onethink_auth_group` VALUES ('1', 'admin', '1', '默认用户组', '', '1', '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106');
INSERT INTO `onethink_auth_group` VALUES ('2', 'admin', '1', '测试用户', '测试用户', '1', '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- -----------------------------
-- Table structure for `onethink_auth_group_access`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_auth_group_access`;
CREATE TABLE `onethink_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- -----------------------------
-- Table structure for `onethink_auth_rule`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_auth_rule`;
CREATE TABLE `onethink_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_auth_rule`
-- -----------------------------
INSERT INTO `onethink_auth_rule` VALUES ('1', 'admin', '2', 'Admin/Index/index', '首页', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('2', 'admin', '2', 'Admin/Article/mydocument', '内容', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('3', 'admin', '2', 'Admin/User/index', '用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('4', 'admin', '2', 'Admin/Addons/index', '扩展', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('5', 'admin', '2', 'Admin/Config/group', '系统', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('7', 'admin', '1', 'Admin/article/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('8', 'admin', '1', 'Admin/article/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('9', 'admin', '1', 'Admin/article/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('10', 'admin', '1', 'Admin/article/update', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('11', 'admin', '1', 'Admin/article/autoSave', '保存草稿', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('12', 'admin', '1', 'Admin/article/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('13', 'admin', '1', 'Admin/article/copy', '复制', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('14', 'admin', '1', 'Admin/article/paste', '粘贴', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('15', 'admin', '1', 'Admin/article/permit', '还原', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('16', 'admin', '1', 'Admin/article/clear', '清空', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('17', 'admin', '1', 'Admin/article/index', '文档列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('18', 'admin', '1', 'Admin/article/recycle', '回收站', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('19', 'admin', '1', 'Admin/User/addaction', '新增用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('20', 'admin', '1', 'Admin/User/editaction', '编辑用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('21', 'admin', '1', 'Admin/User/saveAction', '保存用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('22', 'admin', '1', 'Admin/User/setStatus', '变更行为状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('23', 'admin', '1', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('24', 'admin', '1', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('25', 'admin', '1', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('26', 'admin', '1', 'Admin/User/index', '用户信息', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('27', 'admin', '1', 'Admin/User/action', '用户行为', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('28', 'admin', '1', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('29', 'admin', '1', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('30', 'admin', '1', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('31', 'admin', '1', 'Admin/AuthManager/createGroup', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('32', 'admin', '1', 'Admin/AuthManager/editGroup', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('33', 'admin', '1', 'Admin/AuthManager/writeGroup', '保存用户组', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('34', 'admin', '1', 'Admin/AuthManager/group', '授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('35', 'admin', '1', 'Admin/AuthManager/access', '访问授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('36', 'admin', '1', 'Admin/AuthManager/user', '成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('37', 'admin', '1', 'Admin/AuthManager/removeFromGroup', '解除授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('38', 'admin', '1', 'Admin/AuthManager/addToGroup', '保存成员授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('39', 'admin', '1', 'Admin/AuthManager/category', '分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('40', 'admin', '1', 'Admin/AuthManager/addToCategory', '保存分类授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('41', 'admin', '1', 'Admin/AuthManager/index', '权限管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('42', 'admin', '1', 'Admin/Addons/create', '创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('43', 'admin', '1', 'Admin/Addons/checkForm', '检测创建', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('44', 'admin', '1', 'Admin/Addons/preview', '预览', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('45', 'admin', '1', 'Admin/Addons/build', '快速生成插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('46', 'admin', '1', 'Admin/Addons/config', '设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('47', 'admin', '1', 'Admin/Addons/disable', '禁用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('48', 'admin', '1', 'Admin/Addons/enable', '启用', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('49', 'admin', '1', 'Admin/Addons/install', '安装', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('50', 'admin', '1', 'Admin/Addons/uninstall', '卸载', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('51', 'admin', '1', 'Admin/Addons/saveconfig', '更新配置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('52', 'admin', '1', 'Admin/Addons/adminList', '插件后台列表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('53', 'admin', '1', 'Admin/Addons/execute', 'URL方式访问插件', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('54', 'admin', '1', 'Admin/Addons/index', '插件管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('55', 'admin', '1', 'Admin/Addons/hooks', '钩子管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('56', 'admin', '1', 'Admin/model/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('57', 'admin', '1', 'Admin/model/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('58', 'admin', '1', 'Admin/model/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('59', 'admin', '1', 'Admin/model/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('60', 'admin', '1', 'Admin/Model/index', '模型管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('61', 'admin', '1', 'Admin/Config/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('62', 'admin', '1', 'Admin/Config/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('63', 'admin', '1', 'Admin/Config/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('64', 'admin', '1', 'Admin/Config/save', '保存', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('65', 'admin', '1', 'Admin/Config/group', '网站设置', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('66', 'admin', '1', 'Admin/Config/index', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('67', 'admin', '1', 'Admin/Channel/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('68', 'admin', '1', 'Admin/Channel/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('69', 'admin', '1', 'Admin/Channel/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('70', 'admin', '1', 'Admin/Channel/index', '导航管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('71', 'admin', '1', 'Admin/Category/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('72', 'admin', '1', 'Admin/Category/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('73', 'admin', '1', 'Admin/Category/remove', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('74', 'admin', '1', 'Admin/Category/index', '分类管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('75', 'admin', '1', 'Admin/file/upload', '上传控件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('76', 'admin', '1', 'Admin/file/uploadPicture', '上传图片', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('77', 'admin', '1', 'Admin/file/download', '下载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('94', 'admin', '1', 'Admin/AuthManager/modelauth', '模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('79', 'admin', '1', 'Admin/article/batchOperate', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('80', 'admin', '1', 'Admin/Database/index?type=export', '备份数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('81', 'admin', '1', 'Admin/Database/index?type=import', '还原数据库', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('82', 'admin', '1', 'Admin/Database/export', '备份', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('83', 'admin', '1', 'Admin/Database/optimize', '优化表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('84', 'admin', '1', 'Admin/Database/repair', '修复表', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('86', 'admin', '1', 'Admin/Database/import', '恢复', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('87', 'admin', '1', 'Admin/Database/del', '删除', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('88', 'admin', '1', 'Admin/User/add', '新增用户', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('89', 'admin', '1', 'Admin/Attribute/index', '属性管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('90', 'admin', '1', 'Admin/Attribute/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('91', 'admin', '1', 'Admin/Attribute/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('92', 'admin', '1', 'Admin/Attribute/setStatus', '改变状态', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('93', 'admin', '1', 'Admin/Attribute/update', '保存数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('95', 'admin', '1', 'Admin/AuthManager/addToModel', '保存模型授权', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('96', 'admin', '1', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('97', 'admin', '1', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('98', 'admin', '1', 'Admin/Config/menu', '后台菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('99', 'admin', '1', 'Admin/Article/mydocument', '内容', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('100', 'admin', '1', 'Admin/Menu/index', '菜单管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('101', 'admin', '1', 'Admin/other', '其他', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('102', 'admin', '1', 'Admin/Menu/add', '新增', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('103', 'admin', '1', 'Admin/Menu/edit', '编辑', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('104', 'admin', '1', 'Admin/Think/lists?model=article', '文章管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('105', 'admin', '1', 'Admin/Think/lists?model=download', '下载管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('106', 'admin', '1', 'Admin/Think/lists?model=config', '配置管理', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('107', 'admin', '1', 'Admin/Action/actionlog', '行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('108', 'admin', '1', 'Admin/User/updatePassword', '修改密码', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('109', 'admin', '1', 'Admin/User/updateNickname', '修改昵称', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('110', 'admin', '1', 'Admin/action/edit', '查看行为日志', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('205', 'admin', '1', 'Admin/think/add', '新增数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('111', 'admin', '2', 'Admin/article/index', '文档列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('112', 'admin', '2', 'Admin/article/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('113', 'admin', '2', 'Admin/article/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('114', 'admin', '2', 'Admin/article/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('115', 'admin', '2', 'Admin/article/update', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('116', 'admin', '2', 'Admin/article/autoSave', '保存草稿', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('117', 'admin', '2', 'Admin/article/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('118', 'admin', '2', 'Admin/article/copy', '复制', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('119', 'admin', '2', 'Admin/article/paste', '粘贴', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('120', 'admin', '2', 'Admin/article/batchOperate', '导入', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('121', 'admin', '2', 'Admin/article/recycle', '回收站', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('122', 'admin', '2', 'Admin/article/permit', '还原', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('123', 'admin', '2', 'Admin/article/clear', '清空', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('124', 'admin', '2', 'Admin/User/add', '新增用户', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('125', 'admin', '2', 'Admin/User/action', '用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('126', 'admin', '2', 'Admin/User/addAction', '新增用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('127', 'admin', '2', 'Admin/User/editAction', '编辑用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('128', 'admin', '2', 'Admin/User/saveAction', '保存用户行为', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('129', 'admin', '2', 'Admin/User/setStatus', '变更行为状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('130', 'admin', '2', 'Admin/User/changeStatus?method=forbidUser', '禁用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('131', 'admin', '2', 'Admin/User/changeStatus?method=resumeUser', '启用会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('132', 'admin', '2', 'Admin/User/changeStatus?method=deleteUser', '删除会员', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('133', 'admin', '2', 'Admin/AuthManager/index', '权限管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('134', 'admin', '2', 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('135', 'admin', '2', 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('136', 'admin', '2', 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('137', 'admin', '2', 'Admin/AuthManager/createGroup', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('138', 'admin', '2', 'Admin/AuthManager/editGroup', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('139', 'admin', '2', 'Admin/AuthManager/writeGroup', '保存用户组', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('140', 'admin', '2', 'Admin/AuthManager/group', '授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('141', 'admin', '2', 'Admin/AuthManager/access', '访问授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('142', 'admin', '2', 'Admin/AuthManager/user', '成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('143', 'admin', '2', 'Admin/AuthManager/removeFromGroup', '解除授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('144', 'admin', '2', 'Admin/AuthManager/addToGroup', '保存成员授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('145', 'admin', '2', 'Admin/AuthManager/category', '分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('146', 'admin', '2', 'Admin/AuthManager/addToCategory', '保存分类授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('147', 'admin', '2', 'Admin/AuthManager/modelauth', '模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('148', 'admin', '2', 'Admin/AuthManager/addToModel', '保存模型授权', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('149', 'admin', '2', 'Admin/Addons/create', '创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('150', 'admin', '2', 'Admin/Addons/checkForm', '检测创建', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('151', 'admin', '2', 'Admin/Addons/preview', '预览', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('152', 'admin', '2', 'Admin/Addons/build', '快速生成插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('153', 'admin', '2', 'Admin/Addons/config', '设置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('154', 'admin', '2', 'Admin/Addons/disable', '禁用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('155', 'admin', '2', 'Admin/Addons/enable', '启用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('156', 'admin', '2', 'Admin/Addons/install', '安装', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('157', 'admin', '2', 'Admin/Addons/uninstall', '卸载', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('158', 'admin', '2', 'Admin/Addons/saveconfig', '更新配置', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('159', 'admin', '2', 'Admin/Addons/adminList', '插件后台列表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('160', 'admin', '2', 'Admin/Addons/execute', 'URL方式访问插件', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('161', 'admin', '2', 'Admin/Addons/hooks', '钩子管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('162', 'admin', '2', 'Admin/Model/index', '模型管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('163', 'admin', '2', 'Admin/model/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('164', 'admin', '2', 'Admin/model/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('165', 'admin', '2', 'Admin/model/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('166', 'admin', '2', 'Admin/model/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('167', 'admin', '2', 'Admin/Attribute/index', '属性管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('168', 'admin', '2', 'Admin/Attribute/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('169', 'admin', '2', 'Admin/Attribute/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('170', 'admin', '2', 'Admin/Attribute/setStatus', '改变状态', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('171', 'admin', '2', 'Admin/Attribute/update', '保存数据', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('172', 'admin', '2', 'Admin/Config/index', '配置管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('173', 'admin', '2', 'Admin/Config/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('174', 'admin', '2', 'Admin/Config/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('175', 'admin', '2', 'Admin/Config/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('176', 'admin', '2', 'Admin/Config/save', '保存', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('177', 'admin', '2', 'Admin/Menu/index', '菜单管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('178', 'admin', '2', 'Admin/Channel/index', '导航管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('179', 'admin', '2', 'Admin/Channel/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('180', 'admin', '2', 'Admin/Channel/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('181', 'admin', '2', 'Admin/Channel/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('182', 'admin', '2', 'Admin/Category/index', '分类管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('183', 'admin', '2', 'Admin/Category/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('184', 'admin', '2', 'Admin/Category/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('185', 'admin', '2', 'Admin/Category/remove', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('186', 'admin', '2', 'Admin/Category/move', '移动', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('187', 'admin', '2', 'Admin/Category/merge', '合并', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('188', 'admin', '2', 'Admin/Database/index?type=export', '备份数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('189', 'admin', '2', 'Admin/Database/export', '备份', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('190', 'admin', '2', 'Admin/Database/optimize', '优化表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('191', 'admin', '2', 'Admin/Database/repair', '修复表', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('192', 'admin', '2', 'Admin/Database/index?type=import', '还原数据库', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('193', 'admin', '2', 'Admin/Database/import', '恢复', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('194', 'admin', '2', 'Admin/Database/del', '删除', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('195', 'admin', '2', 'Admin/other', '其他', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('196', 'admin', '2', 'Admin/Menu/add', '新增', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('197', 'admin', '2', 'Admin/Menu/edit', '编辑', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('198', 'admin', '2', 'Admin/Think/lists?model=article', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('199', 'admin', '2', 'Admin/Think/lists?model=download', '下载管理', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('200', 'admin', '2', 'Admin/Think/lists?model=config', '应用', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('201', 'admin', '2', 'Admin/Action/actionlog', '行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('202', 'admin', '2', 'Admin/User/updatePassword', '修改密码', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('203', 'admin', '2', 'Admin/User/updateNickname', '修改昵称', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('204', 'admin', '2', 'Admin/action/edit', '查看行为日志', '-1', '');
INSERT INTO `onethink_auth_rule` VALUES ('206', 'admin', '1', 'Admin/think/edit', '编辑数据', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('207', 'admin', '1', 'Admin/Menu/import', '导入', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('208', 'admin', '1', 'Admin/Model/generate', '生成', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('209', 'admin', '1', 'Admin/Addons/addHook', '新增钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('210', 'admin', '1', 'Admin/Addons/edithook', '编辑钩子', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('211', 'admin', '1', 'Admin/Article/sort', '文档排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('212', 'admin', '1', 'Admin/Config/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('213', 'admin', '1', 'Admin/Menu/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('214', 'admin', '1', 'Admin/Channel/sort', '排序', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('215', 'admin', '1', 'Admin/Category/operate/type/move', '移动', '1', '');
INSERT INTO `onethink_auth_rule` VALUES ('216', 'admin', '1', 'Admin/Category/operate/type/merge', '合并', '1', '');

-- -----------------------------
-- Table structure for `onethink_category`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_category`;
CREATE TABLE `onethink_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

-- -----------------------------
-- Records of `onethink_category`
-- -----------------------------
INSERT INTO `onethink_category` VALUES ('1', 'blog', '博客', '0', '0', '10', '', '', '', '', '', '', '', '2', '2,1', '0', '0', '1', '0', '0', '1', '', '1379474947', '1382701539', '1', '0');
INSERT INTO `onethink_category` VALUES ('2', 'default_blog', '默认分类', '1', '1', '10', '', '', '', '', '', '', '', '2', '2,1,3', '0', '1', '1', '0', '1', '1', '', '1379475028', '1386839751', '1', '31');

-- -----------------------------
-- Table structure for `onethink_channel`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_channel`;
CREATE TABLE `onethink_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_channel`
-- -----------------------------
INSERT INTO `onethink_channel` VALUES ('1', '0', '首页', 'Index/index', '1', '1379475111', '1379923177', '1', '0');
INSERT INTO `onethink_channel` VALUES ('2', '0', '博客', 'Article/index?category=blog', '2', '1379475131', '1379483713', '1', '0');
INSERT INTO `onethink_channel` VALUES ('3', '0', '官网', 'http://www.onethink.cn', '3', '1379475154', '1387163458', '1', '0');

-- -----------------------------
-- Table structure for `onethink_config`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_config`;
CREATE TABLE `onethink_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_config`
-- -----------------------------
INSERT INTO `onethink_config` VALUES ('1', 'WEB_SITE_TITLE', '1', '网站标题', '1', '', '网站标题前台显示标题', '1378898976', '1379235274', '1', 'OneThink内容管理框架', '0');
INSERT INTO `onethink_config` VALUES ('2', 'WEB_SITE_DESCRIPTION', '2', '网站描述', '1', '', '网站搜索引擎描述', '1378898976', '1379235841', '1', 'OneThink内容管理框架', '1');
INSERT INTO `onethink_config` VALUES ('3', 'WEB_SITE_KEYWORD', '2', '网站关键字', '1', '', '网站搜索引擎关键字', '1378898976', '1381390100', '1', 'ThinkPHP,OneThink', '8');
INSERT INTO `onethink_config` VALUES ('4', 'WEB_SITE_CLOSE', '4', '关闭站点', '1', '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', '1378898976', '1379235296', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('9', 'CONFIG_TYPE_LIST', '3', '配置类型列表', '4', '', '主要用于数据解析和页面表单的生成', '1378898976', '1379235348', '1', '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', '2');
INSERT INTO `onethink_config` VALUES ('10', 'WEB_SITE_ICP', '1', '网站备案号', '1', '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', '1378900335', '1379235859', '1', '', '9');
INSERT INTO `onethink_config` VALUES ('11', 'DOCUMENT_POSITION', '3', '文档推荐位', '2', '', '文档推荐位，推荐到多个位置KEY值相加即可', '1379053380', '1379235329', '1', '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', '3');
INSERT INTO `onethink_config` VALUES ('12', 'DOCUMENT_DISPLAY', '3', '文档可见性', '2', '', '文章可见性仅影响前台显示，后台不收影响', '1379056370', '1379235322', '1', '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', '4');
INSERT INTO `onethink_config` VALUES ('13', 'COLOR_STYLE', '4', '后台色系', '1', 'default_color:默认\r\nblue_color:紫罗兰', '后台颜色风格', '1379122533', '1379235904', '1', 'default_color', '10');
INSERT INTO `onethink_config` VALUES ('20', 'CONFIG_GROUP_LIST', '3', '配置分组', '4', '', '配置分组', '1379228036', '1384418383', '1', '1:基本\r\n2:内容\r\n3:用户\r\n4:系统', '4');
INSERT INTO `onethink_config` VALUES ('21', 'HOOKS_TYPE', '3', '钩子的类型', '4', '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', '1379313397', '1379313407', '1', '1:视图\r\n2:控制器', '6');
INSERT INTO `onethink_config` VALUES ('22', 'AUTH_CONFIG', '3', 'Auth配置', '4', '', '自定义Auth.class.php类配置', '1379409310', '1379409564', '1', 'AUTH_ON:1\r\nAUTH_TYPE:2', '8');
INSERT INTO `onethink_config` VALUES ('23', 'OPEN_DRAFTBOX', '4', '是否开启草稿功能', '2', '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', '1379484332', '1379484591', '1', '1', '1');
INSERT INTO `onethink_config` VALUES ('24', 'DRAFT_AOTOSAVE_INTERVAL', '0', '自动保存草稿时间', '2', '', '自动保存草稿的时间间隔，单位：秒', '1379484574', '1386143323', '1', '60', '2');
INSERT INTO `onethink_config` VALUES ('25', 'LIST_ROWS', '0', '后台每页记录数', '2', '', '后台数据每页显示记录数', '1379503896', '1380427745', '1', '10', '10');
INSERT INTO `onethink_config` VALUES ('26', 'USER_ALLOW_REGISTER', '4', '是否允许用户注册', '3', '0:关闭注册\r\n1:允许注册', '是否开放用户注册', '1379504487', '1379504580', '1', '1', '3');
INSERT INTO `onethink_config` VALUES ('27', 'CODEMIRROR_THEME', '4', '预览插件的CodeMirror主题', '4', '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', '1379814385', '1384740813', '1', 'ambiance', '3');
INSERT INTO `onethink_config` VALUES ('28', 'DATA_BACKUP_PATH', '1', '数据库备份根路径', '4', '', '路径必须以 / 结尾', '1381482411', '1381482411', '1', './Data/', '5');
INSERT INTO `onethink_config` VALUES ('29', 'DATA_BACKUP_PART_SIZE', '0', '数据库备份卷大小', '4', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '1381482488', '1381729564', '1', '20971520', '7');
INSERT INTO `onethink_config` VALUES ('30', 'DATA_BACKUP_COMPRESS', '4', '数据库备份文件是否启用压缩', '4', '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', '1381713345', '1381729544', '1', '1', '9');
INSERT INTO `onethink_config` VALUES ('31', 'DATA_BACKUP_COMPRESS_LEVEL', '4', '数据库备份文件压缩级别', '4', '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '1381713408', '1381713408', '1', '9', '10');
INSERT INTO `onethink_config` VALUES ('32', 'DEVELOP_MODE', '4', '开启开发者模式', '4', '0:关闭\r\n1:开启', '是否开启开发者模式', '1383105995', '1383291877', '1', '1', '11');
INSERT INTO `onethink_config` VALUES ('33', 'ALLOW_VISIT', '3', '不受限控制器方法', '0', '', '', '1386644047', '1386644741', '1', '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture', '0');
INSERT INTO `onethink_config` VALUES ('34', 'DENY_VISIT', '3', '超管专限控制器方法', '0', '', '仅超级管理员可访问的控制器方法', '1386644141', '1386644659', '1', '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', '0');
INSERT INTO `onethink_config` VALUES ('35', 'REPLY_LIST_ROWS', '0', '回复列表每页条数', '2', '', '', '1386645376', '1387178083', '1', '10', '0');
INSERT INTO `onethink_config` VALUES ('36', 'ADMIN_ALLOW_IP', '2', '后台允许访问IP', '4', '', '多个用逗号分隔，如果不配置表示不限制IP访问', '1387165454', '1387165553', '1', '', '12');
INSERT INTO `onethink_config` VALUES ('37', 'SHOW_PAGE_TRACE', '4', '是否显示页面Trace', '4', '0:关闭\r\n1:开启', '是否显示页面Trace信息', '1387165685', '1387165685', '1', '0', '1');

-- -----------------------------
-- Table structure for `onethink_content`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_content`;
CREATE TABLE `onethink_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `content` text NOT NULL COMMENT '内容',
  `keywords` text NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `onethink_content`
-- -----------------------------
INSERT INTO `onethink_content` VALUES ('1', '帮助', '  <div class=\"txt\">\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"1\">关于订单</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content1\" >\r\n                        <p class=\"p1\">1.订单处理好人发货</p>\r\n                        <p class=\"p2\">\"接到您的订单后，我们将会进行订单审核，如无特殊状况(订单审核未通过、产品暂时缺货、非人力不可抗因素等)，当天下午15:00前的订单，\r\n                            我们将会于当天发货。周六、周日同样遵循工作日的服务时间。以便给您更好的服务和售后体验。如遇到国定假期，我们将会遵循第三方快递服务商的工作时间。\"\r\n                            <br />\"在我们正式发出您订购的产品之前，如果您希望更改订单，请第一时间致电400-8089-830，通知我们的客服部门。温馨提醒：为您让您更快的\r\n                            收到产品，我们会在您下单后尽快发货，如果您需要更改订单，请在下单后及时通知我们。\"\r\n                            <br />* 我们支持货到付款、支付宝、银联支付等多种支付方式，建议您填写完整、正确、清晰的送货地址以及联系方式，联系方式建议填写手机，以便我们更快为您配送。\r\n                        </p>\r\n                        <p class=\"p1\">2. 历史订单查询</p>\r\n                        <p class=\"p2\">\"下单后，您可以通过访问订单历史页面，检查您最近订单的状态。这是了解您的爱膜力在线订单近况的最简便，快速的方式。登录爱膜力网站，\r\n                            在\"我的账户\"页面点击\"我的账单\"即可。\"</p>\r\n                        <p class=\"p1\">3. 取消订单</p>\r\n                        <p class=\"p2\">在少数情况下，我们的系统会由于某些特定原因取消订单或取消订单部分内容。其中部分原因如下：\r\n                            <br /><span>(1)</span> 商品暂时缺货&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n                            <span>(2)</span> 无法接通顾客所留下的联系电话&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n                            <span>(3)</span> 无法送货到相应地址&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n                            <span>(4)</span> 客户要求取消\r\n                            <br />如果您的订单被取消，我们的客服人员会第一时间联系您，向您解释订单取消的原因。您无需为被取消的商品付款。如果您希望重新下单或您对取消的订单有疑问，\r\n                            请拨打400-8089-830，或联系我们的在线客服。   \r\n                        </p>\r\n                        <p class=\"p1\">4. 退换货</p>\r\n                        <p class=\"p2\">\"顾客在本网站订购产品，如果发现外包装在递送过程中已经破损，请您当即拒收，请快递服务商带回。\r\n                            <br /><span>凡收到货物后发现以下情形的，可以在签收之日起的10天内无条件退货或换货：</span>\r\n                            <br /><span>(1)</span>与顾客在网站上订购的产品不同；\r\n                            <br /><span>(2)</span>收到货物时即发现产品已过期；\r\n                            <br />凡出现上述情形，我们将退还相应的货款并承担因退换货而产生的运费。\r\n                            <br /><br />顾客在本网站订购产品，使用后如出现不适，可以随时申请退换货，但必须满足以下条件：\r\n                            <br /><span>(1)</span> 提供由中国大陆地区二级以上医院皮肤科出具的诊断报告；\r\n                            <br /><span>(2)</span> 诊断报告的出具日期系顾客签收货物之后；\r\n                            <br /><span>(3)</span> 诊断报告上明确指出该不适现象系由化妆品引起；\r\n                            <br />凡出现上述情形，我们将退还相应的货款并承担因退换货而产生的运费。\r\n                            <br /><br />我们只受理从本网站销售的产品的退换货。凡是从本网站以外渠道购买的产品，请联系原购买地协商退换货。\"\r\n                            <br /><span>如果您想对在爱膜力官网购买的商品进行退换货，建议您按照以下步骤</span>\r\n                            <br /><span>(1)</span> 请务必首先致电我们的客户服务部门（400-8089-830），告知所遇到的问题，然后根据我们客户服务代表的指示进行退换货；\r\n                            <br /><span>(2)</span> 退换货时请提供所有需要退换的产品，哪怕其已经破损或被打开；\r\n                            <br /><span>(3)</span> 退换货时请附上随产品一起送达的销售单据及发票；\r\n                            <br /><span>(4)</span> 为了您的便利，请在致电我们客户服务部门时，告知您购买产品的订单编号；\r\n                            <br /><br /><span>收到退货并验明无误后，我们将在24小时之内完成退款：</span>\r\n                            <br /><span>(1)</span> 如果您当初是通过网上银行支付的，那么款项将退入您当时支付的银行卡中；\r\n                            <br /><span>(2)</span> 如果您当初是选用货到付款的，那么款项将通过邮政汇款的形式退还给您；\r\n                            <br />鉴于银行体系以及邮政体系的内部流程，我们完成退款操作后，该款项大致需要15-30天左右的时间才能到达您的银行卡里或寄达您手中。对此我们深表歉意。\"\r\n                            <br /><br /><span>商品或包装破损</span>\r\n                            <br />顾客在本网站订购产品，如果发现外包装在递送过程中已经破损，请您当即拒收，请快递服务商带回。\r\n                        </p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"2\">运输和快递</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content2\" >\r\n\r\n                        <p class=\"p1\">1. 快递费用</p>\r\n                        <p class=\"p2\">爱膜力官网所有订单都可享受免运费服务。</p>\r\n\r\n                        <p class=\"p1\">2. 运输和快递政策</p>\r\n                        <p class=\"p2\">本网站所有订单都可享受免运费服务。\r\n                            <br /><span>(1)</span> 所有订购的商品统一从广州总部发出；\r\n                            <br /><span>(2)</span> 每天15:00以前下的订单将于当日处理完毕并发出，15:00以后下的订单将于第二日处理完毕并发出；\r\n                            <br /><span>(3)</span> 我们采用中国地区优秀的快递服务商为您服务,所有订购的商品都将通过最快捷最安全的递送方式（而不是平邮）送到顾客手中。\r\n                            <br />收货地址处于直辖市，省会城市及大中型城市的订单将会通过其他地区的订单则将会通过中国邮政特快专递（EMS）方式送达；\r\n                            <br /><span>(4)</span> 我们无法将产品送往中国大陆以外的地址，也无法送往诸如邮政信箱之类的虚拟地址。对于此类订单，我们将联系顾客表示歉意，并予以取消；\r\n                            <br /><span>(5)</span> 中国大陆各地区的具体到货时间如下（从顾客下订单的时间起开始计算）\r\n                            <br />上海 1天 (隔天到货)\r\n                            <br />所有直辖市及省会城市（除拉萨） 2-3天 \r\n                            <br />华东，华中，华南和华北地区的各大城市 2-3天 \r\n                            <br />东北，西南和西北地区的各大城市 3-4天 \r\n                            <br />乡，镇及偏远地区 5-7天 \r\n                            <br />在商品发出后，我们将会通过短信或者电子邮件的方式将快递单号通知到您，您可以到相应的快递商网站或者服务电话来查询快递状态。 \r\n                            <br /><span>(6)</span> 所有订单都享受遗失和受损保险\r\n                            <br /><span>(7)</span> 所有订单都需有人签收\r\n                        </p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"3\">关于购物</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content3\" >\r\n\r\n                        <p class=\"p1\">在线付款安全条款</p>\r\n                        <p class=\"p2\">我们与中国银联旗下的ChinaPay在线支付或者支付宝密切合作，通过采取各种措施，确保您的个人信息及付款安全。\r\n                            <br />一旦您发现信用卡或借记卡被盗用，请立即根据发卡商的通报规则和程序通知他们。如需了解我们怎样使用您留下的个人信息，请参阅我们的隐私保护政策。\r\n                            <br />在您输完结账流程中所有的付款，运输和订单信息后，系统会要求您填入您的付款信息。完成该步骤后，请点击\"继续\"按钮，付款确认后，即被扣款。</p>\r\n                        <p class=\"p1\">重要信息:</p>\r\n                        <p class=\"p2\">为了您的使用安全，我们针对订单有一系列的内部检查。我们保留取消任何我们有理由认为可疑订单的权利。</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"4\">产品暂时缺货</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content4\" >\r\n\r\n\r\n                        <p class=\"p2\"><br />如果某产品暂时缺货，您将无法将该产品加入您的购物袋。但是您可以致电我们的客服热线400-8089-830或者联系我们的在线客服，预定您\r\n                            所需要的商品，我们将会在到货后，第一时间通知您</p>\r\n                        <p class=\"p1\">提前预购</p>\r\n                        <p class=\"p2\">作为爱膜力官网的会员，您将可以享受到新品或者限量套装的提前预购，但我们不一定有实际库存，我们将会在产品到货后，再进行发货。</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"5\">付款方式</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content5\" >\r\n\r\n                        <p class=\"p1\">我们接受的付款方式：</p>\r\n                        <p class=\"p2\"><span>(1)</span> 网上银行支付&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n                            <span>(2)</span> 货到付款,收货时支付现金或POS刷卡(如需POS刷卡，请在备注中注明)&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp\r\n                            &nbsp&nbsp&nbsp&nbsp&nbsp<span>(3)</span> 支付宝</p>\r\n\r\n                    </div>\r\n                </div>\r\n', '爱膜力生物科技有限公司,爱发光面膜,发光面膜,关于订单,运输和快递,购物帮助,付款方式', '帮助页面');
INSERT INTO `onethink_content` VALUES ('2', '法律声明', '        <div class=\"txt\">\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"1\">前言</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content1\" >\r\n                        <p class=\"p1\">爱膜力（中国）网站使用条款：</p>\r\n                        <p class=\"p2\">根据本使用条款、我们的隐私权政策和您在本网站上看到的与特定功能、特征或促销以及客户服务相关的其他条款政策\r\n                            （此类条款政策均被视为本使用条款的一部分并统称为\"使用条款\"），爱膜力（中国）网站（\"爱膜力（中国）网站\"）向您提供本网站\r\n                            的内容和服务。请仔细阅读本使用条款。您访问或使用本网站，说明您已同意受本条款的约束。</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"2\">1. 隐私权</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content2\" >\r\n                        <p class=\"p2\"><br />请查阅我们的隐私权政策, 以便理解我们的隐私保护措施。</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"3\">2. 供个人使用的产品和服务</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content3\" >\r\n                        <p class=\"p2\"><br />我们通过本网站自身或通过指定的经销商提供给您的任何产品和服务及其样品仅供您个人享用。任何从我方购买或收到的产品、\r\n                            服务及其样品均不可出售或转售。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"4\">3.信息的准确性</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content4\" >\r\n                        <p class=\"p2\"><br />我们尽量做到在本网站上对产品的描述准确无误；然而，我们无法保证产品说明、颜色或网站上的其他内容完全精确、\r\n                            完整、现时或毫无差错。如果我们在本网站出售的产品和本网站描述有所出入，您唯一的补救办法是联系客服将未使用的产品退货。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"5\">4. 知识产权</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content5\" >\r\n                        <p class=\"p2\"><br />本网站的所有内容及其\"视觉和感觉\"，包括但不限于商标、标志、服务商标、文字、图表、标识、按钮图标、图像、声音片段、\r\n                            数据汇编和软件以及文献编汇（合称\"内容\"）均为爱膜力中国在线、我们的关联公司、合作伙伴和许可方的财产，并受包括著作权法和商标法在内的\r\n                            美国、中国和国际法律的保护。\r\n                            <br />未经我们事先明确书面同意，本网站的内容或任何其他部分均不得为任何目的被全部或部分使用、再版、复制、仿制、出售、转售、访问、\r\n                            修改或以其他方式利用。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"6\">5. 有限许可</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content6\" >\r\n                        <p class=\"p2\"><br />您可以访问及使用本网站，但不可：框定或使用成帧技术框住本网站或其任何部分；再发表、再发布、销售、许可或下载本网站或任\r\n                            何内容，（除暂存或查看本网站所必需）；除个人使用以外对网站或其内容作其他任何用途；修改、反向工程或根据本网站或任何内容创作衍生作品；为您\r\n                            个人或其他方收集帐户资料；在任何内容上使用任何元标记(Meta tags) 或任何其他\"隐藏文字\"或使用软件机器人、搜索蜘蛛、爬行搜索技术或类似的数\r\n                            据收集和提取工具，或采取可能给我们的信息基础设施造成不合理的负担或重负的任何其他手段。您必须不加修改的保留本网站上的及其上附带或包含的\r\n                            所有权通知。\r\n                            <br />您可以对本网站主页进行超级链接，仅为您个人及非商业之用。与本网站链接的网站可链接到我们网站，但不得复制本网站的内容；不可暗示我们支持该网\r\n                            站或其服务或产品；不可不实地陈述其与我们的关系；不可包含在适用法律项下可能被理解为非法的、令人反感的、下流的、攻击性的或有争议的内容，且只可包含\r\n                            对所有年龄层均合适的内容；不可以虚假、误导、诽谤或在其他方面具有攻击性或有伤风化的方式描述我们或我们的产品和服务，或将我们与不受欢迎的产品、服务\r\n                            或意见加以联系；及不可链接到本网站主页外的任何其他页面。我们可要求您去除对本网站的任何链接，一经收到上述要求，您应立即去除或断开这些链接。\r\n                            <br />您对本网站任何未经授权的使用将立即终止本第五条所规定的有限许可。 </p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"7\">6. 您的义务和责任</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content7\" >\r\n                        <p class=\"p2\"><br />您在访问或使用本网站时，应当遵守本使用条款和本网站上张贴的访问使用特别警示或指示。您应当根据法律和惯例善意行事。\r\n                            您不应当对本网站或出现在网站上的任何内容或服务进行任何修改或改动，而且不应以任何方式损害网站的完整性和正常运作。如果您由于疏忽或故意\r\n                            违反本条款中的任何规定，您应对爱膜力中国在线、我们的关联公司、合作伙伴或许可方造成的损失和损害承担责任。</p>\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"8\">7. 您的帐户</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content8\" >\r\n                        <p class=\"p2\"><br />若您是18岁以上人士，您可以在我们的网站注册。如果您未满18岁，请不要注册。如果您已满18岁且注册，您的账户会有一个电子\r\n                            邮件地址/用户名和密码。您应负责对自己的账户、用户名和密码保密，并限制他人使用您的电脑登陆您的账户。您应负责保证账户相关信息现时、完整、\r\n                            准确和真实，并为在您的帐户、用户名/密码项下发生的所有行为负责。您同意只提供现时、完整、准确和真实的信息。\r\n                            <br />我们保留无需事先通知，拒绝服务/终止帐户的权利。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"9\">8. 第三方链接</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content9\" >\r\n                        <p class=\"p2\"><br />我们不对本网站之外的页面或与本网站相链接的其他网站的内容负责。您应仔细阅读所有您访问的本网站之外的页面及其他网站的使用\r\n                            条款和隐私权政策。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"10\">9. 特别项目、功能和活动</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content10\" >\r\n                        <p class=\"p2\"><br />本网站可能会提供某些特别项目、功能和活动（比如竞赛、抽奖或其他活动），这些活动会适用除本条款之外的使用规则、条款或政策；并由我\r\n                            们或第三方提供。若您选择参与这些活动，我们会通知您，您同意参与活动适用另外单独的使用规则、条款或政策。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"11\">10. 提交资料</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content11\" >\r\n                        <p class=\"p2\"><br />我们一般谢绝未经请求的建议和想法。然而，您向我们提供的任何询问、反馈、建议、想法或其他信息（合称\"提交资料\"）将作为\r\n                            非私有、非保密的资料处理。在遵守我们隐私权政策的前提下，我们可以以任何形式、媒介或技术复印、使用、复制、修改、改编、公布、出售、转让、\r\n                            翻译、制造衍生作品、分发及展示任何提交资料，不论上述提交资料是目前为人所知或今后开发的，单独的或是其他产品的一部分，我们也可在我们的产\r\n                            品或服务上或结合产品或服务而应用提交资料。\r\n                            <br />每一个因特网用户都有义务保护因特网的安全。您保证上述提交资料并不构成或包含软件病毒、商业招揽、链式信函、群发邮件或任何形式的\"垃圾信息\"\r\n                            。您不可使用虚假的电子邮件地址，假冒任何个人或实体，或以别种方式就任何提交资料的来源误导我们。您同意就您违反本条及而导致的或因提交资料发生的\r\n                            任何损失向我们赔偿。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"12\">11. 版权争议</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content12\" >\r\n                        <p class=\"p2\"><br />我们尊重他人的知识产权。如果您认为某一作品在本网站上被抄袭而构成著作权侵权，请点击此处通知我们有关侵权诉求。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"13\">12. 声明和保证；责任限制</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content13\" >\r\n                        <p class=\"p2\"><br />本网站按现状提供。在适用法律允许的范围内，我们并不就本网站作任何形式（无论明示或暗示）的声明或保证。\r\n                            <br />在适用法律允许的范围内，我们不为下述情况负责或承担责任（包括合同法、侵权法（包括疏忽）或其他责任）(1)业务中断；\r\n                            (2)对本网站的访问延迟或访问中断；(3)数据不传送、错误传送、讹误、破坏或被篡改；(4)由于处理本网站上的网站外链接或因网站外链\r\n                            接的出现而发生的任何类型的损失或损害；(5)您因使用本网站，包括超级链接出入第三方网站时，可能发生的计算机病毒、系统故障或失灵；\r\n                            (6)任何不准确或有疏漏的内容； (7)在我们合理控制范围以外的事件。\r\n                            <br />而且，在法律允许的最大范围内，我们将不为与本网站有关的任何类型的间接或结果性损害（包括利润损失）负责，不论诉讼形式是基于合\r\n                            同、侵权（包括疏忽）或其他理论，即使我们接到可能发生该等损害的通知。</p>\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"14\">13. 补偿</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content14\" >\r\n                        <p class=\"p2\"><br />您同意对因您使用本网站或违反本使用条款导致任何第三方提出权利主张、起诉或要求而产生的任何损失、损害或费\r\n                            用，包括合理的律师费向我们作出保护和补偿，并使我们不受损失。您也同意对因您使用软件机器人、搜索蜘蛛、爬行搜索器或类似数据收\r\n                            集和提取工具，或您采取的给我们的信息基础设施造成不合理的负担或重负的任何其他手段而产生的任何损失、损害或费用，包括合理的\r\n                            律师费向我们作出补偿。</p>\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"15\">14. 争议</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content15\" >\r\n                        <p class=\"p2\"><br />对于与本网站有关的任何争议和本使用条款所包含的您的权利和义务及所有行为应受中华人民共和国法律管辖。与您访问本\r\n                            网站有关的任何形式的争议应提交给中国国际经济贸易仲裁委员会（\"贸仲会\"），您接受该机构的管辖权和程序。但如果您以任何方式侵犯或可能\r\n                            侵犯我们（或我们的关联实体、合作伙伴或许可人）的知识产权或我们有基于衡平法的诉因，我们可在任何有适当管辖权的法院寻求禁令或其他适\r\n                            当的救济，您同意该法院的属人管辖权和属地管辖权。在本协议项下的仲裁应根据贸仲会届时有效的仲裁规则进行。仲裁裁决应具有约束力，并可\r\n                            在任何具有司法管辖权的法院作判决备案。在法律许可的最大范围内，本使用条款项下的任何仲裁不得与涉及受制于本使用条款的任何其他方的仲\r\n                            裁合并，无论是否以集体仲裁程序或其他方式提起。</p>\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"16\">15. 同意由网站公告或电邮、短信、印刷材料等形式接受通讯</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content16\" >\r\n                        <p class=\"p2\"><br />您同意包括但不限于电子邮件、短信、印刷材料或本网站上的通告，接受本使用条款提及的任何协议、通知、讯息和其它通\r\n                            讯（合称\"通知\"）。 您同意我们以电子方式提供给您的通知符合该等通知应当书面做出的法律要求。您必须发送电子邮件至amory@exmail.qq.com并\r\n                            停止使用本网站，来通知我们您不再同意以电子方式接受通知。在此情况下，所有根据本使用条款赋予您的权利，包括但不限于第五条所述有限许可，\r\n                            应当自动终止。遗憾的是，我们无法向不同意以电子方式接受通知的用户提供本网站的服务。您同意包括但不限于电子邮件、短信、印刷材料或本网站上\r\n                            的通告，接受本使用条款提及的任何协议、通知、讯息和其它通讯（合称\"通知\"）。 您同意我们以电子方式提供给您的通知符合该等通知应当书面做出\r\n                            的法律要求。您必须发送电子邮件至amory@exmail.qq.com并停止使用本网站，来通知我们您不再同意以电子方式接受通知。在此情况下，所有根据\r\n                            本使用条款赋予您的权利，包括但不限于第五条所述有限许可，应当自动终止。遗憾的是，我们无法向不同意以电子方式接受通知的用户提供本网站的\r\n                            服务。\r\n                            <br />请注意，本条同意接受通知的规定和一切您作出的接收销售通讯的选择不相关联。您对于是否接收销售通讯的选择由我们的隐私权政策来规定。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\" id=\"17\">16. 一般规定</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content com\" id=\"content17\" >\r\n                        <p class=\"p2\"><br />我们可在任何时间通过在本网站上公布的方式更改上述使用条款。任何更改在本网站公布和发出更改通知之时立即生效。您对本网站的继\r\n                            续使用构成您对所有该等更改的同意。\r\n                            <br />如果您对本使用条款有任何问题，请发送电子邮件至amory@exmail.qq.com与我们联系。</p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n            </div>', '爱膜力生物科技有限公司,法律声明', '法律声明');
INSERT INTO `onethink_content` VALUES ('3', '护肤学堂', '<div class=\"txt\">\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">SKIN TYPE TEST测试自己的肤质适合哪款面膜</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"comtent-example\" >\r\n                        <p class=\"p2\"><br /><span>1.</span> 洁面后没有紧绷感　　　<span>2.</span> 通过肉眼可确认毛孔　　　\r\n                            <span>3.</span> 吸油纸每天使用三次以上　　　<span>4.</span> 面部经常油多，光亮亮的　　　\r\n                <span>5.</span> 涂抹营养霜或者使用面膜之后，容易出现皮肤问题\r\n                            <br /><span>6.</span> 鼻子周围黑头多　　　<span>7.</span> 头部经常发痒，有头屑　　　<span>8.</span> 容易脱妆　　　\r\n                            <span>9.</span> 洁面后不适用基础护肤品，但面部马上有油　　　<span>10.</span> 喜欢使用清晰的凝胶型产品，不喜欢滋润的产品\r\n                        </p>\r\n\r\n                        <p class=\"p1\">0—3个为干性皮肤</p>\r\n                        <p class=\"p2\">TIP：皮肤经常有紧绷感，必须持续保湿皮肤\r\n                            <br />可以尝试使用我们水润发光面膜，这款面膜具有卓悦补水和锁水的效果，有助于改善水油平衡，使肌肤焕现清澈透亮、莹润水嫩状态。</p>\r\n\r\n                        <div class=\"kong\">\r\n                            <p class=\"p2\"><a href=\"index.php?s=/home/prodect/index/id/3\" target=\"_blank\">　详情请点击</a></p>\r\n                        </div>\r\n\r\n                        <p class=\"p1\">4—6个为混合型皮肤</p>\r\n                        <p class=\"p2\">TIP：T区油多，U区干燥，需要调节水油平衡\r\n                            <br />可以尝试交替使用我们三款面膜，焕彩发光面膜，净颜发光面膜和水润发光面膜，因混合性肌肤比较难以调理，所以必须要结合不同效果的面膜才能深层调理\r\n\r\n肌肤。</p>\r\n\r\n                        <div class=\"kong\">\r\n                            <p class=\"p2\"><a href=\"index.php?s=/home/prodect/index/id/1\" target=\"_blank\">　详情请点击</a></p>\r\n                        </div>\r\n\r\n                        <p class=\"p1\">7—10个为油性皮肤</p>\r\n                        <p class=\"p2\">TIP：通过细心地洁面过程，呵护清洁老废物和皮脂，同时注意保持皮肤弹性\r\n                            <br />可以尝试使用我们的净颜发光面膜，这款面膜能养护调理肌肤，改善水油平衡，有助于清扫毛孔中的废物，使肌肤焕现洁净耀眼。</p>\r\n\r\n                        <div class=\"kong\">\r\n                            <p class=\"p2\"><a href=\"index.php?s=/home/prodect/index/id/2\" target=\"_blank\">　详情请点击</a></p>\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">面膜小知识-面膜的使用方法解除你的误区！</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"comtent-example\" >\r\n                        <p class=\"p1\">面膜护理的三个特点</p>\r\n                        <p class=\"p2\"><span>1. 强调每周使用一次</span>\r\n                            <br />每周使用一次的面膜，多强调定期为肌肤补充营养，如果间隔的时间过长，就会失去持续补充营养的作用，达不到应有的效果。\r\n                            <br /><span>2. 强调连续使用几天</span>\r\n                            <br />需要连续使用几天的面膜，多强调给肌肤加强护理，通过几天的连续补充，使肌肤达到完美的状态，在相对的一段时间内，能令肌肤够焕发出自然的光彩。 \r\n                            <br /><span>3. 强调不可连续使用</span>\r\n                            <br />强调不可连续使用的面膜，多为深层清洁型或剥离型面膜。尤其是剥离型面膜，在撕剥的过程中会对皮肤产生刺激，新长出的皮肤会因刺激频繁而受到损伤，\r\n\r\n甚至造成皮肤敏感。\r\n                        </p>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">使用面膜的要点</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content-mask\" >\r\n                        <div class=\"content-mask1\">\r\n                            <p class=\"p2\"><br /><span>1.</span> 购买清洁面膜或保养面膜前，要先了解自己的皮肤状况，然后再做针对性地选择。多效合一的面膜，效果不会很理想。\r\n                                <br /><span>2.</span> 面膜敷脸的时间一般为15-20分钟，除了剥离式面膜，其他面膜要马上揭掉或洗掉，不要等   到干了再处理，否则\r\n                                干掉的面膜会倒吸肌肤中的水分，使肌肤更加干燥。 \r\n                                <br /><span>3.</span> 使用清洗型面膜的时候，最好用挖棒挖取，多余的面膜不能放回容器中，避免将细菌也带进去。\r\n                                <br /><span>4.</span> 敏感型肌肤在使用美白、抗皱和清洁面膜时要格外慎重。 \r\n                                <br /><span>5.</span> 使用保养类面膜前，最好先做深层清洁、去除老废角质，这样才能使面膜中的营养成分被充分吸收。 </p>\r\n                        </div>\r\n                        <div class=\"content-mask2\">\r\n                            <p class=\"p2\"><br /><span>6.</span> 面膜属于加强型护理产品，不可替代平时的皮肤护理。 \r\n                                <br /><span>7.</span> 如果不是眼膜或针对青春痘的面膜，使用时最好避开眼周及有青春痘或发炎的部位。 \r\n                                <br /><span>8.</span> 油性肌肤，特别是痤疮肌肤，建议每1-2周使用一次清洁面膜，再根据需要每月使用1-4次美白、保湿或抗皱面膜。 \r\n                                <br /><span>9.</span> 中性和干性肌肤每月使用一次清洁面膜，保养类面膜可以多几次。 \r\n                                <br /><span>10.</span> 面膜要存放在干燥阴凉处，尤其是瓶罐包装的面膜，使用之后要把盖子盖紧，并远离浴室，否则水蒸汽渗入将会影响品质。</p>\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">日常护肤基本步骤</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"comtent-example\" >\r\n                        <div class=\"step\">\r\n                            <img class=\"image-step\" src=\"Public/Home/image/star-step.png\" />\r\n                        </div>\r\n\r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第一步：洁面乳、卸妆油（如果没有化妆，这一步骤可以省去） </p>\r\n                                <p class=\"p2\">功效： 洁面乳或卸妆油能有效溶走化妆品或高度防晒霜。\r\n                                    <br/>用法：用干的手取适量洁面乳或卸妆油，在干的面上轻轻按摩，然后用水冲洗干净或用纸巾抹走。\r\n                                    <br/>洁面乳：在干或湿的面上按摩，然后用水冲洗或用面纸抹干净。\r\n                                    <br/>注意：如使用一次未能将污垢洁净，可以重覆使用直至感觉干净。干性或敏感性肌肤不必使用凝胶、泡沫或粉末，只用洁面乳\r\n                                    直至感觉干净就可以。 </p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-1.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第二步：洁面凝胶、洁面泡沫、洁面粉末</p>\r\n                                <p class=\"p2\">功效：作为第二次洁面程序，去除过多死皮、污垢、留在面上的卸妆油或洁面乳残积、清理毛孔。\r\n                                    <br/>用法：加水起泡后，在湿的面上轻轻按摩，然后用水冲洗干 。\r\n                                    <br/>注意：洁面乳适合干性或敏感性肌肤。凝胶、泡沫或粉末适合油性、混合性及中性肌肤。 </p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-2.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第三步：爽肤水</p>\r\n                                <p class=\"p2\">功效： 收细毛孔、平衡肌肤酸碱度、为肌肤保湿。如倒在化妆棉上轻拭，可抹走多余死皮。\r\n                                    <br/>用法： 可倒在化妆棉上轻拭面部，或用手将爽肤水轻拍面上。\r\n                                    <br/>注意:所有肌肤都需要这个步骤，敏感肌肤则最好避免使用化妆棉。</p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-3.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第四步：面膜（早上护肤这一步骤可以省去）</p>\r\n                                <p class=\"p2\">功效：作为面部深层护理的程序，可以每天使用作密集护理，或每星期使用两至三次。\r\n                                    <br/>用法： 将凝胶或乳霜面膜涂在洁净的脸上，十至十五分钟后用水冲干净。片装面膜同样在洁面后使用，敷在面上十五分钟后\r\n                                    撕走，使用后可以选择将精华轻轻按摩到面上直至吸收，或用清水冲洗。</p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-4.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第五步：眼部精华素、眼部凝胶、眼霜 </p>\r\n                                <p class=\"p2\">功效：眼部肌肤是全身最薄的肌肤，因此需要特别小心护理，不要将面霜当眼霜涂，因为可能会引起敏感或油脂粒。\r\n                                    <br/>用法：首先使用眼部精华，再加上眼部凝胶或眼霜，用第四只手指沾一粒米大的份量，轻按在双眼周围。\r\n                                    <br/>注意：眼霜通常减淡皱纹、眼部凝胶通常减淡黑眼圈或改善浮肿，涂眼霜时不要用力擦眼睛，以免皱纹产生。</p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-5.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第六步：精华素</p>\r\n                                <p class=\"p2\">功效：美白、抗衰老、保湿、控油…各种各样的精华素能满足不同的肌肤需要，浓缩的有效成份能有效改善肌肤问题，清爽的凝胶\r\n                                    或液体加速肌肤吸收。\r\n                                    <br/>用法：整面涂均或只集中在需要部位涂上，轻拍以助精华液吸收，除了眼部精华液，否则别把普通面部精华液涂在眼部。\r\n                                   </p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-6.png\" />\r\n                            </div>\r\n                        </div>\r\n                        \r\n                        <div class=\"content-step\">\r\n                            <div class=\"content-step1\">\r\n                                <p class=\"p1\">第七步：保湿霜</p>\r\n                                <p class=\"p2\">功效： 晚上是肌肤修复受损细胞的黄金时间，跟日霜比较，晚霜通常都比较滋润，在湿度较低(如冷气环境)的地方提供保护，防止水\r\n                                    份流失，令肌肤看起来更年轻更幼滑。\r\n                                    <br/>用法：洁面爽肤及涂上精华素后使用</p>\r\n                            </div>\r\n                            <div class=\"content-step2\">\r\n                                <img src=\"Public/Home/image/step-7.png\" />\r\n                            </div>\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n            </div>\r\n', '护肤学堂,测试肤质,如何使用面膜,护肤步骤', '护肤学堂');
INSERT INTO `onethink_content` VALUES ('4', '关于我们', '\r\n<div class=\"txt\">\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">爱膜力全球网络【Amor Global Network】</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content-about\" >\r\n                        <div class=\"logo\" >\r\n                            <img class=\"logo-map\" src=\"Public/Home/image/map.png\" />\r\n                        </div>\r\n\r\n                        <div class=\"introduce\">\r\n\r\n                            <p class=\"p5\"><br />环智国际集团旗下爱膜力（中国）生物科技有限公司致力于健康美丽事业的创新，以提高人类生活质量为己任，为健康美丽事业和人\r\n                                们的生活质量的提高作出应有的贡献。目前，爱膜力面向全球推出【爱膜逆】和【爱发光】品牌系列面膜产品。\r\n                                <br />2014年，与世界品牌设计大师、迪拜塔品牌设计师John Brash强强联手，进一步塑造引领全球护肤文化潮流的品牌形象，以\"专注于全球女性美\r\n                                丽事业\"的领军企业姿态昂首进入充满希望的中国市场。秉承\"用爱成就女性的美丽人生\"的宗旨，爱膜力已拥有分布在全国70多个城市的市场网络，\r\n                                配以完善的服务，赢得了广泛的市场及信誉，成为中国高端面膜的市场领导者。\r\n                                <br />目前，公司总部位于广州，在香港、北京、上海、杭州、成都、武汉、沈阳、济南、长沙、南宁、福州、南京、郑州、昆明、重庆均设立了\r\n                                分公司或办事处，产品销售及服务网络遍布全国各地，更与温哥华、旧金山、维也纳、新西兰南岛、伦敦、日内瓦、新加坡、东南亚、泰国、\r\n                                迪拜等地的展开商务合作。发展至今，爱膜逆的销售网络覆盖全球五大洲80多个国家和地区，在中国拥有70多个城市的市场网络。\r\n                            </p>\r\n\r\n\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">爱膜逆【Amorstory】</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content-about\">\r\n                        <div class=\"logo\" >\r\n                            <img class=\"logo-map\" src=\"Public/Home/image/logo-amor.png\" />\r\n                        </div>\r\n\r\n                        <div class=\"introduce\">\r\n\r\n                            <p class=\"p5\"><br />自始创于新西兰爱膜逆研究中心以来，爱膜逆十年发展，不断创新先进技术，凭着其研发的精致优雅而又奢华的产品享誉全球。\r\n                                发展至今，爱膜逆的所有产品全部来自新西兰国家实验室的前沿科技，凭借其先进的设备和以美国维克森林大学再生医学教授Van Dyke为核心的资\r\n                                深科研团队，保证每一款爱膜逆产品的最高亲肤性及卓越品质。\r\n                                <br />爱膜逆最强大的\"修复奇迹，逆生之素\"便是高活性的活性胶原蛋白和角蛋白，都源自世界上最纯净的土地-----新西兰南岛的臻稀金\r\n                                羊毛及优质牧牛软组织。\r\n                                <br />每一款爱膜逆面膜都有独特的礼盒包装，这蕴含着爱的寓意，这是男性对女性爱的表现，也是女性受宠的最高表现。\r\n                                <br />时光流转，光阴飞逝，岁月开始在脸上刻下斑驳痕迹，事业的成功无法掩住满脸的疲态，昂贵的护肤品和化妆品仍然盖不住衰颓的容颜。\r\n                                爱膜逆许诺，给你一份逆生容颜的岁月奇迹，一份爱的传奇。\r\n                                <br />以\"逆转时光，真爱传奇\"为理念的爱膜逆拥有全球领先的超强肌肤修复能量以及最具活性修复的全球抗衰老尖端科技，让你重返年轻，\r\n                                给你一份真爱的礼物。\r\n                            </p>\r\n\r\n\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n                <div class=\"order\">\r\n                    <div class=\"titles\"> \r\n                        <div class=\"star\">\r\n                            <img class=\"image-star\" src=\"Public/Home/image/star-red.png\" />\r\n                        </div>\r\n                        <div class=\"fonts\" >\r\n                            <span class=\"spanss\">爱发光【I’ve Glow】</span>\r\n\r\n                        </div>\r\n                    </div>\r\n\r\n                    <div class=\"content-about\">\r\n                        <div class=\"logo\" >\r\n                            <img class=\"logo-map\" src=\"Public/Home/image/logo-glow.png\" />\r\n                        </div>\r\n\r\n                        <div class=\"introduce\">\r\n\r\n                            <p class=\"p5\"><br />爱发光采用美国BIO-TECH国家实验室配方，汇聚多名顶级皮肤科研专家科研成果和精力，凭借着其研发的精致细腻而又高性价比的产品享誉全\r\n\r\n球。\r\n                                <br />爱发光最独特的发光能量源——透明质钠酸，能让肌肤瞬间润泽通透，闪亮耀眼。于全球甄选天然植物精萃，带给肌肤最纯净天然的亮丽神采，滋养修护\r\n\r\n。\r\n                                <br />爱发光旨在让年轻的一代\"想秀就秀，想发光就发光，秀出最美的自己，Glow Now！\"让你的肌肤即刻发光发亮，闪耀神采，长效持久。\r\n                                <br />爱发光主张时时刻刻都要秀出最美的自己，活出最真实的自我，让年轻女性更加自信，尽情展现光耀神采，闪耀每分每秒。\r\n                            </p>\r\n\r\n\r\n                        </div>\r\n\r\n\r\n                    </div>\r\n                </div>\r\n\r\n\r\n            </div>\r\n', '爱膜力,爱发光,爱膜逆,公司简介,面膜公司', '環志國際集團旗下爱膜力（中国）生物科技有限公司介绍与品牌介绍。');
INSERT INTO `onethink_content` VALUES ('5', '联系我们', '          <div class=\"txt\">\r\n\r\n                <div class=\"order\">\r\n                    <img class=\"image-global\" src=\"Public/Home/image/logo-global.png\" />\r\n                    <p class=\"p3\">環智國際集團有限公司<br />GLOBAL AWARE INTERNATIONAL GROUP LIMITED </p>\r\n\r\n                    <p class=\"p4\">爱膜力（中国）生物科技有限公司<br />AMOR(CHINA) BIOTECHNOLOGY CO.,LTD\r\n                        <br />地址：广州市天河区天河路208号粤海天河城大厦第31层01-03单元\r\n                        <br />31F TEEM TOWER, 208 TIANHE ROAD, TIANHE DISTRICT, GUANGZHOU, GUANGDONG PROVINCE, P.R.CHINA\r\n                        <br />www.amor9.com\r\n                        <br />客服电话：400 8089 830\r\n                    </p>\r\n\r\n\r\n                </div>\r\n', '联系我们,招商电话,公司地址', '联系我们');
INSERT INTO `onethink_content` VALUES ('6', '隐私政策', '<div class=\"txt\">\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"1\">隐私</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content1\">\r\n			<p class=\"p2\">\r\n				<br />\r\n爱膜力网站尊重您的隐私权并重视您与我们的关系。您访问本网站时应遵守本隐私权政策及我们的使用条款。您访问我们的其他网站时应遵守该其他网站的隐私权政策，我们建议您对其进行查阅。本隐私权政策是关于爱膜力网站（位于www.amory.cn）收集的个人信息，我们如何使用该信息，以及与何人分享该信息的介绍说明。我们的隐私权政策还介绍了我们采取什么措施来保护信息安全以及您如何查看、修改或删除您的个人信息。本政策也解释了您如何拒绝我们对您的个人信息的处理，以及如何拒绝接收我们的产品和服务通讯。 <br />\r\n请注意本隐私政策只适用于向爱膜力网站提供的信息。本政策不适用于任何其他涉及爱膜力的信息或通讯，比如，实物零售店中的爱膜力专柜的通讯。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"2\">信息收集和使用</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content2\">\r\n			<p class=\"p2\">\r\n				<br />\r\n您可以在访问我们的网站时向我们提供您的个人信息。比如，当填写在线调查表或用户登记表，或购买产品时，您可能被要求提供某些信息，如您的联系资料（姓名、电邮地址、邮寄地址及电话号码）、年龄段、性别、护肤/化妆需要及您使用的品牌和产品。当您发出订单时，我们还需要了解您的送货地址和付款地址，信用卡或借记卡号码、发卡公司和有效期。为了保护您的个人身份信息，在本网站登记注册的用户必须输入用户名/电邮地址及密码。 <br />\r\n如果你不希望我们收集任何您的个人信息，请不要向我们提供\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"3\">爱膜力网站对个人信息的使用</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content3\">\r\n			<p class=\"p1\">\r\n				· 推广电邮\r\n			</p>\r\n			<p class=\"p2\">\r\n				<br />\r\n在您同意的情况下，我们可将您提供的信息用于制作及向您发送我们的业务通讯或调查，或其他包含产品信息、彩妆指导或促销的通讯（\"电邮\"）。如果您开始选择收到该类电邮而后来不希望再收到此类电邮，请查阅下面\"您的选择\"段落。即使你不愿意收到此类电邮，您也可以通过邮寄或电话的方式收到爱膜力网站优惠，或从爱膜力接到消息。如果你不希望接到直邮或电话，请查阅下面\"您的选择\"段落。\r\n			</p>\r\n			<p class=\"p1\">\r\n				· 短信\r\n			</p>\r\n			<p class=\"p2\">\r\n				<br />\r\n根据您的选择，我们可以对您提供的手机号码生成并发送关于产品和活动信息、彩妆指导或促销的通讯（\"短信\"）。爱膜力并不对这些短信收费，但您的手机服务商可能会向您收取短消息发送和/或接收费用及通讯费，以及手机服务商按其他标准收取的费用。如果您开始选择接收此类短信而后来决定不再接收，请查阅下面\"您的选择\"段落。\r\n			</p>\r\n			<p class=\"p1\">\r\n				· 印刷材料\r\n			</p>\r\n			<p class=\"p2\">\r\n				<br />\r\n根据您的选择，我们可以对您提供的家庭地址发送关于产品和活动信息、彩妆指导或促销的印刷通讯（\"印刷材料\"）。 <br />\r\n如果您不希望收到以上来自网站的沟通信息, 您可以在帐号注册时, 取消勾选收到该类电邮,短信、印刷材料等通讯。如果您开始选择收到该类通讯而后来不希望再收到此类通讯，请查阅下面\"您的选择\"即使你不愿意收到此类通讯，您也可以通过邮寄或电话的方式收到爱膜力中国在线的优惠或消息。如果你不希望接到直邮或电话，请查阅下面\"您的选择\"段落。\r\n			</p>\r\n			<p class=\"p1\">\r\n				· 为您服务的通讯\r\n			</p>\r\n			<p class=\"p2\">\r\n				<br />\r\n如果您选择向我们提供联系信息，我们将以包括电邮在内的任何方式向您发出有关网站的服务通告和密码取回通知，并就您的客户服务请求或您关于订单的问题与您联系。比如，所有注册用户都会收到一份欢迎电邮以便确认注册。此类通讯的目的是为更好的为您服务，解答您的疑问，和提供爱膜力网站对其客户进行的高水准服务。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"4\">个性化服务</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content4\">\r\n			<p class=\"p2\">\r\n				<br />\r\n<br />\r\n我们可能利用您的个人信息向您提供个性化网站服务和使用。比如，我们会向您建议您可能会特别感兴趣的产品。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"5\">特别活动、问卷和调查</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content5\">\r\n			<p class=\"p2\">\r\n				<br />\r\n爱膜力网站有时会赞助特别活动（如比赛、抽奖或其他活动）、问卷和调查。关于这些活动中您提供的个人信息的使用，您将看到促销活动的特别规则的解释。我们强烈建议您在参与促销活动前查阅有关规则。如果有关特别活动、问卷或调查不适用特别规则，个人信息的处理适用本隐私权政策和上述目的。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"6\">雇佣关系</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content6\">\r\n			<p class=\"p2\">\r\n				<br />\r\n如果您向我们提供有关雇佣信息，如简历，我们会对此类个人信息保密，并只在考虑与您的目前或将来的与我们或我们的关联企业的雇佣机会时依此信息联系您。\"关联方\"是指一家通过一个或多个中间人直接或间接控制我公司或被我公司控制，或与我公司共同受到控制的个人或实体。我们会保留您的信息以便日后就有关雇佣机会与您联系，直到您告知不再希望我们保留您的信息。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"7\">使我们向您提供个性化网站服务的技术</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content7\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们使用各种技术收集您访问我们网站的信息以便改善您的使用，并使您访问我们网站的体验个性化。 比如，我们会收集数字IP地址以便确认可能指明您所处的地理位置的电脑或设备。有些情况下，我们会将这些技术与您在本网站上提供信息相结合。这些技术会提供各种信息，包括您是否以前曾访问我们的网站。这些技术也可使得您保存您的偏好。下面将详细介绍各种技术。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"8\">网站标记和跟踪链接</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content8\">\r\n			<p class=\"p2\">\r\n				<br />\r\n网站标记（也称为净图象和像素标签），跟踪链接和/或类似技术由几行代码构成，内嵌于我们网站的网页中。他们经常与cookies合并使用，且本网站的用户通常不会看到。网站标记可以向第三方（比如我们的服务提供者）传递信息，并可用于跟踪客户对某些广告的反应，以便更好的设计有针对性的互动广告，并改善客户支持和可用性。如果你拒绝我们的cookies（见以下\"cookies\"段落）, 您将阻止网站标记对您的信息传递，您可能不能使用某些网站功能。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"9\">COOKIES</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content9\">\r\n			<p class=\"p2\">\r\n				<br />\r\n浏览器cookies是您访问我们的网站时在您的计算机硬盘上留下的少量文本。Flash cookies 与浏览器cookies相似，只是前者可以存储比简单文本更复杂的数据资料，并存贮在您的浏览器而非硬盘上。 <br />\r\n您可以用您的浏览器和/或您浏览器上的插件（比如flash）通知您或自动拒绝cookies。 如果您拒绝我们的cookies, 您还可以访问本网站，但可能不能使用某些功能。临时cookies只用于您的购物方便，下订单后临时cookie就会过期。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"10\">我们分享的信息和分享者</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content10\">\r\n			<p class=\"p2\">\r\n				<br />\r\n除\"业务转让\"段落中[链接]提到的情况，或第三方是我们指定的对您销售并送货的经销商的情况之外，未经您的同意，我们不会将您的个人信息提供给第三方供其向您推广他们的产品或服务。除本条规定之外，我们不出售或以其他方式泄漏网站访客的个人信息。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"11\">爱膜力公司</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content11\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们可与我们分销及营销爱膜力产品的关联公司（\"爱膜力公司\"）共享您的个人信息。爱膜力公司可以遵照本隐私权政策使用该等信息，包括，在您同意后发送给您包括产品信息、彩妆指导和促销的电子邮件。如果您不希望我们与爱膜力公司分享您的个人信息，请不要将您的信息提供给我们。在这种情况下，我们将不能向您提供爱膜力网站的优惠。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"12\">第三方</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content12\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们可聘请其他公司和个人遵照本隐私权政策代表我们履行职责。比如数据分析公司、客户支持专业人员、电子邮件供应商、网络服务器公司及后勤服务公司（比如协调邮寄的公司等）。我们为了让这些第三方履行其职责，可能向其提供其所需的客户个人信息，但其使用这些资料时不可为任何其他目的使用这些资料，而且这些第三方应当遵守本隐私权政策。请注意，您在网站上订购的产品都将从我们指定的经销商处购买和发货。为其销售、送货和发送账单之便利，我们会将您的个人信息提供给经销商。经销商有合同义务禁止其在履行向您销售、送货、发送账单和对您提供相关服务的义务的必要范围之外使用客户的个人信息。此外，在一些情况下，我们可能征求您的意见是否将您的个人信息透露给第三方，如活动或促销的共同赞助者。如果您同意，我们将把您的个人信息透露给这些第三方供其为自己的目的使用，他们将遵守各自的隐私政策。 <br />\r\n随着我们发展业务的需要，我们可能会出售某些资产。在这些交易中，用户信息，包括个人信息，属于被转让的资产范畴。您在网站上提交各人信息时已经同意您的数据在这种情况下可被转让。您可以选择不将您的信息随着资产而转让，请通过\"您的选择\"中的方式联系我们。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"13\">业务转让</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content13\">\r\n			<p class=\"p2\">\r\n				<br />\r\n随着我们发展业务的需要，我们可能会出售某些资产。在这些交易中，用户信息，包括个人信息，属于被转让的资产范畴。您在\"网站\"上提交各人信息时已经同意您的数据在这种情况下可被转让。您可以选择不将您的信息随着资产而转让，请通过\"您的选择\"中的方式联系我们。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"14\">遵守法律</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content14\">\r\n			<p class=\"p2\">\r\n				<br />\r\n为遵守有关法律、法规、法律程序或政府的要求，我们可披露所需信息。另外，若有必要，为避免人身伤害、经济损失或有关潜在或现时的非法活动，我们可以披露任何所需信息。将数据转移至其他国家 <br />\r\n根据本隐私权政策取得您的个人信息和包含您个人信息的数据库的关联方、爱膜力公司或第三方可能位于中国、美国或其他国家，这些国家会对个人信息的法律保护程度不同。无论其位于何处，所有获得您的个人信息的关联方，爱膜力公司或第三方都应遵守本隐私权政策所列的隐私保护声明。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"15\">儿童隐私</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content15\">\r\n			<p class=\"p2\">\r\n				<br />\r\n如果您未满18岁，您可以浏览我们的网站，但不能向我们提供您的个人信息。也就是说，您不能注册或购买产品。本网站不是为未满18岁人士设计，我们不会在明知的情况下收集任何未满18岁人士的个人信息。如果我们得知我们不慎获得未满18岁访问者的个人信息，我们会从记录中将其删除。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"16\">如何保护个人信息</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content16\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们对本网站采取合理的安全措施以避免未经授权的披露、使用、修改或破坏您通过本网站提供的个人信息。鉴于您通过公共因特网访问我们的网站，我们通过一个开放的网络即因特网收集您提供的个人信息，而该开放网络如果被骇客袭击，您的个人信息可能被未授权的第三方看到和使用。如果您对我们网站的安全有任何问题，可以发送电邮至 amory@exmail.qq.com。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"17\">隐私权政策更新</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content17\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们可不时修改本隐私权政策。如果我们决定更改我们的隐私权政策，我们将在此公布经修改的政策。我们建议您定期查看本隐私权政策。您可以在本页顶部找到本隐私政策的生效日。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"18\">更新您的资料</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content18\">\r\n			<p class=\"p2\">\r\n				<br />\r\n您可以点击此处或发送电子邮件至amory@exmail.qq.com审阅、更改或要求删除您的个人信息。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"19\">退订和管理您的偏好</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content19\">\r\n			<p class=\"p2\">\r\n				<br />\r\n您可以选择是否接受我们发出的电邮、短信、印刷资料等通讯。您可点击您收到的我们每封电子邮件底部的\"取消订阅\"链接，或可以发送电子邮件至amory@exmail.qq.com随时更改您的选择。您可以发送电子邮件至amory@exmail.qq.com退订手机短信，也可以发送电子邮件至amory@exmail.qq.com从而选择不收到我们的邮件或电话/手机通讯及注明您的偏好。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\" id=\"20\">意见</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content com\" id=\"content20\">\r\n			<p class=\"p2\">\r\n				<br />\r\n我们采取了大量措施，确保您对我们网站的访问顺利，并让您的隐私权始终得到尊重。如果您对我们的隐私权保护措施有任何质疑、意见或担心，您可以发送电子邮件至amory@exmail.qq.com。如果您对短信有任何疑问，也可以发送电子邮件至amory@exmail.qq.com。 <br />\r\n本文 在全世界范围内的版权为爱膜力（中国）生物科技有限公司所有\r\n			</p>\r\n		</div>\r\n	</div>\r\n</div>', '隐私政策', '隐私政策');
INSERT INTO `onethink_content` VALUES ('7', '品牌资讯', '<div class=\"txt\">\r\n	<div class=\"order-brand\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">爱发光面膜系列产品强势进驻美国市场和东南亚市场！　　&gt;&gt;</span> <span class=\"spantt\">2015.04.27</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-about\">\r\n			<div class=\"logo-brand\">\r\n				<img class=\"brand-image\" src=\"/Public/Home/image/people.png\" alt=\"模特\" /> \r\n			</div>\r\n			<div class=\"introduce\">\r\n				<p class=\"p2\">\r\n					<br />\r\n2015年4月27日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜正式进驻美国市场及东南亚市场。 <br />\r\n自从2015年4月20日，爱发光面膜系列产品全面上线，便获得海内外各个国家地区的广大消费者的好评，一度出现旗舰门店供货不足，\r\n                                供不应求的场面。<br />\r\n顺应着这样的爱发光抢购热潮，4月24日上午9时，爱发光系列面膜产品发言人对外宣称爱发光系列面膜强势进驻美国\r\n                                华盛顿和洛杉矶等多个城市，此外，爱发光系列面膜还成功开拓了东南亚地区的市场。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-brand\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">爱发光面膜系列产品全面上线！　　&gt;&gt;</span> <span class=\"spantt\">2015.04.24</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-about\">\r\n			<div class=\"logo-brand\">\r\n				<img class=\"brand-image\" src=\"/Public/Home/image/box-black.png\" alt=\"爱发光面膜\" /> \r\n			</div>\r\n			<div class=\"introduce\">\r\n				<p class=\"p2\">\r\n					<br />\r\n2015年4月24日，爱膜力（中国）生物科技有限公司旗下产品，爱发光品牌系列面膜全面上线。 <br />\r\n爱发光系列面膜采用美国BIO-TECH国家实验室配方，汇聚多名顶级皮肤科研专家科研成果和精力，凭借着其\r\n                                研发的精致细腻而又高性价比的产品在短短时间便享誉全球。<br />\r\n爱发光品牌系列面膜旨在让年轻的一代\"想秀就秀，\r\n                                想发光就发光，秀出最美的自己，Glow Now！\"其理念一经传达，便受到广大8090后女性的热烈追捧。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-brand\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">爱发光面膜系列产品新闻发布会成功召开！　　&gt;&gt;</span> <span class=\"spantt\">2015.04.20</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-about\">\r\n			<div class=\"logo-brand\">\r\n				<img class=\"brand-image\" src=\"/Public/Home/image/logo-glow-s.png\" alt=\"爱发光logo\" /> \r\n			</div>\r\n			<div class=\"introduce\">\r\n				<p class=\"p2\">\r\n					<br />\r\n2015年4月20日，爱膜力（中国）生物科技有限公司成功召开关于爱发光品牌系列面膜的新闻发布会。 <br />\r\n4月27号当天，爱膜力（中国）生物科技有限公司高层，总裁沈海航先生、执行董事袁莹女士等领导均有出席发布会现场。 <br />\r\n在该发布会上，沈总裁对于爱发光系列面膜取得的巨大成功，并且成功在短短时间就打开了广阔的海外市场，这一现象作\r\n                                出了合理恰当的分析。此外，沈总裁给出了关于爱发光品质的保证，也对广大的支持者表达了感谢之情。 <br />\r\n多家媒体以及参与发布会的商家都对爱发光面膜系列产品表示了肯定和美好的展望，更有多个商家当场与爱膜力（中国）\r\n                                生物科技有限公司签下了爱发光系列产品的订单。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '品牌资讯', '品牌资讯');
INSERT INTO `onethink_content` VALUES ('8', '邮件订阅', '', '邮件订阅,爱发光订阅', '邮件订阅');
INSERT INTO `onethink_content` VALUES ('9', '合作加盟', '<div class=\"txt\">\r\n	<div class=\"order-title\">\r\n		<span class=\"spanss\">合作伙伴申请流程</span> <span><br />\r\npartners application process</span> \r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step01\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-1.png\" alt=\"1\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step00\">\r\n			<div class=\"order-step2\">\r\n				<div class=\"step2-kuang1\">\r\n					<span class=\"spanss\">填写合作伙伴申请表发送到<br />\r\n</span> <span class=\"spanss\">1520512568@qq.com邮箱</span> \r\n				</div>\r\n			</div>\r\n			<div class=\"order-step3\">\r\n				<img class=\"application-1\" src=\"/Public/home/image/application-1.png\" alt=\"邮箱\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step02\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-2.png\" alt=\"2\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step00\">\r\n			<div class=\"order-step2\">\r\n				<div class=\"step2-kuang2\">\r\n					<span class=\"spanss\">扫描以下资料至**邮箱<br />\r\n公司资质，<br />\r\n营业执照，<br />\r\n组织机构代码证，<br />\r\n税务登记证复印件，<br />\r\n合作伙伴身份证复\r\n印件，<br />\r\n并加盖公章扫描至1520512568@qq.com邮箱</span> \r\n				</div>\r\n			</div>\r\n			<div class=\"order-step3\">\r\n				<img class=\"application-2\" src=\"/Public/home/image/application-2.png\" alt=\"邮箱\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step02\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-3.png\" alt=\"3\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step00\">\r\n			<div class=\"order-step2\">\r\n				<div class=\"step2-kuang3\">\r\n					<span class=\"spanss\">资料审核:5个工作日</span> \r\n				</div>\r\n			</div>\r\n			<div class=\"order-step3\">\r\n				<img class=\"application-3\" src=\"/Public/home/image/application-3.png\" alt=\"等待\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step02\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-4.png\" alt=\"4\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step00\">\r\n			<div class=\"order-step2\">\r\n				<div class=\"step2-kuang1\">\r\n					<span class=\"spanss\">加盟保证金复印件扫描至<br />\r\n1520512568@qq.com邮箱</span> \r\n				</div>\r\n			</div>\r\n			<div class=\"order-step3\">\r\n				<img class=\"application-1\" src=\"/Public/home/image/application-4.png\" alt=\"邮箱\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step02\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-5.png\" alt=\"5\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step00\">\r\n			<div class=\"order-step2\">\r\n				<div class=\"step2-kuang3\">\r\n					<span class=\"spanss\">审核通过</span> \r\n				</div>\r\n			</div>\r\n			<div class=\"order-step3\">\r\n				<img class=\"application-3\" src=\"/Public/home/image/application-5.png\" alt=\"通过\" /> \r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order-step\">\r\n		<div class=\"order-step002\">\r\n			<div class=\"order-step1\">\r\n				<img class=\"star1\" src=\"/Public/home/image/star-6.png\" alt=\"6\" /> \r\n			</div>\r\n		</div>\r\n		<div class=\"order-step000\">\r\n			<div class=\"last\">\r\n				<span class=\"spanss\">完成</span> \r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '合作伙伴,申请流程,申请教程', '如何申请作为爱发光合作伙伴的申请流程与教程。');
INSERT INTO `onethink_content` VALUES ('10', '品牌概况', '<div class=\"txt\">\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">我们认为</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-about\">\r\n			<p class=\"p2\">\r\n				<br />\r\n又想秀就秀，想发光就发光，大胆秀出光采，GLOW NOW。 <br />\r\n我们一样，爱美丽，爱追求关注，爱展现自己。 <br />\r\n爱发光一直都赞同\"对就去做，美就要秀\"的精神，致力开发能让年轻女性更加自信闪耀的护肤品——发光面膜。每一片爱发光面膜\r\n                            都饱含一整支25毫升高活性精华液，让你加倍自信，尽情展现光耀神采，闪耀每分。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">顶级科研成果</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-epitomize\">\r\n			<div class=\"epitomize-image\">\r\n				<img class=\"image-11\" src=\"/Public/Home/image/image-11.png\" alt=\"BIO-TECH\" /> \r\n			</div>\r\n			<div class=\"epitomize-font\">\r\n				<p class=\"p2 p-fonts\">\r\n					爱发光采用美国BIO-TECH国家实验室配方，汇聚多名顶级皮肤科研专家科研成果和精力，拥有全球领先的顶尖技术和设备。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">独特精华原料</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-epitomize\">\r\n			<div class=\"epitomize-image\">\r\n				<img class=\"image-11\" src=\"/Public/Home/image/image-1.png\" alt=\"透明质钠酸\" /> \r\n			</div>\r\n			<div class=\"epitomize-font\">\r\n				<p class=\"p2 p-fonts1\">\r\n					爱发光系列产品最独特的发光能量源——透明质钠酸，能让肌肤瞬间润泽通透，闪亮耀眼。爱发光于全球甄选顶级天\r\n                                然植物精萃，保加利亚玫瑰花，北美西印度群岛的库拉索芦荟，地中海长角豆籽，墨西哥的扭刺仙人掌等植物精华提取物，能带给肌肤最纯净\r\n                                天然的闪亮神采，滋养修护。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">定位</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-about\">\r\n			<p class=\"p2\">\r\n				<br />\r\n爱发光的定位于年轻时尚的女性，她们青春无限，活力洋溢，她们渴望成为世界的焦点。爱发光就是让她们发光发亮，神采飞扬，让\r\n                            她们本就青春的肤色更加完美无暇，闪亮熠然，让她们能够更加勇敢自信地秀出最美的自己。<br />\r\n我们，旨在成为年轻一族首选的面膜品牌。\r\n			</p>\r\n		</div>\r\n	</div>\r\n	<div class=\"order\">\r\n		<div class=\"titles\">\r\n			<div class=\"star\">\r\n				<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n			</div>\r\n			<div class=\"fonts\">\r\n				<span class=\"spanss\">产品声明</span> \r\n			</div>\r\n		</div>\r\n		<div class=\"content-epitomize1\">\r\n			<p class=\"p2\">\r\n				<br />\r\n旨在让女性成为闪亮耀眼，万众瞩目的主角的面膜品牌\r\n			</p>\r\n			<div class=\"cell-1\">\r\n				<p class=\"p1 p1-fonts\">\r\n					1. 采用天然成分，追求健康之美\r\n				</p>\r\n				<p class=\"p2\">\r\n					不含有争议的化学成分，沿革挑选使用植物、花、果实等得天然提取成分、利用亲和皮肤的自然原料开发产品。\r\n				</p>\r\n			</div>\r\n			<div class=\"cell-2\">\r\n				<p class=\"p1 p1-fonts\">\r\n					2. 浓缩及配合天然成分，扩大护肤功效\r\n				</p>\r\n				<p class=\"p2\">\r\n					采用天然成分进行高浓度配合，为皮肤传达成分具有的功效，而不使用化学合成成分。\r\n				</p>\r\n			</div>\r\n			<div class=\"cell-2\">\r\n				<p class=\"p1 p1-fonts\">\r\n					3. 不含有害成分\r\n				</p>\r\n				<p class=\"p2\">\r\n					不含荧光剂，汞铅，苯酚、氢醌，增稠剂或高分子胶体等对皮肤造成刺激和负担的有害成分。\r\n				</p>\r\n			</div>\r\n			<div class=\"cell-2\">\r\n				<p class=\"p1 p1-fonts\">\r\n					4. 反对做动物实验\r\n				</p>\r\n				<p class=\"p2\">\r\n					不通过动物杀伤实验评估产品安全性，爱发光是爱护自然和动物的天然品牌。\r\n				</p>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>', '爱发光品牌,品牌价值,研究成果,原材料', '爱发光品牌的品牌概况，介绍了爱发光产品的顶级科研成果，独特精华原料，品牌价值。');

-- -----------------------------
-- Table structure for `onethink_document_article`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_document_article`;
CREATE TABLE `onethink_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

-- -----------------------------
-- Records of `onethink_document_article`
-- -----------------------------
INSERT INTO `onethink_document_article` VALUES ('1', '0', '<h1>\r\n	OneThink1.0正式版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong> \r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：OneThink遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>&nbsp;OneThink集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>OneThink开发团队 2013</strong> \r\n</p>', '', '0');

-- -----------------------------
-- Table structure for `onethink_document_download`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_document_download`;
CREATE TABLE `onethink_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';


-- -----------------------------
-- Table structure for `onethink_email`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_email`;
CREATE TABLE `onethink_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名字',
  `xingsi` varchar(255) NOT NULL COMMENT '姓氏',
  `email` varchar(255) NOT NULL COMMENT '电邮',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `city` varchar(255) NOT NULL COMMENT '城市',
  `number` varchar(255) NOT NULL COMMENT '邮政编码',
  `country` varchar(255) NOT NULL COMMENT '国家',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_email`
-- -----------------------------
INSERT INTO `onethink_email` VALUES ('1', 'John', 'mo', '736884783@qq.com', '', '', '', '美国');

-- -----------------------------
-- Table structure for `onethink_file`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_file`;
CREATE TABLE `onethink_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';


-- -----------------------------
-- Table structure for `onethink_footer`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_footer`;
CREATE TABLE `onethink_footer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(255) NOT NULL COMMENT '底部标题',
  `url` text NOT NULL COMMENT '链接',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_footer`
-- -----------------------------
INSERT INTO `onethink_footer` VALUES ('1', '关于我们', 'index.php?s=/home/index/4.html');
INSERT INTO `onethink_footer` VALUES ('2', '联系我们', 'index.php?s=/home/index/5.html');
INSERT INTO `onethink_footer` VALUES ('3', '帮助', 'index.php?s=/home/index/1.html');
INSERT INTO `onethink_footer` VALUES ('4', '私隐政策', 'index.php?s=/home/index/6.html');
INSERT INTO `onethink_footer` VALUES ('5', '法律声明', 'index.php?s=/home/index/2.html');
INSERT INTO `onethink_footer` VALUES ('6', '邮件订阅', 'index.php?s=/home/index/email.html');
INSERT INTO `onethink_footer` VALUES ('7', '粤ICP备14083558号-3', 'http://www.miibeian.gov.cn/state/outPortal/loginPortal.action');
INSERT INTO `onethink_footer` VALUES ('8', 'Copyright © 2014-2015 爱膜力生物科技有限公司版权所有', 'http://www.amor9.com');

-- -----------------------------
-- Table structure for `onethink_hooks`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_hooks`;
CREATE TABLE `onethink_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_hooks`
-- -----------------------------
INSERT INTO `onethink_hooks` VALUES ('1', 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('2', 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', '1', '0', 'ReturnTop');
INSERT INTO `onethink_hooks` VALUES ('3', 'documentEditForm', '添加编辑表单的 扩展内容钩子', '1', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('4', 'documentDetailAfter', '文档末尾显示', '1', '0', 'Attachment,SocialComment');
INSERT INTO `onethink_hooks` VALUES ('5', 'documentDetailBefore', '页面内容前显示用钩子', '1', '0', '');
INSERT INTO `onethink_hooks` VALUES ('6', 'documentSaveComplete', '保存文档数据后的扩展钩子', '2', '0', 'Attachment');
INSERT INTO `onethink_hooks` VALUES ('7', 'documentEditFormContent', '添加编辑表单的内容显示钩子', '1', '0', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('8', 'adminArticleEdit', '后台内容编辑页编辑器', '1', '1378982734', 'EditorForAdmin');
INSERT INTO `onethink_hooks` VALUES ('13', 'AdminIndex', '首页小格子个性化显示', '1', '1382596073', 'SiteStat,SystemInfo,DevTeam');
INSERT INTO `onethink_hooks` VALUES ('14', 'topicComment', '评论提交方式扩展钩子。', '1', '1380163518', 'Editor');
INSERT INTO `onethink_hooks` VALUES ('16', 'app_begin', '应用开始', '2', '1384481614', '');

-- -----------------------------
-- Table structure for `onethink_image`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_image`;
CREATE TABLE `onethink_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_name` varchar(255) NOT NULL COMMENT '图片名',
  `img_url` varchar(255) NOT NULL COMMENT '图片链接',
  `url` text NOT NULL COMMENT '链接',
  `alt` varchar(255) NOT NULL COMMENT '图片描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `onethink_image`
-- -----------------------------
INSERT INTO `onethink_image` VALUES ('1', '净颜面膜', './Public/Home/images/01.jpg', 'index.php?s=/home/product/2.html', '净颜发光面膜');
INSERT INTO `onethink_image` VALUES ('2', '水润面膜', './Public/Home/images/02.jpg', 'index.php?s=/home/product/3.html', '水润发光面膜');
INSERT INTO `onethink_image` VALUES ('3', '焕彩面膜', './Public/Home/images/03.jpg', 'index.php?s=/home/product/1.html', '焕彩发光面膜');

-- -----------------------------
-- Table structure for `onethink_member`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_member`;
CREATE TABLE `onethink_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- -----------------------------
-- Records of `onethink_member`
-- -----------------------------
INSERT INTO `onethink_member` VALUES ('1', 'admin', '0', '0000-00-00', '', '60', '18', '0', '1433904081', '244539020', '1437440523', '1');

-- -----------------------------
-- Table structure for `onethink_menu`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_menu`;
CREATE TABLE `onethink_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_menu`
-- -----------------------------
INSERT INTO `onethink_menu` VALUES ('1', '首页', '0', '1', 'Index/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('2', '内容', '0', '2', 'Article/mydocument', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('3', '文档列表', '2', '0', 'article/index', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('4', '新增', '3', '0', 'article/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('5', '编辑', '3', '0', 'article/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('6', '改变状态', '3', '0', 'article/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('7', '保存', '3', '0', 'article/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('8', '保存草稿', '3', '0', 'article/autoSave', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('9', '移动', '3', '0', 'article/move', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('10', '复制', '3', '0', 'article/copy', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('11', '粘贴', '3', '0', 'article/paste', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('12', '导入', '3', '0', 'article/batchOperate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('13', '回收站', '2', '0', 'article/recycle', '1', '', '内容', '0');
INSERT INTO `onethink_menu` VALUES ('14', '还原', '13', '0', 'article/permit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('15', '清空', '13', '0', 'article/clear', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('16', '用户', '0', '3', 'User/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('17', '用户信息', '16', '0', 'User/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('18', '新增用户', '17', '0', 'User/add', '0', '添加新用户', '', '0');
INSERT INTO `onethink_menu` VALUES ('19', '用户行为', '16', '0', 'User/action', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('20', '新增用户行为', '19', '0', 'User/addaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('21', '编辑用户行为', '19', '0', 'User/editaction', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('22', '保存用户行为', '19', '0', 'User/saveAction', '0', '\"用户->用户行为\"保存编辑和新增的用户行为', '', '0');
INSERT INTO `onethink_menu` VALUES ('23', '变更行为状态', '19', '0', 'User/setStatus', '0', '\"用户->用户行为\"中的启用,禁用和删除权限', '', '0');
INSERT INTO `onethink_menu` VALUES ('24', '禁用会员', '19', '0', 'User/changeStatus?method=forbidUser', '0', '\"用户->用户信息\"中的禁用', '', '0');
INSERT INTO `onethink_menu` VALUES ('25', '启用会员', '19', '0', 'User/changeStatus?method=resumeUser', '0', '\"用户->用户信息\"中的启用', '', '0');
INSERT INTO `onethink_menu` VALUES ('26', '删除会员', '19', '0', 'User/changeStatus?method=deleteUser', '0', '\"用户->用户信息\"中的删除', '', '0');
INSERT INTO `onethink_menu` VALUES ('27', '权限管理', '16', '0', 'AuthManager/index', '0', '', '用户管理', '0');
INSERT INTO `onethink_menu` VALUES ('28', '删除', '27', '0', 'AuthManager/changeStatus?method=deleteGroup', '0', '删除用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('29', '禁用', '27', '0', 'AuthManager/changeStatus?method=forbidGroup', '0', '禁用用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('30', '恢复', '27', '0', 'AuthManager/changeStatus?method=resumeGroup', '0', '恢复已禁用的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('31', '新增', '27', '0', 'AuthManager/createGroup', '0', '创建新的用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('32', '编辑', '27', '0', 'AuthManager/editGroup', '0', '编辑用户组名称和描述', '', '0');
INSERT INTO `onethink_menu` VALUES ('33', '保存用户组', '27', '0', 'AuthManager/writeGroup', '0', '新增和编辑用户组的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('34', '授权', '27', '0', 'AuthManager/group', '0', '\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组', '', '0');
INSERT INTO `onethink_menu` VALUES ('35', '访问授权', '27', '0', 'AuthManager/access', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('36', '成员授权', '27', '0', 'AuthManager/user', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('37', '解除授权', '27', '0', 'AuthManager/removeFromGroup', '0', '\"成员授权\"列表页内的解除授权操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('38', '保存成员授权', '27', '0', 'AuthManager/addToGroup', '0', '\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)', '', '0');
INSERT INTO `onethink_menu` VALUES ('39', '分类授权', '27', '0', 'AuthManager/category', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('40', '保存分类授权', '27', '0', 'AuthManager/addToCategory', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('41', '模型授权', '27', '0', 'AuthManager/modelauth', '0', '\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('42', '保存模型授权', '27', '0', 'AuthManager/addToModel', '0', '\"分类授权\"页面的\"保存\"按钮', '', '0');
INSERT INTO `onethink_menu` VALUES ('43', '扩展', '0', '7', 'Addons/index', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('44', '插件管理', '43', '1', 'Addons/index', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('45', '创建', '44', '0', 'Addons/create', '0', '服务器上创建插件结构向导', '', '0');
INSERT INTO `onethink_menu` VALUES ('46', '检测创建', '44', '0', 'Addons/checkForm', '0', '检测插件是否可以创建', '', '0');
INSERT INTO `onethink_menu` VALUES ('47', '预览', '44', '0', 'Addons/preview', '0', '预览插件定义类文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('48', '快速生成插件', '44', '0', 'Addons/build', '0', '开始生成插件结构', '', '0');
INSERT INTO `onethink_menu` VALUES ('49', '设置', '44', '0', 'Addons/config', '0', '设置插件配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('50', '禁用', '44', '0', 'Addons/disable', '0', '禁用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('51', '启用', '44', '0', 'Addons/enable', '0', '启用插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('52', '安装', '44', '0', 'Addons/install', '0', '安装插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('53', '卸载', '44', '0', 'Addons/uninstall', '0', '卸载插件', '', '0');
INSERT INTO `onethink_menu` VALUES ('54', '更新配置', '44', '0', 'Addons/saveconfig', '0', '更新插件配置处理', '', '0');
INSERT INTO `onethink_menu` VALUES ('55', '插件后台列表', '44', '0', 'Addons/adminList', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('56', 'URL方式访问插件', '44', '0', 'Addons/execute', '0', '控制是否有权限通过url访问插件控制器方法', '', '0');
INSERT INTO `onethink_menu` VALUES ('57', '钩子管理', '43', '2', 'Addons/hooks', '0', '', '扩展', '0');
INSERT INTO `onethink_menu` VALUES ('58', '模型管理', '68', '3', 'Model/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('59', '新增', '58', '0', 'model/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('60', '编辑', '58', '0', 'model/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('61', '改变状态', '58', '0', 'model/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('62', '保存数据', '58', '0', 'model/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('63', '属性管理', '68', '0', 'Attribute/index', '1', '网站属性配置。', '', '0');
INSERT INTO `onethink_menu` VALUES ('64', '新增', '63', '0', 'Attribute/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('65', '编辑', '63', '0', 'Attribute/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('66', '改变状态', '63', '0', 'Attribute/setStatus', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('67', '保存数据', '63', '0', 'Attribute/update', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('68', '系统', '0', '4', 'Config/group', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('69', '网站设置', '68', '1', 'Config/group', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('70', '配置管理', '68', '4', 'Config/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('71', '编辑', '70', '0', 'Config/edit', '0', '新增编辑和保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('72', '删除', '70', '0', 'Config/del', '0', '删除配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('73', '新增', '70', '0', 'Config/add', '0', '新增配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('74', '保存', '70', '0', 'Config/save', '0', '保存配置', '', '0');
INSERT INTO `onethink_menu` VALUES ('75', '菜单管理', '68', '5', 'Menu/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('76', '导航管理', '68', '6', 'Channel/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('77', '新增', '76', '0', 'Channel/add', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('78', '编辑', '76', '0', 'Channel/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('79', '删除', '76', '0', 'Channel/del', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('80', '分类管理', '68', '2', 'Category/index', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('81', '编辑', '80', '0', 'Category/edit', '0', '编辑和保存栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('82', '新增', '80', '0', 'Category/add', '0', '新增栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('83', '删除', '80', '0', 'Category/remove', '0', '删除栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('84', '移动', '80', '0', 'Category/operate/type/move', '0', '移动栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('85', '合并', '80', '0', 'Category/operate/type/merge', '0', '合并栏目分类', '', '0');
INSERT INTO `onethink_menu` VALUES ('86', '备份数据库', '68', '0', 'Database/index?type=export', '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('87', '备份', '86', '0', 'Database/export', '0', '备份数据库', '', '0');
INSERT INTO `onethink_menu` VALUES ('88', '优化表', '86', '0', 'Database/optimize', '0', '优化数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('89', '修复表', '86', '0', 'Database/repair', '0', '修复数据表', '', '0');
INSERT INTO `onethink_menu` VALUES ('90', '还原数据库', '68', '0', 'Database/index?type=import', '0', '', '数据备份', '0');
INSERT INTO `onethink_menu` VALUES ('91', '恢复', '90', '0', 'Database/import', '0', '数据库恢复', '', '0');
INSERT INTO `onethink_menu` VALUES ('92', '删除', '90', '0', 'Database/del', '0', '删除备份文件', '', '0');
INSERT INTO `onethink_menu` VALUES ('93', '其他', '0', '5', 'other', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('96', '新增', '75', '0', 'Menu/add', '0', '', '系统设置', '0');
INSERT INTO `onethink_menu` VALUES ('98', '编辑', '75', '0', 'Menu/edit', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('104', '下载管理', '102', '0', 'Think/lists?model=download', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('105', '配置管理', '102', '0', 'Think/lists?model=config', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('106', '行为日志', '16', '0', 'Action/actionlog', '0', '', '行为管理', '0');
INSERT INTO `onethink_menu` VALUES ('108', '修改密码', '16', '0', 'User/updatePassword', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('109', '修改昵称', '16', '0', 'User/updateNickname', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('110', '查看行为日志', '106', '0', 'action/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('112', '新增数据', '58', '0', 'think/add', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('113', '编辑数据', '58', '0', 'think/edit', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('114', '导入', '75', '0', 'Menu/import', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('115', '生成', '58', '0', 'Model/generate', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('116', '新增钩子', '57', '0', 'Addons/addHook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('117', '编辑钩子', '57', '0', 'Addons/edithook', '0', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('118', '文档排序', '3', '0', 'Article/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('119', '排序', '70', '0', 'Config/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('120', '排序', '75', '0', 'Menu/sort', '1', '', '', '0');
INSERT INTO `onethink_menu` VALUES ('121', '排序', '76', '0', 'Channel/sort', '1', '', '', '0');

-- -----------------------------
-- Table structure for `onethink_model`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_model`;
CREATE TABLE `onethink_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

-- -----------------------------
-- Records of `onethink_model`
-- -----------------------------
INSERT INTO `onethink_model` VALUES ('4', 'content', '内容页', '0', '', '1', '{\"1\":[\"33\",\"34\"]}', '1:基础', '', '', '', '', 'id:编号\r\nname:名称\r\nid:操作:[EDIT]|编辑', '10', '', '', '1433907376', '1433907452', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('5', 'email', '邮件订阅', '0', '', '1', '{\"1\":[\"35\",\"36\",\"37\",\"38\",\"39\",\"40\",\"41\"]}', '1:基础', '', '', '', '', 'id:编号\r\nname:用户名\r\nid:操作:[EDIT]|编辑', '10', '', '', '1433907574', '1433915993', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('6', 'footer', '页脚', '0', '', '1', '{\"1\":[\"42\",\"43\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1433907664', '1433907685', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('12', 'image', '轮播图', '0', '', '1', '{\"1\":[\"67\",\"65\",\"66\",\"64\"]}', '1:基础', '', '', '', '', 'id:编号\r\nimg_name:图片名\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436345451', '1436345660', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('8', 'product', '产品页', '0', '', '1', '{\"1\":[\"54\",\"55\",\"53\",\"52\",\"51\",\"50\",\"49\",\"48\",\"47\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1433907887', '1433908007', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('9', 'nav', '导航', '0', '', '1', '{\"1\":[\"59\",\"57\",\"58\",\"56\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\nid:操作:[EDIT]|编辑', '10', '', '', '1433907977', '1433907991', '1', 'MyISAM');
INSERT INTO `onethink_model` VALUES ('13', 'article', '文章', '0', '', '1', '{\"1\":[\"72\",\"69\",\"68\"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题\r\ntime:时间\r\nid:操作:[EDIT]|编辑', '10', '', '', '1436770152', '1437101044', '1', 'MyISAM');

-- -----------------------------
-- Table structure for `onethink_nav`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_nav`;
CREATE TABLE `onethink_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `url` text NOT NULL COMMENT '链接',
  `pid` int(10) NOT NULL COMMENT '上级id',
  `sort` int(10) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -----------------------------
-- Records of `onethink_nav`
-- -----------------------------
INSERT INTO `onethink_nav` VALUES ('1', '爱发光面膜', 'index.php', '0', '1');
INSERT INTO `onethink_nav` VALUES ('2', '品牌概况', 'index.php?s=/home/index/10.html', '0', '2');
INSERT INTO `onethink_nav` VALUES ('3', '品牌资讯', 'index.php?s=/home/article/index/p/1.html', '0', '3');
INSERT INTO `onethink_nav` VALUES ('4', '护肤学堂', 'index.php?s=/home/index/3.html', '0', '4');
INSERT INTO `onethink_nav` VALUES ('5', '合作加盟', 'index.php?s=/home/index/9.html', '0', '5');
INSERT INTO `onethink_nav` VALUES ('6', '会员', 'index.php?s=/home/index/register.html', '0', '6');
INSERT INTO `onethink_nav` VALUES ('7', '水润面膜', 'index.php?s=/home/product/3.html', '1', '0');
INSERT INTO `onethink_nav` VALUES ('8', '焕彩面膜', 'index.php?s=/home/product/1.html', '1', '0');
INSERT INTO `onethink_nav` VALUES ('9', '净颜面膜', 'index.php?s=/home/product/2.html', '1', '0');

-- -----------------------------
-- Table structure for `onethink_picture`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_picture`;
CREATE TABLE `onethink_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_picture`
-- -----------------------------
INSERT INTO `onethink_picture` VALUES ('1', '/Uploads/Picture/2015-06-10/5577d8b76805e.jpg', '', '0b46791eecae010d8b8a7ddcfcaa5bec', 'fcf4332b18f94b5392090d46fdf19dce6ebd2e86', '1', '1433917597');
INSERT INTO `onethink_picture` VALUES ('2', '/Uploads/Picture/2015-07-13/55a367e58fe3b.png', '', 'edbd05fa22e22be5328afc64be08e6b0', '4872d0cb47bfbe91d16096ddea529665655cbaad', '1', '1436772325');
INSERT INTO `onethink_picture` VALUES ('3', '/Uploads/Picture/2015-07-14/55a4818641cee.gif', '', 'efcd078624768c2b9b6656cca3581c60', 'b0c2ba96b8e17a80402bc2ee7527962e1f4bb760', '1', '1436844421');
INSERT INTO `onethink_picture` VALUES ('4', '/Uploads/Picture/2015-07-14/55a4b93ab7757.png', '', '4c4c92eb2e149a63be657582056d44c4', '073597a52e92e1e771746250c7158ccaca14c9c8', '1', '1436858682');
INSERT INTO `onethink_picture` VALUES ('5', '/Uploads/Picture/2015-07-14/55a4b9aa1bcc3.png', '', '79164bcdcc508aaae4652ef5704c2e51', '492ce29920b2414b47a06d744233701ab3d3cd8f', '1', '1436858794');
INSERT INTO `onethink_picture` VALUES ('6', '/Uploads/Picture/2015-07-14/55a4bd2f8ccc2.png', '', 'e941d8f1c7362742b53b99c4f3ac2c0e', 'c9906c107332faa2a69b8b848dac97ae23159e48', '1', '1436859693');
INSERT INTO `onethink_picture` VALUES ('7', '/Uploads/Picture/2015-07-15/55a5c2265151c.png', '', '4addb5bb7ca98dce10458fdbb872bd52', '540f8fdced59a491b9172782c70a82eb83a2651f', '1', '1436926502');
INSERT INTO `onethink_picture` VALUES ('8', '/Uploads/Picture/2015-07-16/55a727b5471e3.png', '', '4020b4190ef6f00221f4a95d790eb9e2', '04cefd9eedf29b0fb37aad396fa866e62985d5f1', '1', '1437018031');
INSERT INTO `onethink_picture` VALUES ('9', '/Uploads/Picture/2015-07-16/55a775c3cc62f.gif', '', '99076741c75d617211135dc50f6a10f6', '8abeaa247a6baf24967b335cbb834e90d9986f2a', '1', '1437038019');
INSERT INTO `onethink_picture` VALUES ('10', '/Uploads/Picture/2015-07-20/55acc46a60d81.jpg', '', 'a6e1d3ff452871e5bfe24aabbf0a90ab', 'f51b5e9c0c0b6c2636a48036271a8d687f054611', '1', '1437385834');
INSERT INTO `onethink_picture` VALUES ('11', '/Uploads/Picture/2015-07-20/55acc700a7e1c.png', '', 'de88fabf6e19efc7683f4529c5ec0aed', 'f8d64c21dac1979fe72bea9aaaf52e1667d764a9', '1', '1437386496');
INSERT INTO `onethink_picture` VALUES ('12', '/Uploads/Picture/2015-07-20/55accaa5ad226.jpg', '', '4810ac27bc81c91e28e15d4adc3311b5', '68ffb15503b259f60e22e250cbc35d1e36119381', '1', '1437387428');
INSERT INTO `onethink_picture` VALUES ('13', '/Uploads/Picture/2015-07-20/55accd2ce8438.jpg', '', '75013d68f53ce385d05cb94b8d943711', '41a4f5582c058a40fa7842f4b757919c195a7257', '1', '1437388076');
INSERT INTO `onethink_picture` VALUES ('14', '/Uploads/Picture/2015-07-21/55ad9ff2e44ad.jpg', '', '97de3162ae09f2e69d587f9b41710628', '57890dcc450bc6690221689fd3683c7518afb1b9', '1', '1437442034');
INSERT INTO `onethink_picture` VALUES ('15', '/Uploads/Picture/2015-07-21/55ada2fb6117d.jpg', '', 'c9e48d2d8c415b19738a76032474c57f', 'd42e5ecdf9eae47974948e042fcfccb7aef1eea5', '1', '1437442811');

-- -----------------------------
-- Table structure for `onethink_product`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_product`;
CREATE TABLE `onethink_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `name_en` varchar(50) NOT NULL COMMENT '英文名称',
  `name_ch` varchar(50) NOT NULL COMMENT '中文名称',
  `intro_en` text NOT NULL COMMENT '英文简介',
  `intro_ch` varchar(255) NOT NULL COMMENT '中文简介',
  `logo` varchar(50) NOT NULL COMMENT '图片',
  `quarity` varchar(50) NOT NULL COMMENT '净含量',
  `price` varchar(50) NOT NULL COMMENT '价格',
  `content` text NOT NULL COMMENT '详情',
  `qrcode` varchar(255) NOT NULL,
  `shoplink` varchar(255) NOT NULL,
  `keywords` text NOT NULL COMMENT '关键词',
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- -----------------------------
-- Records of `onethink_product`
-- -----------------------------
INSERT INTO `onethink_product` VALUES ('1', '焕彩发光面膜', 'BRIGHTENING<br />MASK', '焕彩发光面膜', 'With a whole tube (25ml) of essence, which contains the highly active rose extract and the well-chosen moisturizing hyaluronic acid*, it can moisturize and enrich the skin to make the lusterless skin shine with charming youthfulness.', '饱含一整支25毫升精华液，蕴含高活性玫瑰花提取物及精选保湿成分-玻尿酸*，能为                             肌肤注入鲜活保湿能量，丰盈肌肤，有助于为无光肌肤提升亮泽度，焕亮神采，使肌肤洋溢青春活力。', 'Public/Home/image/box-black.png', '25ml/袋 × 6袋', '￥96', '<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">精华成分</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<div class=\"content-prodect1\">\r\n			<div class=\"mask-fonts\">\r\n				<p class=\"p5\">\r\n					<br />\r\n烟酰胺、角蛋白、水解角蛋白、玫瑰花（ROSARUGOSA）提取物、马齿苋（PORTULACAOLERACEA）提取物、金黄洋甘菊（CHRYSANTHELLUM INDICUN）提取物、透明质酸钠\r\n				</p>\r\n				<p class=\"p1\">\r\n					焕彩发光能量源——透明质酸钠\r\n				</p>\r\n				<p class=\"p5\">\r\n					又称玻尿酸*（HA），能吸收与保持其自身重量500～1000倍的水分，透明质酸钠是一款良好的透皮吸收促进剂，从细胞\r\n                                    深处改善皮肤营养新陈代谢，激发皮肤弹性和活力，使肌肤纤维充分舒展，焕亮光采。\r\n				</p>\r\n			</div>\r\n			<div class=\"mask-image\">\r\n				<img class=\"image-1\" src=\"/Public/Home/image/image-1.png\" alt=\"透明质酸钠\" /> \r\n			</div>\r\n		</div>\r\n		<p class=\"p1\">\r\n			全球甄选天然植物精萃带给肌肤最纯净的滋养修护\r\n		</p>\r\n		<div class=\"content-prodect1\">\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-2.png\" alt=\"保加利亚玫瑰花提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n1. 保加利亚玫瑰花提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n保加利亚玫瑰是世界上最昂贵也是最顶级的美容养颜的产品，其提取物是全球顶级的护肤产品，有效舒缓疲态，改善暗\r\n                                        哑，缓解过敏。\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-3.png\" alt=\" 多种马齿苋提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n2. 多种马齿苋提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n富含天然植物精华，有效营养润滑皮肤和促进上皮细胞的生理功能趋于正常，减少死皮和角质层的生成，击褪暗沉，有效去\r\n                                        自由基和抗氧化、唤醒皮肤活力。\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm2\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-4.png\" alt=\"金黄洋甘菊提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n3. 金黄洋甘菊提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n产自英国的洋甘菊具有很好的舒缓、修护敏感肌肤、减少细红血丝、调整肤色不均等作用，改善敏感，缺水，干燥肌肤，增强皮肤弹性。\r\n					</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">产品功效</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n焕亮神采，活力洋溢\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>焕亮肤色：</span>富含保加利亚玫瑰花提取物，有效舒缓疲态，隔绝损伤，彻底改善肌肤暗哑\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>激发活力：</span>透明质酸钠是一款良好的透皮吸收促进剂，从细胞深处改善皮肤营养新陈代谢，激发皮肤弹性和活力\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>深层唤醒：</span>金黄洋甘菊提取物中富含天然植物精华，舒缓、修护敏感肌肤、减少细红血丝、调整肤色不均等作用，唤醒肌肤内在活力\r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">适用肌肤</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n任何肤质，尤其是黯淡肤质\r\n		</p>\r\n		<p class=\"p2\">\r\n			有效改善黯淡肤质，使肌肤从深层焕发活力和光彩\r\n		</p>\r\n		<p class=\"p2\">\r\n			1、长期以来电脑辐射，手机辐射造成肤色黯淡，黑色素沉淀等问题肌肤　　　　　　　　　　　　　\r\n                        3、长期化妆导致肤质失衡，肤色无光泽无活力等状况 <br />\r\n2、晒后肌肤色斑浮现，肤色不均，肤色黯淡等肌肤问题　　　　　　　　　　　　　　　　　　　　\r\n                        4、作息不规律所造成新陈代谢缓慢，细胞疲惫，肤色黯淡等问题肌肤\r\n		</p>\r\n	</div>\r\n</div>', 'hei-er.png', 'http://wd.koudai.com/item.html?itemID=1265638194&p=1', '焕彩发光面膜,爱发光面膜,发光面膜,焕彩面膜', '焕彩发光面膜饱含一整支25毫升精华液，蕴含高活性玫瑰花提取物及精选保湿成分-玻尿酸*，能为 肌肤注入鲜活保湿能量，丰盈肌肤，有助于为无光肌肤提升亮泽度，焕亮神采，使肌肤洋溢青春活力。');
INSERT INTO `onethink_product` VALUES ('2', '净颜发光面膜', 'PORE CLEANSING<br />MASK', '净颜发光面膜', 'With a whole tube (25ml) of essence, which contains aloe barbadensis extract, camellia japonica extract, ceratonia siliqua extract and the well-chosen moisturizing hyaluronic acid*, it can regulate the skin, improve the water-oil balance and remove wastes from inside pores, thereby making the skin shine with charming cleanness.  ', '饱含一整支25毫升精华液，蕴含高活性的库拉索芦荟、山茶花、玉兰花等天然植物提取物及精选保湿成分-玻尿酸*，能养护调理肌肤，改善水油平衡，有助于清扫毛孔中的废物，使肌肤焕现洁净耀眼。', 'Public/Home/image/box-white.png', '25ml/袋 × 6袋', '￥96', '<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">精华成分</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<div class=\"content-prodect1\">\r\n			<div class=\"mask-fonts\">\r\n				<p class=\"p5\">\r\n					<br />\r\n烟酰胺、角蛋白、水解角蛋白、库拉索芦荟（ALOE BARBADENSIS）提取物、山茶（CAMELLIA JAPONICA）花提取物、玉兰花（MAGNOLIA）提取物、透明质酸钠\r\n				</p>\r\n				<p class=\"p1\">\r\n					焕白发光能量源——透明质酸钠\r\n				</p>\r\n				<p class=\"p5\">\r\n					又称玻尿酸*（HA），能吸收与保持其自身重量500～1000倍的水分，改善水油平衡，有助于清扫毛孔\r\n                                    中的废物，使肌肤焕现洁净耀眼。\r\n				</p>\r\n			</div>\r\n			<div class=\"mask-image\">\r\n				<img class=\"image-1\" src=\"/Public/Home/image/image-1.png\" alt=\"透明质酸钠\" /> \r\n			</div>\r\n		</div>\r\n		<p class=\"p1\">\r\n			全球甄选天然植物精萃带给肌肤最纯净的滋养修护\r\n		</p>\r\n		<div class=\"content-prodect1\">\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-5.png\" alt=\"库拉索芦荟提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n1. 库拉索芦荟提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n源自北美西印度群岛的库拉索芦荟提取物对人体的皮肤有良好滋润、美白作用，天然无刺激，对\r\n                                        造成面部疤痕，雀斑，痤疮的肌肤\"垃圾\"进行有效代谢从而深层清洁皮肤，再生新细胞。\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-6.png\" alt=\"玉兰花提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n2. 玉兰花提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n精选优质的玉兰花的提取物具有绝佳的美白功效，纯净天然，防止黑色素产生，而且起到舒缓过敏，安抚肌肤的舒缓美肌效果\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm2\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-7.png\" alt=\"山茶花提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n3. 山茶花提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n能够渗透肌肤底层，淡化黑色素，提亮肤色，同时抵御细菌的侵害，坚持长期使用皮肤就能像山茶\r\n                                        花花瓣一样洁净美丽。\r\n					</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">产品功效</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n强效清洁，焕亮洁净\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>深层清洁：</span>富含库拉索芦荟提取物，其苦寒清热效果能对造成面部疤痕，雀斑，痤疮的肌肤\"垃圾\"进行有效代谢从而深层清洁皮肤\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>强力隔绝：</span>精选优质的玉兰花的提取物具有绝佳的美白功效，纯净天然，有效隔绝辐射并排除肌肤重金属元素\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>焕亮肤色：</span>透明质酸钠是一款良好的透皮吸收促进剂，从细胞深处改善皮肤营养新陈代谢，使得肌肤焕亮新生，洁净剔透\r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">适用肌肤</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n任何肤质，尤其是受到污染的\r\n		</p>\r\n		<p class=\"p2\">\r\n			有效改善因毛孔堵塞而造成的各种肌肤问题，使肌肤从深层焕发活力和光彩\r\n		</p>\r\n		<p class=\"p2\">\r\n			1. 因各种空气污染和化妆残留淤塞毛孔而引起的皮肤黯哑，色斑浮现的问题肌肤　　　　　　　　　　　　　\r\n                        3. 因各种辐射尤其是暴晒后造成肤色黯淡不均，黑色素沉淀的问题肌肤 <br />\r\n2. 长期卸妆清洁不彻底导致肤质失衡，肤色暗黄发黑的问题肌肤　　　　　　　　　　　　　　　　　　　　\r\n                        4. 熬夜或上火后肌肤长痘，新陈代谢，色斑显现的肌肤问题\r\n		</p>\r\n	</div>\r\n</div>', 'bai-er.png', 'http://wd.koudai.com/item.html?itemID=1265644618&p=1', '净颜发光面膜,爱发光面膜,发光面膜,净颜面膜', '净颜发光面膜饱含一整支25毫升精华液，蕴含高活性的库拉索芦荟、山茶花、玉兰花等天然植物提取物及精选保湿成分-玻尿酸*，能养护调理肌肤，改善水油平衡，有助于清扫毛孔中的废物，使肌肤焕现洁净耀眼。');
INSERT INTO `onethink_product` VALUES ('3', '水润发光面膜', 'HYDRATING<br />MASK', '水润发光面膜', 'With a whole tube (25ml) of essence, which contains highly active aloe barbadensis extract, panax ginseng root extract, opuntia streptacantha stem extract and the well-chosen moisturizing hyaluronic acid*, it can relieve the dryness-inducing skin problems and improve the water-oil balance, thereby making the skin shine with charming clearness and moistness.', '饱含一整支25毫升精华液，蕴含高活性的库拉索芦荟、人参根、雪莲花等天然植物提取物及精选保湿成分-玻尿酸*，能修护因干燥而导致的各种肌肤问题，有助于改善水油平衡，使肌肤焕现清澈透亮、莹润水嫩状态。', 'Public/Home/image/box-blue.png', '25ml/袋 × 6袋', '￥96', '<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">精华成分</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<div class=\"content-product1\">\r\n			<div class=\"mask-fonts\">\r\n				<p class=\"p5\">\r\n					<br />\r\n烟酰胺、角蛋白、水解角蛋白、人参（PANAXGINSENG）根提取物、雪莲花（SAUSSUREAINVOLUCRATE）提取物、库拉索芦荟（ALOE BARBADENSIS）提取物、透明质酸钠\r\n				</p>\r\n				<p class=\"p1\">\r\n					莹润发光能量源——透明质酸钠\r\n				</p>\r\n				<p class=\"p5\">\r\n					又称玻尿酸*（HA），能吸收与保持其自身重量500～1000倍的水分，优化水油平衡，使肌肤焕现清澈透亮，莹润水嫩状态。\r\n				</p>\r\n			</div>\r\n			<div class=\"mask-image\">\r\n				<img class=\"image-1\" src=\"/Public/Home/image/image-1.png\" alt=\"透明质酸钠\" /> \r\n			</div>\r\n		</div>\r\n		<p class=\"p1\">\r\n			全球甄选天然植物精萃带给肌肤最纯净的滋养修护\r\n		</p>\r\n		<div class=\"content-product1\">\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/Public/Home/image/image-8.png\" alt=\"雪莲花提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n1. 雪莲花提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n源自博克达山的雪莲花提取物含多种天然抗氧化的成分，可加速皮肤的新陈代谢，减少皱纹，延缓衰老，有效抑制并祛除黑色素沉淀，激发肌底活力\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-3\" src=\"/Public/Home/image/image-9.png\" alt=\"人参根提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n2. 人参根提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n珍贵的人参根提取物可被皮肤缓慢吸收、无任何不良刺激，能促进皮肤血液循环，增加皮肤营养，调节肌肤水油平衡，增强皮肤弹性，使细胞获得新生。\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm2\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-3\" src=\"/Public/Home/image/image-10.png\" alt=\"库拉索芦荟提取物\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n3. 库拉索芦荟提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n源自北美西印度群岛的库拉索芦荟提取物对肌肤有良好的滋养、莹润作用，天然无刺激，使得细胞水润饱满，长效补水。\r\n					</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">产品功效</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n滋润补水，焕现莹润\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>密集补水：</span>源自北朝鲜的人参根提取物，对皮肤没有任何的不良刺激，能扩张皮肤毛细血管，促进皮肤血液循环，调节水油平衡，防止皮肤脱水、硬化、起皱，使细胞获得新生\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>长效保湿：</span>雪莲花提取物含多种天然抗氧化的成分，可加速皮肤的新陈代谢，使肌肤长效保湿，激发肌底活力\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>焕现水润：</span>透明质酸钠能够焕发肌肤生理功能，优化肌肤的水油调节，焕现肌肤莹润光泽\r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/Public/Home/image/star-red.png\" alt=\"星星\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">适用肌肤</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n任何肤质，尤其是干性及中性皮肤\r\n		</p>\r\n		<p class=\"p2\">\r\n			有效修复因干燥而导致的各种肌肤问题，改善水油平衡，使肌肤莹润水嫩\r\n		</p>\r\n		<p class=\"p2\">\r\n			1. 因水油失衡而导致的色斑，痘痘等情况　　　　　　　　\r\n                            2. 皮肤极度干涸缺水，常常感觉到紧绷的肌肤痘痘等情况　　　　　　　　\r\n                            3. 干燥季节或者是大风吹到皮肤引起的干燥感\r\n		</p>\r\n	</div>\r\n</div>', 'lan-er.png', 'http://wd.koudai.com/item.html?itemID=1265648699&p=1', '爱发光面膜,水润发光面膜,发光面膜,补水面膜,怎样补水', '水润发光面膜饱含一整支25毫升精华液，蕴含高活性的库拉索芦荟、人参根、雪莲花等天然植物提取物及精选保湿成分-玻尿酸*，能修护因干燥而导致的各种肌肤问题，有助于改善水油平衡，使肌肤焕现清澈透亮、莹润水嫩状态。');
INSERT INTO `onethink_product` VALUES ('4', '测试面膜', 'ceshiHYDRATING<br> MASK', '测试面膜', 'ceshiHYDRATING MASK', '测试面膜', '1', '25g', '￥96', '<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/glow1/Public/Home/image/star-red.png\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">精华成分</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<div class=\"content-product1\">\r\n			<div class=\"mask-fonts\">\r\n				<p class=\"p5\">\r\n					<br />\r\n烟酰胺、角蛋白、水解角蛋白、人参（PANAXGINSENG）根提取物、雪莲花（SAUSSUREAINVOLUCRATE）提取物、库拉索芦荟（ALOE BARBADENSIS）提取物、透明质酸钠\r\n				</p>\r\n				<p class=\"p1\">\r\n					莹润发光能量源——透明质酸钠\r\n				</p>\r\n				<p class=\"p5\">\r\n					又称玻尿酸*（HA），能吸收与保持其自身重量500～1000倍的水分，优化水油平衡，使肌肤焕现清澈透亮，莹润水嫩状态。\r\n				</p>\r\n			</div>\r\n			<div class=\"mask-image\">\r\n				<img class=\"image-1\" src=\"/glow1/Public/Home/image/image-1.png\" /> \r\n			</div>\r\n		</div>\r\n		<p class=\"p1\">\r\n			全球甄选天然植物精萃带给肌肤最纯净的滋养修护\r\n		</p>\r\n		<div class=\"content-product1\">\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-2\" src=\"/glow1/Public/Home/image/image-8.png\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n1. 雪莲花提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n源自博克达山的雪莲花提取物含多种天然抗氧化的成分，可加速皮肤的新陈代谢，减少皱纹，延缓衰老，有效抑制并祛除黑色素沉淀，激发肌底活力\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm1\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-3\" src=\"/glow1/Public/Home/image/image-9.png\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n2. 人参根提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n珍贵的人参根提取物可被皮肤缓慢吸收、无任何不良刺激，能促进皮肤血液循环，增加皮肤营养，调节肌肤水油平衡，增强皮肤弹性，使细胞获得新生。\r\n					</p>\r\n				</div>\r\n			</div>\r\n			<div class=\"cm2\">\r\n				<div class=\"f1\">\r\n					<img class=\"image-3\" src=\"/glow1/Public/Home/image/image-10.png\" /> \r\n				</div>\r\n				<div class=\"f2\">\r\n					<span><br />\r\n3. 库拉索芦荟提取物：</span> \r\n					<p class=\"p5\">\r\n						<br />\r\n源自北美西印度群岛的库拉索芦荟提取物对肌肤有良好的滋养、莹润作用，天然无刺激，使得细胞水润饱满，长效补水。\r\n					</p>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/glow1/Public/Home/image/star-red.png\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">产品功效</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n滋润补水，焕现莹润\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>密集补水：</span>源自北朝鲜的人参根提取物，对皮肤没有任何的不良刺激，能扩张皮肤毛细血管，促进皮肤血液循环，调节水油平衡，防止皮肤脱水、硬化、起皱，使细胞获得新生\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>长效保湿：</span>雪莲花提取物含多种天然抗氧化的成分，可加速皮肤的新陈代谢，使肌肤长效保湿，激发肌底活力\r\n		</p>\r\n		<p class=\"p2\">\r\n			<span>焕现水润：</span>透明质酸钠能够焕发肌肤生理功能，优化肌肤的水油调节，焕现肌肤莹润光泽\r\n		</p>\r\n	</div>\r\n</div>\r\n<div class=\"order-kuang2\">\r\n	<div class=\"titles\">\r\n		<div class=\"star\">\r\n			<img class=\"image-star\" src=\"/glow1/Public/Home/image/star-red.png\" /> \r\n		</div>\r\n		<div class=\"fonts\">\r\n			<span class=\"spanss\">适用肌肤</span> \r\n		</div>\r\n	</div>\r\n	<div class=\"content-about\">\r\n		<p class=\"p1\">\r\n			<br />\r\n任何肤质，尤其是干性及中性皮肤\r\n		</p>\r\n		<p class=\"p2\">\r\n			有效修复因干燥而导致的各种肌肤问题，改善水油平衡，使肌肤莹润水嫩\r\n		</p>\r\n		<p class=\"p2\">\r\n			1. 因水油失衡而导致的色斑，痘痘等情况　　　　　　　　\r\n                            2. 皮肤极度干涸缺水，常常感觉到紧绷的肌肤痘痘等情况　　　　　　　　\r\n                            3. 干燥季节或者是大风吹到皮肤引起的干燥感\r\n		</p>\r\n	</div>\r\n</div>', '', '', '', '');

-- -----------------------------
-- Table structure for `onethink_ucenter_admin`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_admin`;
CREATE TABLE `onethink_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';


-- -----------------------------
-- Table structure for `onethink_ucenter_app`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_app`;
CREATE TABLE `onethink_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';


-- -----------------------------
-- Table structure for `onethink_ucenter_member`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_member`;
CREATE TABLE `onethink_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- -----------------------------
-- Records of `onethink_ucenter_member`
-- -----------------------------
INSERT INTO `onethink_ucenter_member` VALUES ('1', 'admin', '9a61fb4e63483e628e232dca615936d0', '736884783@qq.com', '', '1433904081', '244537157', '1437440523', '244539020', '1433904081', '1');

-- -----------------------------
-- Table structure for `onethink_ucenter_setting`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_ucenter_setting`;
CREATE TABLE `onethink_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';


-- -----------------------------
-- Table structure for `onethink_url`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_url`;
CREATE TABLE `onethink_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';


-- -----------------------------
-- Table structure for `onethink_userdata`
-- -----------------------------
DROP TABLE IF EXISTS `onethink_userdata`;
CREATE TABLE `onethink_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

