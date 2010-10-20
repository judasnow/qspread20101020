-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2010 at 10:44 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `quickspread`
--

-- --------------------------------------------------------

--
-- Table structure for table `vi_category`
--

CREATE TABLE IF NOT EXISTS `vi_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `vi_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `vi_category_value`
--

CREATE TABLE IF NOT EXISTS `vi_category_value` (
  `category_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT '1',
  PRIMARY KEY (`category_value_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `vi_category_value`
--


-- --------------------------------------------------------

--
-- Table structure for table `vi_group`
--

CREATE TABLE IF NOT EXISTS `vi_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `default` tinyint(1) DEFAULT '0',
  `description` tinytext,
  `color` varchar(10) DEFAULT '#000000',
  `image_url` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `sorting` int(11) DEFAULT '1',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vi_group`
--

INSERT INTO `vi_group` (`group_id`, `name`, `default`, `description`, `color`, `image_url`, `enabled`, `sorting`) VALUES
(1, 'Admin', 0, NULL, '#ff0000', NULL, 1, 5),
(2, 'Client', 0, NULL, '#0000ff', NULL, 1, 4),
(3, 'Guest', 1, '', '#000000', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_group_permission`
--

CREATE TABLE IF NOT EXISTS `vi_group_permission` (
  `group_permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `expand_table_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`group_permission_id`),
  KEY `Ref_04` (`group_id`),
  KEY `Ref_05` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `vi_group_permission`
--

INSERT INTO `vi_group_permission` (`group_permission_id`, `group_id`, `permission_id`, `expand_table_id`, `enabled`) VALUES
(1, 1, 1, NULL, 1),
(2, 1, 2, NULL, 1),
(3, 1, 17, 1, 1),
(4, 1, 18, 1, 1),
(5, 1, 19, 1, 1),
(6, 1, 20, NULL, 1),
(7, 1, 21, NULL, 1),
(8, 1, 22, NULL, 1),
(9, 1, 3, NULL, 1),
(10, 1, 4, NULL, 1),
(11, 1, 5, NULL, 1),
(12, 1, 26, NULL, 1),
(13, 1, 25, NULL, 1),
(14, 1, 24, NULL, 1),
(15, 1, 23, NULL, 1),
(16, 1, 9, NULL, 1),
(17, 1, 8, 1, 1),
(18, 1, 7, 1, 1),
(19, 1, 6, 1, 1),
(20, 1, 16, NULL, 1),
(21, 1, 15, NULL, 1),
(22, 1, 14, NULL, 1),
(23, 1, 13, NULL, 1),
(24, 1, 12, NULL, 1),
(25, 1, 11, NULL, 1),
(26, 1, 10, NULL, 1),
(27, 2, 2, NULL, 1),
(28, 3, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_lang`
--

CREATE TABLE IF NOT EXISTS `vi_lang` (
  `lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `lang_code` varchar(5) NOT NULL,
  `lang_image` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT '1',
  PRIMARY KEY (`lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vi_lang`
--

INSERT INTO `vi_lang` (`lang_id`, `lang_code`, `lang_image`, `enabled`, `name`, `sorting`) VALUES
(1, 'en', 'media/userfiles/images/icons/flags/language/16/en.png', 1, 'English', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_mail`
--

CREATE TABLE IF NOT EXISTS `vi_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `data` tinytext,
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1: system mail; 2: newsletter',
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vi_mail`
--

INSERT INTO `vi_mail` (`mail_id`, `name`, `data`, `type`, `enabled`) VALUES
(1, 'register', '[USER_ID]\r\n[USERNAME]\r\n[FULL_NAME]\r\n[PASSWORD]', 1, 1),
(2, 'forgot_password', '[USER_ID]\r\n[USERNAME]\r\n[FULL_NAME]\r\n[PASSWORD]]', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_mail_lang`
--

CREATE TABLE IF NOT EXISTS `vi_mail_lang` (
  `mail_lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`mail_lang_id`),
  KEY `Ref_02` (`mail_id`),
  KEY `Ref_03` (`lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vi_mail_lang`
--

INSERT INTO `vi_mail_lang` (`mail_lang_id`, `mail_id`, `lang_id`, `subject`, `content`, `enabled`) VALUES
(1, 1, 1, 'Welcome to Wordeveryday', '<p>\r\n	Hi [FULL_NAME],<br />\r\n	Welcome to Wordeveryday.com<br />\r\n	<br />\r\n	Your account: <b>[USERNAME]</b><br />\r\n	Your password: <b>[PASSWORD]</b></p>\r\n', 1),
(3, 2, 1, 'e ew few fe fw', '<p>\r\n	fwef wef we few fwe</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_message`
--

CREATE TABLE IF NOT EXISTS `vi_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user_id` int(11) DEFAULT NULL,
  `to_user_id` int(11) DEFAULT NULL,
  `message` text,
  `sent_date` int(11) DEFAULT NULL,
  `inbox_read_date` int(11) DEFAULT NULL,
  `outbox_read_date` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`message_id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `vi_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `vi_permission`
--

CREATE TABLE IF NOT EXISTS `vi_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `expand_table_name` varchar(255) DEFAULT NULL,
  `expand_table_id` varchar(255) DEFAULT NULL,
  `expand_display_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `vi_permission`
--

INSERT INTO `vi_permission` (`permission_id`, `name`, `module`, `description`, `expand_table_name`, `expand_table_id`, `expand_display_name`) VALUES
(1, 'access', 'application::admin', 'Access to ''admin'' application', NULL, NULL, NULL),
(2, 'access', 'application::front', 'Access to ''front'' application', NULL, NULL, NULL),
(3, 'see_permission', 'permission', 'See all permissions', NULL, NULL, NULL),
(4, 'rescan_permission', 'permission', 'Rescan all permissions', NULL, NULL, NULL),
(5, 'edit_permission', 'permission', 'Enable/Disable permission', NULL, NULL, NULL),
(6, 'see_scontent', 'scontent', 'See all articles/categories', 'vi_lang', 'lang_id', 'name'),
(7, 'new_scontent', 'scontent', 'Create new article', 'vi_lang', 'lang_id', 'name'),
(8, 'edit_scontent', 'scontent', 'Edit existed articles', 'vi_lang', 'lang_id', 'name'),
(9, 'delete_scontent', 'scontent', 'Delete existed articles', NULL, NULL, NULL),
(10, 'see_user', 'user', 'See all users', NULL, NULL, NULL),
(11, 'new_user', 'user', 'Create new user', NULL, NULL, NULL),
(12, 'delete_user', 'user', 'Delete existed user', NULL, NULL, NULL),
(13, 'edit_user', 'user', 'Edit existed user', NULL, NULL, NULL),
(14, 'change_group', 'user', 'Change current group to another group', NULL, NULL, NULL),
(15, 'see_group', 'user', 'See all groups', NULL, NULL, NULL),
(16, 'edit_group', 'user', 'Edit existed group', NULL, NULL, NULL),
(17, 'see_newsletter_mail', 'mail', 'See all newsletter mails', 'vi_lang', 'lang_id', 'name'),
(18, 'new_newsletter_mail', 'mail', 'Create new newsletter mail', 'vi_lang', 'lang_id', 'name'),
(19, 'edit_newsletter_mail', 'mail', 'Edit existed newsletter mails', 'vi_lang', 'lang_id', 'name'),
(20, 'delete_newsletter_mail', 'mail', 'Delete existed newsletter mails', NULL, NULL, NULL),
(21, 'edit_system_mail', 'mail', 'Edit system mails', NULL, NULL, NULL),
(22, 'see_system_mail', 'mail', 'See system mails', NULL, NULL, NULL),
(23, 'see_prospect', 'prospect', 'See all prospects', NULL, NULL, NULL),
(24, 'new_prospect', 'prospect', 'Create new prospect', NULL, NULL, NULL),
(25, 'delete_prospect', 'prospect', 'Delete existed prospect', NULL, NULL, NULL),
(26, 'edit_prospect', 'prospect', 'Edit existed prospect', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vi_scontent`
--

CREATE TABLE IF NOT EXISTS `vi_scontent` (
  `scontent_id` int(11) NOT NULL AUTO_INCREMENT,
  `scontent_category_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `publish_up_date` int(11) DEFAULT '0',
  `publish_down_date` int(11) DEFAULT '0',
  `sorting` int(11) DEFAULT '1',
  `created_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`scontent_id`),
  KEY `Ref_08` (`scontent_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `vi_scontent`
--

INSERT INTO `vi_scontent` (`scontent_id`, `scontent_category_id`, `enabled`, `publish_up_date`, `publish_down_date`, `sorting`, `created_date`) VALUES
(1, 2, 1, 0, 0, 2, 1284536259),
(2, 1, 1, 0, 0, 3, 1284540328),
(3, 1, 0, 1293814800, 1372608000, 4, 1284557381),
(10, 1, 0, 0, 0, 5, 1284612739),
(11, 1, 0, 0, 0, 6, 1284612875),
(12, 1, 1, 0, 0, 1, 1284614542);

-- --------------------------------------------------------

--
-- Table structure for table `vi_scontent_category`
--

CREATE TABLE IF NOT EXISTS `vi_scontent_category` (
  `scontent_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `sorting` int(11) DEFAULT '1',
  PRIMARY KEY (`scontent_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vi_scontent_category`
--

INSERT INTO `vi_scontent_category` (`scontent_category_id`, `name`, `enabled`, `sorting`) VALUES
(1, 'Uncategorised', 1, 1),
(2, 'News', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_scontent_lang`
--

CREATE TABLE IF NOT EXISTS `vi_scontent_lang` (
  `scontent_lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `scontent_id` int(11) NOT NULL,
  `lang_id` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `category_alias` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `intro_text` mediumtext,
  `full_text` text,
  `hit` int(11) DEFAULT '0',
  `last_view_date` int(11) DEFAULT '0',
  `param` varchar(255) DEFAULT NULL,
  `meta_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scontent_lang_id`),
  KEY `Ref_06` (`scontent_id`),
  KEY `Ref_07` (`lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `vi_scontent_lang`
--

INSERT INTO `vi_scontent_lang` (`scontent_lang_id`, `scontent_id`, `lang_id`, `enabled`, `title`, `category_alias`, `alias`, `url`, `intro_text`, `full_text`, `hit`, `last_view_date`, `param`, `meta_data`) VALUES
(5, 2, 1, 0, 'aaa', 'new', 'aaa', 'new/aaa', '<p>\r\n	aaa</p>\r\n', '<p>\r\n	aaa</p>\r\n', 0, 0, NULL, NULL),
(7, 3, 1, 1, 'bbb11', 'bbb11', 'bbb11', 'bbb11/bbb11', '<p>\r\n	bbb1111</p>\r\n', '<p>\r\n	bbb1111</p>\r\n', 0, 0, NULL, NULL),
(10, 1, 1, 1, 'First news', 'news', 'first-new', 'news/first-new', '<p>\r\n	wefwe fwe fwefwe few</p>\r\n', '<p>\r\n	f wef ewf ewf we fw&nbsp; fwe fw</p>\r\n', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vi_user`
--

CREATE TABLE IF NOT EXISTS `vi_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_date` int(11) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `last_login_date` int(11) DEFAULT NULL,
  `avartar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `Ref_01` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vi_user`
--

INSERT INTO `vi_user` (`user_id`, `group_id`, `username`, `email`, `full_name`, `password`, `created_date`, `enabled`, `last_login_date`, `avartar`) VALUES
(1, 1, 'admin', 'nguoiao007@gmail.com', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 1284310752, 1, 1287550615, NULL),
(3, 2, 'client1', 'client1@test.com', 'First Name2 wgeg', 'a165dd3c2e98d5d607181d0b87a4c66b', 1286424420, 1, NULL, NULL),
(4, 2, 'client2', 'client2@test.com', 'First Name2 Last Name2', '2c66045d4e4a90814ce9280272e510ec', 1286441213, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vi_user_expand`
--

CREATE TABLE IF NOT EXISTS `vi_user_expand` (
  `user_expand_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `active_code` varchar(255) DEFAULT NULL,
  `active_expired_date` int(11) DEFAULT '0',
  `forgot_password_code` varchar(255) DEFAULT NULL,
  `forgot_password_expired_date` int(11) DEFAULT '0',
  `admin_note` tinytext,
  PRIMARY KEY (`user_expand_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vi_user_expand`
--

INSERT INTO `vi_user_expand` (`user_expand_id`, `user_id`, `active_code`, `active_expired_date`, `forgot_password_code`, `forgot_password_expired_date`, `admin_note`) VALUES
(1, 1, NULL, 0, NULL, 0, ''),
(3, 3, NULL, 0, NULL, 0, ''),
(4, 4, NULL, 0, NULL, 0, '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `vi_category_value`
--
ALTER TABLE `vi_category_value`
  ADD CONSTRAINT `vi_category_value_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `vi_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_group_permission`
--
ALTER TABLE `vi_group_permission`
  ADD CONSTRAINT `Ref_04` FOREIGN KEY (`group_id`) REFERENCES `vi_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ref_05` FOREIGN KEY (`permission_id`) REFERENCES `vi_permission` (`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_mail_lang`
--
ALTER TABLE `vi_mail_lang`
  ADD CONSTRAINT `Ref_02` FOREIGN KEY (`mail_id`) REFERENCES `vi_mail` (`mail_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ref_03` FOREIGN KEY (`lang_id`) REFERENCES `vi_lang` (`lang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_message`
--
ALTER TABLE `vi_message`
  ADD CONSTRAINT `vi_message_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `vi_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vi_message_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `vi_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_scontent`
--
ALTER TABLE `vi_scontent`
  ADD CONSTRAINT `Ref_08` FOREIGN KEY (`scontent_category_id`) REFERENCES `vi_scontent_category` (`scontent_category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_scontent_lang`
--
ALTER TABLE `vi_scontent_lang`
  ADD CONSTRAINT `Ref_06` FOREIGN KEY (`scontent_id`) REFERENCES `vi_scontent` (`scontent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Ref_07` FOREIGN KEY (`lang_id`) REFERENCES `vi_lang` (`lang_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_user`
--
ALTER TABLE `vi_user`
  ADD CONSTRAINT `Ref_01` FOREIGN KEY (`group_id`) REFERENCES `vi_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vi_user_expand`
--
ALTER TABLE `vi_user_expand`
  ADD CONSTRAINT `vi_user_expand_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `vi_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
