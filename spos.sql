-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 02, 2021 at 04:25 AM
-- Server version: 5.7.34-log-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'General', 'no_image.png'),
(2, 'G02', 'Cloths', 'no_image.png'),
(3, 'Juice', 'Juice', 'no_image.png'),
(4, 'Drinks', 'Drinks', 'no_image.png'),
(5, 'Burger', 'Burger', 'no_image.png'),
(6, '112121', 'sandwich ساندويتش', 'no_image.png'),
(7, '11', 'test', 'no_image.png');

-- --------------------------------------------------------

--
-- Table structure for table `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_combo_items`
--

INSERT INTO `tec_combo_items` (`id`, `product_id`, `item_code`, `quantity`, `price`, `cost`) VALUES
(7, 14, '111222', 2.0000, NULL, NULL),
(8, 14, 'T001', 1.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `vat_id` varchar(25) DEFAULT NULL,
  `additional_no` varchar(25) DEFAULT NULL,
  `other_seller_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `vat_id`, `additional_no`, `other_seller_id`) VALUES
(1, 'Walk-in Client', '', '', '012345678', 'customer@tecdiary.com', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL),
(2, 'jiten', '', '', '12212212', 'abc@abc.com', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL),
(3, 'Ashok', 'vat-12222', '', '', 'aaa@aa.com', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL),
(4, 'imran', '', '', '12345678', 'imran@gmail.com', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL),
(5, 'Gg', '', '', '4455', '', NULL, '0', '0', '0', '0', '0', '0', '0', '0', NULL),
(6, 'جعفر محمر العبادي', '', '', '0562202422', '', NULL, '2244 faris ', '', 'Dhahran', 'ER', '', NULL, '1234567', '', ''),
(7, 'Jamal alsada', '', '', '05822076435', '', NULL, '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_expenses`
--

INSERT INTO `tec_expenses` (`id`, `date`, `reference`, `amount`, `note`, `created_by`, `attachment`, `store_id`) VALUES
(1, '2021-08-25 04:15:00', 'Fff', 1000.0000, 'ايجار', '4', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff'),
(3, 'master', 'Master');

-- --------------------------------------------------------

--
-- Table structure for table `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_login_attempts`
--

INSERT INTO `tec_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(23, 0x352e34312e3138352e3134, 'adnin', 1630502587);

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `print` varchar(25) DEFAULT NULL COMMENT 'Setting to print invoice type: B2B, B2C',
  `printer` int(10) DEFAULT NULL COMMENT 'Print invoice on Printer: values 1: A4, 2: Rolls, 3: Both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`, `print`, `printer`) VALUES
(1, '2021-08-30 17:32:16', 1, 1, NULL, 'cash', '', '', '', '', '', '', 15.0000, NULL, 4, NULL, '', 15.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(2, '2021-08-30 17:32:30', 2, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(3, '2021-08-30 17:32:50', 3, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(4, '2021-08-30 18:12:33', 4, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(5, '2021-08-30 20:12:03', 6, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(6, '2021-08-30 21:10:13', 7, 1, NULL, 'cash', '', '', '', '', '', '', 5574.0000, NULL, 6, NULL, '', 5574.0000, 0.0000, '', NULL, NULL, NULL, 3, 'b2c', 2),
(7, '2021-08-30 21:32:52', 8, 1, NULL, 'cash', '', '', '', '', '', '', 280.0000, NULL, 6, NULL, '', 280.0000, 0.0000, '', NULL, NULL, NULL, 3, 'b2c', 2),
(8, '2021-08-30 21:33:30', 9, 1, NULL, 'cash', '', '', '', '', '', '', 280.0000, NULL, 6, NULL, '', 280.0000, 0.0000, '', NULL, NULL, NULL, 3, 'b2c', 2),
(9, '2021-08-30 21:34:51', 10, 1, NULL, 'cash', '', '', '', '', '', '', 1500.0000, NULL, 6, NULL, '', 1500.0000, 0.0000, '', NULL, NULL, NULL, 3, 'b2c', 2),
(10, '2021-08-30 22:30:42', 11, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(11, '2021-08-30 22:33:24', 12, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(12, '2021-08-31 00:09:39', 13, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(13, '2021-08-31 00:19:23', 14, 1, NULL, 'cash', '', '', '', '', '', '', 39.0000, NULL, 1, NULL, '', 39.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(14, '2021-08-31 00:28:59', 15, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(15, '2021-08-31 00:31:15', 16, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(16, '2021-08-31 00:36:31', 17, 1, NULL, 'cash', '', '', '', '', '', '', 307.0000, NULL, 1, NULL, '', 307.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(17, '2021-08-31 00:41:49', 18, 1, NULL, 'cash', '', '', '', '', '', '', 1300.0000, NULL, 1, NULL, '', 1300.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(18, '2021-08-31 01:22:13', 19, 1, NULL, 'cash', '', '', '', '', '', '', 60.0000, NULL, 1, NULL, '', 100.0000, 40.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(19, '2021-08-31 01:23:59', 20, 7, NULL, 'cash', '', '', '', '', '', '', 25.0000, NULL, 1, NULL, '', 25.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(20, '2021-08-31 01:50:38', 21, 1, NULL, 'cash', '', '', '', '', '', '', 3.0000, NULL, 4, NULL, '', 50.0000, 47.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(21, '2021-08-31 02:03:29', 22, 1, NULL, 'cash', '', '', '', '', '', '', 107.0000, NULL, 4, NULL, '', 107.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(22, '2021-08-31 02:07:18', 23, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(23, '2021-08-31 02:08:09', 24, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(24, '2021-08-31 02:23:14', 25, 1, NULL, 'cash', '', '', '', '', '', '', 15.0000, NULL, 4, NULL, '', 15.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(25, '2021-08-31 03:04:34', 26, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(26, '2021-08-31 06:31:06', 27, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(27, '2021-08-31 06:31:55', 28, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(28, '2021-08-31 06:33:22', 29, 1, NULL, 'cash', '', '', '', '', '', '', 200.0000, NULL, 1, NULL, '', 200.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(29, '2021-09-01 03:39:47', 30, 1, NULL, 'cash', '', '', '', '', '', '', 800.0000, NULL, 4, NULL, '', 800.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(30, '2021-09-01 03:48:02', 31, 1, NULL, 'cash', '', '', '', '', '', '', 17.0000, NULL, 4, NULL, '', 17.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(31, '2021-09-01 03:48:04', 32, 1, NULL, 'cash', '', '', '', '', '', '', 17.0000, NULL, 4, NULL, '', 17.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(32, '2021-09-01 03:50:26', 33, 1, NULL, 'cash', '', '', '', '', '', '', 75.0000, NULL, 4, NULL, '', 75.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(33, '2021-09-01 03:51:18', 34, 1, NULL, 'cash', '', '', '', '', '', '', 42.0000, NULL, 4, NULL, '', 42.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(34, '2021-09-01 04:01:48', 35, 1, NULL, 'cash', '', '', '', '', '', '', 10414.0000, NULL, 4, NULL, '', 10414.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(35, '2021-09-01 05:01:16', 36, 1, NULL, 'cash', '', '', '', '', '', '', 300.0000, NULL, 4, NULL, '', 300.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(36, '2021-09-01 05:16:12', 37, 1, NULL, 'other', '', '', '', '', '', '', 74.0000, NULL, 4, NULL, '', 500.0000, 426.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(37, '2021-09-01 05:17:44', 38, 1, NULL, 'cash', '', '', '', '', '', '', 65.0000, NULL, 4, NULL, '', 65.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(38, '2021-09-01 06:10:10', 39, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 100.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(39, '2021-09-01 06:48:12', 40, 1, NULL, 'cash', '', '', '', '', '', '', 25.0000, NULL, 4, NULL, '', 100.0000, 75.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(40, '2021-09-01 06:49:45', 41, 1, NULL, 'cash', '', '', '', '', '', '', 25.0000, NULL, 4, NULL, '', 25.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(41, '2021-09-01 07:01:48', 42, 1, NULL, 'cash', '', '', '', '', '', '', 83.0000, NULL, 4, NULL, '', 83.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(42, '2021-09-01 16:52:26', 43, 1, NULL, 'cash', '', '', '', '', '', '', 300.0000, NULL, 4, NULL, '', 500.0000, 200.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(43, '2021-09-02 00:01:44', 45, 1, NULL, 'cash', '', '', '', '', '', '', 300.0000, NULL, 1, NULL, '', 300.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(44, '2021-09-02 00:41:05', 46, 4, NULL, 'cash', '', '', '', '', '', '', 150.0000, NULL, 1, NULL, '30 days credit', 150.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(45, '2021-09-02 00:53:36', 47, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 4, NULL, '', 100.0000, 93.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(46, '2021-09-02 00:54:43', 48, 1, NULL, 'cash', '', '', '', '', '', '', 100.0000, NULL, 4, NULL, '', 500.0000, 400.0000, '', NULL, NULL, NULL, 1, 'b2c', 1),
(47, '2021-09-02 03:50:47', 49, 1, NULL, 'cash', '', '', '', '', '', '', 65.0000, NULL, 1, NULL, '', 500.0000, 435.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(48, '2021-09-02 03:53:14', 50, 6, NULL, 'cash', '', '', '', '', '', '', 25.0000, NULL, 1, NULL, '', 100.0000, 75.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(49, '2021-09-02 03:53:48', 51, 1, NULL, 'CC', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, -7.0000, '', NULL, NULL, NULL, 1, 'b2c', 2),
(50, '2021-09-02 03:54:41', 52, 1, NULL, 'cash', '', '', '', '', '', '', 7.0000, NULL, 1, NULL, '', 7.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(51, '2021-09-02 04:09:38', 53, 1, NULL, 'cash', '', '', '', '', '', '', 40.0000, NULL, 8, NULL, '', 500.0000, 460.0000, '', NULL, NULL, NULL, 3, 'b2c', 2),
(52, '2021-09-02 04:52:13', 54, 1, NULL, 'cash', '', '', '', '', '', '', 360.0000, NULL, 7, NULL, '', 360.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1),
(53, '2021-09-02 04:52:14', 55, 1, NULL, 'cash', '', '', '', '', '', '', 360.0000, NULL, 7, NULL, '', 360.0000, 0.0000, '', NULL, NULL, NULL, 1, 'b2b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_printers`
--

INSERT INTO `tec_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(1, 'XPrinter', 'network', 'default', 45, '', 0x3139322e3136382e312e323030, '9100'),
(3, 'Rrr', 'network', 'default', 0, 'sub://deed/ddd', 0x3139382e39392e3339332e3333, '9100');

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000',
  `active` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1: Active, 2:Inactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`, `active`) VALUES
(1, 'sam001', 'Samsung Mobile', 1, 15.0000, 'no_image.png', '10', 10.0000, 0, 0.0000, 'code25', 'standard', '', 0.0000, 1),
(2, 'one001', 'OnePlus', 1, 5000.0000, 'no_image.png', NULL, 1000.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(3, 'mobserv001', 'Mobile-service', 1, 200.0000, 'no_image.png', NULL, 0.0000, 0, 0.0000, 'code25', 'service', '', 0.0000, 1),
(4, 'T001', 'T-shirt', 2, 200.0000, 'no_image.png', NULL, 100.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(5, 'J001', 'Jeans', 2, 100.0000, 'no_image.png', NULL, 50.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(6, 'sk002', 'sketcher', 1, 280.0000, 'no_image.png', NULL, 250.0000, 0, 0.0000, 'code128', 'standard', 'ff', 2.0000, 1),
(7, '123456', 'تجربة منتج', 1, 18.0000, 'no_image.png', NULL, 10.0000, 0, 0.0000, 'code39', 'standard', '', 0.0000, 1),
(8, '111222', 'Mango Juice', 1, 7.0000, '2e7562e6724c5e27a3916a5593657b58.jpg', NULL, 5.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(9, '111233455', 'Orange Juice', 1, 7.0000, '2e87d369b316f0f02f12fa605da3223f.jpg', NULL, 5.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(10, '2222323', 'Apple', 1, 8.0000, '4a714d66f2fd1d08cc868834518b88a6.jpg', NULL, 7.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(11, '111', 'Burger', 5, 25.0000, '07b7a796f61f6d969f24355066386527.jpg', NULL, 18.0000, 0, 0.0000, 'code128', 'standard', '', 0.0000, 1),
(12, '1111', 'Mango Fresh Juice', 1, 8.0000, '1f191ca9c627519ff1b5df0c27708834.jpg', NULL, 5.0000, 0, 0.0000, 'code128', 'standard', '<ul><li><span></span></li></ul>', 0.0000, 1),
(13, '11110000', 'فلوسيي', 7, 20.0000, 'no_image.png', NULL, 0.0000, 0, 0.0000, 'upca', 'service', '', 0.0000, 1),
(14, 'Ee', 'JMAA', 6, 30.0000, 'no_image.png', NULL, 110.0000, 0, 0.0000, 'code128', 'combo', '', 0.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL,
  `display` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '1: show, 0:hide'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`, `display`) VALUES
(1, 1, 1, 860.0000, 0.0000, 1),
(2, 1, 2, 4.0000, 6000.0000, 1),
(3, 2, 1, -15.0000, 0.0000, 1),
(4, 2, 2, 46.0000, 15000.0000, 1),
(5, 2, 3, -2.0000, 15000.0000, 1),
(6, 1, 3, 5.0000, 5000.0000, 1),
(7, 3, 1, 0.0000, 300.0000, 1),
(8, 3, 2, 0.0000, 400.0000, 1),
(9, 3, 3, 0.0000, 500.0000, 1),
(10, 4, 1, -33.0000, 0.0000, 1),
(11, 4, 2, 9.0000, 300.0000, 1),
(12, 4, 3, 0.0000, 0.0000, 1),
(13, 5, 1, -28.0000, 0.0000, 1),
(14, 5, 2, -11.0000, 100.0000, 1),
(15, 5, 3, 0.0000, 0.0000, 1),
(16, 6, 1, -2.0000, 0.0000, 1),
(17, 6, 2, 0.0000, 0.0000, 1),
(18, 6, 3, -11.0000, 0.0000, 1),
(19, 6, 4, 48.0000, 0.0000, 1),
(20, 1, 4, 0.0000, 5000.0000, 1),
(21, 7, 1, 230.0000, 18.0000, 1),
(22, 7, 2, -4.0000, 0.0000, 1),
(23, 7, 3, -1.0000, 0.0000, 1),
(24, 7, 4, -1.0000, 0.0000, 1),
(25, 2, 4, 0.0000, 15000.0000, 1),
(26, 8, 1, 4.0000, 0.0000, 1),
(27, 8, 2, 0.0000, 0.0000, 1),
(28, 8, 3, 0.0000, 0.0000, 1),
(29, 8, 4, 0.0000, 0.0000, 1),
(30, 9, 1, -34.0000, 0.0000, 1),
(31, 9, 2, 0.0000, 0.0000, 1),
(32, 9, 3, -3.0000, 0.0000, 1),
(33, 9, 4, 0.0000, 0.0000, 1),
(34, 10, 1, -4.0000, 0.0000, 1),
(35, 10, 2, 0.0000, 0.0000, 1),
(36, 10, 3, 0.0000, 0.0000, 1),
(37, 10, 4, 0.0000, 0.0000, 1),
(38, 11, 1, 50.0000, 0.0000, 1),
(39, 11, 2, -15.0000, 0.0000, 1),
(40, 11, 3, 0.0000, 0.0000, 1),
(41, 11, 4, 0.0000, 0.0000, 1),
(42, 12, 1, -12.0000, 0.0000, 1),
(43, 12, 2, 0.0000, 0.0000, 1),
(44, 12, 3, -1.0000, 0.0000, 1),
(45, 12, 4, 0.0000, 0.0000, 1),
(46, 13, 1, 0.0000, 0.0000, 1),
(47, 13, 2, 0.0000, 0.0000, 1),
(48, 13, 3, 0.0000, 0.0000, 1),
(49, 13, 4, 0.0000, 0.0000, 1),
(50, 14, 1, 0.0000, 0.0000, 1),
(51, 14, 2, 0.0000, 0.0000, 1),
(52, 14, 3, 0.0000, 0.0000, 1),
(53, 14, 4, 0.0000, 0.0000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`, `created_by`, `store_id`) VALUES
(1, '', '2021-08-18 07:27:00', '', 10000.0000, NULL, 1, 1, 2, 2),
(2, '', '2021-08-25 04:03:00', 'Jjjj', 5500.0000, NULL, 1, 1, 4, 1),
(3, 'تج', '2021-08-25 04:06:00', '', 1000.0000, NULL, 1, 1, 4, 1),
(4, 'No,,,k', '2021-08-28 14:54:00', '', 1500.0000, NULL, 1, 1, 1, 1),
(5, 'Hh', '2021-08-30 22:24:00', '', 5.0000, NULL, 1, 1, 6, 3),
(6, 'Hhg', '2021-09-01 03:43:00', '', 566788.0000, NULL, 1, 0, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_purchase_items`
--

INSERT INTO `tec_purchase_items` (`id`, `purchase_id`, `product_id`, `quantity`, `cost`, `subtotal`) VALUES
(1, 1, 1, 10.0000, 1000.0000, 10000.0000),
(2, 2, 2, 5.0000, 1000.0000, 5000.0000),
(3, 2, 6, 2.0000, 250.0000, 500.0000),
(5, 3, 7, 100.0000, 10.0000, 1000.0000),
(6, 4, 7, 100.0000, 10.0000, 1000.0000),
(7, 4, 8, 100.0000, 5.0000, 500.0000),
(8, 5, 8, 1.0000, 5.0000, 5.0000),
(9, 6, 4, 1.0000, 566788.0000, 566788.0000);

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2021-08-17 18:20:10', 1, 500.0000, 'close', 534.5000, 0, 0, 534.5000, 0, 0, 'Close By Jiten', '2021-08-18 04:47:16', '0', 1, 1),
(2, '2021-08-18 04:48:49', 1, 500.0000, 'close', 2245.0000, 0, 0, 2245.0000, 0, 0, '', '2021-08-31 01:26:36', NULL, 1, 1),
(3, '2021-08-18 05:55:36', 3, 200.0000, 'close', 1218.0000, 0, 0, 1218.0000, 0, 0, '', '2021-08-24 06:31:46', NULL, 3, 2),
(4, '2021-08-18 06:45:26', 2, 1000.0000, 'close', 458320.0000, 0, 0, 458320.0000, 0, 0, '', '2021-08-21 08:48:38', NULL, 2, 2),
(5, '2021-08-21 08:48:55', 2, 1000.0000, 'close', 46018.0000, 0, 0, 46018.0000, 0, 0, '', '2021-08-26 03:31:19', NULL, 2, 2),
(6, '2021-08-22 03:27:23', 4, 5000.0000, 'close', 5000.0000, 0, 0, 5000.0000, 0, 0, '', '2021-08-22 03:39:27', NULL, 4, 1),
(7, '2021-08-22 03:39:56', 4, 4500.0000, 'close', 58954.5000, 0, 0, 58954.5000, 0, 0, '', '2021-08-25 03:58:29', '0', 4, 1),
(8, '2021-08-22 03:40:55', 5, 4500.0000, 'close', 4500.0000, 0, 0, 4500.0000, 0, 0, '', '2021-08-22 03:47:40', NULL, 5, 4),
(9, '2021-08-22 03:49:32', 5, 4500.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4),
(10, '2021-08-24 04:45:35', 6, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(11, '2021-08-24 06:31:55', 3, 0.0000, 'close', 375.0000, 0, 0, 375.0000, 0, 0, '', '2021-08-29 00:57:09', NULL, 3, 2),
(12, '2021-08-25 03:58:44', 4, 0.0000, 'close', -883.0000, 0, 0, -883.0000, 0, 0, '', '2021-08-27 15:02:38', NULL, 4, 1),
(13, '2021-08-26 03:31:30', 2, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(14, '2021-08-27 15:02:53', 4, 0.0000, 'close', 23220.0000, 0, 0, 23220.0000, 0, 0, '', '2021-08-28 21:03:37', NULL, 4, 1),
(15, '2021-08-28 21:03:49', 4, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(16, '2021-08-31 06:30:44', 1, 0.0000, 'close', 761.0000, 0, 1, 761.0000, 0, 1, '', '2021-09-02 04:06:14', NULL, 1, 1),
(17, '2021-09-02 04:09:25', 8, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3),
(18, '2021-09-02 04:48:03', 7, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(19, '2021-09-02 04:48:04', 7, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `store_name` varchar(100) DEFAULT NULL,
  `store_invoice_id` int(11) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `store_name`, `store_invoice_id`, `hold_ref`) VALUES
(1, '2021-08-30 10:32:16', 1, 'Walk-in Client', 13.0435, 0.0000, NULL, 0.0000, 0.0000, 1.9565, '', 0.0000, 1.9565, 15.0000, 1, 0.0000, 15.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 1, ''),
(2, '2021-08-30 10:32:30', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 2, ''),
(3, '2021-08-30 10:32:50', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 3, ''),
(4, '2021-08-30 11:12:33', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 4, ''),
(5, '2021-08-30 11:20:04', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 0.0000, 4, NULL, NULL, '', 'due', 0.0000, 1, 'الوحش', 5, ''),
(6, '2021-08-30 13:12:03', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 6, ''),
(7, '2021-08-30 14:10:13', 1, 'Walk-in Client', 4846.9565, 0.0000, NULL, 0.0000, 0.0000, 727.0435, '', 0.0000, 727.0435, 5574.0000, 3, 0.0000, 5574.0000, 6, NULL, NULL, '', 'paid', 0.0000, 3, 'A2POS ااا', 1, ''),
(8, '2021-08-30 14:32:52', 1, 'Walk-in Client', 243.4783, 0.0000, NULL, 0.0000, 0.0000, 36.5217, '', 0.0000, 36.5217, 280.0000, 1, 0.0000, 280.0000, 6, NULL, NULL, '', 'paid', 0.0000, 3, 'A2POS ااا', 2, ''),
(9, '2021-08-30 14:33:30', 1, 'Walk-in Client', 243.4783, 0.0000, NULL, 0.0000, 0.0000, 36.5217, '', 0.0000, 36.5217, 280.0000, 1, 0.0000, 280.0000, 6, NULL, NULL, '', 'paid', 0.0000, 3, 'A2POS ااا', 3, ''),
(10, '2021-08-30 14:34:51', 1, 'Walk-in Client', 1304.3478, 0.0000, NULL, 0.0000, 0.0000, 195.6522, '', 0.0000, 195.6522, 1500.0000, 1, 0.0000, 1500.0000, 6, NULL, NULL, '', 'paid', 0.0000, 3, 'A2POS ااا', 4, ''),
(11, '2021-08-30 15:30:42', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 7, ''),
(12, '2021-08-30 15:33:24', 1, 'Walk-in Client', 6.3636, 0.0000, NULL, 0.0000, 0.0000, 0.6364, '', 0.0000, 0.6364, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 8, ''),
(13, '2021-08-30 17:09:39', 1, 'Walk-in Client', 90.9091, 0.0000, NULL, 0.0000, 0.0000, 9.0909, '', 0.0000, 9.0909, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 9, ''),
(14, '2021-08-30 17:19:23', 1, 'Walk-in Client', 33.9130, 0.0000, NULL, 0.0000, 0.0000, 5.0870, '', 0.0000, 5.0870, 39.0000, 2, 0.0000, 39.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 10, ''),
(15, '2021-08-30 17:28:59', 1, 'Walk-in Client', 5.6000, 0.0000, NULL, 0.0000, 0.0000, 1.4000, '', 0.0000, 1.4000, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 11, ''),
(16, '2021-08-30 17:31:15', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 12, ''),
(17, '2021-08-30 17:36:31', 1, 'Walk-in Client', 266.9566, 0.0000, NULL, 0.0000, 0.0000, 40.0434, '', 0.0000, 40.0434, 307.0000, 2, 0.0000, 307.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 13, ''),
(18, '2021-08-30 17:41:49', 1, 'Walk-in Client', 1130.4348, 0.0000, NULL, 0.0000, 0.0000, 169.5652, '', 0.0000, 169.5652, 1300.0000, 2, 0.0000, 1300.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 14, ''),
(19, '2021-08-30 18:22:13', 1, 'Walk-in Client', 49.5653, 0.0000, NULL, 0.0000, 0.0000, 7.4347, '', 0.0000, 7.4347, 57.0000, 2, 0.0000, 60.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 15, ''),
(20, '2021-08-30 18:23:59', 7, 'Jamal alsada', 21.7391, 0.0000, NULL, 0.0000, 0.0000, 3.2609, '', 0.0000, 3.2609, 25.0000, 1, 0.0000, 25.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 16, ''),
(21, '2021-08-30 18:50:38', 1, 'Walk-in Client', 2.6087, 0.0000, NULL, 0.0000, 0.0000, 0.3913, '', 0.0000, 0.3913, 3.0000, 1, 0.0000, 3.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 17, ''),
(22, '2021-08-30 19:03:29', 1, 'Walk-in Client', 93.0435, 0.0000, NULL, 0.0000, 0.0000, 13.9565, '', 0.0000, 13.9565, 107.0000, 2, 0.0000, 107.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 18, ''),
(23, '2021-08-30 19:07:18', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 19, ''),
(24, '2021-08-30 19:08:09', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 20, ''),
(25, '2021-08-30 19:23:14', 1, 'Walk-in Client', 13.0435, 0.0000, NULL, 0.0000, 0.0000, 1.9565, '', 0.0000, 1.9565, 15.0000, 1, 0.0000, 15.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 21, ''),
(26, '2021-08-30 20:04:34', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 22, ''),
(27, '2021-08-30 23:31:06', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 23, ''),
(28, '2021-08-30 23:31:55', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 24, ''),
(29, '2021-08-30 23:33:22', 1, 'Walk-in Client', 173.9130, 0.0000, NULL, 0.0000, 0.0000, 26.0870, '', 0.0000, 26.0870, 200.0000, 1, 0.0000, 200.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 25, ''),
(30, '2021-08-31 20:39:47', 1, 'Walk-in Client', 695.6521, 0.0000, NULL, 0.0000, 0.0000, 104.3479, '', 0.0000, 104.3479, 800.0000, 2, 0.0000, 800.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 26, ''),
(31, '2021-08-31 20:48:02', 1, 'Walk-in Client', 14.7827, 0.0000, NULL, 0.0000, 0.0000, 2.2173, '', 0.0000, 2.2173, 17.0000, 3, 0.0000, 17.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 27, ''),
(32, '2021-08-31 20:48:04', 1, 'Walk-in Client', 14.7827, 0.0000, NULL, 0.0000, 0.0000, 2.2173, '', 0.0000, 2.2173, 17.0000, 3, 0.0000, 17.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 28, ''),
(33, '2021-08-31 20:50:26', 1, 'Walk-in Client', 65.2174, 0.0000, NULL, 0.0000, 0.0000, 9.7826, '', 0.0000, 9.7826, 75.0000, 1, 0.0000, 75.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 29, ''),
(34, '2021-08-31 20:51:18', 1, 'Walk-in Client', 36.5218, 0.0000, NULL, 0.0000, 0.0000, 5.4782, '', 0.0000, 5.4782, 42.0000, 4, 0.0000, 42.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 30, ''),
(35, '2021-08-31 21:01:48', 1, 'Walk-in Client', 9055.6523, 0.0000, NULL, 0.0000, 0.0000, 1358.3477, '', 0.0000, 1358.3477, 10414.0000, 8, 0.0000, 10414.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 31, ''),
(36, '2021-08-31 22:01:16', 1, 'Walk-in Client', 173.9130, 0.0000, NULL, 0.0000, 0.0000, 26.0870, '', 0.0000, 26.0870, 200.0000, 1, 0.0000, 300.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 32, ''),
(37, '2021-08-31 22:16:12', 1, 'Walk-in Client', 64.3479, 0.0000, NULL, 0.0000, 0.0000, 9.6521, '', 0.0000, 9.6521, 74.0000, 2, 0.0000, 74.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 33, ''),
(38, '2021-08-31 22:17:44', 1, 'Walk-in Client', 56.5218, 0.0000, NULL, 0.0000, 0.0000, 8.4782, '', 0.0000, 8.4782, 65.0000, 3, 0.0000, 65.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 34, ''),
(39, '2021-08-31 23:10:10', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 35, ''),
(40, '2021-08-31 23:48:12', 1, 'Walk-in Client', 21.7391, 0.0000, NULL, 0.0000, 0.0000, 3.2609, '', 0.0000, 3.2609, 25.0000, 1, 0.0000, 25.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 36, ''),
(41, '2021-08-31 23:49:45', 1, 'Walk-in Client', 21.7391, 0.0000, NULL, 0.0000, 0.0000, 3.2609, '', 0.0000, 3.2609, 25.0000, 1, 0.0000, 25.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 37, ''),
(42, '2021-09-01 00:01:48', 1, 'Walk-in Client', 72.1739, 0.0000, NULL, 0.0000, 0.0000, 10.8261, '', 0.0000, 10.8261, 83.0000, 2, 0.0000, 83.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 38, ''),
(43, '2021-09-01 09:52:26', 1, 'Walk-in Client', 260.8696, 0.0000, NULL, 0.0000, 0.0000, 39.1304, '', 0.0000, 39.1304, 300.0000, 1, 0.0000, 300.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 39, ''),
(44, '2021-09-01 17:00:07', 6, 'جعفر محمر العبادي', 65.2174, 0.0000, NULL, 0.0000, 0.0000, 9.7826, '', 0.0000, 9.7826, 75.0000, 1, 0.0000, 0.0000, 1, NULL, NULL, '', 'due', 0.0000, 1, 'الوحش', 40, ''),
(45, '2021-09-01 17:01:44', 1, 'Walk-in Client', 260.8696, 0.0000, NULL, 0.0000, 0.0000, 39.1304, '', 0.0000, 39.1304, 300.0000, 1, 0.0000, 300.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 41, ''),
(46, '2021-09-01 17:41:05', 4, 'imran', 130.4348, 0.0000, NULL, 0.0000, 0.0000, 19.5652, '', 0.0000, 19.5652, 150.0000, 1, 0.0000, 150.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 42, ''),
(47, '2021-09-01 17:53:36', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 43, ''),
(48, '2021-09-01 17:54:43', 1, 'Walk-in Client', 86.9565, 0.0000, NULL, 0.0000, 0.0000, 13.0435, '', 0.0000, 13.0435, 100.0000, 1, 0.0000, 100.0000, 4, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 44, ''),
(49, '2021-09-01 20:50:47', 1, 'Walk-in Client', 56.5218, 0.0000, NULL, 0.0000, 0.0000, 8.4782, '', 0.0000, 8.4782, 65.0000, 3, 0.0000, 65.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 45, ''),
(50, '2021-09-01 20:53:14', 6, 'جعفر محمر العبادي', 21.7392, 0.0000, NULL, 0.0000, 0.0000, 3.2608, '', 0.0000, 3.2608, 25.0000, 2, 0.0000, 25.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 46, 'f vbb'),
(51, '2021-09-01 20:53:48', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 47, ''),
(52, '2021-09-01 20:54:41', 1, 'Walk-in Client', 6.0870, 0.0000, NULL, 0.0000, 0.0000, 0.9130, '', 0.0000, 0.9130, 7.0000, 1, 0.0000, 7.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 48, ''),
(53, '2021-09-01 21:09:38', 1, 'Walk-in Client', 34.7827, 0.0000, NULL, 0.0000, 0.0000, 5.2173, '', 0.0000, 5.2173, 40.0000, 4, 0.0000, 40.0000, 8, NULL, NULL, '', 'paid', 0.0000, 3, 'A2POS ااا', 5, ''),
(54, '2021-09-01 21:52:13', 1, 'Walk-in Client', 313.0435, 0.0000, NULL, 0.0000, 0.0000, 46.9565, '', 0.0000, 46.9565, 360.0000, 1, 0.0000, 360.0000, 7, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 49, ''),
(55, '2021-09-01 21:52:14', 1, 'Walk-in Client', 313.0435, 0.0000, NULL, 0.0000, 0.0000, 46.9565, '', 0.0000, 46.9565, 360.0000, 1, 0.0000, 360.0000, 7, NULL, NULL, '', 'paid', 0.0000, 1, 'الوحش', 50, '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(1, 1, 1, 1.0000, 15.0000, 13.0435, '0', 0.0000, 15, 1.9565, 15.0000, 15.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(2, 2, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(3, 3, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(4, 4, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(5, 5, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(6, 6, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(7, 7, 1, 1.0000, 5000.0000, 4347.8261, '0', 0.0000, 15, 652.1739, 5000.0000, 5000.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(8, 7, 6, 2.0000, 280.0000, 243.4783, '0', 0.0000, 15, 73.0435, 560.0000, 280.0000, 250.0000, 'sk002', 'sketcher', ''),
(9, 7, 9, 2.0000, 7.0000, 6.0870, '0', 0.0000, 15, 1.8261, 14.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(10, 8, 6, 1.0000, 280.0000, 243.4783, '0', 0.0000, 15, 36.5217, 280.0000, 280.0000, 250.0000, 'sk002', 'sketcher', ''),
(11, 9, 6, 1.0000, 280.0000, 243.4783, '0', 0.0000, 15, 36.5217, 280.0000, 280.0000, 250.0000, 'sk002', 'sketcher', ''),
(12, 10, 3, 3.0000, 500.0000, 434.7826, '0', 0.0000, 15, 195.6522, 1500.0000, 500.0000, 0.0000, 'mobserv001', 'Mobile-service', ''),
(13, 11, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(14, 12, 8, 1.0000, 7.0000, 6.3636, '0', 0.0000, 10, 0.6364, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(15, 13, 5, 1.0000, 100.0000, 90.9091, '0', 0.0000, 10, 9.0909, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(16, 14, 8, 2.0000, 7.0000, 6.0870, '0', 0.0000, 15, 1.8261, 14.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(17, 14, 11, 1.0000, 25.0000, 21.7391, '0', 0.0000, 15, 3.2609, 25.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(18, 15, 8, 1.0000, 7.0000, 5.6000, '0', 0.0000, 25, 1.4000, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(19, 16, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(20, 17, 3, 1.0000, 300.0000, 260.8696, '0', 0.0000, 15, 39.1304, 300.0000, 300.0000, 0.0000, 'mobserv001', 'Mobile-service', ''),
(21, 17, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(22, 18, 4, 4.0000, 200.0000, 173.9130, '0', 0.0000, 15, 104.3478, 800.0000, 200.0000, 100.0000, 'T001', 'T-shirt', ''),
(23, 18, 5, 5.0000, 100.0000, 86.9565, '0', 0.0000, 15, 65.2174, 500.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(24, 19, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 10.0000, 5.0000, '111222', 'Mango Juice', ''),
(25, 19, 11, 2.0000, 25.0000, 21.7391, '0', 0.0000, 15, 6.5217, 50.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(26, 20, 11, 1.0000, 25.0000, 21.7391, '0', 0.0000, 15, 3.2609, 25.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(27, 21, 12, 1.0000, 3.0000, 2.6087, '0', 0.0000, 15, 0.3913, 3.0000, 3.0000, 2.0000, '1111', 'Mango Fresh Juice', ''),
(28, 22, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(29, 22, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(30, 23, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(31, 24, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(32, 25, 1, 1.0000, 15.0000, 13.0435, '0', 0.0000, 15, 1.9565, 15.0000, 15.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(33, 26, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(34, 27, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(35, 28, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(36, 29, 4, 1.0000, 200.0000, 173.9130, '0', 0.0000, 15, 26.0870, 200.0000, 200.0000, 100.0000, 'T001', 'T-shirt', ''),
(37, 30, 4, 1.0000, 200.0000, 173.9130, '0', 0.0000, 15, 26.0870, 200.0000, 200.0000, 100.0000, 'T001', 'T-shirt', ''),
(38, 30, 5, 6.0000, 100.0000, 86.9565, '0', 0.0000, 15, 78.2609, 600.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(39, 31, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(40, 31, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(41, 31, 12, 1.0000, 3.0000, 2.6087, '0', 0.0000, 15, 0.3913, 3.0000, 3.0000, 2.0000, '1111', 'Mango Fresh Juice', ''),
(42, 32, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(43, 32, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(44, 32, 12, 1.0000, 3.0000, 2.6087, '0', 0.0000, 15, 0.3913, 3.0000, 3.0000, 2.0000, '1111', 'Mango Fresh Juice', ''),
(45, 33, 11, 3.0000, 25.0000, 21.7391, '0', 0.0000, 15, 9.7826, 75.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(46, 34, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(47, 34, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(48, 34, 11, 1.0000, 25.0000, 21.7391, '0', 0.0000, 15, 3.2609, 25.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(49, 34, 12, 1.0000, 3.0000, 2.6087, '0', 0.0000, 15, 0.3913, 3.0000, 3.0000, 2.0000, '1111', 'Mango Fresh Juice', ''),
(50, 35, 1, 1.0000, 15.0000, 13.0435, '0', 0.0000, 15, 1.9565, 15.0000, 15.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(51, 35, 2, 2.0000, 5000.0000, 4347.8261, '0', 0.0000, 15, 1304.3478, 10000.0000, 5000.0000, 1000.0000, 'one001', 'OnePlus', ''),
(52, 35, 3, 1.0000, 300.0000, 260.8696, '0', 0.0000, 15, 39.1304, 300.0000, 300.0000, 0.0000, 'mobserv001', 'Mobile-service', ''),
(53, 35, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(54, 35, 9, 4.0000, 7.0000, 6.0870, '0', 0.0000, 15, 3.6522, 28.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(55, 35, 10, 1.0000, 8.0000, 6.9565, '0', 0.0000, 15, 1.0435, 8.0000, 8.0000, 7.0000, '2222323', 'Apple', ''),
(56, 35, 11, 2.0000, 25.0000, 21.7391, '0', 0.0000, 15, 6.5217, 50.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(57, 35, 12, 2.0000, 3.0000, 2.6087, '0', 0.0000, 15, 0.7826, 6.0000, 3.0000, 2.0000, '1111', 'Mango Fresh Juice', ''),
(58, 36, 5, 2.0000, 100.0000, 86.9565, '0', 0.0000, 15, 26.0870, 200.0000, 150.0000, 50.0000, 'J001', 'Jeans', ''),
(59, 37, 11, 2.0000, 25.0000, 21.7391, '0', 0.0000, 15, 6.5217, 50.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(60, 37, 12, 3.0000, 8.0000, 6.9565, '0', 0.0000, 15, 3.1304, 24.0000, 8.0000, 5.0000, '1111', 'Mango Fresh Juice', ''),
(61, 38, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(62, 38, 11, 2.0000, 25.0000, 21.7391, '0', 0.0000, 15, 6.5217, 50.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(63, 38, 12, 1.0000, 8.0000, 6.9565, '0', 0.0000, 15, 1.0435, 8.0000, 8.0000, 5.0000, '1111', 'Mango Fresh Juice', ''),
(64, 39, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(65, 40, 11, 1.0000, 25.0000, 21.7391, '0', 0.0000, 15, 3.2609, 25.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(66, 41, 11, 1.0000, 25.0000, 21.7391, '0', 0.0000, 15, 3.2609, 25.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(67, 42, 11, 3.0000, 25.0000, 21.7391, '0', 0.0000, 15, 9.7826, 75.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(68, 42, 12, 1.0000, 8.0000, 6.9565, '0', 0.0000, 15, 1.0435, 8.0000, 8.0000, 5.0000, '1111', 'Mango Fresh Juice', ''),
(69, 43, 3, 1.0000, 300.0000, 260.8696, '0', 0.0000, 15, 39.1304, 300.0000, 300.0000, 0.0000, 'mobserv001', 'Mobile-service', ''),
(70, 44, 1, 5.0000, 15.0000, 13.0435, '0', 0.0000, 15, 9.7826, 75.0000, 15.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(71, 45, 3, 1.0000, 300.0000, 260.8696, '0', 0.0000, 15, 39.1304, 300.0000, 300.0000, 0.0000, 'mobserv001', 'Mobile-service', ''),
(72, 46, 1, 10.0000, 15.0000, 13.0435, '0', 0.0000, 15, 19.5652, 150.0000, 15.0000, 10.0000, 'sam001', 'Samsung Mobile', ''),
(73, 47, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(74, 48, 5, 1.0000, 100.0000, 86.9565, '0', 0.0000, 15, 13.0435, 100.0000, 100.0000, 50.0000, 'J001', 'Jeans', ''),
(75, 49, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(76, 49, 11, 2.0000, 25.0000, 21.7391, '0', 0.0000, 15, 6.5217, 50.0000, 25.0000, 18.0000, '111', 'Burger', ''),
(77, 49, 12, 1.0000, 8.0000, 6.9565, '0', 0.0000, 15, 1.0435, 8.0000, 8.0000, 5.0000, '1111', 'Mango Fresh Juice', ''),
(78, 50, 7, 1.0000, 18.0000, 15.6522, '0', 0.0000, 15, 2.3478, 18.0000, 18.0000, 10.0000, '123456', 'تجربة منتج', ''),
(79, 50, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(80, 51, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(81, 52, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(82, 53, 7, 1.0000, 18.0000, 15.6522, '0', 0.0000, 15, 2.3478, 18.0000, 18.0000, 10.0000, '123456', 'تجربة منتج', ''),
(83, 53, 8, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111222', 'Mango Juice', ''),
(84, 53, 9, 1.0000, 7.0000, 6.0870, '0', 0.0000, 15, 0.9130, 7.0000, 7.0000, 5.0000, '111233455', 'Orange Juice', ''),
(85, 53, 12, 1.0000, 8.0000, 6.9565, '0', 0.0000, 15, 1.0435, 8.0000, 8.0000, 5.0000, '1111', 'Mango Fresh Juice', ''),
(86, 54, 14, 12.0000, 30.0000, 26.0870, '0', 0.0000, 15, 46.9565, 360.0000, 30.0000, 110.0000, 'Ee', 'JMAA', ''),
(87, 55, 14, 12.0000, 30.0000, 26.0870, '0', 0.0000, 15, 46.9565, 360.0000, 30.0000, 110.0000, 'Ee', 'JMAA', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('0a345b4c62822cf3239262c18f79d0cabc393196', '142.247.160.106', 1630442798, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434323739383b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('0e342319eec261ab9391c5f888d3b614e31e55e5', '5.41.185.14', 1630507136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373132373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333534393539223b6c6173745f69707c733a31323a2239352e3138342e32322e3430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('12f1870824c4194c7923f868e202fdcde79e1d41', '95.184.22.40', 1630355266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303335353236363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333332393632223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b),
('130e8f655aa72a006f27fbc81ae5a68da6e4239a', '5.41.193.81', 1630336061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333363036313b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('13c4d5c8c06adf8c11d05472469a5b169b0f0e0a', '51.252.64.155', 1630520394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532303339343b6964656e746974797c733a343a2274657374223b757365726e616d657c733a343a2274657374223b656d61696c7c733a31313a226c407961686f6f2e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a343a2254657374223b6c6173745f6e616d657c733a343a2254657374223b637265617465645f6f6e7c733a32343a224672692032372041756720323032312030383a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330303837313535223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b),
('1609fe06d314ed3b7d040ba138ff796877ee66dc', '5.41.185.14', 1630483501, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438333330303b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343430353839223b6c6173745f69707c733a31353a223134322e3234372e3136302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('1c04d5bedaef3603a7d991ea12f0d0a3bd249c86', '49.36.212.197', 1630526882, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532363838323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037393931223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('1d4ff8674e7eaa64f09c580c7482ee03d5dc19da', '142.247.2.147', 1630340655, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334303532343b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333339363230223b6c6173745f69707c733a31333a2239352e3231392e3230332e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('1fd1acf0fd116b03acfd395ec2d6cc9982b16604', '49.36.212.197', 1630526473, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532363437333b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037393931223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('1fdf53a777ce615a63bdfb3f4144993188bc848c', '51.252.64.155', 1630519392, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303531393339323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037343231223b6c6173745f69707c733a31333a223133392e36342e35392e313330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('2901d489531ddf005e41f12d3d5608048b4a94d3', '142.247.160.106', 1630443251, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434333235313b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('2af8e4a70b6c5309d850cfc6eb8b5bd44debb535', '178.80.57.32', 1630432910, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433323636323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343331323934223b6c6173745f69707c733a31333a2239332e3136392e38302e323236223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('2cbe0824fb8eef6b75c15936594085632d063e25', '49.36.212.197', 1630526985, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532363838323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037393931223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('2e50617c6c9f4b61e163d4330d19d16440107839', '139.64.59.130', 1630507265, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373236353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('2eb6fe5cbe1b2826bf8c4bcb28b5aa56fa51c0ea', '78.95.59.221', 1630559847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303535393834373b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353236313532223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('33d387583e5d8e3ccd8866a4b7853061f57f914b', '78.95.59.221', 1630560337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536303333373b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353236313532223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('356e2b075f924856db5ef5138b09090ae4ad0b14', '142.247.160.106', 1630444394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434343339343b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('384a29c08cb566246eaacb1d49c5ac4b9153e8da', '49.36.212.197', 1630333452, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333333435323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333236333738223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('3a11a07d5cc3e33fc2efae2ff9bf7ab9a3911526', '139.64.59.130', 1630507615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373431333b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353033343839223b6c6173745f69707c733a31333a223133392e36342e35392e313330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('3dae17ea89af96d8d5fe1a5d76713ababb46dc36', '51.252.64.155', 1630522335, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532323234333b6964656e746974797c733a343a2274657374223b757365726e616d657c733a343a2274657374223b656d61696c7c733a31313a226c407961686f6f2e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a343a2254657374223b6c6173745f6e616d657c733a343a2254657374223b637265617465645f6f6e7c733a32343a224672692032372041756720323032312030383a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330303837313535223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223138223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30392d30312032313a34383a3033223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('409f9a25af24d163b68448167eeb77fcf915d9e1', '49.36.212.197', 1630343041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334333034313b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333236333738223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('4275f3594ca50cf6677422ddd067bd23bc34118c', '51.252.64.155', 1630518899, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303531383839393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037343231223b6c6173745f69707c733a31333a223133392e36342e35392e313330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('429ffd0a6f342e854b8882097566d303705ecef6', '5.41.193.81', 1630336867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333363836373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('47ee55966f9d6c7951f7c703d50b8b7781de1dff', '149.109.6.92', 1630437464, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433373337313b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a33393a22d8aad985d8aa20d8a5d8b6d8a7d981d8a920d8a7d984d8a8d98ad8b920d8a8d986d8acd8a7d8ad223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('552a10f9f7c5edece10d5783ca5796b4bbd45e9e', '78.95.59.221', 1630557537, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303535373533373b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353236313532223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('552d3f3f52a38ef058f8a69f11f07efd5673a52a', '49.36.212.197', 1630508083, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373938363b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343931313938223b6c6173745f69707c733a31333a2239352e3231392e3230332e3633223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('55d000338e88849614837c57d00d46eb973e3e62', '142.247.160.106', 1630442477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434323437373b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('564f0e5b80b9097af9402b00e6861a758eef1404', '5.41.193.81', 1630331590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333313538363b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333231383831223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('59221a8802f3fe4c7d18f18543cc76b667a9b186', '95.219.203.63', 1630339689, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333393631323b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333338343535223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('59e15e1c55cc58a84ad1e0de2b05f921e36d084c', '159.0.75.164', 1630431889, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433313838393b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b),
('5dd3915858966ae7a96847fce2ff6fb75856028c', '5.41.193.81', 1630334105, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333343130353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('5e40b39df4ce453b4228a6eadf3db2eedb026ebd', '139.64.59.130', 1630506926, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530363932363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('5e62c52e503077a95727ce689c04c64e6c54dadd', '139.64.59.130', 1630504493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530343439333b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('654accd813eb5784cb1dbdf0022d9b5fbf0860f1', '139.64.59.130', 1630503825, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530333832353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('65843cb1ea1714085fe076501ee1460631c51199', '5.41.193.81', 1630333270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333333237303b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('66cd5d09e309a4ff9262fe5b0a67e332166e9ccf', '5.41.193.81', 1630333679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333333637393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('790a889e34984f66f3d7f522938812f521cb1024', '5.41.193.81', 1630331586, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333313538363b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333231383831223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('7c04ed5dfd4ee904642211c1bee21bb8ffad3784', '5.41.193.81', 1630334509, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333343530393b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('7e79b4ffcceb38417ac21d0fe1e0db91705d9e2e', '5.244.126.196', 1630570536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303537303533353b),
('85837ea0893a28a0b54c329094b33e12101c1663', '49.36.212.197', 1630343165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334333034313b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333236333738223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b),
('8934fce4973bc2c52108b47f26e8f2818f086bcc', '178.80.57.32', 1630375978, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303337353937373b),
('89ae4d5e5d12275b51f308737c253379fa7e5d38', '51.252.64.155', 1630521936, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532313933363b6964656e746974797c733a343a2274657374223b757365726e616d657c733a343a2274657374223b656d61696c7c733a31313a226c407961686f6f2e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a343a2254657374223b6c6173745f6e616d657c733a343a2254657374223b637265617465645f6f6e7c733a32343a224672692032372041756720323032312030383a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330303837313535223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b),
('8a5d73111964985a1e8cb00a8c3c983a73cfbd28', '93.169.80.226', 1630431569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433313536393b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('8ba0698f0adffba22b753bdf8b82efed40c4a7a9', '51.252.64.155', 1630519706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303531393730363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353037343231223b6c6173745f69707c733a31333a223133392e36342e35392e313330223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b5f5f63695f766172737c613a333a7b733a353a226572726f72223b733a333a226f6c64223b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6572726f727c733a35323a2254686520456d61696c206669656c64206d75737420636f6e7461696e20612076616c696420656d61696c20616464726573732e0a223b637372666b65797c733a383a227a3850716b587675223b6373726676616c75657c733a32303a22473370596f533051356372564f6b764e5a413773223b),
('8d16ec8862bae662ad610ad072b551f1a0c005ea', '178.80.57.32', 1630342252, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334323233323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333430353235223b6c6173745f69707c733a31333a223134322e3234372e322e313437223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('8da6e4ddec81e4c4304fab175de557553629f26d', '178.80.57.32', 1630338398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333383338363b6572726f727c733a33373a223c703e4c6f67696e204661696c65642c20506c656173652074727920616761696e3c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8e172be9b5ee50337552dfc0d7513a75e71f01e7', '159.0.75.164', 1630432219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433323231393b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b),
('8f6356e1998bb12cdfff2c9c685b47c1036fd78c', '139.64.59.130', 1630504807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530343830373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('8f7f27b978345817874c7d6c903ddbe96147ec93', '5.41.193.81', 1630337196, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333373139363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032313a34383a3439223b),
('916d74daa265039eb11400c57d6df5e2b796bc83', '78.95.59.221', 1630560337, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536303333373b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353236313532223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('942ecb5efbeea3b024b9c11e57894850a9c1940e', '142.247.160.106', 1630443708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434333730383b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('974815611abb974140026b24c12f6e1988f14c4b', '95.219.203.63', 1630497602, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303439373538343b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343739303837223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('9e9a7b4bf585079bce29e52b9d9d8c4c9496d809', '178.80.57.32', 1630432662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433323636323b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343331323934223b6c6173745f69707c733a31333a2239332e3136392e38302e323236223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('a099d93da8076d60a5e61802481b82a3d924c9d9', '166.87.238.199', 1630566999, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536363939393b),
('aaca684beb91655ae6482844afba714ebf5b8c1e', '51.252.64.155', 1630522243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532323234333b6964656e746974797c733a343a2274657374223b757365726e616d657c733a343a2274657374223b656d61696c7c733a31313a226c407961686f6f2e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a343a2254657374223b6c6173745f6e616d657c733a343a2254657374223b637265617465645f6f6e7c733a32343a224672692032372041756720323032312030383a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330303837313535223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223138223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30392d30312032313a34383a3033223b),
('abd1cfa3b304f8ddbd12ec6b3e57725147e15af5', '51.252.64.155', 1630521635, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303532313633353b6964656e746974797c733a343a2274657374223b757365726e616d657c733a343a2274657374223b656d61696c7c733a31313a226c407961686f6f2e636f6d223b757365725f69647c733a313a2237223b66697273745f6e616d657c733a343a2254657374223b6c6173745f6e616d657c733a343a2254657374223b637265617465645f6f6e7c733a32343a224672692032372041756720323032312030383a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330303837313535223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b),
('c14e569e2f7701507b9140037f8997e4d54de710', '139.64.59.130', 1630507367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373236353b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353032363034223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('c57587dd905aa874ebe61af737d45a5adcf0909e', '49.36.212.197', 1630339398, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333393339383b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333236333738223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('c819259b1e93ffd05f9c9dad46a9b6e8b6e43fb5', '142.247.160.106', 1630444515, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434343430353b6964656e746974797c733a31343a2264657672697665727361646d696e223b757365726e616d657c733a31343a2264657672697665727361646d696e223b656d61696c7c733a32323a22636f647269766572732e736140676d61696c2e636f6d223b757365725f69647c733a313a2239223b66697273745f6e616d657c733a31303a2264657672697665727320223b6c6173745f6e616d657c733a353a2261646d696e223b637265617465645f6f6e7c733a32333a2257656420312053657020323032312031323a313320414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343434333934223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b),
('ca4cdaa8e0920d3a72b98e2f0cee2f10d642dec0', '178.80.57.32', 1630432354, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433323335343b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343331323934223b6c6173745f69707c733a31333a2239332e3136392e38302e323236223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('cb9a11ad1edca1d9b1f849e8cdc17ce96c4334b5', '149.109.6.92', 1630436894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433363839343b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('d09a1cfb0e9bdcd623d7a85ac9900df9c9f49c7a', '146.251.170.185', 1630568625, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303536383632333b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330353636383130223b6c6173745f69707c733a31343a223136362e38372e3233382e313939223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c4e3b6861735f73746f72655f69647c4e3b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('d285be5950d48a445debef37d575fed436924822', '178.80.57.32', 1630342232, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334323233323b),
('d4fda8af57b839187b3eac2d01b70d350a729df7', '178.80.57.32', 1630341699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303334313639393b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333332353732223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('d67c6045f2d111391954fc8690a2ec142b93c115', '62.149.104.9', 1630504413, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530343431333b),
('d8b9f246f7c925f39d42fa38491c4760d0f35bf8', '5.41.185.14', 1630503432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530333433323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333534393539223b6c6173745f69707c733a31323a2239352e3138342e32322e3430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('de700cbb2cf24ffffdc1ab7a759fa1235d6604eb', '159.0.75.164', 1630436476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433363437363b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b),
('e17c924f539216f54e1ee0672107d6bbc5543f62', '5.41.193.81', 1630337346, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333373139363b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333331313330223b6c6173745f69707c733a31313a22352e3234352e35352e3337223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b),
('e8cb1a769f001f3c6defcc2359f1f4b0d67419ab', '95.184.22.40', 1630355634, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303335353538323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333332393632223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('e9835ddf10817e6147aee1fdb14748739cb5514a', '142.247.160.106', 1630444047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303434343034373b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343332303531223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('ebde950716e3190b289073d9ef81e9cc0c0dc8db', '95.184.22.40', 1630355582, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303335353538323b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333332393632223b6c6173745f69707c733a31313a22352e34312e3139332e3831223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('f2922c9e77a2987b3168017849a747c29ba98668', '149.109.6.92', 1630437371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303433373337313b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333432323339223b6c6173745f69707c733a31323a223137382e38302e35372e3332223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('f46db2ee3a52cce578ed7ad413e86b5b2911185d', '95.219.203.63', 1630497584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303439373538343b6964656e746974797c733a393a22646576726976657273223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343739303837223b6c6173745f69707c733a31313a22352e34312e3138352e3134223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('f4ab45a0105908c4ac75599f36f8276dcf38d2f3', '178.80.57.32', 1630339049, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303333393034393b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333332353732223b6c6173745f69707c733a31333a2234392e33362e3231322e313937223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b),
('f628c28743d25154afe04664041cbd8e2b37750a', '5.41.185.14', 1630507127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303530373132373b6964656e746974797c733a353a2261646d696e223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330333534393539223b6c6173745f69707c733a31323a2239352e3138342e32322e3430223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a323a223136223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d33302032333a33303a3434223b),
('fac96b44586462f2a1f5626a72eba126dc1ed8ee', '5.41.185.14', 1630483300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313633303438333330303b6964656e746974797c733a31383a22696e666f406465767269766572732e636f6d223b757365726e616d657c733a393a22646576726976657273223b656d61696c7c733a31383a22696e666f406465767269766572732e636f6d223b757365725f69647c733a313a2234223b66697273745f6e616d657c733a333a22446576223b6c6173745f6e616d657c733a363a22526976657273223b637265617465645f6f6e7c733a32343a225361742032312041756720323032312030383a323620504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363330343430353839223b6c6173745f69707c733a31353a223134322e3234372e3136302e313036223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c733a313a2231223b72656769737465725f69647c733a323a223135223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32382031343a30333a3439223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL,
  `ws_barcode_type` varchar(10) DEFAULT 'weight',
  `ws_barcode_chars` tinyint(4) DEFAULT NULL,
  `flag_chars` tinyint(4) DEFAULT NULL,
  `item_code_start` tinyint(4) DEFAULT NULL,
  `item_code_chars` tinyint(4) DEFAULT NULL,
  `price_start` tinyint(4) DEFAULT NULL,
  `price_chars` tinyint(4) DEFAULT NULL,
  `price_divide_by` int(11) DEFAULT NULL,
  `weight_start` tinyint(4) DEFAULT NULL,
  `weight_chars` tinyint(4) DEFAULT NULL,
  `weight_divide_by` int(11) DEFAULT NULL,
  `default_vat` varchar(20) DEFAULT NULL,
  `vat_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`, `ws_barcode_type`, `ws_barcode_chars`, `flag_chars`, `item_code_start`, `item_code_chars`, `price_start`, `price_chars`, `price_divide_by`, `weight_start`, `weight_chars`, `weight_divide_by`, `default_vat`, `vat_id`) VALUES
(1, 'logo1.png', 'Test Com', '0105292122', 'D j M Y', 'h:i A', 'noreply@spos.tecdiary.myl', 'english', '4.1.0', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'SAR', 1, '0', 10, 30, NULL, NULL, 3, 1, 0, '0', 1, NULL, 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 2, '12345678', 0, 'sk_test_xDAOFHP6iGEKvU9LYnjNgcw4', 'pk_test_Z3XOzEk0L4ho6xqt7MvuU8IT', '52bb8ca3-bb2d-44bc-bb2d-e2c13e155c9b', 'alabadi84', 'purple-light', 0, 1, 1, 2, 'SAR', 0, 2, 1, 3, '[\"3\",\"1\"]', 0, 1, 0, 0, 'price', 13, 1, 2, 6, 0, 0, 0, 8, 5, 100, '15', 'vat-1123');

-- --------------------------------------------------------

--
-- Table structure for table `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `vat_id` varchar(50) DEFAULT NULL,
  `vat` varchar(25) DEFAULT '15.00' COMMENT 'Vat tax as per store',
  `filter_option` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0: Both, 1:Category, 2:BARCODE only',
  `receipt_header` text,
  `receipt_footer` text,
  `customer_type` int(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:B2C, 2:B2B',
  `print_type` int(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1:A4, 2:Roll'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `vat_id`, `vat`, `filter_option`, `receipt_header`, `receipt_footer`, `customer_type`, `print_type`) VALUES
(1, 'الوحش', 'POS', '942a8836c3e43bf44560716c991831cb.jpg', 'store@tecdiary.com', '012345678', 'Address Line 1', '', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', 'MYR', '1234566788', '15%', 0, 'werwerqweerqwre', 'werqwerqwerqwerwerweqrweqwew', 2, 1),
(2, 'JitenPOS', 'jiten001', NULL, 'jktittalom@gmail.com', '123456789', 'Govindpuram', '', 'Ghaziabad', 'UP', '201013', 'India', NULL, '246777', '15%', 0, 'Welcome to Jiten-Store', 'Thanks! Visit Again!!!', 2, 2),
(3, 'A2POS ااا', 'A2001', NULL, 'a2@a2.com', '1234', 'aa', '', 'noida', '', '201013', '', NULL, '24677555677', '15%', 0, '', '', 1, 2),
(4, 'Panda', 'panda', NULL, 'codrivers.sa@gmail.com', '598977601', 'Medina Saudi Arabia', '', 'al-Madinah', 'al-Madinah', '22438', '', NULL, '345678909876', '15%', 2, 'ABC LTDوووو', '@abc PVT ltd', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `vat_id` varchar(25) DEFAULT NULL,
  `additional_no` varchar(25) DEFAULT NULL,
  `other_seller_id` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `vat_id`, `additional_no`, `other_seller_id`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com', '0', '0', '0', '0', '0', '0', '0', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3134362e3235312e3137302e313835, 0x3132372e302e302e31, 'admin', '1d9edbfca120b31f25dd347bfb298869478e2992', NULL, 'admin@tecdiary.com', NULL, NULL, NULL, '98e1c1713891ef82021cedb55cf9f12b25a26476', 1435204774, 1630568623, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', NULL, 'male', 1, NULL),
(3, 0x37382e39352e3133302e313638, 0x3a3a31, 'a1', 'b01e7e8093726f55979ed0a9cf0b132931e70a95', NULL, 'al@al.com', NULL, NULL, NULL, '3135032c6144a87cab2f8bf0a038f8df8b644e0e', 1629275070, 1630162443, 1, 'A1', 'ZZZ', NULL, '11', NULL, 'male', 2, 2),
(4, 0x37382e39352e35392e323231, 0x33372e3130372e35362e3532, 'devrivers', '469aed280a64e00090152825c51592bdf99179f9', NULL, 'info@devrivers.com', NULL, NULL, NULL, 'b968de76efbaf382ed950f89865a29616a2c0513', 1629566766, 1630555804, 1, 'Dev', 'Rivers', NULL, '598977601', NULL, 'male', 3, 1),
(5, 0x3134322e3234372e3137392e3430, 0x33372e3130372e35362e3532, 'rizwan', '86ee3009ef536d1fbd5c1db69b98a376b811d705', NULL, 'gitgonda@gmail.com', NULL, NULL, NULL, '2018860b34f4e33446a7279b06e9bb4ce1ce25c2', 1629567111, 1630148421, 1, 'RIzwan', 'Ahmad', NULL, '+966549913813', NULL, 'male', 2, 4),
(6, 0x35312e3235322e36342e313535, 0x352e3135362e3233312e323437, 'ja', 'f9b5aeeaabcbd4dc461b2ca288cb33246ee8ed0b', NULL, 'dd@g.com', NULL, NULL, NULL, 'c1c56f3edb20cff8992fc774ab5b2601709c8b8f', 1629744186, 1630519980, 1, 'Yyy', 'Yyy', NULL, '4455', NULL, 'male', 1, NULL),
(7, 0x35312e3235322e36342e313535, 0x3137382e38302e35372e3332, 'test', 'c1cfd2f8de36b34c2dedc0355fbc89c8f0101d87', NULL, 'l@yahoo.com', '72eb1795e2c7346088fc395cc9284f108a882698', NULL, NULL, '1494b560717c71f72782c0a2a56fd563bd4209e0', 1630087155, 1630520080, 1, 'Test', 'Test', NULL, '2222', NULL, 'male', 1, NULL),
(8, 0x35312e3235322e36342e313535, 0x352e3135362e3138302e313530, 'jaffer', '26afd08aab9b0ee48165ab72b6c6f241eca97781', NULL, 'Aaa@ss.com', NULL, NULL, NULL, '6eca6620f5c4fe9e54eb24dceb54637d16e15026', 1630247527, 1630519862, 1, 'Hh', 'Ff', NULL, '222', NULL, 'male', 1, NULL),
(9, 0x3134322e3234372e3136302e313036, 0x3134322e3234372e3136302e313036, 'devriversadmin', '55870a369167becc3205ce3f17f7e16692193b41', NULL, 'codrivers.sa@gmail.com', NULL, NULL, NULL, 'fac59f3c3899552c89dd09765d5d8cfc0729784d', 1630444394, 1630444416, 1, 'devrivers ', 'admin', NULL, '598977601', NULL, 'male', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-17 18:19:49'),
(2, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-18 07:03:16'),
(3, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-18 07:25:40'),
(4, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 07:39:26'),
(5, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-18 07:43:06'),
(6, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 07:46:28'),
(7, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-18 07:47:07'),
(8, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 08:11:52'),
(9, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 08:13:53'),
(10, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2021-08-18 08:18:44'),
(11, 3, NULL, 0x3a3a31, 'a1', '2021-08-18 08:25:25'),
(12, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 08:27:06'),
(13, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 08:46:52'),
(14, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 09:09:45'),
(15, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-18 09:15:18'),
(16, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-19 18:18:10'),
(17, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-20 15:27:02'),
(18, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-20 18:59:30'),
(19, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-21 08:46:06'),
(20, 2, NULL, 0x34392e33362e3231342e313539, 'jktittalom@gmail.com', '2021-08-21 16:47:16'),
(21, 1, NULL, 0x33372e3130372e35362e3532, 'admin@tecdiary.com', '2021-08-21 17:05:16'),
(22, 2, NULL, 0x33372e3130372e35362e3532, 'jktittalom@gmail.com', '2021-08-21 17:12:55'),
(23, 1, NULL, 0x33372e3130372e35362e3532, 'admin@tecdiary.com', '2021-08-21 17:14:17'),
(24, 2, NULL, 0x33372e3130372e35362e3532, 'jktittalom@gmail.com', '2021-08-21 17:23:17'),
(25, 1, NULL, 0x33372e3130372e35362e3532, 'admin@tecdiary.com', '2021-08-21 17:24:00'),
(26, 2, NULL, 0x33372e3130372e35362e3532, 'jktittalom@gmail.com', '2021-08-21 17:24:27'),
(27, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 17:26:48'),
(28, 5, NULL, 0x33372e3130372e35362e3532, 'rizwan', '2021-08-21 17:40:12'),
(29, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 17:46:12'),
(30, 5, NULL, 0x33372e3130372e35362e3532, 'rizwan', '2021-08-21 17:46:53'),
(31, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 17:47:57'),
(32, 5, NULL, 0x33372e3130372e35362e3532, 'rizwan', '2021-08-21 17:49:22'),
(33, 5, NULL, 0x34392e33362e3231342e313539, 'rizwan', '2021-08-21 17:52:01'),
(34, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 17:53:33'),
(35, 5, NULL, 0x33372e3130372e35362e3532, 'rizwan', '2021-08-21 18:06:36'),
(36, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 18:24:23'),
(37, 4, NULL, 0x33372e3130372e35362e3532, 'info@devrivers.com', '2021-08-21 18:25:40'),
(38, 4, NULL, 0x352e3135362e3233312e323437, 'info@devrivers.com', '2021-08-23 17:16:48'),
(39, 4, NULL, 0x352e3135362e3233312e323437, 'info@devrivers.com', '2021-08-23 17:37:48'),
(40, 1, NULL, 0x352e3135362e3233312e323437, 'admin@tecdiary.com', '2021-08-23 18:37:24'),
(41, 6, NULL, 0x352e3135362e3233312e323437, 'dd@g.com', '2021-08-23 18:45:22'),
(42, 4, NULL, 0x352e3135362e3233312e323437, 'info@devrivers.com', '2021-08-23 19:01:37'),
(43, 1, NULL, 0x352e3135362e3233312e323437, 'admin@tecdiary.com', '2021-08-23 19:53:52'),
(44, 1, NULL, 0x352e3135362e3233312e323437, 'admin@tecdiary.com', '2021-08-23 19:57:16'),
(45, 1, NULL, 0x352e3135362e3233312e323437, 'admin@tecdiary.com', '2021-08-23 20:00:05'),
(46, 3, NULL, 0x352e3135362e3233312e323437, 'al@al.com', '2021-08-23 20:01:19'),
(47, 4, NULL, 0x352e3135362e3233312e323437, 'info@devrivers.com', '2021-08-23 20:37:21'),
(48, 4, NULL, 0x352e3135362e3233312e323437, 'info@devrivers.com', '2021-08-24 04:21:58'),
(49, 4, NULL, 0x39342e34392e3232312e3132, 'info@devrivers.com', '2021-08-24 10:25:20'),
(50, 4, NULL, 0x35312e3235332e3131312e3435, 'info@devrivers.com', '2021-08-24 12:54:51'),
(51, 4, NULL, 0x352e3135362e3138382e323337, 'info@devrivers.com', '2021-08-24 17:54:24'),
(52, 4, NULL, 0x352e3135362e3138382e323337, 'info@devrivers.com', '2021-08-24 19:07:21'),
(53, 2, NULL, 0x3130362e3231352e3230322e313035, 'jktittalom@gmail.com', '2021-08-25 03:06:55'),
(54, 4, NULL, 0x352e3135362e3138382e323337, 'info@devrivers.com', '2021-08-25 08:38:25'),
(55, 2, NULL, 0x3130362e3231352e3138372e323237, 'jktittalom@gmail.com', '2021-08-25 16:49:05'),
(56, 4, NULL, 0x3134322e3234372e3137392e3430, 'info@devrivers.com', '2021-08-25 17:49:32'),
(57, 4, NULL, 0x35312e3235332e38312e3736, 'info@devrivers.com', '2021-08-26 10:31:27'),
(58, 4, NULL, 0x3134322e3234372e3137352e3834, 'info@devrivers.com', '2021-08-26 15:51:42'),
(59, 4, NULL, 0x35312e3235332e3131312e3435, 'info@devrivers.com', '2021-08-26 19:16:24'),
(60, 4, NULL, 0x3130362e3231352e3136342e3235, 'info@devrivers.com', '2021-08-27 03:11:28'),
(61, 4, NULL, 0x39332e3136382e33312e3639, 'info@devrivers.com', '2021-08-27 09:26:26'),
(62, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-27 17:41:56'),
(63, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-27 18:12:33'),
(64, 1, NULL, 0x3137382e38302e35372e3332, 'admin@tecdiary.com', '2021-08-27 18:13:24'),
(65, 1, NULL, 0x35312e3235332e3131312e3435, 'admin@tecdiary.com', '2021-08-27 20:45:32'),
(66, 4, NULL, 0x3130362e3232332e3137362e313039, 'info@devrivers.com', '2021-08-28 01:38:20'),
(67, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-28 07:17:26'),
(68, 1, NULL, 0x35312e3235322e37352e313634, 'admin@tecdiary.com', '2021-08-28 07:45:16'),
(69, 4, NULL, 0x3134322e3234372e3137392e3430, 'info@devrivers.com', '2021-08-28 10:49:36'),
(70, 5, NULL, 0x3134322e3234372e3137392e3430, 'rizwan', '2021-08-28 11:00:21'),
(71, 1, NULL, 0x3134322e3234372e3137392e3430, 'admin@tecdiary.com', '2021-08-28 11:01:09'),
(72, 4, NULL, 0x35312e3235322e37352e313634, 'info@devrivers.com', '2021-08-28 11:03:23'),
(73, 3, NULL, 0x37382e39352e3133302e313638, 'al@al.com', '2021-08-28 14:54:04'),
(74, 4, NULL, 0x37382e39352e3133302e313638, 'info@devrivers.com', '2021-08-28 14:57:59'),
(75, 4, NULL, 0x37382e39352e3133302e313638, 'info@devrivers.com', '2021-08-28 15:01:34'),
(76, 4, NULL, 0x3134322e3234372e3137392e3430, 'info@devrivers.com', '2021-08-28 15:44:33'),
(77, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-28 16:47:49'),
(78, 4, NULL, 0x352e3135362e3138302e313530, 'info@devrivers.com', '2021-08-29 04:37:02'),
(79, 4, NULL, 0x34392e33362e3231322e313937, 'info@devrivers.com', '2021-08-29 11:30:31'),
(80, 4, NULL, 0x352e3135362e3138302e313530, 'info@devrivers.com', '2021-08-29 13:50:48'),
(81, 4, NULL, 0x3134322e3234372e3137352e3834, 'info@devrivers.com', '2021-08-29 14:02:35'),
(82, 6, NULL, 0x352e3135362e3138302e313530, 'ja', '2021-08-29 14:33:26'),
(83, 4, NULL, 0x352e3135362e3138302e313530, 'info@devrivers.com', '2021-08-29 15:38:31'),
(84, 4, NULL, 0x3134322e3234372e3137352e3834, 'info@devrivers.com', '2021-08-29 15:43:28'),
(85, 1, NULL, 0x3134322e3234372e3137352e3834, 'admin@tecdiary.com', '2021-08-29 15:44:03'),
(86, 4, NULL, 0x3134322e3234372e3137352e3834, 'devrivers', '2021-08-29 15:54:33'),
(87, 6, NULL, 0x352e3135362e3138302e313530, 'Ja', '2021-08-29 16:07:00'),
(88, 1, NULL, 0x35312e3235332e332e3935, 'admin', '2021-08-29 18:25:49'),
(89, 4, NULL, 0x3134322e3234372e3136302e313036, 'devrivers', '2021-08-29 19:01:45'),
(90, 4, NULL, 0x34392e33362e3231322e313937, 'info@devrivers.com', '2021-08-29 19:48:48'),
(91, 4, NULL, 0x352e34312e3139332e3831, 'info@devrivers.com', '2021-08-30 08:12:05'),
(92, 6, NULL, 0x352e34312e3139332e3831, 'Ja', '2021-08-30 11:09:47'),
(93, 4, NULL, 0x352e34312e3139332e3831, 'info@devrivers.com', '2021-08-30 11:11:21'),
(94, 6, NULL, 0x352e34312e3139332e3831, 'Ja', '2021-08-30 11:14:35'),
(95, 4, NULL, 0x352e34312e3139332e3831, 'info@devrivers.com', '2021-08-30 12:26:18'),
(96, 1, NULL, 0x352e3234352e35352e3337, 'Admin', '2021-08-30 13:45:30'),
(97, 4, NULL, 0x34392e33362e3231322e313937, 'info@devrivers.com', '2021-08-30 14:09:32'),
(98, 1, NULL, 0x352e34312e3139332e3831, 'admin', '2021-08-30 14:16:02'),
(99, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-30 15:47:35'),
(100, 4, NULL, 0x39352e3231392e3230332e3633, 'devrivers', '2021-08-30 16:07:00'),
(101, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-30 16:50:39'),
(102, 1, NULL, 0x39352e3138342e32322e3430, 'admin', '2021-08-30 20:22:39'),
(103, 4, NULL, 0x39332e3136392e38302e323236, 'info@devrivers.com', '2021-08-31 17:34:54'),
(104, 4, NULL, 0x3137382e38302e35372e3332, 'info@devrivers.com', '2021-08-31 17:47:31'),
(105, 4, NULL, 0x3134322e3234372e3136302e313036, 'devrivers', '2021-08-31 20:09:49'),
(106, 9, NULL, 0x3134322e3234372e3136302e313036, 'devriversadmin', '2021-08-31 21:13:36'),
(107, 4, NULL, 0x352e34312e3138352e3134, 'info@devrivers.com', '2021-09-01 06:51:27'),
(108, 4, NULL, 0x39352e3231392e3230332e3633, 'devrivers', '2021-09-01 10:13:18'),
(109, 1, NULL, 0x352e34312e3138352e3134, 'admin', '2021-09-01 13:23:24'),
(110, 1, NULL, 0x3133392e36342e35392e313330, 'admin', '2021-09-01 13:38:09'),
(111, 1, NULL, 0x3133392e36342e35392e313330, 'admin', '2021-09-01 14:43:41'),
(112, 4, NULL, 0x34392e33362e3231322e313937, 'info@devrivers.com', '2021-09-01 14:53:11'),
(113, 1, NULL, 0x35312e3235322e36342e313535, 'admin', '2021-09-01 17:50:09'),
(114, 8, NULL, 0x35312e3235322e36342e313535, 'jaffer', '2021-09-01 18:08:42'),
(115, 8, NULL, 0x35312e3235322e36342e313535, 'jaffer', '2021-09-01 18:11:02'),
(116, 6, NULL, 0x35312e3235322e36342e313535, 'ja', '2021-09-01 18:13:00'),
(117, 7, NULL, 0x35312e3235322e36342e313535, 'test', '2021-09-01 18:14:40'),
(118, 4, NULL, 0x37382e39352e35392e323231, 'info@devrivers.com', '2021-09-02 04:10:04'),
(119, 1, NULL, 0x3136362e38372e3233382e313939, 'admin', '2021-09-02 07:13:30'),
(120, 1, NULL, 0x3134362e3235312e3137302e313835, 'admin', '2021-09-02 07:43:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indexes for table `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
