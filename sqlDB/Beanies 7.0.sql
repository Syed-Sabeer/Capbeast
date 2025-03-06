-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2025 at 06:46 AM
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
-- Database: `supersof_metrocottonmill`
--

-- --------------------------------------------------------

--
-- Table structure for table `casefiles`
--

CREATE TABLE `casefiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `show_file` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casefiles`
--

INSERT INTO `casefiles` (`id`, `case_id`, `file_path`, `filename`, `show_file`, `created_at`, `updated_at`) VALUES
(62, 46, 'uploads/1741085638_SBQ800G-Black.jpg', 'SBQ800G-Black.jpg', 1, '2025-03-04 15:53:58', '2025-03-04 15:53:58'),
(63, 46, 'uploads/1741085652_SBQ800G-Black.jpg', 'SBQ800G-Black.jpg', 1, '2025-03-04 15:54:12', '2025-03-04 15:54:12'),
(64, 46, 'uploads/1741085652_SBQ600-Natural.jpg', 'SBQ600-Natural.jpg', 1, '2025-03-04 15:54:12', '2025-03-04 15:54:12'),
(65, 47, 'uploads/1741086337_SBQ600-Natural.jpg', 'SBQ600-Natural.jpg', 1, '2025-03-04 16:05:37', '2025-03-04 16:05:37'),
(66, 46, 'uploads/1741087126_red image.jpeg', 'red image.jpeg', 1, '2025-03-04 16:18:46', '2025-03-04 16:18:46'),
(69, 47, 'uploads/1741088362_red image.jpeg', 'red image.jpeg', 1, '2025-03-04 16:39:22', '2025-03-04 16:39:22'),
(71, 46, 'uploads/1741088632_SBQ800G_Carton_Marking_APPROVED_03-03-25.pdf', 'SBQ800G_Carton_Marking_APPROVED_03-03-25.pdf', 1, '2025-03-04 16:43:52', '2025-03-04 16:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `casenews`
--

CREATE TABLE `casenews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL,
  `origin` varchar(255) NOT NULL,
  `priority` varchar(255) NOT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `case_no` varchar(255) NOT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `subject` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `casenews`
--

INSERT INTO `casenews` (`id`, `status_id`, `origin`, `priority`, `owner_id`, `client_id`, `case_no`, `account_name`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(46, 9, 'Email', 'Medium', 1, 48, '25001', 'Unknown', 'Test Quote', '<ol><li>TB800 - 500 pcs 2 color 1 locaiton<br><br><br>asdfasdfasdf<br><br><br>sadfasdfadsf</li></ol>', '2025-03-04 15:52:45', '2025-03-06 15:44:37'),
(47, 5, 'Email', 'Medium', 1, 48, '025002', 'Zeeshan', 'Qutoe Price', 'There has been alot of things. \r\n\r\nTell me about this and you tell me what. \r\n\r\nthere has been alot \r\n\r\nits too much.', '2025-03-04 16:04:38', '2025-03-05 09:22:04');

-- --------------------------------------------------------

--
-- Table structure for table `case_participants`
--

CREATE TABLE `case_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `case_participants`
--

INSERT INTO `case_participants` (`id`, `case_id`, `participant_id`, `role`, `created_at`, `updated_at`) VALUES
(23, 46, 48, 'customer', '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(24, 46, 1, 'supperadmin', '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(25, 46, 5, 'supperadmin', '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(26, 46, 2, 'employee', '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(27, 47, 48, 'customer', '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(28, 47, 1, 'supperadmin', '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(29, 47, 5, 'supperadmin', '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(30, 47, 2, 'employee', '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(31, 47, 3, 'employee', '2025-03-04 16:16:19', '2025-03-04 16:16:19'),
(36, 47, 52, 'customer', '2025-03-05 09:31:09', '2025-03-05 09:31:09');

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `identifier_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `identifier_name`, `subject`, `description`, `created_at`, `updated_at`) VALUES
(5, 'specific', 'nalo@mailinator.com', 'Eum voluptatem ad si', '2025-01-09 05:40:32', '2025-02-02 04:58:26'),
(10, 'Sale Pitch', 'Introduction of our factory', 'aslk fjaslkdjf a;lksdjf ;laksdjf ;lkasjdf ;lkasdf dsaf', '2025-03-04 10:48:31', '2025-03-04 10:48:31');

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
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED DEFAULT NULL,
  `room_id` bigint(20) UNSIGNED DEFAULT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `room_id`, `message`, `created_at`, `updated_at`) VALUES
(11, 1, 43, 'hello', '2025-03-04 16:07:55', '2025-03-04 16:07:55'),
(12, 1, 43, 'we are working on th</br>is project. and i wi</br>ll update you shortl</br>y.', '2025-03-04 16:08:35', '2025-03-04 16:08:35'),
(13, 2, 46, 'Yes sir,', '2025-03-04 16:13:40', '2025-03-04 16:13:40'),
(14, 48, 46, 'hello.', '2025-03-04 16:14:01', '2025-03-04 16:14:01'),
(15, 1, 46, 'hello', '2025-03-04 16:14:34', '2025-03-04 16:14:34'),
(17, 52, 46, 'The case description</br> is not aligned yet', '2025-03-05 09:37:41', '2025-03-05 09:37:41'),
(18, 52, 46, 'on mobile view the w</br>hole names are not s</br>howing', '2025-03-05 09:38:44', '2025-03-05 09:38:44'),
(19, 52, 46, 'file attachment  upo</br>ad option for custom</br>er not availabe', '2025-03-05 09:39:32', '2025-03-05 09:39:32'),
(20, 2, 46, 'at main case page it</br>s status should be s</br>hown this way like h</br>ow many cases are in</br> production \"2\", How</br> many are shipped \"1</br>\"', '2025-03-05 09:45:10', '2025-03-05 09:45:10');

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
(5, '2024_12_11_095645_create_user_details_table', 2),
(6, '2024_12_31_134215_create_statuses_table', 3),
(7, '2025_01_05_084036_create_casenews_table', 4),
(8, '2025_01_05_093845_create_room_participants_table', 5),
(9, '2025_01_05_131008_create_casefiles_table', 6),
(10, '0000_00_00_000000_create_websockets_statistics_entries_table', 7),
(11, '2014_10_12_000000_create_rooms_table ', 7),
(12, '2014_10_12_100000_create_password_resets_table', 7),
(13, '2024_12_16_063335_create_messages_table', 7),
(14, '2025_01_07_111738_create_emails_table', 8),
(15, '2025_01_08_130949_create_rooms_table', 9),
(16, '2025_01_12_113736_create_notifications_table', 10),
(17, '2025_01_23_134938_create_case_participants_table', 11);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `to` int(11) NOT NULL,
  `from` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `to`, `from`, `message`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 41, 'User SRC has joined the portal.', 0, '2025-03-03 14:58:43', '2025-03-03 14:58:43'),
(2, 2, 41, 'User SRC has joined the portal.', 0, '2025-03-03 14:58:43', '2025-03-03 14:58:43'),
(3, 3, 41, 'User SRC has joined the portal.', 0, '2025-03-03 14:58:43', '2025-03-03 14:58:43'),
(4, 5, 41, 'User SRC has joined the portal.', 1, '2025-03-03 14:58:43', '2025-03-03 15:43:09'),
(5, 1, 42, 'User Hamza has joined the portal.', 0, '2025-03-03 15:02:33', '2025-03-03 15:02:33'),
(6, 2, 42, 'User Hamza has joined the portal.', 0, '2025-03-03 15:02:33', '2025-03-03 15:02:33'),
(7, 3, 42, 'User Hamza has joined the portal.', 0, '2025-03-03 15:02:33', '2025-03-03 15:02:33'),
(8, 5, 42, 'User Hamza has joined the portal.', 1, '2025-03-03 15:02:33', '2025-03-03 15:43:09'),
(9, 41, 42, 'User Hamza has joined the portal.', 0, '2025-03-03 15:02:33', '2025-03-03 15:02:33'),
(10, 1, 43, 'User test has joined the portal.', 0, '2025-03-03 15:05:57', '2025-03-03 15:05:57'),
(11, 2, 43, 'User test has joined the portal.', 0, '2025-03-03 15:05:57', '2025-03-03 15:05:57'),
(12, 3, 43, 'User test has joined the portal.', 0, '2025-03-03 15:05:57', '2025-03-03 15:05:57'),
(13, 5, 43, 'User test has joined the portal.', 1, '2025-03-03 15:05:57', '2025-03-03 15:43:09'),
(14, 41, 43, 'User test has joined the portal.', 0, '2025-03-03 15:05:57', '2025-03-03 15:05:57'),
(15, 42, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(16, 1, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(17, 2, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(18, 3, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(19, 5, 5, 'A new case has been created case # 000001', 1, '2025-03-03 15:06:53', '2025-03-03 15:43:09'),
(20, 41, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(21, 43, 5, 'A new case has been created case # 000001', 0, '2025-03-03 15:06:53', '2025-03-03 15:06:53'),
(22, 1, 47, 'User sjkk has joined the portal.', 0, '2025-03-03 15:29:00', '2025-03-03 15:29:00'),
(23, 2, 47, 'User sjkk has joined the portal.', 0, '2025-03-03 15:29:00', '2025-03-03 15:29:00'),
(24, 3, 47, 'User sjkk has joined the portal.', 0, '2025-03-03 15:29:00', '2025-03-03 15:29:00'),
(25, 5, 47, 'User sjkk has joined the portal.', 1, '2025-03-03 15:29:00', '2025-03-03 15:43:09'),
(26, 42, 47, 'A new case has been created case # 000002', 0, '2025-03-03 15:29:32', '2025-03-03 15:29:32'),
(27, 1, 47, 'A new case has been created case # 000002', 0, '2025-03-03 15:29:32', '2025-03-03 15:29:32'),
(28, 2, 47, 'A new case has been created case # 000002', 0, '2025-03-03 15:29:32', '2025-03-03 15:29:32'),
(29, 3, 47, 'A new case has been created case # 000002', 0, '2025-03-03 15:29:32', '2025-03-03 15:29:32'),
(30, 5, 47, 'A new case has been created case # 000002', 1, '2025-03-03 15:29:32', '2025-03-03 15:43:09'),
(31, 43, 47, 'A new case has been created case # 000002', 0, '2025-03-03 15:29:32', '2025-03-03 15:29:32'),
(32, 42, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(33, 1, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(34, 2, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(35, 3, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(36, 5, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(37, 43, 5, 'A new case has been created case # 000023', 0, '2025-03-03 22:25:56', '2025-03-03 22:25:56'),
(38, 1, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(39, 2, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(40, 3, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(41, 5, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(42, 43, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(43, 47, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:17', '2025-03-04 10:43:17'),
(44, 1, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(45, 2, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(46, 3, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(47, 5, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(48, 43, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(49, 47, 48, 'User Samia Internaitonal has joined the portal.', 0, '2025-03-04 10:43:19', '2025-03-04 10:43:19'),
(50, 48, 5, 'A new case has been created case # 000001', 0, '2025-03-04 15:52:06', '2025-03-04 15:52:06'),
(51, 1, 5, 'A new case has been created case # 000001', 0, '2025-03-04 15:52:06', '2025-03-04 15:52:06'),
(52, 5, 5, 'A new case has been created case # 000001', 0, '2025-03-04 15:52:06', '2025-03-04 15:52:06'),
(53, 48, 1, 'A new case has been created case # 25001', 1, '2025-03-04 15:52:45', '2025-03-04 16:13:03'),
(54, 1, 1, 'A new case has been created case # 25001', 0, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(55, 5, 1, 'A new case has been created case # 25001', 0, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(56, 2, 1, 'A new case has been created case # 25001', 0, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(57, 48, 1, 'A new case has been created case # 025002', 1, '2025-03-04 16:04:38', '2025-03-04 16:12:25'),
(58, 1, 1, 'A new case has been created case # 025002', 0, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(59, 5, 1, 'A new case has been created case # 025002', 0, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(60, 2, 1, 'A new case has been created case # 025002', 0, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(61, 48, 1, 'A new case has been created case # 025003', 0, '2025-03-04 16:22:10', '2025-03-04 16:22:10'),
(62, 1, 1, 'A new case has been created case # 025003', 0, '2025-03-04 16:22:11', '2025-03-04 16:22:11'),
(63, 2, 1, 'A new case has been created case # 025003', 0, '2025-03-04 16:22:11', '2025-03-04 16:22:11'),
(64, 3, 1, 'A new case has been created case # 025003', 0, '2025-03-04 16:22:11', '2025-03-04 16:22:11'),
(65, 1, 52, 'User Zeeshan Test has joined the portal.', 0, '2025-03-05 09:27:39', '2025-03-05 09:27:39'),
(66, 2, 52, 'User Zeeshan Test has joined the portal.', 0, '2025-03-05 09:27:39', '2025-03-05 09:27:39'),
(67, 3, 52, 'User Zeeshan Test has joined the portal.', 0, '2025-03-05 09:27:39', '2025-03-05 09:27:39'),
(68, 4, 52, 'User Zeeshan Test has joined the portal.', 0, '2025-03-05 09:27:39', '2025-03-05 09:27:39'),
(69, 48, 4, 'A new case has been created case # 025003', 0, '2025-03-05 14:09:13', '2025-03-05 14:09:13'),
(70, 1, 4, 'A new case has been created case # 025003', 0, '2025-03-05 14:09:13', '2025-03-05 14:09:13'),
(71, 4, 4, 'A new case has been created case # 025003', 0, '2025-03-05 14:09:13', '2025-03-05 14:09:13');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
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

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('zubairmaya@gmail.com', '$2y$10$zpLGIdMJLi1Ns3unfOCsseeUvHnHlG.qCHxsyAw2WghXFH1Bqq6wy', '2025-03-04 16:11:22');

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
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `case_id`, `name`, `created_at`, `updated_at`) VALUES
(43, 46, NULL, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(44, 46, 'PO Quote', '2025-03-04 15:54:48', '2025-03-04 15:54:48'),
(45, 46, 'Quote Price', '2025-03-04 15:55:56', '2025-03-04 15:55:56'),
(46, 47, NULL, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(47, 46, 'Quality Group', '2025-03-04 16:18:03', '2025-03-04 16:18:03'),
(50, 47, 'Internal Group', '2025-03-05 02:09:50', '2025-03-05 02:09:50'),
(51, 47, 'International Groupo 2', '2025-03-05 02:10:14', '2025-03-05 02:10:14'),
(53, 46, 'ABC Group', '2025-03-05 14:15:38', '2025-03-05 14:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `room_participants`
--

CREATE TABLE `room_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `case_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `room_id` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `room_participants`
--

INSERT INTO `room_participants` (`id`, `case_id`, `user_id`, `room_id`, `created_at`, `updated_at`) VALUES
(23, 46, 48, 43, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(24, 46, 1, 43, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(26, 46, 2, 43, '2025-03-04 15:52:45', '2025-03-04 15:52:45'),
(27, 46, 48, 44, '2025-03-04 15:54:48', '2025-03-04 15:54:48'),
(28, 46, 2, 45, '2025-03-04 15:55:56', '2025-03-04 15:55:56'),
(29, 47, 48, 46, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(30, 47, 1, 46, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(32, 47, 2, 46, '2025-03-04 16:04:38', '2025-03-04 16:04:38'),
(33, 47, 3, 46, '2025-03-04 16:16:19', '2025-03-04 16:16:19'),
(34, 46, 48, 47, '2025-03-04 16:18:03', '2025-03-04 16:18:03'),
(35, 46, 1, 47, '2025-03-04 16:18:03', '2025-03-04 16:18:03'),
(36, 46, 2, 47, '2025-03-04 16:18:03', '2025-03-04 16:18:03'),
(45, 47, 48, 50, '2025-03-05 02:09:50', '2025-03-05 02:09:50'),
(46, 47, 2, 50, '2025-03-05 02:09:50', '2025-03-05 02:09:50'),
(47, 47, 48, 51, '2025-03-05 02:10:14', '2025-03-05 02:10:14'),
(48, 47, 2, 51, '2025-03-05 02:10:14', '2025-03-05 02:10:14'),
(49, 47, 52, 46, '2025-03-05 09:31:09', '2025-03-05 09:31:09'),
(53, 46, 48, 53, '2025-03-05 14:15:38', '2025-03-05 14:15:38'),
(54, 46, 2, 53, '2025-03-05 14:15:38', '2025-03-05 14:15:38');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status_name` varchar(255) NOT NULL,
  `status_number` int(11) NOT NULL,
  `status_color_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status_name`, `status_number`, `status_color_code`, `created_at`, `deleted_at`, `updated_at`) VALUES
(1, 'New', 1, '#ff6c2b', '2025-01-01 04:08:18', NULL, '2025-01-21 03:02:41'),
(2, 'Customer Awaited', 2, '#ff0000', '2025-01-01 04:08:37', NULL, '2025-01-21 03:03:08'),
(3, 'Factory Awaited', 3, '#ff0000', '2025-01-05 09:55:08', NULL, '2025-01-21 03:03:22'),
(4, 'In Process', 4, '#00851b', '2025-01-05 09:56:00', NULL, '2025-01-21 03:03:46'),
(5, 'In Production', 5, '#007a02', '2025-01-05 09:56:18', NULL, '2025-01-21 03:04:02'),
(6, 'Shipped', 6, '#028000', '2025-01-05 09:56:37', NULL, '2025-01-21 03:04:17'),
(7, 'Delivered', 7, '#1100fa', '2025-01-05 09:56:54', NULL, '2025-01-21 03:04:41'),
(8, 'Customer Comment Awaited', 8, '#8231d3', '2025-01-05 09:57:08', NULL, '2025-01-22 06:41:34'),
(9, 'Close', 9, '#0a0a0a', '2025-01-21 03:06:19', NULL, '2025-01-22 06:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'METRO COTTON', 'zubair@metrotextileco.com', 'supperadmin', NULL, '$2y$10$j9Ihm3IU65L0c1uLBoAW4.s4Ushz8EH3fN6R6NV/4Dtox0EtT4bqy', 1, NULL, NULL, NULL),
(2, 'METRO COTTON', 'merchandising@metrotextileco.com', 'employee', NULL, '$2y$10$rGThvtvpTMntp2F64nlvzu9WvyMlJHc4sOZFU.OULvED0QSB1XJn6', 1, NULL, NULL, NULL),
(3, 'METRO COTTON', 'mkg@metrotexitleco.com', 'employee', NULL, '$2y$10$rGThvtvpTMntp2F64nlvzu9WvyMlJHc4sOZFU.OULvED0QSB1XJn6', 1, NULL, NULL, NULL),
(4, 'SuperSoft Test', 'supperadmin@gmail.com', 'supperadmin', NULL, '$2y$10$IFEdD5E9N.Zm/IKq00mMBOBwYt5gd6xSjhAsAsTJOCP4Wv1aBwuX6', 1, NULL, NULL, NULL),
(48, 'Samia Internaitonal Inc.', 'zubairmaya@gmail.com', 'customer', NULL, '$2y$10$ZPiDdLGnrWgD6ZW7MMbh5eCCe.3WhYAaNErB2orG1NlN2LB6HvwXm', 1, NULL, '2025-03-03 15:46:05', '2025-03-04 16:01:35'),
(49, 'Samia International Inc.', 'cameron@metro-textile.com', 'customer', NULL, '$2y$10$oFU4wAgqFGEDfvkgLYFM0enOyJI2pI6R.JpX44xYANn5UhW/ElkJu', 0, NULL, '2025-03-04 15:48:28', '2025-03-04 15:48:28'),
(50, 'Samia International Inc.', 'nathan@metro-textile.com', 'customer', NULL, '$2y$10$WMUB/LsAggjLoj2kQYBVlu2re8OPY5htZkGzWh/Zsq.YkebVAzvjG', 0, NULL, '2025-03-04 15:49:24', '2025-03-04 15:49:24'),
(51, 'Samia Internatoinal Inc.', 'mfg@metro-textile.com', 'customer', NULL, '$2y$10$7HRIKxb8JHaIjrKQ7LrbSemF6sJjpm3V0Z17O9A1me.rl4ysq4n9G', 0, NULL, '2025-03-04 15:50:22', '2025-03-04 15:50:22'),
(52, 'Zeeshan Test', 'Zeeshanaraain@gmail.com', 'customer', NULL, '$2y$10$.V6G3Rr/1IxOnIwtRVv70eRX5OiuCPG8ng98GpVY4MXiHh6DTRW6S', 1, NULL, '2025-03-05 09:26:22', '2025-03-05 09:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `suite` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `cell_phone_number` varchar(255) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `user_id`, `first_name`, `last_name`, `address`, `suite`, `city`, `state`, `zipcode`, `country`, `cell_phone_number`, `website_url`, `phone`, `fax`, `description`, `created_at`, `updated_at`) VALUES
(29, 1, 'Zubair', 'Maya', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-02 12:44:28', '2025-03-02 12:44:28'),
(45, 48, 'Zee', 'Maya', NULL, NULL, NULL, NULL, NULL, 'United States', NULL, NULL, NULL, NULL, NULL, '2025-03-03 15:46:05', '2025-03-04 16:01:35'),
(46, 2, 'Zeeshan', 'Ahmed', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 13:03:48', '2025-03-04 16:10:24'),
(47, 3, 'Asad', 'Bashir', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 13:04:45', '2025-03-04 15:55:21'),
(48, 49, 'Cameron', 'Anderson', '2435 N. Central Expy', 'Ste 1200', 'Richardosn', 'TX', '75080', 'United States', NULL, 'www.metro-textile.com', '+1214.352.0219', '888-672-2091', NULL, '2025-03-04 15:48:28', '2025-03-04 15:48:28'),
(49, 50, 'Nathan', 'Brown', '2435 N. Cenral Expy', 'Ste 1200', 'Richardson', 'TX', '75080', 'United States', NULL, 'www.metro-textile.com', '2143520219', '888-672-2091', NULL, '2025-03-04 15:49:24', '2025-03-04 15:49:24'),
(50, 51, 'Alex', 'Smith', '2435 N. Central Expy', 'Ste 1200', 'Richardson', 'TX', '75080', 'United States', NULL, 'www.metro-textile.com', '2143520219', '888-672-2091', NULL, '2025-03-04 15:50:22', '2025-03-04 15:50:22'),
(51, 4, 'SuperSoft', 'Test User', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-03-04 16:35:02', '2025-03-04 16:35:02'),
(52, 52, 'Zeeshan', 'Test', 'Gujamatta Near...', '987', 'Lahore', 'Punjab', NULL, 'United States', NULL, NULL, NULL, NULL, 'New company', '2025-03-05 09:26:22', '2025-03-05 09:26:22');

-- --------------------------------------------------------

--
-- Table structure for table `websockets_statistics_entries`
--

CREATE TABLE `websockets_statistics_entries` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `peak_connection_count` int(11) NOT NULL,
  `websocket_message_count` int(11) NOT NULL,
  `api_message_count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `casefiles`
--
ALTER TABLE `casefiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `casefiles_case_id_foreign` (`case_id`);

--
-- Indexes for table `casenews`
--
ALTER TABLE `casenews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `casenews_case_no_unique` (`case_no`),
  ADD KEY `casenews_owner_id_foreign` (`owner_id`),
  ADD KEY `casenews_client_id_foreign` (`client_id`),
  ADD KEY `casenews_status_id_foreign` (`status_id`);

--
-- Indexes for table `case_participants`
--
ALTER TABLE `case_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `case_participants_case_id_foreign` (`case_id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails_identifier_name_unique` (`identifier_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messages_sender_id_foreign` (`sender_id`),
  ADD KEY `messages_room_id_foreign` (`room_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rooms_case_id_foreign` (`case_id`);

--
-- Indexes for table `room_participants`
--
ALTER TABLE `room_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_participants_case_id_foreign` (`case_id`),
  ADD KEY `room_participants_user_id_foreign` (`user_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_details_user_id_foreign` (`user_id`);

--
-- Indexes for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `casefiles`
--
ALTER TABLE `casefiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `casenews`
--
ALTER TABLE `casenews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `case_participants`
--
ALTER TABLE `case_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `room_participants`
--
ALTER TABLE `room_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `websockets_statistics_entries`
--
ALTER TABLE `websockets_statistics_entries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `casefiles`
--
ALTER TABLE `casefiles`
  ADD CONSTRAINT `casefiles_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `casenews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `casenews`
--
ALTER TABLE `casenews`
  ADD CONSTRAINT `casenews_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `casenews_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `case_participants`
--
ALTER TABLE `case_participants`
  ADD CONSTRAINT `case_participants_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `casenews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `casenews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `room_participants`
--
ALTER TABLE `room_participants`
  ADD CONSTRAINT `room_participants_case_id_foreign` FOREIGN KEY (`case_id`) REFERENCES `casenews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `room_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
