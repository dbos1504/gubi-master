-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 18, 2019 at 12:20 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.1

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
-- Table structure for table `abouts`
--

DROP TABLE IF EXISTS `abouts`;
CREATE TABLE IF NOT EXISTS `abouts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `abouts`
--

INSERT INTO `abouts` (`id`, `headline`, `body`, `created_at`, `updated_at`) VALUES
(1, 'About Gubi', 'GUBI is a design company dedicated to celebrating the luxury of living life. Designs that combine the past and the present for the new to evolve. Designs that stimulate the senses, are beautiful yet usable. GUBI is pursuing perfection with passion and courage. Evolution is the essence.', '2019-08-15 13:26:31', '2019-08-15 13:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subcategories_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `subcategories_id`, `name`, `location`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Featured', 'featured', 1, '2019-08-17 17:15:21', '2019-08-17 17:15:21'),
(2, 2, 'Lighting', 'lighting', 1, NULL, NULL),
(3, 3, 'Seating', 'seating', 1, NULL, NULL),
(4, 4, 'Tables', 'tables', 1, NULL, NULL),
(5, 5, 'Storage & Desks', 'storage-desks', 1, NULL, '2019-08-16 08:00:00'),
(6, 6, 'Beds', 'beds', 1, NULL, NULL),
(7, 7, 'Mirrors', 'mirrors', 1, NULL, '2019-08-17 15:56:25');

-- --------------------------------------------------------

--
-- Table structure for table `categories_products`
--

DROP TABLE IF EXISTS `categories_products`;
CREATE TABLE IF NOT EXISTS `categories_products` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categories_id` bigint(10) UNSIGNED NOT NULL,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_products_categories_id_foreign` (`categories_id`),
  KEY `categories_products_product_id_foreign` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories_products`
--

INSERT INTO `categories_products` (`id`, `categories_id`, `products_id`, `created_at`, `updated_at`) VALUES
(4, 3, 3, '2019-08-13 18:52:24', '2019-08-13 18:52:24'),
(6, 3, 4, '2019-08-13 19:17:33', '2019-08-13 19:17:33'),
(8, 3, 5, '2019-08-14 18:24:34', '2019-08-14 18:24:34'),
(10, 6, 6, '2019-08-15 06:01:45', '2019-08-15 06:01:45'),
(14, 4, 9, '2019-08-15 18:01:43', '2019-08-15 18:01:43'),
(16, 3, 10, '2019-08-16 10:37:24', '2019-08-16 10:37:24'),
(17, 3, 11, '2019-08-16 20:50:39', '2019-08-16 20:50:39'),
(25, 1, 1, NULL, NULL),
(26, 1, 2, NULL, NULL),
(27, 1, 3, NULL, NULL),
(28, 1, 4, NULL, NULL),
(29, 1, 5, NULL, NULL),
(30, 1, 9, NULL, NULL),
(31, 1, 10, NULL, NULL),
(36, 7, 2, NULL, NULL),
(37, 2, 12, '2019-08-17 16:10:21', '2019-08-17 16:10:21'),
(38, 2, 13, '2019-08-17 16:40:58', '2019-08-17 16:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Marko', 'Boskovic', 'info@greyapartments.is', 'sfsdfs', 'qqqq', 0, '2019-08-17 21:37:59', '2019-08-17 21:37:59');

-- --------------------------------------------------------

--
-- Table structure for table `designers`
--

DROP TABLE IF EXISTS `designers`;
CREATE TABLE IF NOT EXISTS `designers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `collections_id` int(11) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image_alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designers`
--

