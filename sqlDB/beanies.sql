-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2025 at 02:53 PM
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
(2, '4656', '#a91919', '2025-01-07 08:21:02', '2025-01-07 08:21:02');

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
(19, '2025_01_09_105027_create_order_artwork_table', 7);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_id` varchar(6) NOT NULL
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
  `quantity` int(11) NOT NULL,
  `beanie_type` int(11) DEFAULT NULL,
  `printing_id` bigint(20) UNSIGNED NOT NULL,
  `printing_price` decimal(8,2) DEFAULT NULL,
  `product_price` decimal(8,2) DEFAULT NULL,
  `delivery_price` decimal(8,2) DEFAULT NULL,
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
(3, 'YP Classics® cuffed knit beanie', 'Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 1, '2025-01-10 00:38:09', '2025-01-10 00:38:09'),
(4, 'YP Classics® cuffed knit beanie', 'Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 1, '2025-01-10 00:44:03', '2025-01-10 00:44:03'),
(5, 'YP Classics® cuffed waffle knit beanie', 'Waffle Knit Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', 1, '2025-01-10 00:45:24', '2025-01-10 00:45:24'),
(6, 'YP Classics® knit beanie', 'Classic knit beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 8 ¬Ω\"', 1, '2025-01-10 00:47:27', '2025-01-10 00:47:27');

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
(7, 6, 'ProductImages/imstTB22u8smdRvABR5UBZwe9Ko5Lfm4RDYFgAXJ.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27');

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
(24, 6, '#000000', 'ProductImages/ColorVariations/q2OInWBXs4VsKJe2dtf0cDByGK3FxFjqX9HbYpun.png', '2025-01-10 00:47:27', '2025-01-10 00:47:27');

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
(100, 6, 4.95, 10000, '2025-01-09 19:50:32', '2025-01-09 19:50:32');

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
(2, 'Direct Embroidery', 'ProductPrintingImages/1nrwWJByIqf0j4qPVB91bJhttpniSsd5Mqze9fu5.png', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.5\",\"4.75\",\"4.35\",\"3.2\",\"3.1\",\"2.9\",\"2.9\",\"2.652\",\"2.65\",\"2.5\"]', '2025-01-04 13:30:38', '2025-01-04 13:30:38'),
(3, 'Direct 3D Embroidery', 'ProductPrintingImages/fRf2XpPethECgtr9dfAnAO38O4ScDZiqlplC2cqZ.png', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '[\"6.825\",\"4.9875\",\"4.5675\",\"3.36\",\"3.255\",\"3.045\",\"3.045\",\"2.7846\",\"2.7825\",\"2.625\"]', '2025-01-04 13:31:28', '2025-01-04 13:31:28');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `email_verified_at`, `password`, `is_reseller`, `neq_number`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'syedsabeer@gmail.com', NULL, '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', 0, NULL, NULL, '2025-01-04 13:24:03', '2025-01-04 13:24:03'),
(2, 'taimoorlala@gmail.com', NULL, '$2y$10$c8Txyz/ptLCeq4FLdVGtaunyeOlpWWSeiEsdeZE4kbPPPjNP45dAO', 0, NULL, NULL, '2025-01-08 04:50:32', '2025-01-08 04:50:32');

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
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_fk_color` (`color_id`),
  ADD KEY `order_items_fk_printing` (`printing_id`),
  ADD KEY `order_items_fk_product` (`product_id`),
  ADD KEY `order_items_fk_order` (`order_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `component_embroidery_color`
--
ALTER TABLE `component_embroidery_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `order_artwork`
--
ALTER TABLE `order_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_fk_color` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_printing` FOREIGN KEY (`printing_id`) REFERENCES `product_printing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_fk_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

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
