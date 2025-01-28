-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2025 at 03:23 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beanies`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'sabeer@gmail.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', NULL, NULL),
(2, 'taimoorkhan@lala.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', NULL, NULL),
(3, 'admin@admin.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', NULL, NULL);

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
(13, 'TAIL', '#188683', NULL, '2025-01-21 06:12:44', '2025-01-21 06:12:44'),
(14, 'PINK', '#ffc0cb', NULL, '2025-01-21 06:15:29', '2025-01-21 06:15:29'),
(15, 'GREEN', '#008000', NULL, '2025-01-21 06:17:03', '2025-01-21 06:17:03'),
(16, 'ORANGE PP', '#ad1700', NULL, '2025-01-21 06:17:38', '2025-01-21 06:17:38'),
(17, 'SAFTY ORANGE', '#e72613', NULL, '2025-01-21 06:19:19', '2025-01-21 06:19:19'),
(18, 'ORANGE BURN', '#b0230f', NULL, '2025-01-21 06:20:00', '2025-01-21 06:20:00'),
(19, 'NAVY', '#000080', NULL, '2025-01-21 17:13:08', '2025-01-21 17:13:08');

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
(24, '2025_01_27_110317_create_authorizedotnet_logs_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `total_price`, `status`, `created_at`, `updated_at`) VALUES
(42, 'AKUD1W', 1, 180.00, NULL, '2025-01-26 06:44:58', '2025-01-26 06:44:58'),
(43, 'SPU3BU', 1, 180.00, NULL, '2025-01-26 06:47:18', '2025-01-26 06:47:18'),
(44, 'UQHG2C', 1, 505.80, NULL, '2025-01-26 06:49:33', '2025-01-26 06:49:33'),
(45, 'CIQTCV', 1, 156.00, NULL, '2025-01-27 09:17:41', '2025-01-27 09:17:41'),
(46, 'Q0SP3Y', 1, 156.00, NULL, '2025-01-28 06:38:53', '2025-01-28 06:38:53');

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

--
-- Dumping data for table `order_artwork`
--

INSERT INTO `order_artwork` (`id`, `order_item_id`, `artwork_type`, `artwork_dataText`, `artwork_dataImage`, `patch_length`, `patch_height`, `font_style`, `num_of_imprint`, `imprint_color`, `leathercolor`, `created_at`, `updated_at`) VALUES
(2, 32, 1, 'null', 'CustomerArtworkImages/Yz4VbP5NRQoeKM9eWxGkiCy5JAuQZ6WP4F5TkD8K.jpg', 2.00, 2.00, 'times', 1, '[\"3240\"]', NULL, '2025-01-26 06:49:33', '2025-01-26 06:49:33');

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

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `color_id`, `printing_id`, `quantity`, `beanie_type`, `is_pompom`, `printing_price`, `product_price`, `delivery_price`, `pompom_price`, `created_at`, `updated_at`) VALUES
(30, 42, 1, 8, 1, 12, 1, 1, 0.00, 13.00, 0.00, 2.00, '2025-01-26 06:44:58', '2025-01-26 06:44:58'),
(31, 43, 1, 7, 1, 12, 1, 1, 0.00, 13.00, 0.00, 2.00, '2025-01-26 06:47:18', '2025-01-26 06:47:18'),
(32, 44, 1, 7, 2, 12, 1, 1, 7.15, 13.00, 20.00, 2.00, '2025-01-26 06:49:33', '2025-01-26 06:49:33'),
(33, 45, 1, 12, 1, 12, 1, 0, 0.00, 13.00, 0.00, 0.00, '2025-01-27 09:17:41', '2025-01-27 09:17:41'),
(34, 46, 1, 7, 8, 12, 1, 0, 0.00, 13.00, 0.00, 0.00, '2025-01-28 06:38:53', '2025-01-28 06:38:53');

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
  `additional_info` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_shipping_detail`
--

