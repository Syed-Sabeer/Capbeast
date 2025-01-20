-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2025 at 01:10 PM
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
(23, '2025_01_19_143116_create_cart_artwork_table', 1);

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
  `additional_info` text NOT NULL,
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
  `is_pompom` int(11) NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'syedsabeer@gmail.com', NULL, '$2y$10$IIwAEh0X3FceNNwGqdjduOMmYg3j5KfUNiKqTb3DZP/1GLr.Hem5y', 1, 0, NULL, NULL, '2025-01-20 06:55:00', '2025-01-20 06:55:00'),
(2, 'testuser@gmail.com', NULL, '$2y$10$faeMJWUJMFyfr3fwAS/jMe0.myYHtVOhe41Z98CxayKbFBXNgT956', 1, 0, NULL, NULL, NULL, NULL),
(3, 'taimoorlala@gmail.com', NULL, '$2y$10$c8Txyz/ptLCeq4FLdVGtaunyeOlpWWSeiEsdeZE4kbPPPjNP45dAO', 1, 0, NULL, NULL, NULL, NULL),
(4, 'b.torres@weborka.com', NULL, '$2y$10$c534M1g.z515j6WPNOxKJeYBCotHeto523I7sZRWA0hPNWZm7VU4W', 1, 0, NULL, NULL, NULL, NULL);

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
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_artwork`
--
ALTER TABLE `cart_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component_embroidery_color`
--
ALTER TABLE `component_embroidery_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `component_product_color`
--
ALTER TABLE `component_product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_artwork`
--
ALTER TABLE `order_artwork`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_files`
--
ALTER TABLE `order_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_internal_status`
--
ALTER TABLE `order_internal_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_shipping_detail`
--
ALTER TABLE `order_shipping_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_baseimages`
--
ALTER TABLE `product_baseimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
