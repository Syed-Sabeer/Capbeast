-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2025 at 08:56 PM
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
(1, 'sabeer@gmail.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', '2025-01-04 18:24:23', '2025-01-04 18:24:23'),
(2, 'taimoorkhan@lala.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', '2025-01-10 04:57:42', '2025-01-10 04:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `beanie_type` int(11) NOT NULL,
  `printing_id` bigint(20) UNSIGNED NOT NULL,
  `printing_price` decimal(8,2) NOT NULL,
  `product_price` decimal(8,2) NOT NULL,
  `delivery_price` decimal(8,2) NOT NULL,
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
  `patch_length` decimal(8,2) DEFAULT NULL,
  `patch_height` decimal(8,2) DEFAULT NULL,
  `font_style` varchar(255) NOT NULL,
  `num_of_imprint` int(11) NOT NULL,
  `imprint_color` text NOT NULL,
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

--
-- Dumping data for table `component_embroidery_color`
--

INSERT INTO `component_embroidery_color` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(2, '4656', '#a91919', '2025-01-07 08:21:02', '2025-01-07 08:21:02'),
(3, '4392', '#28c76f', '2025-01-13 04:55:39', '2025-01-13 04:55:39');

-- --------------------------------------------------------

--
-- Table structure for table `component_product_color`
--

CREATE TABLE `component_product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color_name` varchar(255) NOT NULL,
  `color_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `component_product_color`
--

INSERT INTO `component_product_color` (`id`, `color_name`, `color_code`, `created_at`, `updated_at`) VALUES
(2, 'taimoor lala', '#ff0000', '2025-01-07 07:04:16', '2025-01-07 07:04:16'),
(3, 'sabeer new color', '#28c76f', '2025-01-07 07:50:43', '2025-01-07 07:50:43'),
(5, 'taimoor', '#e20808', '2025-01-08 08:40:59', '2025-01-08 08:40:59');

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
(1, 'Pending', 'Your order is being reviewed and will be processed soon', NULL, '2025-01-15 12:54:46', '2025-01-15 12:54:46'),
(2, 'Processing', 'Your order is being prepared and packed for shipping', NULL, '2025-01-15 12:54:58', '2025-01-15 12:54:58'),
(3, 'Picking', 'Items are being picked from the inventory for shipment', NULL, '2025-01-15 12:55:12', '2025-01-15 12:55:12'),
(4, 'Shipped', 'Your order has been shipped and is on its way to you', NULL, '2025-01-15 12:55:23', '2025-01-15 12:55:23'),
(5, 'Completed', 'Your order has been successfully delivered and completed', NULL, '2025-01-15 12:56:32', '2025-01-15 12:56:32'),
(6, 'Order Stock', 'Your order is being checked for stock availability', NULL, '2025-01-15 12:56:42', '2025-01-15 12:56:42'),
(7, 'Stock Ordered', 'Stock has been ordered and is expected to arrive soon', NULL, '2025-01-15 12:56:55', '2025-01-15 12:56:55'),
(8, 'Back Ordered', 'Some items are currently out of stock and will be shipped once available', NULL, '2025-01-15 12:57:07', '2025-01-15 12:57:07'),
(9, 'Waiting Approval', 'Your order is pending approval from the necessary authorities', NULL, '2025-01-15 12:57:19', '2025-01-15 12:57:19'),
(10, 'Approved', 'Your order has been approved and is now in the next phase of processing', NULL, '2025-01-15 12:57:31', '2025-01-15 12:57:31'),
(11, 'In Production', 'Your order is currently being produced and is progressing as scheduled', NULL, '2025-01-15 12:59:08', '2025-01-15 12:59:08'),
(12, 'Contact Client', 'We need to contact the client for further details regarding the order', NULL, '2025-01-15 12:59:22', '2025-01-15 12:59:22'),
(13, 'File Missing', 'A required file is missing and needs to be provided to proceed with the order', NULL, '2025-01-15 12:59:36', '2025-01-15 12:59:36'),
(14, 'On Hold', 'Your order is temporarily on hold due to pending actions', NULL, '2025-01-15 12:59:47', '2025-01-15 12:59:47'),
(15, 'Waiting Client Response', 'We are waiting for the client’s response before proceeding further', NULL, '2025-01-15 12:59:59', '2025-01-15 12:59:59'),
(16, 'Cancelled', 'Your order has been cancelled as per your request or due to an issue', NULL, '2025-01-15 13:00:12', '2025-01-15 13:00:12'),
(17, 'Payment Complete', 'Payment has been successfully completed for your order', NULL, '2025-01-15 13:00:26', '2025-01-15 13:00:26'),
(18, 'Payment Failed', 'Payment for your order has failed. Please try again or contact support', NULL, '2025-01-15 13:00:36', '2025-01-15 13:00:36'),
(19, 'Payment Pending', 'Payment is pending and is being processed', NULL, '2025-01-15 13:00:49', '2025-01-15 13:00:49'),
(20, 'Refunded', 'Your payment has been refunded successfully', NULL, '2025-01-15 13:01:04', '2025-01-15 13:01:04');

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
(7, '2024_12_18_191828_create_product_color_table', 1),
(8, '2024_12_18_191833_create_product_pricing_table', 1),
(9, '2024_12_26_094812_create_product_delivery_table', 1),
(10, '2025_01_02_135324_create_admins_table', 1),
(11, '2025_01_04_090228_create_product_baseimages_table', 1),
(12, '2025_01_04_114633_create_cart_table', 1),
(13, '2025_01_05_130138_create_cart_artwork_table', 2),
(15, '2025_01_07_092956_create_order_artwork_table', 3),
(16, '2025_01_07_110724_create__component_product_color_table', 4),
(17, '2025_01_07_110753_create_component_embroidery_color_table', 5),
(18, '2025_01_07_092943_create_order_table', 6),
(19, '2025_01_09_105027_create_order_artwork_table', 7),
(20, '2025_01_13_142822_create_order_shipping_detail_table', 8),
(21, '2025_01_15_114442_create_order_files_table', 9),
(22, '2025_01_15_163712_create_order_internal_status_table', 10),
(23, '2025_01_15_182222_create_order_internal_status_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `total_price`, `status`, `created_at`, `updated_at`, `order_id`) VALUES
(54, 1, 474.00, 0, '2025-01-13 05:02:51', '2025-01-15 08:50:28', 'OU4ZQI'),
(55, 1, 0.00, 0, '2025-01-13 09:26:11', '2025-01-13 09:26:11', 'NWSBHG'),
(56, 1, 156.00, 1, '2025-01-13 09:56:55', '2025-01-14 13:36:45', 'UIS4CI'),
(57, 3, 10868.75, 1, '2025-01-13 11:21:41', '2025-01-15 08:50:19', 'IDMFNV'),
(58, 1, 2339.25, 1, '2025-01-15 08:56:11', '2025-01-15 09:04:20', 'FCBUMQ');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_artwork`
--

INSERT INTO `order_artwork` (`id`, `order_item_id`, `artwork_type`, `artwork_dataText`, `artwork_dataImage`, `patch_length`, `patch_height`, `font_style`, `num_of_imprint`, `imprint_color`, `created_at`, `updated_at`) VALUES
(6, 22, 1, 'null', 'CustomerArtworkImages/M3fU82df2R8pRaICZTidDUztlkEKbr92ip5UBNGa.jpg', 2.00, 2.00, 'times', 4, '\"[]\"', '2025-01-15 08:56:11', '2025-01-15 08:56:11'),
(7, 23, 2, 'My Name Is Sabeer', NULL, 3.00, 2.00, 'times', 2, '\"[]\"', '2025-01-15 08:56:11', '2025-01-15 08:56:11');

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

--
-- Dumping data for table `order_files`
--

INSERT INTO `order_files` (`id`, `order_id`, `title`, `file`, `created_at`, `updated_at`) VALUES
(1, 54, 'sdsd', 'uploads/1736942243_screencapture-localhost-accord-public-shipper-fromdrop2-2025-01-15-15_07_03.png', '2025-01-15 06:57:23', '2025-01-15 06:57:23'),
(2, 54, 'sdsd', 'uploads/1736942253_screencapture-localhost-accord-public-shipper-fromdrop2-2025-01-15-15_07_03.png', '2025-01-15 06:57:33', '2025-01-15 06:57:33'),
(3, 54, 'this is pdf file', 'uploads/1736945329_PACKING SLIP-2412978.pdf', '2025-01-15 07:48:49', '2025-01-15 07:48:49'),
(4, 58, 'Art File', 'uploads/1736970283_2023-bentley-continental-gt-s-coupe.jpg', '2025-01-15 14:44:43', '2025-01-15 14:44:43');

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

--
-- Dumping data for table `order_internal_status`
--

INSERT INTO `order_internal_status` (`id`, `order_id`, `internal_status_id`, `created_at`, `updated_at`) VALUES
(1, 58, 2, '2025-01-15 13:59:46', '2025-01-15 14:32:43'),
(6, 58, 3, '2025-01-15 14:40:08', '2025-01-15 14:40:18'),
(7, 58, 5, '2025-01-15 14:40:13', '2025-01-15 14:40:13'),
(8, 58, 19, '2025-01-15 14:48:09', '2025-01-15 14:48:09'),
(9, 54, 2, '2025-01-15 14:48:33', '2025-01-15 14:48:33'),
(10, 56, 5, '2025-01-15 14:48:46', '2025-01-15 14:48:46');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `beanie_type` int(11) DEFAULT NULL,
  `printing_id` bigint(20) UNSIGNED NOT NULL,
  `printing_price` decimal(8,2) DEFAULT NULL,
  `product_price` decimal(8,2) DEFAULT NULL,
  `delivery_price` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `color_id`, `quantity`, `beanie_type`, `printing_id`, `printing_price`, `product_price`, `delivery_price`, `created_at`, `updated_at`) VALUES