INSERT INTO `order_shipping_detail` (`id`, `order_id`, `firstname`, `lastname`, `companyname`, `address`, `email`, `phone`, `additional_info`, `created_at`, `updated_at`) VALUES
(34, 42, 'Ruby', 'Joyce', 'Horn Mckee LLC', 'Ullamco quae ratione', 'nodyqog@mailinator.com', '18', 'Duis Nam qui sed qui', '2025-01-26 06:44:58', '2025-01-26 06:44:58'),
(35, 43, 'Macey', 'Calderon', 'Villarreal and Luna Inc', 'Aperiam et amet exc', 'betapezu@mailinator.com', '35', 'Quia rerum nemo corp', '2025-01-26 06:47:18', '2025-01-26 06:47:18'),
(36, 44, 'Shea', 'Mendez', 'Murray Fernandez Co', 'Nulla ullamco ut exe', 'mujesom@mailinator.com', '98', 'Ratione eius ea fugi', '2025-01-26 06:49:33', '2025-01-26 06:49:33'),
(37, 45, 'Fredericka', 'Gillespie', 'Bolton Powell Trading', 'Magni sunt dolore s', 'neguf@mailinator.com', '45', 'Quia quos ea Nam sit', '2025-01-27 09:17:41', '2025-01-27 09:17:41'),
(38, 46, 'Tate', 'Solomon', 'Rodriguez Wong Traders', 'Sed atque ut exceptu', 'gaha@mailinator.com', '90', 'Deserunt qui molesti', '2025-01-28 06:38:53', '2025-01-28 06:38:53');

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
  `description` text NOT NULL,
  `is_pompom` int(11) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `is_pompom`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'MB Classic 963', 'fjdfl', 1, 1, '2025-01-21 17:17:20', '2025-01-21 17:17:20'),
