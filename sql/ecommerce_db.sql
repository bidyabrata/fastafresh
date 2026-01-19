-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 19, 2026 at 12:45 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_app_menus`
--

CREATE TABLE `ecomm_app_menus` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `landing_url` varchar(45) NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_app_menus`
--

INSERT INTO `ecomm_app_menus` (`id`, `name`, `id_parent`, `landing_url`, `position`, `status`, `updatedOn`) VALUES
(1, 'Dashboard', 0, 'dashboard', 1, 'A', '2021-07-02 11:20:49'),
(2, 'Catalog Management', 0, '#', 2, 'A', '2021-07-02 11:20:49'),
(3, 'Product Category', 2, 'product-categories', 3, 'A', '2021-07-02 11:25:09'),
(4, 'Product Catelog Offer', 2, 'product-catelog-offers', 4, 'P', '2021-07-02 11:25:09'),
(5, 'Product', 2, 'products', 5, 'A', '2021-07-02 11:29:03'),
(6, 'Inventory', 2, 'product-inventory', 6, 'P', '2021-07-02 11:29:03'),
(7, 'User Access Management', 0, '#', 7, 'P', '2021-07-02 11:32:33'),
(8, 'Content Management', 0, '#', 8, 'A', '2021-07-02 11:32:33'),
(9, 'User Category', 7, 'user-categories', 1, 'P', '2021-07-02 12:19:22'),
(10, 'User', 7, 'users', 2, 'P', '2021-07-02 12:19:22'),
(11, 'Menu', 7, 'menus', 3, 'P', '2021-07-02 12:20:50'),
(12, 'Content Blocks', 8, 'special-blocks', 0, 'A', '2021-07-02 12:22:25'),
(13, 'Page system', 8, 'pages', 0, 'A', '2021-07-02 12:22:25'),
(14, 'Banner', 8, 'banner', 0, 'A', '2021-07-02 12:23:43'),
(15, 'SEO', 2, 'seo', 0, 'A', '2021-07-02 12:24:49');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_app_menu_user_cat_map`
--

CREATE TABLE `ecomm_app_menu_user_cat_map` (
  `id_user_category` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `readonly` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_carts`
--

CREATE TABLE `ecomm_carts` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_catelog_offer`
--

CREATE TABLE `ecomm_catelog_offer` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `ofr_start_date` datetime NOT NULL,
  `ofr_end_date` datetime NOT NULL,
  `reduction_type` enum('Flat','Percent') NOT NULL DEFAULT 'Percent',
  `reduction` double NOT NULL,
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_catelog_offer`
--

INSERT INTO `ecomm_catelog_offer` (`id`, `name`, `ofr_start_date`, `ofr_end_date`, `reduction_type`, `reduction`, `createdOn`, `updatedOn`) VALUES
(1, 'Summer Offer', '2021-07-08 10:34:50', '2021-09-30 10:34:50', 'Flat', 200, '2021-07-08 10:34:50', '2021-07-08 10:34:50');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_customers`
--

CREATE TABLE `ecomm_customers` (
  `id` int(11) NOT NULL,
  `id_group` int(11) DEFAULT 1,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `zip_code` char(6) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) NOT NULL DEFAULT 'WB',
  `country` varchar(45) NOT NULL DEFAULT 'India',
  `otp` char(6) DEFAULT NULL,
  `otp_valid_upto` datetime DEFAULT NULL,
  `id_default_shipping` int(11) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_customers`
--

