-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 21, 2021 at 06:36 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spos`
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
(2, 'G02', 'Cloths', 'no_image.png');

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
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(1, 'Walk-in Client', '', '', '012345678', 'customer@tecdiary.com', NULL),
(2, 'jiten', '', '', '12212212', 'abc@abc.com', NULL),
(3, 'Ashok', 'vat-12222', '', '', 'aaa@aa.com', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
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

-- --------------------------------------------------------

--
-- Table structure for table `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
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
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1,
  `print` varchar(25) DEFAULT NULL COMMENT 'Setting to print invoice type: B2B, B2C',
  `printer` int(10) DEFAULT NULL COMMENT 'Print invoice on Printer: values 1: A4, 2: Rolls, 3: Both'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`, `print`, `printer`) VALUES
(1, '2021-08-17 18:42:45', 1, 1, NULL, 'cash', '', '', '', '', '', '', '17.2500', NULL, 1, NULL, '', '17.2500', '0.0000', '', NULL, NULL, NULL, 1, NULL, NULL),
(2, '2021-08-17 18:48:54', 2, 1, NULL, 'cash', '', '', '', '', '', '', '17.2500', NULL, 1, NULL, '', '17.2500', '0.0000', '', NULL, NULL, NULL, 1, NULL, NULL),
(3, '2021-08-18 07:17:22', 3, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, NULL, NULL),
(4, '2021-08-18 14:37:12', 4, 1, NULL, 'cash', '', '', '', '', '', '', '7680.0000', NULL, 2, NULL, '', '7680.0000', '0.0000', '', NULL, NULL, NULL, 2, NULL, NULL),
(5, '2021-08-18 14:49:04', 5, 1, NULL, 'cash', '', '', '', '', '', '', '480.0000', NULL, 2, NULL, '', '480.0000', '0.0000', '', NULL, NULL, NULL, 2, NULL, NULL),
(6, '2021-08-18 14:55:27', 6, 1, NULL, 'cash', '', '', '', '', '', '', '18480.0000', NULL, 2, NULL, '', '18480.0000', '0.0000', '', NULL, NULL, NULL, 2, NULL, NULL),
(7, '2021-08-18 15:02:33', 7, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, '', 0),
(8, '2021-08-18 15:09:09', 8, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(9, '2021-08-18 15:09:59', 9, 1, NULL, 'cash', '', '', '', '', '', '', '7200.0000', NULL, 2, NULL, '', '7200.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 2),
(10, '2021-08-18 15:13:30', 10, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 2),
(11, '2021-08-18 15:13:50', 11, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, '', 0),
(12, '2021-08-18 15:16:57', 12, 1, NULL, 'cash', '', '', '', '', '', '', '480.0000', NULL, 2, NULL, '', '480.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(13, '2021-08-18 15:32:21', 13, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 2),
(14, '2021-08-18 16:51:26', 14, 1, NULL, 'cash', '', '', '', '', '', '', '36000.0000', NULL, 2, NULL, '', '36000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(15, '2021-08-18 19:33:49', 15, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(16, '2021-08-19 16:02:17', 16, 1, NULL, 'cash', '', '', '', '', '', '', '480.0000', NULL, 2, NULL, '', '480.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(17, '2021-08-19 16:47:54', 17, 1, NULL, 'cash', '', '', '', '', '', '', '480.0000', NULL, 2, NULL, '', '480.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(18, '2021-08-19 17:37:08', 18, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(19, '2021-08-20 03:19:04', 19, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(20, '2021-08-20 03:20:29', 20, 1, NULL, 'cash', '', '', '', '', '', '', '25680.0000', NULL, 2, NULL, '', '25680.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(21, '2021-08-20 12:57:13', 21, 1, NULL, 'cash', '', '', '', '', '', '', '25680.0000', NULL, 2, NULL, '', '25680.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(22, '2021-08-20 16:32:39', 22, 1, NULL, 'cash', '', '', '', '', '', '', '25680.0000', NULL, 2, NULL, '', '25680.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(23, '2021-08-20 18:58:04', 23, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(24, '2021-08-20 18:59:48', 24, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 1),
(25, '2021-08-20 19:02:49', 25, 1, NULL, 'cash', '', '', '', '', '', '', '18000.0000', NULL, 2, NULL, '', '18000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 1),
(26, '2021-08-21 08:08:32', 26, 1, NULL, 'cash', '', '', '', '', '', '', '21000.0000', NULL, 2, NULL, '', '21000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(27, '2021-08-21 08:11:06', 27, 1, NULL, 'cash', '', '', '', '', '', '', '21000.0000', NULL, 2, NULL, '', '21000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(28, '2021-08-21 08:28:47', 28, 1, NULL, 'cash', '', '', '', '', '', '', '21000.0000', NULL, 2, NULL, '', '21000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(29, '2021-08-21 08:33:38', 29, 1, NULL, 'cash', '', '', '', '', '', '', '15000.0000', NULL, 2, NULL, '', '15000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(30, '2021-08-21 08:44:48', 30, 1, NULL, 'cash', '', '', '', '', '', '', '15000.0000', NULL, 2, NULL, '', '15000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(31, '2021-08-21 08:50:12', 31, 2, NULL, 'cash', '', '', '', '', '', '', '6000.0000', NULL, 2, NULL, '', '6000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(32, '2021-08-21 08:54:54', 32, 2, NULL, 'cash', '', '', '', '', '', '', '30000.0000', NULL, 2, NULL, '', '30000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3),
(33, '2021-08-21 09:12:09', 33, 2, NULL, 'cash', '', '', '', '', '', '', '100.0000', NULL, 2, NULL, '', '100.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(34, '2021-08-21 09:20:53', 34, 2, NULL, 'cash', '', '', '', '', '', '', '21000.0000', NULL, 2, NULL, '', '21000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2c', 3),
(35, '2021-08-21 09:21:36', 35, 2, NULL, 'cash', '', '', '', '', '', '', '21000.0000', NULL, 2, NULL, '', '21000.0000', '0.0000', '', NULL, NULL, NULL, 2, 'b2b', 3);

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
(1, 'XPrinter', 'network', 'default', 45, '', 0x3139322e3136382e312e323030, '9100');

-- --------------------------------------------------------

--
-- Table structure for table `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 1,
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 1,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text DEFAULT NULL,
  `alert_quantity` decimal(10,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(1, 'sam001', 'Samsung Mobile', 1, '15.0000', 'no_image.png', '10', '10.0000', 0, '0.0000', 'code25', 'standard', '', '0.0000'),
(2, 'one001', 'OnePlus', 1, '5000.0000', 'no_image.png', NULL, '1000.0000', 0, '0.0000', 'code128', 'standard', '', '0.0000'),
(3, 'mobserv001', 'Mobile-service', 1, '200.0000', 'no_image.png', NULL, '0.0000', 0, '0.0000', 'code25', 'service', '', '0.0000'),
(4, 'T001', 'T-shirt', 2, '200.0000', 'no_image.png', NULL, '100.0000', 0, '0.0000', 'code128', 'standard', '', '0.0000'),
(5, 'J001', 'Jeans', 2, '100.0000', 'no_image.png', NULL, '50.0000', 0, '0.0000', 'code128', 'standard', '', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 1, 1, '-2.0000', '0.0000'),
(2, 1, 2, '4.0000', '6000.0000'),
(3, 2, 1, '0.0000', '0.0000'),
(4, 2, 2, '-17.0000', '15000.0000'),
(5, 2, 3, '10.0000', '15000.0000'),
(6, 1, 3, '10.0000', '5000.0000'),
(7, 3, 1, '0.0000', '300.0000'),
(8, 3, 2, '0.0000', '400.0000'),
(9, 3, 3, '0.0000', '500.0000'),
(10, 4, 1, '0.0000', '0.0000'),
(11, 4, 2, '10.0000', '300.0000'),
(12, 4, 3, '0.0000', '0.0000'),
(13, 5, 1, '0.0000', '0.0000'),
(14, 5, 2, '-1.0000', '100.0000'),
(15, 5, 3, '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_purchases`
--

INSERT INTO `tec_purchases` (`id`, `reference`, `date`, `note`, `total`, `attachment`, `supplier_id`, `received`, `created_by`, `store_id`) VALUES
(1, '', '2021-08-18 07:27:00', '', '10000.0000', NULL, 1, 1, 2, 2);

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
(1, 1, 1, '10.0000', '1000.0000', '10000.0000');

-- --------------------------------------------------------

--
-- Table structure for table `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2021-08-17 18:20:10', 1, '500.0000', 'close', '534.5000', 0, 0, '534.5000', 0, 0, 'Close By Jiten', '2021-08-18 04:47:16', '0', 1, 1),
(2, '2021-08-18 04:48:49', 1, '500.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, '2021-08-18 05:55:36', 3, '200.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2),
(4, '2021-08-18 06:45:26', 2, '1000.0000', 'close', '458320.0000', 0, 0, '458320.0000', 0, 0, '', '2021-08-21 08:48:38', NULL, 2, 2),
(5, '2021-08-21 08:48:55', 2, '1000.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

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
  `store_id` int(11) NOT NULL DEFAULT 1,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(1, '2021-08-18 00:12:45', 1, 'Walk-in Client', '13.6364', '0.0000', NULL, '0.0000', '0.0000', '1.3636', '15%', '2.2500', '3.6136', '17.2500', 1, '0.0000', '17.2500', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(2, '2021-08-18 00:18:54', 1, 'Walk-in Client', '13.6364', '0.0000', NULL, '0.0000', '0.0000', '1.3636', '15%', '2.2500', '3.6136', '17.2500', 1, '0.0000', '17.2500', 1, NULL, NULL, '', 'paid', '0.0000', 1, ''),
(3, '2021-08-18 12:47:22', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(4, '2021-08-18 20:07:12', 1, 'Walk-in Client', '5854.5455', '0.0000', NULL, '0.0000', '0.0000', '545.4545', '20%', '1280.0000', '1825.4545', '7680.0000', 2, '0.0000', '7680.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(5, '2021-08-18 20:19:04', 1, 'Walk-in Client', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '80.0000', '80.0000', '480.0000', 1, '0.0000', '480.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(6, '2021-08-18 20:25:27', 1, 'Walk-in Client', '15400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3080.0000', '3080.0000', '18480.0000', 2, '0.0000', '18480.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(7, '2021-08-18 20:32:33', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(8, '2021-08-18 20:39:09', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(9, '2021-08-18 20:39:59', 1, 'Walk-in Client', '5454.5455', '0.0000', NULL, '0.0000', '0.0000', '545.4545', '20%', '1200.0000', '1745.4545', '7200.0000', 1, '0.0000', '7200.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(10, '2021-08-18 20:43:30', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(11, '2021-08-18 20:43:50', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(12, '2021-08-18 20:46:57', 1, 'Walk-in Client', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '80.0000', '80.0000', '480.0000', 1, '0.0000', '480.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(13, '2021-08-18 21:02:21', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(14, '2021-08-18 22:21:26', 1, 'Walk-in Client', '30000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '6000.0000', '6000.0000', '36000.0000', 1, '0.0000', '36000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(15, '2021-08-19 01:03:49', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(16, '2021-08-19 21:32:17', 1, 'Walk-in Client', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '80.0000', '80.0000', '480.0000', 1, '0.0000', '480.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(17, '2021-08-19 22:17:54', 1, 'Walk-in Client', '400.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '80.0000', '80.0000', '480.0000', 1, '0.0000', '480.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(18, '2021-08-19 23:07:08', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(19, '2021-08-20 08:49:04', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(20, '2021-08-20 08:50:29', 1, 'Walk-in Client', '20854.5455', '0.0000', NULL, '0.0000', '0.0000', '545.4545', '20%', '4280.0000', '4825.4545', '25680.0000', 3, '0.0000', '25680.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(21, '2021-08-20 18:27:13', 1, 'Walk-in Client', '20854.5455', '0.0000', NULL, '0.0000', '0.0000', '545.4545', '20%', '4280.0000', '4825.4545', '25680.0000', 3, '0.0000', '25680.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(22, '2021-08-20 22:02:39', 1, 'Walk-in Client', '20854.5455', '0.0000', NULL, '0.0000', '0.0000', '545.4545', '20%', '4280.0000', '4825.4545', '25680.0000', 3, '0.0000', '25680.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(23, '2021-08-21 00:28:04', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(24, '2021-08-21 00:29:48', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(25, '2021-08-21 00:32:49', 1, 'Walk-in Client', '15000.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', '20%', '3000.0000', '3000.0000', '18000.0000', 1, '0.0000', '18000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(26, '2021-08-21 13:38:32', 1, 'Walk-in Client', '16363.6364', '0.0000', NULL, '0.0000', '0.0000', '436.3636', '20%', '3360.0000', '3796.3636', '20160.0000', 2, '0.0000', '21000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(27, '2021-08-21 13:41:06', 1, 'Walk-in Client', '16363.6364', '0.0000', NULL, '0.0000', '0.0000', '436.3636', '20%', '3360.0000', '3796.3636', '20160.0000', 2, '0.0000', '21000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(28, '2021-08-21 13:58:47', 1, 'Walk-in Client', '15797.0000', '0.0000', NULL, '0.0000', '0.0000', '1003.0000', '20%', '3360.0000', '4363.0000', '20160.0000', 2, '0.0000', '21000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(29, '2021-08-21 14:03:38', 1, 'Walk-in Client', '9000.0000', '0.0000', NULL, '0.0000', '0.0000', '3000.0000', '20%', '2400.0000', '5400.0000', '14400.0000', 1, '0.0000', '15000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(30, '2021-08-21 14:14:48', 1, 'Walk-in Client', '9000.0000', '0.0000', NULL, '0.0000', '0.0000', '3000.0000', '20%', '2400.0000', '5400.0000', '14400.0000', 1, '0.0000', '15000.0000', 2, NULL, NULL, '', 'paid', '0.0000', 2, ''),
(31, '2021-08-21 14:20:12', 2, 'jiten', '4800.0000', '0.0000', NULL, '0.0000', '0.0000', '1200.0000', '20%', '1200.0000', '2400.0000', '7200.0000', 1, '0.0000', '6000.0000', 2, NULL, NULL, '', 'partial', '0.0000', 2, ''),
(32, '2021-08-21 14:24:54', 2, 'jiten', '24000.0000', '0.0000', NULL, '0.0000', '0.0000', '6000.0000', '20%', '6000.0000', '12000.0000', '36000.0000', 1, '0.0000', '30000.0000', 2, NULL, NULL, '', 'partial', '0.0000', 2, ''),
(33, '2021-08-21 14:42:09', 2, 'jiten', '80.0000', '0.0000', NULL, '0.0000', '0.0000', '20.0000', '20%', '20.0000', '40.0000', '120.0000', 1, '0.0000', '100.0000', 2, NULL, NULL, '', 'partial', '0.0000', 2, ''),
(34, '2021-08-21 14:50:53', 2, 'jiten', '16800.0000', '0.0000', NULL, '0.0000', '0.0000', '4200.0000', '20%', '4200.0000', '8400.0000', '25200.0000', 2, '0.0000', '21000.0000', 2, NULL, NULL, '', 'partial', '0.0000', 2, ''),
(35, '2021-08-21 14:51:36', 2, 'jiten', '16800.0000', '0.0000', NULL, '0.0000', '0.0000', '4200.0000', '20%', '4200.0000', '8400.0000', '25200.0000', 2, '0.0000', '21000.0000', 2, NULL, NULL, '', 'partial', '0.0000', 2, '');

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
  `cost` decimal(25,4) DEFAULT 0.0000,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(1, 1, 1, '1.0000', '15.0000', '13.6364', '0', '0.0000', 10, '1.3636', '15.0000', '15.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(2, 2, 1, '1.0000', '15.0000', '13.6364', '0', '0.0000', 10, '1.3636', '15.0000', '15.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(3, 3, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(4, 4, 1, '1.0000', '6000.0000', '5454.5455', '0', '0.0000', 10, '545.4545', '6000.0000', '6000.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(5, 4, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(6, 5, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(7, 6, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(8, 6, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(9, 7, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(10, 8, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(11, 9, 1, '1.0000', '6000.0000', '5454.5455', '0', '0.0000', 10, '545.4545', '6000.0000', '6000.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(12, 10, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(13, 11, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(14, 12, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(15, 13, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(16, 14, 2, '2.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '30000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(17, 15, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(18, 16, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(19, 17, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(20, 18, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(21, 19, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(22, 20, 1, '1.0000', '6000.0000', '5454.5455', '0', '0.0000', 10, '545.4545', '6000.0000', '6000.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(23, 20, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(24, 20, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(25, 21, 1, '1.0000', '6000.0000', '5454.5455', '0', '0.0000', 10, '545.4545', '6000.0000', '6000.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(26, 21, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(27, 21, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(28, 22, 1, '1.0000', '6000.0000', '5454.5455', '0', '0.0000', 10, '545.4545', '6000.0000', '6000.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(29, 22, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(30, 22, 3, '1.0000', '400.0000', '400.0000', '0', '0.0000', 0, '0.0000', '400.0000', '400.0000', '0.0000', 'mobserv001', 'Mobile-service', ''),
(31, 23, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(32, 24, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(33, 25, 2, '1.0000', '15000.0000', '15000.0000', '0', '0.0000', 0, '0.0000', '15000.0000', '15000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(34, 26, 1, '1.0000', '4800.0000', '4363.6364', '0', '0.0000', 10, '436.3636', '4800.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(35, 26, 2, '1.0000', '12000.0000', '12000.0000', '0', '0.0000', 0, '0.0000', '12000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(36, 27, 1, '1.0000', '4800.0000', '4363.6364', '0', '0.0000', 10, '436.3636', '4800.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(37, 27, 2, '1.0000', '12000.0000', '12000.0000', '0', '0.0000', 0, '0.0000', '12000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(38, 28, 1, '1.0000', '4800.0000', '6000.0000', '0', '0.0000', 20, '1200.0000', '4800.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(39, 28, 2, '1.0000', '12000.0000', '15000.0000', '0', '0.0000', 20, '3000.0000', '12000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(40, 29, 2, '1.0000', '15000.0000', '12000.0000', '0', '0.0000', 20, '3000.0000', '12000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(41, 30, 2, '1.0000', '12000.0000', '9000.0000', '0', '0.0000', 20, '3000.0000', '12000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(42, 31, 1, '1.0000', '6000.0000', '4800.0000', '0', '0.0000', 20, '1200.0000', '6000.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(43, 32, 2, '2.0000', '15000.0000', '12000.0000', '0', '0.0000', 20, '6000.0000', '30000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(44, 33, 5, '1.0000', '100.0000', '80.0000', '0', '0.0000', 20, '20.0000', '100.0000', '80.0000', '50.0000', 'J001', 'Jeans', ''),
(45, 34, 1, '1.0000', '6000.0000', '4800.0000', '0', '0.0000', 20, '1200.0000', '6000.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(46, 34, 2, '1.0000', '15000.0000', '12000.0000', '0', '0.0000', 20, '3000.0000', '15000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', ''),
(47, 35, 1, '1.0000', '6000.0000', '4800.0000', '0', '0.0000', 20, '1200.0000', '6000.0000', '4800.0000', '10.0000', 'sam001', 'Samsung Mobile', ''),
(48, 35, 2, '1.0000', '15000.0000', '12000.0000', '0', '0.0000', 20, '3000.0000', '15000.0000', '12000.0000', '1000.0000', 'one001', 'OnePlus', '');

-- --------------------------------------------------------

--
-- Table structure for table `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('00300ba29879318219fd0ee160b5c75d0d1b8315', '::1', 1629242869, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234323836393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('02bb458855d0a333c60e08b56e65c534ab29b7b4', '::1', 1629240560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234303536303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b6d6573736167657c733a32393a2253657474696e6773207375636365737366756c6c792075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('03524d23b5696705af69cb2d2ac5b9e2f2c7ba31', '::1', 1629403162, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430333136323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('0353c9fd0f950f270dbe0f871cc95a8023ee3ee7', '::1', 1629272031, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237323033313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323730313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b),
('041abde3c233bb65de561ce7d397d68f1d27f1cf', '::1', 1629537865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533373836353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('04d23298312c381efe3c09a3b3820036aa7af88d', '::1', 1629308278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330383237383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('0531952896ad903b928ca5026a04da955b543f7c', '::1', 1629490365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439303336353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('07228ccccb5b8b6f018a1eb0b25bc96cb5a8a3a4', '::1', 1629497327, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439373332373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('072716a7fcafb76d1aa29da62eb4c54cccc1e91f', '::1', 1629313598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331333539383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('07f5e7902f75c313f046083b99cbb65de2f5604c', '::1', 1629228266, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232383236363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('0ade3252041a325d64e963325b9ceb43fe67699f', '::1', 1629310483, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331303438333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('0b937e026cbc63d147db72a0d5d2d9fdb4753f3e', '::1', 1629286849, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238363834383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('0b9f37dcaab6b45b8f831121f70f3ef66ba591ce', '::1', 1629277737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237373733373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323735323236223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('0c1a6c4acd8b88db38ce8b19883775029a82bd10', '::1', 1629399156, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393339393135363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('0c4d2c9117abbfbd22c1e2f93271cbd22963631c', '::1', 1629323370, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332333337303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('0d115f7719756c7b82a4da1493a333f8542770ba', '::1', 1629495520, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439353532303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('0dbd28dfd7b5a9d4c51fea6414219eb120dbee40', '::1', 1629325922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332353932323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('0ee1bbfadba5b6f9864ac419f7791db86172dec4', '::1', 1629270598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237303539383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030343a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323234333839223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('0f68ba27a108f339b403c238b52e4153480670fa', '::1', 1629309720, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330393732303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('0fddda4113859be15a94f4f8d7cdd6ac35a3a420', '::1', 1629229489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232393438393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('1421c26c3ff4d72dfc7e1bb0850abd95ff1c6795', '::1', 1629545779, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534353737393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b726d73706f737c693a313b),
('151032d6d2474ce29250f111325677d913ce40e9', '::1', 1629326277, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332363237373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('16c63fd6f49a4ab87522f3e6dc5487c30f495475', '::1', 1629234847, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233343834373b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('1743fa5ef295a100674f63c2deab2e23c4bc64c6', '::1', 1629239811, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233393831313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('1906021158b078a45152ea5b8392e92a4ae1317f', '::1', 1629307516, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330373531363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('1eec0fd93f361be3da8e667cc2f51d909331b575', '::1', 1629283631, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238333633313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('1ff793b0d82f2ea8b2df5353ddc6a50ccbae0e40', '::1', 1629315284, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331353238343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('2090f5323c90cea9a37afba814e36df177eeb997', '::1', 1629286848, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238363834383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('24365c0d1d31f03b67b87f3922fa920b4fd098aa', '::1', 1629241180, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234313138303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('2692821f199763d0430d2b8103621e100031fd13', '::1', 1629227929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232373932393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('26cb4d8c9a45c2b03edc0e38a05ea5ffea713ef9', '::1', 1629487389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438373338393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('29d6822c2b8172420bb240af9b7d8d410b69006f', '::1', 1629225136, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232353133363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('2f713cd3f669f0ddf57a28ebb56188b9f69fbedc', '::1', 1629439729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393433393732393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('30e6225741c2333c4b240d6d1ff5bf07837695ca', '::1', 1629404123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430343132333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('315bb7d77326558ce29ea6389fa5ec094017aaf7', '::1', 1629226431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232363433313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('328ca04301ff9924570cc3c57aab90b43232d09b', '::1', 1629320064, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332303036343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('33c006ec2a2f8bcea24a530686cc68f8ee3478b0', '::1', 1629273498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237333439383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323732353836223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b637372666b65797c733a383a225963516c39716157223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226f6c64223b733a393a226373726676616c7565223b733a333a226f6c64223b7d6373726676616c75657c733a32303a2266736334694e67314c4f4936506b335174706f6a223b),
('34618a84fee9b0883174225d0b77c78161a6f440', '::1', 1629494430, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439343433303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('35b536fbf0f307ad9e233204ab253f38ecf82348', '::1', 1629239219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233393231393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('36bf519948a52cfd497ab2eef2e32e1e624edc2e', '::1', 1629225560, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232353536303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('37352d7eeaf29af339ef06bcaa31078e25186e3f', '::1', 1629316762, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331363736323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('380e2ed17b56133e276222c4c7587ca7b512f2bb', '::1', 1629226026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232363032363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('38913c25d67d073ba0e2d53bc431d430a8f82eda', '::1', 1629236523, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233363532333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('39d493b534cedee8a60a23fcdd121d9cdcd7a28f', '::1', 1629241603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234313630333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('3c9b44aa5cdc4cf34faebbab7e39813c4d3c6fc7', '::1', 1629324249, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332343134373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333035393833223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('3d25112409bbc99ddd51de0479d1f6cfba74a22e', '::1', 1629272718, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237323731383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323731353430223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b637372666b65797c733a383a22395572696a666538223b5f5f63695f766172737c613a323a7b733a373a22637372666b6579223b733a333a226e6577223b733a393a226373726676616c7565223b733a333a226e6577223b7d6373726676616c75657c733a32303a22367769796d475652706344464338334158766178223b),
('3d7e6b82791f462b221f45514605690fc1d84df7', '::1', 1629317254, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331373235343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('3db892cc0f2c329463be85f1c10225d5a6131177', '::1', 1629238524, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233383532343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('3f7ece813bea2e5e53175fad09e0f3387661755c', '::1', 1629278079, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237383037393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('3fc373696e308a2cc7986c7d9d2c9f46c540dbfe', '::1', 1629439369, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393433393336393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('43063f96273f1f853e537777afe91daccc7b78b3', '::1', 1629490672, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439303637323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('4307462319deb1e76bd0e075a5fc05dda68b1864', '::1', 1629313990, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331333939303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('4545b3e77c66d22feba4c6b870b365bb6a227081', '::1', 1629485970, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438353935363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343733323232223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('4815aa5e25b7f36dbb4e73c1c0be69bb4902150e', '::1', 1629274991, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237343939313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323732383237223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a33383a223c703e596f7520617265207375636365737366756c6c79206c6f6767656420696e2e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b),
('4832cafd4ca95587af12369422d745c424853968', '::1', 1629279547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237393534373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('49d62b2858388677d33728b6a5e159c919354858', '::1', 1629496035, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439363033353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('4b072f53066fcacc4ee148b6c6d3182da885a61f', '::1', 1629495274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439353237343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('4b2231f2d83b66e3c2b595e9c1da5ed5ef813d49', '::1', 1629316129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331363132393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('4b24982bbf67fca8639f22c4bdd66e68a6059435', '::1', 1629542212, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534323231323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('4bc01bb852f26807d448c55b8a5799d39cd639fa', '::1', 1629401475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430313437353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('4d4a1f8029d029a40a2892e7b9a1aee9b2c80da0', '::1', 1629493104, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439333130343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('4dc8342b827e0749397016d8cd95615043dedc01', '::1', 1629473313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393437333230313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343338353334223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('5501c1c560ebf7c45d906f71e509c5d7c5b8c76f', '::1', 1629280437, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238303433373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('562c78513411232e665bfd02ad9675a612de1b70', '::1', 1629493867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439333836373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('56493a167d7076edd34f7aa3714c0aa8962bbeaf', '::1', 1629488143, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438383134333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('57134ea4676a74caf138699193e66620110f547b', '::1', 1629543818, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534333831383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('5a20919e46eb18a98f09c5c16afbafef8e41148a', '::1', 1629324826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332343832363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('5cd767cf66c34db13dc0ca6442290c962987a781', '::1', 1629286489, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238363438393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('5ce90e583f17ccc5798a968a476f6de18887a310', '::1', 1629270942, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237303934323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030343a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323234333839223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('6359cebf9fd71b8075f2baf35cc953a39d4582a3', '::1', 1629278092, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237383039323b6964656e746974797c733a323a226131223b757365726e616d657c733a323a226131223b656d61696c7c733a393a2261314061312e636f6d223b757365725f69647c733a313a2233223b66697273745f6e616d657c733a323a224131223b6c6173745f6e616d657c733a333a225a5a5a223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031313a323420414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323735303730223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031313a32353a3336223b),
('63c7cc8208caeee32aae6b7b09b08d8a4b8548f3', '::1', 1629311165, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331313136353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('641ffe910642923dcfa08e1edee367ef36de3d11', '::1', 1629492759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439323735393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('65bb94b72044081fb470353e7b5eede1f0cbe604', '::1', 1629312887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331323838373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('666415760cec8bb53f8eb8a4c6a07bdfe04bbcef', '::1', 1629230584, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233303538343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('6688846b4d638bcd6394f3787d5cc90fbe729df6', '::1', 1629275553, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237353535333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323734343333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('66b30bf752f35804903ceb08ef1573cdde6cbd39', '::1', 1629489394, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438393339343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('6806014a75fabb1cd99c2008b4962a0c475f12ee', '::1', 1629227222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232373232323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('6ae13ce8d4cf3b16dd86af5284fd9786e450b936', '::1', 1629401953, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430313935333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('6b603abcee425fa135522e322f9e0c16a689a701', '::1', 1629542807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534323830373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('6c0815c7aa774d3e69af3bb4134d410af090916d', '::1', 1629440856, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393434303835363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('6c5f99f5b14c679c6fecb8660cccfd27ce2f9acd', '::1', 1629275885, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237353838353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323734343333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('70bdec49ca1c8bb2cd8e3464cce268ed92922e77', '::1', 1629536692, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533363639323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('7352eaa144a3a52f12208f702b5650030fc5cb03', '::1', 1629240867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234303836373b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('75b5f8c8c2508496d5fbce7381d4dde8f900aacd', '::1', 1629544482, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534343438323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('76fe15ed4c066e525fadd1e6047eaaa4bce3253f', '::1', 1629228593, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232383539333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('770378d3a49e45b6d855596b18afd2c9c995a212', '::1', 1629537198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533373139383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('78589706f090493bb80a6334ff1a504905fd20fc', '::1', 1629230935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233303933353b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('78e02cbf7a05105825d80521e0aaefbd0c9896c4', '::1', 1629241938, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234313933383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('7918c58283a686c6bb1b45068de2b2e78aac710f', '::1', 1629233380, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233333338303b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('7a3905e07b24a632fdab8acd19258cba25173c9c', '::1', 1629546615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534363631353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('7ac86b5836f846bc9dfaf8ac00a4969f8ca5df03', '::1', 1629544787, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534343738373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b),
('7dc718a4b57ce7fe02bc45cbab77c456f9fe91c7', '::1', 1629310826, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331303832363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('7e4d70c9dc1b3b0b487d2f487788b9665fc309ed', '::1', 1629398373, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393339383337333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('7f73792a37f4dc8929f65d4a99b5c86f69e9edd2', '::1', 1629238108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233383130383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('81066d999ea44456deb0a63309eae4a4b16b9033', '::1', 1629307941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330373934313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('8260b67c0fcb2b3157951de2fa841fc1ceb48fbf', '::1', 1629326300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332363237373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('82afcfba0c486c7c6355242b8c1b9ee28601c6f6', '::1', 1629280739, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238303733393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('84b3e0d4fc02b24652ae2d1269705aaec1236309', '::1', 1629284671, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238343637313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('8901bcde629e1274897faa536350939d218cad98', '::1', 1629499405, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439393138373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('8b41726dff3b319c56dc5465f1b9a9e50d2b7178', '::1', 1629242894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234323836393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b6572726f727c733a33393a22506c656173652073656c65637420637573746f6d657220666f7220647565207061796d656e742e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('8c1f6e1cb1e324a30b8b99316f7c138d0437bf72', '::1', 1629289125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238393132313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('8da7538dae2cc3ef7f772110e4a7e0360e64c056', '::1', 1629489018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438393031383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('8e7f7e8d8ba0f6562983f64d41063305ac755595', '::1', 1629440955, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393434303835363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('8f8ae863521cdffa1c837979ddcdaacdb3a55092', '::1', 1629306350, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330363335303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('8fcfe6658a0f68d5238d7f84451d0495389d1687', '::1', 1629404123, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430343132333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('927be8963293a727afaeeb21db9e034a41eee236', '::1', 1629308591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330383539313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('933721c82be27ca02c7081e2e7c89716ab49643e', '::1', 1629285958, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238353935383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('94d5b32986de5742f218bebaa8dc9671c6136470', '::1', 1629314923, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331343932333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('953ab7797e8dcb56db2faa1efcef6ba26446e64e', '::1', 1629234269, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233343236393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('96f3ca85a1aff5a1cdc92452878d4cf7cf9751d8', '::1', 1629314308, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331343330383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('98e148870c33e093069fc7de7f234188ca57af25', '::1', 1629238861, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233383836313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('998b3680db22e445594672e08a44fe3c21e4abe1', '::1', 1629323710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332333731303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('9b8f84f42db9ea87800ba49a1fae1bf3d421253a', '::1', 1629311892, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331313839323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('9c612c5978da506c09f4a5ee0e01c944b2cf25ae', '::1', 1629496421, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439363432313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('9c6e9e81e958f5698f94eae8c214668be6397f62', '::1', 1629498652, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439383635323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('9d63bf1cbdd64cd73597f6ae1dfe9ae58ef2812e', '::1', 1629235666, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233353636363b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('9dc0e37b14439a4b74c7efcfc86cbe9502a9cec5', '::1', 1629277348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237373334383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323735323236223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('9e043fcff9c62b5cc5199d04940a4bdc4e3b84b0', '::1', 1629272348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237323334383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323730313936223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b6d6573736167657c733a33353a223c703e4163636f756e74207375636365737366756c6c7920637265617465643c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('a2189c57134b0b8bf18defd27fc30f259f182848', '::1', 1629321274, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332313237343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('a40c1abf1d1b667265e8e5faa52d6164af6dc973', '::1', 1629492032, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439323033323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('a4c7d563f3358910a5b60eb93a38ad1c7ec5d0d3', '::1', 1629321683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332313638333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('a52131277bccf7edf703213490cfc2ae0a051fb2', '::1', 1629276198, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237363139383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323734343333223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('a76c84de3fb33f0488aaace050ea06d05e10a6f8', '::1', 1629495731, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439353733313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('a7c159f0a551f4e115b8d97cd8c4f7a8ef45328c', '::1', 1629496736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439363733363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('a8af8445e57d7624d0a155922448fb463a3e9728', '::1', 1629440462, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393434303436323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('aa2d78d169afec8d61f50ebf957b2613bb7c28d7', '::1', 1629486952, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438363935323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('b499c7e330184e5f75f219654cdbe0b48b457596', '::1', 1629545094, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534353039343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b),
('b725da9648e17edf246d6881fd818b7c40be835d', '::1', 1629318371, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331383337313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('b7e7762db4359c532959c45725f2ced9d32a4be8', '::1', 1629541172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534313137323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('b82257430ced588182fbfde79da77a59192d80f9', '::1', 1629324147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332343134373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333035393833223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('b9624323a0ca9734b941bf827c9f012be80ad45c', '::1', 1629547061, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534373036313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b726d73706f737c693a313b),
('ba279c3188aa2fe2b552a61f5979b840e8502c6b', '::1', 1629325477, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332353437373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('ba47508c830811dd408aefab7d5df092c64143b2', '::1', 1629289121, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238393132313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('bb416af6242d06d33372f6085f247f9891ddd908', '::1', 1629402333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430323333333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('bdc82be55de35b914ecaac00cef5d828db7180bf', '::1', 1629540659, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534303635393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('bf70d8134ae1e3ce7b442482e3755de43e605d16', '::1', 1629242334, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393234323333343b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('c13250e3ae6fa9de5536f33471bd4a774924fa6a', '::1', 1629488687, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438383638373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('c32da49dab2dd7077c461ccc4b414e06abd9e025', '::1', 1629280042, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238303034323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('c5cb0e166513eafe67ca087361cfd07045f4b370', '::1', 1629236987, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233363938373b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('c636fd39a43693f825639ead4ba68be5cc72e1d6', '::1', 1629543517, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534333531373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('c66610465efc2cc76bb39b21cfd328ad25b9f1a3', '::1', 1629284003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238343030333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('c6d0fa0f8484adb8736aeeb9d6b9f52e8d3c0a5f', '::1', 1629316461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331363436313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('c6f670056efff757bf279a96e1d1b9bda992b5a8', '::1', 1629274288, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237343238383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030363a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323732353836223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b),
('c70b6f7e252652974a0b2bb4670df805a322e93c', '::1', 1629320800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332303830303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('c853ed2b541613ba63099e8ac11d13aaacfaaa63', '::1', 1629400674, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430303637343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('c8eb98f00a221feeb63487a0fb29cc0e0c35a518', '::1', 1629279367, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237393336373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323737373835223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('c95a632d31f88cb5ca893787a8c297cd1d08d867', '::1', 1629397929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393339373932393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('cd56326f6d40dd9038be3e686b150a10d3783b5a', '::1', 1629320487, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332303438373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('cdc6a91852c6ebd15b7d3b618f0738e45d1694f0', '::1', 1629438922, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393433383932323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b6d6573736167657c733a32333a2253616c65207375636365737366756c6c79206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('cff304ee540fa6452671d61603f64dd7a79f888c', '::1', 1629487765, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393438373736353b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('d121622727147e2fe35bcb81edffcbda112cf692', '::1', 1629539422, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533393432323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('d3785d486598d438ab66bf446f9eb0c59e706589', '::1', 1629311543, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331313534333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('d4c3d101135d06ebf57153b500dd9c345cc8c4fc', '::1', 1629226829, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232363832393b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('d719c8458ba07c53ea2259c6b2e480f09832d853', '::1', 1629536181, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533363138313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('d88686a6ad4b01f8c672ee3b4b2e9117efd324ca', '::1', 1629237431, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233373433313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('d9ed53f32cc914b1fe9560b8d49eb8f50a0f4e73', '::1', 1629271372, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237313337323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030343a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323234333839223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2232223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031303a31383a3439223b),
('da0e02aa859d9cf6c0eb5d342bcfee3ae33672ab', '::1', 1629229141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393232393134313b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('dba7d9ef6bc3ee21ec7f3f6807209def050911e2', '::1', 1629544147, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534343134373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('dd41f48caa0a25a9b2bf42fc17cca6c5e7f0fb9c', '::1', 1629538389, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393533383338393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('debb8ccd29fbcf7e513542efc3300a1253828a05', '::1', 1629547605, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534373036313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b),
('e06943a5905b37b43bad45595ff2b5c21c733a4f', '::1', 1629401142, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430313134323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('e1780e2782a24ed83c2257e36abebd28479b05f4', '::1', 1629313264, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331333236343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('e294d0cbd7f6fed7a91f95a8f9f0e6ffc11da5ef', '::1', 1629236172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233363137323b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('e2b27ca2ee65039913b77d2ae56833e455836e90', '::1', 1629496759, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439363733363b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343836313530223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('e2f2ef7c3ef0d58329ce8e41897dd2a095202736', '::1', 1629319722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331393732323b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('e8d86b4dcdcdff5102c309c4f7a92871af862228', '::1', 1629499187, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393439393138373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343835393730223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('ebcbf33988d18aea21cbd6920fd59472ba1494b1', '::1', 1629230233, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233303233333b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('ef14ab9c595e931e1d1e45deb4d78fdbd3f0cfa3', '::1', 1629324073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393332343037333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('f0cd3d815a40a8246f0cc271da0cf75335fe05a4', '::1', 1629283980, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393238333938303b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323736343132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b),
('f19cc41ae335b41025f0c75bbb7a63ca0dd80951', '::1', 1629546129, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534363132393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d32312031343a31383a3535223b6572726f727c733a33393a22506c656173652073656c65637420637573746f6d657220666f7220647565207061796d656e742e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('f2afcc08eb2ee6d1de2138df8594ac15cee4be2e', '::1', 1629315679, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331353637393b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('f74ae918ea5e857b7db027a80055570cd62eff3d', '::1', 1629440127, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393434303132373b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333937303930223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('f7c0ff1e375ec01879afbe4b09b5b40bc100bc70', '::1', 1629233748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393233333734383b6964656e746974797c733a31383a2261646d696e4074656364696172792e636f6d223b757365726e616d657c733a353a2261646d696e223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352030393a323920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231343432323932373239223b6c6173745f69707c733a393a223132372e302e302e31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2231223b636173685f696e5f68616e647c733a383a223530302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31372032333a35303a3130223b),
('f88d4c5e978f9bf67e7f76469f495b65994d80ad', '::1', 1629541618, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393534313631383b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239343934383639223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('f8b4a25c185320c16caa3ebf17ca6348675cb03f', '::1', 1629307144, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393330373134343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('f8deb5d9cf7c421954cf26ae28b44f1a8924b919', '::1', 1629319361, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331393336313b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323738313138223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b726d73706f737c693a313b),
('fa6f7998823c08bf039bc49587023450426baa80', '::1', 1629319853, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393331393835333b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333035393833223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b),
('fab6f40e46c960719cd5a5a418a97f2fcf0ce9ab', '::1', 1629275893, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393237353839333b6964656e746974797c733a323a226131223b757365726e616d657c733a323a226131223b656d61696c7c733a393a2261314061312e636f6d223b757365725f69647c733a313a2233223b66697273745f6e616d657c733a323a224131223b6c6173745f6e616d657c733a333a225a5a5a223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031313a323420414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239323735303730223b6c6173745f69707c4e3b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2232223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2233223b636173685f696e5f68616e647c733a383a223230302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031313a32353a3336223b),
('fb92467ec9a54b24fecb612def298e8a301f152b', '::1', 1629403624, 0x5f5f63695f6c6173745f726567656e65726174657c693a313632393430333632343b6964656e746974797c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365726e616d657c733a31303a226a6b74697474616c6f6d223b656d61696c7c733a32303a226a6b74697474616c6f6d40676d61696c2e636f6d223b757365725f69647c733a313a2232223b66697273745f6e616d657c733a353a224a6974656e223b6c6173745f6e616d657c733a353a224b756d6172223b637265617465645f6f6e7c733a32343a225765642031382041756720323032312031303a333820414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363239333137373831223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2233223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c733a313a2232223b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22313030302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032312d30382d31382031323a31353a3236223b);

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
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
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
  `decimals` tinyint(1) NOT NULL DEFAULT 2,
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
  `char_per_line` tinyint(4) DEFAULT 42,
  `rounding` tinyint(1) DEFAULT 0,
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT 1,
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT 2,
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
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
(1, 'logo1.png', 'SimplePOS', '0105292122', 'D j M Y', 'h:i A', 'noreply@spos.tecdiary.my', 'english', '4.1.0', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'USD', 1, '12%', 10, 30, NULL, NULL, 3, 0, 1, '0', 1, NULL, 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, 'Kenbie@2017', 0, '', '', '52bb8ca3-bb2d-44bc-bb2d-e2c13e155c9b', 'alabadi84', 'green', 0, 1, 1, 2, '', 0, 0, 1, 1, 'null', 0, 1, 0, 0, 'weight', 13, 1, 2, 6, 0, 0, 0, 8, 5, 100, '15', 'vat-1123');

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
  `filter_option` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0: Both, 1:Category, 2:BARCODE only',
  `receipt_header` text DEFAULT NULL,
  `receipt_footer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `vat_id`, `vat`, `filter_option`, `receipt_header`, `receipt_footer`) VALUES
(1, 'SimplePOS', 'POS', 'logo.png', 'store@tecdiary.com', '012345678', 'Address Line 1', '', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', 'MYR', NULL, '0.00', 0, '', 'This is receipt footer for store'),
(2, 'JitenPOS', 'jiten001', NULL, 'jktittalom@gmail.com', '123456789', 'Govindpuram', '', 'Ghaziabad', 'UP', '201013', 'India', NULL, 'vat-1111', '20%', 0, 'Welcome to Jiten-Store', 'Thanks! Visit Again!!!'),
(3, 'A2POS', 'A2001', NULL, 'a2@a2.com', '1234', 'aa', '', 'noida', '', '201013', '', NULL, 'vat-1112', '15%', 0, '', '');

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
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com');

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

--
-- Dumping data for table `tec_suspended_items`
--

INSERT INTO `tec_suspended_items` (`id`, `suspend_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `product_code`, `product_name`, `comment`) VALUES
(1, 1, 1, '2.0000', '15.0000', '13.6364', '0', '0.0000', 10, '2.7272', '30.0000', '15.0000', 'sam001', 'Samsung Mobile', '');

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
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_suspended_sales`
--

INSERT INTO `tec_suspended_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `hold_ref`, `store_id`) VALUES
(1, '2021-08-18 00:09:34', 1, 'Walk-in Client', '27.2728', '0.0000', NULL, '0.0000', '0.0000', '2.7272', '15%', '4.5000', '7.2272', '34.5000', 1, '0.0000', '0.0000', 1, NULL, NULL, '', 'jitu', 1);

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
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 2,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3a3a31, 0x3132372e302e302e31, 'admin', 'fe941d48eb1fbce34b4588ae500861570fb0e398', NULL, 'admin@tecdiary.com', NULL, NULL, NULL, 'b2d2c8fd5d9a5f19901279ac74cec92dc15ac970', 1435204774, 1629274724, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', NULL, 'male', 1, NULL),
(2, 0x3a3a31, 0x3a3a31, 'jktittalom', 'ff37a7b55bd6dcc3b1276f26cda8ff5d9501b321', NULL, 'jktittalom@gmail.com', NULL, NULL, NULL, '78223e3d256219e53cdddaf6ba0a24adfdab223b', 1629272323, 1629535566, 1, 'Jiten', 'Kumar', NULL, '8800282717', NULL, 'male', 3, 2),
(3, 0x3a3a31, 0x3a3a31, 'a1', '1a511bf26692a8fece4b88355d48e2ec4f890b2e', NULL, 'a1@a1.com', NULL, NULL, NULL, '1421a4790f19a33056db6a0867b74e401ee209f9', 1629275070, 1629275125, 1, 'A1', 'ZZZ', NULL, '11', NULL, 'male', 2, 2);

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
  `time` timestamp NULL DEFAULT current_timestamp()
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
(19, 2, NULL, 0x3a3a31, 'jktittalom@gmail.com', '2021-08-21 08:46:06');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