(2, 'MB Classic 965', 'kuch bhi', 1, 1, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(3, 'MB Classic 967-W', 'KUCH BH', 1, 1, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(4, 'MB Classic 867', 'kuch bhi', 0, 1, '2025-01-21 18:10:03', '2025-01-21 18:10:03'),
(5, 'MB Classic 867-B', 'kuch bhi', 1, 1, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(6, 'MB Classic 867-R', 'kuch bhi', 0, 1, '2025-01-21 18:15:04', '2025-01-21 18:15:04');

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
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_pricing`
--

INSERT INTO `product_pricing` (`id`, `product_id`, `pricing`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 13.00, 12, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(2, 1, 12.75, 25, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(3, 1, 12.50, 50, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(4, 1, 11.50, 100, '2025-01-21 17:17:21', '2025-01-21 17:17:21'),
(5, 1, 11.00, 250, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(6, 1, 11.50, 500, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(7, 1, 10.00, 1000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(8, 1, 8.00, 2500, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(9, 1, 7.00, 5000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(10, 1, 6.75, 10000, '2025-01-21 17:17:22', '2025-01-21 17:17:22'),
(11, 2, 13.00, 12, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(12, 2, 9.50, 25, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(13, 2, 6.55, 100, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(14, 2, 6.00, 250, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(15, 2, 5.85, 500, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(16, 2, 5.50, 1000, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(17, 2, 5.30, 2500, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(18, 2, 5.10, 5000, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(19, 2, 4.95, 10000, '2025-01-21 17:56:37', '2025-01-21 17:56:37'),
(20, 3, 13.00, 12, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(21, 3, 9.50, 25, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(22, 3, 8.95, 50, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(23, 3, 6.55, 100, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(24, 3, 6.00, 250, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(25, 3, 5.85, 500, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(26, 3, 5.50, 1000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(27, 3, 5.30, 2500, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(28, 3, 5.10, 5000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(29, 3, 4.95, 10000, '2025-01-21 18:01:58', '2025-01-21 18:01:58'),
(30, 4, 13.00, 12, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(31, 4, 9.50, 25, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(32, 4, 8.95, 50, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(33, 4, 6.55, 100, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(34, 4, 6.00, 250, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(35, 4, 5.85, 500, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(36, 4, 4.95, 1000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(37, 4, 5.30, 2500, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(38, 4, 5.10, 5000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(39, 4, 4.95, 10000, '2025-01-21 18:10:04', '2025-01-21 18:10:04'),
(40, 5, 13.00, 12, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(41, 5, 9.50, 25, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(42, 5, 8.95, 50, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(43, 5, 6.55, 100, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(44, 5, 6.00, 250, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(45, 5, 5.85, 500, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(46, 5, 4.95, 1000, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(47, 5, 5.30, 2500, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(48, 5, 5.10, 5000, '2025-01-21 18:10:54', '2025-01-21 18:10:54'),
(49, 5, 4.95, 10000, '2025-01-21 18:10:55', '2025-01-21 18:10:55'),
(50, 6, 13.00, 12, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(51, 6, 9.50, 25, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(52, 6, 8.95, 50, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(53, 6, 6.55, 100, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(54, 6, 6.00, 250, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(55, 6, 5.85, 500, '2025-01-21 18:15:04', '2025-01-21 18:15:04'),
(56, 6, 5.50, 1000, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(57, 6, 5.30, 2500, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(58, 6, 5.10, 5000, '2025-01-21 18:15:05', '2025-01-21 18:15:05'),
(59, 6, 4.95, 10000, '2025-01-21 18:15:05', '2025-01-21 18:15:05');

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
(2, 'Embroidery Patch', 'ProductPrintingImages/Zu6vTdKP2RRiGBfx5cMMpWm6Z4iq0lXd06fM4UV9.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"7.15\",\"5.225\",\"4.785\",\"4.785\",\"4.675\",\"4.4\",\"4.125\",\"3.85\",\"3.3\",\"2.2\"]', 0, 1, '2025-01-21 05:45:49', '2025-01-21 05:45:49'),
(3, 'Direct Embroidery', 'ProductPrintingImages/j6b3JRbeBkVadUbLWKfe0XALB4R1cIvvXVWLVQwG.png', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"4.35\",\"4.25\",\"4\",\"3.75\",\"3.5\",\"3\",\"2\"]', 0, 1, '2025-01-28 10:03:04', '2025-01-28 10:03:04'),
(4, '3D Embroidery Patch', 'ProductPrintingImages/EQq6Qt2bLkCjQgiGGYqcVoBr06t92JWonssG2hAW.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"1\"]', 0, 0, '2025-01-21 05:46:03', '2025-01-21 05:46:03'),
(5, 'DTF', 'ProductPrintingImages/y0UAtXSxwQ2lKv5iyTChQ9LXCNsSvwOozHAhKMKA.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.955\",\"5.0825\",\"4.6545\",\"4.6545\",\"4.5475\",\"4.28\",\"4.0125\",\"3.745\",\"3.21\",\"2.14\"]', 0, 1, '2025-01-21 05:46:20', '2025-01-21 05:46:20'),
(6, 'Woven Patch', 'ProductPrintingImages/1YH73Phgwd5ZJ75ASa0RMbcdOMUiLTjKQLQEu2j0.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"2\"]', 0, 0, '2025-01-21 05:46:32', '2025-01-21 05:46:32'),
(7, 'Woven Labels', 'ProductPrintingImages/AkXODM7syZdlakFzrWbgSXmST8ctfDOAbAg47jM9.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"2\"]', 0, 0, '2025-01-21 05:46:41', '2025-01-21 05:46:41'),
(8, 'Real Leather Patch', 'ProductPrintingImages/FtyRjewN0y5L2BOVoP5yk8YoXAvzbyRr3IR0x5WA.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"\",\"\",\"6.98175\",\"6.98175\",\"6.82125\",\"6.42\",\"6.01875\",\"5.6175\",\"4.815\",\"3.21\"]', 1, 1, '2025-01-21 05:46:54', '2025-01-21 05:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
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

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `status`, `is_reseller`, `neq_number`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'syedsabeer@gmail.com', NULL, '$2y$10$IIwAEh0X3FceNNwGqdjduOMmYg3j5KfUNiKqTb3DZP/1GLr.Hem5y', 1, 0, NULL, NULL, '2025-01-20 01:55:00', '2025-01-20 01:55:00'),
(2, 'testuser@gmail.com', NULL, '$2y$10$faeMJWUJMFyfr3fwAS/jMe0.myYHtVOhe41Z98CxayKbFBXNgT956', 1, 0, NULL, NULL, NULL, NULL),
(3, 'taimoorlala@gmail.com', NULL, '$2y$10$c8Txyz/ptLCeq4FLdVGtaunyeOlpWWSeiEsdeZE4kbPPPjNP45dAO', 1, 0, NULL, NULL, NULL, NULL),
(4, 'b.torres@weborka.com', NULL, '$2y$10$c534M1g.z515j6WPNOxKJeYBCotHeto523I7sZRWA0hPNWZm7VU4W', 1, 0, NULL, NULL, NULL, NULL),
(5, 'discall@gmail.com', NULL, '$2y$10$/XyfOiHCPjIqg8Vnm.5UZePGUm0kMz7GMJNdv0SZopn0Un8Ry8aJu', 1, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `_component_font`
--

CREATE TABLE `_component_font` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD KEY `orders_user_id_foreign` (`user_id`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `_component_font`
--
ALTER TABLE `_component_font`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `authorizedotnet_logs`
--
ALTER TABLE `authorizedotnet_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internal_status`
--
ALTER TABLE `internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `order_artwork`
--
ALTER TABLE `order_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_files`
--
ALTER TABLE `order_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `_component_font`
--
ALTER TABLE `_component_font`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
