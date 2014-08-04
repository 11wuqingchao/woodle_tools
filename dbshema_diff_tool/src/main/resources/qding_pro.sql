-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: 118.192.69.219    Database: qding_pro
-- ------------------------------------------------------
-- Server version	5.1.73

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `sex` varchar(100) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_project_relation`
--

DROP TABLE IF EXISTS `address_project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_project_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `address_user_relation`
--

DROP TABLE IF EXISTS `address_user_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_user_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `address_id` (`address_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cart_goods_relation`
--

DROP TABLE IF EXISTS `cart_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cart_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `count` int(11) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_id` (`cart_id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB AUTO_INCREMENT=726 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `publish_name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `original_price` varchar(200) NOT NULL,
  `count` int(11) NOT NULL,
  `img` varchar(200) NOT NULL,
  `detail` text NOT NULL,
  `comment` text,
  `comment_status` tinyint(4) NOT NULL,
  `publish_start` bigint(20) NOT NULL,
  `publish_end` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  KEY `category_id` (`category_id`),
  KEY `name` (`name`),
  KEY `publish_name` (`publish_name`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `goods_publics_relation`
--

DROP TABLE IF EXISTS `goods_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `goods_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `category_id` (`category_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=556 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder`
--

DROP TABLE IF EXISTS `gorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `address_id` bigint(20) NOT NULL,
  `paddress_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `code` varchar(200) NOT NULL,
  `total` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `gorder_at` bigint(20) NOT NULL,
  `pay_at` bigint(20) DEFAULT NULL COMMENT '支付时间',
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gorder_goods_relation`
--

DROP TABLE IF EXISTS `gorder_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gorder_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gorder_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `publish_name` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `original_price` varchar(200) NOT NULL,
  `count` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gorder_id` (`gorder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `menu` text NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `decription` varchar(1000) DEFAULT NULL,
  `content` text,
  `url` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` varchar(200) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_PublicsHash` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `menu_id` varchar(50) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_url` (`url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `mid` bigint(20) NOT NULL,
  `level` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_GroupID` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `title` varchar(500) NOT NULL,
  `summary` varchar(1000) NOT NULL,
  `content` text,
  `img` varchar(200) DEFAULT NULL,
  `template_type` bigint(20) DEFAULT NULL,
  `status` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL,
  `release_at` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paddress`
--

DROP TABLE IF EXISTS `paddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paddress` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `address` varchar(200) NOT NULL,
  `code` varchar(200) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
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
-- Table structure for table `potential`
--

DROP TABLE IF EXISTS `potential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `potential` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `nick` varchar(1000) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `fake_id` varchar(200) DEFAULT NULL,
  `open_id` varchar(200) NOT NULL,
  `last_login_at` bigint(20) NOT NULL,
  `login_at` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `unsubscribe_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `normal_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `contact` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `provider_publics_relation`
--

DROP TABLE IF EXISTS `provider_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `provider_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `provider_id` (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics`
--

DROP TABLE IF EXISTS `publics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `token` varchar(1000) NOT NULL,
  `app_id` varchar(200) NOT NULL,
  `app_secret` varchar(1000) NOT NULL,
  `account` varchar(1000) DEFAULT NULL COMMENT '公众号账号',
  `pwd` varchar(100) DEFAULT NULL COMMENT '公众号密码',
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `status` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publics_project_relation`
--

DROP TABLE IF EXISTS `publics_project_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publics_project_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puser`
--

DROP TABLE IF EXISTS `puser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `nick` varchar(1000) NOT NULL,
  `pwd` varchar(1000) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `puser_publics_relation`
--

DROP TABLE IF EXISTS `puser_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puser_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `puser_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_puserID` (`puser_id`),
  KEY `index_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr`
--

DROP TABLE IF EXISTS `qr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) NOT NULL,
  `ticket` varchar(1000) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `img` varchar(1000) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_PublicsHash` (`publics_id`),
  KEY `idex_Ticket` (`ticket`(255))
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `publics_id` bigint(20) DEFAULT NULL,
  `object_id` bigint(20) NOT NULL,
  `module` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `content` text,
  `create_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8;
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
  `id` bigint(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `permissions` text NOT NULL,
  `status` varchar(1000) NOT NULL,
  `level` int(10) DEFAULT '0',
  `update_at` bigint(200) NOT NULL,
  `update_by` bigint(200) NOT NULL,
  `create_at` bigint(200) NOT NULL,
  `create_by` bigint(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_role` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `mid` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `default_message` varchar(20) NOT NULL,
  `welcome_message` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Index_publicsID` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rule_keywords_relation`
--

DROP TABLE IF EXISTS `rule_keywords_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rule_keywords_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keywords` varchar(200) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `rid` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_publicsID_keywords` (`publics_id`,`keywords`),
  KEY `normal_rid` (`rid`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` varchar(1000) NOT NULL,
  `type` varchar(50) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags_goods_relation`
--

DROP TABLE IF EXISTS `tags_goods_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_goods_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags_id` bigint(20) NOT NULL,
  `goods_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_id` (`tags_id`),
  KEY `goods_id` (`goods_id`),
  KEY `publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags_publics_relation`
--

DROP TABLE IF EXISTS `tags_publics_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_publics_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tags_id` bigint(20) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `update_by` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `publics_id` (`publics_id`),
  KEY `tags_id` (`tags_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
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
  PRIMARY KEY (`id`),
  KEY `index_code` (`code`),
  KEY `index_type` (`type`),
  KEY `index_publics_id` (`publics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `nick` varchar(1000) DEFAULT NULL,
  `mobile` varchar(200) NOT NULL,
  `pwd` varchar(1000) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `from` varchar(500) DEFAULT NULL,
  `login_at` bigint(20) NOT NULL,
  `last_login_at` bigint(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_open_relation`
--

DROP TABLE IF EXISTS `user_open_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_open_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL,
  `open_id` varchar(1000) NOT NULL,
  `publics_id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `update_at` bigint(20) NOT NULL,
  `create_at` bigint(20) NOT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `normal_openID` (`open_id`(255),`type`) USING BTREE,
  KEY `normal_uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-17 17:01:59
