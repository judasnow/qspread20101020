-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 24, 2010 at 04:09 AM
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
-- Table structure for table `vi_restaurant`
--

DROP TABLE IF EXISTS `vi_restaurant`;
CREATE TABLE IF NOT EXISTS `vi_restaurant` (
  `restaurant_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `description` text,
  `mileage` float DEFAULT NULL,
  `lead_time` int(11) DEFAULT NULL,
  `minimum_delivery` float DEFAULT NULL,
  `delivery_charge` float DEFAULT NULL,
  `services` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`restaurant_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `vi_restaurant`
--

INSERT INTO `vi_restaurant` (`restaurant_id`, `name`, `address`, `map`, `description`, `mileage`, `lead_time`, `minimum_delivery`, `delivery_charge`, `services`, `image`) VALUES
(1, 'Apple Spice Junction - Audubon', '(Italian, Pizza)<br />2017 Camino Del Este<br />San Diego, CA 92108<br />', NULL, 'Apple Spice Junction offers box lunch delivery, corporate catering and deli dining. Sandwich selections feature freshly-baked breads, fine meats and cheeses and crisp vegetables. Homemade soups, healthy salads and fresh bakery treats round out the box lunch menu, while breakfast offerings range from pastries and fruit to gourmet eggs and seasoned potatoes. Whether you need a caterer for a business event or family party, or just want to stop in for a sandwich and a bowl of soup, Apple Spice Junction means "good food when you need it."', 1.15, 45, 50, 15, 'Catering- Delivery,Delivery', NULL),
(2, 'Xpress Pizza and Grill', '(Pizza, Sandwiches)<br/>217 Bridge Street <br/>Phoenixville, PA 19460', NULL, 'We serve Phoenixville and surrounding areas with the best pizza in town, made with fresh ingredients. Our menu also include a variety of delicious choices such as Stromboli, Quesadilla, Sandwiches and Appetizers, with something for everyone.', 4.52, 20, 15, 2, 'Delivery,Catering- Delivery', NULL);