(19, 56, 4, 13, 12, 1, 1, 0.00, 13.00, 0.00, '2025-01-13 09:56:55', '2025-01-13 09:56:55'),
(21, 57, 6, 22, 25, 2, 1, 0.00, 9.50, 0.00, '2025-01-13 11:21:41', '2025-01-13 11:21:41'),
(22, 58, 8, 43, 32, 1, 6, 1.00, 9.50, 18.00, '2025-01-15 08:56:11', '2025-01-15 08:56:11'),
(23, 58, 12, 78, 55, 2, 7, 1.00, 8.95, 16.00, '2025-01-15 08:56:11', '2025-01-15 08:56:11');

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
(2, 57, 'Syed', 'Sabeer', 'SRC Technologies', 'karachi, Pakistan, Asia, Earth, Solar System, Milkyway', 'sabeer@gmail.com', '03123456789', 'this is test additional information for the website testing let see if it works or not', '2025-01-13 11:21:41', '2025-01-13 11:21:41'),
(3, 54, 'Syed', 'Sabeer', 'SRC Technologies', 'karachi, Pakistan, Asia, Earth, Solar System, Milkyway', 'sabeer@gmail.com', '03123456789', 'this is test additional information for the website testing let see if it works or not', '2025-01-13 11:21:41', '2025-01-13 11:21:41'),
(4, 55, 'Syed', 'Sabeer', 'SRC Technologies', 'karachi, Pakistan, Asia, Earth, Solar System, Milkyway', 'sabeer@gmail.com', '03123456789', 'this is test additional information for the website testing let see if it works or not', '2025-01-13 11:21:41', '2025-01-13 11:21:41'),
(5, 56, 'Syed', 'Sabeer', 'SRC Technologies', 'karachi, Pakistan, Asia, Earth, Solar System, Milkyway', 'sabeer@gmail.com', '03123456789', 'this is test additional information for the website testing let see if it works or not', '2025-01-13 11:21:41', '2025-01-13 11:21:41'),
(6, 58, 'Lavinia', 'Thomas', 'Little Olsen Associates', 'Pariatur Rerum corr', 'rowozy@mailinator.com', '2545353435', 'Ad porro non est mol', '2025-01-15 08:56:11', '2025-01-15 08:56:11');

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
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `visibility`, `created_at`, `updated_at`) VALUES
(1, 'Custom Classic Polyester Cotton Beanies', 'We believe that you’ll find our Custom Classic Polyester Cotton Beanies an excellent value and may be used for promotional purposes. Oh. We got you covered, we have more styles for you to choose from, and you can customize this too! You can have your logos, graphic designs, or text embroidered right on them. Enjoy adding to your cart, and see you at the checkout!\r\n\r\n\r\nMaterial: Polyester Cotton\r\nSize: 20cm x 21cm, brim: 7cm\r\nHead Circumference:  54cm-60cm\r\nColors: Black, Blue, Brown, Caramel, Cream, Dark Gray, Dark Green, Hot Pink, Khaki, Light Gray, Light Pink, Maroon, Medium Gray, Navy Blue, Purple, Red, Royal blue, Turquoise, White, Yellow', 0, '2025-01-04 13:29:16', '2025-01-09 13:45:58'),
(3, 'YP Classics® cuffed knit beanie', 'Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 0, '2025-01-10 00:38:09', '2025-01-14 14:28:04'),
(4, 'YP Classics® cuffed knit beanie', 'Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 0, '2025-01-10 00:44:03', '2025-01-14 14:28:03'),
(5, 'YP Classics® cuffed waffle knit beanie', 'Waffle Knit Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 0, '2025-01-10 00:45:24', '2025-01-14 14:28:02'),
(6, 'YP Classics® knit beanie', 'Classic knit beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 8 ¬Ω\"', 0, '2025-01-10 00:47:27', '2025-01-14 14:28:01'),
(7, 'MB Classic 867', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(8, 'MB Classic 963', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(9, 'MB Classic 965', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(10, 'MB Classic 867-R', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 14:50:47', '2025-01-14 14:50:47'),
(11, 'MB Classic 967-W', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(12, 'MB Classic 867-B', 'Cuffed-style beanie with dense weaving for easy embroidery. Classic Knit. Esteemed since 1974 Super dense knit for easy embroidery 100% Hypoallergenic Acrylic Length is approx. 12\" Uncuffed', 1, '2025-01-14 15:09:40', '2025-01-14 15:09:40');

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
(1, 1, 'ProductImages/XsFZBlkkkz5KmydUdds4ztBD72jjGY5BZZkJgR8v.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(2, 1, 'ProductImages/uohWCL47JgbQd0VANXUtU1q9yRSD124M8vrDo4Br.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(4, 3, 'ProductImages/21280JG1KEUfOoAkO9LaPVvW7SZ3B8Eol0RZOJr5.png', '2025-01-10 00:38:09', '2025-01-10 00:38:09'),
(5, 4, 'ProductImages/O7281LTyvslBoxSiQXXVIheYfjPDjHquojYjXpY8.png', '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(6, 5, 'ProductImages/51uLb2lpZmcu06nn3cicwRMYl8FBfDPUsLHuHWJU.png', '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(7, 6, 'ProductImages/imstTB22u8smdRvABR5UBZwe9Ko5Lfm4RDYFgAXJ.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27'),
(8, 7, 'ProductImages/oiPj9FrrnquUs4e5Q1MHGGgeBbklTnxr7cHu0NdH.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(9, 8, 'ProductImages/bfQ4Fja2BR4qpdfAaS1O7GUBuMpu9ay0U4aSFt92.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(10, 9, 'ProductImages/UldOX4R3Xpe6Ezc1ZbEUpMq9yzkwcaM5oFZXRF38.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(11, 10, 'ProductImages/svZQCmIJ8T32vowla6TM2eLk4MIhAk9FBN6EJTLV.jpg', '2025-01-14 14:50:47', '2025-01-14 14:50:47'),
(12, 11, 'ProductImages/otGcwvJyFapc9jeifGZU0k7bArZMugmb1Kbr4KCG.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(13, 12, 'ProductImages/AVfqIKwBe6hnwyLHeaVmBlFI9b3xuAvPE7NeYTkv.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '#FF0000', 'ProductImages/ColorVariations/jHffPORmmp232oIy0b3q6qSi55lEK6cDOAEMtHXL.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(2, 1, '#000000', 'ProductImages/ColorVariations/pFdEqXtF4QYHthoAr8z7atfxRd4I2AazJERJEFwu.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(3, 1, '#4169E1', 'ProductImages/ColorVariations/9DIs5SFHp67OKk63SvmgEc9wIjke4m5v6lpDpW9J.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(9, 3, '#FF0000', 'ProductImages/ColorVariations/gUIvJ8kDgOdu54qhZj9gmZiI8vp4uaxAcolKcR7q.png', '2025-01-10 00:38:09', '2025-01-10 00:38:09'),
(10, 3, '#000080', 'ProductImages/ColorVariations/0OGiDcdK3SzIdi4jK9as3XkNGxY8G3aVAimZTdVv.png', '2025-01-10 00:38:09', '2025-01-10 00:38:09'),
(11, 3, '#808000', 'ProductImages/ColorVariations/yl8gcpI7CRhYsueSvJPlqkaRZitcPnCkrtdgDP4n.png', '2025-01-10 00:38:10', '2025-01-10 00:38:10'),
(12, 3, '#FFFFFF', 'ProductImages/ColorVariations/DB7M9sqAPMqiFUVAFTMWzGJmvkBYwwOwICUupBQ5.png', '2025-01-10 00:38:10', '2025-01-10 00:38:10'),
(13, 4, '#FF0000', 'ProductImages/ColorVariations/Su3dhJ6fPfGohZfI80avQKGa882NRqKITemhSqn0.png', '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(14, 4, '#FFFF00', 'ProductImages/ColorVariations/CuNAohHEXVVGe4jrkVwsd6owCuvEdEUf34rLFmuZ.png', '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(15, 4, '#000080', 'ProductImages/ColorVariations/toQ40L87e1Imp8RZWm5dHFyGW7e8ku7KNNBwogu2.png', '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(16, 4, '#808000', 'ProductImages/ColorVariations/kdIYxl4mLMRnZFN04C6ppa09UVqInYko6z8hHrpD.png', '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(17, 5, '#FF0000', 'ProductImages/ColorVariations/2DaxC9LMJOPZnPat3lGSZ2fS4FawC7pAe8B9j8kX.png', '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(18, 5, '#000080', 'ProductImages/ColorVariations/yvbe5IQQsil2dn9wOwFkcHWH7gVcApc2Lchn7ePH.png', '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(19, 5, '#000000', 'ProductImages/ColorVariations/ckisBBVsDvlE1u7N7BCdYkVgM9DcMqNRmi0uMWLQ.png', '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(20, 5, '#FFFFFF', 'ProductImages/ColorVariations/unqvTThUrbDBynQEW2Rg5Z9QcilV2Z2nHv6FkMXH.png', '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(21, 6, '#FF0000', 'ProductImages/ColorVariations/rhAtRs9brlilI0QITb75mpBzB6vPKD0A3BG7EgRF.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27'),
(22, 6, '#FFD700', 'ProductImages/ColorVariations/9IOBiDahFVwvX2qxixzdxMUNLR6T4vo8a6M6KWZ7.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27'),
(23, 6, '#000080', 'ProductImages/ColorVariations/je1IitR5hRUiL2JMuJJqoNxN2mk4X3hv2axkQTHD.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27'),
(24, 6, '#000000', 'ProductImages/ColorVariations/q2OInWBXs4VsKJe2dtf0cDByGK3FxFjqX9HbYpun.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27'),
(25, 7, '#8B4513', 'ProductImages/ColorVariations/8T0FLNJl5Wjiy4LeC5dpiME8pYcRj1LtAqO8NMnl.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(26, 7, '#A9A9A9', 'ProductImages/ColorVariations/jEyD5oSWQLc6reiFc0igxmRXS3w0SHYaOeeHU9E2.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(27, 7, '#800080', 'ProductImages/ColorVariations/JHINOLfG8IlKYOjMRHKsvT0ueBOXTYp3J5drD6Tp.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(28, 7, '#008B45', 'ProductImages/ColorVariations/GCRIEHgNbwGyXz8HqAlxQ8NQm3Y6l9S3RXWuHdyR.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(29, 7, '#4169E1', 'ProductImages/ColorVariations/VCb3nuWPhBxqcGTvK4NLC6NYwaPHCNUBkoPXXHpJ.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(30, 7, '#B7B8B6', 'ProductImages/ColorVariations/imOmxn4v8EpX4urWYldIlxK4M1ebR2Smh0OREljD.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(31, 7, '#FF4500', 'ProductImages/ColorVariations/afCl0gZdp12KEX2BhqkwbsJK4qRfNVXfMtQa7NvE.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(32, 7, '#FFB6C1', 'ProductImages/ColorVariations/WMAMo2SRRf3mcw4cbVn3VZKHy9VePu5ZZNb9RuLA.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(33, 7, '#AF6E4D', 'ProductImages/ColorVariations/078Duyjn5Lo4IHUXrKhMCxlo0jmB2M5eq56P7SIL.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(34, 7, '#000000', 'ProductImages/ColorVariations/HZXJzRkZu566OMoaw5uyJAj5ykR4fUAYynyMtkuR.jpg', '2025-01-14 14:27:55', '2025-01-14 14:27:55'),
(35, 8, '#FF4500', 'ProductImages/ColorVariations/SG0q2AstYyO2N1EGpmJg5Lm7vVUddeP6OFQWF6pa.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(36, 8, '#808000', 'ProductImages/ColorVariations/UcP5CoAimsfoR4cUa6uE2pMXw8M9gzFyRc1VoSHu.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(37, 8, '#FFB6C1', 'ProductImages/ColorVariations/Cms1MiaLyIvOiZ71zRhuZduzWEt3sr3qpdbd5EBo.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(38, 8, '#8B4513', 'ProductImages/ColorVariations/1njTxPX9DMB4R8xu5pWwkYJv5Mj8HmIhLmY2AMpJ.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(39, 8, '#FF0000', 'ProductImages/ColorVariations/KZqxYpeyRacQod5IskbkFAMME6voP1tNo1dxS2qz.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(40, 8, '#000000', 'ProductImages/ColorVariations/2bpuiVL9ZCejrtTQrEBJDRX34A1tJlG5fUumh6YZ.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(41, 8, '#4169E1', 'ProductImages/ColorVariations/SDy07uHmqyk9AxeBg8pMMCMuD4vB88j2X0TMzR1V.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(42, 8, '#800080', 'ProductImages/ColorVariations/qaQy3KIPTAU7dFCTTnnvY7QnGO9rDuzLXReozxHB.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(43, 8, '#008B45', 'ProductImages/ColorVariations/5cMO8wHJdwDyVsNrhyjXfPDLUAJocFVbH1xCshld.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(44, 8, '#FF4500', 'ProductImages/ColorVariations/nnXOKIE5ZuYfLESfqBlb1vBe2NFRVXLsl2S68iEQ.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(45, 8, '#FF0000', 'ProductImages/ColorVariations/Y5wESq6nYZGTItdj5TgrMCgSn6wCS8MjeWoZPpJ7.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(46, 8, '#000000', 'ProductImages/ColorVariations/NqNRu9dcvo7f59q1GnKO6q89ot9kjCstIAsS0eQw.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(47, 8, '#AF6E4D', 'ProductImages/ColorVariations/Ifu5sMsXxz6pVDLhGpWBLhd1PAQJtNm9GJwypGEq.jpg', '2025-01-14 14:39:01', '2025-01-14 14:39:01'),
(48, 9, '#FFB6C1', 'ProductImages/ColorVariations/MqTgxTrHavQDoSkVwFck4yu1KER0wGf0Foy2QoxR.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(49, 9, '#000080', 'ProductImages/ColorVariations/A09fmwaXksbct4yDOEcEZ0cYbV10dQjpLLJglRsM.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(50, 9, '#B7B8B6', 'ProductImages/ColorVariations/0pu06GQ2oq1PRuCCVutywMGJmHSS9LBlEwjKqSjq.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(51, 9, '#FF4500', 'ProductImages/ColorVariations/bTAnh3YkKQNV6e2COokoIuoTovsJB5aP6M4DecKo.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(52, 9, '#AF6E4D', 'ProductImages/ColorVariations/obLE4RdCBMl0LWk26EcUiAueEmf8h60TesMQ2aqY.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(53, 9, '#808000', 'ProductImages/ColorVariations/c8AXHss7yXgWrz4vRePzRPRhUjzZRabA0Gg1tQ36.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(54, 9, '#000000', 'ProductImages/ColorVariations/Ot8B28i3nHeVrNjgmQbiroEjeUNp1P3W4lQetFG5.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(55, 9, '#8B4513', 'ProductImages/ColorVariations/DnrZshvOU3zONfQ5lOz1xAtu0DA8mmHUXAfy5Hip.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(56, 9, '#AF6E4D', 'ProductImages/ColorVariations/f8dCuEqvJykiZHFxtoGTgNpo27TDfJy46rK7qB1y.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(57, 9, '#800080', 'ProductImages/ColorVariations/ap05VxmEnh2VlU6DhL2o0LVKXa6JyilOLEdP74Om.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(58, 9, '#008B45', 'ProductImages/ColorVariations/hDoVU4z9GnKjT9WNOhUcF9b19U5GxjqUlUSAKMHX.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(59, 9, '#FF0000', 'ProductImages/ColorVariations/vkqw4do8LwSUktghEVLUPbuEcklW5IGxJNKUTHi9.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(60, 9, '#FF00FF', 'ProductImages/ColorVariations/pTIFDTYYGxZHbM05DVLN4612IRMkFyeaVDh7mO6N.jpg', '2025-01-14 14:46:01', '2025-01-14 14:46:01'),
(61, 10, '#FF00FF', 'ProductImages/ColorVariations/9HFS4EeupgC2k1sZhf04RaVgps9aMCGFWQ64PJmm.jpg', '2025-01-14 14:50:47', '2025-01-14 14:50:47'),
(62, 10, '#AF6E4D', 'ProductImages/ColorVariations/lo2Gv5GcGrEPvbTPmR3vgVrJydR7l7vyg4C7BNhb.jpg', '2025-01-14 14:50:47', '2025-01-14 14:50:47'),
(63, 10, '#00FFFF', 'ProductImages/ColorVariations/ShslAONfKTVGxTdWiJ2UpjVehVUAXjR4O4lyMW1P.jpg', '2025-01-14 14:50:47', '2025-01-14 14:50:47'),
(64, 11, '#FFB6C1', 'ProductImages/ColorVariations/LAYwB6mhrwXPS2tFdSZTih4emOvvfggX8obCNXZd.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(65, 11, '#00FF00', 'ProductImages/ColorVariations/S9pwDLqbAZRMxfqfkZHgNWRHzkgiP7dhPjU0cdFi.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(66, 11, '#008B45', 'ProductImages/ColorVariations/VUY3sYcptL1x7ft3RHApo7XcwbSI2PRzd2WZhrMr.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(67, 11, '#000000', 'ProductImages/ColorVariations/smHxAUGpqIEM26NAZBpKvbSeovWNlXVvGkWUeNt6.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(68, 11, '#FF0000', 'ProductImages/ColorVariations/xgVmLyDyRqF0MhllxxTJozgWcKaAIZnkylG20D0X.jpg', '2025-01-14 14:57:24', '2025-01-14 14:57:24'),
(69, 12, '#88E500', 'ProductImages/ColorVariations/HIJdG6X49woqLe6J5FSrq0BSXSJusrLkEwXHhpJi.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(70, 12, '#FF4500', 'ProductImages/ColorVariations/UYm4MF8noBxopkLM4jJEO3lToHQ8DwwgDKO6GG86.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(71, 12, '#008B45', 'ProductImages/ColorVariations/Y5PAKV5T2tPX6R4EudGMtrb2y42ehvBrlVD8eB1j.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(72, 12, '#000000', 'ProductImages/ColorVariations/sIed4S0StM9GFRMO7p9WSJx8GV0fm4PQon8EyhZ5.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(73, 12, '#8B4513', 'ProductImages/ColorVariations/JSN2TfDo3Zw6WidWpIjWKdiCQkyMIzykEmkaGpLy.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(74, 12, '#F4C2C2', 'ProductImages/ColorVariations/ceu5ikZoC2WFCPQMZinv8rWkINdjKSyuLsipPVEP.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(75, 12, '#B7B8B6', 'ProductImages/ColorVariations/6CghA3mZzzHUiOU0cVppmPvX9vk2xshcgV5MChJd.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(76, 12, '#00FF00', 'ProductImages/ColorVariations/zbfKIOGuHWaHdWZAwBR7Fu6uoYcQOVvOzfJaaDgf.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(77, 12, '#800080', 'ProductImages/ColorVariations/qPV228BaUU55JR3Nal8wtmSGt9ffzFeohCh9rlaz.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40'),
(78, 12, '#FF0000', 'ProductImages/ColorVariations/JQbCN239FMb0TfDrEbdZNLzz2twVlnrB9o4nBfiF.jpg', '2025-01-14 15:09:40', '2025-01-14 15:09:40');

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
(1, '\"[\\\"12\\\",\\\"25\\\",\\\"50\\\",\\\"100\\\",\\\"250\\\",\\\"500\\\",\\\"1000\\\",\\\"2500\\\",\\\"5000\\\"]\"', '\"[\\\"20\\\",\\\"18\\\",\\\"16\\\",\\\"14\\\",\\\"12\\\",\\\"10\\\",\\\"8\\\",\\\"6\\\",\\\"4\\\"]\"', '2025-01-04 13:33:31', '2025-01-04 13:33:31');

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
(1, 1, 13.00, 12, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(2, 1, 9.50, 25, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(3, 1, 8.95, 50, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(4, 1, 6.55, 100, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(5, 1, 6.00, 250, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(6, 1, 5.85, 500, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(7, 1, 5.50, 1000, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(8, 1, 5.30, 2500, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(9, 1, 5.10, 5000, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(10, 1, 4.95, 10000, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(28, 3, 13.00, 12, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(29, 3, 9.50, 25, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(30, 3, 8.95, 50, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(31, 3, 6.55, 100, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(32, 3, 6.00, 250, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(33, 3, 5.85, 500, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(34, 3, 5.50, 1000, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(35, 3, 5.30, 2500, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(36, 3, 5.10, 5000, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(37, 3, 4.95, 10000, '2025-01-09 19:40:58', '2025-01-09 19:40:58'),
(45, 4, 13.00, 12, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(46, 4, 9.50, 25, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(47, 4, 8.95, 50, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(48, 4, 6.55, 100, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(49, 4, 6.00, 250, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(50, 4, 5.85, 500, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(51, 4, 5.50, 1000, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(52, 4, 5.30, 2500, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(53, 4, 5.10, 5000, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(54, 4, 4.95, 10000, '2025-01-09 19:46:14', '2025-01-09 19:46:14'),
(60, 5, 13.00, 12, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(61, 5, 9.50, 25, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(62, 5, 8.95, 50, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(63, 5, 6.55, 100, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(64, 5, 6.00, 250, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(65, 5, 5.85, 500, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(66, 5, 5.50, 1000, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(67, 5, 5.30, 2500, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(68, 5, 5.10, 5000, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(69, 5, 4.95, 10000, '2025-01-09 19:46:21', '2025-01-09 19:46:21'),
(91, 6, 13.00, 12, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(92, 6, 9.50, 25, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(93, 6, 8.95, 50, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(94, 6, 6.55, 100, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(95, 6, 6.00, 250, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(96, 6, 5.85, 500, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(97, 6, 5.50, 1000, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(98, 6, 5.30, 2500, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(99, 6, 5.10, 5000, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(100, 6, 4.95, 10000, '2025-01-09 19:50:32', '2025-01-09 19:50:32'),
(111, 7, 13.00, 12, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(112, 7, 9.50, 25, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(113, 7, 8.95, 50, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(114, 7, 6.55, 100, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(115, 7, 6.00, 250, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(116, 7, 5.85, 500, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(117, 7, 5.50, 1000, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(118, 7, 5.30, 2500, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(119, 7, 5.10, 5000, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(120, 7, 4.95, 10000, '2025-01-14 20:02:27', '2025-01-14 20:02:27'),
(126, 8, 13.00, 12, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(127, 8, 9.50, 25, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(128, 8, 8.95, 50, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(129, 8, 6.55, 100, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(130, 8, 6.00, 250, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(131, 8, 5.85, 500, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(132, 8, 5.50, 1000, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(133, 8, 5.30, 2500, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(134, 8, 5.10, 5000, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(135, 8, 4.95, 10000, '2025-01-14 20:03:06', '2025-01-14 20:03:06'),
(141, 9, 13.00, 12, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(142, 9, 9.50, 25, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(143, 9, 8.95, 50, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(144, 9, 6.55, 100, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(145, 9, 6.00, 250, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(146, 9, 5.85, 500, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(147, 9, 5.50, 1000, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(148, 9, 5.30, 2500, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(149, 9, 5.10, 5000, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(150, 9, 4.95, 10000, '2025-01-14 20:03:12', '2025-01-14 20:03:12'),
(156, 10, 13.00, 12, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(157, 10, 9.50, 25, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(158, 10, 8.95, 50, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(159, 10, 6.55, 100, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(160, 10, 6.00, 250, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(161, 10, 5.85, 500, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(162, 10, 5.50, 1000, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(163, 10, 5.30, 2500, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(164, 10, 5.10, 5000, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(165, 10, 4.95, 10000, '2025-01-14 20:03:20', '2025-01-14 20:03:20'),
(171, 11, 13.00, 12, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(172, 11, 9.50, 25, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(173, 11, 8.95, 50, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(174, 11, 6.55, 100, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(175, 11, 6.00, 250, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(176, 11, 5.85, 500, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(177, 11, 5.50, 1000, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(178, 11, 5.30, 2500, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(179, 11, 5.10, 5000, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(180, 11, 4.95, 10000, '2025-01-14 20:03:26', '2025-01-14 20:03:26'),
(187, 12, 13.00, 12, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(188, 12, 9.50, 25, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(189, 12, 8.95, 50, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(190, 12, 6.55, 100, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(191, 12, 6.00, 250, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(192, 12, 5.85, 500, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(193, 12, 5.50, 1000, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(194, 12, 5.30, 2500, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(195, 12, 5.10, 5000, '2025-01-14 20:10:10', '2025-01-14 20:10:10'),
(196, 12, 4.95, 10000, '2025-01-14 20:10:10', '2025-01-14 20:10:10');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_printing`
--

INSERT INTO `product_printing` (`id`, `title`, `image`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 'No Imprint - Blank', 'ProductPrintingImages/17tPqe1kUK1fiefujT0CQVvCY5VuUuAV1te7BZ35.png', '[\"0\"]', '[\"0\"]', '2025-01-04 13:29:43', '2025-01-04 13:29:43'),
(5, 'Embroidery Patch', 'ProductPrintingImages/PB3DxihceD5rarAmkr2mgiWoMbEDJpdClTKwe9xG.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"3.2\",\"3.1\",\"2.9\",\"2.9\",\"2.652\",\"2.65\",\"2.5\"]', '2025-01-14 12:24:10', '2025-01-14 12:24:10'),
(6, '3D Embroidery Patch', 'ProductPrintingImages/KdECSS8vqL4wc5nbn6j2qpBPT2NyeK3IINfkYnrA.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.825\",\"4.9875\",\"4.5675\",\"3.36\",\"3.255\",\"3.045\",\"3.045\",\"2.7846\",\"2.7825\",\"2.625\"]', '2025-01-14 12:24:25', '2025-01-14 12:24:25'),
(7, 'DTF', 'ProductPrintingImages/SpZcnfiYarNTL0If9vRS1z7ZcEUlzIumM3e7exoY.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"3.2\",\"3.1\",\"2.9\",\"2.9\",\"2.652\",\"2.65\",\"2.5\"]', '2025-01-14 12:24:44', '2025-01-14 12:24:44'),
(8, 'Woven Labels', 'ProductPrintingImages/nSD89ZqnmQG5OtfXNBSMx48rnVEa3EZKLtNvEoNe.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.825\",\"4.9875\",\"4.5675\",\"3.36\",\"3.255\",\"3.045\",\"3.045\",\"2.7846\",\"2.7825\",\"2.625\"]', '2025-01-14 12:24:53', '2025-01-14 12:24:53'),
(9, 'Woven Patch', 'ProductPrintingImages/G369GVf2ijcBViRvNfAJZqd56QwMxdc59JTGVBR0.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"3.2\",\"3.1\",\"2.9\",\"2.9\",\"2.652\",\"2.65\",\"2.5\"]', '2025-01-14 12:25:07', '2025-01-14 12:25:07'),
(10, 'Real Leather Patch', 'ProductPrintingImages/7oduAqzaWat73pEI3SM7CDTThRFGUDXY92aK6mvC.jpg', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.825\",\"4.9875\",\"4.5675\",\"3.36\",\"3.255\",\"3.045\",\"3.045\",\"2.7846\",\"2.7825\",\"2.625\"]', '2025-01-14 12:25:24', '2025-01-14 12:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `is_reseller` tinyint(1) NOT NULL DEFAULT 0,
  `neq_number` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `is_reseller`, `neq_number`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'syedsabeer@gmail.com', NULL, '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', 1, '6193', 1, NULL, '2025-01-04 13:24:03', '2025-01-13 13:11:35'),
(2, 'taimoorlala@gmail.com', NULL, '$2y$10$c8Txyz/ptLCeq4FLdVGtaunyeOlpWWSeiEsdeZE4kbPPPjNP45dAO', 0, NULL, 0, NULL, '2025-01-08 04:50:32', '2025-01-13 13:11:27'),
(3, 'testuser@gmail.com', NULL, '$2y$10$faeMJWUJMFyfr3fwAS/jMe0.myYHtVOhe41Z98CxayKbFBXNgT956', 0, NULL, 1, NULL, '2025-01-13 11:18:40', '2025-01-13 11:18:40');

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
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_product_id_foreign` (`product_id`),
  ADD KEY `cart_color_id_foreign` (`color_id`),
  ADD KEY `cart_printing_id_foreign` (`printing_id`),
  ADD KEY `cart_user_id_foreign` (`user_id`);

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
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `order_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_artwork`
--
ALTER TABLE `order_artwork`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_artwork_fk` (`order_item_id`);

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
  ADD KEY `order_items_fk_color` (`color_id`),
  ADD KEY `order_items_fk_printing` (`printing_id`),
  ADD KEY `order_items_fk_product` (`product_id`),
  ADD KEY `order_items_fk_order` (`order_id`);

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
  ADD KEY `product_color_product_id_foreign` (`product_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `component_embroidery_color`
--
ALTER TABLE `component_embroidery_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `component_product_color`
--
ALTER TABLE `component_product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `internal_status`
--
ALTER TABLE `internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `order_artwork`
--
ALTER TABLE `order_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `order_files`
--
ALTER TABLE `order_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_artwork`
--
ALTER TABLE `order_artwork`
  ADD CONSTRAINT `order_artwork_fk` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `order_items_fk_color` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_printing` FOREIGN KEY (`printing_id`) REFERENCES `product_printing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
