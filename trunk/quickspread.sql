-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2010 at 09:14 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `vi_category`
--

INSERT INTO `vi_category` (`category_id`, `name`) VALUES
(1, 'cuisine');

-- --------------------------------------------------------

--
-- Table structure for table `vi_category_value`
--

CREATE TABLE IF NOT EXISTS `vi_category_value` (
  `category_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sorting` int(11) DEFAULT '1',
  PRIMARY KEY (`category_value_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=51 ;

--
-- Dumping data for table `vi_category_value`
--

INSERT INTO `vi_category_value` (`category_value_id`, `category_id`, `name`, `sorting`) VALUES
(1, 1, 'American', 1),
(2, 1, 'Argentinean', 1),
(3, 1, 'Asian', 1),
(4, 1, 'Bagels', 1),
(5, 1, 'Bakery', 1),
(6, 1, 'Bangladeshi', 1),
(7, 1, 'Barbeque', 1),
(8, 1, 'Brazilian', 1),
(9, 1, 'Breakfast', 1),
(10, 1, 'British', 1),
(11, 1, 'Burgers', 1),
(12, 1, 'Cajun', 1),
(13, 1, 'Caribbean', 1),
(14, 1, 'Chicken', 1),
(15, 1, 'Chinese', 1),
(16, 1, 'Cuban', 1),
(17, 1, 'Czech', 1),
(18, 1, 'Dessert', 1),
(19, 1, 'Eclectic', 1),
(20, 1, 'French', 1),
(21, 1, 'German', 1),
(22, 1, 'Greek', 1),
(23, 1, 'Hawaiian', 1),
(24, 1, 'Healthy', 1),
(25, 1, 'Indian', 1),
(26, 1, 'International', 1),
(27, 1, 'Irish', 1),
(28, 1, 'Italian', 1),
(29, 1, 'Japanese', 1),
(30, 1, 'Korean', 1),
(31, 1, 'Lebanese', 1),
(32, 1, 'Mediterranean', 1),
(33, 1, 'Mexican', 1),
(34, 1, 'Middle-Eastern', 1),
(35, 1, 'Organic', 1),
(36, 1, 'Persian', 1),
(37, 1, 'Peruvian', 1),
(38, 1, 'Pizza', 1),
(39, 1, 'Sandwiches', 1),
(40, 1, 'Seafood', 1),
(41, 1, 'Smoothies', 1),
(42, 1, 'South-American', 1),
(43, 1, 'Southern', 1),
(44, 1, 'Spanish', 1),
(45, 1, 'Steakhouse', 1),
(46, 1, 'Sushi', 1),
(47, 1, 'Thai', 1),
(48, 1, 'Turkish', 1),
(49, 1, 'Vegetarian', 1),
(50, 1, 'Vietnamese', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `vi_mail`
--

INSERT INTO `vi_mail` (`mail_id`, `name`, `data`, `type`, `enabled`) VALUES
(1, 'register', '[USER_ID]\r\n[USERNAME]\r\n[FULL_NAME]\r\n[PASSWORD]', 1, 1),
(2, 'forgot_password', '[USER_ID]\r\n[USERNAME]\r\n[FULL_NAME]\r\n[PASSWORD]]', 1, 1),
(3, 'contact', '[NAME]<br/>[TITLE]<br/>[COMPANY_NAME]<br/>[EMAIL]<br/>[RETYPE_EMAIL]<br/>[PHONE]<br/>[FAX]<br/>[MESSAGE]', 1, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vi_mail_lang`
--

INSERT INTO `vi_mail_lang` (`mail_lang_id`, `mail_id`, `lang_id`, `subject`, `content`, `enabled`) VALUES
(1, 1, 1, NULL, NULL, 1),
(2, 2, 1, NULL, NULL, 1),
(3, 3, 1, 'Contact Message', '<p>\r\n	Hi <strong>admin</strong>,</p>\r\n<p>\r\n	You have new contact with following information:</p>\r\n<p>\r\n	Name: [NAME]</p>\r\n<p>\r\n	Title: [TITLE]</p>\r\n<p>\r\n	Company name: [COMPANY_NAME]</p>\r\n<p>\r\n	Email: [EMAIL]</p>\r\n<p>\r\n	Phone: [PHONE]</p>\r\n<p>\r\n	Fax: [FAX]</p>\r\n<p>\r\n	Message:</p>\r\n<p>\r\n	[MESSAGE]</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vi_meal`
--

CREATE TABLE IF NOT EXISTS `vi_meal` (
  `meal_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `restaurant_id` int(11) DEFAULT NULL,
  `category_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`meal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vi_meal`
--

INSERT INTO `vi_meal` (`meal_id`, `name`, `description`, `price`, `parent`, `restaurant_id`, `category_value_id`) VALUES
(1, 'Homemade Soup', 'Served with our fresh baked bread or add a bread bowl for 0.75.', 0.75, 0, 1, 1),
(2, 'Fire Roasted Vegetable  ', 'Fire Roasted Vegetable\r\n ', 3.5, 1, 1, 1),
(3, 'Chicken Tortilla Soup', ' Served with sour cream and chips.', 3.5, 1, 1, 1),
(4, 'Amy''s Special Recipe Chili', ' Served with two kinds of cheese and fresh baked bread.', 3.59, 1, 1, 1),
(5, 'Garden Fresh Salads', 'Served with fresh baked bread and your choice of Ranch, Lite Ranch, Italian, Lite Italian, Bleu Cheese, Fat-free Raspberry Vinaigrette, Balsamic Vinaigrette, Thousand Island, Poppy Seed or Sesame Ginger on the side. Add a cookie for 0.50. Upgrade to Executive Salad that includes an added tasty cheesecake treat for $2.00.', 2, 0, 1, 2);

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
-- Table structure for table `vi_restaurant`
--

CREATE TABLE IF NOT EXISTS `vi_restaurant` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `map` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `mileage` float DEFAULT NULL,
  `pickup` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `curbside` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `catering_pickup_only` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `minimum_delivery` float DEFAULT NULL,
  `delivery_charge` float DEFAULT NULL,
  `services` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vi_restaurant`
--

INSERT INTO `vi_restaurant` (`restaurant_id`, `name`, `address`, `map`, `description`, `mileage`, `pickup`, `curbside`, `catering_pickup_only`, `minimum_delivery`, `delivery_charge`, `services`, `image`) VALUES
(1, 'Apple Spice Junction - Audubon', '(Italian, Pizza)<br />2017 Camino Del Este<br />San Diego, CA 92108<br />', NULL, 'Apple Spice Junction offers box lunch delivery, corporate catering and deli dining. Sandwich selections feature freshly-baked breads, fine meats and cheeses and crisp vegetables. Homemade soups, healthy salads and fresh bakery treats round out the box lunch menu, while breakfast offerings range from pastries and fruit to gourmet eggs and seasoned potatoes. Whether you need a caterer for a business event or family party, or just want to stop in for a sandwich and a bowl of soup, Apple Spice Junction means "good food when you need it."', 1.15, '45 min', NULL, '1 day', 50, 15, 'Catering- Delivery,Delivery', NULL),
(2, 'Xpress Pizza and Grill', '(Pizza, Sandwiches)<br/>217 Bridge Street <br/>Phoenixville, PA 19460', NULL, 'We serve Phoenixville and surrounding areas with the best pizza in town, made with fresh ingredients. Our menu also include a variety of delicious choices such as Stromboli, Quesadilla, Sandwiches and Appetizers, with something for everyone.', 4.52, '20 min', NULL, '6 hours', 15, 2, 'Delivery,Catering- Delivery', NULL);

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
  `layout` varchar(255) DEFAULT 'front',
  PRIMARY KEY (`scontent_id`),
  KEY `Ref_08` (`scontent_category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `vi_scontent`
--

INSERT INTO `vi_scontent` (`scontent_id`, `scontent_category_id`, `enabled`, `publish_up_date`, `publish_down_date`, `sorting`, `created_date`, `layout`) VALUES
(1, 1, 1, 0, 0, 9, 1289536365, 'front2'),
(2, 1, 1, 0, 0, 8, 1289550663, 'front2'),
(3, 1, 1, 0, 0, 7, 1289551148, 'front2'),
(4, 1, 1, 0, 0, 6, 1289551786, 'front'),
(5, 1, 1, 0, 0, 5, 1289551897, 'front'),
(6, 1, 1, 0, 0, 4, 1289552025, 'front2'),
(7, 1, 1, 0, 0, 3, 1289552144, 'front2'),
(8, 1, 1, 0, 0, 2, 1289552229, 'front2'),
(9, 1, 1, 0, 0, 1, 1289552364, 'front2');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `vi_scontent_lang`
--

INSERT INTO `vi_scontent_lang` (`scontent_lang_id`, `scontent_id`, `lang_id`, `enabled`, `title`, `category_alias`, `alias`, `url`, `intro_text`, `full_text`, `hit`, `last_view_date`, `param`, `meta_data`) VALUES
(11, 1, 1, 1, 'How it works', '', 'how-it-works', 'how-it-works', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>HOW TO PLACE AN ORDER AT QUICKSPEAD.COM</strong></span><br />\r\n	<br />\r\n	Get the food you crave without waiting on the phone, waiting in line, or waiting to pay.<img alt="" src="/quickspread/media/userfiles/images/bg_howitwork.jpg" style="width: 312px; height: 290px; float: right;" /><br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>1. Sign Up or log In</strong></span><br />\r\n	Creating an account is free<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>2. Choose a Restaurant</strong></span><br />\r\n	Search by restaurant name, cuisine or delivery preference.<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>3. Place Your Order</strong></span><br />\r\n	Select the items you want.<br />\r\n	Indicate a delivery or pickup time.<br />\r\n	Include any special instructions.<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>4. Your Food is Prepared</strong></span><br />\r\n	Once your order is sent to the restaurant, you receive a confirmation email.<br />\r\n	Your meal will be ready for pickup or curdside takeaway at the restaurant.<br />\r\n	If you opted for delivery, the restaurant brings your food to you.<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>5. Enjoy Your Meal!</strong></span><br />\r\n	Should you fail to receive a confirmation email, or have general questions about your order,<br />\r\n	please contact our customer service team at 1-866-545-8808, and they&#39;ll get you squared away.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<img alt="" src="/quickspread/media/userfiles/images/bt_setup.jpg" style="width: 179px; height: 34px;" /></p>\r\n', 0, 0, NULL, NULL),
(12, 2, 1, 1, 'Corporate Accounts', '', 'corporate-accounts', 'corporate-accounts', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>CORPORATE ACCOUNTS</strong></span><br />\r\n	<br />\r\n	LiveOnTheGo is fast, free and easy. We simplify the process of ordering meals at work, whether it is for an individual or the entire office. Our corporate accounts save you time and money by dramatically cutting down the administrative, billing and management work associated with placing corporate orders. Our revolutionary online system allows you to place individual and group orders, monitor the status of pending orders, and generate detailed reports for your records and accounting needs.</p>\r\n<p>\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>Benefits</strong></span></p>\r\n<p>\r\n	<br />\r\n	<strong>Save 30-40% Compared with Delivery Services</strong><br />\r\n	<br />\r\n	LiveOnTheGo is free to use, there is no markup on food prices and we offer an efficient pickup option with no delivery fees. Also, you can assign a maximum order amount for each employee so you are sure to stay within your budget.</p>\r\n<p>\r\n	<strong>Save Time</strong><br />\r\n	<br />\r\n	You will never have to wait on the phone to order or wait in line to pick up and pay for your meals again. Plus, our reordering feature lets you reorder meals in a few seconds and with curbside pickup you don&#39;t even need to leave your car.</p>\r\n<p>\r\n	<br />\r\n	<strong>iPhone and Blackberry Integration</strong><br />\r\n	<br />\r\n	Our free iPhone and Blackberry sites let you order and reorder meals right from your mobile phone. So no matter where you are you can place and pay for your order with just a few clicks.</p>\r\n<p>\r\n	<strong>Remove the Hassle of Placing Orders</strong><br />\r\n	<br />\r\n	Our array of management and reordering tools help administrators and catering managers place orders of any size faster and more efficiently.</p>\r\n<p>\r\n	<strong>Maintain Detailed Accounting Records</strong><br />\r\n	<br />\r\n	Our reports allow you to track expenses by employee, project or client code.</p>\r\n<p>\r\n	<strong>Explore Your Choices</strong><br />\r\n	<br />\r\n	We have the best local eateries, from quick service to fine dining.</p>\r\n<p>\r\n	<strong>Secure Transactions</strong><br />\r\n	<br />\r\n	Only your designated administrators have access to your company profile and all transactions occur over secure channel.</p>\r\n<p>\r\n	<strong>Eliminate Catering Waste</strong><br />\r\n	<br />\r\n	With our Meeting Maker system everyone can order individual meals. You don&#39;t have to deal with the additional expense and leftover food from catering platters that go to waste.</p>\r\n', 0, 0, NULL, NULL),
(13, 3, 1, 1, 'Philanthropy', '', 'philanthropy', 'philanthropy', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>PHILANTHROPY</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare orci eget urna suscipit porttitor. Cras fermentum suscipit sodales. Suspendisse viverra lacinia mollis. Aenean dignissim magna posuere lacus adipiscing faucibus. Nulla facilisi. Vestibulum in commodo odio. Donec sollicitudin, tellus vitae egestas ultricies, urna diam pulvinar elit, luctus pharetra dolor justo porta justo. Praesent accumsan quam ac ipsum semper ut luctus sem mollis. Curabitur vehicula dui sem. Proin euismod ante lectus. Maecenas egestas facilisis leo at scelerisque.<br />\r\n	<br />\r\n	Suspendisse erat lectus, sollicitudin ac malesuada id, condimentum sit amet leo. Nullam rhoncus leo vitae nisi consectetur scelerisque. Donec ac ante metus, vitae eleifend risus. In at mollis sem. Curabitur odio risus, facilisis sit amet venenatis pharetra, convallis eget elit. In gravida, risus eu sollicitudin condimentum, nunc ante aliquam lacus, eu egestas neque arcu a nisl. Maecenas non neque sapien. Integer vitae purus sit amet elit condimentum posuere. Aliquam ultricies dictum massa, id tincidunt libero aliquet in. Nam leo justo, tincidunt tempus porttitor a, sollicitudin at eros. Sed pretium, magna ut lacinia laoreet, est ante posuere neque, non molestie mi arcu fermentum enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eget nisl velit. Suspendisse sed magna vitae tellus imperdiet molestie. Praesent pharetra, orci a venenatis auctor, lacus neque tristique lacus, vel consequat nisi risus et mauris. Suspendisse id sapien in lacus venenatis hendrerit vel nec dui. Suspendisse euismod rutrum lectus id volutpat. Quisque massa dui, dictum iaculis molestie quis, porta ut metus. Donec convallis tincidunt arcu eu rhoncus.<br />\r\n	<br />\r\n	Mauris dui ligula, accumsan vel volutpat ut, elementum in metus. Integer nibh lacus, tincidunt id aliquam sit amet, laoreet a orci. Nam tristique accumsan enim id ultrices. Suspendisse sit amet scelerisque tellus. Vivamus est metus, elementum sed euismod convallis, dapibus vitae nisl. Mauris dapibus iaculis ante, ac vehicula velit tincidunt quis. Etiam a tortor nunc, ut luctus massa. Praesent venenatis, lacus sit amet iaculis volutpat, quam metus mollis augue, id porttitor nisl erat eu nibh. Duis turpis nunc, dapibus non hendrerit sit amet, pretium in risus. Nullam pulvinar, dolor ut congue sollicitudin, est justo accumsan enim, sit amet rutrum purus erat nec lacus.<br />\r\n	<br />\r\n	Pellentesque a viverra enim. Cras ac libero ac dui faucibus facilisis quis id arcu. Suspendisse nec erat augue. Curabitur laoreet nunc et felis mollis dignissim. Maecenas dapibus enim tincidunt quam rhoncus porttitor. Aliquam erat volutpat. Pellentesque viverra tristique sollicitudin. Phasellus a erat a neque semper mattis at sed orci. Suspendisse quis ultricies velit. Aenean eu libero in urna ullamcorper porta. Suspendisse rutrum aliquam diam vitae gravida. Vestibulum in risus dolor, vitae aliquet justo. Ut diam nulla, aliquam a fermentum sed, cursus tempor nisl.<br />\r\n	<br />\r\n	Nunc auctor, ligula porta condimentum pharetra, tortor risus bibendum nisl, pharetra adipiscing eros mauris eget libero. Donec in blandit ligula. Aliquam ut lectus rutrum leo varius pharetra. Nullam tristique odio a lacus accumsan vitae convallis nisi malesuada. Duis eu odio at est dapibus malesuada. Donec rutrum elit eget diam tincidunt bibendum. Mauris metus orci, molestie et pellentesque in, volutpat eget nibh. Nullam sed tempor dui. Cras diam erat, porttitor vitae tempus eu, aliquet nec justo. Proin mollis dui non nisl convallis tincidunt. Vestibulum pellentesque blandit lorem, sed condimentum purus vulputate ac. Curabitur condimentum lorem felis, quis suscipit urna. Suspendisse dignissim dolor et erat volutpat et dictum felis molestie.</p>\r\n', 0, 0, NULL, NULL),
(14, 4, 1, 1, 'Refer a Restaurant', '', 'refer-a-restaurant', 'refer-a-restaurant', '', '<div id="main">\r\n	<div class="col1">\r\n		<p class="title1">\r\n			Get $25 in Free Food Every Time One of Your Favorite</p>\r\n		<p class="p20t">\r\n			<b>Restaurants Signs Up with QuickS[read.com Don&#39;t see your favorite restaurant on QuickSpread.com? Here&#39;s a way to get them to sign up, so you can enjoy the convenience of ordering from them online through QuickSpread.com. Plus, now you can get $25 in free food!</b></p>\r\n	</div>\r\n	<div class="col2">\r\n		<div class="bg_t">\r\n			&nbsp;</div>\r\n		<div class="bg_c">\r\n			<div class="bg_cen">\r\n				<p class="title1 p20l">\r\n					Follow these three easy steps:</p>\r\n				<div class="m25t">\r\n					<img alt="" class="m20l" src="/quickspread/img/icon_10.jpg" /> <img alt="" class="m20l" src="/quickspread/img/icon_1.png" /> <img alt="" class="m20l" src="/quickspread/img/icon_11.jpg" /> <img alt="" class="m20l" src="/quickspread/img/icon_1.png" /> <img alt="" class="m20l" src="/quickspread/img/icon_12.jpg" /></div>\r\n				<div class="p10t p10b">\r\n					<div class="w155 float_left m10l">\r\n						<span class="fs30 color_2">1.</span><span class="color_2 fs14"><b>Print the flyer</b></span><br />\r\n						Just click the button below. Make sure to write in your user name or e-mail address so we can give you credit.</div>\r\n					<div class="w155 float_left m50l">\r\n						<span class="fs30 color_2">2.</span><span class="color_2 fs14"><b>Bring it in</b></span><br />\r\n						Take the flyers to your favorite restaurants and hand them to the manager or owner so they can find out how to become a QuickSpread.com restaurant partner.</div>\r\n					<div class="w155 float_left m50l">\r\n						<span class="fs30 color_2">3.</span><span class="color_2 fs14"><b>Get $25 in FREE food</b></span><br />\r\n						As a referral bonus, you&#39;ll receive $25 off your next meal at each of your favorite restaurants when they become QuickSpread.com partners.</div>\r\n					<div class="clear_left">\r\n						&nbsp;</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n		<div class="bg_b">\r\n			&nbsp;</div>\r\n	</div>\r\n	<div class="clear">\r\n		&nbsp;</div>\r\n</div>\r\n', 0, 0, NULL, NULL),
(15, 5, 1, 1, 'Refer a friend', '', 'refer-a-friend', 'refer-a-friend', '', '\r\n    <div id="main">\r\n        <div class="col1">\r\n        	<p class="title1">Refer a Friend and You''ll Both be Rewarded</p>\r\n            <p class="p20t"><b>Earn a $5 referral credit for each friend you refer. Plus your friends will save $5 on their first order of $10 or more. Start earning referral credits now, there is no limit to the number of friends you can refer.</b></p>\r\n            <p class="p20t fs11">*Restrictions apply. Your referred customer must make a minimum purchase of $10. You and your referred customer will each receive a $5 credit. Only one credit may be used for each order. Does not apply to tip, delivery charge or sales tax. Cannot be combined with any other offers. In order to receive credit you must have an active account in good standing, as determined solely by LiveOnTheGo. Credit not redeemable for cash. May not be applied to previous transactions. LiveOnTheGo reserves the sole right to modify, suspend or cancel this referral program at any time without notice.</p>\r\n        </div>\r\n        <div class="col2">\r\n            <div class="bg_t"></div>\r\n            <div class="bg_c">\r\n            	<div class="bg_cen">\r\n                	<p class="title1 p20l">Follow these three easy steps:</p>\r\n                    <div class="m25t">\r\n                    	<img src="/quickspread/img/icon_7.jpg" alt="" class="m20l" />\r\n                        <img src="/quickspread/img/icon_1.png" alt="" class="m20l" />\r\n                        <img src="/quickspread/img/icon_8.jpg" alt="" class="m20l" />\r\n                        <img src="/quickspread/img/icon_1.png" alt="" class="m20l" />\r\n                        <img src="/quickspread/img/icon_9.jpg" alt="" class="m20l" />\r\n                    </div>\r\n                    <div class="p10t p10b">\r\n                    	<div class="w155 float_left m10l">\r\n                            <span class="fs30 color_2">1.</span><span class="color_2 fs14"><b>Sign up for a free QuickSpread  account</b></span><br />\r\n                            Just click the button below to set up your free LiveOnTheGo account and you will be on your\r\n                        </div>\r\n                        <div class="w155 float_left m50l">\r\n                            <span class="fs30 color_2">2.</span><span class="color_2 fs14"><b>Send your friends an invitationto save $5 on their 1st order</b></span><br />\r\n                            Once you are logged in go to the refer a friend section and use the referral form to show your friends what they have\r\n                        </div>\r\n                        <div class="w155 float_left m50l">\r\n                            <span class="fs30 color_2">3.</span><span class="color_2 fs14"><b>Get a $5 referral credit for each friend you refer</b></span><br />\r\n                            You can use your $5 referral credit when ordering from any LiveOnTheGo.com restaurant. No limit on the number of friends you can refer.\r\n                        </div>\r\n                        <div class="clear_left"></div>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n            <div class="bg_b"></div>\r\n            \r\n        </div>\r\n        <div class="clear"></div>\r\n    </div>', 0, 0, NULL, NULL),
(16, 6, 1, 1, 'About us', '', 'about-us', 'about-us', '<br />', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>ABOUT US</strong></span><br />\r\n	<br />\r\n	LiveOnTheGo.com is a free and convenient online service that allows users to order and pay for take out food in advance via the Web, iPhone or iPod Touch from favorite local restaurants and have it ready when they want it &mdash; with no waiting on the phone, no waiting in line and no waiting to pay.<br />\r\n	<br />\r\n	Founded in 2006 in Costa Mesa, California, LiveOnTheGo.com came out of personal need - for a quick cup of coffee after a long night&#39;s work.<br />\r\n	<br />\r\n	One of the co-founders of LiveOnTheGo.com had burned the midnight oil working on a business transaction. On his way to an early morning meeting the next day, he was in desperate need of a cup of coffee. But he didn&#39;t have time to stop at his local coffee house, park and then wait in line to order, pay and pickup his drink.<br />\r\n	<br />\r\n	Later that day, when talking to a colleague (the other co - founder of LiveOnTheGo.com), he mentioned what happened that morning, asking &quot;Wouldn&#39;t it be great if we could order and pay for coffee in advance, and have it ready when we want?&quot; Although this colleague was not a coffee drinker, he saw the bigger potential.<br />\r\n	<br />\r\n	The two joined together to create LiveOnTheGo.com, the online service that makes it easy for people to order and pay for food online without waiting on the phone, waiting in line or waiting to pay. They hope you enjoy the service as much as they do.</p>\r\n<br />', 0, 0, NULL, NULL),
(17, 7, 1, 1, 'Meet the team', '', 'meet-the-team', 'meet-the-team', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>MEET THE TEAM</strong></span><br />\r\n	<br />\r\n	LiveOnTheGo.com is a free and convenient online service that allows users to order and pay for take out food in advance via the Web, iPhone or iPod Touch from favorite local restaurants and have it ready when they want it &mdash; with no waiting on the phone, no waiting in line and no waiting to pay.<br />\r\n	<br />\r\n	Founded in 2006 in Costa Mesa, California, LiveOnTheGo.com came out of personal need - for a quick cup of coffee after a long night&#39;s work.<br />\r\n	<br />\r\n	One of the co-founders of LiveOnTheGo.com had burned the midnight oil working on a business transaction. On his way to an early morning meeting the next day, he was in desperate need of a cup of coffee. But he didn&#39;t have time to stop at his local coffee house, park and then wait in line to order, pay and pickup his drink.<br />\r\n	<br />\r\n	Later that day, when talking to a colleague (the other co - founder of LiveOnTheGo.com), he mentioned what happened that morning, asking &quot;Wouldn&#39;t it be great if we could order and pay for coffee in advance, and have it ready when we want?&quot; Although this colleague was not a coffee drinker, he saw the bigger potential.<br />\r\n	<br />\r\n	The two joined together to create LiveOnTheGo.com, the online service that makes it easy for people to order and pay for food online without waiting on the phone, waiting in line or waiting to pay. They hope you enjoy the service as much as they do.</p>\r\n', 0, 0, NULL, NULL),
(18, 8, 1, 1, 'Careers', '', 'careers', 'careers', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>CAREERS</strong></span></p>\r\n<p>\r\n	<br />\r\n	LiveOnTheGo.com is a free and convenient online service that allows users to order and pay for take out food in advance via the Web, iPhone or iPod Touch from favorite local restaurants and have it ready when they want it &mdash; with no waiting on the phone, no waiting in line and no waiting to pay.<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>Sales</strong></span><br />\r\n	It is the Salesperson&rsquo;s responsibility to originate and sign on new restaurant partners. This involves all aspects of the sales process from cold-calling prospects to final execution of the paperwork necessary to close the sale. This person will partner closely with the Owner of the company to develop a pipeline of potential restaurant partners and help set strategies for aggressive growth.<br />\r\n	<br />\r\n	<span style="color: rgb(128, 0, 0);"><strong>Sales</strong></span><br />\r\n	It is the Salesperson&rsquo;s responsibility to originate and sign on new restaurant partners. This involves all aspects of the sales process from cold-calling prospects to final execution of the paperwork necessary to close the sale. This person will partner closely with the Owner of the company to develop a pipeline of potential restaurant partners and help set strategies for aggressive growth.</p>\r\n', 0, 0, NULL, NULL),
(19, 9, 1, 1, 'News room', '', 'news-room', 'news-room', '', '<p>\r\n	<span style="color: rgb(128, 0, 0);"><strong>NEWS ROOM</strong></span></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque ornare orci eget urna suscipit porttitor. Cras fermentum suscipit sodales. Suspendisse viverra lacinia mollis. Aenean dignissim magna posuere lacus adipiscing faucibus. Nulla facilisi. Vestibulum in commodo odio. Donec sollicitudin, tellus vitae egestas ultricies, urna diam pulvinar elit, luctus pharetra dolor justo porta justo. Praesent accumsan quam ac ipsum semper ut luctus sem mollis. Curabitur vehicula dui sem. Proin euismod ante lectus. Maecenas egestas facilisis leo at scelerisque.<br />\r\n	<br />\r\n	Suspendisse erat lectus, sollicitudin ac malesuada id, condimentum sit amet leo. Nullam rhoncus leo vitae nisi consectetur scelerisque. Donec ac ante metus, vitae eleifend risus. In at mollis sem. Curabitur odio risus, facilisis sit amet venenatis pharetra, convallis eget elit. In gravida, risus eu sollicitudin condimentum, nunc ante aliquam lacus, eu egestas neque arcu a nisl. Maecenas non neque sapien. Integer vitae purus sit amet elit condimentum posuere. Aliquam ultricies dictum massa, id tincidunt libero aliquet in. Nam leo justo, tincidunt tempus porttitor a, sollicitudin at eros. Sed pretium, magna ut lacinia laoreet, est ante posuere neque, non molestie mi arcu fermentum enim. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Curabitur eget nisl velit. Suspendisse sed magna vitae tellus imperdiet molestie. Praesent pharetra, orci a venenatis auctor, lacus neque tristique lacus, vel consequat nisi risus et mauris. Suspendisse id sapien in lacus venenatis hendrerit vel nec dui. Suspendisse euismod rutrum lectus id volutpat. Quisque massa dui, dictum iaculis molestie quis, porta ut metus. Donec convallis tincidunt arcu eu rhoncus.<br />\r\n	<br />\r\n	Mauris dui ligula, accumsan vel volutpat ut, elementum in metus. Integer nibh lacus, tincidunt id aliquam sit amet, laoreet a orci. Nam tristique accumsan enim id ultrices. Suspendisse sit amet scelerisque tellus. Vivamus est metus, elementum sed euismod convallis, dapibus vitae nisl. Mauris dapibus iaculis ante, ac vehicula velit tincidunt quis. Etiam a tortor nunc, ut luctus massa. Praesent venenatis, lacus sit amet iaculis volutpat, quam metus mollis augue, id porttitor nisl erat eu nibh. Duis turpis nunc, dapibus non hendrerit sit amet, pretium in risus. Nullam pulvinar, dolor ut congue sollicitudin, est justo accumsan enim, sit amet rutrum purus erat nec lacus.<br />\r\n	<br />\r\n	Pellentesque a viverra enim. Cras ac libero ac dui faucibus facilisis quis id arcu. Suspendisse nec erat augue. Curabitur laoreet nunc et felis mollis dignissim. Maecenas dapibus enim tincidunt quam rhoncus porttitor. Aliquam erat volutpat. Pellentesque viverra tristique sollicitudin. Phasellus a erat a neque semper mattis at sed orci. Suspendisse quis ultricies velit. Aenean eu libero in urna ullamcorper porta. Suspendisse rutrum aliquam diam vitae gravida. Vestibulum in risus dolor, vitae aliquet justo. Ut diam nulla, aliquam a fermentum sed, cursus tempor nisl.<br />\r\n	<br />\r\n	Nunc auctor, ligula porta condimentum pharetra, tortor risus bibendum nisl, pharetra adipiscing eros mauris eget libero. Donec in blandit ligula. Aliquam ut lectus rutrum leo varius pharetra. Nullam tristique odio a lacus accumsan vitae convallis nisi malesuada. Duis eu odio at est dapibus malesuada. Donec rutrum elit eget diam tincidunt bibendum. Mauris metus orci, molestie et pellentesque in, volutpat eget nibh. Nullam sed tempor dui. Cras diam erat, porttitor vitae tempus eu, aliquet nec justo. Proin mollis dui non nisl convallis tincidunt. Vestibulum pellentesque blandit lorem, sed condimentum purus vulputate ac. Curabitur condimentum lorem felis, quis suscipit urna. Suspendisse dignissim dolor et erat volutpat et dictum felis molestie.</p>\r\n', 0, 0, NULL, NULL);

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
  `company` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `suite_apt_note` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birthday_date` int(11) DEFAULT NULL,
  `birthday_month` int(11) DEFAULT NULL,
  `birthday_year` int(11) DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL COMMENT '0:don''t select 1:male 2:female',
  `security_question` int(11) DEFAULT NULL,
  `security_answer` varchar(255) DEFAULT NULL,
  `send_discount_code` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `Ref_01` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `vi_user`
--

INSERT INTO `vi_user` (`user_id`, `group_id`, `username`, `email`, `full_name`, `password`, `created_date`, `enabled`, `last_login_date`, `avartar`, `company`, `address`, `suite_apt_note`, `city`, `state`, `zipcode`, `phone`, `birthday_date`, `birthday_month`, `birthday_year`, `gender`, `security_question`, `security_answer`, `send_discount_code`) VALUES
(1, 1, 'admin', 'nguoiao007@gmail.com', 'Admin', 'e10adc3949ba59abbe56e057f20f883e', 1284310752, 1, 1289798812, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 'client1', 'client1@test.com', 'First Name2 wgeg', 'a165dd3c2e98d5d607181d0b87a4c66b', 1286424420, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 'client2', 'client2@test.com', 'First Name2 Last Name2', '2c66045d4e4a90814ce9280272e510ec', 1286441213, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
