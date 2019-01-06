/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : train

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-04 08:39:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '刘祝蓝');
INSERT INTO `t_admin` VALUES ('2', 'admin1', 'e10adc3949ba59abbe56e057f20f883e', '刘德华');
INSERT INTO `t_admin` VALUES ('3', 'admin2', 'e10adc3949ba59abbe56e057f20f883e', '黄晓明');

-- ----------------------------
-- Table structure for `t_class`
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '培训班名字',
  `tname` varchar(50) NOT NULL COMMENT '培训师名字',
  `cname` varchar(50) NOT NULL COMMENT '课程名称',
  `starttime` date NOT NULL,
  `endtime` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `season` varchar(50) NOT NULL COMMENT '季度',
  `onsale` tinyint(1) NOT NULL DEFAULT '0',
  `createdtime` date NOT NULL,
  `input` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有录入过成绩',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class` VALUES ('17', 'AngularA班', '老师一', 'Angular', '2019-01-12', '2019-01-10', '松山湖大学路1号', '2019年春季', '1', '2019-01-04', '0');
INSERT INTO `t_class` VALUES ('20', 'javaA班', '老师二', 'java零基础入门', '2019-01-11', '2019-02-07', '松山湖大学路1号', '2019年夏季', '1', '2019-01-04', '0');
INSERT INTO `t_class` VALUES ('21', 'javaB班', '老师一', 'java零基础入门', '2019-01-05', '2019-01-03', '松山湖大学路1号', '2020年夏季', '1', '2019-01-04', '0');
INSERT INTO `t_class` VALUES ('22', '小程序A班', '老师一', '小程序', '2019-01-03', '2019-01-05', '松山湖大学路1号', '2019年秋季', '0', '2019-01-04', '0');
INSERT INTO `t_class` VALUES ('23', '软件测试A班', '老师四', '软件测试入门与实战', '2019-01-02', '2019-01-04', '松山湖大学路1号', '2019年夏季', '1', '2019-01-04', '0');

