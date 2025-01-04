-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 09:40 AM
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
(1, 'sabeer@gmail.com', '$2y$10$1/0O75JpMAtdyb6EoTBikO17vtaoxCOAQmwfzDPRF1ei/PvAeXx42', '2025-01-02 13:55:34', '2025-01-02 13:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
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
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_26_094812_create_product_delivery_table', 2);

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `base_images` text NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `base_images`, `visibility`, `created_at`, `updated_at`) VALUES
(70, 'YP Classics® knit beanie', 'Classic knit beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 8 ¬Ω\"', '[\"ProductImages\\/ieoMt3D8yI32ItTkPhc5pl09FYt7BLdK1oMNRsBH.png\"]', 1, '2025-01-01 19:07:15', '2025-01-02 00:57:44'),
(71, 'YP Classics® cuffed knit beanie', 'Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', '[\"ProductImages\\/vzuR0bmAj15bc8nujtLxRO5WoQSk173F3qlknaQc.png\"]', 1, '2025-01-01 19:33:17', '2025-01-01 19:33:17'),
(72, 'YP Classics® cuffed waffle knit beanie', 'Waffle Knit Cuffed-style beanie with dense weaving for easy embroidery.\r\n\r\nClassic Knit. Esteemed since 1974\r\nSuper dense knit for easy embroidery\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 12\" Uncuffed', '[\"ProductImages\\/l0DulcrckeZbXxtVwOTd0AeDXXsKiMFlBfKnWTuk.png\"]', 1, '2025-01-01 19:38:29', '2025-01-01 19:38:29'),
(73, 'YP Classics® ribbed cuffed knit beanie', 'Ribbed cuff knit beanie that is loosely knit.\r\n\r\nClassic Knit. Esteemed since 1974\r\nLoosely knit, Ribbed cuff\r\n100% Hypoallergenic Acrylic\r\nLength is approx. 10\" Uncuffed', '[\"ProductImages\\/X29sOT187DhjWW3dTMGI84Vdjk1YE4o1hpAHNZBR.jpg\"]', 1, '2025-01-01 19:43:17', '2025-01-01 19:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `color` text NOT NULL,
  `images` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `product_id`, `color`, `images`, `created_at`, `updated_at`) VALUES
