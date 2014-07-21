-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: 42.96.145.106    Database: qding
-- ------------------------------------------------------
-- Server version	5.5.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `sex` varchar(100) NOT NULL COMMENT '性别',
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72411 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户收获地址';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_project_relation`
--

DROP TABLE IF EXISTS `address_project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_project_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `address_id` bigint(20) NOT NULL COMMENT '地址ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4093 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_user_relation`
--

DROP TABLE IF EXISTS `address_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_user_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `address_id` bigint(20) NOT NULL COMMENT '收货人ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71404 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='收获地址-用户关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ali_payment_serial`
--

DROP TABLE IF EXISTS `ali_payment_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ali_payment_serial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `payment_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款方式id',
  `serialno` varchar(255) NOT NULL COMMENT '流水号',
  `momeny` varchar(255) NOT NULL DEFAULT '0' COMMENT '账户余额',
  `trandate` varchar(255) NOT NULL COMMENT '交易日期',
  `referno` varchar(255) NOT NULL COMMENT '支付宝交易号',
  `account` varchar(255) NOT NULL COMMENT '支付宝帐号',
  `user_name` varchar(255) NOT NULL COMMENT '用户名称',
  `user_no` varchar(255) NOT NULL COMMENT '用户编号',
  `inprice` varchar(50) DEFAULT NULL COMMENT '收入',
  `outprice` varchar(50) DEFAULT NULL COMMENT '支出',
  `location` varchar(50) NOT NULL DEFAULT '1' COMMENT '交易场所',
  `gorder_name` varchar(255) NOT NULL DEFAULT '' COMMENT '订单名称',
  `paytype` varchar(255) NOT NULL COMMENT '类型',
  `comment` varchar(255) DEFAULT NULL COMMENT '说明',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `isure_at` bigint(20) DEFAULT NULL COMMENT '确认时间',
  `isure_rmk` varchar(1000) DEFAULT NULL COMMENT '确认备注',
  `isure_by` bigint(20) DEFAULT NULL COMMENT '确认人',
  `isure` tinyint(4) DEFAULT '0' COMMENT '是否匹配 0：未匹配，1匹配',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_referno` (`referno`),
  KEY `payment_type_id` (`payment_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收款流水表(payment_serial_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户人ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3102 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='购物车';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart_goods_relation`
--

DROP TABLE IF EXISTS `cart_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) NOT NULL COMMENT '购物车ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `count` int(11) NOT NULL COMMENT '数量',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5605 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='购物车-商品关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_payment`
--

DROP TABLE IF EXISTS `cash_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `gorder_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `publics_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公众号',
  `amount` varchar(255) NOT NULL COMMENT '金额',
  `payment_type` bigint(20) NOT NULL COMMENT '收款方式id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:成功 -1:失败',
  `report` tinyint(4) NOT NULL DEFAULT '0' COMMENT '上报字段 0:未上报, 1:已上报',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cash_payment_payment_type_key` (`payment_type`),
  KEY `gorder_code` (`gorder_code`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='现金收款表(cash_payment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_payment_application`
--

DROP TABLE IF EXISTS `cash_payment_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payment_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) DEFAULT '0' COMMENT '公众号',
  `applicant_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请人id',
  `applicant_at` bigint(20) DEFAULT NULL COMMENT '申请时间',
  `confirm_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款人id',
  `confirm_at` bigint(20) DEFAULT NULL COMMENT '收款时间',
  `amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '总金额',
  `order_from_at` bigint(20) DEFAULT '0' COMMENT '订单开始时间',
  `order_end_at` bigint(20) DEFAULT '0' COMMENT '订单截止时间',
  `gorder_ids` text,
  `gorder_codes` text COMMENT '订单code.存储多个订单',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:未确认. 1:已确认 ',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0:前台->物业财务. 1:物业财务->千丁财务',
  `description` text COMMENT '描述信息',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='现金交款单(cash_payment_application)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_payment_log`
--

