-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 05, 2025 at 01:50 AM
-- Server version: 10.5.28-MariaDB-cll-lve
-- PHP Version: 8.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supersof_monkeybeanies`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('superadmin','marketing','sale') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 'sabeer@developer.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', 'superadmin', NULL, NULL),
(2, 'admin@monkeybeanies.com', '$2y$10$V4knKtxeWWk8P6YMqkOOPOZCteIoF9yERt/ow9i.iQbItayrx7Ww.', 'superadmin', '2025-02-19 23:32:47', '2025-02-19 23:32:47'),
(3, 'sales@monkeybeanies.com', '$2y$10$WZ.NQEOChPtdhEYS.lvJ8.TFVA2kc3o0KRaycpjzPFSWHD6tY9kX6', 'sale', NULL, NULL),
(4, 'marketing@monkeybeanies.com', '$2y$10$WZ.NQEOChPtdhEYS.lvJ8.TFVA2kc3o0KRaycpjzPFSWHD6tY9kX6', 'marketing', '2025-02-03 11:40:19', '2025-02-03 11:40:19'),
(5, 'comptabilite@monkeybeanies.com', '$2y$10$WZ.NQEOChPtdhEYS.lvJ8.TFVA2kc3o0KRaycpjzPFSWHD6tY9kX6', 'marketing', '2025-02-03 11:40:19', '2025-02-03 11:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `authorizedotnet_logs`
--

CREATE TABLE `authorizedotnet_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `name_of_card` varchar(255) DEFAULT NULL,
  `response_code` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `auth_id` varchar(255) DEFAULT NULL,
  `message_code` varchar(255) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `printing_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `beanie_type` int(11) NOT NULL,
  `is_pompom` int(11) DEFAULT NULL,
  `printing_price` decimal(8,2) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `delivery_price` decimal(8,2) NOT NULL,
  `pompom_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `color_id`, `printing_id`, `quantity`, `beanie_type`, `is_pompom`, `printing_price`, `product_price`, `delivery_price`, `pompom_price`, `created_at`, `updated_at`) VALUES
