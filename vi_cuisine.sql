-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 11, 2010 at 04:56 AM
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
-- Table structure for table `vi_cuisine`
--

DROP TABLE IF EXISTS `vi_cuisine`;
CREATE TABLE IF NOT EXISTS `vi_cuisine` (
  `cuisine_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` float DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  `restaurant_id` int(11) DEFAULT NULL,
  `category_value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cuisine_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `vi_cuisine`
--

INSERT INTO `vi_cuisine` (`cuisine_id`, `name`, `description`, `price`, `parent`, `restaurant_id`, `category_value_id`) VALUES
(1, 'Homemade Soup', 'Served with our fresh baked bread or add a bread bowl for 0.75.', 0.75, 0, 1, 1),
(2, 'Fire Roasted Vegetable  ', 'Fire Roasted Vegetable\r\n ', 3.5, 1, 1, 1),
(3, 'Chicken Tortilla Soup', ' Served with sour cream and chips.', 3.5, 1, 1, 1),
(4, 'Amy''s Special Recipe Chili', ' Served with two kinds of cheese and fresh baked bread.', 3.59, 1, 1, 1),
(5, 'Garden Fresh Salads', 'Served with fresh baked bread and your choice of Ranch, Lite Ranch, Italian, Lite Italian, Bleu Cheese, Fat-free Raspberry Vinaigrette, Balsamic Vinaigrette, Thousand Island, Poppy Seed or Sesame Ginger on the side. Add a cookie for 0.50. Upgrade to Executive Salad that includes an added tasty cheesecake treat for $2.00.', 2, 0, 1, 2);
