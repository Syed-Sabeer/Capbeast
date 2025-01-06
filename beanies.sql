-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2025 at 05:38 PM
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
(1, 'sabeer@gmail.com', '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', '2025-01-04 18:24:23', '2025-01-04 18:24:23');

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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `color_id`, `quantity`, `beanie_type`, `printing_id`, `printing_price`, `product_price`, `delivery_price`, `created_at`, `updated_at`) VALUES
(55, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 05:50:00', '2025-01-06 05:50:00'),
(56, 1, 1, 3, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 05:53:15', '2025-01-06 05:53:15'),
(57, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 05:55:26', '2025-01-06 05:55:26'),
(58, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 05:58:25', '2025-01-06 05:58:25'),
(59, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:03:11', '2025-01-06 06:03:11'),
(60, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:03:59', '2025-01-06 06:03:59'),
(61, 1, 1, 2, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 06:04:30', '2025-01-06 06:04:30'),
(62, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:19:27', '2025-01-06 06:19:27'),
(63, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:19:59', '2025-01-06 06:19:59'),
(64, 1, 1, 2, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 06:28:35', '2025-01-06 06:28:35'),
(65, 1, 1, 1, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 06:37:51', '2025-01-06 06:37:51'),
(66, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:38:21', '2025-01-06 06:38:21'),
(67, 1, 1, 1, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 06:39:34', '2025-01-06 06:39:34'),
(68, 1, 1, 2, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 06:40:29', '2025-01-06 06:40:29'),
(69, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 06:40:48', '2025-01-06 06:40:48'),
(70, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 07:16:59', '2025-01-06 07:16:59'),
(71, 1, 1, 1, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 07:17:15', '2025-01-06 07:17:15'),
(72, 1, 1, 1, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 07:17:27', '2025-01-06 07:17:27'),
(73, 1, 1, 2, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 07:36:22', '2025-01-06 07:36:22'),
(74, 1, 1, 3, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 07:37:05', '2025-01-06 07:37:05'),
(75, 1, 1, 3, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 07:37:05', '2025-01-06 07:37:05'),
(76, 1, 1, 2, 12, 1, 2, 10.00, 13.21, 20.00, '2025-01-06 07:38:25', '2025-01-06 07:38:25'),
(77, 1, 1, 1, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 07:38:47', '2025-01-06 07:38:47'),
(78, 1, 1, 1, 12, 1, 1, 0.00, 13.21, 20.00, '2025-01-06 08:26:47', '2025-01-06 08:26:47'),
(79, 1, 1, 1, 12, 2, 2, 10.00, 13.21, 20.00, '2025-01-06 08:27:18', '2025-01-06 08:27:18');

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

--
-- Dumping data for table `cart_artwork`
--

INSERT INTO `cart_artwork` (`id`, `cart_id`, `artwork_type`, `artwork_dataText`, `artwork_dataImage`, `patch_length`, `patch_height`, `font_style`, `num_of_imprint`, `imprint_color`, `created_at`, `updated_at`) VALUES
(6, 59, 1, 'null', 'CustomerArtworkImages/mGwfPyVtdFfq4kdmP7Yj3CyELFWlFJuwyGoZFgEw.jpg', 1.00, 1.00, 'arial', 2, '[\"color1\",\"color2\"]', '2025-01-06 06:03:11', '2025-01-06 06:03:11'),
(7, 60, 2, 'sdsd', NULL, 1.00, 1.00, 'arial', 1, '[\"color1\"]', '2025-01-06 06:03:59', '2025-01-06 06:03:59'),
(8, 61, 2, 'sdsd', NULL, 1.00, 1.00, 'arial', 1, '[\"color1\"]', '2025-01-06 06:04:30', '2025-01-06 06:04:30'),
(9, 62, 1, 'null', 'CustomerArtworkImages/UEOWzLXgOusrgtQqaZ3s1io9Z6pS5Wkgv2z99SwL.jpg', 1.00, 1.00, 'arial', 2, '[\"color1\",\"color2\"]', '2025-01-06 06:19:28', '2025-01-06 06:19:28'),
(10, 63, 2, 'sdf', NULL, 1.00, 1.00, 'arial', 2, '[\"color1\",\"color2\"]', '2025-01-06 06:19:59', '2025-01-06 06:19:59'),
(11, 64, 1, 'null', NULL, 1.00, 1.00, 'arial', 0, '[]', '2025-01-06 06:28:35', '2025-01-06 06:28:35'),
(12, 68, 1, 'null', NULL, NULL, NULL, '', 1, '[]', '2025-01-06 06:40:29', '2025-01-06 06:40:29'),
(13, 69, 1, 'null', 'CustomerArtworkImages/B1TidWzwyyHbhCSfneJrzdhIIxiUDnxQaUPjwRid.jpg', NULL, NULL, '', 1, '[\"color1\",\"color2\"]', '2025-01-06 06:40:48', '2025-01-06 06:40:48'),
(14, 70, 1, 'null', 'CustomerArtworkImages/9MaoiaEI5WsansiJG9GHguYKZxewSYqoKsJSXkct.jpg', 2.00, 1.00, 'courier', 1, '[\"color1\"]', '2025-01-06 07:16:59', '2025-01-06 07:16:59'),
(15, 71, 2, 'sds', 'CustomerArtworkImages/t7YyjaCg7rdA3UVr0cXLhHfZQ1YKwiQwer7cHP1W.jpg', 2.00, 1.00, 'courier', 1, '[\"color1\"]', '2025-01-06 07:17:15', '2025-01-06 07:17:15'),
(16, 72, 2, 'sds', 'CustomerArtworkImages/X34hyGKu4OEYd5Chd854a3Ynu3g0tw9VyBKYyUCJ.jpg', 2.00, 1.00, 'courier', 1, '[\"color1\"]', '2025-01-06 07:17:27', '2025-01-06 07:17:27'),
(17, 75, 2, 'dsd', NULL, 1.00, 1.00, 'courier', 3, '[\"color1\",\"color2\",\"color3\"]', '2025-01-06 07:37:06', '2025-01-06 07:37:06'),
(18, 74, 2, 'dsd', NULL, 1.00, 1.00, 'courier', 3, '[\"color1\",\"color2\",\"color3\"]', '2025-01-06 07:37:06', '2025-01-06 07:37:06'),
(19, 76, 1, 'null', 'CustomerArtworkImages/orEX8GNWXwGMLpe2amItgjXTwBqnnBwhWoqHiQ0N.jpg', 1.00, 1.00, 'arial', 2, '[\"color1\",\"color2\"]', '2025-01-06 07:38:25', '2025-01-06 07:38:25'),
(20, 79, 1, 'null', 'CustomerArtworkImages/YaV5zeiMnS8s9tX6gaWUBeIAm28QyCASumgoODfJ.jpg', 1.00, 1.00, 'arial', 1, '[\"color1\"]', '2025-01-06 08:27:18', '2025-01-06 08:27:18');

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
(13, '2025_01_05_130138_create_cart_artwork_table', 2);

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
(1, 'Custom Classic Polyester Cotton Beanies', 'We believe that you’ll find our Custom Classic Polyester Cotton Beanies an excellent value and may be used for promotional purposes. Oh. We got you covered, we have more styles for you to choose from, and you can customize this too! You can have your logos, graphic designs, or text embroidered right on them. Enjoy adding to your cart, and see you at the checkout!\r\n\r\n\r\nMaterial: Polyester Cotton\r\nSize: 20cm x 21cm, brim: 7cm\r\nHead Circumference:  54cm-60cm\r\nColors: Black, Blue, Brown, Caramel, Cream, Dark Gray, Dark Green, Hot Pink, Khaki, Light Gray, Light Pink, Maroon, Medium Gray, Navy Blue, Purple, Red, Royal blue, Turquoise, White, Yellow', 1, '2025-01-04 13:29:16', '2025-01-06 04:12:41');

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
(2, 1, 'ProductImages/uohWCL47JgbQd0VANXUtU1q9yRSD124M8vrDo4Br.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17');

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
(3, 1, '#4169E1', 'ProductImages/ColorVariations/9DIs5SFHp67OKk63SvmgEc9wIjke4m5v6lpDpW9J.jpg', '2025-01-04 13:29:17', '2025-01-04 13:29:17');

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
(1, 1, 13.21, 12, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(2, 1, 9.69, 25, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(3, 1, 9.01, 50, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(4, 1, 6.55, 100, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(5, 1, 6.21, 250, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(6, 1, 5.91, 500, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(7, 1, 5.62, 1000, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(8, 1, 5.36, 2500, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(9, 1, 5.08, 5000, '2025-01-04 13:29:17', '2025-01-04 13:29:17'),
(10, 1, 4.81, 10000, '2025-01-04 13:29:17', '2025-01-04 13:29:17');

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
(2, 'Direct Embroidery', 'ProductPrintingImages/1nrwWJByIqf0j4qPVB91bJhttpniSsd5Mqze9fu5.png', '[\"12\",\"25\",\"50\",\"100\",\"250\"]', '[\"10\",\"8\",\"6\",\"4\",\"2\"]', '2025-01-04 13:30:38', '2025-01-04 13:30:38'),
(3, 'Direct 3D Embroidery', 'ProductPrintingImages/fRf2XpPethECgtr9dfAnAO38O4ScDZiqlplC2cqZ.png', '[\"12\",\"25\",\"50\",\"100\",\"250\"]', '[\"20\",\"18\",\"16\",\"14\",\"12\"]', '2025-01-04 13:31:28', '2025-01-04 13:31:28');

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
(1, 'syedsabeer@gmail.com', NULL, '$2y$10$GDIj3rw4oV72BOFWB.juCOy/dWSlwIX.HdvC1gotslctTRzrwIM9O', 0, NULL, NULL, '2025-01-04 13:24:03', '2025-01-04 13:24:03');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