INSERT INTO `designers` (`id`, `collections_id`, `image`, `alt`, `location`, `name`, `main_image`, `main_image_alt`, `body`, `video`, `status`, `created_at`, `updated_at`) VALUES
(3, 0, 'bond-image.png', 'BONDERUP & THORUP', 'bonderup-thorup', 'BONDERUP & THORUP', 'bond.jpeg', 'BONDERUP & THORUP', '<p>Torsten Thorup (born 1944) and Claus Bonderup (born 1943) are both graduates from the Royal Danish Academy of Fine Arts, School of Architecture in 1969, and subsequently went to work together at Danish architect, Henning Larsen\'s studio in Copenhagen. The two architects teamed up professionally and worked together for the majority of their careers. Together they have designed watches and in-store displays for Georg Jensen, the Arktikum museum in Finland and the harbour area in Elsinore, where they designed everything, from urban planning to the ticket offices. They have through their long career served many Danish and international clients.</p>\r\n<br><br>\r\n<p>Thorup and Bonderup works are characterised by its honest and classic simplicity, where attention has been payed on the design\'s details and quality, which can be proved in the Semi Pendant from 1968.</p>', '', 1, '2019-08-15 18:21:43', '2019-08-15 18:21:43'),
(4, 0, 'carlo-image.png', 'CARLO DE CARLI', 'carlo-de-carli', 'CARLO DE CARLI', 'carlo-main-image.jpg', 'CARLO DE CARLI', '<p>Carlo De Carli (1910-1999) was not only an architect and designer, who made a profound impact on design in the 20th century, but also one of Italy’s leading and most respected professors, who left a fundamental mark of theoretical reflections and ethics of behaviour in an entire generation of architects.</p> \r\n<br><br>\r\n<p>Carlo De Carli graduated in architecture from the Politecnico di Milan in 1934 – a university in which he was strongly connected to throughout his career, being Dean of the Faculty of Architecture from 1965 to 1968 and teaching there until 1986. A respected academic and writer, his philosophy focused on the integration of space, material and the human body and gesture, and with this ideology he effectively engaged a dialog between design, universities and the craftsmanship world.</p> \r\n<br><br>\r\n<p>He worked with legendary architect and designer Gio Ponti, and his years with Ponti came to shape young Carlo De Carli’s language and approach to design. He later went on to set up a studio on his own, where his design quickly became widely recognized and manufactured by some of the most important and innovative Italian design companies.</p> \r\n<br><br>\r\n<p>A fine sense for modern material, design and industry and a willingness to experiment and invent, characterizes Carlo De Carli’s contribution to postwar architecture and design, and earned him a reputation as one of the greatest masters of Italian design.</p>', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

DROP TABLE IF EXISTS `inquiries`;
CREATE TABLE IF NOT EXISTS `inquiries` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `variation` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `inq` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `firstname`, `lastname`, `email`, `phone`, `products`, `variation`, `inq`, `qty`, `message`, `image`, `status`, `created_at`, `updated_at`) VALUES
(34, 'dfgdfg', 'Boskovic', 'info@greyapartments.is', '345345', 'Bat Dining Chair - Un-Upholstered, Conic base', 'Black Base', 'Pure White Shell Black', '1', '345345345', 'white.webp', 1, '2019-08-17 20:28:24', '2019-08-17 20:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `inspirations`
--

DROP TABLE IF EXISTS `inspirations`;
CREATE TABLE IF NOT EXISTS `inspirations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `gallery_status` bigint(20) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inspirations`
--

INSERT INTO `inspirations` (`id`, `image`, `alt`, `location`, `name`, `description`, `body`, `status`, `gallery_status`, `created_at`, `updated_at`) VALUES
(1, 'flora.png', 'flora', 'flora', 'FLORA DANICA', 'Project Maison du Danemark, Paris, France • Collection Beetle Chair, Beetle Bar Chair, TS Column Table • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '2019-08-17 20:40:06'),
(2, 'copen.png', 'Copenhague', 'copenhague', 'COPENHAGUE', 'Project Maison du Danemark, Paris, France • Collection Masculo Chair, Cobra Wall Lamp • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '2019-08-17 12:27:01'),
(3, 'standard-image.png', 'THE STANDARD', 'the-standard', 'THE STANDARD', 'Project The Standard, Copenhagen, Denmark • Collection Beetle Chair, Beetle Bar Chair, TS Table, Bestlite BL3 Floor Lamp, Cobra Wall Lamp • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'roch.png', 'LE ROCH', 'le-roch', 'LE ROCH', 'Project Le Roch Hotel & Spa, Paris, France • Collection Beetle Chair, GUBI Table 2.0, Beetle Lounge Chair, Modern Line Sofa • Interior Maison Sarah Lavione • Photographer Francis Amiand', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'amass.png', 'AMASS', 'amass', 'AMASS', 'Project Amass, Copenhagen, Denmark • Collection Masculo Chair, Aoyama Table, Bestlite BL9 XL, GUBI Table 1.0, Grand Piano Sofa, Cobra Wall Lamp, Cobra Floor Lamp • Interior GUBI', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'hotel.png', 'HOTEL MAURITZHOF', 'hotel-mauritzhof', 'HOTEL MAURITZHOF', 'Project Hotel Mauritzhof, Münster, Germany • Collection Beetle Chair, Beetle Lounge Chair, TS Table • Interior Lambs and Lions • Photographer Steve Herud', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'imp.png', 'IMPLEMENT', 'implement', 'IMPLEMENT', 'Project Implement Consulting Group, Copenhagen, Denmark • Collection Beetle Chair, Beetle Lounge Chair, TS Table • Interior GamFratesi', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'klub.png', 'KLUB', 'klub', 'KLUB', 'Project Klub, Copenhagen, Denmark • Collection Beetle Lounge Chair, Beetle Chair, Beetle Bar Chair, Masculo Chair, GUBI Bar Stool, Grand Piano Sofa, Bonaparte Lounge Chair, Adam Lounge Chair, GUBI Table 2.0, TS Table, Paper Table, Bestlite BL2 Table Lamp, Bestlite BL 9XL Pendant, Bestlite BL3 Floor Lamp, GOS3 Table • Interior GUBI', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'fam.png', 'SECOND FEMALE', 'second-famale', 'SECOND FEMALE', 'Project Second Female Showroom & Office, Copenhagen, Denmark • Collection Beetle Chair, Moon Table, GUBI Bar Stool, Y! Table, GOS3 Table, GOS4 Desk, Stay Lounge Chair, Modern Line Sofa, TS Table, Bestlite BL1 Table Lamp • Interior GUBI', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'v.png', 'HOTEL V', 'hotel-v', 'HOTEL V', 'Project Hotel V, Amsterdam, Netherlands • Collection Beetle Chair • Interior Pilou', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'parc.png', 'PARC BROEKHUIZEN', 'parc-broekhuizen', 'PARC BROEKHUIZEN', 'Project Parc Broekhuizen, Leersum, Netherlands • Collection Beetle Chair, Beetle Lounge Chair, Coco Chair, GUBI Table 2.0, TS Table, Grand Piano Sofa, Stay Sofa • Interior judithvanmourik • Photographer Marc van Praag & Mitchell van Voorbergen', '', 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `inspirations_images`
--

DROP TABLE IF EXISTS `inspirations_images`;
CREATE TABLE IF NOT EXISTS `inspirations_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `inspirations_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `inspirations_id` (`inspirations_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inspirations_images`
--

INSERT INTO `inspirations_images` (`id`, `inspirations_id`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(1, 3, 'standard.png', 'Standard', '2019-08-17 12:49:28', '2019-08-17 12:49:28'),
(2, 3, 'standard2.png', 'Standard', '2019-08-17 12:49:28', '2019-08-17 12:49:28'),
(3, 3, 'standard1.png', 'standard', '2019-08-17 12:49:55', '2019-08-17 12:49:55'),
(10, 1, 'flora.jpg', 'Gubi-image', '2019-08-17 12:17:38', '2019-08-17 12:17:38'),
(11, 1, 'flora1.jpg', 'Gubi-image', '2019-08-17 12:17:38', '2019-08-17 12:17:38'),
(12, 1, 'flora2.jpg', 'Gubi-image', '2019-08-17 12:17:38', '2019-08-17 12:17:38'),
(13, 1, 'flora3.jpg', 'Gubi-image', '2019-08-17 12:17:38', '2019-08-17 12:17:38'),
(14, 1, 'flora4.jpg', 'Gubi-image', '2019-08-17 12:17:38', '2019-08-17 12:17:38'),
(15, 2, 'cop.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(16, 2, 'cop1.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(17, 2, 'cop2.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(18, 2, 'cop3.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(19, 2, 'cop4.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(20, 2, 'cop5.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, '2019_08_13_213445_create_sub_variations_table', 10),
(19, '2019_08_15_125957_create_inspirations_table', 11),
(20, '2019_08_15_130515_create_contacts_table', 12),
(21, '2019_08_15_132314_create_abouts_table', 13),
(22, '2019_08_15_134109_create_news_table', 14),
(23, '2019_08_15_181434_create_designers_table', 15),
(24, '2019_08_16_124852_create_inquiries_table', 16),
(25, '2019_08_17_124350_create_inspirations_images_table', 17);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `alt`, `headline`, `location`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, '3days.png', '3 DAYS OF DESIGN', '3 DAYS OF DESIGN', '3-days-of-design', 'Позната је чињеница да ће читалац бити спутан правим читљивим текстом на страници када гледа њен распоред. Поента коришћења Lorem Ipsum модела је мање-више из разлога што је распор\r\n', 1, '2019-08-15 13:43:26', '2019-08-15 13:43:26'),
(2, 'milan.png', 'MILAN DESIGN WEEK 2018', 'MILAN DESIGN WEEK 2018', 'milan-design-week-2018', 'We heartily thank you for the overwhelming attendance and positive responses during Milan Design Week! It was a pleasure to present our novelties and existing design icons in the 1200m2 universe of home, contract and hospitality sceneries, set within the historical backdrop of Palazzo Serbelloni.', 1, '2019-08-15 13:49:54', '2019-08-15 13:49:54');

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
  `designers_id` int(11) NOT NULL DEFAULT '0',
  `categories_id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `collections_id` int(11) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `designers_id`, `categories_id`, `sub_category_id`, `collections_id`, `image`, `alt`, `headline`, `price`, `price_status`, `currency`, `location`, `body`, `status`, `views`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 2, 0, 'floor.jpg', 'Canvas', '9602 Floor Lamp', '949.00', 0, '€', '9602-floor-lamp', '<p>The 9602 Floor Lamp, also known as &ldquo;Chinese Hat&rdquo; was designed by Paavo Tynell in 1935 for the Hotel Aulanko. Characterised by its elegant and airy lampshade and rattan-covered stem, the 9602 Floor Lamp shows the designer&rsquo;s limitless imagination and unparalleled ability to create designs of enduring beauty. Adding a playful, exuberant quality to the top, balanced by the more static form of the base, the 9602 Floor Lamp is perfectly suited for creating a gentle ambient light in the domestic living room.</p>', 1, 104, '2019-08-12 19:32:28', '2019-08-17 20:13:30'),
(2, 0, 1, 0, 0, 'adnet.jpg', 'Adnet Wall Mirror', 'Adnet Wall Mirror - Circular - Dia. 58 Alcantara', '854.00', 0, '€', 'adnet-wall-mirror-circular-dia.-58-alcantara', 'We proudly present the iconic Adnet Circulaire Mirror with a new and contemporary Alcantara frame to further extend this classic collection designed in 1946 by Jacques Adnet. The remarkable and extremely durable Alcantara fabric has a tactile feel and aesthetic qualities, that is pleasing to the eye.\r\n\r\nKnown for being an innovative thinker, Adnet was one of the first designers to integrate metal and glass in the structure and decoration of furniture. Accordingly, he designed the elegant, distinctive round mirror with equestrian inspired detailing - the Adnet Circulaire Mirror.\r\n\r\nThe timeless Adnet Circulaire Mirror adds a sculptural value and outstanding expression to any hallway, bathroom or living room.', 1, 139, '2019-08-13 18:05:48', '2019-08-17 19:17:48'),
(3, 0, 1, 5, 0, 'bat.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Crisp 04115', '869.00', 0, '€', 'bat-dining-chair,-conic-base-fully-upholstered-in-crisp-04115', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Antique Brass Conic base and upholstery in Crisp, Gabriel (04115).', 1, 45, '2019-08-13 18:52:24', '2019-08-16 20:57:10'),
(4, 0, 1, 5, 0, 'bat1.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Remix 123', '909.00', 0, '€', 'bat-dining-chair,-conic-base-fully-upholstered-in-remix-123', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Antique Brass Conic base and upholstery in Remix, Kvadrat (123).', 1, 30, '2019-08-13 19:17:33', '2019-08-17 20:28:36'),
(5, 0, 1, 5, 0, 'batt.webp', 'Bat Dining Chair', 'Bat Dining Chair - Un-Upholstered, Conic base', '309.00', 0, '€', 'bat-dining-chair-un-upholstered-conic-base', 'The Bat Dining Chair, designed by Danish-Italian design-duo GamFratesi, carries strong references to the interesting characteristics of bats, with its inviting, distinctive shell reminiscent of the shape of a bat’s wingspan.\r\n\r\nBalancing between the traditional and surprising, the Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism while also\r\ncarrying a strong embedded story and associations expressed in a minimalist idiom. The wide range of upholstery options and different bases makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.', 1, 337, '2019-08-14 18:24:34', '2019-08-17 20:28:25'),
(6, 0, 6, 0, 0, 'bed.jpg', 'Stay Bed', 'Stay Bed - Fully Upholstered, Low back', '3,886.00', 0, '€', 'stay-bed-fully-upholstered-low-back', 'Stay here, stay with me, stay relaxed, stay and read... with the Stay Bed you do not want to do anything else than stay in bed. With its soft shape and gentle lines, it is a statement furniture for the private home and hotels. The new Stay Bed, is perfectly suited for relaxed times, and unifies luxury with comfort to enjoy the ultimate homely feeling, even though you are in a hotel. The organic shape gives a contemporary look and is almost like a singular continuous pencil stroke wrapping a solid texture. Combine it with the Stay Lounge Chair to get the optimal relaxation.\r\n\r\nSlatted bed base and mattresses not included. Fits box, sprung and foam mattresses. If foam or sprung mattress is used, a slatted bed base is needed. Box mattresses can be used directly in the frame.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 57, '2019-08-15 06:01:45', '2019-08-17 17:04:39'),
(7, 0, 8, 0, 0, 'metgot.jpg', 'Matégot Flower Pot', 'Matégot Flower Pot', '99.00', 0, '€', 'mategot-flower-pot', 'Designed in 1953 during Mathieu Matégot’s heydays, the Matégot Flower Pot is a proof of his success in turning perforated metal sheet into a refined, elegant material in which design, art and engineering are perfectly combined. This distinctive fabric-like metal sheet, which Matégot named Rigitulle, is crinkled and results in an airy grace that contributes to its genuine sculpture. \r\n\r\nAvailable in three different sizes, the Matégot Flower Pot allows playing with its appearance - whether the beauty is seen in pairs of the same sizes, one flower pot on its own or a number of flower pots in different sizes to create a perfect asymmetry. The largest pot can with its multipurpose nature, advantageously, also be used as a wastepaper basket.\r\n\r\nAvailable in Venetian Gold in Ø15.5 cm and Ø21 cm, and Midnight Black in all sizes.', 1, 42, '2019-08-15 10:16:46', '2019-08-16 19:46:48'),
(8, 0, 8, 0, 0, 'bowl.jpg', 'Matégot Bowl', 'Mategot Bowl', '159.00', 0, '€', 'mategot-bowl', 'Ahead of his time and with a modern spirit, Mathieu Matégot designed his contemporary Matégot bowl in 1953. The characteristic appearance of the transparent metal adds a light expression to this unique and spacious fruit bowl. As for many of Matégot\'s designs, the Matégot Bowl is trademarked by the solid yet light material Rigitulle; a thin perforated metal sheet tantamount to metal lace, where the inspiration is drawn from the material itself to explore all sorts of expression possible to create. \r\n\r\nThis luxurious material permitted Matégot to revamp the regular fruit bowl into an artistic and decorative bowl that besides from storing fruit in an elegant way, also acts as a piece of great design adorning any room. The Matégot Bowl is an easy and beautiful way to add a pop of colour to any setting.', 1, 10, '2019-08-15 10:19:14', '2019-08-16 15:19:24'),
(9, 0, 1, 12, 0, 'coffe.jpg', 'Adnet Coffee Table', 'Adnet Coffee Table - Circular, Ø70', '1,386.00', 0, '€', 'adnet-coffee-table-circular-070', 'The Adnet Coffee Table was originally designed by French Modernist Jacques Adnet (1901 - 1981) in the 1950’s. Adnet was always ahead of contemporary trends and became famous for his avant-garde designs and unusual combination of leather, metal and glass. The iconic Adnet Coffee Table exemplifies everything the French architect and interior designer stands for and perfectly merges his Art Deco style with his strong commitment to functionalist principles.\r\n\r\nPlaced on three soft curved metal legs, elegantly meeting in the heart of the table, the round glass top is edged with a hand-made leather rim and adorned with three gilded brass rings. The timeless design of the Adnet Coffee Table embodies modern materials and superb craftsmanship and adds a distinctive value to any home or professional space.', 1, 37, '2019-08-15 18:01:43', '2019-08-17 16:05:00'),
(10, 0, 1, 5, 0, 'wood.jpg', 'Bat Dining Chair, Wood Base', 'Bat Dining Chair, Wood Base - Front Upholstered in Crisp 04115', '559.00', 0, '€', 'bat-dining-chair,-wood-base-front-upholstered-in-crisp-04115', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan.\r\n\r\nThe wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.\r\n\r\nDue to its unique design, the textile of the front upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Black Stained Beech wood base, New Beige Shell and upholstery in Crisp, Gabriel (04115).', 1, 46, '2019-08-16 10:37:24', '2019-08-17 22:04:54'),
(11, 4, 3, 6, 0, 'carlo.png', 'CDC.1 Lounge Chair', 'CDC.1 Lounge Chair', '2,186.00', 0, '€', 'cdc.1-lounge-chair', 'CDC.1 Lounge Chair was designed by Carlo De Carli in 1954 and features the elegantly minimalist design style, typical of the era.\r\n\r\nThe CDC.1 Lounge Chair meets the ground in a graceful and slender way; its arms swooping like wings, giving the furniture a sense of poetic depth, whilst carrying a strong character. With its sleek silhouette and dynamic, angular lines the lounge chair marries streamlined functionalism with playful whimsy and is well-suited for conversation and relaxation in the modern residential environment.', 1, 5, '2019-08-16 20:50:39', '2019-08-17 12:30:21'),
(12, 3, 2, 4, 0, 'mat.webp', 'Semi Pendant', 'Semi Pendant - Dia.30', '349.00', 0, '€', 'semi-pendant-dia-30', 'The Semi Pendant is a unique pendant lamp, based on two quarter-circles put together, back-to-back. It\'s distinctive arch-shaped, enamelled metal shade creates a diffused, cone-shaped light, ideal over a dining table or kitchen work surface. With its lightness of form, unique timeless design and range of colours and sizes, the Semi Pendant is extremely versatile and well suited to both private and public spaces.\r\n\r\nThe Semi Pendant was designed in 1968 as a product of the creative partnership between Claus Bonderup and Torsten Thorup. Reacting against the soft organic forms, the so-called cosy era, that was dominating Denmark at the time, Bonderup and Thorup wanted to create a lamp that incorporated sharp, clean lines and a geometric shape. Their design was submitted for a competition at the Royal Danish Academy of Fine Arts, School of Architecture and won first prize. In the 1980’s the pendant achieved great success and became, at that time, the best-selling Danish design and gained worldwide recognition and iconic status.', 1, 41, '2019-08-17 16:10:21', '2019-08-17 22:20:06'),
(13, 3, 2, 4, 0, 'bond.jpg', 'Semi Pendant - Dia.47', 'Semi Pendant - Dia.47', '579.00', 0, '€', 'semi-pendant-dia-47', 'The Semi Pendant is a unique pendant lamp, based on two quarter-circles put together, back-to-back. It\'s distinctive arch-shaped, enamelled metal shade creates a diffused, cone-shaped light, ideal over a dining table or kitchen work surface. With its lightness of form, unique timeless design and range of colours and sizes, the Semi Pendant is extremely versatile and well suited to both private and public spaces.\r\n\r\nThe Semi Pendant was designed in 1968 as a product of the creative partnership between Claus Bonderup and Torsten Thorup. Reacting against the soft organic forms, the so-called cosy era, that was dominating Denmark at the time, Bonderup and Thorup wanted to create a lamp that incorporated sharp, clean lines and a geometric shape. Their design was submitted for a competition at the Royal Danish Academy of Fine Arts, School of Architecture and won first prize. In the 1980’s the pendant achieved great success and became, at that time, the best-selling Danish design and gained worldwide recognition and iconic status.', 1, 21, '2019-08-17 16:40:58', '2019-08-17 22:19:36');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
CREATE TABLE IF NOT EXISTS `products_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, 5, 'white.webp', 'img', '2019-08-14 19:07:20', '2019-08-14 19:07:20'),
(11, 7, 'metgot.jpg', 'Midnight Black', '2019-08-15 10:16:46', '2019-08-15 10:16:46'),
(12, 7, 'metgot-gold.jpg', 'Venetian Gold', '2019-08-15 10:16:46', '2019-08-15 10:16:46'),
(13, 8, 'bowl.jpg', 'Midnight Black', '2019-08-15 10:19:14', '2019-08-15 10:19:14'),
(14, 8, 'bowl-gold.jpg', 'Venetian Gold', '2019-08-15 10:19:14', '2019-08-15 10:19:14'),
(15, 6, 'bed.jpg', 'Stay Bed Gubi', '2019-08-15 12:00:48', '2019-08-15 12:00:48'),
(16, 6, 'bed.webp', 'Gubi image', '2019-08-15 12:00:48', '2019-08-15 12:00:48'),
(17, 6, 'bed1.jpg', 'Gubi image', '2019-08-15 12:00:48', '2019-08-15 12:00:48'),
(18, 6, 'bedss.webp', 'Gubi image', '2019-08-15 12:00:48', '2019-08-15 12:00:48'),
(19, 9, 'coffe.jpg', 'Black Leather', '2019-08-15 18:01:43', '2019-08-15 18:01:43'),
(20, 9, 'coffe1.jpg', 'Tan Leather', '2019-08-15 18:01:43', '2019-08-15 18:01:43'),
(21, 10, 'wood.jpg', 'img', '2019-08-16 10:39:27', '2019-08-16 10:39:27'),
(22, 10, 'wood1.jpg', 'Gubi-image', '2019-08-16 10:39:27', '2019-08-16 10:39:27'),
(23, 11, 'carlo.png', 'CDC.1 Lounge Chair', '2019-08-16 20:50:39', '2019-08-16 20:50:39'),
(24, 12, 'semi.webp', 'Gubi image', '2019-08-17 16:10:21', '2019-08-17 16:10:21'),
(25, 12, 'chrome-shade.webp', 'Gubi-image', '2019-08-17 16:18:57', '2019-08-17 16:18:57'),
(26, 12, 'chooper.webp', 'Gubi-image', '2019-08-17 16:20:27', '2019-08-17 16:20:27'),
(27, 12, 'mat.webp', 'Gubi-image', '2019-08-17 16:39:11', '2019-08-17 16:39:11'),
(28, 12, 'mat-w.webp', 'Gubi-image', '2019-08-17 16:39:11', '2019-08-17 16:39:11'),
(29, 13, 'bond.jpg', 'Gubi image', '2019-08-17 16:40:58', '2019-08-17 16:40:58'),
(30, 13, 'bond1.jpg', 'Gubi-image', '2019-08-17 16:43:01', '2019-08-17 16:43:01');

-- --------------------------------------------------------

--
-- Table structure for table `products_variations`
--

DROP TABLE IF EXISTS `products_variations`;
CREATE TABLE IF NOT EXISTS `products_variations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `variations_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`),
  KEY `variations_id` (`variations_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_variations`
--

INSERT INTO `products_variations` (`id`, `products_id`, `variations_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2019-08-13 21:33:22', '2019-08-13 21:33:22'),
(4, 1, 3, '2019-08-14 16:49:26', '2019-08-14 16:49:26'),
(5, 5, 1, '2019-08-14 18:25:04', '2019-08-14 18:25:04'),
(6, 5, 4, '2019-08-14 18:25:12', '2019-08-14 18:25:12'),
(7, 6, 7, '2019-08-15 06:04:15', '2019-08-15 06:04:15'),
(8, 8, 2, '2019-08-15 10:19:34', '2019-08-15 10:19:34'),
(9, 7, 7, '2019-08-15 10:20:45', '2019-08-15 10:20:45'),
(10, 7, 2, '2019-08-15 10:20:53', '2019-08-15 10:20:53'),
(11, 9, 2, '2019-08-15 18:02:25', '2019-08-15 18:02:25'),
(12, 12, 3, '2019-08-17 16:11:32', '2019-08-17 16:11:32'),
(13, 13, 3, '2019-08-17 16:42:00', '2019-08-17 16:42:00');

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
  `categories_id` bigint(20) NOT NULL,
  `designer_id` bigint(20) NOT NULL DEFAULT '0',
  `collection_id` bigint(20) NOT NULL DEFAULT '0',
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_id` (`categories_id`),
  KEY `designer_id` (`designer_id`),
  KEY `collection_id` (`collection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, 3, 0, 0, 'Meeting Chairs', 'meeting-chairs', 1, NULL, '2019-08-16 08:02:43'),
(11, 4, 0, 0, 'Lounge Tables', 'lounge-tables', 1, NULL, NULL),
(12, 4, 0, 0, 'Coffee Tables', 'coffee-tables', 1, NULL, NULL),
(13, 4, 0, 0, 'Dining Tables', 'dining-tables', 1, NULL, NULL),
(14, 4, 0, 0, 'Bar Tables', 'bar-tables', 1, NULL, NULL),
(15, 4, 0, 0, 'Consoles', 'consoles', 1, NULL, NULL),
(16, 5, 0, 0, 'Desks', 'desks', 1, NULL, NULL),
(17, 5, 0, 0, 'Storage', 'storage', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_variations`
--

DROP TABLE IF EXISTS `sub_variations`;
CREATE TABLE IF NOT EXISTS `sub_variations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `products_id` bigint(20) UNSIGNED NOT NULL,
  `variations_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id` (`products_id`),
  KEY `variations_id` (`variations_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_variations`
--

INSERT INTO `sub_variations` (`id`, `products_id`, `variations_id`, `name`, `variation_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Dusty Cedar', '', 'adnet.jpg', '2019-08-13 21:43:38', '2019-08-13 21:43:38'),
(3, 1, 3, 'Canvas', '', 'floor.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
(4, 1, 3, 'Wicker Willow', '', 'floor1.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
(5, 5, 1, 'Black Base', '', 'batt.webp', '2019-08-14 18:25:46', '2019-08-14 18:25:46'),
(6, 5, 4, 'Black Shell', '', 'batt.webp', '2019-08-14 18:26:18', '2019-08-14 18:26:18'),
(7, 5, 4, 'Pure White Shell Black', '', 'white.webp', '2019-08-14 18:52:10', '2019-08-14 18:52:10'),
(8, 5, 1, 'Brass Base', '', 'brass.jpg', '2019-08-14 19:05:59', '2019-08-14 19:05:59'),
(9, 5, 4, 'Pure White Shell Brass', '', 'bras-wh.jpg', '2019-08-14 19:32:42', '2019-08-14 19:32:42'),
(10, 6, 7, '140x200', '140x200', '', '2019-08-15 06:04:45', '2019-08-15 06:04:45'),
(11, 6, 7, '160x200', '160x200', '', '2019-08-15 06:23:16', '2019-08-15 06:23:16'),
(12, 6, 7, '180x200', '180x200', '', '2019-08-15 06:23:45', '2019-08-15 06:23:45'),
(13, 6, 7, '200x200', '200x200', '', '2019-08-15 06:23:56', '2019-08-15 06:23:56'),
(14, 2, 2, 'Safari Send', '', 'adnet1.jpg', '2019-08-15 06:26:06', '2019-08-15 06:26:06'),
(15, 2, 2, 'Wild Dove', '', 'adnet2.jpg', '2019-08-15 10:01:52', '2019-08-15 10:01:52'),
(16, 8, 2, 'Midnight Black', '', 'bowl.jpg', '2019-08-15 10:19:51', '2019-08-15 10:19:51'),
(17, 8, 2, 'Venetian Gold', '', 'bowl-gold.jpg', '2019-08-15 10:19:51', '2019-08-15 10:19:51'),
(18, 7, 7, 'Ø15.5 cm', 'Ø15.5 cm', '', '2019-08-15 10:29:37', '2019-08-15 10:29:37'),
(19, 7, 7, 'Ø21 cm', 'Ø21 cm', '', '2019-08-15 10:29:52', '2019-08-15 10:29:52'),
(20, 7, 7, 'Ø27.5 cm', 'Ø27.5 cm', '', '2019-08-15 10:30:04', '2019-08-15 10:30:04'),
(21, 7, 2, 'Midnight Black', '', 'metgot.jpg', '2019-08-15 10:31:05', '2019-08-15 10:31:05'),
(22, 7, 2, 'Venetian Gold', '', 'metgot-gold.jpg', '2019-08-15 10:31:05', '2019-08-15 10:31:05'),
(23, 9, 2, 'Black Leather', '', 'coffe.jpg', '2019-08-15 18:02:58', '2019-08-15 18:02:58'),
(24, 9, 2, 'Tan Leather', '', 'coffe1.jpg', '2019-08-15 18:02:58', '2019-08-15 18:02:58'),
(25, 12, 3, 'Brass Shade', '', 'semi.webp', '2019-08-17 16:11:54', '2019-08-17 16:11:54'),
(26, 12, 3, 'Chrome Shade', '', 'chrome-shade.webp', '2019-08-17 16:15:06', '2019-08-17 16:15:06'),
(27, 12, 3, 'Copper Shade', '', 'chooper.webp', '2019-08-17 16:19:45', '2019-08-17 16:19:45'),
(28, 12, 3, 'Matt Black Shade', '', 'mat.webp', '2019-08-17 16:23:02', '2019-08-17 16:23:02'),
(29, 12, 3, 'MatWhite Shade', '', 'mat-w.webp', '2019-08-17 16:39:39', '2019-08-17 16:39:39'),
(30, 13, 3, 'Brass Shade', '', 'bond.jpg', '2019-08-17 16:42:33', '2019-08-17 16:42:33'),
(31, 13, 3, 'Chrome Shade', '', 'bond1.jpg', '2019-08-17 16:42:33', '2019-08-17 16:42:33');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories_products`
--
ALTER TABLE `categories_products`
  ADD CONSTRAINT `categories_products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products_variations`
--
ALTER TABLE `products_variations`
  ADD CONSTRAINT `products_variations_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_variations_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_variations`
--
ALTER TABLE `sub_variations`
  ADD CONSTRAINT `sub_variations_ibfk_1` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_variations_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sub_variations_ibfk_3` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
