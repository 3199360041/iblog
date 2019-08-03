
SET NAMES utf8mb4;


CREATE TABLE `category` (
  `id` int(11) NOT NULL primary key AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
    `status` tinyint default 1,
  `created_at` timestamp,
  `updated_at` timestamp
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# Dump of table access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `access`;

CREATE TABLE `access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urls` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `verification_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role`;

CREATE TABLE `admin_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` varchar(300) NOT NULL DEFAULT '',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论目标用户ID',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `content`, `to_user_id`, `create_time`, `parent_id`, `status`)
VALUES
	(1,1,7,'',0,1505034036,0,0),
	(2,1,7,'你好',0,1505034066,0,0),
	(3,1,7,'你好',2,1505034097,0,0),
	(4,2,7,'我觉得文章很不错的哦。',0,1505034066,0,0),
	(5,2,7,'我挺好的撒',1,1505034066,3,0),
	(6,1,7,'你好',2,1505060320,0,0);

/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `small_title` varchar(20) NOT NULL DEFAULT '',
  `catid` int(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `description` varchar(200) NOT NULL,
  `is_position` tinyint(1) NOT NULL DEFAULT '0',
  `is_head_figure` tinyint(1) NOT NULL DEFAULT '0',
  `is_allowcomments` tinyint(1) NOT NULL DEFAULT '0',
  `listorder` int(8) NOT NULL,
  `source_type` tinyint(1) DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `read_count` int(10) unsigned NOT NULL DEFAULT '0',
  `upvote_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO `post` (`id`, `title`, `small_title`, `catid`, `image`, `content`, `description`, `is_position`, `is_head_figure`, `is_allowcomments`, `listorder`, `source_type`, `create_time`, `update_time`, `status`, `read_count`, `upvote_count`, `comment_count`)
VALUES
	(1,'ttst','ttt',1,'','<p>ttttttt</p>','ttt',1,0,0,0,0,1501439513,1501634869,-1,0,0,0),
	(2,'tttt','sst',1,'','<p>tt</p>','tt',0,0,0,0,0,1501439814,1501634848,-1,0,0,0),
	(3,'ttt','ttt',1,'http://otwueljs0.bkt.clouddn.com/2017/07/a055e20170731023719851.jpg','<p>ttt</p>','t',0,0,0,0,0,1501439846,1501439846,1,0,0,0),
	(4,'tttt','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',0,1,1,0,0,1501441709,1501441709,1,0,0,0),
	(5,'刘德华','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',0,1,1,0,0,1501441709,1501441709,1,2,0,0),
	(6,'吴奇隆','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',0,1,1,0,0,1501441709,1501441709,1,0,0,0),
	(7,'singwa','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',0,1,1,0,0,1501441709,1501441709,1,0,0,0),
	(8,'一个人的生活','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',0,1,1,0,0,1501441709,1501441709,1,0,0,0),
	(9,'两个人的世界','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',1,1,1,0,0,1501441709,1502972250,1,0,0,0),
	(10,'singwa又出新课程了','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',1,1,1,0,0,1501441709,1502972232,1,0,0,0),
	(11,'singwa出席江西农业大学第三届大学生就业讲座','tt',3,'http://otwueljs0.bkt.clouddn.com/2017/07/ca132201707310308211515.jpg','<p>ttttttt&#39;</p><p>gsdg</p>','t',1,1,1,0,0,1501441709,1504460156,-1,0,0,0);

/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table role_access
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_access`;

CREATE TABLE `role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `access_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `phone` varchar(11) NOT NULL DEFAULT '',
  `token` varchar(100) NOT NULL DEFAULT '',
  `time_out` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(200) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别0男 1女',
  `signature` varchar(200) NOT NULL DEFAULT '' COMMENT '个性签名',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `phone` (`phone`),
  KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `password`, `phone`, `token`, `time_out`, `image`, `sex`, `signature`, `create_time`, `update_time`, `status`)
VALUES
	(1,'singwa123','15da5b87fbda7ab1a95e471a1247abce','18618158941','c040f9af9b3bd0da8090de7f6077e0ef456f9f19',1505589024,'http://otwueljs0.bkt.clouddn.com/2017/09/506d3201709100057331257.jpg',1,'singwa来了',1504635742,1504984224,1),
	(2,'wali','15da5b87fbda7ab1a95e471a1247abce','18618158941','c040f9af9b3bd0da8090de7f6077e0ef456f9f19',1505589024,'http://otwueljs0.bkt.clouddn.com/2017/09/506d3201709100057331257.jpg',1,'heih 嘿嘿',1504635742,1504984224,1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_post`;

CREATE TABLE `user_post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `user_post` WRITE;
/*!40000 ALTER TABLE `user_post` DISABLE KEYS */;

INSERT INTO `user_post` (`id`, `user_id`, `post_id`, `create_time`)
VALUES
	(1,1,5,1505027446),
	(2,1,4,1505027779);

UNLOCK TABLES;