(8, 70, '[\"#FF0000\",\"#FFD700\",\"#FF4500\",\"#000080\",\"#000000\",\"#8B4513\",\"#808000\",\"#4169E1\",\"#FFFFFF\",\"#800000\",\"#800080\",\"#008B45\",\"#AF6E4D\",\"#F4C2C2\",\"#A9A9A9\",\"#B7B8B6\",\"#88E500\",\"#56A3E8\",\"#FFD800\"]', '[\"ProductImages\\/ColorVariations\\/sr2Qp56cTK600BZzSVb1W7agbzLWH1UaRGSOjW3Y.png\",\"ProductImages\\/ColorVariations\\/53HqiNV0rnjR0VMhvm8hPNYUYd9AMnN1X0k1mALR.png\",\"ProductImages\\/ColorVariations\\/2b9xQKIUNXLo0ScSWtNXucvW1P7p941QDg2AH0l1.png\",\"ProductImages\\/ColorVariations\\/vP1dtVwT6zPXCsOQbpTuBmdvI6jo83IqcXOGCZaj.png\",\"ProductImages\\/ColorVariations\\/UYlRUenoix1Ot6xPxMQyb31cTGKnbiGA6ETTU27U.png\",\"ProductImages\\/ColorVariations\\/e0vuYZbikJGo5c9K9i1Na4G18z2YJPNk82gz0gCL.png\",\"ProductImages\\/ColorVariations\\/MPLMauOcFwY8Xax3ithWwUHlagsUVugBnEPVuHA8.png\",\"ProductImages\\/ColorVariations\\/wJUI0IsdImfOqLrE1yKtH9bZDaWUwDQTUqiF1QTa.png\",\"ProductImages\\/ColorVariations\\/2B1Nk6oCLgG18gVkEnUPB7vy4aOKCFgosvkK4zhX.png\",\"ProductImages\\/ColorVariations\\/Uc36GImQo99f7PO1Knp8nyXrDEEbGilKTHdgb40T.png\",\"ProductImages\\/ColorVariations\\/WGQ9yI2botFOVQtqkkDWgDSWKYCQImmLTv3c9KXR.png\",\"ProductImages\\/ColorVariations\\/Eg5i1aNLyUAP6u12ccIjBuimZKHNFnselH1KC4n0.png\",\"ProductImages\\/ColorVariations\\/WR6AN1dEltmZeY7a0P0Y0AzyNJi5fIVPYlvbXEjH.png\",\"ProductImages\\/ColorVariations\\/xajk7mFg0haeKcMLtkcnNYKqkKpOBrH9EsrznOUM.png\",\"ProductImages\\/ColorVariations\\/Fd7jD6GoOgYK4pwcS9LkkReNYg7o6gPL9d9FWns9.png\",\"ProductImages\\/ColorVariations\\/kUKSsrFADB8XfTSPfcSHY4BcC96kq62MqtFxxnh1.png\",\"ProductImages\\/ColorVariations\\/WGRfr7yD8x4D1ULnaepibN9TKFLO7dgM0HUfrBET.png\",\"ProductImages\\/ColorVariations\\/c9R505wiByM77HL5Acmwk22Tn5fF9PGadXN1OiAE.png\",\"ProductImages\\/ColorVariations\\/OQfZDAHeTlx9jj60MvYdbQZ0GdYqe7ysxMnMz0Wm.png\"]', '2025-01-01 19:07:16', '2025-01-01 19:07:16'),
(9, 71, '[\"#FF0000\",\"#FFD700\",\"#000080\"]', '[\"ProductImages\\/ColorVariations\\/0Toz48EOwYqSPZQTaxVojIWm56uMvFf4LkGLo2Tm.png\",\"ProductImages\\/ColorVariations\\/jbyFDkL3l2MLcsRN8uUDsg8eF7yYJyJNZC87quGY.png\",\"ProductImages\\/ColorVariations\\/cwjpmajdmqqXf3LPolHyUkdZkOFvSacPGIyhdZX5.png\"]', '2025-01-01 19:33:17', '2025-01-01 19:33:17'),
(10, 72, '[\"#FF0000\",\"#000080\",\"#000000\"]', '[\"ProductImages\\/ColorVariations\\/hKz3HN1cybKFURqlD8Rh1Uez8Enj3sjRS3k05hae.png\",\"ProductImages\\/ColorVariations\\/UnwzIdcIcAB7ffdmXCQkmWltAnUFZf9kMFB8dCgi.png\",\"ProductImages\\/ColorVariations\\/XYfOALoYUFGbdQmEvDp6MuNuBNynChnmzHiJrLYp.png\"]', '2025-01-01 19:38:29', '2025-01-01 19:38:29'),
(11, 73, '[\"#FF0000\",\"#000080\",\"#000000\"]', '[\"ProductImages\\/ColorVariations\\/eebFXI4NUeVFvqWUxj3qpVJtW8FViKpf3KHY1Vws.jpg\",\"ProductImages\\/ColorVariations\\/1WaIoJownFMks79sYeUGAcvKR3MMcDJoNdJVYyiM.jpg\",\"ProductImages\\/ColorVariations\\/eaO26jzVTLZHcrYPWNpriMaAwc50M03ie8bJTlMx.jpg\"]', '2025-01-01 19:43:17', '2025-01-01 19:43:17');

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
(1, '\"[\\\"3\\\",\\\"32\\\"]\"', '\"null\"', '2024-12-26 09:59:55', '2024-12-26 09:59:55'),
(2, '\"[\\\"43\\\",\\\"4\\\"]\"', '\"[\\\"43\\\",\\\"23\\\"]\"', '2024-12-26 10:00:36', '2024-12-26 10:00:36'),
(3, '\"[\\\"12\\\",\\\"25\\\",\\\"50\\\",\\\"100\\\",\\\"250\\\",\\\"500\\\",\\\"1000\\\",\\\"2500\\\",\\\"5000\\\"]\"', '\"[\\\"20\\\",\\\"18\\\",\\\"16\\\",\\\"14\\\",\\\"12\\\",\\\"10\\\",\\\"8\\\",\\\"6\\\",\\\"4\\\"]\"', '2024-12-26 12:43:35', '2024-12-26 12:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_pricing`
--

CREATE TABLE `product_pricing` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pricing` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `quantity` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_pricing`
--

INSERT INTO `product_pricing` (`id`, `product_id`, `pricing`, `quantity`, `created_at`, `updated_at`) VALUES
(8, 70, '[\"12.95\",\"9.50\",\"8.95\",\"6.55\",\"6.00\",\"5.85\",\"5.50\",\"5.30\",\"5.10\",\"4.95\"]', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\",\"10000\"]', '2025-01-01 19:07:16', '2025-01-01 19:07:16'),
(9, 71, '[\"12.95\",\"9.50\",\"8.95\",\"6.55\",\"6.00\",\"5.85\",\"5.50\",\"5.30\",\"5.10\"]', '[\"12\",\"24\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\"]', '2025-01-01 19:33:17', '2025-01-01 19:33:17'),
(10, 72, '[\"12.95\",\"9.50\",\"8.95\",\"6.55\",\"6.00\",\"5.85\",\"5.50\",\"5.30\",\"5.10\"]', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\"]', '2025-01-01 19:38:29', '2025-01-01 19:38:29'),
(11, 73, '[\"12.95\",\"9.50\",\"8.95\",\"6.55\",\"6.00\",\"5.85\",\"5.50\",\"5.30\",\"5.10\"]', '[\"12\",\"25\",\"50\",\"100\",\"250\",\"500\",\"1000\",\"2500\",\"5000\"]', '2025-01-01 19:43:17', '2025-01-01 19:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `product_printing`
--

CREATE TABLE `product_printing` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `quantity` text NOT NULL,
  `price` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_printing`
--

INSERT INTO `product_printing` (`id`, `title`, `image`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(4, 'No Imprint - Blank', 'ProductPrintingImages/24upYH15KxdYuwqG8sslFVHulAriwFQHmcC3Xgy5.png', '[\"1\"]', '[\"0\"]', '2024-12-21 11:07:02', '2024-12-21 11:07:02'),
(5, 'Direct Embroidery', 'ProductPrintingImages/3gFPMkxSRoO2xFndknYdWmdGSQC5SRAOWGLNkHZb.png', '[\"12\",\"24\",\"36\",\"50\"]', '[\"5\",\"3\",\"2\",\"1\"]', '2024-12-21 11:07:39', '2024-12-21 11:07:39'),
(6, 'Direct 3D Embroidery', 'ProductPrintingImages/exjDKyLpleHI4Iq5vIJZL1l8me27K3wCBOu9GJXr.png', '[\"10\",\"20\",\"30\",\"40\",\"50\",\"60\"]', '[\"6\",\"5\",\"4\",\"3\",\"2\",\"1\"]', '2024-12-21 11:11:02', '2024-12-21 11:11:02');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8BJ7trkkTRbwcP4qeDu6ffO71VzRAZdzg8UdHYug', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblp6UWJqV05lZHVnT2tMQWJZVHBnZTNsVmJoUzJIMFlTQXJQSXJRTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734849699),
('Hss1YLWqCQekNleWz2Fg7zDhUmeLWTebaD6f604N', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUll6QXlIWUl3WHFwdVA4QUYxZEtTck1hbHZwYmZLcUpzUDhjWjIxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9BZG1pbi9wdWJsaWMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1734946978),
('iwq2xrsFbrTmus4EuYGrtcy9DKRnKkTmddbgoTem', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFV1Z0E3M1UxQVhXNU5XeWxqamtmVER6eTU5TG9OejJTU1dKVWJiRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734867005),
('ksWTlbgxSLSJEldkeASNbFN2PGI2wY6guYEb2rtq', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR1VMMHA0cnI3NVYxb25xM29rM2c2V25sM3cxdEpYSjdxeHV1NzltSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734797505),
('mxvtyowAukHDiB1OAVzBT60QbXwWQbj1GzMilwph', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE9mSThkc3RRNmZRbGFtT0htaTZxdDNDbFN4VmxlcVNnMXUyWmNHTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734796540),
('ofUD1JCAXnppaNcKHuY1wfxLVJSkpZlsGgAEkKFO', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlpwdnEyRExCUFZUT3l1TzcwYTRzZVJ6U3dyeTFtamJGdWEwZnhMVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734849137),
('SSxArgJVyfERV1dxLBAhm1NPQyojWAZ4JcJUcXBN', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDIyRDZMTGR1Z1hDbVpwVE9TTWx0NE1LODEyZG1EUEw5ZU9iT3Y1ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734857611),
('vz6CA5oVLmgSuPZTtZ0AmeOj0E0BNuz6Ww9bEEh6', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTDVxdFhrdUFReU91emp0TFd2THE1NHFBUHdIMWtmdUVCaUUyRWsxTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734849122),
('zLLupfdZsgFVqcUYLAhozsu6ZWijXKwfLXsgMqBf', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmZEdFM3VWJzNUk0UnJ1TVUydGhiTjRxcmtWV20zMHdRQlJVbmhYYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly9sb2NhbGhvc3QvQmVhbmllcy9NYWluL3B1YmxpYy9wcm9kdWN0RGV0YWlsLzYzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1734867410);

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
(1, 'ss@ssss.com', NULL, '$2y$10$KBTl.rVaEGnOpNB.aBDWmOEUkWnGlDb.tOCPdI4MJxnpeTERpRrQi', 1, '24873264', NULL, '2025-01-02 06:56:55', '2025-01-02 06:56:55'),
(2, 'taimoorlala@gmail.com', NULL, '$2y$10$1/0O75JpMAtdyb6EoTBikO17vtaoxCOAQmwfzDPRF1ei/PvAeXx42', 1, '2323', NULL, '2025-01-02 08:29:14', '2025-01-02 08:29:14');

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
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_color_fk` (`product_id`);

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
  ADD KEY `product_pricing_fk` (`product_id`);

--
-- Indexes for table `product_printing`
--
ALTER TABLE `product_printing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_delivery`
--
ALTER TABLE `product_delivery`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_pricing`
--
ALTER TABLE `product_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `product_printing`
--
ALTER TABLE `product_printing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_color`
--
ALTER TABLE `product_color`
  ADD CONSTRAINT `product_color_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `product_pricing`
--
ALTER TABLE `product_pricing`
  ADD CONSTRAINT `product_pricing_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