INSERT INTO `ecomm_customers` (`id`, `id_group`, `fname`, `lname`, `email_address`, `phone`, `address_line_1`, `address_line_2`, `zip_code`, `city`, `state`, `country`, `otp`, `otp_valid_upto`, `id_default_shipping`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 1, 'Bidyabrata', 'Biswas', 'bidyabrata.tech@gmail.com', '9876543210', 'Itla', 'Schoolpara', '741102', 'Nadia', 'WB', 'India', NULL, NULL, 0, 'A', '2026-01-12 20:37:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_customers_address`
--

CREATE TABLE `ecomm_customers_address` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `address_type` enum('billing','shipping') NOT NULL DEFAULT 'billing',
  `name` varchar(45) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `alt_phone` varchar(24) DEFAULT NULL,
  `address_line_1` varchar(255) NOT NULL,
  `address_line_2` varchar(255) DEFAULT NULL,
  `zip_code` varchar(6) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `country` varchar(45) NOT NULL DEFAULT 'India',
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_customers_address`
--

INSERT INTO `ecomm_customers_address` (`id`, `id_customer`, `address_type`, `name`, `phone`, `alt_phone`, `address_line_1`, `address_line_2`, `zip_code`, `city`, `state`, `country`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 1, 'shipping', 'Bidyabrata Biswas', '9876543211', '1234567890', 'Itla Schoolpara', 'Kalirhat', '741109', 'Nadia', 'WB', '', 'A', '2026-01-12 22:30:05', NULL),
(2, 1, 'shipping', 'Bidyabrata Biswas', '9876543210', '1234567890', 'Itla Uttarpara', 'Kalirhat', '741102', 'Nadia', 'WB', '', 'A', '2026-01-12 22:41:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_home_banner`
--

CREATE TABLE `ecomm_home_banner` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `banner` varchar(45) NOT NULL,
  `banner_type` enum('slider','offer','banner') NOT NULL DEFAULT 'slider',
  `attached_link` varchar(45) NOT NULL,
  `txt` text NOT NULL,
  `position` int(11) DEFAULT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_home_banner`
--

INSERT INTO `ecomm_home_banner` (`id`, `name`, `banner`, `banner_type`, `attached_link`, `txt`, `position`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 'banner1', 'banner1.jpg', 'slider', '#', '', 1, 'A', '2020-09-26 21:08:51', '0000-00-00 00:00:00'),
(2, 'banner2', 'banner2.jpg', 'slider', '#', '', NULL, 'A', '2020-09-26 21:08:51', '0000-00-00 00:00:00'),
(3, 'banner3', 'banner3.jpg', 'slider', '#', '', NULL, 'A', '2020-09-26 21:08:51', '0000-00-00 00:00:00'),
(4, 'banner-half-1', 'banner-half-1.jpg', 'banner', '#', '', 2, 'A', '2020-09-26 22:38:40', '0000-00-00 00:00:00'),
(5, 'banner-half-2', 'banner-half-2.jpg', 'banner', '#', '', 1, 'A', '2020-09-26 22:38:40', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_orders`
--

CREATE TABLE `ecomm_orders` (
  `id` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `order_ref` varchar(45) NOT NULL,
  `product_amount` decimal(10,2) NOT NULL,
  `shipping_amount` decimal(10,2) NOT NULL,
  `service_charge_amount` decimal(10,2) NOT NULL,
  `discount_amount` decimal(10,2) DEFAULT NULL,
  `discount_name` varchar(45) DEFAULT NULL,
  `payable_amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  `shipping_zipcode` int(11) NOT NULL,
  `addresses` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'billing:[],\r\nshipping:[]' CHECK (json_valid(`addresses`)),
  `order_status` enum('pending','paid','shipped','delivered','canceled') NOT NULL DEFAULT 'pending',
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_orders`
--

INSERT INTO `ecomm_orders` (`id`, `id_customer`, `order_ref`, `product_amount`, `shipping_amount`, `service_charge_amount`, `discount_amount`, `discount_name`, `payable_amount`, `payment_method`, `shipping_zipcode`, `addresses`, `order_status`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 1, 'FF-20260118-000001', 1627.00, 0.00, 0.00, 0.00, NULL, 1627.00, 'COD', 741102, '{\"shipping\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null},\"billing\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null}}', 'pending', 'A', '2026-01-18 08:50:45', NULL),
(2, 1, 'FF-20260118-000002', 588.00, 0.00, 0.00, 0.00, NULL, 588.00, 'COD', 741109, '{\"shipping\":{\"id\":\"1\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543211\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Schoolpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741109\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:30:05\",\"updatedOn\":null},\"billing\":{\"id\":\"1\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543211\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Schoolpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741109\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:30:05\",\"updatedOn\":null}}', 'pending', 'A', '2026-01-18 08:52:19', NULL),
(3, 1, 'FF26-000003', 363.00, 0.00, 0.00, 0.00, NULL, 363.00, 'COD', 741102, '{\"shipping\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null},\"billing\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null}}', 'pending', 'A', '2026-01-18 09:53:34', NULL),
(4, 1, 'FF26-000004', 73.00, 10.00, 0.00, 0.00, NULL, 83.00, 'COD', 741102, '{\"shipping\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null},\"billing\":{\"id\":\"2\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543210\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Uttarpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741102\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:41:03\",\"updatedOn\":null}}', 'pending', 'A', '2026-01-18 09:55:22', NULL),
(5, 1, 'FF26-000005', 189.00, 0.00, 0.00, 0.00, NULL, 189.00, 'COD', 741109, '{\"shipping\":{\"id\":\"1\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543211\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Schoolpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741109\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:30:05\",\"updatedOn\":null},\"billing\":{\"id\":\"1\",\"id_customer\":\"1\",\"address_type\":\"shipping\",\"name\":\"Bidyabrata Biswas\",\"phone\":\"9876543211\",\"alt_phone\":\"1234567890\",\"address_line_1\":\"Itla Schoolpara\",\"address_line_2\":\"Kalirhat\",\"zip_code\":\"741109\",\"city\":\"Nadia\",\"state\":\"WB\",\"country\":\"\",\"status\":\"A\",\"createdOn\":\"2026-01-12 22:30:05\",\"updatedOn\":null}}', 'pending', 'A', '2026-01-18 23:28:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_order_items`
--

CREATE TABLE `ecomm_order_items` (
  `id` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `sku` varchar(24) DEFAULT NULL,
  `product_name` varchar(150) NOT NULL,
  `price_unit` varchar(100) NOT NULL,
  `quantity` int(11) NOT NULL,
  `applicable_price` decimal(10,2) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ecomm_order_items`
--

INSERT INTO `ecomm_order_items` (`id`, `id_order`, `id_customer`, `id_product`, `sku`, `product_name`, `price_unit`, `quantity`, `applicable_price`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 1, 1, 86, NULL, 'TATA tea gold 250gm', '250gm', 3, 130.00, 'A', '2026-01-18 08:50:45', NULL),
(2, 1, 1, 74, NULL, 'Potato Chips', '500gm', 2, 95.00, 'A', '2026-01-18 08:50:45', NULL),
(3, 1, 1, 67, NULL, 'Glucon D Tangy Orange', '1kg', 3, 349.00, 'A', '2026-01-18 08:50:45', NULL),
(4, 2, 1, 63, NULL, 'Fortune Chakki Fresh Atta', '5kg', 1, 225.00, 'A', '2026-01-18 08:52:19', NULL),
(5, 2, 1, 61, NULL, 'Joygopal Atta', '1kg', 1, 40.00, 'A', '2026-01-18 08:52:19', NULL),
(6, 2, 1, 60, NULL, 'Ganesh Maida', '1kg', 1, 52.00, 'A', '2026-01-18 08:52:19', NULL),
(7, 2, 1, 62, NULL, 'Fortune Chakki Fresh Atta', '1kg', 1, 46.00, 'A', '2026-01-18 08:52:19', NULL),
(8, 2, 1, 87, NULL, 'TATA tea gold 500gm', '500gm', 1, 225.00, 'A', '2026-01-18 08:52:19', NULL),
(9, 3, 1, 73, NULL, 'Khejur', '1kg', 1, 118.00, 'A', '2026-01-18 09:53:35', NULL),
(10, 3, 1, 75, NULL, 'Aamsotto', '1kg', 1, 230.00, 'A', '2026-01-18 09:53:35', NULL),
(11, 3, 1, 68, NULL, 'Nutrela Soya Chunks', '80gm', 1, 15.00, 'A', '2026-01-18 09:53:35', NULL),
(12, 4, 1, 2, NULL, 'Colgate Strong Teeth Toothpaste', '38gm', 1, 18.00, 'A', '2026-01-18 09:55:22', NULL),
(13, 4, 1, 6, NULL, 'Colgate Super Flexi Toothbrush (2+1)', 'pc', 1, 30.00, 'A', '2026-01-18 09:55:22', NULL),
(14, 4, 1, 9, NULL, 'Lifebuoy Total 10 Handwash', '80ml', 1, 25.00, 'A', '2026-01-18 09:55:22', NULL),
(15, 5, 1, 1, NULL, 'Dabur Red Toothpaste', '200gm', 1, 125.00, 'A', '2026-01-18 23:28:55', NULL),
(16, 5, 1, 42, NULL, 'Sunrise Mustard Powder', '35gm', 1, 14.00, 'A', '2026-01-18 23:28:55', NULL),
(17, 5, 1, 66, NULL, 'Rasna', 'Pc', 1, 50.00, 'A', '2026-01-18 23:28:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_page_system`
--

CREATE TABLE `ecomm_page_system` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url_mask` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `other_values` text NOT NULL,
  `inc_header_footer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_page_system`
--

INSERT INTO `ecomm_page_system` (`id`, `name`, `url_mask`, `content`, `other_values`, `inc_header_footer`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 'About Us Mobile', 'about-us-mobile', '&lt;h1&gt;About Us&lt;/h1&gt;\n\n&lt;p class=&quot;tagline&quot;&gt;Get Faster and Fresh, just &lt;strong&gt;#FastaFresh&lt;/strong&gt;&lt;/p&gt;\n\n&lt;p class=&quot;about-text&quot;&gt;Welcome to FastaFresh, your one-stop solution for convenient and reliable grocery and vegetable delivery. We understand the value of your time and the importance of having access to fresh, healthy, and high-quality produce right at your doorstep. Our mission is to provide a seamless and delightful shopping experience while promoting a healthy lifestyle for our customers.&lt;/p&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Our Vision: Nourishing Lives, Simplifying Shopping&lt;/h2&gt;\n\n&lt;p&gt;At FastaFresh, we envision a world where everyone has easy access to fresh and nutritious food without the hassle of visiting crowded grocery stores. We believe in nourishing lives by delivering wholesome produce that promotes well-being and supports sustainable living. Our platform is designed to simplify the shopping process, making it convenient for busy individuals, families, and seniors to order groceries and vegetables with just a few taps.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Quality and Freshness Guaranteed&lt;/h2&gt;\n\n&lt;p&gt;We take pride in sourcing the freshest and finest quality products available in the market. From farm-fresh vegetables to premium grocery items, our commitment to freshness is unwavering.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;User-Friendly App Experience&lt;/h2&gt;\n\n&lt;p&gt;Our mobile application provides an effortless way to browse through an extensive range of products. Enjoy seamless navigation, smart search options, and personalized recommendations tailored to your preferences.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Fast and Reliable Delivery&lt;/h2&gt;\n\n&lt;p&gt;Our efficient logistics network ensures that your orders reach your doorstep promptly and in pristine condition. Say goodbye to long queues and heavy grocery bags; FastaFresh is here to make your life easier.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Community and Sustainability&lt;/h2&gt;\n\n&lt;p&gt;We actively engage in sustainable practices to reduce our environmental impact. From eco-friendly packaging to supporting local farmers, we aim to create a positive impact on the environment and communities we serve.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Customer Satisfaction is Our Priority&lt;/h2&gt;\n\n&lt;p&gt;Customer satisfaction is at the heart of everything we do. Our dedicated support team is always ready to assist you, ensuring your shopping experience remains exceptional.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Join the FastaFresh Family&lt;/h2&gt;\n\n&lt;p&gt;Experience the joy of receiving farm-fresh vegetables and high-quality groceries right at your doorstep. Together, let&amp;#39;s make a positive change in our lives and the world around us.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;p class=&quot;closing&quot;&gt;FastaFresh - Freshness, Convenience, and Care in Every Order.&lt;/p&gt;\n', '', 'No', 'A', '2026-01-19 02:51:34', '2026-01-19 02:51:34'),
(2, 'Refund Policy Mobile', 'refund-policy-mobile', '&lt;h1&gt;Refund Policy&lt;/h1&gt;\n\n&lt;p class=&quot;tagline&quot;&gt;Don&amp;#39;t Like It, Don&amp;#39;t Take It - Instant Refund&lt;/p&gt;\n\n&lt;p class=&quot;about-text&quot;&gt;At FastaFresh, we are committed to ensuring your utmost satisfaction with every purchase you make through our grocery and vegetable delivery application (&amp;quot;App&amp;quot;). We understand that sometimes a product may not meet your expectations or preferences. That&amp;#39;s why we have implemented a hassle-free and customer-centric refund policy called &amp;quot;Don&amp;#39;t Like It, Don&amp;#39;t Take It - Instant Refund.&amp;quot; We want you to shop with confidence, knowing that your happiness is our priority.&lt;/p&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Instant Refund for Unwanted Items&lt;/h2&gt;\n\n&lt;p&gt;If you are dissatisfied with any product delivered through our App, for any reason whatsoever, simply let us know at the time of delivery. Our friendly delivery personnel will promptly process an instant refund for the unwanted item(s) right on the spot. We believe in making the refund process quick and seamless, so you don&amp;#39;t have to worry about unwanted purchases.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;How It Works&lt;/h2&gt;\n\n&lt;p&gt;&lt;strong&gt;1. Identify Unwanted Items:&lt;/strong&gt; Upon receiving your order, please inspect the items to ensure they meet your expectations. If you come across any products that you do not wish to keep, inform our delivery personnel immediately.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;2. Instant Refund:&lt;/strong&gt; Our delivery personnel will verify the condition of the unwanted item(s) and process an instant refund to your original payment method. You will receive an email or notification confirming the refund transaction.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;3. No Questions Asked:&lt;/strong&gt; We respect your choice, and there is no need to provide any explanation for the return. We understand that taste preferences and other factors vary, and we want you to feel comfortable shopping with us.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Terms and Conditions&lt;/h2&gt;\n\n&lt;p&gt;&lt;strong&gt;1. Time of Delivery:&lt;/strong&gt; The &amp;quot;Don&amp;#39;t Like It, Don&amp;#39;t Take It&amp;quot; refund policy applies only at the time of delivery. Once you accept the delivery and the delivery personnel leave the premises, this refund option is no longer available.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;2. Unopened and Unused:&lt;/strong&gt; To be eligible for an instant refund, the unwanted item(s) must be unopened, unused, and in their original condition and packaging.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;3. Perishable Items:&lt;/strong&gt; Due to the nature of some perishable products, such as fresh produce, we are unable to process refunds once these items leave the delivery location. However, if you are not satisfied with the quality of perishable items, please contact our customer support team for assistance.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;4. Non-Refundable Items:&lt;/strong&gt; Some items, such as gift cards and certain non-perishable products, may not be eligible for an instant refund. These exceptions will be clearly communicated during the checkout process.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;5. Abuse of Policy:&lt;/strong&gt; We reserve the right to decline refunds or suspend accounts if we suspect abuse of this policy or any fraudulent activity.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;p class=&quot;closing&quot;&gt;At FastaFresh, we believe in transparency and putting our customers first. With our &amp;quot;Don&amp;#39;t Like It, Don&amp;#39;t Take It - Instant Refund&amp;quot; policy, you can shop confidently, knowing that we stand behind the quality of our products and are dedicated to your satisfaction. Thank you for choosing FastaFresh for your grocery and vegetable needs!&lt;/p&gt;\n', '', 'No', 'A', '2026-01-19 02:56:16', '2026-01-19 02:56:16'),
(3, 'Privacy Policy Mobile', 'privacy-policy-mobile', '&lt;h1&gt;Privacy Policy&lt;/h1&gt;\n\n&lt;p class=&quot;tagline&quot;&gt;Effective Date: 19th July, 2023&lt;/p&gt;\n\n&lt;p class=&quot;about-text&quot;&gt;At FastaFresh, we value your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your data when you use the FastaFresh grocery and vegetable delivery application (&amp;quot;App&amp;quot;). By accessing or using the App, you consent to the practices described in this Privacy Policy. Please read this document carefully to understand our practices regarding your personal data.&lt;/p&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Information We Collect&lt;/h2&gt;\n\n&lt;p&gt;&lt;strong&gt;1. Personal Information:&lt;/strong&gt; When you register with FastaFresh, we may collect personal information such as your name, email address, phone number, and delivery address. This information is necessary to process your orders and provide you with a personalized shopping experience.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;2. Device Information:&lt;/strong&gt; We automatically collect certain information about your device, including your IP address, operating system, and browser type. This helps us optimize our services and troubleshoot any technical issues you may encounter.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;How We Use Your Information&lt;/h2&gt;\n\n&lt;p&gt;&lt;strong&gt;1. Order Processing:&lt;/strong&gt; We use the information you provide to process your orders, arrange deliveries, and send you important updates related to your purchases.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;2. Customer Support:&lt;/strong&gt; Our customer support team may use your contact details to assist you with any queries or issues you may have while using the App.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;3. Personalization:&lt;/strong&gt; We utilize your usage data to personalize your shopping experience, offer tailored product recommendations, and improve the App&amp;#39;s functionality.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;4. Communication:&lt;/strong&gt; We may send you promotional materials, newsletters, or updates about our services and special offers, but only if you have consented to receive such communications.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;5. Legal Compliance:&lt;/strong&gt; We may use your information to comply with applicable laws, regulations, or legal processes.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Information Sharing and Disclosure&lt;/h2&gt;\n\n&lt;p&gt;&lt;strong&gt;1. Legal Requirements:&lt;/strong&gt; We may disclose your information when required to do so by law, or if we believe such action is necessary to protect our rights, safety, or property, or that of others.&lt;/p&gt;\n\n&lt;p&gt;&lt;strong&gt;2. Business Transfers:&lt;/strong&gt; If FastaFresh undergoes a merger, acquisition, or any other form of business transition, your data may be transferred as part of the assets involved, subject to the same privacy protections as outlined in this policy.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Data Security&lt;/h2&gt;\n\n&lt;p&gt;We employ strict security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. We use encryption, firewalls, and other industry-standard technologies to safeguard your data.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Changes to This Policy&lt;/h2&gt;\n\n&lt;p&gt;FastaFresh may update this Privacy Policy from time to time. Any changes will be reflected with an updated effective date, and we encourage you to review this page periodically to stay informed about our data handling practices.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;section class=&quot;about-section&quot;&gt;\n&lt;h2&gt;Contact Us&lt;/h2&gt;\n\n&lt;p&gt;If you have any questions or concerns about our Privacy Policy or how we handle your data, please contact our customer support team at &lt;strong&gt;info@fastafresh.com&lt;/strong&gt;. We are committed to addressing any queries promptly and transparently.&lt;/p&gt;\n&lt;/section&gt;\n\n&lt;p class=&quot;closing&quot;&gt;By continuing to use the FastaFresh App, you acknowledge that you have read and understood this Privacy Policy and consent to the collection, use, and disclosure of your personal information as described herein.&lt;/p&gt;', '', 'No', 'A', '2026-01-19 02:57:00', '2026-01-19 02:57:00'),
(4, 'Terms And Conditions Mobile', 'terms-and-conditions-mobile', '&lt;h1&gt;Terms and Conditions&lt;/h1&gt;\r\n\r\n&lt;p&gt;FastaFresh Grocery and Vegetable Delivery Application - West Bengal, India&lt;/p&gt;\r\n\r\n&lt;p&gt;These Terms and Conditions (&amp;quot;Terms&amp;quot;) govern the use of the FastaFresh grocery and vegetable delivery application (&amp;quot;App&amp;quot;) in the state of West Bengal, India. By accessing or using the App, you agree to be bound by these Terms. If you do not agree with any part of these Terms, please refrain from using the App.&lt;/p&gt;\r\n\r\n&lt;h2&gt;User Eligibility&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;1. Age Requirement:&lt;/strong&gt; To use the App, you must be at least 18 years old and legally eligible to enter into a contract. By accessing the App, you affirm that you meet these eligibility requirements.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Location:&lt;/strong&gt; The App is intended for use within the state of West Bengal, India. Users accessing the App from outside West Bengal may not be able to avail of our services.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Account Registration&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;1. Personal Information:&lt;/strong&gt; To access certain features of the App, you may be required to register an account. You agree to provide accurate, complete, and current information during the registration process.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Account Security:&lt;/strong&gt; You are responsible for maintaining the confidentiality of your account credentials and are solely responsible for any activities conducted through your account.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Use of the App&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;1. License:&lt;/strong&gt; FastaFresh grants you a limited, non-exclusive, non-transferable, and revocable license to use the App for personal, non-commercial purposes in accordance with these Terms.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Prohibited Conduct:&lt;/strong&gt; You agree not to engage in any conduct that may:&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Violate any applicable laws or regulations.&lt;/li&gt;\r\n	&lt;li&gt;Infringe upon the rights, privacy, or intellectual property of others.&lt;/li&gt;\r\n	&lt;li&gt;Interfere with, disrupt, or compromise the security or performance of the App.&lt;/li&gt;\r\n	&lt;li&gt;Attempt to gain unauthorized access to the App, user accounts, or related systems.&lt;/li&gt;\r\n	&lt;li&gt;Use the App for fraudulent, abusive, deceptive, or unlawful purposes.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n\r\n&lt;h2&gt;Orders and Payments&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;1. Order Placement:&lt;/strong&gt; By placing an order through the App, you agree to purchase the selected products subject to availability.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Pricing:&lt;/strong&gt; Prices displayed on the App are subject to change without prior notice. Promotional prices may be time-bound and subject to terms.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;3. Payment:&lt;/strong&gt; Payments must be made through the available payment methods in the App. You agree to provide valid payment information and authorize FastaFresh to charge the applicable amount.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;4. Confirmation:&lt;/strong&gt; An order is confirmed only after payment is successfully processed and acknowledged by FastaFresh.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Delivery&lt;/h2&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;1. Service Area:&lt;/strong&gt; Deliveries are available within Krishnanagar, Shantipur, Dignagar, and nearby areas in West Bengal.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;2. Timeliness:&lt;/strong&gt; FastaFresh strives to deliver orders promptly; however, delivery times may vary due to traffic, weather, or other unforeseen circumstances.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;3. Responsibility:&lt;/strong&gt; Risk of loss and title for items pass to you upon delivery at the address provided.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Quality Assurance&lt;/h2&gt;\r\n\r\n&lt;p&gt;FastaFresh takes pride in sourcing fresh and high-quality products. If you are dissatisfied with the quality of any item, please contact customer support within a reasonable time for resolution in accordance with our return or refund policy.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Returns and Refunds&lt;/h2&gt;\r\n\r\n&lt;p&gt;Eligible returns or refunds will be processed based on product condition, proof of issue, and compliance with our policy timelines. Certain perishable items may not be eligible for return once delivered unless damaged or spoiled.&lt;/p&gt;\r\n\r\n&lt;h2&gt;User Content&lt;/h2&gt;\r\n\r\n&lt;p&gt;Any reviews, feedback, or suggestions you submit may be used by FastaFresh to improve services. By submitting content, you grant FastaFresh a non-exclusive, royalty-free license to use, reproduce, and display such content, subject to applicable laws.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Privacy&lt;/h2&gt;\r\n\r\n&lt;p&gt;Your use of the App is also governed by our Privacy Policy, which explains how we collect, use, and protect your personal information.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Limitation of Liability&lt;/h2&gt;\r\n\r\n&lt;p&gt;To the maximum extent permitted by law, FastaFresh shall not be liable for indirect, incidental, special, consequential, or punitive damages, or for any loss of profits or revenues, arising from your use of the App or any delays or failures in delivery beyond our reasonable control.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Indemnity&lt;/h2&gt;\r\n\r\n&lt;p&gt;You agree to indemnify and hold harmless FastaFresh, its affiliates, and employees from any claims, liabilities, damages, losses, and expenses (including legal fees) arising out of or related to your violation of these Terms or misuse of the App.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Termination&lt;/h2&gt;\r\n\r\n&lt;p&gt;FastaFresh may suspend or terminate your access to the App at its sole discretion if you violate these Terms or engage in conduct deemed harmful to the App or its users. Upon termination, your right to use the App ceases immediately.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Changes to Terms&lt;/h2&gt;\r\n\r\n&lt;p&gt;FastaFresh may update these Terms from time to time. Continued use of the App after changes are posted constitutes your acceptance of the revised Terms.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Governing Law and Jurisdiction&lt;/h2&gt;\r\n\r\n&lt;p&gt;These Terms shall be governed by and construed in accordance with the laws of India. Any disputes shall be subject to the exclusive jurisdiction of the courts located in West Bengal.&lt;/p&gt;\r\n\r\n&lt;h2&gt;Contact Us&lt;/h2&gt;\r\n\r\n&lt;p&gt;For questions or concerns regarding these Terms, please contact:&lt;/p&gt;\r\n\r\n&lt;p&gt;? +91 98765 43210&lt;/p&gt;\r\n\r\n&lt;p&gt;✉️ support@fastafresh.com&lt;/p&gt;\r\n', '', 'Yes', 'A', '2026-01-19 02:57:49', '2026-01-19 11:17:43');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_products`
--

CREATE TABLE `ecomm_products` (
  `id` int(11) NOT NULL,
  `sku` varchar(24) NOT NULL,
  `name` varchar(150) NOT NULL,
  `url_mask` varchar(150) NOT NULL,
  `id_default_category` int(11) NOT NULL,
  `id_brand` int(11) DEFAULT NULL,
  `default_image` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offer_price` decimal(10,2) DEFAULT NULL,
  `price_unit` varchar(100) DEFAULT NULL,
  `cost_of_product` decimal(10,2) DEFAULT NULL,
  `short_desc` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `product_type` enum('standard','combination','package') NOT NULL DEFAULT 'standard',
  `combinations` varchar(50) DEFAULT NULL,
  `tag` varchar(45) DEFAULT NULL,
  `is_visible_to_list` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) DEFAULT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_products`
--

INSERT INTO `ecomm_products` (`id`, `sku`, `name`, `url_mask`, `id_default_category`, `id_brand`, `default_image`, `price`, `offer_price`, `price_unit`, `cost_of_product`, `short_desc`, `description`, `product_type`, `combinations`, `tag`, `is_visible_to_list`, `position`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 'DABUR-RED-TP-100', 'Dabur Red Toothpaste', 'dabur-red-toothpaste', 5, 0, 'dabur-red-toothpaste.jpg', 130.00, 125.00, '200gm', 118.00, 'Ayurvedic toothpaste enriched with natural herbs', '&lt;section&gt; &lt;h3&gt;Dabur Red Toothpaste&lt;/h3&gt; &lt;p&gt;Dabur Red Toothpaste blends traditional Ayurvedic wisdom with modern oral care to help keep teeth clean and gums healthy. Its herbal formulation provides a refreshing mouthfeel while supporting daily plaque control. Use twice a day for consistent protection and freshness.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Key herbs:&lt;/strong&gt; Clove, mint, and other Ayurvedic extracts.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Fresh breath, daily plaque control, gum care.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Ideal for:&lt;/strong&gt; Everyday oral hygiene and a natural care routine.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Brush thoroughly for 2&ndash;3 minutes, morning and night, and rinse well.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(2, 'COLGATE-STRONG-TP-100', 'Colgate Strong Teeth Toothpaste', 'colgate-strong-teeth-toothpaste', 5, 0, 'colgate-strong-teeth-toothpaste.jpg', 20.00, 18.00, '38gm', 17.00, 'Fluoride toothpaste for strong teeth', '&lt;section&gt; &lt;h3&gt;Colgate Strong Teeth Toothpaste&lt;/h3&gt; &lt;p&gt;Colgate Strong Teeth is formulated with fluoride to help strengthen enamel and provide dependable cavity protection. Its smooth paste spreads easily, delivering a clean, fresh feel with every brush. Suitable for daily use by the whole family.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Enamel strengthening, cavity protection, fresh breath.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Texture:&lt;/strong&gt; Smooth paste for comfortable brushing.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Routine:&lt;/strong&gt; Twice-daily brushing for best results.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Apply a pea-sized amount and brush all surfaces of teeth for 2&ndash;3 minutes.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(3, 'COLGATE-MAXFRESH-SPICY-1', 'Colgate MaxFresh Spicy Fresh Toothpaste', 'colgate-maxfresh-spicy-fresh-toothpaste', 5, 0, 'colgate-maxfresh-spicy-fresh-toothpaste.jpg', 20.00, 18.00, '42gm', 17.00, 'Toothpaste with spicy mint flavor for lasting freshness', '&lt;section&gt; &lt;h3&gt;Colgate Maxfresh Spicy Fresh Toothpaste&lt;/h3&gt; &lt;p&gt;Colgate Maxfresh Spicy Fresh delivers an invigorating, minty kick designed to awaken your senses and freshen breath. The energizing flavor helps you start your day with confidence while supporting everyday oral hygiene.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Flavor:&lt;/strong&gt; Spicy mint for a lively freshness.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Breath freshness, daily plaque removal.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Use:&lt;/strong&gt; Suitable for routine morning and night brushing.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Brush thoroughly for 2&ndash;3 minutes and rinse; repeat twice daily.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(4, 'VIM-DISH-BAR-100', 'Vim Dish Wash Bar', 'vim-dish-wash-bar', 4, 0, 'vim-dish-wash-bar.jpg', 5.00, 0.00, '75gm', 4.00, 'Tough grease removal with gentle care', '&lt;section&gt; &lt;h3&gt;Vim Dish Wash Bar&lt;/h3&gt; &lt;p&gt;The Vim Dish Wash Bar helps cut through tough grease on utensils, leaving them clean and residue-free. Its compact form is easy to hold and apply, making everyday dish cleaning quick and efficient.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Strong grease removal, quick rinsing.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Suitable for:&lt;/strong&gt; Stainless steel, aluminum, and melamine (avoid delicate coatings).&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Fragrance:&lt;/strong&gt; Fresh, kitchen-friendly scent.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Wet scrubber, rub on bar, apply lather to utensils, and rinse thoroughly.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(5, 'COMFORT-FAB-CON-100', 'Comfort Fabric Conditioner', 'comfort-fabric-conditioner', 4, 0, 'comfort-fabric-conditioner.jpg', 4.00, 0.00, '20ml', 4.00, 'Fabric conditioner for softness and freshness', '&lt;section&gt; &lt;h3&gt;Comfort Fabric Conditioner&lt;/h3&gt; &lt;p&gt;Comfort Fabric Conditioner softens fibers to reduce stiffness and improve drape, helping clothes feel gentle against the skin. It adds a lasting, pleasant fragrance that refreshes garments between wears.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Softness, easy ironing, long-lasting freshness.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Compatible with:&lt;/strong&gt; Hand wash and machine wash cycles.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Care:&lt;/strong&gt; Gentle on most everyday fabrics.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Add to final rinse as directed; do not pour directly on clothing.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(6, 'COLGATE-SUPER-FLEXI-2IN1', 'Colgate Super Flexi Toothbrush (2+1)', 'colgate-super-flexi-toothbrush-2-1', 5, 0, 'colgate-super-flexi-toothbrush-2-1.jpg', 40.00, 30.00, 'pc', 27.00, 'Flexible toothbrush with dual cleaning action', '&lt;section&gt; &lt;h3&gt;Colgate Super Flexi Toothbrush 2‑in‑1&lt;/h3&gt; &lt;p&gt;The Colgate Super Flexi 2‑in‑1 toothbrush features flexible bristles and a comfortable grip to help reach and clean difficult areas. Its dual-action design supports effective plaque removal while maintaining gentle contact with gums.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Design:&lt;/strong&gt; Flexible head and ergonomic handle.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Targeted cleaning, everyday comfort.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Care:&lt;/strong&gt; Replace every 3 months or after bristle wear.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Brush with gentle circular motions; pair with fluoride toothpaste for best results.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(7, 'COLGATE-SUPER-FLEXI-100', 'Colgate Super Flexi Toothbrush', 'colgate-super-flexi-toothbrush', 5, 0, 'colgate-super-flexi-toothbrush.jpg', 20.00, 15.00, 'Pc', 12.00, 'Toothbrush with flexible bristles for deep cleaning', '&lt;section&gt; &lt;h3&gt;Colgate Super Flexi Toothbrush&lt;/h3&gt; &lt;p&gt;Colgate Super Flexi offers flexible bristles for deep cleaning along the gumline and between teeth. The lightweight handle improves control, making daily brushing comfortable and consistent.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Gumline reach, plaque removal, comfortable grip.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Bristles:&lt;/strong&gt; Flexible tips designed for everyday use.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Usage:&lt;/strong&gt; Suitable for routine oral care.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Brush for 2&ndash;3 minutes, focusing on all quadrants; rinse well.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(8, 'VIM-DISH-LIQ-GEL-100', 'Vim Dishwash Liquid Gel', 'vim-dishwash-liquid-gel', 4, 0, 'vim-dishwash-liquid-gel.jpg', 58.00, 55.00, '225 ml', 52.00, 'Liquid gel for powerful grease removal', '&lt;section&gt; &lt;h3&gt;Vim Dishwash Liquid Gel&lt;/h3&gt; &lt;p&gt;Vim Dishwash Liquid Gel provides concentrated grease-cutting action for fast, effective sink-side cleaning. A small amount creates rich suds that lift food residues and help dishes rinse clean.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Concentrated formula, quick degreasing.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Fragrance:&lt;/strong&gt; Fresh, kitchen-friendly scent.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Economy:&lt;/strong&gt; Effective in small doses.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Dilute a few drops in water or apply directly to scrubber; rinse thoroughly after washing.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(9, 'LIFEBUOY-TOTAL10-HW-100', 'Lifebuoy Total 10 Handwash', 'lifebuoy-total-10-handwash', 5, 0, 'lifebuoy-total-10-handwash.jpg', 25.00, 0.00, '80ml', 23.00, 'Handwash offering 99.9% germ protection', '&lt;section&gt; &lt;h3&gt;Lifebuoy Total 10 Handwash&lt;/h3&gt; &lt;p&gt;Lifebuoy Total 10 Handwash is designed for everyday hygiene, leaving hands clean and lightly fragranced. Its lather spreads easily and rinses off without residue, supporting frequent handwashing routines.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Daily cleanliness, fresh scent.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Texture:&lt;/strong&gt; Smooth liquid that lathers quickly.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Suitable for:&lt;/strong&gt; Family use and high-frequency washing.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Apply, lather for 20 seconds, scrub all surfaces, and rinse with clean water.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(10, 'LIFEBUOY-PWDR-HW-100', 'Lifebuoy Powder Handwash', 'lifebuoy-powder-handwash', 5, 0, 'lifebuoy-powder-handwash.jpg', 10.00, 9.00, '9g', 9.00, 'Powder handwash for effective hygiene', '&lt;section&gt; &lt;h3&gt;Lifebuoy Powder Handwash&lt;/h3&gt; &lt;p&gt;This powder handwash provides convenient hygiene where liquid dispensers are not preferred. It creates a cleansing lather that helps remove everyday dirt while leaving a fresh scent.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;&lt;strong&gt;Benefits:&lt;/strong&gt; Easy storage, effective cleaning, fresh fragrance.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Use case:&lt;/strong&gt; Homes, small kitchens, and utility areas.&lt;/li&gt; &lt;li&gt;&lt;strong&gt;Care:&lt;/strong&gt; Keep container dry and sealed between uses.&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Mix a small amount with water, lather thoroughly, and rinse well.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(11, 'SURF-EXCEL-EASYWASH-100', 'Surf Excel Easy Wash', 'surf-excel-easy-wash', 4, 0, 'surf-excel-easy-wash.jpg', 10.00, 9.00, '100gm', 9.00, 'Detergent for tough stain removal', '&lt;section&gt; &lt;h3&gt;Surf Excel Easy Wash&lt;/h3&gt; &lt;p&gt;Surf Excel Easy Wash Powder is designed to remove tough stains effortlessly while keeping clothes soft and fresh. Its superfine detergent particles dissolve quickly, allowing deep cleaning without hard scrubbing. Perfect for both machine and hand wash.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Superfine powder formula &ndash; dissolves easily, no residue left behind&lt;/li&gt; &lt;li&gt;Powerful stain removal &ndash; mud, ink, oil, and food stains&lt;/li&gt; &lt;li&gt;No hard scrubbing required &ndash; penetrates fabric fibers&lt;/li&gt; &lt;li&gt;Long-lasting fresh fragrance &ndash; keeps clothes smelling great&lt;/li&gt; &lt;li&gt;Safe for all fabrics &ndash; everyday wear, bedsheets, curtains&lt;/li&gt; &lt;/ul&gt; &lt;p&gt;&lt;strong&gt;How to use:&lt;/strong&gt; Add recommended quantity to wash cycle or dissolve in water for hand wash.&lt;/p&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(12, 'SUNLIGHT-DET-PWDR-100', 'Sunlight Detergent Powder', 'sunlight-detergent-powder', 4, 0, 'sunlight-detergent-powder.jpg', 10.00, 9.00, '90gm', 9.00, 'Gentle detergent for bright clothes', '&lt;section&gt; &lt;h3&gt;Sunlight Detergent Powder&lt;/h3&gt; &lt;p&gt;Sunlight Detergent Powder keeps clothes fresh, bright, and stain-free. With color-care technology, it protects fabric from fading while removing dirt, oil, and sweat. Its quick-dissolve formula ensures no residue.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Color-care technology &ndash; maintains vibrancy&lt;/li&gt; &lt;li&gt;Powerful stain removal &ndash; dirt, sweat, oil&lt;/li&gt; &lt;li&gt;Quick dissolve &ndash; works in cold and warm water&lt;/li&gt; &lt;li&gt;Long-lasting fragrance &ndash; fresh all day&lt;/li&gt; &lt;li&gt;Gentle on fabrics &ndash; cotton, synthetics, delicates&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(13, 'GODREJ-EZEE-LIQ-100', 'Godrej Ezee Liquid Detergent', 'godrej-ezee-liquid-detergent', 4, 0, 'godrej-ezee-liquid-detergent.jpg', 120.00, 108.00, 'Pc', 102.00, 'Liquid detergent for woolens and delicate fabrics', '&lt;section&gt; &lt;h3&gt;Godrej Ezee Liquid Detergent&lt;/h3&gt; &lt;p&gt;Godrej Ezee is specially designed for woolens and delicate fabrics. Its pH-neutral, no-soda formula prevents damage and keeps clothes soft and fresh.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;pH neutral &ndash; prevents shrinkage&lt;/li&gt; &lt;li&gt;No soda formula &ndash; safe for woolens and silks&lt;/li&gt; &lt;li&gt;Micro conditioner &ndash; keeps clothes soft&lt;/li&gt; &lt;li&gt;Mild fragrance &ndash; long-lasting freshness&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(14, 'GOTA-JEERA-100', 'Gota Jeera (Whole Cumin Seeds)', 'gota-jeera-whole-cumin-seeds', 1, 0, 'gota-jeera-whole-cumin-seeds.jpg', 45.00, 35.00, '100gm', 25.00, 'Whole cumin seeds for authentic flavor', '&lt;section&gt; &lt;h3&gt;Gota Jeera Whole Cumin Seeds&lt;/h3&gt; &lt;p&gt;Whole cumin seeds add authentic flavor and aroma to curries, dals, and rice. Rich in essential oils, they enhance taste and digestion.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;100% natural cumin seeds&lt;/li&gt; &lt;li&gt;Rich earthy flavor&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Versatile use &ndash; Indian and global cuisines&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(15, 'RED-CHILLY-WHOLE-100', 'Red Chilly Whole (Gota Sukno Lonka)', 'red-chilly-whole-gota-sukno-lonka', 1, 0, 'red-chilly-whole-gota-sukno-lonka.jpg', 20.00, 14.00, '50gm', 12.00, 'Whole red chilies for traditional spice heat', '&lt;section&gt; &lt;h3&gt;Red Chilly Whole (Gota Sukno Lonka)&lt;/h3&gt; &lt;p&gt;Sun-dried whole red chilies deliver fiery heat and rich aroma. Perfect for tempering curries, dals, pickles, and chutneys.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural dried red chilies&lt;/li&gt; &lt;li&gt;Rich flavor and aroma&lt;/li&gt; &lt;li&gt;High in antioxidants&lt;/li&gt; &lt;li&gt;Long shelf life&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(16, 'PANCHFORON-100', 'Panchforon', 'panchforon', 1, 0, 'panchforon.jpg', 15.00, 12.00, '50gm', 11.00, 'Traditional Bengali five-spice blend', '&lt;section&gt; &lt;h3&gt;Panchforon&lt;/h3&gt; &lt;p&gt;Panchforon is a traditional Bengali five-spice blend made of fennel, cumin, nigella, fenugreek, and mustard seeds. Adds depth and balance to curries and stir-fries.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic five-spice blend&lt;/li&gt; &lt;li&gt;Rich aroma and flavor&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Versatile use &ndash; tempering, pickling&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(17, 'CLOVE-25', 'Clove (Lobongo)', 'clove-lobongo', 1, 0, 'clove-lobongo.jpg', 35.00, 0.00, '25gm', 30.00, 'Aromatic spice for flavor and health', '&lt;section&gt; &lt;h3&gt;Clove (Lobongo)&lt;/h3&gt; &lt;p&gt;Clove is a highly aromatic spice used in curries, biryanis, teas, and desserts. Known for medicinal properties like aiding digestion and soothing toothaches.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;100% natural whole cloves&lt;/li&gt; &lt;li&gt;Warm pungent flavor&lt;/li&gt; &lt;li&gt;Supports immunity&lt;/li&gt; &lt;li&gt;Essential for garam masala and chai&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(18, 'POSTO-25', 'Posto (poppy Seeds)', 'posto-poppy-seeds', 1, 0, 'posto-poppy-seeds.jpg', 49.00, 0.00, '25gm', 45.00, 'Premium poppy seeds for cooking', '&lt;section&gt; &lt;h3&gt;Posto (Poppy Seeds)&lt;/h3&gt; &lt;p&gt;Posto is a staple in Bengali cooking, prized for its nutty flavor and creamy texture. Used in dishes like Aloo Posto and Posto Bora.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural white poppy seeds&lt;/li&gt; &lt;li&gt;Nutty flavor&lt;/li&gt; &lt;li&gt;Rich in calcium and iron&lt;/li&gt; &lt;li&gt;Supports digestion and relaxation&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(19, 'ELICHI-25', 'Elichi (Green Cardamom)', 'elichi-green-cardamom', 1, 0, 'elichi-green-cardamom.jpg', 99.00, 0.00, '25gm', 95.00, 'Aromatic green cardamom pods', '&lt;section&gt; &lt;h3&gt;Elichi (Green Cardamom)&lt;/h3&gt; &lt;p&gt;Green cardamom is celebrated for its sweet aroma and flavor. Used in curries, biryanis, desserts, and teas.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural green cardamom pods&lt;/li&gt; &lt;li&gt;Sweet floral notes&lt;/li&gt; &lt;li&gt;Supports digestion and freshens breath&lt;/li&gt; &lt;li&gt;Essential for masala chai and sweets&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(20, 'SAHI-JEERA-25', 'Sahi Jeera', 'sahi-jeera', 1, 0, 'sahi-jeera.jpg', 28.00, 0.00, '25gm', 26.00, 'Premium cumin seeds for authentic dishes', '&lt;section&gt; &lt;h3&gt;Sahi Jeera&lt;/h3&gt; &lt;p&gt;Sahi Jeera is a premium cumin variety with a delicate flavor, perfect for rich curries and biryanis.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium cumin seeds&lt;/li&gt; &lt;li&gt;Delicate aroma&lt;/li&gt; &lt;li&gt;Enhances authentic dishes&lt;/li&gt; &lt;li&gt;Long shelf life&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(21, 'BIG-CARDAMOM-25', 'Big Elichi (Big Cardamon)', 'big-elichi', 1, 0, 'big-elichi.jpg', 59.00, 0.00, '25gm', 52.00, 'Smoky black cardamom pods', '&lt;section&gt; &lt;h3&gt;Big Elichi (Black Cardamom)&lt;/h3&gt; &lt;p&gt;Big Elichi, also known as black cardamom, is valued for its smoky aroma and bold flavor. Commonly used in biryanis, curries, and spice blends, it adds depth and warmth to savory dishes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Smoky flavor pods &ndash; enhance curries and rice dishes&lt;/li&gt; &lt;li&gt;Rich aroma &ndash; adds depth to spice blends&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for garam masala and festive cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(22, 'STAR-ANISE-10', 'Star Anise', 'star-anise', 1, 0, 'star-anise.jpg', 14.00, 0.00, '10gm', 0.00, 'Exotic spice with licorice flavor', '&lt;section&gt; &lt;h3&gt;Star Anise&lt;/h3&gt; &lt;p&gt;Star Anise is an exotic spice with a distinct licorice flavor. Widely used in Asian cuisine, it enhances soups, stews, and spice blends with its aromatic notes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Exotic spice &ndash; licorice flavor&lt;/li&gt; &lt;li&gt;Rich aroma &ndash; perfect for curries and broths&lt;/li&gt; &lt;li&gt;Supports digestion and metabolism&lt;/li&gt; &lt;li&gt;Versatile use &ndash; Indian, Chinese, and global cuisines&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(23, 'ROSE-PETAL-DRY-10', 'Golap papri (Rose Petal Dry)', 'rose-petal-dry', 1, 0, 'rose-petal-dry.jpg', 9.00, 0.00, '10gm', 0.00, 'Natural dried rose petals for garnish', '&lt;section&gt; &lt;h3&gt;Rose Petal Dry&lt;/h3&gt; &lt;p&gt;Dried rose petals are used as a natural flavoring and garnish in desserts, teas, and festive recipes. They add a subtle floral aroma and enhance presentation.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural dried rose petals&lt;/li&gt; &lt;li&gt;Delicate floral aroma&lt;/li&gt; &lt;li&gt;Perfect for sweets, teas, and garnishes&lt;/li&gt; &lt;li&gt;Long shelf life when stored properly&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(24, 'SESAME-50', 'Sada Til (white sesame seeds)', 'white-sesame-seeds', 1, 0, 'white-sesame-seeds.jpg', 16.00, 0.00, '50gm', 0.00, 'Nutty white sesame seeds for cooking', '&lt;section&gt; &lt;h3&gt;White Sesame Seeds&lt;/h3&gt; &lt;p&gt;White sesame seeds are prized for their nutty flavor and crunchy texture. Used in breads, sweets, and curries, they are also rich in calcium and healthy oils.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Nutty flavor &ndash; enhances cooking&lt;/li&gt; &lt;li&gt;Rich in calcium and minerals&lt;/li&gt; &lt;li&gt;Versatile use &ndash; breads, sweets, curries&lt;/li&gt; &lt;li&gt;Supports bone health and digestion&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(25, 'BLACK-PEPPER-25', 'Gol Morich (Black Pepper)', 'black-pepper', 1, 0, 'black-pepper.jpg', 32.00, 0.00, '25gm', 0.00, 'Premium whole black pepper spice', '&lt;section&gt; &lt;h3&gt;Black Pepper&lt;/h3&gt; &lt;p&gt;Black pepper is a staple spice known for its pungent flavor and aroma. It enhances taste in curries, soups, and marinades while offering health benefits.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium whole black pepper&lt;/li&gt; &lt;li&gt;Pungent flavor &ndash; versatile seasoning&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for spice blends and everyday cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(26, 'HING-25', 'Sunrise Hing', 'sunrise-hing', 1, 0, 'sunrise-hing.jpg', 50.00, 45.00, '25gm', 40.00, 'Authentic hing for cooking', '&lt;section&gt; &lt;h3&gt;Sunrise Hing&lt;/h3&gt; &lt;p&gt;Sunrise Hing is an authentic Indian spice used to add a strong aroma and flavor to dals, curries, and pickles. Known for its digestive properties.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic hing &ndash; strong aroma&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Enhances flavor in dals and curries&lt;/li&gt; &lt;li&gt;Traditional Indian spice&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(27, 'KASURI-METHI-25', 'Sunrise Kasuri Methi', 'sunrise-kasuri-methi', 1, 0, 'sunrise-kasuri-methi.jpg', 27.00, 25.00, '25gm', 22.00, 'Dried fenugreek leaves for flavor', '&lt;section&gt; &lt;h3&gt;Sunrise Kasuri Methi&lt;/h3&gt; &lt;p&gt;Dried fenugreek leaves add a unique aroma and flavor to curries, parathas, and gravies. Sunrise Kasuri Methi is a staple for authentic Indian cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Dried fenugreek leaves &ndash; aromatic flavor&lt;/li&gt; &lt;li&gt;Enhances curries and breads&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Essential for Indian cuisine&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(28, 'MAGAJ-100', 'Magaj (Melon Seeds)', 'magaj', 1, 0, 'magaj.jpg', 72.00, 0.00, '100gm', 0.00, 'Nutty seeds used in sweets', '&lt;section&gt; &lt;h3&gt;Magaj&lt;/h3&gt; &lt;p&gt;Magaj seeds are used in Indian sweets and snacks for their nutty flavor and texture. They are rich in nutrients and add crunch to recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Nutty seeds &ndash; perfect for sweets&lt;/li&gt; &lt;li&gt;Rich in protein and minerals&lt;/li&gt; &lt;li&gt;Enhances laddoos and festive dishes&lt;/li&gt; &lt;li&gt;Long shelf life when stored properly&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(29, 'MOURI-50', 'Mouri (Fennel Seeds)', 'mouri', 1, 0, 'mouri.jpg', 20.00, 0.00, '50gm', 0.00, 'Aromatic fennel seeds for digestion', '&lt;section&gt; &lt;h3&gt;Mouri (Fennel Seeds)&lt;/h3&gt; &lt;p&gt;Mouri, or fennel seeds, are aromatic and slightly sweet. Used in curries, teas, and as a mouth freshener, they aid digestion and add flavor.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Aromatic fennel seeds&lt;/li&gt; &lt;li&gt;Slightly sweet flavor&lt;/li&gt; &lt;li&gt;Supports digestion and freshens breath&lt;/li&gt; &lt;li&gt;Versatile use &ndash; curries, teas, snacks&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(30, 'METHI-50', 'Methi (Fenugreek seeds)', 'methi', 1, 0, 'methi.jpg', 7.00, 0.00, '50gm', 0.00, 'Healthy fenugreek seeds for cooking', '&lt;section&gt; &lt;h3&gt;Methi (Fenugreek Seeds)&lt;/h3&gt; &lt;p&gt;Methi seeds are a staple spice in Indian cooking, known for their bitter flavor and health benefits. Used in curries, pickles, and spice blends.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural fenugreek seeds&lt;/li&gt; &lt;li&gt;Bitter flavor &ndash; enhances curries&lt;/li&gt; &lt;li&gt;Supports blood sugar control and digestion&lt;/li&gt; &lt;li&gt;Essential for spice mixes and pickles&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(31, 'CINNAMON-25', 'Dalchini (Cinnamon)', 'dalchini', 1, 0, 'dalchini.jpg', 10.00, 0.00, '25gm', 0.00, 'Aromatic cinnamon bark spice', '&lt;section&gt; &lt;h3&gt;Dalchini (Cinnamon)&lt;/h3&gt; &lt;p&gt;Dalchini, or cinnamon, is a fragrant bark spice used in curries, desserts, teas, and festive recipes. Its warm aroma and sweet flavor make it a versatile ingredient in Indian and global cuisines.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural cinnamon bark &ndash; aromatic and flavorful&lt;/li&gt; &lt;li&gt;Enhances curries, biryanis, and sweets&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Essential for masala chai and festive cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(32, 'DHANIA-50', 'Dhania (Coriander seeds)', 'dhania', 1, 0, 'dhania.jpg', 12.00, 0.00, '50gm', 0.00, 'Fresh coriander seeds for cooking', '&lt;section&gt; &lt;h3&gt;Dhania (Coriander Seeds)&lt;/h3&gt; &lt;p&gt;Dhania seeds add a fresh, citrusy flavor to curries, dals, and spice blends. They are widely used in Indian cooking and valued for their digestive benefits.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural coriander seeds &ndash; fresh and aromatic&lt;/li&gt; &lt;li&gt;Citrusy flavor &ndash; enhances curries and chutneys&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for spice blends and pickles&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(33, 'RADHUNI-100', 'Radhuni', 'radhuni', 1, 0, 'radhuni.jpg', 18.00, 0.00, '50gm', 0.00, 'Traditional Bengali spice', '&lt;section&gt; &lt;h3&gt;Radhuni&lt;/h3&gt; &lt;p&gt;Radhuni is a traditional Bengali spice with a strong aroma, often used in dals, curries, and pickles. It adds depth and authenticity to regional recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic Bengali spice&lt;/li&gt; &lt;li&gt;Strong aroma &ndash; enhances dals and curries&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for traditional Bengali cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(34, 'BAY-LEAF-100', 'Tejpata (Bay Leaf)', 'tejpata', 1, 0, 'tejpata.jpg', 6.00, 0.00, '50gm', 0.00, 'Aromatic bay leaves for cooking', '&lt;section&gt; &lt;h3&gt;Tejpata (Bay Leaf)&lt;/h3&gt; &lt;p&gt;Tejpata, or bay leaf, is used to add a subtle aroma and flavor to curries, rice, and soups. It is a staple in Indian kitchens for tempering and slow cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural bay leaves &ndash; aromatic and fresh&lt;/li&gt; &lt;li&gt;Enhances curries, rice, and soups&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Essential for everyday cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(35, 'NUTMEG-100', 'Jaifal (Nutmeg)', 'jaifal', 1, 0, 'jaifal.jpg', 32.00, 0.00, '25gm', 0.00, 'Warm aromatic nutmeg spice', '&lt;section&gt; &lt;h3&gt;Jaifal (Nutmeg)&lt;/h3&gt; &lt;p&gt;Jaifal, or nutmeg, is a warm aromatic spice used in curries, desserts, and drinks. It adds depth and richness to both sweet and savory dishes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural nutmeg &ndash; aromatic and flavorful&lt;/li&gt; &lt;li&gt;Enhances curries, sweets, and festive recipes&lt;/li&gt; &lt;li&gt;Supports digestion and relaxation&lt;/li&gt; &lt;li&gt;Essential for spice blends and baking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(36, 'KALONJI-100', 'Kalojeera', 'kalojeera', 1, 0, 'kalojeera.jpg', 17.00, 0.00, '50gm', 0.00, 'Flavorful nigella seeds for cooking', '&lt;section&gt; &lt;h3&gt;Kalojeera (Nigella Seeds)&lt;/h3&gt; &lt;p&gt;Kalojeera, or nigella seeds, are small black seeds with a pungent flavor. Used in curries, breads, and pickles, they add a distinctive taste and aroma.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural nigella seeds &ndash; pungent flavor&lt;/li&gt; &lt;li&gt;Enhances curries, breads, and pickles&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for Bengali and Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(37, 'MACE-100', 'Jayatri (Mace)', 'jayatri', 1, 0, 'jayatri.jpg', 88.00, 0.00, '25gm', 0.00, 'Aromatic mace spice for curries', '&lt;section&gt; &lt;h3&gt;Jayatri (Mace)&lt;/h3&gt; &lt;p&gt;Jayatri, or mace, is the dried outer covering of nutmeg. It has a warm, aromatic flavor and is used in curries, biryanis, and spice blends.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural mace &ndash; aromatic and flavorful&lt;/li&gt; &lt;li&gt;Enhances curries and biryanis&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Essential for garam masala and festive cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:40', '2026-01-11 12:18:40'),
(38, 'SHAHI-MORICH-100', 'Shahi Morich', 'shahi-morich', 1, 0, 'shahi-morich.jpg', 37.00, 0.00, '25gm', 0.00, 'Premium black peppercorns', '&lt;section&gt; &lt;h3&gt;Shahi Morich&lt;/h3&gt; &lt;p&gt;Shahi Morich is a premium variety of black peppercorns, prized for their strong aroma and pungent flavor. Used in spice blends and everyday cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium black peppercorns&lt;/li&gt; &lt;li&gt;Pungent flavor &ndash; versatile seasoning&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for spice blends and curries&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(39, 'MUSTARD-SEED-100', 'Sada Sorisha (white mustard seeds)', 'sada-sorisha', 1, 0, 'sada-sorisha.jpg', 10.00, 0.00, '100gm', 0.00, 'Authentic mustard seeds for Indian dishes', '&lt;section&gt; &lt;h3&gt;Sada Sorisha (Mustard Seeds)&lt;/h3&gt; &lt;p&gt;Sada Sorisha, or white mustard seeds, are used in pickles, curries, and spice blends. They add a sharp, tangy flavor and are essential in Indian cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural mustard seeds &ndash; sharp flavor&lt;/li&gt; &lt;li&gt;Enhances pickles and curries&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for spice blends&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(40, 'TURMERIC-POWDER-100', 'Sunrise Haldi Powder', 'sunrise-haldi-powder', 1, 0, 'sunrise-haldi-powder.jpg', 14.00, 0.00, '50gm', 0.00, 'Pure turmeric powder for cooking', '&lt;section&gt; &lt;h3&gt;Sunrise Haldi Powder&lt;/h3&gt; &lt;p&gt;Sunrise Haldi Powder is pure turmeric, known for its vibrant color and earthy flavor. It is a staple in Indian cooking and valued for its health benefits.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Pure turmeric powder &ndash; bright yellow color&lt;/li&gt; &lt;li&gt;Enhances curries, dals, and vegetables&lt;/li&gt; &lt;li&gt;Supports immunity and wellness&lt;/li&gt; &lt;li&gt;Essential for everyday Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(41, 'SUNRISE-FISH-MASALA-100', 'Sunrise Fish Masala', 'sunrise-fish-masala', 1, 0, 'sunrise-fish-masala.jpg', 51.00, 45.00, '50gm', 0.00, 'Authentic Bengali fish masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Fish Masala&lt;/h3&gt; &lt;p&gt;Sunrise Fish Masala is a traditional Bengali spice blend crafted to enhance fish curries with authentic flavor and aroma.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic Bengali fish masala blend&lt;/li&gt; &lt;li&gt;Rich flavor &ndash; perfect for fish curries&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Essential for Bengali cuisine&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(42, 'SUNRISE-MUSTARD-PWDR-100', 'Sunrise Mustard Powder', 'sunrise-mustard-powder', 1, 0, 'sunrise-mustard-powder.jpg', 14.00, 0.00, '35gm', 0.00, 'Traditional mustard powder', '&lt;section&gt; &lt;h3&gt;Sunrise Mustard Powder&lt;/h3&gt; &lt;p&gt;Sunrise Mustard Powder adds sharp, tangy flavor to curries, pickles, and marinades. A must-have for authentic Indian cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural mustard powder &ndash; sharp flavor&lt;/li&gt; &lt;li&gt;Enhances pickles and curries&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for spice blends&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(43, 'SUNRISE-MEAT-MASALA-7G', 'Sunrise Meat Masala Powder', 'sunrise-meat-masala-powder-7g', 1, 0, 'sunrise-meat-masala-powder-7g.jpg', 5.00, 0.00, '7gm', 0.00, 'Rich meat masala spice', '&lt;section&gt; &lt;h3&gt;Sunrise Meat Masala Powder 7g&lt;/h3&gt; &lt;p&gt;Sunrise Meat Masala Powder is a rich spice blend that enhances the flavor of meat curries. The 7g pack is convenient for single-use cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Rich spice blend &ndash; perfect for meat curries&lt;/li&gt; &lt;li&gt;Convenient 7g pack&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Essential for authentic Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(44, 'SUNRISE-GARAM-MASALA-100', 'Sunrise Garam Masala Powder', 'sunrise-garam-masala-powder', 1, 0, 'sunrise-garam-masala-powder.jpg', 49.00, 45.00, '50gm', 0.00, 'Classic garam masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Garam Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Garam Masala Powder is a classic Indian spice blend used to add warmth and depth to curries, dals, and gravies.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Classic garam masala blend&lt;/li&gt; &lt;li&gt;Enhances curries and dals&lt;/li&gt; &lt;li&gt;Rich aroma and flavor&lt;/li&gt; &lt;li&gt;Essential for Indian cuisine&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(45, 'SUNRISE-SAHI-GARAM-3G', 'Sunrise Shahi Garam Masala Powder', 'sunrise-sahi-garam-masala-powder-3g', 1, 0, 'sunrise-sahi-garam-masala-powder-3g.jpg', 8.00, 0.00, '3gm', 0.00, 'Premium sahi garam masala mix', '&lt;section&gt; &lt;h3&gt;Sunrise Sahi Garam Masala Powder 3g&lt;/h3&gt; &lt;p&gt;Sunrise Sahi Garam Masala Powder is a premium spice blend crafted for rich curries and festive dishes. The 3g pack is ideal for single-use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium garam masala blend&lt;/li&gt; &lt;li&gt;Convenient 3g pack&lt;/li&gt; &lt;li&gt;Enhances festive curries&lt;/li&gt; &lt;li&gt;Rich aroma and flavor&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(46, 'SUNRISE-CHANA-MASALA-100', 'Sunrise Chana Masala Powder', 'sunrise-chana-masala-powder', 1, 0, 'sunrise-chana-masala-powder.jpg', 39.00, 35.00, '50gm', 0.00, 'Flavorful chana masala spice', '&lt;section&gt; &lt;h3&gt;Sunrise Chana Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Chana Masala Powder is a flavorful spice mix designed to enhance chickpea curries with authentic taste and aroma.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Flavorful spice blend &ndash; perfect for chickpeas&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(47, 'SUNRISE-KASHMIRI-MIRCH-1', 'Sunrise Kashmiri Mirch Powder', 'sunrise-kashmiri-mirch-powder-10', 1, 0, 'sunrise-kashmiri-mirch-powder-10.jpg', 10.00, 0.00, '5gm', 0.00, 'Mild Kashmiri red chili powder', '&lt;section&gt; &lt;h3&gt;Sunrise Kashmiri Mirch Powder 10g&lt;/h3&gt; &lt;p&gt;Sunrise Kashmiri Mirch Powder adds mild heat and vibrant red color to curries and gravies. The 10g pack is convenient for single-use cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Mild red chili powder &ndash; vibrant color&lt;/li&gt; &lt;li&gt;Enhances curries and gravies&lt;/li&gt; &lt;li&gt;Convenient 10g pack&lt;/li&gt; &lt;li&gt;Essential for Indian cuisine&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(48, 'SUNRISE-BLACK-PEPPER-100', 'Sunrise Black Pepper Powder', 'sunrise-black-pepper-powder', 1, 0, 'sunrise-black-pepper-powder.jpg', 77.00, 70.00, '50gm', 0.00, 'Fresh ground black pepper powder', '&lt;section&gt; &lt;h3&gt;Sunrise Black Pepper Powder&lt;/h3&gt; &lt;p&gt;Sunrise Black Pepper Powder is freshly ground to deliver pungent flavor and aroma. Perfect for seasoning curries, soups, and marinades.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Fresh ground black pepper&lt;/li&gt; &lt;li&gt;Pungent flavor &ndash; versatile seasoning&lt;/li&gt; &lt;li&gt;Supports digestion and immunity&lt;/li&gt; &lt;li&gt;Essential for everyday cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(49, 'SUNRISE-CHICKEN-MASALA-1', 'Sunrise Chicken Masala Powder', 'sunrise-chicken-masala-powder', 1, 0, 'sunrise-chicken-masala-powder.jpg', 49.00, 45.00, '50gm', 0.00, 'Flavorful chicken masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Chicken Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Chicken Masala Powder is a flavorful spice blend crafted to enhance chicken curries with authentic taste and aroma.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Flavorful spice blend &ndash; perfect for chicken curries&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(50, 'SUNRISE-RED-CHILLY-100', 'Sunrise Red Chilly Powder', 'sunrise-red-chilly-powder', 1, 0, 'sunrise-red-chilly-powder.jpg', 21.00, 0.00, '50gm', 0.00, 'Authentic red chili powder', '&lt;section&gt; &lt;h3&gt;Sunrise Red Chilly Powder&lt;/h3&gt; &lt;p&gt;Sunrise Red Chilly Powder delivers authentic spice heat and vibrant color to curries, gravies, and marinades. Made from carefully selected chilies, it ensures consistent flavor and quality.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic red chili powder &ndash; bold heat&lt;/li&gt; &lt;li&gt;Enhances curries, dals, and gravies&lt;/li&gt; &lt;li&gt;Rich color &ndash; adds vibrancy to dishes&lt;/li&gt; &lt;li&gt;Essential for Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(51, 'SUNRISE-SABJI-MASALA-100', 'Sunrise Sabji Masala Powder', 'sunrise-sabji-masala-powder', 1, 0, 'sunrise-sabji-masala-powder.jpg', 39.00, 35.00, '50gm', 0.00, 'Everyday vegetable masala mix', '&lt;section&gt; &lt;h3&gt;Sunrise Sabji Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Sabji Masala Powder is a versatile spice blend crafted for everyday vegetable dishes. It adds balanced flavor and aroma to simple home-cooked meals.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Balanced spice blend &ndash; perfect for vegetables&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Convenient for daily cooking&lt;/li&gt; &lt;li&gt;Essential for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(52, 'SUNRISE-JEERA-100', 'Sunrise Jeera Powder', 'sunrise-jeera-powder', 1, 0, 'sunrise-jeera-powder.jpg', 28.00, 0.00, '50gm', 0.00, 'Ground cumin powder', '&lt;section&gt; &lt;h3&gt;Sunrise Jeera Powder&lt;/h3&gt; &lt;p&gt;Sunrise Jeera Powder is ground cumin, known for its earthy flavor and aroma. It is widely used in curries, dals, and spice blends.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Ground cumin powder &ndash; earthy flavor&lt;/li&gt; &lt;li&gt;Enhances curries and dals&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for spice blends&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(53, 'SUNRISE-GARAM-MASALA-7G', 'Sunrise Garam Masala Powder', 'sunrise-garam-masala-powder-7g', 1, 0, 'sunrise-garam-masala-powder-7g.jpg', 5.00, 0.00, '7gm', 0.00, 'Classic garam masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Garam Masala Powder 7g&lt;/h3&gt; &lt;p&gt;Sunrise Garam Masala Powder is a classic Indian spice blend in a convenient 7g pack. Perfect for adding warmth and depth to curries and gravies.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Classic garam masala blend&lt;/li&gt; &lt;li&gt;Convenient 7g pack&lt;/li&gt; &lt;li&gt;Enhances curries and dals&lt;/li&gt; &lt;li&gt;Rich aroma and flavor&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(54, 'SUNRISE-DHANIA-100', 'Sunrise Dhania Powder', 'sunrise-dhania-powder', 1, 0, 'sunrise-dhania-powder.jpg', 15.00, 0.00, '50gm', 0.00, 'Ground coriander powder', '&lt;section&gt; &lt;h3&gt;Sunrise Dhania Powder&lt;/h3&gt; &lt;p&gt;Sunrise Dhania Powder is ground coriander, offering a fresh citrusy flavor. It is a staple in Indian cooking for curries, chutneys, and spice blends.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Ground coriander powder &ndash; citrusy flavor&lt;/li&gt; &lt;li&gt;Enhances curries and chutneys&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for everyday cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(55, 'SUNRISE-SHAHI-GARAM-100', 'Sunrise Shahi Garam Masala Powder', 'sunrise-shahi-garam-masala-powder', 1, 0, 'sunrise-shahi-garam-masala-powder.jpg', 130.00, 120.00, '50gm', 0.00, 'Premium shahi garam masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Shahi Garam Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Shahi Garam Masala Powder is a premium spice blend crafted for rich curries and festive dishes. It adds depth and aroma to traditional recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium garam masala blend&lt;/li&gt; &lt;li&gt;Enhances festive curries&lt;/li&gt; &lt;li&gt;Rich aroma and flavor&lt;/li&gt; &lt;li&gt;Essential for Indian cuisine&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(56, 'SUNRISE-CHAT-MASALA-100', 'Sunrise Chat Masala', 'sunrise-chat-masala', 1, 0, 'sunrise-chat-masala.jpg', 36.00, 0.00, '50gm', 0.00, 'Tangy chat masala mix', '&lt;section&gt; &lt;h3&gt;Sunrise Chat Masala&lt;/h3&gt; &lt;p&gt;Sunrise Chat Masala is a tangy spice mix used to season snacks, salads, and fruits. It adds a zesty flavor to everyday dishes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Tangy spice mix &ndash; perfect for snacks&lt;/li&gt; &lt;li&gt;Enhances taste of salads and fruits&lt;/li&gt; &lt;li&gt;Convenient seasoning for daily use&lt;/li&gt; &lt;li&gt;Essential for Indian street food flavor&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(57, 'SUNRISE-MEAT-MASALA-100', 'Sunrise Meat Masala', 'sunrise-meat-masala-powder', 1, 0, 'sunrise-meat-masala-powder.jpg', 51.00, 45.00, '50gm', 0.00, 'Rich meat masala blend', '&lt;section&gt; &lt;h3&gt;Sunrise Meat Masala Powder&lt;/h3&gt; &lt;p&gt;Sunrise Meat Masala Powder is a rich spice blend designed to enhance the flavor of meat curries. It adds depth and aroma to traditional recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Rich spice blend &ndash; perfect for meat curries&lt;/li&gt; &lt;li&gt;Enhances taste and aroma&lt;/li&gt; &lt;li&gt;Supports digestion&lt;/li&gt; &lt;li&gt;Essential for Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(58, 'MAGGI-MASALA-100', 'Maggi Masala', 'maggi-masala', 1, 0, 'maggi-masala.jpg', 5.00, 0.00, 'Pc', 0.00, 'Instant noodles masala mix', '&lt;section&gt; &lt;h3&gt;Maggi Masala&lt;/h3&gt; &lt;p&gt;Maggi Masala is the signature spice mix used in instant noodles. It delivers a unique flavor loved by families across generations.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Signature spice blend &ndash; unique taste&lt;/li&gt; &lt;li&gt;Enhances instant noodles&lt;/li&gt; &lt;li&gt;Convenient and easy to use&lt;/li&gt; &lt;li&gt;Essential for Maggi lovers&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(59, 'GANESH-ATTA-100', 'Ganesh Atta', 'ganesh-atta', 1, 0, 'ganesh-atta.jpg', 48.00, 0.00, '1kg', 0.00, 'Premium wheat flour', '&lt;section&gt; &lt;h3&gt;Ganesh Atta&lt;/h3&gt; &lt;p&gt;Ganesh Atta is premium wheat flour, milled to perfection for soft chapatis and rotis. It ensures authentic taste and nutrition in every meal.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium wheat flour &ndash; soft chapatis&lt;/li&gt; &lt;li&gt;Rich in fiber and nutrients&lt;/li&gt; &lt;li&gt;Enhances everyday meals&lt;/li&gt; &lt;li&gt;Essential for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(60, 'GANESH-MAIDA-100', 'Ganesh Maida', 'ganesh-maida', 1, 0, 'ganesh-maida.jpg', 52.00, 0.00, '1kg', 0.00, 'Refined flour for baking', '&lt;section&gt; &lt;h3&gt;Ganesh Maida&lt;/h3&gt; &lt;p&gt;Ganesh Maida is refined wheat flour, milled to perfection for baking and cooking. It is ideal for breads, cakes, pastries, and traditional Indian snacks.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Refined flour &ndash; smooth texture&lt;/li&gt; &lt;li&gt;Perfect for baking and frying&lt;/li&gt; &lt;li&gt;Enhances cakes, pastries, and snacks&lt;/li&gt; &lt;li&gt;Essential for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(61, 'JOYGOPAL-ATTA-100', 'Joygopal Atta', 'joygopal-atta', 1, 0, 'joygopal-atta.jpg', 40.00, 0.00, '1kg', 0.00, 'Quality wheat flour', '&lt;section&gt; &lt;h3&gt;Joygopal Atta&lt;/h3&gt; &lt;p&gt;Joygopal Atta is quality wheat flour, rich in fiber and nutrients. It ensures soft chapatis and rotis with authentic taste and nutrition.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Quality wheat flour &ndash; soft chapatis&lt;/li&gt; &lt;li&gt;Rich in fiber and protein&lt;/li&gt; &lt;li&gt;Enhances everyday meals&lt;/li&gt; &lt;li&gt;Essential for Indian households&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(62, 'FORTUNE-ATTA-1KG', 'Fortune Chakki Fresh Atta', 'fortune-chakki-fresh-atta-1kg', 1, 0, 'fortune-chakki-fresh-atta-1kg.jpg', 46.00, 0.00, '1kg', 0.00, 'Stone-ground whole wheat flour', '&lt;section&gt; &lt;h3&gt;Fortune Chakki Fresh Atta 1kg&lt;/h3&gt; &lt;p&gt;Fortune Chakki Fresh Atta is stone-ground whole wheat flour, offering authentic taste and nutrition. The 1kg pack is convenient for small families.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Stone-ground wheat flour &ndash; authentic taste&lt;/li&gt; &lt;li&gt;Rich in fiber and nutrients&lt;/li&gt; &lt;li&gt;Soft chapatis and rotis&lt;/li&gt; &lt;li&gt;Convenient 1kg pack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41');
INSERT INTO `ecomm_products` (`id`, `sku`, `name`, `url_mask`, `id_default_category`, `id_brand`, `default_image`, `price`, `offer_price`, `price_unit`, `cost_of_product`, `short_desc`, `description`, `product_type`, `combinations`, `tag`, `is_visible_to_list`, `position`, `status`, `createdOn`, `updatedOn`) VALUES
(63, 'FORTUNE-ATTA-100', 'Fortune Chakki Fresh Atta', 'fortune-chakki-fresh-atta', 1, 7, 'fortune-chakki-fresh-atta.jpg', 225.00, 0.00, '5kg', 0.00, 'Fresh whole wheat flour', '&lt;h3&gt;Fortune Chakki Fresh Atta&lt;/h3&gt;\r\n\r\n&lt;p&gt;Fortune Chakki Fresh Atta is premium whole wheat flour, milled to preserve natural goodness. It ensures soft, fluffy chapatis and rotis every time.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Premium whole wheat flour&lt;/li&gt;\r\n	&lt;li&gt;Rich in fiber and protein&lt;/li&gt;\r\n	&lt;li&gt;Soft and fluffy chapatis&lt;/li&gt;\r\n	&lt;li&gt;Essential for daily meals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '62', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 12:22:39'),
(64, 'STEEL-SCRUBBER-100', 'Stainless Steel Scrubber', 'stainless-steel-scrubber', 4, 0, 'stainless-steel-scrubber.jpg', 10.00, 0.00, '1Pc', 0.00, 'Tough stainless steel scrubber', '&lt;section&gt; &lt;h3&gt;Stainless Steel Scrubber&lt;/h3&gt; &lt;p&gt;The Stainless Steel Scrubber is tough on grease and stains, making it ideal for cleaning utensils and cookware. Durable and long-lasting.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Tough cleaning tool &ndash; removes grease&lt;/li&gt; &lt;li&gt;Durable stainless steel material&lt;/li&gt; &lt;li&gt;Safe for steel and aluminum cookware&lt;/li&gt; &lt;li&gt;Long-lasting performance&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(65, 'SCOTCH-BRITE-100', 'Scotch Brite', 'scotch-brite', 4, 0, 'scotch-brite.jpg', 10.00, 0.00, 'Pc', 0.00, 'Household cleaning pad', '&lt;section&gt; &lt;h3&gt;Scotch Brite&lt;/h3&gt; &lt;p&gt;Scotch Brite is a household cleaning pad designed to remove stains and grease effectively. Gentle on hands, tough on dirt.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Effective cleaning pad&lt;/li&gt; &lt;li&gt;Removes grease and stains&lt;/li&gt; &lt;li&gt;Gentle on hands&lt;/li&gt; &lt;li&gt;Essential for kitchen cleaning&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(66, 'RASNA-100', 'Rasna', 'rasna', 2, 0, 'rasna.jpg', 50.00, 0.00, 'Pc', 0.00, 'Instant drink mix', '&lt;section&gt; &lt;h3&gt;Rasna&lt;/h3&gt; &lt;p&gt;Rasna is an instant drink mix loved by families for its refreshing taste. Available in multiple flavors, it is easy to prepare and enjoyed by all ages.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Instant drink mix &ndash; refreshing taste&lt;/li&gt; &lt;li&gt;Available in multiple flavors&lt;/li&gt; &lt;li&gt;Easy to prepare&lt;/li&gt; &lt;li&gt;Perfect for family refreshment&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(67, 'GLUCON-D-TANGY-100', 'Glucon D Tangy Orange', 'glucon-d-tangy', 2, 0, 'glucon-d-tangy.jpg', 380.00, 349.00, '1kg', 0.00, 'Tangy instant energy drink', '&lt;section&gt; &lt;h3&gt;Glucon-D Tangy&lt;/h3&gt; &lt;p&gt;Glucon-D Tangy is an instant energy drink that replenishes lost energy quickly. Its tangy flavor makes it refreshing and enjoyable.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Instant energy drink &ndash; quick recharge&lt;/li&gt; &lt;li&gt;Tangy flavor &ndash; refreshing taste&lt;/li&gt; &lt;li&gt;Rich in glucose and minerals&lt;/li&gt; &lt;li&gt;Perfect for summer hydration&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(68, 'NUTRELA-SOYA-100', 'Nutrela Soya Chunks', 'nutrela-soya-chunks', 1, 14, 'nutrela-soya-chunks.jpg', 15.00, 0.00, '80gm', 0.00, 'Protein-rich soya chunks', '&lt;h3&gt;Nutrela Soya Chunks&lt;/h3&gt;\r\n\r\n&lt;p&gt;Nutrela Soya Chunks are protein-rich meat substitutes, perfect for curries, pulao, and snacks. They are nutritious and versatile.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Protein-rich soya chunks&lt;/li&gt;\r\n	&lt;li&gt;Healthy meat substitute&lt;/li&gt;\r\n	&lt;li&gt;Enhances curries and pulao&lt;/li&gt;\r\n	&lt;li&gt;Essential for vegetarian diets&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '69', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 12:21:55'),
(69, 'NUTRELA-SOYA-1KG', 'Nutrela Soya Chunks', 'nutrela-soya-chunks-1kg', 1, 0, 'nutrela-soya-chunks-1kg.jpg', 130.00, 0.00, '1kg', 0.00, 'High protein soya chunks 1kg', '&lt;section&gt; &lt;h3&gt;Nutrela Soya Chunks 1kg&lt;/h3&gt; &lt;p&gt;Nutrela Soya Chunks in a 1kg pack provide high protein nutrition for families. Ideal for bulk cooking and regular use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;High protein soya chunks&lt;/li&gt; &lt;li&gt;Convenient 1kg family pack&lt;/li&gt; &lt;li&gt;Versatile use &ndash; curries, pulao, snacks&lt;/li&gt; &lt;li&gt;Nutritious and filling&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(70, 'NUTRELA-SOYA-MINI-100', 'Nutrela Mini Soya Chunks', 'nutrela-mini-soya-chunks', 1, 0, 'nutrela-mini-soya-chunks.jpg', 15.00, 0.00, '80gm', 0.00, 'Small protein-rich soya chunks', '&lt;section&gt; &lt;h3&gt;Nutrela Mini Soya Chunks&lt;/h3&gt; &lt;p&gt;Nutrela Mini Soya Chunks are bite-sized protein-rich nuggets, perfect for curries, snacks, and pulao. They are easy to cook and absorb flavors beautifully.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Small protein-rich chunks&lt;/li&gt; &lt;li&gt;Healthy meat substitute&lt;/li&gt; &lt;li&gt;Enhances curries and snacks&lt;/li&gt; &lt;li&gt;Nutritious and versatile&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(71, 'FORTUNE-SOYA-100', 'Fortune Soya Chunks', 'fortune-soya-chunks', 1, 0, 'fortune-soya-chunks.jpg', 130.00, 0.00, '1kg', 0.00, 'Nutritious protein-rich soya chunks', '&lt;section&gt; &lt;h3&gt;Fortune Soya Chunks&lt;/h3&gt; &lt;p&gt;Fortune Soya Chunks are nutritious and protein-rich, making them an excellent addition to vegetarian diets. They are versatile and easy to prepare.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Nutritious protein chunks&lt;/li&gt; &lt;li&gt;Rich in protein and fiber&lt;/li&gt; &lt;li&gt;Perfect for curries, pulao, and snacks&lt;/li&gt; &lt;li&gt;Essential for healthy cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(72, 'ALMOND-100', 'Almond', 'almond', 1, 0, 'almond.jpg', 92.00, 0.00, '100gm', 0.00, 'Premium quality almonds', '&lt;section&gt; &lt;h3&gt;Almond&lt;/h3&gt; &lt;p&gt;Premium quality almonds are a healthy dry fruit, rich in protein, fiber, and essential nutrients. Perfect for snacking, baking, and festive recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium dry fruit &ndash; rich in protein&lt;/li&gt; &lt;li&gt;Supports heart and brain health&lt;/li&gt; &lt;li&gt;Versatile &ndash; snacks, sweets, baking&lt;/li&gt; &lt;li&gt;Essential for healthy diets&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(73, 'KHEJUR-100', 'Khejur', 'khejur', 1, 0, 'khejur.jpg', 118.00, 0.00, '1kg', 0.00, 'Natural sweet dates', '&lt;section&gt; &lt;h3&gt;Khejur (Dates)&lt;/h3&gt; &lt;p&gt;Khejur, or dates, are naturally sweet and packed with energy. They are a healthy snack and a traditional ingredient in festive recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural dates &ndash; sweet and nutritious&lt;/li&gt; &lt;li&gt;Rich in fiber and minerals&lt;/li&gt; &lt;li&gt;Perfect for snacking and desserts&lt;/li&gt; &lt;li&gt;Supports energy and digestion&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(74, 'POTATO-CHIPS-100', 'Potato Chips', 'potato-chips', 2, 0, 'potato-chips.jpg', 95.00, 0.00, '500gm', 0.00, 'Crunchy potato chips snack', '&lt;section&gt; &lt;h3&gt;Potato Chips&lt;/h3&gt; &lt;p&gt;Crunchy potato chips are a classic snack loved by all ages. Lightly salted and crispy, they are perfect for parties, picnics, and everyday snacking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Crunchy snack &ndash; lightly salted&lt;/li&gt; &lt;li&gt;Perfect for parties and picnics&lt;/li&gt; &lt;li&gt;Enjoyed by all age groups&lt;/li&gt; &lt;li&gt;Convenient ready-to-eat snack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(75, 'AAMSOTTO-100', 'Aamsotto', 'aamsotto', 1, 0, 'aamsotto.jpg', 230.00, 0.00, '1kg', 0.00, 'Traditional mango sweet', '&lt;section&gt; &lt;h3&gt;Aamsotto (Mango Sweet)&lt;/h3&gt; &lt;p&gt;Aamsotto is a traditional Bengali sweet made from ripe mango pulp. It is chewy, tangy, and sweet, enjoyed as a snack or dessert.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Traditional mango sweet&lt;/li&gt; &lt;li&gt;Chewy and tangy flavor&lt;/li&gt; &lt;li&gt;Perfect for snacking and desserts&lt;/li&gt; &lt;li&gt;Authentic Bengali delicacy&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(76, 'PEANUT-100', 'Lal Badam (Peanut)', 'lal-badam-peanut', 1, 0, 'lal-badam-peanut.jpg', 130.00, 0.00, '1kg', 0.00, 'Crunchy roasted peanuts', '&lt;section&gt; &lt;h3&gt;Lal Badam (Peanut)&lt;/h3&gt; &lt;p&gt;Lal Badam, or peanuts, are crunchy and protein-rich. They are perfect for snacking, cooking, and making traditional sweets like chikki.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Crunchy peanuts &ndash; protein-rich&lt;/li&gt; &lt;li&gt;Supports energy and nutrition&lt;/li&gt; &lt;li&gt;Versatile &ndash; snacks, sweets, cooking&lt;/li&gt; &lt;li&gt;Essential dry fruit for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(77, 'GANESH-SATTU-500', 'Ganesh Sattu', 'ganesh-sattu-500gm', 1, 0, 'ganesh-sattu-500gm.jpg', 95.00, 0.00, '500gm', 0.00, 'Nutritious sattu flour 500gm', '&lt;section&gt; &lt;h3&gt;Ganesh Sattu 500gm&lt;/h3&gt; &lt;p&gt;Ganesh Sattu is a nutritious flour made from roasted gram. The 500gm pack is ideal for families, used in drinks, parathas, and traditional recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Nutritious roasted gram flour&lt;/li&gt; &lt;li&gt;Rich in protein and fiber&lt;/li&gt; &lt;li&gt;Perfect for drinks and parathas&lt;/li&gt; &lt;li&gt;Convenient 500gm pack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(78, 'GANESH-SATTU-200', 'Ganesh Sattu', 'ganesh-sattu-200gm', 1, 0, 'ganesh-sattu-200gm.jpg', 35.00, 0.00, '200gm', 0.00, 'Healthy sattu flour 200gm', '&lt;section&gt; &lt;h3&gt;Ganesh Sattu 200gm&lt;/h3&gt; &lt;p&gt;Ganesh Sattu in a 200gm pack is a healthy protein-rich flour, perfect for small households. Used in refreshing drinks and traditional recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Healthy roasted gram flour&lt;/li&gt; &lt;li&gt;Rich in protein and fiber&lt;/li&gt; &lt;li&gt;Perfect for drinks and snacks&lt;/li&gt; &lt;li&gt;Convenient 200gm pack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(79, 'KISMIS-100', 'Kismis', 'kismis', 1, 0, 'kismis.jpg', 56.00, 0.00, '100gm', 0.00, 'Premium raisins', '&lt;section&gt; &lt;h3&gt;Kismis (Raisins)&lt;/h3&gt; &lt;p&gt;Kismis, or raisins, are sweet dried grapes used in sweets, snacks, and festive recipes. They are rich in iron and natural sugars.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium raisins &ndash; sweet and chewy&lt;/li&gt; &lt;li&gt;Rich in iron and antioxidants&lt;/li&gt; &lt;li&gt;Perfect for sweets and snacks&lt;/li&gt; &lt;li&gt;Essential for festive cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(80, 'KISMIS-250', 'Kismis', 'kismis-250', 1, 0, 'kismis-250.jpg', 140.00, 0.00, '250gm', 0.00, 'Quality raisins 250gm', '&lt;section&gt; &lt;h3&gt;Kismis 250gm&lt;/h3&gt; &lt;p&gt;Kismis, or raisins, are naturally sweet dried grapes. The 250gm pack is perfect for small households, used in sweets, snacks, and festive recipes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium raisins &ndash; sweet and chewy&lt;/li&gt; &lt;li&gt;Rich in iron and antioxidants&lt;/li&gt; &lt;li&gt;Perfect for sweets and snacks&lt;/li&gt; &lt;li&gt;Convenient 250gm pack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(81, 'KISMIS-500', 'Kismis', 'kismis-500', 1, 0, 'kismis-500.jpg', 275.00, 0.00, '500gm', 0.00, 'Bulk raisins 500gm', '&lt;section&gt; &lt;h3&gt;Kismis 500gm&lt;/h3&gt; &lt;p&gt;Kismis in a 500gm pack offers bulk quantity for families. These raisins are nutritious and versatile, used in desserts, snacks, and cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Bulk pack raisins &ndash; sweet and chewy&lt;/li&gt; &lt;li&gt;Rich in iron and natural sugars&lt;/li&gt; &lt;li&gt;Perfect for festive cooking&lt;/li&gt; &lt;li&gt;Convenient 500gm family pack&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(82, 'KAJU-100', 'Kaju', 'kaju', 1, 0, 'kaju.jpg', 95.00, 0.00, '100gm', 0.00, 'Premium cashews', '&lt;section&gt; &lt;h3&gt;Kaju (Cashews)&lt;/h3&gt; &lt;p&gt;Kaju, or cashews, are premium dry fruits with a rich, creamy flavor. They are used in sweets, curries, and snacks, offering nutrition and taste.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium cashews &ndash; rich flavor&lt;/li&gt; &lt;li&gt;Supports heart and brain health&lt;/li&gt; &lt;li&gt;Perfect for sweets and curries&lt;/li&gt; &lt;li&gt;Essential dry fruit for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(83, 'KAJU-SPLIT-100', 'Kaju Split', 'kaju-split', 1, 0, 'kaju-split.jpg', 88.00, 0.00, '100gm', 0.00, 'Split cashews for cooking', '&lt;section&gt; &lt;h3&gt;Kaju Split&lt;/h3&gt; &lt;p&gt;Kaju Split are halved cashews, convenient for cooking and baking. They add rich flavor and texture to sweets, curries, and festive dishes.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Split cashews &ndash; easy to use&lt;/li&gt; &lt;li&gt;Rich creamy flavor&lt;/li&gt; &lt;li&gt;Perfect for sweets and curries&lt;/li&gt; &lt;li&gt;Nutritious and versatile&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(84, 'GANESH-SOOJI-100', 'Ganesh Sooji', 'ganesh-sooji', 1, 0, 'ganesh-sooji.jpg', 12.00, 0.00, '200gm', 0.00, 'Semolina flour', '&lt;section&gt; &lt;h3&gt;Ganesh Sooji (Semolina)&lt;/h3&gt; &lt;p&gt;Ganesh Sooji is premium semolina flour, used in sweets, snacks, and breakfast dishes. It is nutritious and versatile for Indian cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Premium semolina flour&lt;/li&gt; &lt;li&gt;Perfect for halwa, upma, and snacks&lt;/li&gt; &lt;li&gt;Rich in protein and fiber&lt;/li&gt; &lt;li&gt;Essential for Indian kitchens&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(85, 'BESAN-100', 'Besan Loose', 'besan-loose', 1, 0, 'besan-loose.jpg', 35.00, 0.00, '500gm', 0.00, 'Loose gram flour', '&lt;section&gt; &lt;h3&gt;Besan Loose (Gram Flour)&lt;/h3&gt; &lt;p&gt;Besan is gram flour used in pakoras, sweets, and curries. Loose besan offers convenience and freshness for everyday cooking.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Gram flour &ndash; versatile ingredient&lt;/li&gt; &lt;li&gt;Perfect for pakoras and sweets&lt;/li&gt; &lt;li&gt;Rich in protein and fiber&lt;/li&gt; &lt;li&gt;Essential for Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(86, 'TATA-TEA-GOLD-250', 'TATA tea gold 250gm', 'tata-tea-gold-250gm', 2, 18, 'tata-tea-gold-250gm.jpg', 130.00, 0.00, '250gm', 0.00, 'Premium tea blend 250gm', '&lt;h3&gt;Tata Tea Gold 250gm&lt;/h3&gt;\r\n\r\n&lt;p&gt;Tata Tea Gold is a premium tea blend offering rich flavor and aroma. The 250gm pack is perfect for small households.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Premium tea blend &amp;ndash; rich taste&lt;/li&gt;\r\n	&lt;li&gt;Fresh aroma &amp;ndash; energizing brew&lt;/li&gt;\r\n	&lt;li&gt;Convenient 250gm pack&lt;/li&gt;\r\n	&lt;li&gt;Perfect for everyday tea lovers&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '86,87,88', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 13:48:36'),
(87, 'TATA-TEA-GOLD-500', 'TATA tea gold 500gm', 'tata-tea-gold-500gm', 2, 18, 'tata-tea-gold-500gm.jpg', 250.00, 225.00, '500gm', 210.00, 'Rich tea blend 500gm', '&lt;h3&gt;Tata Tea Gold 500gm&lt;/h3&gt;\r\n\r\n&lt;p&gt;Tata Tea Gold in a 500gm pack offers bulk quantity for families. It delivers premium taste and aroma in every cup.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Rich tea blend &amp;ndash; premium flavor&lt;/li&gt;\r\n	&lt;li&gt;Fresh aroma &amp;ndash; energizing brew&lt;/li&gt;\r\n	&lt;li&gt;Convenient 500gm family pack&lt;/li&gt;\r\n	&lt;li&gt;Perfect for tea enthusiasts&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '87,88,86', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 13:48:49'),
(88, 'TATA-TEA-GOLD-100', 'TATA tea gold 100g', 'tata-tea-gold-100g', 2, 18, 'tata-tea-gold-100gm.jpg', 48.00, 0.00, '100gm', 0.00, 'Quality tea blend 100gm', '&lt;h3&gt;Tata Tea Gold 100gm&lt;/h3&gt;\r\n\r\n&lt;p&gt;Tata Tea Gold in a 100gm pack is ideal for trial or small households. It offers the same premium taste and aroma in a compact size.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Premium tea blend &amp;ndash; rich taste&lt;/li&gt;\r\n	&lt;li&gt;Fresh aroma &amp;ndash; energizing brew&lt;/li&gt;\r\n	&lt;li&gt;Convenient 100gm pack&lt;/li&gt;\r\n	&lt;li&gt;Perfect for small households&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '86,87,88', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 13:48:25'),
(89, 'NESCAFE-10', 'Nescafe', 'nescafe-10', 2, 0, 'nescafe-10.jpg', 10.00, 0.00, '4gm', 0.00, 'Instant coffee sachet', '&lt;section&gt; &lt;h3&gt;Nescafe 10&lt;/h3&gt; &lt;p&gt;Nescafe 10 is an instant coffee sachet, offering quick and convenient coffee preparation. Perfect for travel, office, or home use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Instant coffee sachet &ndash; quick brew&lt;/li&gt; &lt;li&gt;Rich flavor &ndash; energizing taste&lt;/li&gt; &lt;li&gt;Convenient single-serve pack&lt;/li&gt; &lt;li&gt;Perfect for on-the-go coffee lovers&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(90, 'NESCAFE-CLASSIC-25', 'Nescafe classic', 'nescafe-classic-25gm', 2, 0, 'nescafe-classic-25gm.jpg', 130.00, 120.00, '25gm', 0.00, 'Instant coffee classic 25gm', '&lt;section&gt; &lt;h3&gt;Nescafe Classic 25gm&lt;/h3&gt; &lt;p&gt;Nescafe Classic is a rich instant coffee made from carefully roasted beans. The 25gm pack is perfect for small households or trial use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Instant coffee &ndash; quick and easy to prepare&lt;/li&gt; &lt;li&gt;Rich flavor &ndash; energizing taste&lt;/li&gt; &lt;li&gt;Convenient 25gm pack&lt;/li&gt; &lt;li&gt;Perfect for everyday coffee lovers&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(91, 'BLACK-SALT-100', 'Black Salt', 'black-salt', 1, 0, 'black-salt.jpg', 5.00, 0.00, '100gm', 0.00, 'Authentic Indian black salt', '&lt;section&gt; &lt;h3&gt;Black Salt&lt;/h3&gt; &lt;p&gt;Black Salt, or kala namak, is a traditional Indian salt with a distinct sulfurous flavor. It is used in chaats, raitas, and Ayurvedic remedies.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Authentic Indian black salt&lt;/li&gt; &lt;li&gt;Distinct flavor &ndash; enhances chaats and raitas&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Essential for Indian street food&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(92, 'TATA-SALT-1KG', 'TATA salt', 'tata-salt-1kg', 1, 0, 'tata-salt-1kg.jpg', 26.00, 0.00, '1kg', 0.00, 'Pure iodized salt 1kg', '&lt;h3&gt;Tata Salt 1kg&lt;/h3&gt;\r\n\r\n&lt;p&gt;Tata Salt is pure iodized salt, trusted by households across India. The 1kg pack is ideal for family use, ensuring health and taste in every meal.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Pure iodized salt &amp;ndash; trusted quality&lt;/li&gt;\r\n	&lt;li&gt;Supports thyroid health&lt;/li&gt;\r\n	&lt;li&gt;Convenient 1kg family pack&lt;/li&gt;\r\n	&lt;li&gt;Essential for everyday cooking&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '93', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 12:20:24'),
(93, 'TATA-SALT-500', 'TATA salt', 'tata-salt-500gm', 1, 0, 'tata-salt-500gm.jpg', 13.00, 0.00, '500gm', 0.00, 'Pure iodized salt 500gm', '&lt;h3&gt;Tata Salt 500gm&lt;/h3&gt;\r\n\r\n&lt;p&gt;Tata Salt in a 500gm pack offers pure iodized salt in a convenient size. Perfect for small households and everyday cooking.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Pure iodized salt &amp;ndash; trusted quality&lt;/li&gt;\r\n	&lt;li&gt;Supports thyroid health&lt;/li&gt;\r\n	&lt;li&gt;Convenient 500gm pack&lt;/li&gt;\r\n	&lt;li&gt;Essential for daily meals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '92', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 12:20:42'),
(94, 'SUGAR-M-100', 'Sugar M', 'sugar-m', 1, 0, 'sugar-m.jpg', 47.00, 0.00, '1kg', 0.00, 'Premium refined sugar', '&lt;h3&gt;Sugar M&lt;/h3&gt;\r\n\r\n&lt;p&gt;Sugar M is premium refined sugar, perfect for desserts, beverages, and everyday cooking. It dissolves quickly and adds sweetness to recipes.&lt;/p&gt;\r\n\r\n&lt;ul&gt;\r\n	&lt;li&gt;Premium refined sugar&lt;/li&gt;\r\n	&lt;li&gt;Quick dissolving &amp;ndash; perfect for drinks&lt;/li&gt;\r\n	&lt;li&gt;Enhances sweets and desserts&lt;/li&gt;\r\n	&lt;li&gt;Essential for everyday cooking&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'combination', '95', NULL, 1, NULL, 'A', '2026-01-11 12:18:41', '2026-01-11 12:21:09'),
(95, 'SUGAR-M-500', 'Sugar M', 'sugar-m-500gm', 1, 0, 'sugar-m-500gm.jpg', 24.00, 0.00, '500gm', 0.00, 'Refined sugar 500gm', '&lt;section&gt; &lt;h3&gt;Sugar M 500gm&lt;/h3&gt; &lt;p&gt;Sugar M in a 500gm pack offers refined sugar in a convenient size. Perfect for small households and daily use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Refined sugar &ndash; premium quality&lt;/li&gt; &lt;li&gt;Quick dissolving &ndash; ideal for beverages&lt;/li&gt; &lt;li&gt;Convenient 500gm pack&lt;/li&gt; &lt;li&gt;Essential for sweets and cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(96, 'AMULSPRAY-100', 'Amulspray', 'amulspray-100gm', 2, 0, 'amulspray-100gm.jpg', 50.00, 48.00, '100gm', 0.00, 'Infant milk powder 100gm', '&lt;section&gt; &lt;h3&gt;Amulspray 100gm&lt;/h3&gt; &lt;p&gt;Amulspray is infant milk powder trusted by mothers for decades. The 100gm pack is convenient for trial or travel use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Infant milk powder &ndash; trusted quality&lt;/li&gt; &lt;li&gt;Rich in nutrients for growth&lt;/li&gt; &lt;li&gt;Convenient 100gm pack&lt;/li&gt; &lt;li&gt;Perfect for travel or small households&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(97, 'AMULSPRAY-200', 'Amulspray', 'amulspray-200gm', 2, 0, 'amulspray-200gm.jpg', 100.00, 98.00, '200gm', 0.00, 'Baby milk powder 200gm', '&lt;section&gt; &lt;h3&gt;Amulspray 200gm&lt;/h3&gt; &lt;p&gt;Amulspray in a 200gm pack provides infant milk powder with essential nutrients. Ideal for daily feeding and small families.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Infant milk powder &ndash; nutritious&lt;/li&gt; &lt;li&gt;Supports healthy growth&lt;/li&gt; &lt;li&gt;Convenient 200gm pack&lt;/li&gt; &lt;li&gt;Trusted by mothers across India&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(98, 'AMULSPRAY-500', 'Amulspray', 'amulspray-500gm', 2, 0, 'amulspray-500gm.jpg', 250.00, 240.00, '500gm', 0.00, 'Infant milk powder 500gm', '&lt;section&gt; &lt;h3&gt;Amulspray 500gm&lt;/h3&gt; &lt;p&gt;Amulspray in a 500gm pack offers infant milk powder in bulk quantity. Perfect for regular use and family needs.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Infant milk powder &ndash; premium quality&lt;/li&gt; &lt;li&gt;Supports infant nutrition&lt;/li&gt; &lt;li&gt;Convenient 500gm family pack&lt;/li&gt; &lt;li&gt;Trusted brand for decades&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(99, 'BROOKE-BOND-TAZA-100', 'Brooke bond Taaza', 'brooke-bond-taza', 2, 0, 'brooke-bond-taza.jpg', 25.00, 0.00, '100gm', 0.00, 'Strong tea blend', '&lt;section&gt; &lt;h3&gt;Brooke Bond Taza&lt;/h3&gt; &lt;p&gt;Brooke Bond Taza is a strong tea blend loved for its bold flavor and refreshing aroma. Perfect for energizing mornings and family tea times.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Strong tea blend &ndash; bold flavor&lt;/li&gt; &lt;li&gt;Fresh aroma &ndash; energizing brew&lt;/li&gt; &lt;li&gt;Perfect for family tea times&lt;/li&gt; &lt;li&gt;Trusted brand for generations&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(100, 'ROCK-SALT-100', 'Rock Salt', 'rock-salt', 1, 0, 'rock-salt.jpg', 8.00, 10.00, '100gm', 0.00, 'Natural mineral rock salt', '&lt;section&gt; &lt;h3&gt;Rock Salt&lt;/h3&gt; &lt;p&gt;Rock Salt, also known as sendha namak, is a natural mineral salt used in cooking and Ayurvedic remedies. It has a mild flavor and is often used during fasting.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Natural mineral salt &ndash; mild taste&lt;/li&gt; &lt;li&gt;Supports digestion and wellness&lt;/li&gt; &lt;li&gt;Perfect for fasting recipes&lt;/li&gt; &lt;li&gt;Essential for traditional Indian cooking&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(101, 'DABUR-HONEY-100', 'Dabur Honey', 'dabur-honey', 3, 0, 'dabur-honey.jpg', 125.00, 115.00, '250gm', 0.00, 'Pure natural honey', '&lt;section&gt; &lt;h3&gt;Dabur Honey&lt;/h3&gt; &lt;p&gt;Dabur Honey is pure and natural, sourced from trusted beekeepers. It is rich in antioxidants and nutrients, making it a healthy sweetener for everyday use.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Pure natural honey &ndash; trusted quality&lt;/li&gt; &lt;li&gt;Rich in antioxidants and nutrients&lt;/li&gt; &lt;li&gt;Perfect for drinks, desserts, and cooking&lt;/li&gt; &lt;li&gt;Supports immunity and wellness&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41'),
(102, 'SAFFOLA-HONEY-100', 'Saffola Honey Sundarbans', 'saffola-honey-sundarbans', 3, 0, 'saffola-honey-sundarbans.jpg', 550.00, 285.00, '1kg', 0.00, 'Organic Sundarbans honey', '&lt;section&gt; &lt;h3&gt;Saffola Honey Sundarbans&lt;/h3&gt; &lt;p&gt;Saffola Honey Sundarbans is organic honey sourced from the Sundarbans forest region. It is pure, natural, and rich in flavor and nutrients.&lt;/p&gt; &lt;ul&gt; &lt;li&gt;Organic honey &ndash; sourced from Sundarbans&lt;/li&gt; &lt;li&gt;Rich in antioxidants and minerals&lt;/li&gt; &lt;li&gt;Pure and natural &ndash; no additives&lt;/li&gt; &lt;li&gt;Perfect for healthy cooking and wellness&lt;/li&gt; &lt;/ul&gt; &lt;/section&gt;', 'standard', '', NULL, 1, 0, 'A', '2026-01-11 12:18:41', '2026-01-11 12:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_brands`
--

CREATE TABLE `ecomm_product_brands` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `default_image` varchar(100) NOT NULL,
  `position` int(11) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ecomm_product_brands`
--

INSERT INTO `ecomm_product_brands` (`id`, `name`, `default_image`, `position`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 'Hindustan Unilever Limited (HUL)', 'hul.jpeg', 10, 'A', '2026-01-10 08:32:02', NULL),
(2, 'Sunrise by ITC', 'sunrise.jpeg', 20, 'A', '2026-01-10 08:33:32', NULL),
(3, 'ITC', 'itc.jpeg', 30, 'A', '2026-01-10 08:33:32', NULL),
(4, 'Amul', 'amul.jpeg', 50, 'A', '2026-01-11 07:07:07', NULL),
(5, 'Brooke Bond', 'brooke-bond.jpg', 70, 'A', '2026-01-11 07:07:07', NULL),
(6, 'Colgate', 'colgate.jpg', 80, 'A', '2026-01-11 07:08:35', NULL),
(7, 'Fortune', 'fontune.jpg', 95, 'A', '2026-01-11 07:08:35', NULL),
(8, 'Dabur', 'dabur.jpg', 100, 'A', '2026-01-11 07:13:47', NULL),
(9, 'Ganesh', 'ganesh-foods.jpg', 105, 'A', '2026-01-11 07:13:47', NULL),
(10, 'Godrej', 'godrej.jpg', 110, 'A', '2026-01-11 07:13:47', NULL),
(11, 'Joy Gopal', 'joy-gopal.jpg', 115, 'A', '2026-01-11 07:13:47', NULL),
(12, 'Maggi', 'maggi.jpg', 120, 'A', '2026-01-11 07:13:47', NULL),
(13, 'Nescafe', 'nescafe.jpg', 125, 'A', '2026-01-11 07:13:47', NULL),
(14, 'Nutrela', 'nutrela.jpg', 130, 'A', '2026-01-11 07:13:47', NULL),
(15, 'Rasna', 'rasna.jpg', 135, 'A', '2026-01-11 07:13:47', NULL),
(16, 'Saffola', 'saffola.jpg', 140, 'A', '2026-01-11 07:13:47', NULL),
(17, 'Scotch Brite', 'scotch-brite.jpg', 145, 'A', '2026-01-11 07:13:47', NULL),
(18, 'TATA', 'tata.jpg', 150, 'A', '2026-01-11 07:13:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_category`
--

CREATE TABLE `ecomm_product_category` (
  `id` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL DEFAULT 0,
  `name` varchar(150) NOT NULL,
  `url_mask` varchar(150) NOT NULL,
  `position` int(11) NOT NULL,
  `default_image` varchar(100) NOT NULL,
  `icon_name` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `show_on_menu` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_product_category`
--

INSERT INTO `ecomm_product_category` (`id`, `id_parent`, `name`, `url_mask`, `position`, `default_image`, `icon_name`, `content`, `show_on_menu`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 0, 'Cooking Essentials', 'cooking-essentials', 10, 'cat_1.jpg', NULL, '&lt;p&gt;Cooking Essentials&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(2, 0, 'Snacks & Breverages', 'snacks-breverages', 20, 'cat_2.jpeg', NULL, '&lt;p&gt;Snacks &amp;amp; Breverages&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(3, 0, 'Packaged Food', 'packaged-food', 30, 'cat_3.jpeg', NULL, '&lt;p&gt;Packaged Food&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(4, 0, 'Household Care', 'household-care', 40, 'cat_4.jpeg', NULL, '&lt;p&gt;Household Care&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(5, 0, 'Personal Care', 'personal-care', 50, 'cat_5.jpeg', NULL, '&lt;p&gt;Personal Care&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(6, 0, 'Fruits', 'fruits', 60, '', NULL, '&lt;p&gt;Fruits&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(7, 0, 'Vegetables', 'vegetables', 70, '', NULL, '&lt;p&gt;Vegetables&amp;nbsp;&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(8, 1, 'Atta, Maida, Flours, Sooji', 'atta-maida-flours-sooji', 10, 'cat_8.jpeg', NULL, '&lt;p&gt;Atta, Madia, Flours, Sooji&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(9, 1, 'Rice & Rice Products', 'rice-rice-products', 20, 'cat_9.jpeg', NULL, '&lt;p&gt;Rice &amp;amp; Rice Products&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(10, 1, 'Dal, Pulses, Soya Chunks', 'dal-pulses-soya-chunks', 40, 'cat_10.jpeg', NULL, '&lt;p&gt;Dal, Pulses, Soya Chunks&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(11, 1, 'Ghee, Oils', 'ghee-oils', 50, 'cat_11.jpeg', NULL, '&lt;p&gt;Ghee, Oils&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(12, 1, 'Dry Fruits', 'dry-fruits', 60, 'cat_12.jpeg', NULL, '&lt;p&gt;Dry Fruits&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(13, 1, 'Sugar, Salts', 'sugar-salts', 60, 'cat_13.jpeg', NULL, '&lt;p&gt;Sugar, Salts&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(14, 1, 'Whole Spices', 'whole-spices', 80, 'cat_14.jpeg', NULL, '&lt;p&gt;Whole Spices&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(15, 1, 'Powdered Spices', 'powdered-spices', 90, 'cat_15.jpeg', NULL, '&lt;p&gt;Powdered Spices&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(16, 2, 'Biscuits, Cookies, Cakes', 'biscuits-cookies-cakes', 10, 'cat_16.jpeg', NULL, '&lt;p&gt;Biscuits, Cookies, Cakes&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(17, 2, 'Chips, Namkeen', 'chips-namkeen', 20, 'cat_17.jpeg', NULL, '&lt;p&gt;Chips, Namkeen&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(18, 2, 'Tea, Coffee', 'tea-coffee', 30, 'cat_18.jpeg', NULL, '&lt;p&gt;Tea, Coffee&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(19, 2, 'Dairy, Bakery, Eggs', 'dairy-bakery-eggs', 40, 'cat_19.jpeg', NULL, '&lt;p&gt;Dairy, Bakery, Eggs&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(20, 2, 'Instant Drink Mixes', 'instant-drink-mixes', 50, 'cat_20.jpeg', NULL, '&lt;p&gt;Instant Drink Mixes&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(21, 2, 'Health Drinks', 'health-drinks', 60, 'cat_21.jpeg', NULL, '&lt;p&gt;Health Drinks&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(22, 3, 'Breakfast Essentials', 'breakfast-essentials', 10, 'cat_22.jpeg', NULL, '&lt;p&gt;Breakfast Essentials&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(23, 3, 'Noodles, Pasta', 'noodles-pasta', 20, 'cat_23.jpeg', NULL, '&lt;p&gt;Noodles, Pasta&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(24, 3, 'Ketchups, Vinegar, Sauces', 'ketchups-vinegar-sauces', 40, 'cat_24.jpeg', NULL, '&lt;p&gt;Ketchups, Vinegar, Sauces&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(25, 3, 'Baking Essentials', 'baking-essentials', 50, 'cat_25.jpeg', NULL, '&lt;p&gt;Baking Essentials&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(26, 3, 'Honey, Jams', 'honey-jams', 60, 'cat_26.jpeg', NULL, '&lt;p&gt;Honey, Jams&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(27, 4, 'Detergents, Laundry', 'detergents-laundry', 10, 'cat_27.jpeg', NULL, '&lt;p&gt;Detergents, Laundry&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(28, 4, 'Toilet Cleaners', 'toilet-cleaners', 20, 'cat_28.jpeg', NULL, '&lt;p&gt;Toilet Cleaners&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(29, 4, 'Floor Cleaners', 'floor-cleaners', 20, 'cat_29.jpeg', NULL, '&lt;p&gt;Floor Cleaners&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(30, 4, 'Dishwash Liquid, Bar', 'dishwash-liquid-bar', 40, 'cat_30.jpeg', NULL, '&lt;p&gt;Dishwash Liquid, Bar&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(31, 4, 'Pooja Essentials', 'pooja-essentials', 50, 'cat_31.jpeg', NULL, '&lt;p&gt;Pooja Essentials&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(32, 5, 'Soaps, Bodywash', 'soaps-bodywash', 10, 'cat_32.jpeg', NULL, '&lt;p&gt;Soaps, Bodywash&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(33, 5, 'Handwash, Sanitizer', 'handwash-sanitizer', 20, 'cat_33.jpeg', NULL, '&lt;p&gt;Handwash, Sanitizer&amp;nbsp;&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(34, 5, 'Hair Care', 'hair-care', 30, 'cat_34.jpeg', NULL, '&lt;p&gt;Hair Care&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(35, 5, 'Oral Care', 'oral-care', 40, 'cat_35.jpeg', NULL, '&lt;p&gt;Oral Care&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(36, 5, 'Skin Care', 'skin-care', 50, '', NULL, '&lt;p&gt;Skin Care&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30'),
(37, 5, 'Intimate Hygiene', 'intimate-hygiene', 60, 'cat_37.jpeg', NULL, '&lt;p&gt;Intimate Hygiene&amp;nbsp;&lt;/p&gt;\n', 'Yes', 'A', '2026-01-10 08:55:30', '2026-01-10 08:55:30');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_category_map`
--

CREATE TABLE `ecomm_product_category_map` (
  `id_product` int(11) NOT NULL,
  `id_product_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_product_category_map`
--

INSERT INTO `ecomm_product_category_map` (`id_product`, `id_product_category`) VALUES
(1, 5),
(1, 35),
(2, 5),
(2, 35),
(3, 5),
(3, 35),
(4, 4),
(4, 30),
(5, 4),
(5, 27),
(6, 5),
(6, 35),
(7, 5),
(7, 35),
(8, 4),
(8, 30),
(9, 5),
(9, 33),
(10, 5),
(10, 33),
(11, 4),
(11, 27),
(12, 4),
(12, 27),
(13, 4),
(13, 27),
(14, 1),
(14, 14),
(15, 1),
(15, 14),
(16, 1),
(16, 14),
(17, 1),
(17, 14),
(18, 1),
(18, 14),
(19, 1),
(19, 14),
(20, 1),
(20, 14),
(21, 1),
(21, 14),
(22, 1),
(22, 14),
(23, 1),
(23, 14),
(24, 1),
(24, 14),
(25, 1),
(25, 14),
(26, 1),
(26, 14),
(27, 1),
(27, 14),
(28, 1),
(28, 14),
(29, 1),
(29, 14),
(30, 1),
(30, 14),
(31, 1),
(31, 14),
(32, 1),
(32, 14),
(33, 1),
(33, 14),
(34, 1),
(34, 14),
(35, 1),
(35, 14),
(36, 1),
(36, 14),
(37, 1),
(37, 14),
(38, 1),
(38, 14),
(39, 1),
(39, 14),
(40, 1),
(40, 15),
(41, 1),
(41, 15),
(42, 1),
(42, 15),
(43, 1),
(43, 15),
(44, 1),
(44, 15),
(45, 1),
(45, 15),
(46, 1),
(46, 15),
(47, 1),
(47, 15),
(48, 1),
(48, 15),
(49, 1),
(49, 15),
(50, 1),
(50, 15),
(51, 1),
(51, 15),
(52, 1),
(52, 15),
(53, 1),
(53, 15),
(54, 1),
(54, 15),
(55, 1),
(55, 15),
(56, 1),
(56, 15),
(57, 1),
(57, 15),
(58, 1),
(58, 15),
(59, 1),
(59, 8),
(60, 1),
(60, 8),
(61, 1),
(61, 8),
(62, 1),
(62, 8),
(64, 4),
(64, 30),
(65, 4),
(65, 30),
(66, 2),
(66, 20),
(67, 2),
(67, 20),
(69, 1),
(69, 10),
(70, 1),
(70, 10),
(71, 1),
(71, 10),
(72, 1),
(72, 12),
(73, 1),
(73, 12),
(74, 2),
(74, 17),
(75, 1),
(75, 12),
(76, 1),
(76, 12),
(77, 1),
(77, 8),
(78, 1),
(78, 8),
(79, 1),
(79, 12),
(80, 1),
(80, 12),
(81, 1),
(81, 12),
(82, 1),
(82, 12),
(83, 1),
(83, 12),
(84, 1),
(84, 8),
(85, 1),
(85, 8),
(89, 2),
(89, 18),
(90, 2),
(90, 18),
(91, 1),
(91, 13),
(95, 1),
(95, 13),
(96, 2),
(96, 18),
(97, 2),
(97, 18),
(98, 2),
(98, 18),
(99, 2),
(99, 18),
(100, 1),
(100, 13),
(101, 3),
(101, 26),
(102, 3),
(102, 26),
(92, 1),
(92, 13),
(93, 1),
(93, 13),
(94, 1),
(94, 13),
(68, 1),
(68, 10),
(63, 1),
(63, 8),
(88, 2),
(88, 18),
(86, 2),
(86, 18),
(87, 2),
(87, 18);

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_image`
--

CREATE TABLE `ecomm_product_image` (
  `id_product` int(11) NOT NULL,
  `image_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_inventory`
--

CREATE TABLE `ecomm_product_inventory` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `min_quantity_to_sale` int(11) NOT NULL,
  `max_quantity_to_sale` int(11) NOT NULL,
  `low_stock_lavel` int(11) NOT NULL,
  `out_of_stock_order` tinyint(4) NOT NULL DEFAULT 0,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_product_inventory`
--

INSERT INTO `ecomm_product_inventory` (`id`, `id_product`, `quantity`, `min_quantity_to_sale`, `max_quantity_to_sale`, `low_stock_lavel`, `out_of_stock_order`, `updatedOn`) VALUES
(1, 1, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(2, 2, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(3, 3, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(4, 4, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(5, 5, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(6, 6, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(7, 7, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(8, 8, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(9, 9, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(10, 10, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(11, 11, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(12, 12, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(13, 13, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(14, 14, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(15, 15, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(16, 16, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(17, 17, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(18, 18, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(19, 19, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(20, 20, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(21, 21, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(22, 22, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(23, 23, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(24, 24, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(25, 25, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(26, 26, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(27, 27, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(28, 28, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(29, 29, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(30, 30, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(31, 31, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(32, 32, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(33, 33, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(34, 34, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(35, 35, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(36, 36, 100, 1, 10, 3, 0, '2026-01-11 12:18:40'),
(37, 37, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(38, 38, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(39, 39, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(40, 40, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(41, 41, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(42, 42, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(43, 43, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(44, 44, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(45, 45, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(46, 46, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(47, 47, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(48, 48, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(49, 49, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(50, 50, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(51, 51, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(52, 52, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(53, 53, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(54, 54, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(55, 55, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(56, 56, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(57, 57, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(58, 58, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(59, 59, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(60, 60, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(61, 61, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(62, 62, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(63, 63, 100, 1, 10, 3, 0, '2026-01-11 12:22:39'),
(64, 64, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(65, 65, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(66, 66, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(67, 67, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(68, 68, 100, 1, 10, 3, 0, '2026-01-11 12:21:55'),
(69, 69, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(70, 70, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(71, 71, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(72, 72, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(73, 73, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(74, 74, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(75, 75, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(76, 76, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(77, 77, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(78, 78, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(79, 79, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(80, 80, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(81, 81, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(82, 82, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(83, 83, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(84, 84, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(85, 85, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(86, 86, 100, 1, 10, 3, 0, '2026-01-11 13:48:36'),
(87, 87, 100, 1, 10, 3, 0, '2026-01-11 13:48:49'),
(88, 88, 100, 1, 10, 3, 0, '2026-01-11 13:48:25'),
(89, 89, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(90, 90, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(91, 91, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(92, 92, 100, 1, 10, 3, 0, '2026-01-11 12:20:24'),
(93, 93, 100, 1, 10, 3, 0, '2026-01-11 12:20:42'),
(94, 94, 100, 1, 10, 3, 0, '2026-01-11 12:21:09'),
(95, 95, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(96, 96, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(97, 97, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(98, 98, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(99, 99, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(100, 100, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(101, 101, 100, 1, 10, 3, 0, '2026-01-11 12:18:41'),
(102, 102, 100, 1, 10, 3, 0, '2026-01-11 12:18:41');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_inventory_txn`
--

CREATE TABLE `ecomm_product_inventory_txn` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `txn_type` enum('C','D') NOT NULL DEFAULT 'C',
  `quantity` int(11) NOT NULL,
  `ref_txt` varchar(255) NOT NULL,
  `id_inventory` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `createdOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_product_offer_map`
--

CREATE TABLE `ecomm_product_offer_map` (
  `id_product` int(11) NOT NULL,
  `id_offer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_seo`
--

CREATE TABLE `ecomm_seo` (
  `id` int(11) NOT NULL,
  `type` enum('page','product','category','others') NOT NULL,
  `ref_id` int(11) NOT NULL,
  `ref_name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_seo`
--

INSERT INTO `ecomm_seo` (`id`, `type`, `ref_id`, `ref_name`, `title`, `keywords`, `description`) VALUES
(1, 'category', 1, 'Cooking Essentials', 'Cooking Essentials', 'Cooking Essentials', 'Cooking Essentials'),
(2, 'category', 2, 'Snacks & Breverages', 'Snacks & Breverages', 'Snacks & Breverages', 'Snacks & Breverages'),
(3, 'category', 3, 'Packaged Food', 'Packaged Food', 'Packaged Food', 'Packaged Food'),
(4, 'category', 4, 'Household Care', 'Household Care', 'Household Care', 'Household Care'),
(5, 'category', 5, 'Personal Care', 'Personal Care', 'Personal Care', 'Personal Care'),
(6, 'category', 6, 'Fruits', 'Fruits', 'Fruits', 'Fruits'),
(7, 'category', 7, 'Vegetables', 'Vegetables', 'Vegetables', 'Vegetables'),
(8, 'category', 8, 'Atta, Maida, Flours, Sooji', 'Atta, Maida, Flours, Sooji', 'Atta, Maida, Flours, Sooji', 'Atta, Maida, Flours, Sooji'),
(9, 'category', 9, 'Rice & Rice Products', 'Rice & Rice Products', 'Rice & Rice Products', 'Rice & Rice Products'),
(10, 'category', 10, 'Dal, Pulses, Soya Chunks', 'Dal, Pulses, Soya Chunks', 'Dal, Pulses, Soya Chunks', 'Dal, Pulses, Soya Chunks'),
(11, 'category', 11, 'Ghee, Oils', 'Ghee, Oils', 'Ghee, Oils', 'Ghee, Oils'),
(12, 'category', 12, 'Dry Fruits', 'Dry Fruits', 'Dry Fruits', 'Dry Fruits'),
(13, 'category', 13, 'Sugar, Salts', 'Sugar, Salts', 'Sugar, Salts', 'Sugar, Salts'),
(14, 'category', 14, 'Whole Spices', 'Whole Spices', 'Whole Spices', 'Whole Spices'),
(15, 'category', 15, 'Powdered Spices', 'Powdered Spices', 'Powdered Spices', 'Powdered Spices'),
(16, 'category', 16, 'Biscuits, Cookies, Cakes', 'Biscuits, Cookies, Cakes', 'Biscuits, Cookies, Cakes', 'Biscuits, Cookies, Cakes'),
(17, 'category', 17, 'Chips, Namkeen', 'Chips, Namkeen', 'Chips, Namkeen', 'Chips, Namkeen'),
(18, 'category', 18, 'Tea, Coffee', 'Tea, Coffee', 'Tea, Coffee', 'Tea, Coffee'),
(19, 'category', 19, 'Dairy, Bakery, Eggs', 'Dairy, Bakery, Eggs', 'Dairy, Bakery, Eggs', 'Dairy, Bakery, Eggs'),
(20, 'category', 20, 'Instant Drink Mixes', 'Instant Drink Mixes', 'Instant Drink Mixes', 'Instant Drink Mixes'),
(21, 'category', 21, 'Health Drinks', 'Health Drinks', 'Health Drinks', 'Health Drinks'),
(22, 'category', 22, 'Breakfast Essentials', 'Breakfast Essentials', 'Breakfast Essentials', 'Breakfast Essentials'),
(23, 'category', 23, 'Noodles, Pasta', 'Noodles, Pasta', 'Noodles, Pasta', 'Noodles, Pasta'),
(24, 'category', 24, 'Ketchups, Vinegar, Sauces', 'Ketchups, Vinegar, Sauces', 'Ketchups, Vinegar, Sauces', 'Ketchups, Vinegar, Sauces'),
(25, 'category', 25, 'Baking Essentials', 'Baking Essentials', 'Baking Essentials', 'Baking Essentials'),
(26, 'category', 26, 'Honey, Jams', 'Honey, Jams', 'Honey, Jams', 'Honey, Jams'),
(27, 'category', 27, 'Detergents, Laundry', 'Detergents, Laundry', 'Detergents, Laundry', 'Detergents, Laundry'),
(28, 'category', 28, 'Toilet Cleaners', 'Toilet Cleaners', 'Toilet Cleaners', 'Toilet Cleaners'),
(29, 'category', 29, 'Floor Cleaners', 'Floor Cleaners', 'Floor Cleaners', 'Floor Cleaners'),
(30, 'category', 30, 'Dishwash Liquid, Bar', 'Dishwash Liquid, Bar', 'Dishwash Liquid, Bar', 'Dishwash Liquid, Bar'),
(31, 'category', 31, 'Pooja Essentials', 'Pooja Essentials', 'Pooja Essentials', 'Pooja Essentials'),
(32, 'category', 32, 'Soaps, Bodywash', 'Soaps, Bodywash', 'Soaps, Bodywash', 'Soaps, Bodywash'),
(33, 'category', 33, 'Handwash, Sanitizer', 'Handwash, Sanitizer', 'Handwash, Sanitizer', 'Handwash, Sanitizer'),
(34, 'category', 34, 'Hair Care', 'Hair Care', 'Hair Care', 'Hair Care'),
(35, 'category', 35, 'Oral Care', 'Oral Care', 'Oral Care', 'Oral Care'),
(36, 'category', 36, 'Skin Care', 'Skin Care', 'Skin Care', 'Skin Care'),
(37, 'category', 37, 'Intimate Hygiene', 'Intimate Hygiene', 'Intimate Hygiene', 'Intimate Hygiene'),
(38, 'product', 111, 'Dabur Red Toothpaste', 'Dabur Red Toothpaste | Ayurvedic Oral Care', 'Dabur, Red, Toothpaste, Ayurvedic, Oral Care', 'Ayurvedic toothpaste enriched with natural herbs'),
(39, 'product', 112, 'Colgate Strong Teeth Toothpaste', 'Colgate Strong Teeth Toothpaste | Cavity Protection', 'Colgate, Strong Teeth, Toothpaste, Fluoride, Cavity Care', 'Fluoride toothpaste for strong teeth and cavity care'),
(40, 'product', 113, 'Colgate MaxFresh Spicy Fresh Toothpaste', 'Colgate Maxfresh Spicy Fresh Toothpaste | Long-Lasting Freshness', 'Colgate, Maxfresh, Spicy Fresh, Toothpaste, Fresh Breath', 'Toothpaste with spicy mint flavor for lasting freshness'),
(41, 'product', 114, 'Vim Dish Wash Bar', 'Vim Dish Wash Bar | Tough on Grease', 'Vim, Dish Wash, Bar, Grease Removal, Kitchen Cleaning', 'Tough grease removal with gentle care'),
(42, 'product', 115, 'Comfort Fabric Conditioner', 'Comfort Fabric Conditioner | Softness & Freshness', 'Comfort, Fabric Conditioner, Softness, Freshness, Laundry', 'Fabric conditioner for softness and long-lasting fragrance'),
(43, 'product', 116, 'Colgate Super Flexi Toothbrush (2+1)', 'Colgate Super Flexi Toothbrush 2-in-1 | Flexible Bristles for Gentle Cleaning', 'Colgate, Super Flexi, Toothbrush, 2-in-1, Oral Care', 'Flexible toothbrush with dual cleaning action'),
(44, 'product', 117, 'Colgate Super Flexi Toothbrush', 'Colgate Super Flexi Toothbrush | Comfortable Grip & Deep Cleaning', 'Colgate, Super Flexi, Toothbrush, Oral Care, Gentle Bristles', 'Toothbrush with flexible bristles for deep cleaning'),
(45, 'product', 118, 'Vim Dishwash Liquid Gel', 'Vim Dishwash Liquid Gel | Powerful Grease Removal', 'Vim, Dishwash, Liquid Gel, Grease Removal, Kitchen Cleaning', 'Liquid gel for powerful grease removal'),
(46, 'product', 119, 'Lifebuoy Total 10 Handwash', 'Lifebuoy Total 10 Handwash | Germ Protection', 'Lifebuoy, Total 10, Handwash, Germ Protection, Hygiene', 'Handwash offering 99.9% germ protection'),
(47, 'product', 120, 'Lifebuoy Powder Handwash', 'Lifebuoy Powder Handwash | Effective Hygiene Solution', 'Lifebuoy, Powder Handwash, Germ Protection, Hygiene', 'Powder handwash for effective daily hygiene'),
(48, 'product', 121, 'Surf Excel Easy Wash', 'Surf Excel Easy Wash | Tough Stain Removal', 'Surf Excel, Easy Wash, Detergent, Stain Removal, Laundry', 'Detergent for tough stain removal and bright clothes'),
(49, 'product', 122, 'Sunlight Detergent Powder', 'Sunlight Detergent Powder | Bright Clothes & Fresh Fragrance', 'Sunlight, Detergent Powder, Bright Clothes, Fresh Fragrance', 'Gentle detergent for bright clothes and freshness'),
(50, 'product', 123, 'Godrej Ezee Liquid Detergent', 'Godrej Ezee Liquid Detergent | Wool & Delicate Care', 'Godrej, Ezee, Liquid Detergent, Wool Care, Delicate Wash', 'Liquid detergent for woolens and delicate fabrics'),
(51, 'product', 124, 'Gota Jeera (Whole Cumin Seeds)', 'Gota Jeera Whole Cumin Seeds | Authentic Flavor', 'Gota Jeera, Whole Cumin, Seeds, Spice, Cooking', 'Whole cumin seeds for authentic flavor'),
(52, 'product', 125, 'Red Chilly Whole (Gota Sukno Lonka)', 'Red Chilly Whole (Gota Sukno Lonka) | Traditional Spice Heat', 'Red Chilly, Whole, Spice, Sukno Lonka, Cooking', 'Whole red chilies for traditional spice heat'),
(53, 'product', 126, 'Panchforon', 'Panchforon | Bengali Five Spice Mix', 'Panchforon, Bengali Spice, Five Spice, Cooking', 'Traditional Bengali five-spice blend'),
(54, 'product', 127, 'Clove (Lobongo)', 'Clove (Lobongo) | Aromatic Spice', 'Clove, Lobongo, Spice, Aromatic, Cooking', 'Aromatic spice for flavor and health'),
(55, 'product', 128, 'Posto (poppy Seeds)', 'Posto (Poppy Seeds) | Premium Cooking Ingredient', 'Posto, Poppy Seeds, Cooking, Premium, Nutty Flavor', 'Premium poppy seeds for cooking and flavor'),
(56, 'product', 129, 'Elichi (Green Cardamom)', 'Elichi Green Cardamom | Aromatic Pods', 'Elichi, Green Cardamom, Pods, Spice, Aromatic', 'Aromatic green cardamom pods for cooking'),
(57, 'product', 130, 'Sahi Jeera', 'Sahi Jeera | Premium Cumin Seeds', 'Sahi Jeera, Cumin, Premium, Spice, Cooking', 'Premium cumin seeds for authentic dishes'),
(58, 'product', 131, 'Big Elichi (Big Cardamon)', 'Big Elichi (Black Cardamom) | Smoky Flavor Pods', 'Big Cardamom, Black Cardamom, Smoky Flavor, Pods, Spice', 'Smoky black cardamom pods for rich flavor'),
(59, 'product', 132, 'Star Anise', 'Star Anise | Exotic Spice with Licorice Flavor', 'Star Anise, Exotic Spice, Licorice Flavor, Cooking', 'Exotic spice with licorice flavor'),
(60, 'product', 133, 'Golap papri (Rose Petal Dry)', 'Rose Petal Dry | Natural Flavoring & Garnish', 'Rose Petal Dry, Natural Flavoring, Garnish, Cooking', 'Natural dried rose petals for flavoring and garnish'),
(61, 'product', 134, 'Sada Til (white sesame seeds)', 'White Sesame Seeds | Nutty Flavor for Cooking', 'White Sesame, Seeds, Nutty Flavor, Cooking', 'Nutty white sesame seeds for cooking'),
(62, 'product', 135, 'Gol Morich (Black Pepper)', 'Black Pepper | Premium Whole Spice', 'Black Pepper, Whole Spice, Premium, Cooking', 'Premium whole black pepper spice'),
(63, 'product', 136, 'Sunrise Hing', 'Sunrise Hing | Authentic Indian Spice', 'Sunrise, Hing, Spice, Authentic, Cooking', 'Authentic Indian hing for cooking'),
(64, 'product', 137, 'Sunrise Kasuri Methi', 'Sunrise Kasuri Methi | Dried Fenugreek Leaves', 'Sunrise, Kasuri Methi, Fenugreek, Dried Leaves, Spice', 'Dried fenugreek leaves for authentic flavor'),
(65, 'product', 138, 'Magaj (Melon Seeds)', 'Magaj | Nutty Seeds for Sweets', 'Magaj, Nutty Seeds, Sweets, Cooking', 'Nutty seeds used in sweets'),
(66, 'product', 139, 'Mouri (Fennel Seeds)', 'Mouri (Fennel Seeds) | Aromatic Digestive Spice', 'Mouri, Fennel Seeds, Aromatic, Digestive, Spice', 'Aromatic fennel seeds for digestion'),
(67, 'product', 140, 'Methi (Fenugreek seeds)', 'Methi (Fenugreek Seeds) | Healthy Cooking Spice', 'Methi, Fenugreek Seeds, Healthy, Cooking, Spice', 'Healthy fenugreek seeds for cooking'),
(68, 'product', 141, 'Dalchini (Cinnamon)', 'Dalchini (Cinnamon) | Aromatic Bark Spice', 'Dalchini, Cinnamon, Bark, Aromatic, Spice', 'Aromatic cinnamon bark spice'),
(69, 'product', 142, 'Dhania (Coriander seeds)', 'Dhania (Coriander Seeds) | Fresh Flavor for Cooking', 'Dhania, Coriander Seeds, Fresh Flavor, Cooking', 'Fresh coriander seeds for cooking'),
(70, 'product', 143, 'Radhuni', 'Radhuni | Traditional Bengali Spice', 'Radhuni, Bengali Spice, Traditional, Cooking', 'Traditional Bengali spice for authentic dishes'),
(71, 'product', 144, 'Tejpata (Bay Leaf)', 'Tejpata (Bay Leaf) | Aromatic Cooking Leaf', 'Tejpata, Bay Leaf, Aromatic, Cooking', 'Aromatic bay leaves for cooking'),
(72, 'product', 145, 'Jaifal (Nutmeg)', 'Jaifal (Nutmeg) | Warm Aromatic Spice', 'Jaifal, Nutmeg, Warm, Aromatic, Spice', 'Warm aromatic nutmeg spice'),
(73, 'product', 146, 'Kalojeera', 'Kalojeera (Nigella Seeds) | Flavorful Spice', 'Kalojeera, Nigella Seeds, Flavorful, Cooking', 'Flavorful nigella seeds for cooking'),
(74, 'product', 147, 'Jayatri (Mace)', 'Jayatri (Mace) | Aromatic Spice for Curries', 'Jayatri, Mace, Aromatic, Curries, Spice', 'Aromatic mace spice for curries'),
(75, 'product', 148, 'Shahi Morich', 'Shahi Morich | Premium Black Peppercorns', 'Shahi Morich, Black Peppercorns, Premium, Spice', 'Premium black peppercorns for cooking'),
(76, 'product', 149, 'Sada Sorisha (white mustard seeds)', 'Sada Sorisha (Mustard Seeds) | Authentic Indian Spice', 'Sada Sorisha, Mustard Seeds, Authentic, Indian Spice', 'Authentic mustard seeds for Indian dishes'),
(77, 'product', 1, 'Dabur Red Toothpaste', 'Dabur Red Toothpaste | Ayurvedic Oral Care', 'Dabur, Red, Toothpaste, Ayurvedic, Oral Care', 'Ayurvedic toothpaste enriched with natural herbs'),
(78, 'product', 2, 'Colgate Strong Teeth Toothpaste', 'Colgate Strong Teeth Toothpaste | Cavity Protection', 'Colgate, Strong Teeth, Toothpaste, Fluoride, Cavity Care', 'Fluoride toothpaste for strong teeth and cavity care'),
(79, 'product', 3, 'Colgate MaxFresh Spicy Fresh Toothpaste', 'Colgate Maxfresh Spicy Fresh Toothpaste | Long-Lasting Freshness', 'Colgate, Maxfresh, Spicy Fresh, Toothpaste, Fresh Breath', 'Toothpaste with spicy mint flavor for lasting freshness'),
(80, 'product', 4, 'Vim Dish Wash Bar', 'Vim Dish Wash Bar | Tough on Grease', 'Vim, Dish Wash, Bar, Grease Removal, Kitchen Cleaning', 'Tough grease removal with gentle care'),
(81, 'product', 5, 'Comfort Fabric Conditioner', 'Comfort Fabric Conditioner | Softness & Freshness', 'Comfort, Fabric Conditioner, Softness, Freshness, Laundry', 'Fabric conditioner for softness and long-lasting fragrance'),
(82, 'product', 6, 'Colgate Super Flexi Toothbrush (2+1)', 'Colgate Super Flexi Toothbrush 2-in-1 | Flexible Bristles for Gentle Cleaning', 'Colgate, Super Flexi, Toothbrush, 2-in-1, Oral Care', 'Flexible toothbrush with dual cleaning action'),
(83, 'product', 7, 'Colgate Super Flexi Toothbrush', 'Colgate Super Flexi Toothbrush | Comfortable Grip & Deep Cleaning', 'Colgate, Super Flexi, Toothbrush, Oral Care, Gentle Bristles', 'Toothbrush with flexible bristles for deep cleaning'),
(84, 'product', 8, 'Vim Dishwash Liquid Gel', 'Vim Dishwash Liquid Gel | Powerful Grease Removal', 'Vim, Dishwash, Liquid Gel, Grease Removal, Kitchen Cleaning', 'Liquid gel for powerful grease removal'),
(85, 'product', 9, 'Lifebuoy Total 10 Handwash', 'Lifebuoy Total 10 Handwash | Germ Protection', 'Lifebuoy, Total 10, Handwash, Germ Protection, Hygiene', 'Handwash offering 99.9% germ protection'),
(86, 'product', 10, 'Lifebuoy Powder Handwash', 'Lifebuoy Powder Handwash | Effective Hygiene Solution', 'Lifebuoy, Powder Handwash, Germ Protection, Hygiene', 'Powder handwash for effective daily hygiene'),
(87, 'product', 11, 'Surf Excel Easy Wash', 'Surf Excel Easy Wash | Tough Stain Removal', 'Surf Excel, Easy Wash, Detergent, Stain Removal, Laundry', 'Detergent for tough stain removal and bright clothes'),
(88, 'product', 12, 'Sunlight Detergent Powder', 'Sunlight Detergent Powder | Bright Clothes & Fresh Fragrance', 'Sunlight, Detergent Powder, Bright Clothes, Fresh Fragrance', 'Gentle detergent for bright clothes and freshness'),
(89, 'product', 13, 'Godrej Ezee Liquid Detergent', 'Godrej Ezee Liquid Detergent | Wool & Delicate Care', 'Godrej, Ezee, Liquid Detergent, Wool Care, Delicate Wash', 'Liquid detergent for woolens and delicate fabrics'),
(90, 'product', 14, 'Gota Jeera (Whole Cumin Seeds)', 'Gota Jeera Whole Cumin Seeds | Authentic Flavor', 'Gota Jeera, Whole Cumin, Seeds, Spice, Cooking', 'Whole cumin seeds for authentic flavor'),
(91, 'product', 15, 'Red Chilly Whole (Gota Sukno Lonka)', 'Red Chilly Whole (Gota Sukno Lonka) | Traditional Spice Heat', 'Red Chilly, Whole, Spice, Sukno Lonka, Cooking', 'Whole red chilies for traditional spice heat'),
(92, 'product', 16, 'Panchforon', 'Panchforon | Bengali Five Spice Mix', 'Panchforon, Bengali Spice, Five Spice, Cooking', 'Traditional Bengali five-spice blend'),
(93, 'product', 17, 'Clove (Lobongo)', 'Clove (Lobongo) | Aromatic Spice', 'Clove, Lobongo, Spice, Aromatic, Cooking', 'Aromatic spice for flavor and health'),
(94, 'product', 18, 'Posto (poppy Seeds)', 'Posto (Poppy Seeds) | Premium Cooking Ingredient', 'Posto, Poppy Seeds, Cooking, Premium, Nutty Flavor', 'Premium poppy seeds for cooking and flavor'),
(95, 'product', 19, 'Elichi (Green Cardamom)', 'Elichi Green Cardamom | Aromatic Pods', 'Elichi, Green Cardamom, Pods, Spice, Aromatic', 'Aromatic green cardamom pods for cooking'),
(96, 'product', 20, 'Sahi Jeera', 'Sahi Jeera | Premium Cumin Seeds', 'Sahi Jeera, Cumin, Premium, Spice, Cooking', 'Premium cumin seeds for authentic dishes'),
(97, 'product', 21, 'Big Elichi (Big Cardamon)', 'Big Elichi (Black Cardamom) | Smoky Flavor Pods', 'Big Cardamom, Black Cardamom, Smoky Flavor, Pods, Spice', 'Smoky black cardamom pods for rich flavor'),
(98, 'product', 22, 'Star Anise', 'Star Anise | Exotic Spice with Licorice Flavor', 'Star Anise, Exotic Spice, Licorice Flavor, Cooking', 'Exotic spice with licorice flavor'),
(99, 'product', 23, 'Golap papri (Rose Petal Dry)', 'Rose Petal Dry | Natural Flavoring & Garnish', 'Rose Petal Dry, Natural Flavoring, Garnish, Cooking', 'Natural dried rose petals for flavoring and garnish'),
(100, 'product', 24, 'Sada Til (white sesame seeds)', 'White Sesame Seeds | Nutty Flavor for Cooking', 'White Sesame, Seeds, Nutty Flavor, Cooking', 'Nutty white sesame seeds for cooking'),
(101, 'product', 25, 'Gol Morich (Black Pepper)', 'Black Pepper | Premium Whole Spice', 'Black Pepper, Whole Spice, Premium, Cooking', 'Premium whole black pepper spice'),
(102, 'product', 26, 'Sunrise Hing', 'Sunrise Hing | Authentic Indian Spice', 'Sunrise, Hing, Spice, Authentic, Cooking', 'Authentic Indian hing for cooking'),
(103, 'product', 27, 'Sunrise Kasuri Methi', 'Sunrise Kasuri Methi | Dried Fenugreek Leaves', 'Sunrise, Kasuri Methi, Fenugreek, Dried Leaves, Spice', 'Dried fenugreek leaves for authentic flavor'),
(104, 'product', 28, 'Magaj (Melon Seeds)', 'Magaj | Nutty Seeds for Sweets', 'Magaj, Nutty Seeds, Sweets, Cooking', 'Nutty seeds used in sweets'),
(105, 'product', 29, 'Mouri (Fennel Seeds)', 'Mouri (Fennel Seeds) | Aromatic Digestive Spice', 'Mouri, Fennel Seeds, Aromatic, Digestive, Spice', 'Aromatic fennel seeds for digestion'),
(106, 'product', 30, 'Methi (Fenugreek seeds)', 'Methi (Fenugreek Seeds) | Healthy Cooking Spice', 'Methi, Fenugreek Seeds, Healthy, Cooking, Spice', 'Healthy fenugreek seeds for cooking'),
(107, 'product', 31, 'Dalchini (Cinnamon)', 'Dalchini (Cinnamon) | Aromatic Bark Spice', 'Dalchini, Cinnamon, Bark, Aromatic, Spice', 'Aromatic cinnamon bark spice'),
(108, 'product', 32, 'Dhania (Coriander seeds)', 'Dhania (Coriander Seeds) | Fresh Flavor for Cooking', 'Dhania, Coriander Seeds, Fresh Flavor, Cooking', 'Fresh coriander seeds for cooking'),
(109, 'product', 33, 'Radhuni', 'Radhuni | Traditional Bengali Spice', 'Radhuni, Bengali Spice, Traditional, Cooking', 'Traditional Bengali spice for authentic dishes'),
(110, 'product', 34, 'Tejpata (Bay Leaf)', 'Tejpata (Bay Leaf) | Aromatic Cooking Leaf', 'Tejpata, Bay Leaf, Aromatic, Cooking', 'Aromatic bay leaves for cooking'),
(111, 'product', 35, 'Jaifal (Nutmeg)', 'Jaifal (Nutmeg) | Warm Aromatic Spice', 'Jaifal, Nutmeg, Warm, Aromatic, Spice', 'Warm aromatic nutmeg spice'),
(112, 'product', 36, 'Kalojeera', 'Kalojeera (Nigella Seeds) | Flavorful Spice', 'Kalojeera, Nigella Seeds, Flavorful, Cooking', 'Flavorful nigella seeds for cooking'),
(113, 'product', 37, 'Jayatri (Mace)', 'Jayatri (Mace) | Aromatic Spice for Curries', 'Jayatri, Mace, Aromatic, Curries, Spice', 'Aromatic mace spice for curries'),
(114, 'product', 38, 'Shahi Morich', 'Shahi Morich | Premium Black Peppercorns', 'Shahi Morich, Black Peppercorns, Premium, Spice', 'Premium black peppercorns for cooking'),
(115, 'product', 39, 'Sada Sorisha (white mustard seeds)', 'Sada Sorisha (Mustard Seeds) | Authentic Indian Spice', 'Sada Sorisha, Mustard Seeds, Authentic, Indian Spice', 'Authentic mustard seeds for Indian dishes'),
(116, 'product', 40, 'Sunrise Haldi Powder', 'Sunrise Haldi Powder | Pure Turmeric Spice', 'Sunrise, Haldi Powder, Turmeric, Pure, Spice', 'Pure turmeric powder for cooking'),
(117, 'product', 41, 'Sunrise Fish Masala', 'Sunrise Fish Masala | Authentic Bengali Blend', 'Sunrise, Fish Masala, Bengali Blend, Cooking', 'Authentic Bengali fish masala blend'),
(118, 'product', 42, 'Sunrise Mustard Powder', 'Sunrise Mustard Powder | Traditional Mustard Spice', 'Sunrise, Mustard Powder, Traditional, Spice', 'Traditional mustard powder for cooking'),
(119, 'product', 43, 'Sunrise Meat Masala Powder', 'Sunrise Meat Masala Powder 7g | Rich Flavor for Curries', 'Sunrise, Meat Masala, Rich Flavor, Curries', 'Rich meat masala spice for curries'),
(120, 'product', 44, 'Sunrise Garam Masala Powder', 'Sunrise Garam Masala Powder | Classic Indian Spice Blend', 'Sunrise, Garam Masala, Classic, Indian Spice Blend', 'Classic Indian garam masala blend'),
(121, 'product', 45, 'Sunrise Shahi Garam Masala Powder', 'Sunrise Sahi Garam Masala Powder 3g | Premium Spice Mix', 'Sunrise, Sahi Garam Masala, Premium, Spice Mix', 'Premium sahi garam masala spice mix'),
(122, 'product', 46, 'Sunrise Chana Masala Powder', 'Sunrise Chana Masala Powder | Flavorful Chickpea Spice', 'Sunrise, Chana Masala, Chickpea, Flavorful, Spice', 'Flavorful chana masala spice for chickpeas'),
(123, 'product', 47, 'Sunrise Kashmiri Mirch Powder', 'Sunrise Kashmiri Mirch Powder 10g | Mild Red Chili Flavor', 'Sunrise, Kashmiri Mirch, Mild, Red Chili, Spice', 'Mild Kashmiri red chili powder'),
(124, 'product', 48, 'Sunrise Black Pepper Powder', 'Sunrise Black Pepper Powder | Fresh Ground Spice', 'Sunrise, Black Pepper Powder, Fresh Ground, Spice', 'Fresh ground black pepper powder'),
(125, 'product', 49, 'Sunrise Chicken Masala Powder', 'Sunrise Chicken Masala Powder | Flavorful Chicken Curry Blend', 'Sunrise, Chicken Masala, Flavorful, Curry Blend', 'Flavorful chicken masala spice blend'),
(126, 'product', 50, 'Sunrise Red Chilly Powder', 'Sunrise Red Chilly Powder | Authentic Spice Heat', 'Sunrise, Red Chilly Powder, Authentic, Spice Heat', 'Authentic red chili powder for cooking'),
(127, 'product', 51, 'Sunrise Sabji Masala Powder', 'Sunrise Sabji Masala Powder | Everyday Vegetable Spice Mix', 'Sunrise, Sabji Masala, Everyday, Vegetable, Spice Mix', 'Everyday vegetable masala spice mix'),
(128, 'product', 52, 'Sunrise Jeera Powder', 'Sunrise Jeera Powder | Ground Cumin Spice', 'Sunrise, Jeera Powder, Ground Cumin, Spice', 'Ground cumin powder for cooking'),
(129, 'product', 53, 'Sunrise Garam Masala Powder', 'Sunrise Garam Masala Powder 7g | Classic Indian Spice Blend', 'Sunrise, Garam Masala, Classic, Indian Spice Blend', 'Classic garam masala blend in 7g pack'),
(130, 'product', 54, 'Sunrise Dhania Powder', 'Sunrise Dhania Powder | Ground Coriander Spice', 'Sunrise, Dhania Powder, Ground Coriander, Spice', 'Ground coriander powder for cooking'),
(131, 'product', 55, 'Sunrise Shahi Garam Masala Powder', 'Sunrise Shahi Garam Masala Powder | Premium Spice Blend', 'Sunrise, Shahi Garam Masala, Premium, Spice Blend', 'Premium shahi garam masala blend'),
(132, 'product', 56, 'Sunrise Chat Masala', 'Sunrise Chat Masala | Tangy Spice Mix', 'Sunrise, Chat Masala, Tangy, Spice Mix', 'Tangy chat masala spice mix'),
(133, 'product', 57, 'Sunrise Meat Masala', 'Sunrise Meat Masala Powder | Rich Flavor for Meat Curries', 'Sunrise, Meat Masala, Rich Flavor, Curries', 'Rich meat masala spice blend'),
(134, 'product', 58, 'Maggi Masala', 'Maggi Masala | Instant Noodles Spice Mix', 'Maggi, Masala, Instant Noodles, Spice Mix', 'Instant noodles masala spice mix'),
(135, 'product', 59, 'Ganesh Atta', 'Ganesh Atta | Premium Wheat Flour', 'Ganesh, Atta, Wheat Flour, Premium', 'Premium wheat flour for chapatis'),
(136, 'product', 60, 'Ganesh Maida', 'Ganesh Maida | Refined Flour for Baking', 'Ganesh, Maida, Refined Flour, Baking', 'Refined flour for baking'),
(137, 'product', 61, 'Joygopal Atta', 'Joygopal Atta | Quality Wheat Flour', 'Joygopal, Atta, Wheat Flour, Quality', 'Quality wheat flour for cooking'),
(138, 'product', 62, 'Fortune Chakki Fresh Atta', 'Fortune Chakki Fresh Atta 1kg | Stone-Ground Wheat Flour', 'Fortune, Chakki Fresh Atta, Stone-Ground, Wheat Flour', 'Stone-ground whole wheat flour 1kg'),
(139, 'product', 63, 'Fortune Chakki Fresh Atta', 'Fortune Chakki Fresh Atta | Fresh Whole Wheat Flour', 'Fortune, Chakki Fresh Atta, Whole Wheat, Fresh', 'Fresh whole wheat flour'),
(140, 'product', 64, 'Stainless Steel Scrubber', 'Stainless Steel Scrubber | Tough Cleaning Tool', 'Stainless Steel, Scrubber, Tough, Cleaning Tool', 'Tough stainless steel scrubber for cleaning'),
(141, 'product', 65, 'Scotch Brite', 'Scotch Brite | Household Cleaning Pad', 'Scotch Brite, Cleaning Pad, Household', 'Household cleaning pad'),
(142, 'product', 66, 'Rasna', 'Rasna | Instant Drink Mix', 'Rasna, Instant Drink, Mix, Beverage', 'Instant drink mix for refreshment'),
(143, 'product', 67, 'Glucon D Tangy Orange', 'Glucon-D Tangy | Instant Energy Drink', 'Glucon-D, Tangy, Instant Energy, Drink', 'Tangy instant energy drink'),
(144, 'product', 68, 'Nutrela Soya Chunks', 'Nutrela Soya Chunks | Protein-Rich Meat Substitute', 'Nutrela, Soya Chunks, Protein, Meat Substitute', 'Protein-rich soya chunks'),
(145, 'product', 69, 'Nutrela Soya Chunks', 'Nutrela Soya Chunks 1kg | High Protein Chunks', 'Nutrela, Soya Chunks, Protein, High, 1kg', 'High protein soya chunks 1kg pack'),
(146, 'product', 70, 'Nutrela Mini Soya Chunks', 'Nutrela Mini Soya Chunks | Small Protein-Rich Chunks', 'Nutrela, Mini Soya Chunks, Protein, Small', 'Small protein-rich soya chunks'),
(147, 'product', 71, 'Fortune Soya Chunks', 'Fortune Soya Chunks | Nutritious Protein Chunks', 'Fortune, Soya Chunks, Nutritious, Protein', 'Nutritious protein-rich soya chunks'),
(148, 'product', 72, 'Almond', 'Almond | Premium Dry Fruit', 'Almond, Dry Fruit, Premium, Healthy', 'Premium quality almonds'),
(149, 'product', 73, 'Khejur', 'Khejur | Natural Dates', 'Khejur, Dates, Natural, Sweet', 'Natural sweet dates'),
(150, 'product', 74, 'Potato Chips', 'Potato Chips | Crunchy Snack', 'Potato Chips, Crunchy, Snack, Food', 'Crunchy potato chips snack'),
(151, 'product', 75, 'Aamsotto', 'Aamsotto | Traditional Mango Sweet', 'Aamsotto, Mango Sweet, Traditional', 'Traditional mango sweet (aamsotto)'),
(152, 'product', 76, 'Lal Badam (Peanut)', 'Lal Badam Peanut | Crunchy Peanuts', 'Peanut, Lal Badam, Crunchy, Snack', 'Crunchy roasted peanuts'),
(153, 'product', 77, 'Ganesh Sattu', 'Ganesh Sattu 500gm | Nutritious Flour', 'Ganesh, Sattu, Nutritious, Flour, 500gm', 'Nutritious sattu flour 500gm'),
(154, 'product', 78, 'Ganesh Sattu', 'Ganesh Sattu 200gm | Healthy Protein Flour', 'Ganesh, Sattu, Healthy, Protein, Flour, 200gm', 'Healthy protein-rich sattu flour 200gm'),
(155, 'product', 79, 'Kismis', 'Kismis | Premium Raisins', 'Kismis, Raisins, Premium, Dry Fruit', 'Premium raisins'),
(156, 'product', 80, 'Kismis', 'Kismis 250 | Quality Raisins', 'Kismis, Raisins, Quality, 250gm', 'Quality raisins 250gm pack'),
(157, 'product', 81, 'Kismis', 'Kismis 500 | Bulk Raisins', 'Kismis, Raisins, Bulk, 500gm', 'Bulk raisins 500gm pack'),
(158, 'product', 82, 'Kaju', 'Kaju | Premium Cashews', 'Kaju, Cashews, Premium, Dry Fruit', 'Premium cashews'),
(159, 'product', 83, 'Kaju Split', 'Kaju Split | Split Cashews', 'Kaju Split, Cashews, Split, Dry Fruit', 'Split cashews for cooking'),
(160, 'product', 84, 'Ganesh Sooji', 'Ganesh Sooji | Semolina Flour', 'Ganesh, Sooji, Semolina, Flour', 'Semolina flour for cooking'),
(161, 'product', 85, 'Besan Loose', 'Besan Loose | Gram Flour', 'Besan, Gram Flour, Loose', 'Loose gram flour for cooking'),
(162, 'product', 86, 'TATA tea gold 250gm', 'Tata Tea Gold 250gm | Premium Tea Blend', 'Tata Tea Gold, Premium, Tea Blend, 250gm', 'Premium tea blend 250gm'),
(163, 'product', 87, 'TATA tea gold 500gm', 'Tata Tea Gold 500gm | Rich Tea Blend', 'Tata Tea Gold, Rich, Tea Blend, 500gm', 'Rich tea blend 500gm'),
(164, 'product', 88, 'TATA tea gold 100g', 'Tata Tea Gold 100gm | Quality Tea Blend', 'Tata Tea Gold, Quality, Tea Blend, 100gm', 'Quality tea blend 100gm'),
(165, 'product', 89, 'Nescafe', 'Nescafe 10 | Instant Coffee Sachet', 'Nescafe, Instant Coffee, Sachet, 10', 'Instant coffee sachet'),
(166, 'product', 90, 'Nescafe classic', 'Nescafe Classic 25gm | Instant Coffee Jar', 'Nescafe Classic, Instant Coffee, 25gm', 'Instant coffee classic 25gm jar'),
(167, 'product', 91, 'Black Salt', 'Black Salt | Authentic Indian Salt', 'Black Salt, Authentic, Indian Salt', 'Authentic Indian black salt'),
(168, 'product', 92, 'TATA salt', 'Tata Salt 1kg | Iodized Salt', 'Tata Salt, Iodized, Pure, 1kg', 'Pure iodized salt 1kg'),
(169, 'product', 93, 'TATA salt', 'Tata Salt 500gm | Pure Iodized Salt', 'Tata Salt, Iodized, Pure, 500gm', 'Pure iodized salt 500gm'),
(170, 'product', 94, 'Sugar M', 'Sugar M | Premium Sugar', 'Sugar M, Premium, Refined, Sweetener', 'Premium refined sugar'),
(171, 'product', 95, 'Sugar M', 'Sugar M 500gm | Refined Sugar', 'Sugar M, Refined, Sweetener, 500gm', 'Refined sugar 500gm pack'),
(172, 'product', 96, 'Amulspray', 'Amulspray 100gm | Infant Milk Powder', 'Amulspray, Infant Milk Powder, 100gm', 'Infant milk powder 100gm'),
(173, 'product', 97, 'Amulspray', 'Amulspray 200gm | Baby Milk Powder', 'Amulspray, Baby Milk Powder, 200gm', 'Baby milk powder 200gm'),
(174, 'product', 98, 'Amulspray', 'Amulspray 500gm | Milk Powder for Infants', 'Amulspray, Milk Powder, Infant, 500gm', 'Infant milk powder 500gm'),
(175, 'product', 99, 'Brooke bond Taaza', 'Brooke Bond Taza | Strong Tea Blend', 'Brooke Bond, Taza, Strong, Tea Blend', 'Strong tea blend'),
(176, 'product', 100, 'Rock Salt', 'Rock Salt | Natural Mineral Salt', 'Rock Salt, Natural, Mineral, Salt', 'Natural mineral rock salt'),
(177, 'product', 101, 'Dabur Honey', 'Dabur Honey | Pure Natural Honey', 'Dabur, Honey, Pure, Natural', 'Pure natural honey'),
(178, 'product', 102, 'Saffola Honey Sundarbans', 'Saffola Honey Sundarbans | Organic Sundarbans Honey', 'Saffola, Honey, Sundarbans, Organic', 'Organic Sundarbans honey'),
(179, 'page', 1, 'About Us Mobile', 'About Us Mobile', 'About Us Mobile', 'About Us Mobile'),
(180, 'page', 2, 'Refund Policy Mobile', 'Refund Policy Mobile', 'Refund Policy Mobile', 'Refund Policy Mobile'),
(181, 'page', 3, 'Privacy Policy Mobile', 'Privacy Policy', 'Privacy Policy', 'Privacy Policy'),
(182, 'page', 4, 'Terms And Conditions Mobile', 'Terms And Conditions ', 'Terms And Conditions ', 'Terms And Conditions ');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_static_content_block`
--

CREATE TABLE `ecomm_static_content_block` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `is_removeable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedOn` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_users`
--

CREATE TABLE `ecomm_users` (
  `id` int(11) NOT NULL,
  `id_user_cat` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(24) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'P',
  `createdOn` datetime NOT NULL,
  `updateOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_users`
--

INSERT INTO `ecomm_users` (`id`, `id_user_cat`, `name`, `email`, `password`, `phone`, `status`, `createdOn`, `updateOn`) VALUES
(1, 1, 'Bidyabrata Biswas', 'bidyabrata1812@gmail.com', '123456', '8777423674', 'A', '2021-07-01 22:59:22', '2021-07-01 22:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `ecomm_user_category`
--

CREATE TABLE `ecomm_user_category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `landing_page` varchar(45) NOT NULL,
  `status` enum('A','P','D') NOT NULL DEFAULT 'A',
  `createdOn` datetime NOT NULL,
  `updatedOn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `ecomm_user_category`
--

INSERT INTO `ecomm_user_category` (`id`, `name`, `landing_page`, `status`, `createdOn`, `updatedOn`) VALUES
(1, 'Super Admin', 'dashbaord', 'A', '2021-07-02 12:42:00', '2021-07-02 12:42:52'),
(2, 'Admin', 'dashboard', 'A', '2021-07-02 12:43:30', '2021-07-02 12:43:30'),
(3, 'Content Manager', 'dashboard', 'A', '2021-07-02 12:43:30', '2021-07-02 12:43:30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ecomm_app_menus`
--
ALTER TABLE `ecomm_app_menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_app_menu_user_cat_map`
--
ALTER TABLE `ecomm_app_menu_user_cat_map`
  ADD KEY `id_user_category` (`id_user_category`),
  ADD KEY `id_menu` (`id_menu`);

--
-- Indexes for table `ecomm_carts`
--
ALTER TABLE `ecomm_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_catelog_offer`
--
ALTER TABLE `ecomm_catelog_offer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_customers`
--
ALTER TABLE `ecomm_customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQUE_EMAIL` (`email_address`),
  ADD UNIQUE KEY `UNIQUE_PHONE` (`phone`);

--
-- Indexes for table `ecomm_customers_address`
--
ALTER TABLE `ecomm_customers_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_home_banner`
--
ALTER TABLE `ecomm_home_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_orders`
--
ALTER TABLE `ecomm_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_order_items`
--
ALTER TABLE `ecomm_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_page_system`
--
ALTER TABLE `ecomm_page_system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_products`
--
ALTER TABLE `ecomm_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `SKU_UNIQUE` (`sku`);

--
-- Indexes for table `ecomm_product_brands`
--
ALTER TABLE `ecomm_product_brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_product_category`
--
ALTER TABLE `ecomm_product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_product_image`
--
ALTER TABLE `ecomm_product_image`
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `ecomm_product_inventory`
--
ALTER TABLE `ecomm_product_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `ecomm_product_inventory_txn`
--
ALTER TABLE `ecomm_product_inventory_txn`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_product_offer_map`
--
ALTER TABLE `ecomm_product_offer_map`
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_offer` (`id_offer`);

--
-- Indexes for table `ecomm_seo`
--
ALTER TABLE `ecomm_seo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `ecomm_static_content_block`
--
ALTER TABLE `ecomm_static_content_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ecomm_users`
--
ALTER TABLE `ecomm_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `ecomm_user_category`
--
ALTER TABLE `ecomm_user_category`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ecomm_app_menus`
--
ALTER TABLE `ecomm_app_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ecomm_carts`
--
ALTER TABLE `ecomm_carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecomm_catelog_offer`
--
ALTER TABLE `ecomm_catelog_offer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecomm_customers`
--
ALTER TABLE `ecomm_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecomm_customers_address`
--
ALTER TABLE `ecomm_customers_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ecomm_home_banner`
--
ALTER TABLE `ecomm_home_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ecomm_orders`
--
ALTER TABLE `ecomm_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ecomm_order_items`
--
ALTER TABLE `ecomm_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ecomm_page_system`
--
ALTER TABLE `ecomm_page_system`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ecomm_products`
--
ALTER TABLE `ecomm_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `ecomm_product_brands`
--
ALTER TABLE `ecomm_product_brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ecomm_product_category`
--
ALTER TABLE `ecomm_product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `ecomm_product_inventory`
--
ALTER TABLE `ecomm_product_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `ecomm_product_inventory_txn`
--
ALTER TABLE `ecomm_product_inventory_txn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecomm_seo`
--
ALTER TABLE `ecomm_seo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `ecomm_static_content_block`
--
ALTER TABLE `ecomm_static_content_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ecomm_users`
--
ALTER TABLE `ecomm_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ecomm_user_category`
--
ALTER TABLE `ecomm_user_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ecomm_product_image`
--
ALTER TABLE `ecomm_product_image`
  ADD CONSTRAINT `ecomm_product_image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `ecomm_products` (`id`);

--
-- Constraints for table `ecomm_product_inventory`
--
ALTER TABLE `ecomm_product_inventory`
  ADD CONSTRAINT `ecomm_product_inventory_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `ecomm_products` (`id`);

--
-- Constraints for table `ecomm_product_offer_map`
--
ALTER TABLE `ecomm_product_offer_map`
  ADD CONSTRAINT `ecomm_product_offer_map_ibfk_1` FOREIGN KEY (`id_offer`) REFERENCES `ecomm_catelog_offer` (`id`),
  ADD CONSTRAINT `ecomm_product_offer_map_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `ecomm_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