-- ----------------------------
-- Table structure for `t_course`
-- ----------------------------
DROP TABLE IF EXISTS `t_course`;
CREATE TABLE `t_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT ' ' COMMENT '课程名称',
  `category_name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '课程分类名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '课程价格',
  `brief` text NOT NULL COMMENT '课程描述',
  `onsale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '未上架（0）、上架（1）',
  `open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '未开设过课程（0）、开设过课程（1）',
  `picture` varchar(255) NOT NULL DEFAULT ' ' COMMENT '课程图片',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT '权重',
  `createdtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course
-- ----------------------------
INSERT INTO `t_course` VALUES ('47', '区块链', '前沿开发', '399.00', '区块链入门与去中心化应用实战\n本课程将详细为你讲解区块链核心概念与原理，让你快速入门区块链技术；然后基于Python3实现区块链核心原理，加深你对区块链原理的理解；最后带你基于以太坊开发一款去中心化Dapp，让你掌握Dapp开发的整套流程与思想。', '1', '0', 'courseimages/7AB28D579FB14C6298E9A35103A409A6.jpg', '1', '2019-01-01');
INSERT INTO `t_course` VALUES ('48', '人工智能', '前沿开发', '499.00', '本课程首先介绍机器学习与深度学习，包括机器学习的应用、岗位职责，深度学习的等。然后通过讲解神经元及其衍生模型逻辑斯底回归、目标函数、梯度下降等深度学习基础知识。最后通过Tensorflow来实现课程讲解的模型。实战课已经上线：https://coding.imooc.com/class/259.html，欢迎学习', '1', '0', 'courseimages/8D925B4A8C5A4132B40108A3C06178AD.jpg', '1', '2019-01-01');
INSERT INTO `t_course` VALUES ('49', '机器学习', '前沿开发', '599.00', '本课程首先介绍机器学习与深度学习，包括机器学习的应用、岗位职责，深度学习的等。然后通过讲解神经元及其衍生模型逻辑斯底回归、目标函数、梯度下降等深度学习基础知识。最后通过Tensorflow来实现课程讲解的模型。实战课已经上线：https://coding.imooc.com/class/259.html，欢迎学习', '1', '0', 'courseimages/534EACFD50084EA8B3CDCC8B14DEDE97.jpg', '0', '2019-01-01');
INSERT INTO `t_course` VALUES ('50', 'Vue学习', '前端开发', '399.00', 'Vue.js 源码全方位深入解析\n本课程从基础的 Vue源码目录设计、源码构建开始讲起，包括数据驱动，响应式原理，让同学们深入全面理解Vue的实现原理，掌握源码分析技巧，牢固对Vue的使用，斩断BAT进阶拦路虎，快人一步进名企。', '1', '0', 'courseimages/CB17323409CE45D795AA6B2D605373AB.jpg', '1', '2019-01-01');
INSERT INTO `t_course` VALUES ('51', '小程序', '前端开发', '699.00', '微信小程序入门与实战 常用组件API开发技巧项目实战\n随着小程序生态的逐渐形成，小程序越来越多的出现在万千百姓的生活中，日活用户量高达两亿。门槛低、更易学、对个人开发者更加包容开放的特点也吸引了越来越多的人加入到“小程序程序员”的行列，尤其是解决“跨系统开发”这个难题之后，小程序也更多的吸引到了国内外更多的开发者。在本课程中，讲师带你从0开始构建一个功能齐整的小程序，跟进当前潮流技术点，先人一步实现小程序开发组件化。', '1', '1', 'courseimages/6F05CCBCD62B408E9A4C0FB428549AA0.jpg', '2', '2019-01-01');
INSERT INTO `t_course` VALUES ('52', 'java零基础入门', '后端开发', '799.00', '本步骤涵盖Java程序结构、开发环境搭建、常量与变量、运算符、流程控制、数组和方法等Java基础语法的内容。通过本步骤学习，可以掌握Java程序的执行流程，能够编写符合Java语法规则的程序。', '1', '1', 'courseimages/7039AA73997D4032AA84F803DF4AEDEC.jpg', '3', '2019-01-01');
INSERT INTO `t_course` VALUES ('53', '移动开发入门与精通', '移动开发 ', '899.00', '本课程带领大家一步步开发及结合Hybrid将美团外卖实战项目打造成完整的移动Web APP，理解并掌握移动Web开发的基本技能，开发过程中也会讲解到移动web的技巧和遇到问题时解决方法和针对不同场景技术的选型。从而提升对移动端适配以及React 全家桶和组件化开发实战技能，本课程还覆盖了工作中常见移动Web开发问题，并且可以通过课程学习找到对应的技术解决方案。', '1', '0', 'courseimages/33E37DC6FB6D4FC18CBE9EDF49E2ECEE.jpg', '1', '2019-01-01');
INSERT INTO `t_course` VALUES ('54', '大数据', '云计算&大数据', '399.00', '本课程带领大家一步步开发及结合Hybrid将美团外卖实战项目打造成完整的移动Web APP，理解并掌握移动Web开发的基本技能，开发过程中也会讲解到移动web的技巧和遇到问题时解决方法和针对不同场景技术的选型。从而提升对移动端适配以及React 全家桶和组件化开发实战技能，本课程还覆盖了工作中常见移动Web开发问题，并且可以通过课程学习找到对应的技术解决方案。', '1', '0', 'courseimages/D47795F420BD46D4B7FECDE4281E85CB.jpg', '0', '2019-01-01');
INSERT INTO `t_course` VALUES ('55', '软件测试入门与实战', '运维&测试', '299.00', '软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战软件测试入门与实战', '1', '1', 'courseimages/10E12DA570A64656B6AAFCF567ADEE55.jpg', '0', '2019-01-01');
INSERT INTO `t_course` VALUES ('56', 'paython', '后端开发', '599.00', 'paythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonpaythonvpaythonpaythonpaythonpaythonpaython', '1', '1', 'courseimages/70D7430DDA4C4B99AAE8F9ED4E46D977.jpg', '2', '2019-01-02');
INSERT INTO `t_course` VALUES ('57', '啊倒萨', 'ad', '699.00', 'asdhlkashfl啊是多久啦时间到啦开始打折的拉开圣诞节萨里的卡就', '1', '1', 'asd6', '3', '2019-01-04');
INSERT INTO `t_course` VALUES ('58', '算法与数据结构', '云计算&大数据', '599.00', '从数据结构基础到二叉树、红黑树、哈希表，bobo老师精心设计本课程，详细生动的为你讲解数据结构。让你面对数据结构可以学的会、玩的溜。掌握数据结构，完成从“搬砖”到“盖楼”的蜕变，就在此课。各位小伙伴不要错过！', '1', '0', 'courseimages/59F87CA166C84D27A5DD645643CD2896.jpg', '1', '2019-01-04');
INSERT INTO `t_course` VALUES ('59', 'spring', '后端开发', '699.00', 'Spring Boot 2.0深度实践之核心技术篇\n课程系统性地深度探讨 Spring Boot 核心特性，引导小伙伴对 Java 规范的重视，启发对技术原理性的思考，掌握排查问题的技能，以及学习阅读源码的方法和技巧，全面提升研发能力，进军架构师队伍。', '1', '0', 'courseimages/BC4B3F1A259A4011BF3E11168F4731A4.jpg', '1', '2019-01-04');

-- ----------------------------
-- Table structure for `t_course_category`
-- ----------------------------
DROP TABLE IF EXISTS `t_course_category`;
CREATE TABLE `t_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT ' ' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_course_category
-- ----------------------------
INSERT INTO `t_course_category` VALUES ('1', '前沿开发');
INSERT INTO `t_course_category` VALUES ('2', '前端开发');
INSERT INTO `t_course_category` VALUES ('3', '后端开发');
INSERT INTO `t_course_category` VALUES ('4', '移动开发 ');
INSERT INTO `t_course_category` VALUES ('6', '云计算&大数据');
INSERT INTO `t_course_category` VALUES ('7', '运维&测试');

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `createdtime` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('1', '东莞理工学院“1024程序员”获国家商标局批准', '            	在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系\r\n            ', '2019-01-02');
INSERT INTO `t_news` VALUES ('2', '李开复投资：“与这样的团队并肩作战是我的荣誉”', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-01');
INSERT INTO `t_news` VALUES ('3', '中国人保承保符合条件无法就业，赔付全额学费', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');
INSERT INTO `t_news` VALUES ('4', '嘉御基金董事长卫哲：是一家真正将精力用在教研上，把学员放在第一位的教育机构', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-01');
INSERT INTO `t_news` VALUES ('5', '2019年元旦和春节放假通知', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-01');
INSERT INTO `t_news` VALUES ('6', '2019年元旦和春节放假通知', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-01');
INSERT INTO `t_news` VALUES ('7', '嘉御基金董事长卫哲：是一家真正将精力用在教研上，把学员放在第一位的教育机构', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');
INSERT INTO `t_news` VALUES ('8', '中国人保承保符合条件无法就业，赔付全额学费', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');
INSERT INTO `t_news` VALUES ('9', '李开复投资：“与这样的团队并肩作战是我的荣誉”', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');
INSERT INTO `t_news` VALUES ('10', '中国人保承保符合条件无法就业，赔付全额学', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');
INSERT INTO `t_news` VALUES ('11', '东莞理工“1024程序员”获国家商标局批准', '传智播客在2015年向全社会发起成立1024程序员节，经过四年的不间断坚持，终于在2018年02月14日成功注册商标“1024程序员”。商标的注册成功，不仅意味着“1024程序员节”成为真正的节日指日可待，更是对传智播客连续四年举办1024程序员节，通过倡议拒绝加班、寻找程序员、全国骑行撕标签证明自我等活动，逐渐使节日走进大众视野的认可。传智播客也希望能有更多的企业加入我们，共同向社会大众普及1024程序员节，让更多的大众认识改变世界的程序员们，同时也请相关企业尊重商标注册证的法律效力，不要在商标注册的范围内违规使用1024程序员节，如需授权使用请和传智播客联系。', '2019-01-02');

-- ----------------------------
-- Table structure for `t_select`
-- ----------------------------
DROP TABLE IF EXISTS `t_select`;
CREATE TABLE `t_select` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(255) NOT NULL,
  `cid` varchar(50) NOT NULL,
  `pay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：未支付,1：已支付',
  `score` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_select
-- ----------------------------
INSERT INTO `t_select` VALUES ('31', '1546533925180', '20', '1', '0');
INSERT INTO `t_select` VALUES ('32', '1546536041393', '20', '1', '0');
INSERT INTO `t_select` VALUES ('33', '1546536057062', '20', '0', '0');

-- ----------------------------
-- Table structure for `t_student`
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student` (
  `id` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(20) NOT NULL DEFAULT ' ',
  `telephone` varchar(50) NOT NULL DEFAULT ' ' COMMENT '电话号码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student` VALUES ('1546533925180', 'dgut', 'e10adc3949ba59abbe56e057f20f883e', '刘祝蓝', '15625700761');
INSERT INTO `t_student` VALUES ('1546536041393', 'dgut1', 'e10adc3949ba59abbe56e057f20f883e', '刘德华', ' ');
INSERT INTO `t_student` VALUES ('1546536048473', 'dgut2', 'e10adc3949ba59abbe56e057f20f883e', ' 胡歌', ' ');
INSERT INTO `t_student` VALUES ('1546536057062', 'dgut3', 'e10adc3949ba59abbe56e057f20f883e', ' 黄晓明', ' ');
INSERT INTO `t_student` VALUES ('1546536066072', 'dgut4', 'e10adc3949ba59abbe56e057f20f883e', ' ', ' ');
INSERT INTO `t_student` VALUES ('1546536072478', 'dgut5', 'e10adc3949ba59abbe56e057f20f883e', ' ', ' ');

-- ----------------------------
-- Table structure for `t_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `telephone` varchar(50) NOT NULL DEFAULT ' ',
  `brief` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher` VALUES ('1', 'teacher1', 'e10adc3949ba59abbe56e057f20f883e', '老师一', '15625700761', '资深java工程师');
INSERT INTO `t_teacher` VALUES ('2', 'teacher2', 'e10adc3949ba59abbe56e057f20f883e', '老师二', '1380013800', '资深前端工程师');
INSERT INTO `t_teacher` VALUES ('3', 'teacher3', 'e10adc3949ba59abbe56e057f20f883e', '老师三', '15625700761', '资深python工程师');
INSERT INTO `t_teacher` VALUES ('4', 'teacher4', 'e10adc3949ba59abbe56e057f20f883e', '老师四', '15625700761', '资深java工程师');
INSERT INTO `t_teacher` VALUES ('5', 'teacher5', 'e10adc3949ba59abbe56e057f20f883e', '老师五', '15625700761', '资深java工程师');
