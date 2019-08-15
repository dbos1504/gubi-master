-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 14, 2019 at 10:04 PM
-- Server version: 5.7.19
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gubi-master`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subcategories_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `subcategories_id`, `name`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Featured', 'vorur', 1, NULL, NULL),
(2, 2, 'Lighting', 'lighting', 1, NULL, NULL),
(3, 3, 'Seating', 'seating', 1, NULL, NULL),
(4, 4, 'Tables', 'tables', 1, NULL, NULL),
(5, 5, 'Storage & Desks', 'storage-desks', 1, NULL, NULL),
(6, 6, 'Beds', 'beds', 1, NULL, NULL),
(7, 7, 'Mirrors', 'mirrors', 1, NULL, NULL),
(8, 8, 'Objects', 'objects', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
CREATE TABLE IF NOT EXISTS `categories_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_products_categories_id_foreign` (`categories_id`),
  KEY `categories_products_product_id_foreign` (`products_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories_products`
--

INSERT INTO `categories_products` (`id`, `categories_id`, `products_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-08-12 19:32:28', '2019-08-12 19:32:28'),
(2, 1, 2, '2019-08-13 18:05:48', '2019-08-13 18:05:48'),
(3, 7, 2, '2019-08-13 18:05:48', '2019-08-13 18:05:48'),
(4, 3, 3, '2019-08-13 18:52:24', '2019-08-13 18:52:24'),
(5, 1, 3, '2019-08-13 18:52:24', '2019-08-13 18:52:24'),
(6, 3, 4, '2019-08-13 19:17:33', '2019-08-13 19:17:33'),
(7, 1, 4, '2019-08-13 19:17:33', '2019-08-13 19:17:33'),
(8, 3, 5, '2019-08-14 18:24:34', '2019-08-14 18:24:34'),
(9, 1, 5, '2019-08-14 18:24:34', '2019-08-14 18:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_12_173753_create_navigations_table', 1),
(4, '2019_08_12_174425_create_projects_table', 1),
(5, '2019_08_12_175407_create_shops_table', 1),
(6, '2019_08_12_175706_create_sub_categories_table', 1),
(7, '2019_08_12_180134_create_products_table', 1),
(8, '2019_08_12_184024_create_categories_table', 1),
(9, '2019_08_12_184140_create_categorys_products_table', 1),
(10, '2019_08_12_184140_create_category_product_table', 2),
(11, '2019_08_12_184140_create_category_products_table', 3),
(12, '2019_08_12_210942_create_categories_products_table', 4),
(13, '2019_08_12_210942_create_category_products_table', 5),
(14, '2019_08_12_212301_create_categories_products_table', 6),
(15, '2019_08_13_193914_create_products_images_table', 7),
(16, '2019_08_13_212306_create_variations_table', 8),
(17, '2019_08_13_212959_create_products_variations_table', 9),
(18, '2019_08_13_213445_create_sub_variations_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `navigations`
--

DROP TABLE IF EXISTS `navigations`;
CREATE TABLE IF NOT EXISTS `navigations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `navigations`
--

INSERT INTO `navigations` (`id`, `name`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Heim', '/', 1, '2019-08-12 18:52:25', '2019-08-12 18:52:25'),
(2, 'Vörur', '/vorur', 1, NULL, NULL),
(3, 'Innblástur', '/innblastur', 1, NULL, NULL),
(4, 'Hönnuðir', '/honnudir', 1, NULL, NULL),
(5, 'Fréttir', '/frettir', 1, NULL, NULL),
(6, 'Um okkur', '/um-okkur', 1, NULL, NULL),
(7, 'Hafðu samband\r\n', '/hafdu-samband\r\n', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `designer_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL DEFAULT '0',
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_status` int(11) NOT NULL,
  `currency` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `designer_id`, `categories_id`, `sub_category_id`, `collection_id`, `image`, `alt`, `headline`, `price`, `price_status`, `currency`, `location`, `body`, `status`, `views`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 2, 0, 'floor.jpg', 'Canvas', '9602 Floor Lamp', '949.00', 0, '€', '9602-floor-lamp', '<p>qqqq</p>', 1, 50, '2019-08-12 19:32:28', '2019-08-14 19:22:23'),
(2, 0, 1, 0, 0, 'adnet.jpg', 'Adnet Wall Mirror', 'Adnet Wall Mirror - Circular - Dia. 58 Alcantara', '854.00', 0, '€', 'adnet-wall-mirror-circular-dia.-58-alcantara', '<p>wwww</p>', 1, 31, '2019-08-13 18:05:48', '2019-08-14 17:51:20'),
(3, 0, 1, 5, 0, 'bat.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Crisp 04115', '869.00', 0, '€', 'bat-dining-chair,-conic-base---fully-upholstered-in-crisp-04115', '<p>qqq</p>', 1, 12, '2019-08-13 18:52:24', '2019-08-14 17:39:13'),
(4, 0, 1, 5, 0, 'bat1.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Remix 123', '909.00', 0, '€', 'bat-dining-chair,-conic-base---fully-upholstered-in-remix-123', '<p>Bat Dining Chair</p>', 1, 1, '2019-08-13 19:17:33', '2019-08-13 19:20:13'),
(5, 0, 3, 5, 0, 'batt.webp', 'Bat Dining Chair', 'Bat Dining Chair - Un-Upholstered, Conic base', '309.00', 0, '€', 'bat-dining-chair---un-upholstered,-conic-base', '<h1 class=\"product-single__title\" style=\"box-sizing: border-box; font-size: 1.86667em; font-family: TimesNewRoman, \'Times New Roman\', Times, Baskerville, Georgia, serif; font-weight: 400; text-rendering: optimizelegibility; line-height: 1.4; color: #333333;\">Bat Dining Chair - Un-Upholstered, Conic base</h1>', 1, 66, '2019-08-14 18:24:34', '2019-08-14 19:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
CREATE TABLE IF NOT EXISTS `products_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `products_id`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(1, 2, 'adnet.jpg', 'Adnet Wall Mirror', '2019-08-13 18:05:48', '2019-08-13 18:05:48'),
(2, 2, 'adnet1.jpg', 'Adnet Wall Mirror', '2019-08-13 18:05:48', '2019-08-13 18:05:48'),
(3, 2, 'adnet2.jpg', 'Adnet Wall Mirror', '2019-08-13 18:05:48', '2019-08-13 18:05:48'),
(4, 3, 'bat.jpg', 'Bat Dining Chair', NULL, NULL),
(5, 4, 'bat1.jpg', 'Bat Dining Chair', '2019-08-13 19:17:33', '2019-08-13 19:17:33'),
(6, 1, 'floor.jpg', 'Canvas', '2019-08-14 17:25:50', '2019-08-14 17:25:50'),
(7, 1, 'floor1.jpg', 'Wicker Willow', '2019-08-14 17:25:50', '2019-08-14 17:25:50'),
(8, 5, 'batt.webp', 'img', '2019-08-14 19:07:20', '2019-08-14 19:07:20'),
(9, 5, 'brass.jpg', 'brass', '2019-08-14 19:07:20', '2019-08-14 19:07:20'),
(10, 5, 'white.webp', 'img', '2019-08-14 19:07:20', '2019-08-14 19:07:20');

-- --------------------------------------------------------

--
-- Table structure for table `products_variations`
--

DROP TABLE IF EXISTS `products_variations`;
CREATE TABLE IF NOT EXISTS `products_variations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(10) UNSIGNED NOT NULL,
  `variations_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_variations`
--

INSERT INTO `products_variations` (`id`, `products_id`, `variations_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2019-08-13 21:33:22', '2019-08-13 21:33:22'),
(5, 5, 1, '2019-08-14 18:25:04', '2019-08-14 18:25:04'),
(4, 1, 3, '2019-08-14 16:49:26', '2019-08-14 16:49:26'),
(6, 5, 4, '2019-08-14 18:25:12', '2019-08-14 18:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
CREATE TABLE IF NOT EXISTS `projects` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
CREATE TABLE IF NOT EXISTS `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_id` int(11) NOT NULL,
  `designer_id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `categories_id`, `designer_id`, `collection_id`, `headline`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 0, 0, 'Table Lamps', 'table-lamps', 1, NULL, NULL),
(2, 2, 0, 0, 'Floor Lamps', 'floor-lamps', 1, NULL, NULL),
(3, 2, 0, 0, 'Wall Lamps', 'wall-lamps', 1, NULL, NULL),
(4, 2, 0, 0, 'Pendants', 'pendants', 1, NULL, NULL),
(5, 3, 0, 0, 'Dining Chairs', 'dining-chairs', 1, NULL, NULL),
(6, 3, 0, 0, 'Lounge Chairs', 'lounge-chairs', 1, NULL, NULL),
(7, 3, 0, 0, 'Sofas', 'sofas', 1, NULL, NULL),
(8, 3, 0, 0, 'Stools & Bar Chairs', 'stools-bar-chairs', 1, NULL, NULL),
(9, 3, 0, 0, 'Ottomans & Pouffes', '0ttomans-pouffes', 1, NULL, NULL),
(10, 3, 0, 0, 'Meeting Chairs', 'meeting-chairs', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_variations`
--

DROP TABLE IF EXISTS `sub_variations`;
CREATE TABLE IF NOT EXISTS `sub_variations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` int(10) UNSIGNED NOT NULL,
  `variations_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_variations`
--

INSERT INTO `sub_variations` (`id`, `products_id`, `variations_id`, `name`, `variation_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Dusty Cedar', '', 'adnet.jpg', '2019-08-13 21:43:38', '2019-08-13 21:43:38'),
(3, 1, 3, 'Canvas', '', 'floor.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
(4, 1, 3, 'Wicker Willow', '', 'floor1.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
(5, 5, 1, 'Black Base', '', 'batt.webp', '2019-08-14 18:25:46', '2019-08-14 18:25:46'),
(6, 5, 4, 'Black Shell', '', 'batt.webp', '2019-08-14 18:26:18', '2019-08-14 18:26:18'),
(7, 5, 4, 'Pure White Shell', '', 'white.webp', '2019-08-14 18:52:10', '2019-08-14 18:52:10'),
(8, 5, 1, 'Brass Base', '', 'brass.jpg', '2019-08-14 19:05:59', '2019-08-14 19:05:59'),
(9, 5, 4, 'Pure White Shell', '', 'bras-wh.jpg', '2019-08-14 19:32:42', '2019-08-14 19:32:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Marko', 'dbos1504@gmail.com', NULL, '$2y$10$TgQ7XfCYVj1YAj1I.S2G.uQdhMT8Sx72WA/uoZcqN2//QIbhraTla', NULL, '2019-08-12 17:16:36', '2019-08-12 17:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

DROP TABLE IF EXISTS `variations`;
CREATE TABLE IF NOT EXISTS `variations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Base', '2019-08-13 21:32:00', '2019-08-13 21:32:00'),
(2, 'Color', NULL, NULL),
(3, 'Shade', NULL, NULL),
(4, 'Shell', NULL, NULL),
(5, 'Material', NULL, NULL),
(6, 'Top', NULL, NULL),
(7, 'Size', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