(91, 38, 1, 2, 2, 12, 1, 0, 6.50, 13.00, 0.00, 0.00, '2025-02-14 00:18:47', '2025-02-14 00:18:47'),
(92, 38, 1, 11, 2, 12, 1, 0, 6.50, 13.00, 0.00, 0.00, '2025-02-14 00:22:46', '2025-02-14 00:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `cart_artwork`
--

CREATE TABLE `cart_artwork` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `artwork_type` int(11) NOT NULL,
  `artwork_dataText` text DEFAULT NULL,
  `artwork_dataImage` text DEFAULT NULL,
  `patch_length` decimal(8,2) NOT NULL,
  `patch_height` decimal(8,2) NOT NULL,
  `font_style` varchar(255) NOT NULL,
  `num_of_imprint` int(11) NOT NULL,
  `imprint_color` text NOT NULL,
  `leathercolor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_artwork`
--

INSERT INTO `cart_artwork` (`id`, `cart_id`, `artwork_type`, `artwork_dataText`, `artwork_dataImage`, `patch_length`, `patch_height`, `font_style`, `num_of_imprint`, `imprint_color`, `leathercolor`, `created_at`, `updated_at`) VALUES
(13, 91, 1, 'null', 'CustomerArtworkImages/N4ngXqw4l4dvdQkHeKEMyH7U48NQimURXKlty3qT.jpg', 2.00, 2.00, 'Calligraffitti', 1, '[\"3433\"]', NULL, '2025-02-14 00:18:47', '2025-02-14 00:18:47'),
(14, 92, 1, 'null', 'CustomerArtworkImages/78nbOdi3lFIhcFC9CwRafYypbcSn5PsMQjK72Wer.jpg', 2.00, 2.00, 'Aldrich', 1, '[\"6723\"]', NULL, '2025-02-14 00:22:46', '2025-02-14 00:22:46');

-- --------------------------------------------------------

--
-- Table structure for table `component_embroidery_color`
--

CREATE TABLE `component_embroidery_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `color_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `component_product_color`
--

CREATE TABLE `component_product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `color_code` varchar(255) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_product_color`
--

INSERT INTO `component_product_color` (`id`, `color_name`, `color_code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'CARAMEL', '#6a3b19', NULL, '2025-01-21 06:03:21', '2025-01-21 06:06:26'),
(2, 'BURGUNDY', '#48131d', NULL, '2025-01-21 06:05:43', '2025-01-21 06:05:43'),
(3, 'BLACK', '#000000', NULL, '2025-01-21 06:06:40', '2025-01-21 06:06:40'),
(4, 'CHARCOAL', '#2b2b2b', NULL, '2025-01-21 06:07:14', '2025-01-21 06:07:14'),
(5, 'CREME', '#837658', NULL, '2025-01-21 06:07:54', '2025-01-21 06:07:54'),
(6, 'GREY', '#797b72', NULL, '2025-01-21 06:08:25', '2025-01-21 06:08:25'),
(7, 'LIME', '#76b07b', NULL, '2025-01-21 06:09:05', '2025-01-21 06:09:05'),
(8, 'ORANGE', '#b82c11', NULL, '2025-01-21 06:09:39', '2025-01-21 06:09:39'),
(9, 'GREEN FOREST', '#122d2c', NULL, '2025-01-21 06:10:28', '2025-01-21 06:15:02'),
(10, 'PURPLE', '#382566', NULL, '2025-01-21 06:11:23', '2025-01-21 06:11:23'),
(11, 'ROYAL', '#163387', NULL, '2025-01-21 06:11:59', '2025-01-21 06:11:59'),
(12, 'RED', '#ff0000', NULL, '2025-01-21 06:12:12', '2025-01-21 06:12:12'),
(13, 'TEAL', '#188683', NULL, '2025-01-21 06:12:44', '2025-02-28 21:08:08'),
(14, 'PINK', '#ffc0cb', NULL, '2025-01-21 06:15:29', '2025-01-21 06:15:29'),
(15, 'GREEN', '#008000', NULL, '2025-01-21 06:17:03', '2025-01-21 06:17:03'),
(16, 'ORANGE PP', '#ad1700', NULL, '2025-01-21 06:17:38', '2025-01-21 06:17:38'),
(17, 'SAFTY ORANGE', '#e72613', NULL, '2025-01-21 06:19:19', '2025-01-21 06:19:19'),
(18, 'ORANGE BURN', '#b0230f', NULL, '2025-01-21 06:20:00', '2025-01-21 06:20:00'),
(19, 'NAVY', '#000080', NULL, '2025-01-21 17:13:08', '2025-01-21 17:13:08');

-- --------------------------------------------------------

--
-- Table structure for table `discount_coupon`
--

CREATE TABLE `discount_coupon` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount_type` int(11) NOT NULL,
  `discountable_type` varchar(255) NOT NULL,
  `discountable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` double(8,2) NOT NULL,
  `is_all` int(11) NOT NULL,
  `is_expiry` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `duration_from` timestamp NULL DEFAULT NULL,
  `duration_to` timestamp NULL DEFAULT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount_coupon`
--

INSERT INTO `discount_coupon` (`id`, `title`, `code`, `discount_type`, `discountable_type`, `discountable_id`, `percentage`, `is_all`, `is_expiry`, `count`, `duration_from`, `duration_to`, `visibility`, `created_at`, `updated_at`) VALUES
(16, 'FIRST ORDER', 'CAN20', 1, 'App\\Models\\Product', NULL, 20.00, 1, 0, NULL, NULL, NULL, 1, '2025-02-11 01:30:31', '2025-03-02 16:30:23'),
(17, 'FIRST CAN ORDER', 'FIRST20', 1, 'App\\Models\\Product', NULL, 20.00, 1, 0, NULL, NULL, NULL, 1, '2025-02-11 01:48:32', '2025-02-11 01:48:32'),
(18, 'Main test', 'Main test', 1, 'App\\Models\\Product', NULL, 99.00, 1, 0, NULL, NULL, NULL, 0, '2025-02-11 09:39:38', '2025-02-13 11:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `internal_status`
--

CREATE TABLE `internal_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `internal_status`
--

INSERT INTO `internal_status` (`id`, `title`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 'Pending', 'Order received, awaiting processing.', NULL, '2025-02-10 14:55:48', '2025-02-10 14:55:48'),
(5, 'Processing', 'Order is being prepared for fulfillment.', NULL, '2025-02-10 14:56:02', '2025-02-10 14:56:02'),
(6, 'Picking', 'Items are being picked from inventory for packing.', NULL, '2025-02-10 14:56:15', '2025-02-10 14:56:15'),
(7, 'Shipped', 'Order has been dispatched to the courier.', NULL, '2025-02-10 14:56:29', '2025-02-10 14:56:29'),
(8, 'Completed', 'Order is fully processed and marked as completed.', NULL, '2025-02-10 14:56:41', '2025-02-10 14:56:41'),
(9, 'Order Stock', 'Checking stock availability before processing the order.', NULL, '2025-02-10 14:56:56', '2025-02-10 14:56:56'),
(10, 'Stock Ordered', 'Stock has been ordered from the supplier.', NULL, '2025-02-10 14:57:12', '2025-02-10 14:57:12'),
(11, 'Back Ordered', 'Items are out of stock; waiting for restock before fulfillment.', NULL, '2025-02-10 14:57:24', '2025-02-10 14:57:24'),
(12, 'Waiting Approval', 'Order requires approval before proceeding.', NULL, '2025-02-10 14:57:39', '2025-02-10 14:57:39'),
(13, 'Approved', 'Order has been reviewed and approved for processing.', NULL, '2025-02-10 14:57:49', '2025-02-10 14:57:49'),
(14, 'In Production', 'Order is currently being processed or manufactured.', NULL, '2025-02-10 14:58:22', '2025-02-10 14:58:22'),
(15, 'Contact Client', 'Client needs to be contacted for further details or clarification.', NULL, '2025-02-10 14:58:37', '2025-02-10 14:58:37'),
(16, 'File Missing', 'Required file is missing; awaiting client to provide it.', NULL, '2025-02-10 14:58:52', '2025-02-10 14:58:52'),
(17, 'On Hold', 'Order is put on hold due to an issue or pending approval.', NULL, '2025-02-10 14:59:04', '2025-02-10 14:59:04'),
(18, 'Waiting Client Response', 'Waiting for client’s response to proceed with the order.', NULL, '2025-02-10 14:59:15', '2025-02-10 14:59:15'),
(19, 'Cancelled', 'Order has been cancelled due to client request or internal reasons.', NULL, '2025-02-10 14:59:31', '2025-02-10 14:59:31'),
(20, 'Payment Complete', 'Full payment has been received and verified.', NULL, '2025-02-10 14:59:47', '2025-02-10 14:59:47'),
(21, 'Payment Failed', 'Payment attempt was unsuccessful; requires action.', NULL, '2025-02-10 14:59:58', '2025-02-10 14:59:58'),
(22, 'Payment Pending', 'Payment is not yet received or is under process.', NULL, '2025-02-10 15:00:12', '2025-02-10 15:00:12'),
(23, 'Refunded', 'Payment has been refunded to the client.', NULL, '2025-02-10 15:00:24', '2025-02-10 15:00:24'),
(24, 'jchdjf', 'hjkhjk', '2025-03-02 16:29:22', '2025-03-02 16:29:10', '2025-03-02 16:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_12_18_190201_create_product_printing_table', 1),
(6, '2024_12_18_191749_create_products_table', 1),
(7, '2024_12_18_191833_create_product_pricing_table', 1),
(8, '2024_12_26_094812_create_product_delivery_table', 1),
(9, '2025_01_02_135324_create_admins_table', 1),
(10, '2025_01_04_090228_create_product_baseimages_table', 1),
(11, '2025_01_07_092943_create_order_table', 1),
(12, '2025_01_07_110753_create_component_embroidery_color_table', 1),
(13, '2025_01_07_110805_create__component_font_table', 1),
(14, '2025_01_13_142822_create_order_shipping_detail_table', 1),
(15, '2025_01_15_114442_create_order_files_table', 1),
(16, '2025_01_15_163712_create_internal_status_table', 1),
(17, '2025_01_15_182222_create_order_internal_status_table', 1),
(18, '2025_01_19_140119_create_component_product_color_table', 1),
(19, '2025_01_19_142343_create_product_color_table', 1),
(20, '2025_01_19_142721_create_order_items_table', 1),
(21, '2025_01_19_142722_create_order_artwork_table', 1),
(22, '2025_01_19_143115_create_cart_table', 1),
(23, '2025_01_19_143116_create_cart_artwork_table', 1),
(24, '2025_01_27_110317_create_authorizedotnet_logs_table', 2),
(25, '2025_02_02_075253_create_discount_coupon_table', 3),
(26, '2025_02_02_075707_create_discount_coupon_table', 4),
(27, '2025_02_02_084025_create_discount_coupon_table', 5),
(28, '2025_02_02_112714_create_discount_coupon_table', 6),
(29, '2025_02_09_081432_create_tax_price_table', 7),
(30, '2025_02_10_155206_create_tps_tax_price_table', 8),
(31, '2025_02_09_081432_create_tvq_tax_price_table', 9),
(32, '2025_02_10_165514_create_tps_tax_price_table', 10),
(33, '2025_02_10_175417_create_order_tax_details_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED DEFAULT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `subtotal_price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) NOT NULL,
  `tps_tax_price` decimal(10,2) NOT NULL,
  `tvq_tax_price` decimal(10,2) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_artwork`
--

CREATE TABLE `order_artwork` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `artwork_type` int(11) NOT NULL,
  `artwork_dataText` text DEFAULT NULL,
  `artwork_dataImage` text DEFAULT NULL,
  `patch_length` decimal(8,2) NOT NULL,
  `patch_height` decimal(8,2) NOT NULL,
  `font_style` varchar(255) NOT NULL,
  `num_of_imprint` int(11) NOT NULL,
  `imprint_color` text NOT NULL,
  `leathercolor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_files`
--

CREATE TABLE `order_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_internal_status`
--

CREATE TABLE `order_internal_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `internal_status_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `printing_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `beanie_type` int(11) NOT NULL,
  `is_pompom` int(11) NOT NULL,
  `printing_price` decimal(8,2) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `delivery_price` decimal(8,2) NOT NULL,
  `pompom_price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_shipping_detail`
--

CREATE TABLE `order_shipping_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `additional_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tax_details`
--

CREATE TABLE `order_tax_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tps_tax_no` varchar(255) NOT NULL,
  `tps_tax_percentage` decimal(10,3) NOT NULL,
  `tvq_tax_no` varchar(255) NOT NULL,
  `tvq_tax_percentage` decimal(10,3) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(400) NOT NULL,
  `description` text NOT NULL,
  `is_pompom` int(11) NOT NULL,
  `is_tax` int(11) NOT NULL DEFAULT 1,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `description`, `is_pompom`, `is_tax`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'The Classic', 'mb-classic-963', '963', 1, 1, 1, '2025-01-21 17:17:20', '2025-02-28 21:07:47'),
(2, 'MB Classic 965', 'mb-classic-965', 'kuch bhi', 1, 1, 1, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(3, 'MB Classic 967-W', 'mb-classic-967-w', 'KUCH BH', 1, 1, 1, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(4, 'MB Classic 867', 'mb-classic-867', 'kuch bhi', 0, 1, 1, '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(5, 'MB Classic 867-B', 'mb-classic-867-b', 'kuch bhi', 1, 1, 1, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(6, 'MB Classic 867-R', 'mb-classic-867-r', 'kuch bhi', 0, 1, 1, '2025-01-21 18:15:04', '2025-01-21 18:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_baseimages`
--

CREATE TABLE `product_baseimages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `base_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_baseimages`
--

INSERT INTO `product_baseimages` (`id`, `product_id`, `base_image`, `created_at`, `updated_at`) VALUES
(1, 1, 'ProductImages/vyKSDi54PrR0g4aKJPFw0PWzp6tTu27EAKaRtGaJ.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(2, 2, 'ProductImages/c1UpKSXU4XauEWF2E7TdmY5EBGQ1r8RAKivXaTV2.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(3, 3, 'ProductImages/eyQLi0MnZL3tKuteZu3yPjbtdHMLjUDEAguLNpgP.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(4, 4, 'ProductImages/BmUDeqpQYeRPj81LO2SrSXY80herc12wYfwdmoOQ.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(5, 5, 'ProductImages/hlHhynEgPN24XfQuZIu9lAm3tbAxK85F4OddybWt.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(6, 6, 'ProductImages/t8Dh0ItSRe8vxn9HklIIzgKqZ4jBrLTqkefWuX4z.jpg', '2025-01-21 18:15:04', '2025-01-21 18:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 'ProductImages/ColorVariations/PVcQQfXPWAG0Uqe6ShczYuhIyAkFbH3ha6C01wGY.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(2, 1, 1, 'ProductImages/ColorVariations/QI9FInUj287bPP2lEOIaNeNe1RMJQp2iQqB8NL3F.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(3, 1, 15, 'ProductImages/ColorVariations/MkyCewALwyU0cIqDk39qA6jVcA8D4oaHv7XOmJPG.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(4, 1, 9, 'ProductImages/ColorVariations/U08N3cZ2Cgeh8rU4Uwo9DFqnEhEprcBkNymmqQkh.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(5, 1, 19, 'ProductImages/ColorVariations/JqsNYfFNTkBn54xfLqjgGRcSFu6KJJHlPRKAIZNf.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(6, 1, 8, 'ProductImages/ColorVariations/NtB7G3OrpkujS10gdNeY7dj1GH0ypElbgcSaIZvR.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(7, 1, 18, 'ProductImages/ColorVariations/BkibzylON2AnjEoAI7x6a9p0sStE7CGZ7BTIbHPB.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(8, 1, 14, 'ProductImages/ColorVariations/v2VvyOOhQ1EyILTurXvJpbmo97NzHPEA8oAvsavH.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(9, 1, 10, 'ProductImages/ColorVariations/6dIvkMl0fF4N1EkinUkMPFdJc44DZA3ciNb9V3rU.jpg', '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(10, 1, 12, 'ProductImages/ColorVariations/FUwrxlOVR4wV2J1Yj0FOEuUQWBqul9Wpma1Uo6HZ.jpg', '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(11, 1, 11, 'ProductImages/ColorVariations/FfalCzCOgvjHHwTWMPAojQ1zlA3UuIR4uUjUJNVa.jpg', '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(12, 1, 17, 'ProductImages/ColorVariations/rU36wukLlwCE4RmIQZzuT5QE5zaojIExLkJ9ch7V.jpg', '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(13, 1, 13, 'ProductImages/ColorVariations/GcI2EZMfu59mCDcGkm2CPtQSfqggyHq1HmEb3Kkx.jpg', '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(14, 2, 3, 'ProductImages/ColorVariations/zVclWlH9YB0iVuiY2u3AZJ6a1LRhcz1EmCV4WDEc.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(15, 2, 2, 'ProductImages/ColorVariations/BLQNlUQUA4Ur0dcJQmD9FQqWCt9IrPdED3H5zg3M.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(16, 2, 1, 'ProductImages/ColorVariations/vyd2HvA9BLQ1fTGDEyQQmEa1w339eHMHBtdQuaVc.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(17, 2, 4, 'ProductImages/ColorVariations/QZTwhltJrNR1X3GtPJ00Qj2OKFEyN5oTxjq2LD8R.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(18, 2, 5, 'ProductImages/ColorVariations/8e7BluqrsmWSzWK41a2TXs1HyBpUIa2wPpNTwsXk.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(19, 2, 6, 'ProductImages/ColorVariations/mlZAjliWzChMAzM2qcswiY0nVvWG3Sblc4GOS2xr.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(20, 2, 7, 'ProductImages/ColorVariations/bnHn8LfoTw7ffmaoH9TcEANPgU4y3k4BhdNUhecf.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(21, 2, 8, 'ProductImages/ColorVariations/4Ph9gYiVrhtcldfNpE3hW9d4oPCiWUMC40X4CjuZ.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(22, 2, 14, 'ProductImages/ColorVariations/C2IKhhuPBRsZnYwcOkqVDqjQ2UzfbDLm6XKRR2V3.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(23, 2, 10, 'ProductImages/ColorVariations/KVQE5sfFMezd8JFNf2ZaKmFEjYxkjKnlp6Dsxvfa.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(24, 2, 12, 'ProductImages/ColorVariations/AziUNsy1U3BKnrMAtvB9zFkvWeHt9gPRCTAMhmUl.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(25, 2, 11, 'ProductImages/ColorVariations/mBj7a6FykQygV8MG9uTNlSFrw5AW4XkNFz18nDdA.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(26, 2, 13, 'ProductImages/ColorVariations/SmnOWX3XUYEhI3MCqWXwKG3Id2uAJowESpLJELWa.jpg', '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(27, 3, 3, 'ProductImages/ColorVariations/JEVlk6yFXLbMZODZz56GWctKroBS2RTPQHUaGhAn.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(28, 3, 9, 'ProductImages/ColorVariations/S0RoYHXGnxUOk4gD9ZGNt32rotn1Xc7gDYYxBDbW.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(29, 3, 6, 'ProductImages/ColorVariations/IYUJQHeG8E8qnuzeJikhYcBbeZBHtDnyZFVILRPS.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(30, 3, 8, 'ProductImages/ColorVariations/Tj4XwCCMCfCiTGYikapVF4WGtdJBsKBN7X4Svykm.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(31, 3, 14, 'ProductImages/ColorVariations/Tc7waudtGFXtddyu1ZxJCKm1OLogW7AEnkGwrme4.jpg', '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(32, 4, 4, 'ProductImages/ColorVariations/6yVP9mcLjaENlT9RE8i1ZlSOafC07y6A2tQ3bOfB.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(33, 4, 7, 'ProductImages/ColorVariations/6EJKzbBXeJJ3P7CSgTjDPEuodEg5QMcSOSD1qVv6.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(34, 4, 6, 'ProductImages/ColorVariations/HppMceLMNUhkNoJLg1dNjQBOwL0kXxagnco6FknC.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(35, 4, 13, 'ProductImages/ColorVariations/BMNPKav1VMigDG2FT3exK9hsLaEW37jsdd48ZJDv.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(36, 4, 10, 'ProductImages/ColorVariations/niomcXCKZhsz2x2k4XXbGsJAAiKyWTu00L14Ob19.jpg', '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(37, 4, 15, 'ProductImages/ColorVariations/jcioBKlxLlWeZCbNWum7RcaxzmCeGbnTOFmo3srx.jpg', '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(38, 4, 14, 'ProductImages/ColorVariations/6bNaLiVgxvAfyCXCOC2y79cI2wuquSKLRMozCLLd.jpg', '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(39, 4, 8, 'ProductImages/ColorVariations/FxJotDwJMGES26LvkTUOzZ7YfFaxr4GDvleFoARE.jpg', '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(40, 4, 1, 'ProductImages/ColorVariations/ilDbz9L0RWmY1fqyf9U1ra8dYi6PLAq7r1sWfAS8.jpg', '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(41, 4, 3, 'ProductImages/ColorVariations/6Xu4zLLrQNP4FfWtUwMYulLBtJoXMwX6yJCOOJhj.jpg', '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(42, 5, 1, 'ProductImages/ColorVariations/h5YNQAgp9SE2j10h1cH1sBHgYHa4QAcuJ8RTvR25.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(43, 5, 4, 'ProductImages/ColorVariations/e7e7MgCV0PjQPEc3tnyjHbiQrUVPs3QgUF4eeZ85.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(44, 5, 15, 'ProductImages/ColorVariations/oceSpwgWz5bWXhoo4ImoqmmKyyfnevcZsCGT2d71.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(45, 5, 6, 'ProductImages/ColorVariations/jU5wLayG5SMeckn6aBEWxLuoalkZDEfdcndPnZUV.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(46, 5, 7, 'ProductImages/ColorVariations/aPwdP74i3MYtmVFmgNcxTNmiCRzlK6hkbCV327bE.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(47, 5, 8, 'ProductImages/ColorVariations/H0lRDudnox9Ki2uOHbhXrqYyrXfeJayHdvrmNHJo.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(48, 5, 16, 'ProductImages/ColorVariations/1Vw7ZzpA0yYqPp91IcAJFy6AdzqKP3DFuRqMcVt5.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(49, 5, 14, 'ProductImages/ColorVariations/AgYxBCAXM0uyH0XaS0tZsiVfXkmKgwtV36wJNY74.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(50, 5, 10, 'ProductImages/ColorVariations/0fZAnwscvQMyYaQDmcH0ivtxUcuDDC7HSJdnFk3t.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(51, 5, 13, 'ProductImages/ColorVariations/B05Ue33jPou6ygd6x5hCYUZBwwiB2ai3SdazVedc.jpg', '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(52, 6, 3, 'ProductImages/ColorVariations/4wwIg8bQkC9a4Blzr7YYB2Hg6LKaf9SBULprGHnV.jpg', '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(53, 6, 6, 'ProductImages/ColorVariations/f8K6aFjXyaXVADN8ebsVA5XNpvWgJEjsiodWANBb.jpg', '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(54, 6, 11, 'ProductImages/ColorVariations/Ve7mxkS2DNfoYqEHYs3kmMuTKABqK2wZKzhzK7hl.jpg', '2025-01-21 18:15:04', '2025-01-21 18:15:04');

-- --------------------------------------------------------

--
-- Table structure for table `product_delivery`
--

CREATE TABLE `product_delivery` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` text NOT NULL,
  `pricing` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_delivery`
--

INSERT INTO `product_delivery` (`id`, `quantity`, `pricing`, `created_at`, `updated_at`) VALUES
(1, '\"[\\\"12\\\",\\\"25\\\",\\\"50\\\",\\\"100\\\",\\\"250\\\",\\\"500\\\",\\\"1000\\\",\\\"2500\\\",\\\"5000\\\"]\"', '\"[\\\"20\\\",\\\"18\\\",\\\"16\\\",\\\"14\\\",\\\"12\\\",\\\"10\\\",\\\"8\\\",\\\"6\\\",\\\"4\\\"]\"', '2025-01-21 16:43:57', '2025-01-21 16:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_pricing`
--

CREATE TABLE `product_pricing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `pricing` decimal(8,2) NOT NULL,
  `reseller_pricing` decimal(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_pricing`
--

INSERT INTO `product_pricing` (`id`, `product_id`, `pricing`, `reseller_pricing`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 13.00, 4.35, 12, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(2, 1, 12.75, 4.35, 25, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(3, 1, 12.50, 4.35, 50, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(4, 1, 11.75, 4.35, 100, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(5, 1, 11.65, 4.35, 250, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(6, 1, 11.50, 4.35, 500, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(7, 1, 10.00, 4.35, 1000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(8, 1, 8.00, 4.35, 2500, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(9, 1, 7.00, 4.35, 5000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(10, 1, 6.75, 4.35, 10000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(20, 3, 14.43, 4.85, 12, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(21, 3, 14.15, 4.85, 25, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(22, 3, 13.88, 4.85, 50, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(23, 3, 13.04, 4.85, 100, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(24, 3, 12.93, 4.85, 250, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(25, 3, 12.77, 4.85, 500, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(26, 3, 11.10, 4.85, 1000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(27, 3, 8.88, 4.85, 2500, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(28, 3, 7.77, 4.85, 5000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(29, 3, 7.49, 4.85, 10000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(30, 4, 13.00, 4.35, 12, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(31, 4, 12.75, 4.35, 25, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(32, 4, 12.50, 4.35, 50, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(33, 4, 11.75, 4.35, 100, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(34, 4, 11.65, 4.35, 250, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(35, 4, 11.50, 4.35, 500, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(36, 4, 10.00, 4.35, 1000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(37, 4, 8.00, 4.35, 2500, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(38, 4, 7.00, 4.35, 5000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(39, 4, 6.75, 4.35, 10000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(40, 5, 13.00, 4.35, 12, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(41, 5, 12.75, 4.35, 25, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(42, 5, 12.50, 4.35, 50, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(43, 5, 11.75, 4.35, 100, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(44, 5, 11.65, 4.35, 250, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(45, 5, 11.50, 4.35, 500, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(46, 5, 10.00, 4.35, 1000, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(47, 5, 8.00, 4.35, 2500, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(48, 5, 7.00, 4.35, 5000, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(49, 5, 6.75, 4.35, 10000, '2025-01-21 18:10:55', '2025-01-21 18:10:55'),
(50, 6, 14.43, 4.85, 12, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(51, 6, 14.15, 4.85, 25, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(52, 6, 13.88, 4.85, 50, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(53, 6, 13.04, 4.85, 100, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(54, 6, 12.93, 4.85, 250, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(55, 6, 12.77, 4.85, 500, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(56, 6, 11.10, 4.85, 1000, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(57, 6, 8.88, 4.85, 2500, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(58, 6, 7.77, 4.85, 5000, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(59, 6, 7.49, 4.85, 10000, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(60, 2, 14.43, 4.85, 12, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(61, 2, 14.15, 4.85, 25, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(62, 2, 13.88, 4.85, 50, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(63, 2, 13.04, 4.85, 100, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(64, 2, 12.93, 4.85, 250, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(65, 2, 12.77, 4.85, 500, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(66, 2, 11.10, 4.85, 1000, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(67, 2, 8.88, 4.85, 2500, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(68, 2, 7.77, 4.85, 5000, '2025-01-29 14:00:03', '2025-01-29 14:00:03'),
(69, 2, 7.49, 4.85, 10000, '2025-01-29 14:00:03', '2025-01-29 14:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `product_printing`
--

CREATE TABLE `product_printing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text DEFAULT NULL,
  `quantity` text NOT NULL,
  `price` text NOT NULL,
  `is_leather` int(11) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_printing`
--

INSERT INTO `product_printing` (`id`, `title`, `image`, `quantity`, `price`, `is_leather`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'No Imprint - Blank', 'ProductPrintingImages/qEyTNpdavaDywG5NN3nlDkfI1gotxneMMpZ3CZmJ.jpg', '[\"0\"]', '[\"0\"]', 0, 1, '2025-01-21 05:45:19', '2025-01-21 05:45:19'),
(2, 'Direct Embroidery', 'ProductPrintingImages/j6b3JRbeBkVadUbLWKfe0XALB4R1cIvvXVWLVQwG.png', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"4.35\",\"4.25\",\"4\",\"3.75\",\"3.5\",\"3\",\"2\"]', 0, 1, '2025-01-28 10:03:04', '2025-01-28 10:03:04'),
(3, 'Embroidery Patch', 'ProductPrintingImages/Zu6vTdKP2RRiGBfx5cMMpWm6Z4iq0lXd06fM4UV9.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"7.15\",\"5.225\",\"4.785\",\"4.785\",\"4.675\",\"4.4\",\"4.125\",\"3.85\",\"3.3\",\"2.2\"]', 0, 1, '2025-01-21 05:45:49', '2025-01-21 05:45:49'),
(4, '3D Embroidery Patch', 'ProductPrintingImages/EQq6Qt2bLkCjQgiGGYqcVoBr06t92JWonssG2hAW.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"1\"]', 0, 0, '2025-01-21 05:46:03', '2025-01-21 05:46:03'),
(5, 'DTF', 'ProductPrintingImages/y0UAtXSxwQ2lKv5iyTChQ9LXCNsSvwOozHAhKMKA.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.955\",\"5.0825\",\"4.6545\",\"4.6545\",\"4.5475\",\"4.28\",\"4.0125\",\"3.745\",\"3.21\",\"2.14\"]', 0, 1, '2025-01-21 05:46:20', '2025-01-21 05:46:20'),
(6, 'Woven Patch', 'ProductPrintingImages/1YH73Phgwd5ZJ75ASa0RMbcdOMUiLTjKQLQEu2j0.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"2\"]', 0, 0, '2025-01-21 05:46:32', '2025-01-21 05:46:32'),
(7, 'Woven Labels', 'ProductPrintingImages/AkXODM7syZdlakFzrWbgSXmST8ctfDOAbAg47jM9.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"2\"]', 0, 0, '2025-01-21 05:46:41', '2025-01-21 05:46:41'),
(8, 'Real Leather Patch', 'ProductPrintingImages/FtyRjewN0y5L2BOVoP5yk8YoXAvzbyRr3IR0x5WA.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"\",\"\",\"6.98175\",\"6.98175\",\"6.82125\",\"6.42\",\"6.01875\",\"5.6175\",\"4.815\",\"3.21\"]', 1, 1, '2025-01-21 05:46:54', '2025-01-21 05:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `temp_cart_images`
--

CREATE TABLE `temp_cart_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `artwork_dataImage` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_cart_images`
--

INSERT INTO `temp_cart_images` (`id`, `session_id`, `artwork_dataImage`, `created_at`, `updated_at`) VALUES
(13, '756gAEgK9hNYBqHPPOJ3vZuZxSaaJbUeMlEEWF2n', 'TempCartImages/1741076836_images.jpg', NULL, NULL),
(18, 'pMTQGUIDBZDHRycyVvGnLRKRLpCVdDYED1XxNVQP', 'TempCartImages/1741078630_images.jpg', NULL, NULL),
(20, 'rVK5zmoT4bLJXBmUWPO4enKG595Xi9LMlvXAPDbM', 'TempCartImages/1741100220_images.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tps_tax_price`
--

CREATE TABLE `tps_tax_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percentage` double(8,2) NOT NULL,
  `taxno` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tps_tax_price`
--

INSERT INTO `tps_tax_price` (`id`, `percentage`, `taxno`, `created_at`, `updated_at`) VALUES
(1, 5.00, '799230495', '2025-02-10 12:01:38', '2025-02-10 14:44:18');

-- --------------------------------------------------------

--
-- Table structure for table `tvq_tax_price`
--

CREATE TABLE `tvq_tax_price` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percentage` double(8,3) NOT NULL,
  `taxno` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tvq_tax_price`
--

INSERT INTO `tvq_tax_price` (`id`, `percentage`, `taxno`, `created_at`, `updated_at`) VALUES
(1, 9.975, '1223273960', '2025-02-10 12:10:25', '2025-02-10 14:51:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(300) NOT NULL,
  `last_name` varchar(300) NOT NULL,
  `language` varchar(300) NOT NULL,
  `contact_number` varchar(300) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `country` enum('USA','CANADA') NOT NULL,
  `status` int(11) NOT NULL,
  `is_reseller` tinyint(1) NOT NULL DEFAULT 0,
  `neq_number` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `language`, `contact_number`, `email`, `email_verified_at`, `password`, `country`, `status`, `is_reseller`, `neq_number`, `remember_token`, `created_at`, `updated_at`) VALUES
(38, 'syed', 'sabeer', 'fr', '23434', 'syedsabeer6198@gmail.com', NULL, '$2y$10$n5vxjfdMFeYWKk5UUHdQ2u.WG938USxPjI2lk54bC7wu/aiC3YeF2', 'CANADA', 1, 0, NULL, NULL, '2025-02-13 19:09:53', '2025-02-13 19:09:53'),
(39, 'bruno', 'torres', 'en', '5145618019', 'b.torres@weborka.com', NULL, '$2y$10$sLftlWEKdKTaHrXSqGNnIOqcRJvCLh9DStjj87yIunQqmm7d5VH9G', 'CANADA', 1, 0, NULL, NULL, '2025-02-13 23:51:34', '2025-02-13 23:51:34'),
(40, 'Kelly', 'Benoit', 'en', '5192129381', 'nknmzm@gmail.com', NULL, '$2y$10$muItytamQkB/R6caP5WiZu0dCdwMSrMEM.j13p6q.3J2OUvgkfgQO', 'CANADA', 0, 1, '????', NULL, '2025-02-18 01:04:09', '2025-02-18 01:04:09'),
(41, 'Lauren', 'Reid', 'en', '7789285544', 'laurenreid0911@gmail.com', NULL, '$2y$10$FxYSaUYXRncJruyO7Va.1.MMkED2dai7KfYQdjCxNI6y4YAh6Bioe', 'CANADA', 1, 0, NULL, NULL, '2025-02-19 20:19:45', '2025-02-19 20:19:45'),
(42, 'Lauren', 'Reid', 'en', '7789285544', 'lauren@lmrdigitalmarketing.com', NULL, '$2y$10$xUkKWl9Mgnr7HFNrpG5cr.yYAAyTEyya5l9sfZ4geSgAr1B7dE.0O', 'CANADA', 1, 0, NULL, NULL, '2025-02-19 20:26:08', '2025-02-19 20:26:08'),
(43, 'gitVINYZIcPuXGh', 'rXOgaLvabNhX', 'pt-PT', 'hJQQOtdtJ', 'fablejade62io@gmail.com', NULL, '$2y$10$8ajxycS4ibdi9CVlFxPgTuQjDvRfysGfgNb42O1MwbEcuaqDXyOVa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 16:41:50', '2025-02-24 16:41:50'),
(44, 'LuwENTFLF', 'bXpOzYeKGLUTiFd', 'pt-PT', 'KYMTbdPDm', 'graingerhome@gmail.com', NULL, '$2y$10$qJULU0jwDF9BlSh8KIq5CeYvuGjScduJNDB.0wn.yUqgoauPZ7IaG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:54:54', '2025-02-24 18:54:54'),
(45, 'LdmpgfgIN', 'ORfwpraVD', 'pt-PT', 'YWhebBTrznaurw', 'lizalek925@gmail.com', NULL, '$2y$10$aEOg2xSBWKExusIUWy6I7ufnLt8zp8LIPnAbiIlrd1lQ0HaxAxJLK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:10', '2025-02-24 18:55:10'),
(46, 'MXkcEqHSlcJO', 'bJrOumJku', 'pt-PT', 'adHTdNTwcOISBL', 'eleynika@gmail.com', NULL, '$2y$10$U5RSHdDuwuAn5/RAM.swcOifcRRo3VNx8t5wljrCmfLgoSWqRHtWS', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:11', '2025-02-24 18:55:11'),
(47, 'INMMbiSvAHpSN', 'ltdoxyJke', 'pt-PT', 'ohbECwcnjfvMuT', 'lopaj@hotmail.com', NULL, '$2y$10$h2Sy8l2G/E38LXR.1BHGiOFI/iyBwKYWJ/3qRIFZnA8Z5QVVnRHt6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:13', '2025-02-24 18:55:13'),
(48, 'zgypWBxO', 'bflDLfXY', 'pt-PT', 'GrHTsoneAgBnimB', 'bridgetmkeefe@gmail.com', NULL, '$2y$10$e/nDi4GDOhC11GAfxzWBHO9beCV5mzXRSNJUd3owR5K5lW52Icmuy', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:18', '2025-02-24 18:55:18'),
(49, 'OjWQDpdcQjZltIP', 'rAMupTWkaCXQ', 'pt-PT', 'WxfCbZDMVWE', 'deters.meghan@gmail.com', NULL, '$2y$10$uT2LNNCixX8bfxfxxKC1zee7/vox03.YvFnGY9bKqQFGMTe84BU3y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:21', '2025-02-24 18:55:21'),
(50, 'nvzNRgyAAXargTl', 'vHlRNkFSOYCLAuZ', 'pt-PT', 'RlXKMaAvRlqqwtO', 'jalee9691@gmail.com', NULL, '$2y$10$EozNRjR8UIeVFYUnrDAhXeFqGmyIM45deZ4hnmUwiVGnqxOs5DckO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:23', '2025-02-24 18:55:23'),
(51, 'TxcQfTee', 'WcUzZMwchSaSkN', 'pt-PT', 'bJayZVFXYnphDPb', 'dnr0001@auburn.edu', NULL, '$2y$10$vh0CsJgQodLdZLql8xNgAO57xm2CkGlOTVIMxzx4t5ob4PreqinE6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:55:23', '2025-02-24 18:55:23'),
(52, 'myeValbuBjs', 'YIipMjNMnpzcjm', 'pt-PT', 'uNTYHBiBHQYReK', 'arsenaulth92@gmail.com', NULL, '$2y$10$7gyQaeY.ajXWUbIuLEAkNu8KGPMopXZV.pmn1Y/4Jc7Cmi0bY5QxC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 18:57:19', '2025-02-24 18:57:19'),
(53, 'OkPlRyYvTBjWW', 'ceVCGfoNXZFPZZ', 'pt-PT', 'TAQhpJGFJHe', 'jasmer24@gmail.com', NULL, '$2y$10$2nn21AOVWwd1QRgjtCk55.eBF92f6FprNLZ3v5i3bBV6QPmEJuZCa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:08:03', '2025-02-24 19:08:03'),
(54, 'kqmsHMLNkl', 'YTrRVGwMjqUlfI', 'pt-PT', 'xTiuGXrUGFj', 'soledadamen@gmail.com', NULL, '$2y$10$YAZTj1ZyQ8MFyWg9xT59C.uoW9T2Rwg0uWzjUhmKQO7EYFIxf50G.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:11:09', '2025-02-24 19:11:09'),
(55, 'qlLLRJXXvwtuPS', 'BVkVMGuNXGOpv', 'pt-PT', 'QWwMPAGgYwnwmh', 'miranda.tsoumas@gmail.com', NULL, '$2y$10$/5KYAobqxRQy9IZq30I/gOSLn8LEUGyMFHjNbJBSUtmcWi/4UUJ2C', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:11:19', '2025-02-24 19:11:19'),
(56, 'XfZkPkpUrFjKM', 'hiUkPoANEQRtBwH', 'pt-PT', 'hrRWYLRH', 'sdriscoll531@gmail.com', NULL, '$2y$10$s3al5NBVMqD8GC3fCkVhM.CYZb5MJW8sUJHzMsYAE3q2897rK6SA2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:12:14', '2025-02-24 19:12:14'),
(57, 'kUIgGgLsAZEAC', 'vyEkzyYLZ', 'pt-PT', 'tPernmyahUxC', 'kassie.thibode@gmail.com', NULL, '$2y$10$yw3NBvEg51l4TsnIS9H1a.FP5J/R6zBaxRlc6O/CLJoNbKCn3/Za.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:14:28', '2025-02-24 19:14:28'),
(58, 'TvlPrdSU', 'MqipHmYK', 'pt-PT', 'SNqLTJBDWMfqGs', 'carolineribich@hotmail.com', NULL, '$2y$10$dLOjrKXxOvTFyBQ94Ic/eeVODP.xMhx1YY.hRw1gagnjNwQE8yo0a', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:15:11', '2025-02-24 19:15:11'),
(59, 'qGiKmMFCVq', 'KgQDEYDmY', 'pt-PT', 'oDsyXwtldsY', 'ldiaz0303@gmail.com', NULL, '$2y$10$dyjmtLqeGNgG4bkQwaa8X.JZspgfXOI.USNGrCDjX8UUcDQWwpSQu', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:17:25', '2025-02-24 19:17:25'),
(60, 'JjHzCBVtC', 'IKpUVBHgDQp', 'pt-PT', 'FLhbxAmVKEV', 'djpauliep@gmail.com', NULL, '$2y$10$PxCBsOqEzGfhnq1VkG5oqeWMGEcB29nsQWW8b.WTHWyo5N1siCLBC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:19:27', '2025-02-24 19:19:27'),
(61, 'OOjYXpddqi', 'jIgoDIOiKfyVm', 'pt-PT', 'vTLqbNQQecpsqU', 'f.schwarzmaier@t-online.de', NULL, '$2y$10$.BbCBOrwBBqN/Ac7jYJwhO4uMmhQgKWyEFcFPkExW/N4A0xDjnrOy', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:23:17', '2025-02-24 19:23:17'),
(62, 'FjgTMLmrdL', 'IRQMbeNAuXWnnA', 'pt-PT', 'PxIPBeDo', 'yuuto0963@gmail.com', NULL, '$2y$10$qMlRatJE2jThhVHgN78En.uU7M0cY4MeU5Hh0o5vqOXbv4cDC0BGe', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:25:20', '2025-02-24 19:25:20'),
(63, 'xmbOeHlIviI', 'tfTRQJCHnKWir', 'pt-PT', 'GLIVUTqKmnSVcV', 'tiffanyreed551@gmail.com', NULL, '$2y$10$4dNzVxGPwVTNFVDQ8mOQUe/wxkvL/nzrCS2ZB/azYLVm1MKP.AwPi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:31:02', '2025-02-24 19:31:02'),
(64, 'ywCQAaZiftfwtpT', 'qroXFSBh', 'pt-PT', 'IogBWantlclYpCa', 'andrebo99@gmail.com', NULL, '$2y$10$8ycuYS/BtlELSi5v3D0xyeihumQJkFB/8fjBN.RX1kcmI7J/Opyoa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:31:04', '2025-02-24 19:31:04'),
(65, 'xgmPRFCx', 'NeFUqnNIaahe', 'pt-PT', 'egqNtghhX', 'ferrlav98@gmail.com', NULL, '$2y$10$bfF2SVhbFEfSnmh/qXRBEejWJxwftYcgifX0OOHhMY.Irx/1VwaTy', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:31:54', '2025-02-24 19:31:54'),
(66, 'LcVdcjFSKRloNIc', 'LDRtljIWYfCIA', 'pt-PT', 'iHboUBJDXPZsaej', 'abym318@gmail.com', NULL, '$2y$10$Np2DMQ9ptVJ5vHvKt9OpMuXaBTa1QljQEvViSE8ZBpxzqMStiR4WC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:34:25', '2025-02-24 19:34:25'),
(67, 'ulJTMyiWtysj', 'MWpGOhtnwGhizH', 'pt-PT', 'aQBBAXNoIPMqhT', 'alyssa.stetson@gmail.com', NULL, '$2y$10$9am8Xj7JFKCtQReh4kWFQ.7TR6OqMr8GuFW5RVCRoCtGc6WPMqajO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:36:40', '2025-02-24 19:36:40'),
(68, 'NPRcatTY', 'IQCjzjpxlxwWg', 'pt-PT', 'yEmgSREOc', 'kaciejackson13@hotmail.com', NULL, '$2y$10$jll5F6wqPTSnQxnfVatAo.SZs5.iohFAo08WqeNE9ejG9all5bk/q', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:38:13', '2025-02-24 19:38:13'),
(69, 'FvcuFRCI', 'MXeeZYDT', 'pt-PT', 'afzvOQVwm', 'bit305@gmail.com', NULL, '$2y$10$IofdMAWf9XVRj/JEBP8F1OHvMoW0ohUw0tmCqrsrokVYuN1EYIElq', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:40:30', '2025-02-24 19:40:30'),
(70, 'sXFRKfCPXuPpWbB', 'CJKTrWvt', 'pt-PT', 'WLNTKYhtcFVi', 'ja.sonraycantu@gmail.com', NULL, '$2y$10$6O1A/yvPFHl0EeD3oU5vU.OfVE0nKor9Y4.wcdEysrhIFSAWtauFu', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:42:21', '2025-02-24 19:42:21'),
(71, 'iArlsRDcVU', 'hGIzmGwFCUQHH', 'pt-PT', 'pfrNBRhcYxBIhn', 'sedmckin@iupui.edu', NULL, '$2y$10$QRh1tC6xUqIjAtrWHZxY2uw1bhji0Io/ZoPPytUwXGJIn0qvDmd7u', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:43:43', '2025-02-24 19:43:43'),
(72, 'rFMWgBHOZyyH', 'RemeIbbyiiIfTZ', 'pt-PT', 'TaSVQKhhdgVkA', 'junevidrine@msn.com', NULL, '$2y$10$YlofOIPwO4vDWXtU8UEEluR7apGjdfgpM7C8Ai4exjkIBzg.xjQ0O', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:44:54', '2025-02-24 19:44:54'),
(73, 'tqYFMCKsm', 'VMKbJKtHf', 'pt-PT', 'XqteXSorQk', 'samgifford11@gmail.com', NULL, '$2y$10$UNae4C02xqoAaMGbZ6Vz.un8QlCPhdqtkAf2qh9CXo7wSO/HYtooS', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 19:55:37', '2025-02-24 19:55:37'),
(74, 'fpPVrULAGVd', 'lAiKERtO', 'pt-PT', 'IbuIAWKuy', 'cherise.moody@gmail.com', NULL, '$2y$10$DhAkf65Yd6XMTUSfZvfSUOWsI/iiljUcsOmWpYSioGQqjxq9P2aBW', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:00:01', '2025-02-24 20:00:01'),
(75, 'OWYWzIRh', 'yXPjjCGRMQPh', 'pt-PT', 'hlCwlYhZDaJFJ', 'sophie32866@mac.com', NULL, '$2y$10$.5g3CPOcZgtjPioXWSyEE.bPwhPjIlvu.guO5IpHd/1y2Qtgcrgce', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:04:00', '2025-02-24 20:04:00'),
(76, 'tpelkbfzhL', 'vDxhAMIwJ', 'pt-PT', 'jvSAGmWASIRqRnN', 'motoworldhd@gmail.com', NULL, '$2y$10$.SO7LXCd.AqIftDGuV37KO2zGIkFIR4uItWdt9C44vaLWCqVY1y.y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:05:31', '2025-02-24 20:05:31'),
(77, 'WViaDjcTAD', 'nuVzmAbgmDtO', 'pt-PT', 'VnBxUVUDIsJI', 'robcshea@gmail.com', NULL, '$2y$10$8Yvdag6gbbmP2/Zd5aMWzueTa1lB0CKc20/0HRHDmcowG6QCt3KDS', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:05:57', '2025-02-24 20:05:57'),
(78, 'TShYktMP', 'LyGzhdtgnPEN', 'pt-PT', 'cOxgLzClDyGerx', 'smikulance@gmail.com', NULL, '$2y$10$V.6MjNjBM2J6gQQdh66O3Oz9orr7OolwVrOt2beomjXSjZdz6FyKe', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:06:08', '2025-02-24 20:06:08'),
(79, 'revWkIQIvLqYesL', 'EXCmNPZDY', 'pt-PT', 'vlevYfOC', 'hafnergin@gmail.com', NULL, '$2y$10$eID85SDGCotY7q0tazPIVe0msRdLs3JWAfTtwzvuFyGbOTczVuw3G', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:07:44', '2025-02-24 20:07:44'),
(80, 'cWbeqvVygOjarhW', 'RGghYylUrJr', 'pt-PT', 'OctqAnTHl', 'kayleigh.stachowiak@gmail.com', NULL, '$2y$10$mOQu7npSie0G9lpT1R9OV.V2xESFh2UH1tTVuZr9leSe5ooNun1mW', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:09:50', '2025-02-24 20:09:50'),
(81, 'kJhJThHTQlvGwf', 'PubLmieDEla', 'pt-PT', 'eYqwCbVilMm', 'cahi1111@web.de', NULL, '$2y$10$l536OspDSfNUMFfkOqBL3.cPJ7YDoiymsjjIcneHuNA41E5xgDnw6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:11:06', '2025-02-24 20:11:06'),
(82, 'zKyFXeGON', 'wDikRXbCMDPuCy', 'pt-PT', 'mSlthafeD', 'joelmendez101@me.com', NULL, '$2y$10$.PuCkZ.c0v5ku25iEiEVUeV4DWi7pLeeOcxAbP0qWSmihE1Rolk5O', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:13:32', '2025-02-24 20:13:32'),
(83, 'TmOgaZMEGuK', 'szPatCtCoCdLI', 'pt-PT', 'wNULoHyWoCwBVQ', 'pettitjeff@hotmail.com', NULL, '$2y$10$nGJzPry8Y6MCDEB54susDuBHRk/atVZ8Cx4T88kGxt72dAP.Ak2ua', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:15:28', '2025-02-24 20:15:28'),
(84, 'kipGFEMewuZrZj', 'imxSIomXIsfd', 'pt-PT', 'VViWKDtPfPlKI', 'costensc@gmail.com', NULL, '$2y$10$BiGgFmsWNp4jVi9LD7TfbeAk7dhYD3FT8/dkQeCdyluASkCR54kNC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:17:04', '2025-02-24 20:17:04'),
(85, 'wGjECWqgmPbBq', 'mYBjGAihMG', 'pt-PT', 'RHGJZXNxg', 'hillaryklamb@gmail.com', NULL, '$2y$10$TxwYf1cuxq2T98JjMYw8Qu55lc9CQwU/OqwyHKR2noo//PlWtikRG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:19:54', '2025-02-24 20:19:54'),
(86, 'BjILfsanBerDX', 'MItPBsRuW', 'pt-PT', 'zooZZeTf', 'beckyfoley41@gmail.com', NULL, '$2y$10$5JfVt4Px.rkgj8nxA4OkLeGbu3cSTp8kfFNsJqsQJPKz6mD58uGze', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:20:02', '2025-02-24 20:20:02'),
(87, 'FHsoxRZu', 'FWMBSJVV', 'pt-PT', 'ONqkqPcCeRRKf', 'lhauldren@gmail.com', NULL, '$2y$10$MHhKCKIgUGbrg2WgkxlqxOW84pYkGMFO5UWfAtzO103yIfui6MVde', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:22:49', '2025-02-24 20:22:49'),
(88, 'xxmXgkXrbHXRQsK', 'wKZYJXOP', 'pt-PT', 'ErwyQfnIeVPeU', 'elmesn@gmail.com', NULL, '$2y$10$UJZyHM7oY9zT8ap82jKmBeIJEYjstQ9RnhczuOwfl15Ay1b9mhFvK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:24:37', '2025-02-24 20:24:37'),
(89, 'LmmPkzAiqntw', 'IbYHxXGc', 'pt-PT', 'GNQrveBUqMuaV', 'gileastpadaya@yahoo.com', NULL, '$2y$10$uuz6QhazZmPRT83bT6Gx6uwAy3JO7eqbTCBbGzZN7QLH.OcM2LcYK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:26:39', '2025-02-24 20:26:39'),
(90, 'IyrMDTUz', 'QLBTPwntnsszVVA', 'pt-PT', 'iabVzAQuetXlDp', 'dbowers93@hotmail.com', NULL, '$2y$10$cOJq74m7rempXCdCMkmHBOVJ4rEyt74NXk9zGRfxUvTR17HTR1QCi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:28:19', '2025-02-24 20:28:19'),
(91, 'hzqGetFIUgNC', 'dcXFQGxcgOmJn', 'pt-PT', 'SkayUcBMjShoWl', 'annie.galanxhi@gmail.com', NULL, '$2y$10$Rsxc9VhbJNA91d7tEAq93el.PbLZOE1cumh7AUJ5mDRsAXsdCMUQK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:28:36', '2025-02-24 20:28:36'),
(92, 'fGdVfMepePn', 'cnCzVFxnbgvUDL', 'pt-PT', 'mncNPOrYa', 'nikita.ermolaev.0400@mail.ru', NULL, '$2y$10$FkeI29BZFh7V1b8aBPAfYOkeK1V4NPMiGZ3YujLRusThcTR56si36', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:31:41', '2025-02-24 20:31:41'),
(93, 'htoZZBxgHlNVrm', 'QxcEQCuKiUcB', 'pt-PT', 'TTDtNfrzD', 'fc-uwe-04@gmx.de', NULL, '$2y$10$kB3XoAPEszG20eMY5IB2xesp4SkTWCOC17qKH12feqmb.2O.pI4Gu', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:34:03', '2025-02-24 20:34:03'),
(94, 'PiBKtqHAlaeH', 'SNkQcDtNEMfBY', 'pt-PT', 'OJcatCOfdSE', 'betty.wangu@gmail.com', NULL, '$2y$10$aebm3BoPwusmd8eNOtNmueEivOTl/8HC5h7a075b/IanDD/f0GBCO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:39:36', '2025-02-24 20:39:36'),
(95, 'BsCSpkyr', 'NsqglVkoFjHlxH', 'pt-PT', 'kVYrHOKle', 'andri77@gmail.com', NULL, '$2y$10$hYNzNRs8Oc475yAEPBI1RuVzMAwdyIBzp3XSH2TtkZpBozvKi5lcK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:42:28', '2025-02-24 20:42:28'),
(96, 'HScMeIzKJvG', 'hZcfGiioIqSG', 'pt-PT', 'StQUzUAMEmkqwBg', 'hinak.huynh@gmail.com', NULL, '$2y$10$aCITE5D6cfrbwx2XMjzi.u3R0OTVT5AOt2gg4KSZqv/6NFLty6YT6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:43:18', '2025-02-24 20:43:18'),
(97, 'pKWaUNPrNuJA', 'NfiThnecF', 'pt-PT', 'NvlIFrWw', 'zoemeginsdavies@gmail.com', NULL, '$2y$10$ngY0Fvz74D1m9ox5ZVlw.OFNERTpcwMfbLLDF1HsgLMflasvzV28y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:45:00', '2025-02-24 20:45:00'),
(98, 'MitRUWjvhueckN', 'kdJlBKOuejtJZ', 'pt-PT', 'xkaJzzcuBbsR', 'foleybecky41@gmail.com', NULL, '$2y$10$Ihbx5sitHydWMlT/iyw8R./nB6pll4T2/g0q3Bdkx2KqkV.OU4wLa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:46:34', '2025-02-24 20:46:34'),
(99, 'DjOCsUxuyDIifma', 'jeJnsntgZcFF', 'pt-PT', 'dqbAcDxTfthG', 'gottman.kris@gmail.com', NULL, '$2y$10$YhMBJNn2naVEZ0Tj78ndCO11N/Z9Ms/svlKKXFHVcPKEf2lsyhn2G', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:46:57', '2025-02-24 20:46:57'),
(100, 'WdGzEnntvD', 'StBMvEBzSaeJc', 'pt-PT', 'pPrFzWcJvSppvb', 'jameslentondesign@gmail.com', NULL, '$2y$10$txtaEFMcSBLVhCbbrr9uqOS62lPquu9kLrsCAT952ccryY0zz4UVa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:47:21', '2025-02-24 20:47:21'),
(101, 'jzJMGvETOof', 'uFsVVsEyWNuJiJ', 'pt-PT', 'UfpOQRQJcs', 'danwarner@hotmail.co.uk', NULL, '$2y$10$VU6IjTjbi1TawYeL0QRJheVIhIRD4ahVsw5g7S4R.EVYIdnz6w8ry', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:52:10', '2025-02-24 20:52:10'),
(102, 'pOootYHcd', 'XKDSwAUgGgRRx', 'pt-PT', 'UxXiuXPLbem', 'kristina.owens2@gmail.com', NULL, '$2y$10$5E11GybGMWee327smAyrSOq0PgQQc8VXNShVRQHNO2pZby4.vLNmm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:53:46', '2025-02-24 20:53:46'),
(103, 'jMBPsUcGhEU', 'GLPzSsMHhPuVjdl', 'pt-PT', 'zXxnOnqi', 'vlmacrae@gmail.com', NULL, '$2y$10$VfiAenMrLdYs2ac5PHNvFOd42Y/DlB3MTiy2SAHnwBjW95k2YrSv6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:53:49', '2025-02-24 20:53:49'),
(104, 'VfTaonoqO', 'zwzxVjHZUFbI', 'pt-PT', 'yKwyWQrOhJy', 'clarence22552@gmail.com', NULL, '$2y$10$lHAyiYBv7K9TBDq4tIHD.ObmT73iMJdtX9LdvtBN35I0ULgkPvO6S', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:55:50', '2025-02-24 20:55:50'),
(105, 'albNwxmxAhRJijg', 'HIwXUjqKrf', 'pt-PT', 'yCSNORkJDqE', 'marijamsrnic@hotmail.com', NULL, '$2y$10$JT/jiVccetOruZ5vd9L5de42uP1SQdjhZs9HkUNlu.veUz7nHMTRa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:56:58', '2025-02-24 20:56:58'),
(106, 'BBkEsdcDflkgd', 'uTiVeXZvbFCIkZ', 'pt-PT', 'ZbfWubxujghRQ', 'mikitarose@gmail.com', NULL, '$2y$10$6MobtNFNeNZibRSp6DGsMeCnV.bZIF.iCcZ9CfozmqOnS8BXuuAQK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:57:56', '2025-02-24 20:57:56'),
(107, 'fOlTfNifeYwJYT', 'fSbSxwBI', 'pt-PT', 'yqTGyuNyVUZ', 'marymigiano@gmail.com', NULL, '$2y$10$eF5vY3LnLiEschSxfiL.b.iCjrEUWdcrjZ603lYKZGQE9I8fW/j7q', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:58:05', '2025-02-24 20:58:05'),
(108, 'UUgScEzS', 'QRTDbHYQWNqnR', 'pt-PT', 'cKToNEoJQ', 'periodec@comcast.net', NULL, '$2y$10$5d3DfLQcpfYqUOpVzsXMVukVInciKoQd.wF.yG0cIzm/XFoZDreUC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 20:58:37', '2025-02-24 20:58:37'),
(109, 'xqMkexGExMaj', 'hXnlLRbLMag', 'pt-PT', 'oaFrtdUyYzEuY', 'kelseycarruthers00@gmail.com', NULL, '$2y$10$GSYmo33GHU4uAqe1zZRJau.FVzzn2b2e/SrgW9iCqJHPTxClXRB8a', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:02:12', '2025-02-24 21:02:12'),
(110, 'CvHIErBJ', 'nxkQnBAjXgmpTx', 'pt-PT', 'gibMZeWYcJtjlg', 'bmcrocker1@hotmail.com', NULL, '$2y$10$QcgjeSllyK75DgC8LrPEnuIAdDaFgIAhTf0uu4KWG/mc2xgMULXuu', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:05:50', '2025-02-24 21:05:50'),
(111, 'vYMnYVtjYwd', 'PmmKbEQnlQMf', 'pt-PT', 'kEGyUveabEH', 'khmerkid14@msn.com', NULL, '$2y$10$5YGM5EUajoJkIL9AHqaJ0e.xwYZy3awkcebAPLWDJ0Y/T7FIpX/Km', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:06:13', '2025-02-24 21:06:13'),
(112, 'irbDMaDPdYuDPpm', 'DhJcwaHRlmOsaPw', 'pt-PT', 'OmGhIsbI', 'shearcrzy.071014@gmail.com', NULL, '$2y$10$sLNUncYPo6BeUC4SDoeXO.Y9XktDyhwrighd/Nb75b5RafTN1UK9a', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:08:05', '2025-02-24 21:08:05'),
(113, 'nfMlBDSthBb', 'kzrzXFthb', 'pt-PT', 'QKjpJYyVYleSlzl', 'laylahollyking@gmail.com', NULL, '$2y$10$pF61IJxjjRvVMy8TfGZvR.68PCZXc.ujF8lsS4x1wzfMXfxzB2pp6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:11:49', '2025-02-24 21:11:49'),
(114, 'WzIUbwUiZvz', 'PEXPXJcqbcnQUv', 'pt-PT', 'dllWBWek', 'garyjohnsonabc123@gmail.com', NULL, '$2y$10$OOtRhy2h9gb6yKAdbc0sQ.sRY8YvfvCZo4uyASKDzvJxAe/F4wRZC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:14:35', '2025-02-24 21:14:35'),
(115, 'oxeUbMOlmmZ', 'bHfUCDUuQFmxr', 'pt-PT', 'JZNfMJku', 'savanna.oeschger@gmail.com', NULL, '$2y$10$NO9vtFn3Ry3k0thW.t2Z8OKw/TJDbqzCP.AbTG2MfGVSPPqSJGXG2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:16:48', '2025-02-24 21:16:48'),
(116, 'llOfIdAo', 'yqKaBJFw', 'pt-PT', 'bBzkHOBEJiyTC', 'tdc9065@gmail.com', NULL, '$2y$10$0IcQxi6RMc8mZqDoX.QEXuJ/4Tc7hxCrepsOP6uHygJWC.D2Fhjy2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:18:01', '2025-02-24 21:18:01'),
(117, 'xdnjcjiyVtj', 'UUqIsoTE', 'pt-PT', 'OWtGNqeSmQd', 'tmowery@graham-allen.com', NULL, '$2y$10$U9VgMxXxovSBw2Uf1kttP.lX7DvJuLJLuMDS3CrVqevM3AbjmOU0C', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:23:20', '2025-02-24 21:23:20'),
(118, 'xXddNzuxFunOzyO', 'JNxhszdgomOGZ', 'pt-PT', 'GqfLOLeNPq', 'jasonraycantu@gmail.com', NULL, '$2y$10$9N5R3XqDRS5TcjnrDID0NeUBvnlhhzHSL6WJc/NPAO3L1yRQ8s7o2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:23:49', '2025-02-24 21:23:49'),
(119, 'syrWPdwkz', 'VKDEZfFQeJNwX', 'pt-PT', 'uHGXqZLJW', 'nickr@primetech.com', NULL, '$2y$10$3bgJGNyzc.jImXmluW45C.vGSDa4tHMI2QChghw3Hw7ZTLJ8a53Ji', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:28:38', '2025-02-24 21:28:38'),
(120, 'GmjZGBmfIzL', 'HyOCkDtEXMEZSvd', 'pt-PT', 'LTQzBdcp', 'iodations@gmail.com', NULL, '$2y$10$jUfERx9wUIPobqUHWU.6D.DKNugShjL8hCyNtPwcvhNNNiuFK0ecu', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:30:08', '2025-02-24 21:30:08'),
(121, 'xiajHsHWMsFNZum', 'oWVaGzBFDKKi', 'pt-PT', 'FXLtiIqA', 'frecordsshock@gmail.com', NULL, '$2y$10$LHeknR/2ohkMw5HXwOfl3.KZcErS6OTNlCBN6JavsYo9x.C63k4cO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:32:40', '2025-02-24 21:32:40'),
(122, 'WLnGHPpbJ', 'mLnsRHnCggPsGWF', 'pt-PT', 'OKXoSBAlaMHpHVs', 'baybeedoll14@gmail.com', NULL, '$2y$10$/2RzF9ASuSYFCt4TvlnPqONo40GJad1g8DztsTc.Fr96/ohwZg0U6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:33:03', '2025-02-24 21:33:03'),
(123, 'hKvdADHogK', 'HFrCSwnXJb', 'pt-PT', 'dwVXsqardOiV', 'claryrapidplay@gmail.com', NULL, '$2y$10$2DaFInBax6PyCH6WMvkV/eAc9L.gKt9.QhFpAWSesbhBtJxZooDty', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:34:50', '2025-02-24 21:34:50'),
(124, 'GOAnzSlQbuZpaBC', 'FXXodiHmiPDT', 'pt-PT', 'slKVegahLKXncZ', 'hayleehawkins20@gmail.com', NULL, '$2y$10$mOqLV5tbNrz6bPwrxmS5nOi38SnV3S.ZUc/69lJqFggHKFnx8b3ja', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:35:31', '2025-02-24 21:35:31'),
(125, 'mauXBZvCaFHpy', 'SurCMEUNWhMz', 'pt-PT', 'QAzGRdOEmWIA', 'margotvthomas@gmail.com', NULL, '$2y$10$qIN/U9E90wTFEDmfcOzkx.7.yhDcXcBTkgIZe6TPhEuMpZ0WT5AXm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:36:57', '2025-02-24 21:36:57'),
(126, 'nTGGiwQhNmjZYW', 'FpzAxDGcIFjXeAX', 'pt-PT', 'EdpsTcQK', 'madeline.l.coble@gmail.com', NULL, '$2y$10$bksc.CxxcOuIBs2LbKTbz.epJAUvkpnZk.R4C8.Z64kguINiou.ju', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:37:07', '2025-02-24 21:37:07'),
(127, 'XiFoZzDcCfa', 'nQQHeetfqVsfE', 'pt-PT', 'SznmqIHtCrMKv', 'sunright5810@gmail.com', NULL, '$2y$10$YwQ20OuRUXCNiqEHWm95hua7MUAFmdgHxwpjIVoFfBv8S6y8WFtm.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:37:09', '2025-02-24 21:37:09'),
(128, 'nNjghojhT', 'YFXDaGmxR', 'pt-PT', 'hXiPvmfwK', 'tyup42o.1@gmail.com', NULL, '$2y$10$yYM1Ch6C9OJO0v6L1ApTrugn1WBSDNWCxrUan159iayWCO0Ks8ewC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:38:29', '2025-02-24 21:38:29'),
(129, 'QdpxGlST', 'ZiwdgYCnFRi', 'pt-PT', 'AvGsEWsJRAezr', 'bob.wa.rd19@gmail.com', NULL, '$2y$10$J91UqjAbUH3aeKk6mIgvL.yjnUI0riHuIg3s3siVNd64wfFQ55FgW', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:40:37', '2025-02-24 21:40:37'),
(130, 'xoGopDoPsL', 'jjWuYWhpa', 'pt-PT', 'EfhzMzRq', 'konrad@msdexp.com', NULL, '$2y$10$XemLMTcqHeQ5ChaZ2JvJweE2tItCzg4O0QWWTyjxMw4z4ASzPBnmG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:42:04', '2025-02-24 21:42:04'),
(131, 'LFAmZcLaguWwQE', 'qiuaAKozK', 'pt-PT', 'NNnKeZzRqoD', 'robertjordanstar@gmail.com', NULL, '$2y$10$kfma2m3GBZKmJmdAV3LVg.Gc4jrFgQx7.0gT.QWZNkpJnE0pTa77e', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:42:42', '2025-02-24 21:42:42'),
(132, 'vKVvAQkxVwj', 'tTpPFOyHCCf', 'pt-PT', 'uiwKgBhyndC', 'harringtonsara66@gmail.com', NULL, '$2y$10$e075t92VybqdQQStR2KefuEj1vNcuWrifwDJaBROXQGDkTmeoJHWe', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:43:43', '2025-02-24 21:43:43'),
(133, 'QPtijGGJAiO', 'tEGgodEJr', 'pt-PT', 'pAWthpQbrW', 'harris-m11@sky.com', NULL, '$2y$10$EMI4RM1VFLI/ePPq8ms4JO3mE778YlZBCzqL73PVRDOsJAZGWAbou', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:54:25', '2025-02-24 21:54:25'),
(134, 'lShTvGsUFhpjkv', 'kwxBLCEQmE', 'pt-PT', 'gvGzlcpau', 'coste.nsc@gmail.com', NULL, '$2y$10$IcuAjvb0GcRKHxIINoGOVuDC2z39NcjhZ36Z2AbPerxwA6sAxKsWC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:55:24', '2025-02-24 21:55:24'),
(135, 'oLrLuqaEbG', 'kuCuRWNea', 'pt-PT', 'qLCiauSIPTfp', 'hosteriasenoriodebizkaia@gmail.com', NULL, '$2y$10$MIkoUJv8M2T/I04aH0kt8u0keksSBXEdN5Cta03NZy/VQv/x2Bf2y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 21:59:33', '2025-02-24 21:59:33'),
(136, 'hrMrrOWlGZHdKh', 'rnqOZiGm', 'pt-PT', 'FwfhGjPDdBGV', 'evetsenots@msn.com', NULL, '$2y$10$In43e80d../swOyUUt0x..mixPj0dYc1o11PVMGZ0rVvjI1BHsf9y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:01:46', '2025-02-24 22:01:46'),
(137, 'WtbKxXes', 'xQamovHy', 'pt-PT', 'UlYPIqTv', 'mickey@century21lemac.com', NULL, '$2y$10$4X80rBgjAOxnfCWXiFpho.BdknF9YPrA0481JW/NjdWafGJxNDwwm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:10:35', '2025-02-24 22:10:35'),
(138, 'JSvOlEYWS', 'bxauCtAmmuOD', 'pt-PT', 'ardlspynNWPYuQQ', 'sophiaapril92@gmail.com', NULL, '$2y$10$V9VT1K./ivP2TG9Tvhv1RevRFIqOT8UdpTwVF2Sguu/9SKDoGKVRO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:15:08', '2025-02-24 22:15:08'),
(139, 'gNuhWwVy', 'tKzNqiAEcmahJ', 'pt-PT', 'zWQnlmBVEAylmUb', 'array2012@gmail.com', NULL, '$2y$10$6PUhaff5qCiFHN8JKS50Jek3X4ed0tuxL1AYmBQHklAQTOK8eMuVS', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:17:34', '2025-02-24 22:17:34'),
(140, 'rOytbgiRqnvhl', 'EevcGBqlzg', 'pt-PT', 'YPOJeIQl', 'jeffreyrbrown14@gmail.com', NULL, '$2y$10$9CTg9oz68N6TprPZB31ZQuBCc7mXQ6fdwz5R6u1Z09jSQwr/ID6uy', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:17:40', '2025-02-24 22:17:40'),
(141, 'GWApwNWzycRNdA', 'aixhceSIlgqE', 'pt-PT', 'fllgbqlElPgpVqS', 'tritonfarm@gmail.com', NULL, '$2y$10$TKzS4EtUp6mbFx0uzRi/tOKTtEvGUD2j.HzoOjbZkYuPbvP1Tpljq', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:20:04', '2025-02-24 22:20:04'),
(142, 'nOkxahhaf', 'TnhmwnZGt', 'pt-PT', 'byXGhVNQdMeJiWB', 'allison.spillman@coastalalabama.edu', NULL, '$2y$10$tEku.iPS4koYLkX1CF5i5.a/nxaclqe8HWDEwwKpbBzDNWqEqv5Pi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:20:04', '2025-02-24 22:20:04'),
(143, 'XvYeXSOKobe', 'vBxqDbmZNuUayu', 'pt-PT', 'VUmMojlB', 'michael-mitchell@live.com', NULL, '$2y$10$rzE017CN8bKlZ7Nz41WDaufFDfkm7iCeBmI9MDY5IGt9JCvEj0.p.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:20:35', '2025-02-24 22:20:35'),
(144, 'nVNuTwQE', 'rmjntKcErl', 'pt-PT', 'cBhHRkDQ', 'rod@kaufmanncpa.com', NULL, '$2y$10$c5/BSCMto3OavPtoCJhYgeSDv/Pf7IqBLa8RayH/mUNcFA0OoLRIm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:21:59', '2025-02-24 22:21:59'),
(145, 'AHmJLMgsOxA', 'iuPUMqsT', 'pt-PT', 'avHVMNbyatVGS', 'bob.ward19@gmail.com', NULL, '$2y$10$R6dG6YFXvecqVUJqS6GVk.Fwp/EhO3HKxR/9ci5eMUEfzPWHUv3Rm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:25:58', '2025-02-24 22:25:58'),
(146, 'CkCcZZTuEc', 'BUXshyqnEzg', 'pt-PT', 'cjanftCnIiJbFq', 'dginsberg92@gmail.com', NULL, '$2y$10$C6NtMdoC5RDjXMGmstwHKebmqGa6WeIPY2NdcwtxHOchcrYlyKQZm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:27:56', '2025-02-24 22:27:56'),
(147, 'OokKnvLCAwTtnk', 'LzvUrBunmFPVDRm', 'pt-PT', 'cJqvPVHPl', 'capt.jb@furykeywest.com', NULL, '$2y$10$HJlL8QiKORauivsGZafIGemBiQ.b1GP6F2mW7qvz77kx6HPaBLHxG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:28:17', '2025-02-24 22:28:17'),
(148, 'JEFjZOhurV', 'amuPyRwO', 'pt-PT', 'UgzzLpqnjUY', 'nnpmt@energize.net', NULL, '$2y$10$/2faS7pk0ILscYWsZxi4VeZuDWOEPhile5u42Spd8fRnLD.PeoyRC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:29:14', '2025-02-24 22:29:14'),
(149, 'mSUOJIKC', 'BWOojFxyTffhz', 'pt-PT', 'EXQcgGMgoD', 'dmolsen10@gmail.com', NULL, '$2y$10$nhIjeyJvomJTPfvn41LcJOgIkBMiw/YuMQ6uJIWlNA/c7SWohprJi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:30:22', '2025-02-24 22:30:22'),
(150, 'TmmHlcgH', 'wirBnxjWr', 'pt-PT', 'FBYxhPxTc', 'justmeandyouyolo@gmail.com', NULL, '$2y$10$0V2dZpcbxENFb8OGcLMdIet5AcR1CHxGNLN7qZiqh7spccb7CfQD.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:33:58', '2025-02-24 22:33:58'),
(151, 'TgYkECtfGXUSZ', 'RklxsATS', 'pt-PT', 'UjZcwCBEKvKx', 'eugene.nash@tyson.com', NULL, '$2y$10$ssUJG2Zy8FouL2vGqnvrk.annD6Z3uphI9PtjJa5s801TswSyplk2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:41:40', '2025-02-24 22:41:40'),
(152, 'aTjJPENIFYeagvp', 'bcLoIftVwcJl', 'pt-PT', 'ZLESXXuuCDIhjU', 'mgarza@evolent.com', NULL, '$2y$10$NPGQxaK2JjPYVXkp2wAuaOSiOEeCkM9a8144S/FnZjkPLpF0keq16', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:53:20', '2025-02-24 22:53:20'),
(153, 'mdmhlDRsLVzO', 'ViWEssGMQ', 'pt-PT', 'sHzylxFM', 'volker-hempel@web.de', NULL, '$2y$10$D5q68iGv/xh4mnbyFNnt7uCR5fo.ocDbjr.SpSlQPNAnvWgV9VfGC', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:57:07', '2025-02-24 22:57:07'),
(154, 'zpAFIEqUiieUin', 'KahBcHtEaF', 'pt-PT', 'WdDAfjwagU', 'dnalytnnav@gmail.com', NULL, '$2y$10$ikLRyaz5FN3L6SjKCBeezO6HDCe6qii0uOHaOOx7BAOwWy101AOu2', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:58:06', '2025-02-24 22:58:06'),
(155, 'YyXqbZKfegKngCS', 'qIGjiWDfzrV', 'pt-PT', 'CuncDGUxukKk', 'brendajonesburch@gmail.com', NULL, '$2y$10$6GG1u2ZeTxdu9PUwlZ1vieS41paPLYhQGeb.YtDFK0Dsx3u2G0yJK', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 22:58:16', '2025-02-24 22:58:16'),
(156, 'zNHsSWkDwu', 'NQdYqqdDgeYVEY', 'pt-PT', 'dShvofdf', 'jerrybettyj@gmail.com', NULL, '$2y$10$Sg3WL9CyKTkcS6RyjFEuR.GuTHuYp6F3Sn63Ofet1zJCa/Nu8Qh9i', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:02:02', '2025-02-24 23:02:02'),
(157, 'KFnLDYHU', 'YWEMgNEaSjYBBL', 'pt-PT', 'MLINYLfFWXZG', 'shailesh.maharjan@flextecs.com', NULL, '$2y$10$9P9ZbYvfF9GgZ2AItri73.9xK2COkrHrDhCW.KxjTp4vHC8sEtZve', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:05:43', '2025-02-24 23:05:43'),
(158, 'WHAyHRUVsAbIg', 'OOomyFyowGHzJAm', 'pt-PT', 'jCIbbHHAGXTmfu', 'moore.aarona@gmail.com', NULL, '$2y$10$.vE88LsdinzEjde6.eET5./FqK3JAcL0h.Ou/iB5YhFitkD7Eprty', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:08:12', '2025-02-24 23:08:12'),
(159, 'UaQXwllGYTgdcUU', 'lHzVxqLGjTuzfkx', 'pt-PT', 'ooNrUzRpxbCKgR', 'georgejorge9@gmail.com', NULL, '$2y$10$cputJwxiiQKjvyheuts6sOBVVr/E0D2a0aBGmSglJpUv/Os6jlq8u', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:08:51', '2025-02-24 23:08:51'),
(160, 'pHgdqdLbdWzK', 'QzPdvmxj', 'pt-PT', 'pSRBnqKeSrRNdk', 'loubless45@hotmail.com', NULL, '$2y$10$GWhq61fK2.mwyfSK3nYJ4uXWisBf6sVKWJoSPtBGaRvxj8srpFgLa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:09:27', '2025-02-24 23:09:27'),
(161, 'btCzgSXUpyI', 'KjdkWeDCvq', 'pt-PT', 'NLfauGImyneB', 'librabigred72@gmail.com', NULL, '$2y$10$.QSe3H5.0cZhx3K5oUmRge08fNH4vsiA80oRDvwjU4cpTOAof0kiG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:10:18', '2025-02-24 23:10:18'),
(162, 'BLBcMUmjryfl', 'ESOgmNaZh', 'pt-PT', 'HIUmQEsq', 'bill.alt2409@gmail.com', NULL, '$2y$10$WGMajohZjEtZSaJBGgNvaOHuj.eSXddX74tH7BOdbPzMGo0iSRPSi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:10:37', '2025-02-24 23:10:37'),
(163, 'qHxffrsfMQUM', 'pGBBJWtlvPczjg', 'pt-PT', 'dkVRIBZZ', 'kay79924@gmail.com', NULL, '$2y$10$Y2mDpN.syLt63M81IoS6VeRLOYRPzGnS8r4gVJT.6Kdvqr2uBrkgO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:20:11', '2025-02-24 23:20:11'),
(164, 'JNNQbctZUdrBaXk', 'bejDwzaoT', 'pt-PT', 'vxATABTUkkG', 'ost.er.eo9877@gmail.com', NULL, '$2y$10$spgG/4A1/WZF.GrGoMN/KuaMG0xYjApyUpEfqj8jbGo0VFzESQGIG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:21:07', '2025-02-24 23:21:07'),
(165, 'pCjReDXRtvWTQhb', 'mGLhvxYP', 'pt-PT', 'gVecTjAdV', 'cindyannslegel@gmail.com', NULL, '$2y$10$fsLSqEMlRvKtwSF6mxykeutY4iYpdSAvkbpeBILf9dXydp2/YZ2nO', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:25:54', '2025-02-24 23:25:54'),
(166, 'fvcnehDR', 'LLiQozfJTZsesg', 'pt-PT', 'NTSdggXbwFuu', 'archibaa@hotmail.com', NULL, '$2y$10$QDkKUtDIsje7.Jp4hDKOoeiTyTYAo2.R8dKQgfOEu1Fs2hF1bjkOm', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:28:48', '2025-02-24 23:28:48'),
(167, 'kOBfqAlGzlH', 'molIWWTwjyqW', 'pt-PT', 'klzHUQfXpREf', 'matthew.b.lowe@gmail.com', NULL, '$2y$10$hS3hVAFALp9us01ZI9KJ1uohzgftEc0NOV4OR40SgTgEXzFGVmRgG', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:32:43', '2025-02-24 23:32:43'),
(168, 'TAyKpxIoKJ', 'sBwgArpLHFPmiFG', 'pt-PT', 'TssfaUTlRWwXWV', 'greg.burgess@sunchemical.com', NULL, '$2y$10$gpRv3BI9dlzYQo6AgOtyPea9nJflcK5CvIum71dvYOvW9Bpx4PQe.', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:32:59', '2025-02-24 23:32:59'),
(169, 'LEoDjgDfqkcPK', 'aYEVgBjmW', 'pt-PT', 'eRYapCtV', 'samantharbarnett@gmail.com', NULL, '$2y$10$D2sjz3ZLeIayLECkLMDbc.4vRpxRPho2.7T6fQTWKH7LegcdVVOO6', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:36:17', '2025-02-24 23:36:17'),
(170, 'ExIfNfTZ', 'xbDWHvUGBmsbIK', 'pt-PT', 'qMEdSsnogCafjW', 'enquiry@mhglobal.com', NULL, '$2y$10$Zm6k2EsnYh8HoPD49g8H7Ob/uu07epPEyPV/yCeasxE9DGZvh2eKi', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:39:58', '2025-02-24 23:39:58'),
(171, 'ZkQzvasvjNax', 'orFHlmrE', 'pt-PT', 'YSiqBoseHBbVvX', 'luih715@gmail.com', NULL, '$2y$10$yVxMgqBHQkRkLNynIOc3qeTjU7QRbAjC0FMS8F4MzRYSMo4ZN8JbW', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:44:29', '2025-02-24 23:44:29'),
(172, 'RHyMwFnexPfbHlw', 'wUsZNkryqqN', 'pt-PT', 'GXwxrjuvl', 'revathyganesan27@gmail.com', NULL, '$2y$10$r4x5FLl7dXrgvDNNoyO1tuhSLnv66gpy.I1rQPU7iHLLCnq6iuz5y', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:47:24', '2025-02-24 23:47:24'),
(173, 'uCnICEqHd', 'jXpOXxIlglvfkh', 'pt-PT', 'fRtNIllYOnweqci', 'scottybiugrad1971@gmail.com', NULL, '$2y$10$rQ5Of7Ri0bdsq8iu8OPUqOAM7rcS/UjETs1VYfdaNTWWdUskMLawa', 'CANADA', 1, 0, NULL, NULL, '2025-02-24 23:49:20', '2025-02-24 23:49:20'),
(174, 'apgwAtGSRQTiDYk', 'pfWMIgfwFFlnSv', 'pt-PT', 'xEHEBIXWrq', 'joshua2793@comcast.net', NULL, '$2y$10$henOh1d22yMyRvwmruAcD.5sQ3bZ1jqrGBR7DwOOBVtRWl7rPl5JS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:00:46', '2025-02-25 00:00:46'),
(175, 'GXEGyBbt', 'zYGkiqbVHl', 'pt-PT', 'pAAxPECCszpdjG', 'jodyluscombe@hotmail.co.uk', NULL, '$2y$10$tk8r3oSuNGnp5wALfEMkMelbITPIdmP1uutcAuUgfcgER4hR.BClC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:01:41', '2025-02-25 00:01:41'),
(176, 'LkYbMmtULtvKOlS', 'ONDzVmKiSJez', 'pt-PT', 'MPqCQsCI', 'nahirab11@gmail.com', NULL, '$2y$10$2H2YUJeO9Nc3QoTm.jio6eM8/dOaRe8BorCKbE4XYHizceI.FAsNO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:06:34', '2025-02-25 00:06:34'),
(177, 'REVSxRVt', 'LwAhpSnalBrXXoR', 'pt-PT', 'SigYIkTpmhNh', 'ryoung@nge.com', NULL, '$2y$10$BzSC6jCO73wWnUaOc/3ygeEif4mU0a3ptvCWIPOjZaHroaUOw0EjO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:10:01', '2025-02-25 00:10:01'),
(178, 'elCetGgjo', 'ynsKYBdLjkGJB', 'pt-PT', 'XQDpmSsE', 'loganf@ldsco.com', NULL, '$2y$10$PmWDb9X6xRW/35vn046/b.tdFXDCSz2ZhLFuK1nV6pyletMtNaPqi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:12:15', '2025-02-25 00:12:15'),
(179, 'BGkSlSqcylAIdag', 'mqtrRkHuQIQPQUS', 'pt-PT', 'PIPEMlwn', 'lrodgers105@gmail.com', NULL, '$2y$10$GRConTxMmMpR9CGVSrI0yeFAFAizVW0dHdjwxqmVNEKmCh9rE4BWm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:12:53', '2025-02-25 00:12:53'),
(180, 'lvcBxlEFyjrRI', 'KUVZnynX', 'pt-PT', 'ExWSpWJIBFo', 'alexa.campbell@qchi.com', NULL, '$2y$10$VfbPFFadv4XZdETkEP0gFuVDI/vKj9ib0YH.lH4nXuWMHTCJCJ3S.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:13:42', '2025-02-25 00:13:42'),
(181, 'cVAuguHjyJf', 'IFEtmZSw', 'pt-PT', 'CaTCYugf', 'natasha.stephens1@gmail.com', NULL, '$2y$10$t4G3dsGJg/KHYKbd7tWKLe0maZT5876MhZFBRmqaCWEXAiQkwbku2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:23:57', '2025-02-25 00:23:57'),
(182, 'flbqxStxRX', 'MqyWmYgEd', 'pt-PT', 'GdKTXhwzKJ', 'samue.l.pena81@gmail.com', NULL, '$2y$10$PLPmM994cPtDAS94Bh1fse1AudvGkkUDqkPcsmmdu3Ny8LXFTtdLC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:28:47', '2025-02-25 00:28:47'),
(183, 'tvEOyhQSVFi', 'VAJRDiWcgaVgg', 'pt-PT', 'FBQPBCGKjT', 'ypaulo.49@gmail.com', NULL, '$2y$10$ur5223JtQnPKdViVr/ZNYu41.8jbRdQea8d0djLnQIFSuENZVgTLy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:30:03', '2025-02-25 00:30:03'),
(184, 'RzPYeDMXbKb', 'JiFfSRiAJuIPDJA', 'pt-PT', 'HiMkETNn', 'samu.el.pena81@gmail.com', NULL, '$2y$10$5X5W6wZYCpjw6XS7x4F8dOT.fSf2iyMA7Y/7XZeRTGiOxuzEBmhZy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:30:20', '2025-02-25 00:30:20'),
(185, 'fpcLrneToZE', 'UIAfchbppo', 'pt-PT', 'wxdyILauWMg', 'darrylpark@gmail.com', NULL, '$2y$10$kwOEQh3MiGwLaofpSNtBAOa.445d.5yBoeZ99e/kQ0./q0Aw2ndV.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:30:55', '2025-02-25 00:30:55'),
(186, 'ATUNUnfKgI', 'LmlOudje', 'pt-PT', 'KhCNOyLBb', 'yshnic@gmail.com', NULL, '$2y$10$miiPYyQ3KfxbLKFxr1GDVOTJti4aLO7PeglUoNDgToFFFy0SdUCNq', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:33:00', '2025-02-25 00:33:00'),
(187, 'AwdJbnJOLHIWn', 'qZhjiHdYOciar', 'pt-PT', 'BnWHTfWzIstMX', 'margaretbenhke@gmail.com', NULL, '$2y$10$wDvDdwhWT/ueDUpCUbCSK.TgnpTT2WTGkDoLtF8qHPxCKtNw5TjFm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:37:30', '2025-02-25 00:37:30'),
(188, 'DHRYloIFJoyKN', 'dIxLPhjLV', 'pt-PT', 'LgSzdFpBKHnILVB', 'cindysch7@gmail.com', NULL, '$2y$10$ugqQOwHnFVwSrAtM.DUnHeZH0LS/PHbv4SzUQ0NZsHqAsRJA1/AYO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:39:06', '2025-02-25 00:39:06'),
(189, 'nHdmlrBgoy', 'fKdYHLXmC', 'pt-PT', 'tcbdPCOd', 'dreese@watkinsinsurancegroup.com', NULL, '$2y$10$PWFthe32wNGeUxrq/tlTqeK2g/URmWGKbzxSNm6pvsBaU6xmNRcdK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:41:42', '2025-02-25 00:41:42'),
(190, 'hxqiLzuoudIFbY', 'kutEhAewisjozcc', 'pt-PT', 'PScLBBtEVu', 'pboltz3615@gmail.com', NULL, '$2y$10$o0t0ZMIrS6SKBvpyEVKszuzPAa3m/H6mki.6i0nHge6HQ4J/QC.CG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:47:34', '2025-02-25 00:47:34'),
(191, 'yEAxTKnHWP', 'cqADgYcdlGIqn', 'pt-PT', 'UPzrosRTULhY', 'meandn_4ever@hotmail.com', NULL, '$2y$10$ktwql0ixnpCYmlzMk6FrSOdJ4dU92sz5It9fJhChl0Gbxqv0JVu5O', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:49:35', '2025-02-25 00:49:35'),
(192, 'KjPEgyPtpUYdwr', 'omMtaEXJZbvZoMg', 'pt-PT', 'cfGaLlatBbdpb', 'aneff-glow@comcast.net', NULL, '$2y$10$EliADSIZ3O9SWBj3XNddxevzv8vp5thsFUNH9zlKoZn6x1ua.8IKm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:50:17', '2025-02-25 00:50:17'),
(193, 'LvrVajGWRr', 'jphsNvUcQvgVODc', 'pt-PT', 'wHYiZsWSAwqPC', 'jeremylinklater@gmail.com', NULL, '$2y$10$gi3BLcdL8dPiojR.9J1l1O/WwOeAvXY7DgHi6iAQXwIR9IbTmZIv6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:54:46', '2025-02-25 00:54:46'),
(194, 'ExIVyOgvmT', 'LYaiKHQseVWnj', 'pt-PT', 'nIrMGRfOW', 'rbbancroft@gmail.com', NULL, '$2y$10$RGFhuYuscIsF.4by8ooSseq6b/I8nBgxE4WRYodzF3p1Kb8Gyiboy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 00:55:56', '2025-02-25 00:55:56'),
(195, 'lmDyjFhmwwNr', 'JnLzUnQLmAJMnY', 'pt-PT', 'xBIKicoHLrCGyR', 'abodovsky@appliedconsultants.com', NULL, '$2y$10$5AN55B3A4k0DFGXfsvP5bOAkxNFJ807LGoBJ7NhNQQAb9XZ4DBCIO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:09:50', '2025-02-25 01:09:50'),
(196, 'PcqzvDRn', 'eOAzCdmqjcR', 'pt-PT', 'HNtyXwaOm', 'demario.cruver@gmail.com', NULL, '$2y$10$0vCZB0KJa/RQRZLuz3Rk0ul80pqT9k9ECsSBXxPz500BiOd6p3XK2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:12:38', '2025-02-25 01:12:38'),
(197, 'qynngyFAR', 'JzoYidMmQorgGy', 'pt-PT', 'UBQQbysHml', 'kody.chumley@strongholdim.com', NULL, '$2y$10$iw2slwaaBXv0RupORSBQvOCpqkPjH4J9WYxY6lzMrMDy85waYtLsS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:14:25', '2025-02-25 01:14:25'),
(198, 'EFZDajHML', 'gnPOQncKjKx', 'pt-PT', 'AkFDdldhAw', 'benklinger02@gmail.com', NULL, '$2y$10$Fj9WNzwE4yv0mnITrnJpEOAOnukdk4KIfoZR6kDZjN4pqdAsGlBMe', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:21:13', '2025-02-25 01:21:13'),
(199, 'utFnERUK', 'gPsZbCHR', 'pt-PT', 'BVCoAbJRlWE', 'christiane_d_f@hotmail.com', NULL, '$2y$10$Tac844ZkxBNO0BBQm1skSe8W5l/MYf4zZU/v3YfS5zPgiH3f./zZC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:22:47', '2025-02-25 01:22:47'),
(200, 'KJRiFWMlfMh', 'QLzeLNaZM', 'pt-PT', 'HnpWRJvRw', 'dprzesiek@accurisksolutions.com', NULL, '$2y$10$Y0oRI7ISrHHEwLEl656Q0ucbweXIEm3sofmwRAtzdWThh81ovDqFy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:24:01', '2025-02-25 01:24:01'),
(201, 'UjOvhVknv', 'xOaaAvgvLtTefC', 'pt-PT', 'vVPEuAdFHiYgm', 'griffhencopoo@gmail.com', NULL, '$2y$10$AJe0.U8MVTsrO6om.2ckpe8wIdOe4mItBU5glrSFiZ0jGH6CVguV2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:24:07', '2025-02-25 01:24:07'),
(202, 'ibcLGjREnWcq', 'FSzWtWgKz', 'pt-PT', 'tywdezCxK', 'jaqjab68@gmail.com', NULL, '$2y$10$Z6olqgDCS1xy2rf7.07F3eqcMU4bOPZEqVzxMjPI9z01udbUJ0a42', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:24:20', '2025-02-25 01:24:20'),
(203, 'TGeSEfdpJ', 'PSVqruLyDsXYWX', 'pt-PT', 'GsCJvqtAWuBnfK', 'sven.cortesi@gmail.com', NULL, '$2y$10$z2q0q4002fLWxMW74NewKOAEtPaqb5V9v7GMdFu1MWuY2oZC68AJy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:25:09', '2025-02-25 01:25:09'),
(204, 'zJhzFaalCJRNTT', 'ATdvamLzS', 'pt-PT', 'InwMGSZTuY', 'ajponcelet@gmail.com', NULL, '$2y$10$zCfE5iK3jADXtrWdIIu.iuzmm8Htc2uXdoo26XhQ7OsR4d5bhaQ9e', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:32:00', '2025-02-25 01:32:00'),
(205, 'EPrZyHkZrWUROzA', 'wgOUAzkQeJYTXVW', 'pt-PT', 'rwYsqBdgcYKvPc', 'mdzenowski@live.com', NULL, '$2y$10$Qq1HJcGA6a3bXNZye0PYPOwVVSaVMjGHdLblgKxTK5O0LirbqtAqW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:33:46', '2025-02-25 01:33:46'),
(206, 'NLKKeuufTRaE', 'zgyLCJqDlWfIkoa', 'pt-PT', 'IdKUHlLRMAypl', 'aidenarevalo06@gmail.com', NULL, '$2y$10$j8euqnHQU3QRmXsUXcxv1OrIR3CDSWhBS4XQ4ExTlZtw4fBRjtP2y', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:33:54', '2025-02-25 01:33:54'),
(207, 'dJRWHGifTg', 'qQnctJtlLSwQQcT', 'pt-PT', 'OexBuwqhwprefS', 'aly.rayani@gmail.com', NULL, '$2y$10$iIwJDg7H9WOKAZAlfGL8a.etEXZXqnSe9ktv0xjbiZaEA7lNW7qJK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:33:56', '2025-02-25 01:33:56'),
(208, 'CPOhNgqnmHu', 'jlIdRqwyZAPGjrX', 'pt-PT', 'sWdunLXHgk', 'halorayne@gmail.com', NULL, '$2y$10$jg4/sKLBDjg8eSGT8CZh.e5AFkaYxywKNM5KT8LtKd0Z2EpKc/rFa', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:34:33', '2025-02-25 01:34:33'),
(209, 'bSWUboFkSx', 'luSwbMgKEBLY', 'pt-PT', 'MKTEYNeA', 'noah@ppmapartments.com', NULL, '$2y$10$iIIYZVEzr0NqiHn1xom1..mq6nw8rlb/i0h5oV/cAIPh5U5SUD3Ia', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:38:03', '2025-02-25 01:38:03'),
(210, 'htQxKaTh', 'LWhYNtHAedoC', 'pt-PT', 'GkEhdnOvmfLt', 'sdhala90@hotmail.com', NULL, '$2y$10$vtMzXOtzwjee7od1Rfwo6.1ejzuy.eyTqQ5ZTGz.KMqp2hQxAnoeu', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:40:06', '2025-02-25 01:40:06'),
(211, 'MtOWTHUdFr', 'lbUPQpZKRh', 'pt-PT', 'kPiKWQfx', 'thecamerongarrison@gmail.com', NULL, '$2y$10$8yZpulAhrOQ7B8PmidvfCuNywN6W/XYXlO7i8Px.dpte7FScMGF0G', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:42:05', '2025-02-25 01:42:05'),
(212, 'SUBddoKLk', 'uJnQZeUE', 'pt-PT', 'NAgwynPttbEmF', 'barbsarkany08@gmail.com', NULL, '$2y$10$J8GTQPDHlhCoS6kSlGmLKObimKeHo4ChYcGzN4hPaJlS8JeAWdmIC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:43:18', '2025-02-25 01:43:18'),
(213, 'AKQRmLgbMIOg', 'twKiZWkLjqFH', 'pt-PT', 'MmwFzIcQjCvCzg', 'mstlgrant2010@gmail.com', NULL, '$2y$10$mMyC.3CnxJjRJk.OuN0xWuEd/Zx8IzLuQnAFZ.N8VS0MpUIJ8YpiW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:43:39', '2025-02-25 01:43:39'),
(214, 'MYaaHolxT', 'utgtHJlgseSRi', 'pt-PT', 'zurfwrBVcOBcxEp', 'radoc.janicec@gmail.com', NULL, '$2y$10$QZRqGb93k4cfjpY3f1fibOor9t6SaRrcLESO4D7/sIv1IdKEwc8O6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:44:42', '2025-02-25 01:44:42'),
(215, 'TACnmzWH', 'jlOdGyRXraZ', 'pt-PT', 'bVUnkpogzdyeP', 'adam.jay.gilmore@gmail.com', NULL, '$2y$10$N3.mvErl/dEz8T9pNVhmLu7iJckXAAFY6hL007dAmotwCT12X8KH6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:48:35', '2025-02-25 01:48:35'),
(216, 'IrkOUAUqXi', 'AbkDjozyOD', 'pt-PT', 'vAFrknpP', 'ratadj@hotmail.com', NULL, '$2y$10$oNirCQdwhrj2JpELNEEP0eTl9lDHnCoz.VyuI/z/DBqhmXTaLceI2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:51:20', '2025-02-25 01:51:20'),
(217, 'brGeBeXAj', 'UBshvsQtcmytSm', 'pt-PT', 'PbWurdGlIcg', 'gog.enise@gmail.com', NULL, '$2y$10$IPG49Yvejz1RQxJg1gl9s.mOhOSUww6kkD5hXNvn/2Ao9E0IUTUAC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:51:52', '2025-02-25 01:51:52'),
(218, 'fFlpIGfsWwv', 'JiTROFNFkbKc', 'pt-PT', 'PBNzingBIEiQZTc', 'warr.iorcc1962@gmail.com', NULL, '$2y$10$.6.TNlen9qmoaxP7rv5NguKi9XQMIQuI2mtR6Gu4o5Gl4YpoKXx1O', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:52:51', '2025-02-25 01:52:51'),
(219, 'LjQdfGMtl', 'wIVnwOxnucjVkf', 'pt-PT', 'nNmbXCixt', 'projo198@gmail.com', NULL, '$2y$10$xXcMy4.NZWJsBXlXA9lFTu62SoDJ.ygnT3vp2kgoY.c/bxuAPpvv.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 01:53:16', '2025-02-25 01:53:16'),
(220, 'cOrwgcasgHkaNV', 'BwiJzEYKEPNqzi', 'pt-PT', 'HJiAZIAC', 'steffen.reichelt.1969@web.de', NULL, '$2y$10$dvJWJlNPHri9BnsFgYg.R.sP.ekoljxm3YUogyqJXqXXW4YIcXmku', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:02:06', '2025-02-25 02:02:06'),
(221, 'mhSoZSCaxMLz', 'JIOhqbTXiTZkC', 'pt-PT', 'eXMZEoWBt', 'vwilmink@markcoinc.com', NULL, '$2y$10$qBg8cGILteTO9yNZLMNXaeQxL3APJetyK/Du1Gx/ceBBRf.BVqESW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:03:09', '2025-02-25 02:03:09'),
(222, 'WhVbmBfcJT', 'tgcMSVuKZYJ', 'pt-PT', 'bstEXOeUCapIWaI', 'ryan4001ca@gmail.com', NULL, '$2y$10$1D0Y72DUOaI2YY5xIhNzOOdv5l2V/IqsLfPkVnmNUjasyY4a6cL1W', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:03:45', '2025-02-25 02:03:45'),
(223, 'wHPxhJyF', 'XJEyVpuDxPAv', 'pt-PT', 'UeyUYuRxtdrd', 'sstuck96@gmail.com', NULL, '$2y$10$ZYCDgA1jPDvZDTnI/7glseTEHKcq0yTengqHxWIDlmoHm606RheQC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:09:24', '2025-02-25 02:09:24'),
(224, 'TcmqHBpIOi', 'mmvXwiicc', 'pt-PT', 'uzQqKRkd', 'manzil.arora@gmail.com', NULL, '$2y$10$777beW3QM7K47tB4EzLyU.MoWSq83VQzanjrirgRl0HMy1mFIlpaC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:10:39', '2025-02-25 02:10:39'),
(225, 'VmjePIsNregmV', 'RrNAVnvVgclBvs', 'pt-PT', 'EPrOSpdBsaoPqd', 'm.arssfo@gmail.com', NULL, '$2y$10$NjxTb44zaE5ykt3LJCz6XOk68fCKRu3NK.qdo0vtHTIe2Mzf.xmZm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:12:01', '2025-02-25 02:12:01'),
(226, 'XwEJbkpzp', 'bvowsYLHZSFNt', 'pt-PT', 'EQxwLrqWVltmwDn', 'jacquienagy98@gmail.com', NULL, '$2y$10$6PsxsAyddwtjdPuY3ndtKuj5fv1ycW4PVfyn0HGoylgWtbFtDFjnK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:24:43', '2025-02-25 02:24:43'),
(227, 'AaAfFWKLrvkBR', 'BiBqlUjJ', 'pt-PT', 'lZxQqmilZsnB', 'cathysalinas72@hotmail.com', NULL, '$2y$10$J.pMoZBhtWRRjxX8Abv1l.mM9C5tM/DFBZGa6jNPs46YR.3pag48S', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:25:40', '2025-02-25 02:25:40'),
(228, 'gKiMjJbTSL', 'LdxsPgFkUlU', 'pt-PT', 'wlijFzAZ', 'jbaquinon@gmail.com', NULL, '$2y$10$xGwa7ZekXFjmFMoJ/ie2IObhE5R5UBrKVKqEHWpQpPhnL/PpJuoXi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:28:20', '2025-02-25 02:28:20'),
(229, 'WiDoAGJLZDYS', 'IrQqyyfSuNNYt', 'pt-PT', 'UlwdPDbVtgbCDk', 'michaelabrownlee@gmail.com', NULL, '$2y$10$D5LauRkEIdIETwypVzQSTe2MwAXIBODk2W3fjtHMwPzFVnKEH59iK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:30:34', '2025-02-25 02:30:34'),
(230, 'eAUBYtcsAnrwUS', 'XBiTYZmOBs', 'pt-PT', 'eKOoariRFYsEr', 'evansms770@gmail.com', NULL, '$2y$10$jDg/ENQromzuHmx8xgbfFO7EHAFL1EFSYrB5kTuQnUKbDBw55WlKe', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:31:36', '2025-02-25 02:31:36'),
(231, 'RcdgSQYWN', 'JwzyTVnmbKJOg', 'pt-PT', 'FdFmCLHeeZERUc', 'cbrewer1232@gmail.com', NULL, '$2y$10$5A4IIp42ETP4nGrPmQjz.eNKrxpy8uuwvQgFCX280Biky1BJuGLvO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:34:05', '2025-02-25 02:34:05'),
(232, 'wvyfBCpEKojU', 'nVZYKTbrFVhYiqS', 'pt-PT', 'IoXdnsuwShjyVM', 'steve@benn.it', NULL, '$2y$10$8EBEX3O2hetSPMq4T7SQJeLE1A7TtYbebBW0GnbFHMCREWNfLbSNa', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:39:06', '2025-02-25 02:39:06'),
(233, 'kdGkzBmTy', 'wGBhzgAxKHL', 'pt-PT', 'fOmIYIHDDfVgkN', 'amhwebster@gmail.com', NULL, '$2y$10$bwZnerEZN76wA0rhEEJVHeVNudmpj06hrO143nvk/v5VE9FdkfcaS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:41:30', '2025-02-25 02:41:30'),
(234, 'MffmxxslMcOVNfa', 'VXawWtQEMvwYlp', 'pt-PT', 'dxqsfvdwsxBmGS', 'dazi0325@hotmail.com', NULL, '$2y$10$2ge7lpLqkl57i0bv0x.2/uTmeJTJYMe2WmEvBSFBip7erWudfQtf.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:44:27', '2025-02-25 02:44:27'),
(235, 'iRJpbCdpPkfG', 'YvZhRRBaT', 'pt-PT', 'FJzuZxZSSa', 'mtuquian@gmail.com', NULL, '$2y$10$.O60eR57JTBuNPaEP03nje6sg5x4lS2LbVLt5.1.V/pBO2XZce/cO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:48:21', '2025-02-25 02:48:21'),
(236, 'RJpivAywOfyhy', 'CpgxNjExbaL', 'pt-PT', 'MdVyMTKmPhrp', 'coco94480@free.fr', NULL, '$2y$10$DydRImHRuDeNgx4A8uAX4e66KNmaOBNQarPxfDPRHEOKypuCKgGUS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:48:54', '2025-02-25 02:48:54'),
(237, 'SnpHrjkZz', 'wuIeyRWvSXap', 'pt-PT', 'NmINwSONe', 'benj.leiser@gmail.com', NULL, '$2y$10$MlhOCRhPYgU8s5KMhjtoi.8L4sSBXK6jOZZZuL9zmt1ucF2hWU1I.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:49:04', '2025-02-25 02:49:04'),
(238, 'QPTliutlnuoCzd', 'TZGAVdFloPAQB', 'pt-PT', 'PWaiEXkv', 'denniced@gmail.com', NULL, '$2y$10$H6GbhoY5ruSF2CwhGlm2WOtYEjmuuDxB7/Q8JSIGBnq5d7tT9t2f6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:52:30', '2025-02-25 02:52:30'),
(239, 'iDPvYSFMG', 'fHQpkRxnDP', 'pt-PT', 'XpYQnxmcQP', 'nbn408@gmail.com', NULL, '$2y$10$rwd4eiu57KFfQv3t6oXHCuBoRaP5qFemo.GHrnUD4SIRsWj4Tu3F6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:52:39', '2025-02-25 02:52:39'),
(240, 'dVZZSQeUcvC', 'tQAsKnGtPAgbBG', 'pt-PT', 'rzhlpHafe', 'cos.tensc@gmail.com', NULL, '$2y$10$yhPIlYZMo2SeVC3UzEm1AuMH.NMowjnKJJRVYdXZwFwUH4nByXSDi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:54:56', '2025-02-25 02:54:56'),
(241, 'WJKXkedGkvqJ', 'pmMlvTxF', 'pt-PT', 'KwaAYEgn', 'hossainjim4@gmail.com', NULL, '$2y$10$oP5U5I3F2hWB/Emb3RlvGebNyN4k73nQPwLX1Uxb80kCQsTt.A752', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 02:56:06', '2025-02-25 02:56:06'),
(242, 'KrXKPZlEEuiCC', 'XJDdSlXxyukx', 'pt-PT', 'bzeKdiRA', 'vic@calbayexpress.com', NULL, '$2y$10$BkKp7eqEV7WD15MmFJFM/eVza33f6Db/3TnJPsugS4dusopPeHz8q', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:00:39', '2025-02-25 03:00:39'),
(243, 'TYbCZYzhcqMpKxr', 'SzOQDXygrEY', 'pt-PT', 'LBZpDUGkHqRQn', 'nancy@ryanmarine.com', NULL, '$2y$10$PnCef3BbaPgt7XUaRo/vrO/TtI6OzI6dNpwDPi3n8AItO5SpnYttW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:03:48', '2025-02-25 03:03:48'),
(244, 'GjsTYwmUE', 'lVEjZMZaBzUdny', 'pt-PT', 'EQeJiNZhLT', 'mail@lauriesblindsanddesign.com', NULL, '$2y$10$CBYVnraYVlt6vg/NKPuGq.B1O/ZaiXHBieIse7RBKjSKughTNFR8q', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:21:36', '2025-02-25 03:21:36'),
(245, 'RbhncnpNDZAIP', 'gBrFCNvveVWhTj', 'pt-PT', 'XMmaghLr', 'gregory.curington@usmc.mil', NULL, '$2y$10$LjMNsIaoeYVasoXKi7Bzqe85UgJJP1Q4.E6qqB1r58xMtZrScRZzG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:22:41', '2025-02-25 03:22:41'),
(246, 'dvPPMclSXK', 'BULRRsyhM', 'pt-PT', 'gPwaxKTujmtkdhG', 'andymartin2@carolina.rr.com', NULL, '$2y$10$ez83EUSj18CvoQjDfPIZ7e3pju7ECikYl4IlMmRkmScit4laTTnee', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:23:57', '2025-02-25 03:23:57'),
(247, 'pbbGMshuQDAAh', 'khIaEztiogGJOAj', 'pt-PT', 'PozzJvkBa', 'lucie.essex@gmail.com', NULL, '$2y$10$UZY5d9VMe17HwnZlMfdJtu26L/GJKVs2elZLH0d/grT/2Z4cXpRSO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:26:15', '2025-02-25 03:26:15'),
(248, 'vgNMgUAUgEiP', 'ZLMqdmmnO', 'pt-PT', 'wnfdfBpHipnv', 'roestanton.tessa@gmail.com', NULL, '$2y$10$w6wrPPyOjcDQVkhC4nz4VevZ6bjOcUy.rQ7wFh/986Xaz7Shrr632', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:34:33', '2025-02-25 03:34:33'),
(249, 'JCGxJXBEQCam', 'AZFgWKUt', 'pt-PT', 'sjvUEVfc', 'none@arvest.com', NULL, '$2y$10$AWR.AT3.Squkukz/yhfGj.UafTSS4wAWsutN9XpQ0aNFPHJtYX3fG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:36:19', '2025-02-25 03:36:19'),
(250, 'NQoIEEnUtjADQ', 'SnWzyXtXyD', 'pt-PT', 'dEbwOobdny', 'khorvath@gmail.com', NULL, '$2y$10$oWWpI8Ig6weJs3nqts0Dx.1bsBLAs1odNw87Snv2zJVsukoa/QKuO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:37:04', '2025-02-25 03:37:04'),
(251, 'AhwsUylA', 'OOOFUbbAeNopu', 'pt-PT', 'SoQrzvuFTEFBY', 'trwp@optonline.net', NULL, '$2y$10$PnXz/Ry.Dx74.YsetlhBN.x3rC7b5XnIg2RVUmlZmxAtkya5n1iCy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:41:35', '2025-02-25 03:41:35'),
(252, 'hYzJSBuxCKLX', 'yTCdGKYfrpLC', 'pt-PT', 'uWICbPQJza', 'dorigen91@gmail.com', NULL, '$2y$10$LnFQUKHALWv5sPDK13IeYO.1tzNqjVugo9HVu98zL8hYKHL7VzT/a', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:42:20', '2025-02-25 03:42:20'),
(253, 'mahXGlzuxhw', 'neadUvJM', 'pt-PT', 'KDUVNHFvnYaBrD', 'ripplingwaterhomes@gmail.com', NULL, '$2y$10$vf/BFAM9tBZ2GQBjMiPNC.1u270Erpns/gUzidrjnl3DYHnPlMkhW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:46:13', '2025-02-25 03:46:13'),
(254, 'AfanutDJdttq', 'DAQuzKKF', 'pt-PT', 'bNTuakiwCU', 'andymotes@msn.com', NULL, '$2y$10$yoNPIgh0hopplrCVhzBLPO8whJc8td2I0pNQp/3IUgRzb0HrMzu/a', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:46:32', '2025-02-25 03:46:32');
INSERT INTO `users` (`id`, `first_name`, `last_name`, `language`, `contact_number`, `email`, `email_verified_at`, `password`, `country`, `status`, `is_reseller`, `neq_number`, `remember_token`, `created_at`, `updated_at`) VALUES
(255, 'KrYffpyd', 'cmxCUVZxtGaulZu', 'pt-PT', 'BKQRJkVc', 'clmann2000@hotmail.com', NULL, '$2y$10$k0.TxsTLqtYH0JAvtzIAc.sB.P0vtUulFIRDr8U1uNKTCMHe8wjoa', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:51:52', '2025-02-25 03:51:52'),
(256, 'DrncjoioM', 'ZjeHflVD', 'pt-PT', 'zycUHnnDDZAuZaY', 'kevin@fergusonangusfarms.com', NULL, '$2y$10$Hiq5Z7oP64WG2M52McuSlOby1Ro9.sbv4Zfo8DEKz/RvhfMjF9t2G', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:52:43', '2025-02-25 03:52:43'),
(257, 'LxHQqipLOtJjHTJ', 'luvXjinlcgBLN', 'pt-PT', 'ATDPlPpP', 'matthew.ian.lowery@gmail.com', NULL, '$2y$10$zOb13TA7PDaz5ewMTkmCjOY350jNoQQRXmtDEI1BO4FRh5NMSplhC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 03:56:11', '2025-02-25 03:56:11'),
(258, 'iAmUizOukVgffP', 'xtjmoaqxPdmM', 'pt-PT', 'RNTfYjGWkFEbcNn', 'paul.mcardle@schroders.com', NULL, '$2y$10$nSaxFK41dWRJ38XtjIpq/Ov42ySXTzmlOIseSDWkErV1DkpxBz7Hy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:02:01', '2025-02-25 04:02:01'),
(259, 'UJSrbxUCV', 'jIeAipySZCxU', 'pt-PT', 'ateQIjco', 'richard.yang@antaira.com', NULL, '$2y$10$fM8QdjFwOynutSdAgQ9up.J2nw2Sr8i57kDelPO19X/A8X2RREmzu', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:04:15', '2025-02-25 04:04:15'),
(260, 'fkVVdyTdLQ', 'nwHRryNDrTSo', 'pt-PT', 'FfGwwHCMXUHe', 'darranpritchard1@gmail.com', NULL, '$2y$10$/2VOsvdcxUXdMlwBy84pK.1UbLnNfg477nE9uffnCcVCZdWMYNXb.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:05:25', '2025-02-25 04:05:25'),
(261, 'spRtTQWzYFpcMm', 'tdjJsSBjjollCAX', 'pt-PT', 'nLhCJBkXVA', 'kyrasellslasvegas@gmail.com', NULL, '$2y$10$sQNgCgWBa.BjAVe8GnjkauWkV3/6uZk4uJ7bZRMi58lwzbhTDeyYy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:05:31', '2025-02-25 04:05:31'),
(262, 'RbgediKUWVTC', 'JzyAUYDgUvHMZKq', 'pt-PT', 'ulyeqVlxJnRv', 'c.guenst@comcast.net', NULL, '$2y$10$Rz50rf7kzveDCEv0yHtf6el855vaW0ItRjnnc9cgB3F/qkUZaipsG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:06:39', '2025-02-25 04:06:39'),
(263, 'SQNxYcAtzvyv', 'nlUpyPKQDCf', 'pt-PT', 'pnJZDqpNWusenIs', 'leahblakelove@gmail.com', NULL, '$2y$10$BYcQuGdqg3R4KZGGXbutZOQJ8cO6ntpdmw3bnmoC9ZiSOLkeX6PLa', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:09:49', '2025-02-25 04:09:49'),
(264, 'wvukZEjakD', 'zyUiWsNYnBygU', 'pt-PT', 'qJyOhaEGwKfwjw', 'thomasgeno67@gmail.com', NULL, '$2y$10$ktAiMkR5SvxAl9z5t0lbe.oUKCJfsUWwCBtseL/OeAIE1rsoQhH3S', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:11:53', '2025-02-25 04:11:53'),
(265, 'sjNuyDVvfRI', 'giWYbcRNcLPJ', 'pt-PT', 'YvNjRIHRtz', 'gerda.j@pc.dk', NULL, '$2y$10$R.1kI1IfSRnSK/aOLKk91OHEDqIK0B2pJpZtalX4b.OUzwOR9awOi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:12:38', '2025-02-25 04:12:38'),
(266, 'SaPybJaiDZKRW', 'mMlRBTEnOknOg', 'pt-PT', 'yusxTkkP', 'solfru6@gmail.com', NULL, '$2y$10$3YAtkptWJScs4vb2hyGfpO3TctJbV5n34XGR6rTqao45kxZfCa3EW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:16:52', '2025-02-25 04:16:52'),
(267, 'QVnqMDFLKhKXJR', 'DKAYvjDugO', 'pt-PT', 'qCbHJaYshdsMN', 'russell6381@outlook.com', NULL, '$2y$10$dsARh64qJFV7ej69AOpyduQZN91rrmMdlcZGOSxGtRv3iH2C73q36', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:18:08', '2025-02-25 04:18:08'),
(268, 'jiCbxnJlPm', 'rbJTpPasic', 'pt-PT', 'KENqdkvqhrt', 'kylej@neuco.com', NULL, '$2y$10$mYv8LivehK2BQ.e.gIbTJ.za3fAEWp7FFoXAXXV1Q6nOctPE4Hd82', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:21:07', '2025-02-25 04:21:07'),
(269, 'zismMFGS', 'pLbKWFKkTiD', 'pt-PT', 'OAuZCbOa', 'jahidislam102017@gmail.com', NULL, '$2y$10$k.i9dstQfWBsejq7cgV.VeROXcbbRsSrWM.A7iONJS.CRxJnkepSW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:29:10', '2025-02-25 04:29:10'),
(270, 'uCTlWcmtsIlPICj', 'ZOpPyKSJguARLH', 'pt-PT', 'fSGpxtpwqrFQWQ', 'toddbenedict@gmail.com', NULL, '$2y$10$/mog7hm4DQFZn.Qln4nK9uO7IPI8d.g9alFsPosk2HMFoFj0dCiby', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:29:39', '2025-02-25 04:29:39'),
(271, 'enDIomiImp', 'CbSvHXgxBghSt', 'pt-PT', 'xqPCTJSBDBhUENx', 'kleuberrpf@gmail.com', NULL, '$2y$10$5HeWMgIX.0lTCf0chl0eBeCNp0e2/UehnUnJ5g8K3x7N.I/FJocZ2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:33:15', '2025-02-25 04:33:15'),
(272, 'eQZJRQCXWJbd', 'LNSdAxWkXvXYsBr', 'pt-PT', 'PAhrNzAp', 'ypau.lo49@gmail.com', NULL, '$2y$10$FGS8k/IUPycOoUoNH/ts4uHAW6mjeK3HuKwpG1Qj1i2No5pr8d3.2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:33:37', '2025-02-25 04:33:37'),
(273, 'pJYVfLBooPfGw', 'NeRezskeH', 'pt-PT', 'WdDlqjCUxh', 'llarson3900@gmail.com', NULL, '$2y$10$Fw1qeOTOS4F5HJcIBZTDeettwoKEtoTBeokyeI13h1Wahk2RXtoRS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:35:03', '2025-02-25 04:35:03'),
(274, 'vRNCeStyghYez', 'vJMWSpwB', 'pt-PT', 'SCDMWwUebrNQ', 'ralhenry13@gmail.com', NULL, '$2y$10$1vt.0pnHvdOPwneTNVUtmuT0imZ9l/qb8188KJSI7/DLdoAK8Edj.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:40:59', '2025-02-25 04:40:59'),
(275, 'fgiBFCHpMYCLTKl', 'vbJVHsix', 'pt-PT', 'xYsaDtziFTzbW', 'bgiroux7@hotmail.com', NULL, '$2y$10$.8M.ycGjf8oLV32d7CaBEe4MwV9upYQNRXks8Px.YAe43n2NHDY2i', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:43:59', '2025-02-25 04:43:59'),
(276, 'gbWtvWgryncxVs', 'DjqQetLeF', 'pt-PT', 'VOTrriUHAhiSJ', 'cgbartone@gmail.com', NULL, '$2y$10$ds.0aP8tAc14gca12HlBAOdm35/7AUyxzB6uelYcDSfMhardweaqy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:44:33', '2025-02-25 04:44:33'),
(277, 'GavTtFGLtz', 'VIdWlroPuBU', 'pt-PT', 'RYwjBrWwMNXU', 'poshe1119@gmail.com', NULL, '$2y$10$8rbXI.GHo.bBnCP5ItMkd.3AuKKc1gbHjRYOMpGsRx/mwWIsK2oFW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:53:55', '2025-02-25 04:53:55'),
(278, 'izyfEGUdHBWA', 'KZszFqnLLeVgiG', 'pt-PT', 'tQIKaEdYCOZWA', 'nicolemrusso@gmail.com', NULL, '$2y$10$dJ55p/WQEA6K34Nk/PKiEu2Bau2jwOsla/SnCECK0DoTqHrfQTmSe', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 04:56:55', '2025-02-25 04:56:55'),
(279, 'MONHrRyMQKlFbyb', 'UmJbfjOrH', 'pt-PT', 'UqEpSOtEVonh', 'stefan.zaepfel@web.de', NULL, '$2y$10$AJwWp7YHpkBgQP4u7wcBUOIbsSsbccGG01YdnU8G8iKnXYS44akhG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:02:03', '2025-02-25 05:02:03'),
(280, 'OHZLjPmmrqnnF', 'zECaJmHTesJIlpK', 'pt-PT', 'EAbNsPmBgcoKg', 'oster.eo.9877@gmail.com', NULL, '$2y$10$uR/RJdj07D.Ny2VJuOkbjOwZ/pXaenUislwwE4.HFBxU7QYEeLbmu', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:06:46', '2025-02-25 05:06:46'),
(281, 'kxlGtWvlCzm', 'qAabHpIWgFECxZL', 'pt-PT', 'UzKxWLheoOGOHbG', 'elisa@jagerson.com', NULL, '$2y$10$xFL3wxOE6sdKpzRg42lPHuhPG8tX1JBWzQ/BiMH.3WS4GSQFec1bS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:07:14', '2025-02-25 05:07:14'),
(282, 'kLzzpIhS', 'uPhCESVby', 'pt-PT', 'DcSGrwJDgW', 'laura@glescoelectric.com', NULL, '$2y$10$gpNuJFt9Z1w7lvILksQH/uqm0xA0sNTaGJrhrpnfHioVUyQRj/ZaC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:15:28', '2025-02-25 05:15:28'),
(283, 'tBWxrhHZLfXlYQ', 'TOaACCKozqTU', 'pt-PT', 'CDwFhrREkB', 'rallisonford@gmail.com', NULL, '$2y$10$eUQdXK5gu2TN/aenSIjYBuC1Kya2KA2lMlf2J1Nx3no4.eDO7zGsK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:16:18', '2025-02-25 05:16:18'),
(284, 'mVWkZyWY', 'bIvbKQCFlAkock', 'pt-PT', 'wpwXEqFXNbz', 'blame779@msn.com', NULL, '$2y$10$iUomr2oWT48vUAjzvIl5b.dA1Q/HtoB7pizLbkKR59hBNksnaMNJK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:16:45', '2025-02-25 05:16:45'),
(285, 'zvyGAEHoZH', 'zlxAKQcUgyxr', 'pt-PT', 'TNMGTGXA', 'larryd.1040@gmail.com', NULL, '$2y$10$A6Wbwf523hAX8.trpUpqieuGmxPJXE1BcchHwZkMbe.AXIVoGo9aW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:17:28', '2025-02-25 05:17:28'),
(286, 'pjBNrjNFsgfQGKC', 'SuLCFKEW', 'pt-PT', 'JZNWVcVqHN', 'michaud.sophia@gmail.com', NULL, '$2y$10$.DnifM9UhOfPK6bcS6CaRerPQWUS7aXE7NoZOgop9drYwSbUk07va', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:25:39', '2025-02-25 05:25:39'),
(287, 'dVkabTiWcTqie', 'bEnpPBgCzo', 'pt-PT', 'DXtpDbiaIjF', 'davisfamily5695@gmail.com', NULL, '$2y$10$R0opGgPjMiuWKDHDy5wEquGeNc.oHsYLwIfORcBcqYhLmsPHLA4.O', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:28:15', '2025-02-25 05:28:15'),
(288, 'IsNSRDiGmYoA', 'PPyvmPLTmVxv', 'pt-PT', 'OXQOQJoAVqLVoDy', 'rrobinso.n207@gmail.com', NULL, '$2y$10$nnPTIu68vQAYBQad.NlzeO7MYXBC3qJ5X145gT7uplcNNosdxmYem', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:35:41', '2025-02-25 05:35:41'),
(289, 'AsmKqrjuDYWINM', 'YQztJsWKCXngn', 'pt-PT', 'bjaWfwjjuahNZ', 'christian.s.hofmann@web.de', NULL, '$2y$10$UVV5LZz78cVVevtsQKRxKu4cvY4SC/.XJj3zkKzpLQw2TJPYhJdB.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:37:38', '2025-02-25 05:37:38'),
(290, 'TwQFnfblFAAJd', 'zJfNgXICJQQvO', 'pt-PT', 'xFPvXIMPPWPuAT', 'charliebrown5@frontier.com', NULL, '$2y$10$mxnmh/7te2Af18mybqXYYeRq4saT2GzJm41Iu844Wd/ZSyRo12wQ.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:40:19', '2025-02-25 05:40:19'),
(291, 'iVrmHlNuCgaSrdi', 'YKQeWBUwRyUXo', 'pt-PT', 'SMWyoJJIlrMKpQ', 'gbvernieuw@gmail.com', NULL, '$2y$10$jAuGDINqhIdUtqcF2qG6Ye3btQm72QM6ZeTjN.tOpzvrOWI.dc8fu', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:42:29', '2025-02-25 05:42:29'),
(292, 'lvWDYCBt', 'ibnEjUFmTTEk', 'pt-PT', 'nzcPDQSz', 'gdemalliard@gm-conseil.fr', NULL, '$2y$10$40B1Tu7FskaCDgK9ytcsEudz8U419F9VVnBa6J1DDm.bZjj7NENpC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:47:49', '2025-02-25 05:47:49'),
(293, 'kVfjmQvuXmC', 'aEpgvjugxdjZ', 'pt-PT', 'JWcKloypYppy', 'natankarolczak@gmail.com', NULL, '$2y$10$SSpKOdwIJNWzTt7PqFuk.OSD3lOZxFZw6q8tR4xgmxYBUT1sxhoby', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:51:49', '2025-02-25 05:51:49'),
(294, 'jOUzTVeuDWsv', 'nmxSKCstUWZD', 'pt-PT', 'NhjPGemnp', 'carolyn6915@gmail.com', NULL, '$2y$10$52TtRko/MrHlxJTqTGhz5upJdhp67E1DGTidu24zWfRTnkAErKLDi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:53:07', '2025-02-25 05:53:07'),
(295, 'iiqphgeRQKZ', 'pYkfxPSojiDC', 'pt-PT', 'AdHwBmNBgz', 'ahoskiep.aintball1@gmail.com', NULL, '$2y$10$PDRovaaW6FFFAhuTwyUKd.YkCP.zTq9ntECaLhxoe6U6UMQnOC/KG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:56:18', '2025-02-25 05:56:18'),
(296, 'nPhLCNAwXR', 'CzBeYzgKpyK', 'pt-PT', 'JCpXBuTPRBybF', 'scottdonk@gmail.com', NULL, '$2y$10$LzIHPuUfReduP11eN./Y3.vP2S7Fwnn3/s3TmOx36AukZPsaK9kdC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 05:57:50', '2025-02-25 05:57:50'),
(297, 'NUQnHyMURSJNzWd', 'ryTcVyFdBUgZ', 'pt-PT', 'TLIevlNj', 'melissajarchow@msn.com', NULL, '$2y$10$wbLv/Jn9.9gwyIJ0N/wHZut8dND0ZSFRJrGJwC6sEK78KiQrlaq.e', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:04:04', '2025-02-25 06:04:04'),
(298, 'vngAAhsxq', 'qMwPlrLiiRQcHrE', 'pt-PT', 'dqaDofCjWHkRgYK', 'olivertslee@gmail.com', NULL, '$2y$10$S8Ken2.QoDGIbCmEEApWn.4pksB5jTLb9Ded3aY3MV6oUAUuClvFm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:16:05', '2025-02-25 06:16:05'),
(299, 'KJMmQHAvIFoMXR', 'kEhtZOpRcBVp', 'pt-PT', 'HZStILQgU', 'aminishakib@gmail.com', NULL, '$2y$10$.h8YmMC1lSTu5pbirdQphulHjWkdux6oJ4SM9g.GioSELBXZVSRO6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:16:57', '2025-02-25 06:16:57'),
(300, 'DDoMhkJjjW', 'NXAQcrsoR', 'pt-PT', 'JDWkcGIrxpbi', 'tharding@barrcredit.com', NULL, '$2y$10$KxlIVm/NNwBmkG0oYKmNOecMq1mt8WonvSGW9DSed0iYbbXnzlEKm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:21:51', '2025-02-25 06:21:51'),
(301, 'MNWYPqJuDrZ', 'TyhEaGPuF', 'pt-PT', 'rvtPCSBE', 'bob.cascadestc+ons@gmail.com', NULL, '$2y$10$WT2kogzh0JA67BY26UCoAuggkv/wAwSeQOXB2nNfHokkbcg43vFfK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:28:43', '2025-02-25 06:28:43'),
(302, 'kiCKUieaS', 'FIUxFAfVZax', 'pt-PT', 'heArPUfcPm', 'dylanski1999@hotmail.com', NULL, '$2y$10$1qJf.Elg9CwySVwURv/ow.jv51JR7qLjI1fdOQQ6zJAHD3pDo7j.S', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:52:21', '2025-02-25 06:52:21'),
(303, 'JQdoIcKPRjkLTC', 'kMqegyEvrMMQyD', 'pt-PT', 'KSTjoKkfboBG', 'karl.westphal@comcast.net', NULL, '$2y$10$m2vJrXE/FQKMQtM6.8/LHuD0BrROjDhGCb/xTptcjqF4w77ph./va', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:54:19', '2025-02-25 06:54:19'),
(304, 'OVrYLadLKPJ', 'aTezuHbEhcGEoP', 'pt-PT', 'SSxOqvbRIOVRQkd', 'talisha.fernandez22@gmail.com', NULL, '$2y$10$SocfUFKXDLr47vs1zG5CVOdWw5Nti8P7CoVoXv8cGTZtLK93abZEW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:57:11', '2025-02-25 06:57:11'),
(305, 'iaVJMSIQ', 'PevGHVYUHmRj', 'pt-PT', 'yTQlQIxyxyq', 'sam.uel.pena81@gmail.com', NULL, '$2y$10$peyGeen..lfhUbFspmBv.OtQiaE/JLPlp4AcHTWW7UTl/GlpG1OZK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:57:20', '2025-02-25 06:57:20'),
(306, 'ztpXlSKQSgf', 'scnixaPGwfhqlB', 'pt-PT', 'ADQmvxhAhNZpye', 'warri.orcc1962@gmail.com', NULL, '$2y$10$EV0h1CYPvBaDZosvIzjJquNhJqoryvLHR.7YFgrlrPsRvVbpytvrG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 06:59:56', '2025-02-25 06:59:56'),
(307, 'ZskfMnwu', 'yvRGNizUoPjm', 'pt-PT', 'QwpyKDYsfusWwig', 'jose.lreyes.918@gmail.com', NULL, '$2y$10$32rfzEhETIRk4eluPSk8r.4bxN4wAUj772YUrMkIUYo3ymRFUcsAi', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:03:36', '2025-02-25 07:03:36'),
(308, 'uHnFcUscT', 'EgxZTuMv', 'pt-PT', 'CZMEVCUXo', 'joselre.yes.918@gmail.com', NULL, '$2y$10$tJPPfUi3gyA7DHs1oZEpg.vcvBOGc7Jg3t0pqxNXT2FGiZBO2Duty', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:19:37', '2025-02-25 07:19:37'),
(309, 'lPiJHKOnjMmCVq', 'OFpqfxRwgGGcOh', 'pt-PT', 'FsqWaldLTAa', 'hbirkemeier@gmail.com', NULL, '$2y$10$PAy0wHOHhJ4RWGqKTfusJe49OVRAshUsEAovTyiUTPyjgqrU.p2RG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:21:02', '2025-02-25 07:21:02'),
(310, 'tbMeYKVnwTyFRr', 'yeWYEsdbKKERaS', 'pt-PT', 'BtXlZmTXf', 'larr.yd1040@gmail.com', NULL, '$2y$10$k9qgd9NuFRlFOXYsBHJLLuwr9WV5Ks/JR5uaCYjn1Tez/Y/ijjvpW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:21:13', '2025-02-25 07:21:13'),
(311, 'CCDNqdLCBZM', 'zijbCpZQoT', 'pt-PT', 'NWacfANQoebswOr', 'marlon.cepeda@gmail.com', NULL, '$2y$10$CBXSClDe/Ip7HKX42FGrj.4HE28e9ZYJubxNm3DNSxxGWyWOkq3Ym', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:38:18', '2025-02-25 07:38:18'),
(312, 'DtqdjAfLIj', 'FIZTfrLZTeQuC', 'pt-PT', 'ZASPKjEO', 'ahoskiepaintba.ll1@gmail.com', NULL, '$2y$10$gg1TSapi7LNfxqb8G7REWuiEBeRmXpmV2dzlqV7PoezJLyTG5oZri', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:40:43', '2025-02-25 07:40:43'),
(313, 'HTYnkoPaLLJa', 'ZfdZiloQH', 'pt-PT', 'dgvlpNLpLM', 'markusxcr7@gmail.com', NULL, '$2y$10$r4sgM4yETzTJRehTbTRB1OV75sc953XAlrvO03qLKDDq8dsp5FW6C', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:45:26', '2025-02-25 07:45:26'),
(314, 'IARWZEXrm', 'whpZNqoBRVEen', 'pt-PT', 'HVrvXofdBoFlq', 'goge.nise@gmail.com', NULL, '$2y$10$7K5gd0a5psuHBrRF0ktPUeDyISmvhgRxk63qy2.OTYYLl302IHszS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:47:39', '2025-02-25 07:47:39'),
(315, 'nmvPsFBkbLSoD', 'fbAphEtQNWDX', 'pt-PT', 'tFYzHYAqvL', 'tvangorder625@gmail.com', NULL, '$2y$10$XRqnjWk24bSSzaIZy.uZgufoow8.MbtcvDhj1f5t6hfBqmwmvLntq', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:51:59', '2025-02-25 07:51:59'),
(316, 'nkWficyMZdGy', 'GqtGTaLr', 'pt-PT', 'AEcmXUwWM', 'roddfrank@gmail.com', NULL, '$2y$10$4pQ9RhB43wF/yUt7UM7o1.ljdadLTYON6dVXGQPB1DGE1/hI5jrMC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 07:52:36', '2025-02-25 07:52:36'),
(317, 'otLcUZPguma', 'VDzGCJPCAm', 'pt-PT', 'LYtORpAhNc', 'james.miles5@gmail.com', NULL, '$2y$10$ugviX9zvJ7T3sSS19SBsOO5pcrViqlQWf3zV8KKcF.BSeQMfX/W3G', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:09:31', '2025-02-25 08:09:31'),
(318, 'xqInTaERBPfcox', 'fVhbFcRBE', 'pt-PT', 'iTFwfgZRtcfcSPv', 'airuorz@gmail.com', NULL, '$2y$10$J/6mUJ0V3xLT952EXxIJt.O6l63tiIe0TwvL7My9ueG4zQ4lHKCGK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:16:19', '2025-02-25 08:16:19'),
(319, 'ohZrUjIM', 'PGvHDAmDoPVAI', 'pt-PT', 'STqSddUJ', 'lahmasa@gmail.com', NULL, '$2y$10$Pb3IVetaxLz3XojZ0i3qHOTaA8Iwig.YDUjqNkCYWAVMgwdAR3NOW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:16:56', '2025-02-25 08:16:56'),
(320, 'otVRuywtpXC', 'oTXMcsxeUsq', 'pt-PT', 'LxtQUiWa', 'j.oselreyes.918@gmail.com', NULL, '$2y$10$..vjXYGsBlXf1Y/NTjoy5..nuEdLcTw5OsLIwaf.MtemOeiYaoS7q', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:18:13', '2025-02-25 08:18:13'),
(321, 'xClBfWfq', 'PSvYNsupP', 'pt-PT', 'vqgBtQjoc', 'ndellingsen@gmail.com', NULL, '$2y$10$GTd/S7.WiE5kLBQ6U8Kcg.M3dDycJ8gvW5yLHGqx7UfNoEGSLPGte', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:20:07', '2025-02-25 08:20:07'),
(322, 'PAkcIqZVAG', 'MlXqOBKvP', 'pt-PT', 'ijjJMbovzjWGgvT', 'jaso.nraycantu@gmail.com', NULL, '$2y$10$y757HNuL2OzbZAhVHcCb2ufaGSD8CXBx.PtLZk1RZar/9wzU9k8J.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:25:06', '2025-02-25 08:25:06'),
(323, 'kLNZLCtSFGd', 'ImomkDzxfii', 'pt-PT', 'PiRcAnhgX', 'nahomy.hernandez@lighthouseblv.org', NULL, '$2y$10$atcumUJPRbtSOoHbrgKuB.P3d60JhboVEY7m1f9mPzG24CFMNmGX2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:25:48', '2025-02-25 08:25:48'),
(324, 'DOFnYzUtUx', 'QxyQSdeJfkdgt', 'pt-PT', 'ZbhxFBWGTOZDo', 'hearrwkontoglie@yahoo.com', NULL, '$2y$10$vr7bsZkFbqeGRPjtbieEd..KDTuqkPctTjdTGg.FYGU7ASjQI4Tru', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:26:52', '2025-02-25 08:26:52'),
(325, 'uercyeBQM', 'tZbfaFmCgr', 'pt-PT', 'zMfJTvqZIT', 'jda0.30@gmail.com', NULL, '$2y$10$JdwjRrvmS2woexjBW/1vaOpXcn7l4MS5ylhKuMaxrDdC2IFmURxAa', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:27:23', '2025-02-25 08:27:23'),
(326, 'nLcFfZPB', 'jiLarIFYVjBs', 'pt-PT', 'bweAzlCMAZyuMo', 'bmills0016@gmail.com', NULL, '$2y$10$nYucwG3lN2HhhHxRh2Vrz.gldT9xs/IW/EU6QSq7GogotIW2ohpQ6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:28:40', '2025-02-25 08:28:40'),
(327, 'YdeQocEiXFzP', 'GIyBeXisqaLnQzt', 'pt-PT', 'irCMlnyKiEkKwi', 'cherishedmomentscelebrated@gmail.com', NULL, '$2y$10$FkL5vYA.nADTJQHTxGuy3u6ew6EA3m227qZxU5zegG3GgT9qGiPXG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:31:45', '2025-02-25 08:31:45'),
(328, 'ugUQQqHWSzCaVHJ', 'GkWPNnSBCtugcl', 'pt-PT', 'JXarQGWxOUW', 'swiftj540@gmail.com', NULL, '$2y$10$RmZuZ9vJh2LJeJ69pGJgDuzJC1DEyNWq3G4qM0jj5dRzCnxf143X6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:36:06', '2025-02-25 08:36:06'),
(329, 'DWwZreCqOiY', 'dsfaWKHfAYRsk', 'pt-PT', 'SxCkAgMJUxLHI', 'dogovor@obmen.us', NULL, '$2y$10$YSMUMUisGjEFIXEHlWBbaOYYQas0VPZYm2DmjVmIWBlc9wtojSF1a', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:46:22', '2025-02-25 08:46:22'),
(330, 'rXMBdZiGH', 'kcZMgaxDGP', 'pt-PT', 'CRZdpZzR', 'warriorcc1962@gmail.com', NULL, '$2y$10$Py7zSn2WTumVF2jc.Xt1UeKFxK96opVQMh0qsVhxxCvEZ2KEMDiRC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:54:22', '2025-02-25 08:54:22'),
(331, 'GHWMsdmogzGfLW', 'AHfBTKUvBlxb', 'pt-PT', 'SEUGrjgaS', 'tr.evarhall@gmail.com', NULL, '$2y$10$P3RZUMGq2r0B/dCuSkWtSuUqw2iGAS47mpy7MhLpFi7VJyK48lDOW', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 08:55:49', '2025-02-25 08:55:49'),
(332, 'IFvtlaJwEOo', 'beNyoHuZq', 'pt-PT', 'GNROthfRpbQso', 'bm.ills0016@gmail.com', NULL, '$2y$10$IGzeJHGd43mRlqpIcK8MrOu/tfLX8YUyThW0lU8t0rPmgbbg2Freq', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:00:14', '2025-02-25 09:00:14'),
(333, 'MJUgjuuXOvA', 'PouftfZAZRR', 'pt-PT', 'pYdcKGETNhbZZEc', 'war.riorcc1962@gmail.com', NULL, '$2y$10$FW.rXjA6LZe1EP45dbs9S.Qowdhaxc/cPPXH0Q0d1EAiOvekkKiHC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:15:55', '2025-02-25 09:15:55'),
(334, 'eVSQMtZsaXbSn', 'NGGnLEnYzcxNl', 'pt-PT', 'NSScUJKnDnupDu', 'william.christensen@prospecteducation.com', NULL, '$2y$10$wa815TSA0ccjG7OK1RNIXOssiCjQhCGvabKcLBLq8gOMQRCUeib0K', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:17:18', '2025-02-25 09:17:18'),
(335, 'TXFlHjtRu', 'DNYqvxJOKz', 'pt-PT', 'pzMCpjvU', 'moserd@mccc.edu', NULL, '$2y$10$M.QO82D0uwtORC/L4ejpi.uH5NpEiVaU4MXCvnel1YBC3tt9uokk2', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:18:03', '2025-02-25 09:18:03'),
(336, 'gDkjMvNuJbMGK', 'lYwBjwPgvDfTR', 'pt-PT', 'dOYFmGQs', 'b.mills0016@gmail.com', NULL, '$2y$10$4wcCE.1Q6NOEiAEUEMmnwuRRGoYf.3KWicLfWz6sM1/AbVGE14DDC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:22:41', '2025-02-25 09:22:41'),
(337, 'SMhRriNYiyIK', 'eAOpehqNqnRlBd', 'pt-PT', 'GbZQdrrpld', 'sh.awnpwilkes@gmail.com', NULL, '$2y$10$PTAaAVyEocqDMyxDgX60rusu6p8.QTfF2PZqc0WriU.ds7SBPoeNK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:32:26', '2025-02-25 09:32:26'),
(338, 'BGQjFwTxCDc', 'bhxDJJwaKJ', 'pt-PT', 'ibYaLFjNpulhmlr', 'dwagner09@gmail.com', NULL, '$2y$10$NM72PQfy0y4/d8icOcF8BORzm6Wufg5oIFamPLmZNEMYbJz2sw4JG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:50:38', '2025-02-25 09:50:38'),
(339, 'BufROTqBJLQHX', 'moWXgzxyAbuvQ', 'pt-PT', 'pBgwThrxISpPDGb', 'rohansix@gmail.com', NULL, '$2y$10$ZZDvhY7UaoYtiyfUN3MZaOibJMsdsHKIt3nq/ZsBRfh6xg3WFeixO', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:54:53', '2025-02-25 09:54:53'),
(340, 'bIPZVOVA', 'vvPfQjZfHwMJLlS', 'pt-PT', 'gvXCWEJzBRQ', 'wi.lliamwmartin1776@gmail.com', NULL, '$2y$10$lYlVvfhDF6bpnHEwGt8jVux7CH7ihr0qKg1lXtlUWuheO1c1gHosC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:55:39', '2025-02-25 09:55:39'),
(341, 'EMoBKDcbW', 'XjnbplntQVrEgNe', 'pt-PT', 'VHxyxfcKEX', 'jaimesnoel@gmail.com', NULL, '$2y$10$Pj5I1e.FWjl3ya.WrYd12.lHq/RQ68OhUyl1o4XvKjaPBBYEe1znS', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 09:56:24', '2025-02-25 09:56:24'),
(342, 'YqQqFKRTCBq', 'TaXVgxcG', 'pt-PT', 'QiSZIcBynDUDqS', 'jodie+av@metrolinacarts.com', NULL, '$2y$10$9cXPXN.27fBr3Bkv79zrVe4IjiSmm6zJD9s/1sGlDvNiusJZW4kDK', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:03:19', '2025-02-25 10:03:19'),
(343, 'oMtKLtjIWUIk', 'bIjoORJyQ', 'pt-PT', 'GkwQTNQiAmNaRvf', 'williamwmartin1776@gmail.com', NULL, '$2y$10$qvxGDu7XLOlMIMAWWGxa3uLb..Vz5K.2yPrlJlREB/YkdYTskz79.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:16:10', '2025-02-25 10:16:10'),
(344, 'GLJMWpeAkphIGcP', 'ShXIsuwYk', 'pt-PT', 'xTBPPvJO', 'army94r@icloud.com', NULL, '$2y$10$0GaNVnKnPfMpITlzFY7.Z.U9hNV.Zo5fNZdHXgQqpjR22e8Ey05MG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:26:14', '2025-02-25 10:26:14'),
(345, 'CbmWYkOWALWSw', 'toiduDNPqE', 'pt-PT', 'TBSvIIJYL', 'bradflemingalways@gmail.com', NULL, '$2y$10$kqnGjWB5hTr5ZE/s5zB1t.vec35mGj/YlqXSDzQNLCmp6oVv/1I6m', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:31:59', '2025-02-25 10:31:59'),
(346, 'uPCrzUInw', 'JTDVPAJQzvC', 'pt-PT', 'UGUeRPCFeKcHf', 'will.iamwmartin1776@gmail.com', NULL, '$2y$10$SrhxFE/DcRNwMBdGYqm2fu4uIuAxTPmIKBajEQAYBSh54dtVWkl0.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:36:15', '2025-02-25 10:36:15'),
(347, 'HTrYMGUHt', 'XpjuTkvwf', 'pt-PT', 'IlXLsIGMQAtnCJ', 'ruth510@comcast.net', NULL, '$2y$10$loHLA4halN0ZgH2SmAiEMeQCnWxcsm.BCNSewUEtifrzboGSCXtkq', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 10:47:59', '2025-02-25 10:47:59'),
(348, 'UxcXlzevj', 'avHGAGzgaekIc', 'pt-PT', 'HWGKpdNmooGwsO', 'ahoskiepaint.ball1@gmail.com', NULL, '$2y$10$HOm5mx5MfcnBKKi5ZavPAuGyO7sQU1h092WLDra6YSmPjxIHMdW6.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:04:22', '2025-02-25 11:04:22'),
(349, 'jZGQdkTIvxiFMG', 'ldjKTqRWieeSaxm', 'pt-PT', 'QYSvOWmsYMDH', 'trevarhall@gmail.com', NULL, '$2y$10$B6JFAqYozz3U.HuTFzYobuxjyMHkEYi5PchTkD2kvI6P4tkw65XtG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:10:55', '2025-02-25 11:10:55'),
(350, 'NaCEfLjXm', 'VFGdRqGshO', 'pt-PT', 'dvZSJohHY', 'shawnpwilkes@gmail.com', NULL, '$2y$10$Qb8TApO/ybAcEB9neLTymuyGKoQZ0gBScmxA.aXJq3V.JTIVtrSfm', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:17:01', '2025-02-25 11:17:01'),
(351, 'dyeOFJhOrCyI', 'obiYSbgh', 'pt-PT', 'NekGpPUUyWzoh', 'rrobinson.207@gmail.com', NULL, '$2y$10$L/gfpK3SKYy9z78xp1AaVuXwecPPvFf.5opeG1ajIQHDnEXpoTC.i', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:20:22', '2025-02-25 11:20:22'),
(352, 'iNSloBTncyZDC', 'LsjhYsTL', 'pt-PT', 'RDoUPyfoliV', 'ndel.lingsen@gmail.com', NULL, '$2y$10$lBid9DQlsyr.4b.cnL1nmOIIAh/RrS0cMh.xDuCC4qG6Yvk.bWhcy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:24:46', '2025-02-25 11:24:46'),
(353, 'fvbPhfEhOIRTSe', 'uATyDJUjnffeQ', 'pt-PT', 'drTrdxKijsoU', 'y.mjamison@gmail.com', NULL, '$2y$10$z0G2ACrd0b6vpnlbZA3MQ.kRpbFJrEuG9bK5NKOdw/scajgPqQug6', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:34:57', '2025-02-25 11:34:57'),
(354, 'pARXzuDjHX', 'SoIHbdLm', 'pt-PT', 'fRZFlZZiXc', 's.grinblatt13@gmail.com', NULL, '$2y$10$QrAR9zKUEw3bD80r9xIqnuIM.9mVwbf0fLoiV0f/br3w80Hyz1aAq', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:35:04', '2025-02-25 11:35:04'),
(355, 'XKjsTUVkrs', 'PqyqxIKmlc', 'pt-PT', 'HhWFhrWI', 'prodigymeshap@gmail.com', NULL, '$2y$10$PXtgxuQNf4rU4BHesmzLJetHDqxNwnhr./R4FF7HLK1XmQ0OU2kh.', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:53:32', '2025-02-25 11:53:32'),
(356, 'KguXqxtjWT', 'molQYwlNexbkoPw', 'pt-PT', 'hRaRXIbzT', 'nathaliehidalogo7@gmail.com', NULL, '$2y$10$1Px5pFXdSP2svFqo0B02Ru9Go.FgkrKNFrls9o05ze/WmF4/eaZRe', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:54:06', '2025-02-25 11:54:06'),
(357, 'VsYmnREOWXBF', 'UPalVbkgky', 'pt-PT', 'YNsQrGLRiPo', 'tra.vis.loest@gmail.com', NULL, '$2y$10$J1PPkhipCBFp7MXE10ON6ei8SZQ/v.uY3/wb5eLrlWqHy2q.dOgue', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 11:57:09', '2025-02-25 11:57:09'),
(358, 'nYSUXxpnYsdVgoR', 'vNneMIDNlRZzg', 'pt-PT', 'zuTQKjprzfjNq', 'fabfour68@hotmail.com', NULL, '$2y$10$Hwthy4Ccv1cuyJBKz4wRPOsufNcsxA5pyg9ILUYqn6OHdFKXN4npG', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 12:00:33', '2025-02-25 12:00:33'),
(359, 'welmYBeOW', 'ApUbataafL', 'pt-PT', 'ziRPxKdjdDS', 'rrobin.son207@gmail.com', NULL, '$2y$10$CP5aP1G7lRGslpefdcOPUugU8pWFU4NBYEJyOFPhcf5gSR1MgYswC', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 12:00:36', '2025-02-25 12:00:36'),
(360, 'KYkWOVepzbY', 'cUbhdfLTBK', 'pt-PT', 'iwvxcvzvFTzbFz', 'thomasbush673@gmail.com', NULL, '$2y$10$jIP4D8r98g3h3gyjhB1f3ei1Chzbnuu2e9efYQIUybZddidTV7cQy', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 12:16:47', '2025-02-25 12:16:47'),
(361, 'vArFVirZyWyixGQ', 'NPKRlmIRY', 'pt-PT', 'IFqawWYpFlqOD', 'bmil.ls0016@gmail.com', NULL, '$2y$10$f.bgy0mko1LyiP3g1yd2mOZlCeumbClfQaQpXnmgpObV0rgv.LX6G', 'CANADA', 1, 0, NULL, NULL, '2025-02-25 12:20:50', '2025-02-25 12:20:50'),
(362, 'Nancy', 'Nancy', 'en', '9999999999-', 'productionroom@capbeast.com', NULL, '$2y$10$alcxbwcRfj.iPdIstKdkpOu3QBbgEzwlJU3DZNi5kMAYUEkBvp6s.', 'CANADA', 1, 0, NULL, NULL, '2025-02-28 00:22:31', '2025-02-28 00:22:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `authorizedotnet_logs`
--
ALTER TABLE `authorizedotnet_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_user_id_foreign` (`user_id`),
  ADD KEY `cart_product_id_foreign` (`product_id`),
  ADD KEY `cart_color_id_foreign` (`color_id`),
  ADD KEY `cart_printing_id_foreign` (`printing_id`);

--
-- Indexes for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_artwork_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `component_embroidery_color`
--
ALTER TABLE `component_embroidery_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `component_product_color`
--
ALTER TABLE `component_product_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount_coupon`
--
ALTER TABLE `discount_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discount_coupon_discountable_type_discountable_id_index` (`discountable_type`,`discountable_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `internal_status`
--
ALTER TABLE `internal_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `fk_discount` (`discount_id`);

--
-- Indexes for table `order_artwork`
--
ALTER TABLE `order_artwork`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_artwork_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `order_files`
--
ALTER TABLE `order_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_files_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_internal_status_order_id_foreign` (`order_id`),
  ADD KEY `order_internal_status_internal_status_id_foreign` (`internal_status_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`),
  ADD KEY `order_items_color_id_foreign` (`color_id`),
  ADD KEY `order_items_printing_id_foreign` (`printing_id`);

--
-- Indexes for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_shipping_detail_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_tax_details`
--
ALTER TABLE `order_tax_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_tax_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_baseimages_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_product_id_foreign` (`product_id`),
  ADD KEY `product_color_color_id_foreign` (`color_id`);

--
-- Indexes for table `product_delivery`
--
ALTER TABLE `product_delivery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_pricing`
--
ALTER TABLE `product_pricing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_pricing_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_printing`
--
ALTER TABLE `product_printing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `temp_cart_images`
--
ALTER TABLE `temp_cart_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tps_tax_price`
--
ALTER TABLE `tps_tax_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tvq_tax_price`
--
ALTER TABLE `tvq_tax_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `authorizedotnet_logs`
--
ALTER TABLE `authorizedotnet_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `component_embroidery_color`
--
ALTER TABLE `component_embroidery_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component_product_color`
--
ALTER TABLE `component_product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `discount_coupon`
--
ALTER TABLE `discount_coupon`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internal_status`
--
ALTER TABLE `internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `order_artwork`
--
ALTER TABLE `order_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_files`
--
ALTER TABLE `order_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `order_tax_details`
--
ALTER TABLE `order_tax_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `temp_cart_images`
--
ALTER TABLE `temp_cart_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tps_tax_price`
--
ALTER TABLE `tps_tax_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tvq_tax_price`
--
ALTER TABLE `tvq_tax_price`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=363;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_printing_id_foreign` FOREIGN KEY (`printing_id`) REFERENCES `product_printing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  ADD CONSTRAINT `cart_artwork_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_discount` FOREIGN KEY (`discount_id`) REFERENCES `discount_coupon` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_artwork`
--
ALTER TABLE `order_artwork`
  ADD CONSTRAINT `order_artwork_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_files`
--
ALTER TABLE `order_files`
  ADD CONSTRAINT `order_files_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  ADD CONSTRAINT `order_internal_status_internal_status_id_foreign` FOREIGN KEY (`internal_status_id`) REFERENCES `internal_status` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `order_internal_status_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_printing_id_foreign` FOREIGN KEY (`printing_id`) REFERENCES `product_printing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  ADD CONSTRAINT `order_shipping_detail_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_tax_details`
--
ALTER TABLE `order_tax_details`
  ADD CONSTRAINT `order_tax_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  ADD CONSTRAINT `product_baseimages_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_color_id_foreign` FOREIGN KEY (`color_id`) REFERENCES `component_product_color` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_color_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_pricing`
--
ALTER TABLE `product_pricing`
  ADD CONSTRAINT `product_pricing_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