DROP TABLE IF EXISTS `cash_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payment_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_payment_id` bigint(20) NOT NULL COMMENT 'cash_payment_id',
  `amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '金额',
  `status` varchar(255) NOT NULL COMMENT '付款状态',
  `description` text NOT NULL COMMENT '描述信息',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL DEFAULT '0',
  `update_at` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cash_payment_id` (`cash_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='现金收款履历表(cash_payment_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_payment_qd_application`
--

DROP TABLE IF EXISTS `cash_payment_qd_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payment_qd_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `cash_payment_application_ids` text,
  `applicant_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '申请人id',
  `applicant_at` bigint(20) NOT NULL COMMENT '申请时间',
  `confirm_by` bigint(20) DEFAULT '0' COMMENT '收款人id',
  `confirm_at` bigint(20) DEFAULT NULL COMMENT '收款时间',
  `amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '总金额',
  `order_from_at` bigint(20) DEFAULT NULL,
  `order_end_at` bigint(20) DEFAULT NULL,
  `gorder_ids` text,
  `gorder_codes` text COMMENT '订单code.存储多个订单',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:未确认. 1:已确认 ',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0:前台->物业财务. 1:物业财务->千丁财务',
  `description` text COMMENT '描述信息',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='现金交款单forQD(cash_payment_qd_application)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cash_payment_qd_application_publics_relation`
--

DROP TABLE IF EXISTS `cash_payment_qd_application_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cash_payment_qd_application_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cash_payment_qd_application_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1014 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='商品分类';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `open_id` varchar(255) NOT NULL,
  `message_id` bigint(255) NOT NULL,
  `content` text,
  `type` int(2) DEFAULT NULL,
  `star` int(2) DEFAULT NULL,
  `send_at` bigint(20) DEFAULT NULL,
  `create_at` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `commissions`
--

DROP TABLE IF EXISTS `commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `fee_amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '订单总金额',
  `actual_amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '实际到账金额 按实际到账金额拆分佣金',
  `commissions_amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '佣金',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:物业佣金. 2:供方佣金. 3:第三方支付佣金(手续费). 4:千丁佣金',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `gorder_code` (`gorder_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='佣金支付表(commissions)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `constants`
--

DROP TABLE IF EXISTS `constants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL COMMENT '常量名称',
  `code` varchar(200) NOT NULL COMMENT '常量编码',
  `type` varchar(200) NOT NULL COMMENT '常量类型',
  `create_by` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate`
--

DROP TABLE IF EXISTS `decorate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serial_id` varchar(45) NOT NULL,
  `user_id` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_mobile` varchar(45) NOT NULL,
  `user_wx_id` varchar(500) NOT NULL,
  `user_wx_name` varchar(45) NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `room_name` varchar(45) NOT NULL,
  `building_id` bigint(20) NOT NULL,
  `building_name` varchar(45) NOT NULL,
  `vender_id` bigint(20) NOT NULL,
  `vender_name` varchar(45) NOT NULL,
  `chargerId` bigint(20) NOT NULL,
  `charger_name` varchar(45) NOT NULL,
  `charger_mobile` varchar(45) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `publics_name` varchar(45) NOT NULL,
  `drawing_count` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `expect_start_date` bigint(20) DEFAULT NULL,
  `expect_check_date` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `user_sex` varchar(100) DEFAULT NULL,
  `area_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate_images_relation`
--

DROP TABLE IF EXISTS `decorate_images_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate_images_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `decorate_id` varchar(45) NOT NULL,
  `image_id` varchar(45) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate_log`
--

DROP TABLE IF EXISTS `decorate_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `decorate_id` bigint(20) NOT NULL,
  `filed` varchar(255) DEFAULT NULL,
  `before_value` varchar(500) DEFAULT NULL,
  `after_value` varchar(500) DEFAULT NULL,
  `status` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate_payment`
--

DROP TABLE IF EXISTS `decorate_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `amount` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `decorate_id` bigint(20) NOT NULL,
  `decorate_serial_id` bigint(20) NOT NULL,
  `expect_refund_date` bigint(20) DEFAULT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate_vender`
--

DROP TABLE IF EXISTS `decorate_vender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate_vender` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `vender_id` bigint(20) NOT NULL COMMENT '供方ID',
  `vender_name` varchar(45) NOT NULL COMMENT '供方名称',
  `is_have_license` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有营业执照( 0：无，1：有)，默认为0',
  `legal_name` varchar(45) NOT NULL COMMENT '法人姓名',
  `legal_id_number` varchar(45) NOT NULL COMMENT '法人身份证号',
  `legal_mobile` varchar(45) NOT NULL COMMENT '法人手机号',
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_id_number` varchar(45) DEFAULT NULL,
  `contact_mobile` varchar(45) DEFAULT NULL,
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建者ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新者ID',
  `short_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='装修供方';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `decorate_vender_user`
--

DROP TABLE IF EXISTS `decorate_vender_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decorate_vender_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vender_id` bigint(20) NOT NULL,
  `vender_name` varchar(45) NOT NULL,
  `user_name` varchar(45) NOT NULL,
  `user_id_number` varchar(45) NOT NULL,
  `user_mobile` varchar(45) NOT NULL,
  `user_mobile1` varchar(45) NOT NULL,
  `user_mobile2` varchar(45) NOT NULL,
  `user_email` varchar(45) NOT NULL,
  `user_qq` varchar(45) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `provider_id` bigint(20) NOT NULL COMMENT '供方ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `publish_name` varchar(200) NOT NULL COMMENT '发布名称',
  `price` varchar(200) NOT NULL COMMENT '价格',
  `original_price` varchar(200) NOT NULL COMMENT '原价',
  `cost_price` varchar(200) DEFAULT NULL COMMENT '成本价',
  `commission_ratio` varchar(10) DEFAULT '0' COMMENT '佣金比例(物业)',
  `count` int(11) NOT NULL COMMENT '数量',
  `img` varchar(200) NOT NULL COMMENT '图片',
  `detail` text NOT NULL COMMENT '摘要',
  `comment` text COMMENT '备注',
  `comment_status` tinyint(4) NOT NULL COMMENT '购买需知状态',
  `publish_start` bigint(20) NOT NULL COMMENT '上架时间',
  `publish_end` bigint(20) NOT NULL COMMENT '下架时间',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`),
  KEY `publish_name` (`publish_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6828 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='商品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_publics_relation`
--

DROP TABLE IF EXISTS `goods_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11770 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder`
--

DROP TABLE IF EXISTS `gorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户人ID',
  `address_id` bigint(20) NOT NULL COMMENT '收货人ID',
  `paddress_id` bigint(20) NOT NULL COMMENT '物业ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `code` varchar(200) NOT NULL COMMENT '编号',
  `total` varchar(200) NOT NULL COMMENT '金额',
  `type` varchar(50) NOT NULL COMMENT '类型',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `gorder_at` bigint(20) NOT NULL COMMENT '下单时间',
  `pay_at` bigint(20) DEFAULT NULL COMMENT '支付时间',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `publics_id` (`publics_id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16478 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder_fees`
--

DROP TABLE IF EXISTS `gorder_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder_fees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_id` bigint(20) DEFAULT NULL COMMENT '订单ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `publics_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '公众号ID',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `paddress_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '物业ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1:应收. 2:实收. 3:实际到账',
  `dueamount` varchar(255) DEFAULT NULL COMMENT '应收金额',
  `payamount` varchar(255) DEFAULT NULL COMMENT '实收金额',
  `fee` varchar(255) DEFAULT NULL COMMENT '金额',
  `payment_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款方式',
  `rating` varchar(255) DEFAULT NULL COMMENT '第三方费率',
  `has_maximum` bigint(20) DEFAULT NULL COMMENT '是否封顶',
  `maximum` varchar(255) DEFAULT NULL COMMENT '封顶额',
  `minimum` varchar(255) DEFAULT NULL COMMENT '最低',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:未对账. 1:对账成功未分佣金. 2:已分佣金',
  `isure_at` bigint(20) DEFAULT NULL COMMENT '确认时间',
  `isure_rmk` varchar(1000) DEFAULT NULL COMMENT '确认备注',
  `isure_by` bigint(20) DEFAULT NULL COMMENT '确认人',
  `isure` tinyint(4) DEFAULT '0' COMMENT '是否匹配 0：未匹配，1匹配',
  `invoice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '索要发票(0 否 1 是)',
  `invoice_type` varchar(20) DEFAULT NULL COMMENT '发票类型',
  `invoice_title` varchar(50) DEFAULT NULL COMMENT '发票抬头',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `payment_type_id` (`payment_type`),
  KEY `gorder_code` (`gorder_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='订单应收实收表(gorder_fees)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder_goods_relation`
--

DROP TABLE IF EXISTS `gorder_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `provider_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '供方ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `publish_name` varchar(200) NOT NULL COMMENT '发布名称',
  `price` varchar(200) NOT NULL COMMENT '价格',
  `original_price` varchar(200) NOT NULL COMMENT '原价',
  `cost_price` varchar(200) DEFAULT NULL COMMENT '成本价',
  `commission_ratio` varchar(10) DEFAULT NULL COMMENT '佣金比例(物业)',
  `count` int(11) NOT NULL COMMENT '数量',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `invoice_noticetimes` int(10) NOT NULL DEFAULT '0' COMMENT '发票通知次数',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `gorder_id` (`gorder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39763 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder_goods_relation_history`
--

DROP TABLE IF EXISTS `gorder_goods_relation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder_goods_relation_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_goods_relation_id` bigint(20) NOT NULL COMMENT 'gorder_goods_relation_id',
  `gorder_id` bigint(20) NOT NULL COMMENT '订单ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `publish_name` varchar(200) NOT NULL COMMENT '发布名称',
  `price` varchar(200) NOT NULL COMMENT '价格',
  `original_price` varchar(200) NOT NULL COMMENT '原价',
  `count` int(11) NOT NULL COMMENT '数量',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `original_path` varchar(45) NOT NULL,
  `big_path` varchar(45) NOT NULL,
  `middle_path` varchar(45) NOT NULL,
  `small_path` varchar(45) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号Hash值',
  `menu` text NOT NULL COMMENT '菜单的Json串',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  PRIMARY KEY (`id`),
  KEY `index_PublicsHash` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=637 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(500) DEFAULT NULL COMMENT '名字',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `decription` varchar(1000) DEFAULT NULL COMMENT '描述',
  `content` text COMMENT '内容',
  `url` varchar(200) DEFAULT NULL COMMENT '链接',
  `img` varchar(200) DEFAULT NULL COMMENT '图片',
  `type` varchar(20) NOT NULL COMMENT '类型 text,msg,multi_msg',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `status` varchar(200) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `index_PublicsHash` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `menu_id` varchar(50) DEFAULT NULL COMMENT '页面ID',
  `url` varchar(1000) DEFAULT NULL COMMENT '模块对应url地址',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父模块ID',
  `type` varchar(50) NOT NULL COMMENT '模块类别',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `index_url` (`url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `msg_queue`
--

DROP TABLE IF EXISTS `msg_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `check_point` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `retry_count` int(11) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `multi_message_relation`
--

DROP TABLE IF EXISTS `multi_message_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multi_message_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `group_id` bigint(20) NOT NULL COMMENT '多图文消息的组ID',
  `mid` bigint(20) NOT NULL COMMENT '消息ID',
  `level` bigint(20) NOT NULL COMMENT '顺序，用来排序',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `index_GroupID` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'NOTICEID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号Hash值（微信名）',
  `title` varchar(500) NOT NULL COMMENT '资讯标题',
  `summary` varchar(1000) NOT NULL COMMENT '摘要',
  `content` text COMMENT '内容',
  `img` varchar(200) DEFAULT NULL COMMENT '摘要图片',
  `template_type` bigint(20) DEFAULT NULL COMMENT '模板消息',
  `status` varchar(200) NOT NULL COMMENT '状态',
  `author` varchar(50) NOT NULL COMMENT '发布者',
  `release_at` bigint(20) NOT NULL COMMENT '发布时间',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_publics_relation`
--

DROP TABLE IF EXISTS `news_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_newsId` (`news_id`),
  KEY `index_publicsId` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `openid`
--

DROP TABLE IF EXISTS `openid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(50) NOT NULL DEFAULT '',
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `open_id_index` (`open_id`),
  KEY `publics_id_index` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16709 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paddress`
--

DROP TABLE IF EXISTS `paddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `address` varchar(200) NOT NULL COMMENT '地址',
  `code` varchar(200) NOT NULL COMMENT '邮编',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4146 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pay_order`
--

DROP TABLE IF EXISTS `pay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pay_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `money` double NOT NULL,
  `order_time` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_file`
--

DROP TABLE IF EXISTS `payment_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_file` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '导入类型 0:数字王府井,1,银行',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='pos收款对账文件导入记录表(payment_file)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_file_fees_details`
--

DROP TABLE IF EXISTS `payment_file_fees_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_file_fees_details` (
  `id` bigint(255) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `file_id` bigint(255) NOT NULL COMMENT '所属文件ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单号',
  `type` tinyint(4) DEFAULT NULL COMMENT '收取/支付',
  `amount` varchar(255) DEFAULT NULL COMMENT '金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_serial_log`
--

DROP TABLE IF EXISTS `payment_serial_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_serial_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `payment_type_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款方式id',
  `mernum` varchar(255) NOT NULL DEFAULT '0' COMMENT '商户号',
  `termid` varchar(255) NOT NULL COMMENT '终端号',
  `trandate` varchar(255) NOT NULL COMMENT '交易日期',
  `trantime` varchar(255) NOT NULL COMMENT '交易时间',
  `referno` varchar(255) NOT NULL COMMENT '交易参考号',
  `batchno` varchar(255) NOT NULL COMMENT '批次号',
  `serialno` varchar(255) NOT NULL COMMENT '流水号',
  `pan` varchar(255) NOT NULL COMMENT '交易卡号',
  `amt` varchar(255) NOT NULL COMMENT '交易金额',
  `trantype` varchar(2) NOT NULL DEFAULT '1' COMMENT '交易类型01 消费，02 撤销',
  `paytype` varchar(2) NOT NULL DEFAULT '1' COMMENT '支付类型 1 刷卡',
  `orderId` varchar(255) NOT NULL COMMENT '订单号',
  `ext1` varchar(255) DEFAULT NULL COMMENT '预留字段1',
  `ext2` varchar(255) DEFAULT NULL COMMENT '预留字段2',
  `sign` varchar(255) DEFAULT NULL COMMENT '数字签名',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `payment_type_id` (`payment_type_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收款流水表(payment_serial_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `rating` varchar(255) NOT NULL DEFAULT '0' COMMENT '第三方费率',
  `has_maximum` bigint(20) DEFAULT NULL COMMENT '是否封顶',
  `maximum` varchar(255) DEFAULT NULL COMMENT '封顶金额',
  `minimum` varchar(255) DEFAULT NULL COMMENT '最低金额',
  `description` text COMMENT '描述信息',
  `type` bigint(20) NOT NULL DEFAULT '1' COMMENT '1: 现金, 2: POS, 3:网银',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='收款方式表(payment_type)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment`
--

DROP TABLE IF EXISTS `pos_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) DEFAULT NULL COMMENT '公众号id',
  `gorder_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `qd_code` varchar(255) DEFAULT NULL COMMENT '千丁支付code',
  `amount` varchar(255) NOT NULL COMMENT '金额',
  `payment_type` bigint(20) NOT NULL COMMENT '收款方式id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:成功 -1:失败',
  `serialno` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `create_at` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `payment_type_id` (`payment_type`),
  KEY `qianding_code` (`qd_code`),
  KEY `gorder_code` (`gorder_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='pos收款表(pos_payment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_log`
--

DROP TABLE IF EXISTS `pos_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_payment_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `pos_payment_id` bigint(20) NOT NULL COMMENT 'pos_payment_id',
  `amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '金额',
  `status` varchar(255) NOT NULL COMMENT '付款状态',
  `serialno` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `description` text NOT NULL COMMENT '描述信息',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pos_payment_id` (`pos_payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos收款履历表(pos_payment_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_reconciliation`
--

DROP TABLE IF EXISTS `pos_payment_reconciliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_payment_reconciliation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `qd_code` varchar(255) NOT NULL COMMENT '千丁支付code',
  `amount` varchar(255) NOT NULL COMMENT '金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1:最终对账. 2:第三方对账. 3:银行对账',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `qianding_code` (`qd_code`),
  KEY `gorder_code` (`gorder_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='pos收款对账表(pos_payment_reconciliation)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pos_payment_serial`
--

DROP TABLE IF EXISTS `pos_payment_serial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_payment_serial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `payment_type` bigint(20) NOT NULL DEFAULT '0' COMMENT '收款方式id',
  `mernum` varchar(255) NOT NULL DEFAULT '0' COMMENT '商户号',
  `termid` varchar(255) NOT NULL COMMENT '终端号',
  `trandate` varchar(255) NOT NULL COMMENT '交易日期',
  `trantime` varchar(255) NOT NULL COMMENT '交易时间',
  `referno` varchar(255) NOT NULL COMMENT '交易参考号',
  `serialno` varchar(255) DEFAULT NULL COMMENT '流水号',
  `pan` varchar(255) NOT NULL COMMENT '交易卡号',
  `amt` varchar(50) NOT NULL DEFAULT '0' COMMENT '交易金额',
  `payamt` varchar(50) DEFAULT '0' COMMENT '结算金额',
  `fees` varchar(50) DEFAULT '0' COMMENT '手续费',
  `trantype` varchar(2) NOT NULL DEFAULT '1' COMMENT '交易类型01 消费，02 撤销',
  `paytype` varchar(2) NOT NULL DEFAULT '1' COMMENT '支付类型 1 刷卡',
  `ext1` varchar(255) DEFAULT NULL COMMENT '预留字段1',
  `ext2` varchar(255) DEFAULT NULL COMMENT '预留字段2',
  `sign` varchar(255) DEFAULT NULL COMMENT '数字签名',
  `create_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `update_at` bigint(20) DEFAULT NULL COMMENT '更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `isure_at` bigint(20) DEFAULT NULL COMMENT '确认时间',
  `isure_rmk` varchar(1000) DEFAULT NULL COMMENT '确认备注',
  `isure_by` bigint(20) DEFAULT NULL COMMENT '确认人',
  `isure` tinyint(4) DEFAULT '0' COMMENT '是否匹配 0：未匹配，1匹配',
  PRIMARY KEY (`id`),
  KEY `payment_type_id` (`payment_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='收款流水表(payment_serial_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `potential`
--

DROP TABLE IF EXISTS `potential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID值',
  `nick` varchar(1000) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(100) DEFAULT '0' COMMENT '性别',
  `type` varchar(100) DEFAULT NULL COMMENT '关注类型',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `fake_id` varchar(200) DEFAULT NULL COMMENT '微信FakeID',
  `open_id` varchar(200) NOT NULL COMMENT '微信OpenID',
  `last_login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户上次登录时间',
  `login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户当前登录时间',
  `update_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `status` int(2) NOT NULL DEFAULT '0',
  `unsubscribe_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `potential_open_id_index` (`open_id`(8)),
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `potential_temp`
--

DROP TABLE IF EXISTS `potential_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potential_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID值',
  `nick` varchar(1000) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(100) DEFAULT '0' COMMENT '性别',
  `type` varchar(100) DEFAULT NULL COMMENT '关注类型',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `fake_id` varchar(200) DEFAULT NULL COMMENT '微信FakeID',
  `open_id` varchar(200) NOT NULL COMMENT '微信OpenID',
  `last_login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户上次登录时间',
  `login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户当前登录时间',
  `update_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `status` int(2) NOT NULL DEFAULT '0',
  `unsubscribe_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `potential_open_id_index` (`open_id`) USING BTREE,
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18831 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `potential_temp_copy`
--

DROP TABLE IF EXISTS `potential_temp_copy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potential_temp_copy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID值',
  `nick` varchar(1000) DEFAULT NULL COMMENT '昵称',
  `sex` varchar(100) DEFAULT '0' COMMENT '性别',
  `type` varchar(100) DEFAULT NULL COMMENT '关注类型',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `fake_id` varchar(200) DEFAULT NULL COMMENT '微信FakeID',
  `open_id` varchar(200) NOT NULL COMMENT '微信OpenID',
  `last_login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户上次登录时间',
  `login_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户当前登录时间',
  `update_at` bigint(20) NOT NULL DEFAULT '0' COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  `status` int(2) NOT NULL DEFAULT '0',
  `unsubscribe_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `potential_open_id_index` (`open_id`) USING BTREE,
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18363 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pro_address`
--

DROP TABLE IF EXISTS `pro_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pro_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '部门名称',
  `postcode` varchar(100) NOT NULL COMMENT '地址邮编',
  `status` tinyint(4) DEFAULT '1' COMMENT '地址状态 1：启用 0：停用',
  `address` varchar(500) NOT NULL COMMENT '城市类型',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(1000) NOT NULL COMMENT '名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30947 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `contact` varchar(200) NOT NULL COMMENT '联系人',
  `phone` varchar(200) NOT NULL COMMENT '电话',
  `type` varchar(200) NOT NULL COMMENT '类型',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `provide_bankac` tinyint(4) DEFAULT '0' COMMENT '是否提供银行账号',
  `provide_invoice` tinyint(4) DEFAULT '0' COMMENT '是否提供发票',
  `bankacno` varchar(100) DEFAULT NULL COMMENT '银行账号',
  `bankacholder` varchar(100) DEFAULT NULL COMMENT '开户人',
  `signcontract` tinyint(4) DEFAULT '0' COMMENT '是否签署合同',
  `file_id` bigint(200) DEFAULT NULL,
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_publics_relation`
--

DROP TABLE IF EXISTS `provider_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `provider_id` bigint(20) NOT NULL COMMENT '供方ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics`
--

DROP TABLE IF EXISTS `publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(1000) NOT NULL COMMENT '名称',
  `token` varchar(1000) NOT NULL COMMENT 'token',
  `app_id` varchar(200) NOT NULL COMMENT 'appid',
  `app_secret` varchar(1000) NOT NULL COMMENT 'app secret',
  `account` varchar(1000) DEFAULT NULL COMMENT '公众号账号',
  `pwd` varchar(100) DEFAULT NULL COMMENT '公众号密码',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  `status` varchar(1000) NOT NULL COMMENT '公众号状态',
  `pay_signkey` varchar(1000) DEFAULT NULL,
  `partner_id` varchar(1000) DEFAULT NULL,
  `partner_key` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics2card`
--

DROP TABLE IF EXISTS `publics2card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics2card` (
  `id` bigint(20) NOT NULL,
  `account` varchar(200) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `remark` text,
  `area` varchar(20) DEFAULT NULL,
  `publics_name` text,
  `response_person` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics_bank_code`
--

DROP TABLE IF EXISTS `publics_bank_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics_bank_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `bank_code` varchar(40) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics_project_relation`
--

DROP TABLE IF EXISTS `publics_project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics_project_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `project_id` bigint(20) NOT NULL COMMENT '项目ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=237 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puser`
--

DROP TABLE IF EXISTS `puser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(50) NOT NULL COMMENT '登录名',
  `nick` varchar(1000) NOT NULL COMMENT '用户姓名',
  `pwd` varchar(1000) NOT NULL COMMENT '密码',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `status` varchar(100) NOT NULL COMMENT '停用标志位',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5044 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puser_publics_relation`
--

DROP TABLE IF EXISTS `puser_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puser_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `puser_id` bigint(20) NOT NULL COMMENT '用户ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `index_puserID` (`puser_id`),
  KEY `index_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=857 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qd_pay_detail`
--

DROP TABLE IF EXISTS `qd_pay_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qd_pay_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gorder_goods_relation_id` bigint(20) NOT NULL,
  `provider_id` bigint(20) NOT NULL,
  `provider_name` varchar(200) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `project_name` varchar(200) DEFAULT NULL,
  `publics_id` bigint(20) DEFAULT NULL,
  `publics_name` varchar(1000) DEFAULT NULL,
  `pay_at` bigint(20) DEFAULT NULL,
  `settle_at` bigint(20) DEFAULT NULL,
  `goods_id` bigint(20) DEFAULT NULL,
  `goods_name` varchar(200) DEFAULT NULL,
  `goods_price` varchar(200) DEFAULT NULL,
  `goods_count` int(11) DEFAULT NULL,
  `goods_cost_price` varchar(200) DEFAULT NULL,
  `goods_sum_price` varchar(200) DEFAULT NULL,
  `goods_sum_cost_price` varchar(200) DEFAULT NULL,
  `goods_status` int(11) DEFAULT NULL,
  `rating` varchar(200) DEFAULT NULL,
  `max_rate` varchar(200) DEFAULT NULL,
  `min_rate` varchar(200) DEFAULT NULL,
  `gorder_id` bigint(20) NOT NULL,
  `gorder_code` varchar(200) DEFAULT NULL,
  `gorder_payment_type` int(11) DEFAULT NULL,
  `gorder_payment_type_name` varchar(200) DEFAULT NULL,
  `gorder_fee` varchar(200) DEFAULT NULL,
  `commission_ratio` varchar(20) DEFAULT NULL,
  `refund_amount` varchar(200) DEFAULT NULL,
  `status` int(4) NOT NULL DEFAULT '0' COMMENT '状态：0 未合并， 1已合并',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `description` varchar(1000) NOT NULL COMMENT '规则key',
  `ticket` varchar(1000) NOT NULL COMMENT '消息ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `img` varchar(1000) NOT NULL COMMENT '二维码地址',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `index_PublicsHash` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `publics_id` bigint(20) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL,
  `module` varchar(255) NOT NULL COMMENT '模块',
  `type` tinyint(4) NOT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1629 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refund`
--

DROP TABLE IF EXISTS `refund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `gorder_goods_relation_id` bigint(20) unsigned NOT NULL COMMENT '商品id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `amount` varchar(255) NOT NULL COMMENT '金额',
  `refund_type` tinyint(4) NOT NULL,
  `refund_time` bigint(20) DEFAULT NULL COMMENT '退款时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0申请中 1已确认 2退款中 3退款成功 4退款失败',
  `deposit_bank` text NOT NULL COMMENT '开户行',
  `deposit_name` varchar(40) NOT NULL COMMENT '开户人',
  `deposit_account` varchar(100) NOT NULL COMMENT '开户账号',
  `description` text COMMENT '描述信息',
  `publics_id` bigint(20) NOT NULL,
  `confirm_by` bigint(20) DEFAULT NULL COMMENT '审核人ID',
  `confirm_at` bigint(20) DEFAULT NULL COMMENT '审核时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='退款表(refund)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `retry_queue`
--

DROP TABLE IF EXISTS `retry_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `retry_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `retry_count` int(11) NOT NULL,
  `target_id` varchar(50) NOT NULL,
  `queue_id` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(200) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '角色名',
  `permissions` text NOT NULL COMMENT '权限',
  `status` varchar(1000) NOT NULL COMMENT '停用标志位',
  `level` int(10) DEFAULT '0',
  `update_at` bigint(200) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(200) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(200) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(200) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=536 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(1000) NOT NULL COMMENT '规则名称',
  `mid` bigint(20) NOT NULL COMMENT '消息ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `default_message` varchar(20) NOT NULL COMMENT '默认消息 default 正常消息 normal',
  `welcome_message` varchar(20) NOT NULL COMMENT '欢迎消息 welcome 正常消息 normal',
  `type` varchar(20) NOT NULL COMMENT '类型 text,msg,multi_msg',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  PRIMARY KEY (`id`),
  KEY `Index_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule_keywords_relation`
--

DROP TABLE IF EXISTS `rule_keywords_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_keywords_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `keywords` varchar(200) NOT NULL COMMENT '关键字',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `rid` bigint(20) NOT NULL COMMENT '规则ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '数据更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '数据创建人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_publicsID_keywords` (`publics_id`,`keywords`),
  KEY `normal_rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=496 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `message` varchar(1000) NOT NULL COMMENT '短信内容',
  `type` varchar(50) NOT NULL COMMENT '短信类型',
  `mobile` varchar(30) NOT NULL COMMENT '手机号码',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`),
  KEY `normal_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(200) NOT NULL COMMENT '名称',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags_goods_relation`
--

DROP TABLE IF EXISTS `tags_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `tags_id` bigint(20) NOT NULL COMMENT '标签ID',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `tags_id` (`tags_id`),
  KEY `goods_id` (`goods_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2973 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags_publics_relation`
--

DROP TABLE IF EXISTS `tags_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `tags_id` bigint(20) NOT NULL COMMENT '标签ID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `tags_id` (`tags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `code` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `content` text,
  `create_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_code` (`code`),
  KEY `index_type` (`type`),
  KEY `index_publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `union_payment`
--

DROP TABLE IF EXISTS `union_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `union_payment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `gorder_code` varchar(255) NOT NULL COMMENT '订单code',
  `qd_code` varchar(255) NOT NULL COMMENT '千丁支付code',
  `amount` varchar(255) NOT NULL COMMENT '金额',
  `payment_type` bigint(20) NOT NULL COMMENT '收款方式id',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0:成功 -1:失败',
  `serialno` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `payment_type_id` (`payment_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网银收款表(union_payment)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `union_payment_log`
--

DROP TABLE IF EXISTS `union_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `union_payment_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `union_payment_id` bigint(20) NOT NULL COMMENT 'union_payment_id',
  `amount` varchar(255) NOT NULL DEFAULT '0' COMMENT '金额',
  `status` varchar(255) NOT NULL COMMENT '付款状态',
  `serialno` varchar(255) DEFAULT NULL COMMENT '交易流水号',
  `description` text NOT NULL COMMENT '描述信息',
  `create_by` bigint(20) NOT NULL COMMENT '创建人ID',
  `create_at` bigint(20) NOT NULL COMMENT '创建时间',
  `update_by` bigint(20) NOT NULL COMMENT '更新人ID',
  `update_at` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `union_payment_id` (`union_payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网银收款履历表(union_payment_log)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `name` varchar(1000) DEFAULT NULL COMMENT '姓名',
  `nick` varchar(1000) DEFAULT NULL COMMENT '名称',
  `mobile` varchar(200) NOT NULL COMMENT 'hash',
  `pwd` varchar(1000) DEFAULT NULL COMMENT 'token',
  `sex` varchar(100) DEFAULT NULL COMMENT '性别',
  `img` varchar(200) DEFAULT NULL COMMENT '头像',
  `from` varchar(500) DEFAULT NULL,
  `login_at` bigint(20) NOT NULL COMMENT '用户当前登录时间',
  `last_login_at` bigint(20) NOT NULL COMMENT '用户上次登录时间',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobile` (`mobile`),
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108545 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_bank_info`
--

DROP TABLE IF EXISTS `user_bank_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_bank_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `bank` text NOT NULL COMMENT '开户行',
  `name` varchar(40) NOT NULL COMMENT '开户人',
  `account` varchar(100) NOT NULL COMMENT '开户账号',
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_open_relation`
--

DROP TABLE IF EXISTS `user_open_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_open_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `open_id` varchar(1000) NOT NULL COMMENT 'OPENID',
  `publics_id` bigint(20) NOT NULL COMMENT '公众号ID值',
  `type` varchar(20) NOT NULL COMMENT '类型 wx_openID,mobile,wx_fakeID',
  `update_at` bigint(20) NOT NULL COMMENT '数据更新时间',
  `create_at` bigint(20) NOT NULL COMMENT '数据创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `update_by` bigint(20) DEFAULT NULL COMMENT '更新人ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `normal_openID` (`open_id`(255),`type`) USING BTREE,
  KEY `normal_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=93280 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-17 17:01:14
