-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 15, 2019 at 02:33 PM
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 1, 5, '2019-08-14 18:24:34', '2019-08-14 18:24:34'),
(10, 6, 6, '2019-08-15 06:01:45', '2019-08-15 06:01:45'),
(11, 8, 7, '2019-08-15 10:16:46', '2019-08-15 10:16:46'),
(12, 8, 8, '2019-08-15 10:19:14', '2019-08-15 10:19:14');

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
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inspirations`
--

DROP TABLE IF EXISTS `inspirations`;
CREATE TABLE IF NOT EXISTS `inspirations` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(22, '2019_08_15_134109_create_news_table', 14);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `designers_id`, `categories_id`, `sub_category_id`, `collections_id`, `image`, `alt`, `headline`, `price`, `price_status`, `currency`, `location`, `body`, `status`, `views`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 2, 0, 'floor.jpg', 'Canvas', '9602 Floor Lamp', '949.00', 0, '€', '9602-floor-lamp', '<p>The 9602 Floor Lamp, also known as &ldquo;Chinese Hat&rdquo; was designed by Paavo Tynell in 1935 for the Hotel Aulanko. Characterised by its elegant and airy lampshade and rattan-covered stem, the 9602 Floor Lamp shows the designer&rsquo;s limitless imagination and unparalleled ability to create designs of enduring beauty. Adding a playful, exuberant quality to the top, balanced by the more static form of the base, the 9602 Floor Lamp is perfectly suited for creating a gentle ambient light in the domestic living room.</p>', 1, 80, '2019-08-12 19:32:28', '2019-08-15 12:23:49'),
(2, 0, 1, 0, 0, 'adnet.jpg', 'Adnet Wall Mirror', 'Adnet Wall Mirror - Circular - Dia. 58 Alcantara', '854.00', 0, '€', 'adnet-wall-mirror-circular-dia.-58-alcantara', 'We proudly present the iconic Adnet Circulaire Mirror with a new and contemporary Alcantara frame to further extend this classic collection designed in 1946 by Jacques Adnet. The remarkable and extremely durable Alcantara fabric has a tactile feel and aesthetic qualities, that is pleasing to the eye.\r\n\r\nKnown for being an innovative thinker, Adnet was one of the first designers to integrate metal and glass in the structure and decoration of furniture. Accordingly, he designed the elegant, distinctive round mirror with equestrian inspired detailing - the Adnet Circulaire Mirror.\r\n\r\nThe timeless Adnet Circulaire Mirror adds a sculptural value and outstanding expression to any hallway, bathroom or living room.', 1, 121, '2019-08-13 18:05:48', '2019-08-15 12:24:41'),
(3, 0, 1, 5, 0, 'bat.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Crisp 04115', '869.00', 0, '€', 'bat-dining-chair,-conic-base---fully-upholstered-in-crisp-04115', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Antique Brass Conic base and upholstery in Crisp, Gabriel (04115).', 1, 37, '2019-08-13 18:52:24', '2019-08-15 12:23:36'),
(4, 0, 1, 5, 0, 'bat1.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Remix 123', '909.00', 0, '€', 'bat-dining-chair,-conic-base-fully-upholstered-in-remix-123', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Antique Brass Conic base and upholstery in Remix, Kvadrat (123).', 1, 15, '2019-08-13 19:17:33', '2019-08-15 12:23:39'),
(5, 0, 3, 5, 0, 'batt.webp', 'Bat Dining Chair', 'Bat Dining Chair - Un-Upholstered, Conic base', '309.00', 0, '€', 'bat-dining-chair---un-upholstered,-conic-base', 'The Bat Dining Chair, designed by Danish-Italian design-duo GamFratesi, carries strong references to the interesting characteristics of bats, with its inviting, distinctive shell reminiscent of the shape of a bat’s wingspan.\r\n\r\nBalancing between the traditional and surprising, the Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism while also\r\ncarrying a strong embedded story and associations expressed in a minimalist idiom. The wide range of upholstery options and different bases makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.', 1, 221, '2019-08-14 18:24:34', '2019-08-15 12:32:15'),
(6, 0, 6, 0, 0, 'bed.jpg', 'Stay Bed', 'Stay Bed - Fully Upholstered, Low back', '3,886.00', 0, '€', 'stay-bed---fully-upholstered,-low-back', 'Stay here, stay with me, stay relaxed, stay and read... with the Stay Bed you do not want to do anything else than stay in bed. With its soft shape and gentle lines, it is a statement furniture for the private home and hotels. The new Stay Bed, is perfectly suited for relaxed times, and unifies luxury with comfort to enjoy the ultimate homely feeling, even though you are in a hotel. The organic shape gives a contemporary look and is almost like a singular continuous pencil stroke wrapping a solid texture. Combine it with the Stay Lounge Chair to get the optimal relaxation.\r\n\r\nSlatted bed base and mattresses not included. Fits box, sprung and foam mattresses. If foam or sprung mattress is used, a slatted bed base is needed. Box mattresses can be used directly in the frame.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 47, '2019-08-15 06:01:45', '2019-08-15 12:00:53'),
(7, 0, 8, 0, 0, 'metgot.jpg', 'Matégot Flower Pot', 'Matégot Flower Pot', '99.00', 0, '€', 'mategot-flower-pot', 'Designed in 1953 during Mathieu Matégot’s heydays, the Matégot Flower Pot is a proof of his success in turning perforated metal sheet into a refined, elegant material in which design, art and engineering are perfectly combined. This distinctive fabric-like metal sheet, which Matégot named Rigitulle, is crinkled and results in an airy grace that contributes to its genuine sculpture. \r\n\r\nAvailable in three different sizes, the Matégot Flower Pot allows playing with its appearance - whether the beauty is seen in pairs of the same sizes, one flower pot on its own or a number of flower pots in different sizes to create a perfect asymmetry. The largest pot can with its multipurpose nature, advantageously, also be used as a wastepaper basket.\r\n\r\nAvailable in Venetian Gold in Ø15.5 cm and Ø21 cm, and Midnight Black in all sizes.', 1, 13, '2019-08-15 10:16:46', '2019-08-15 12:01:52'),
(8, 0, 8, 0, 0, 'bowl.jpg', 'Matégot Bowl', 'Mategot Bowl', '159.00', 0, '€', 'mategot-bowl', 'Ahead of his time and with a modern spirit, Mathieu Matégot designed his contemporary Matégot bowl in 1953. The characteristic appearance of the transparent metal adds a light expression to this unique and spacious fruit bowl. As for many of Matégot\'s designs, the Matégot Bowl is trademarked by the solid yet light material Rigitulle; a thin perforated metal sheet tantamount to metal lace, where the inspiration is drawn from the material itself to explore all sorts of expression possible to create. \r\n\r\nThis luxurious material permitted Matégot to revamp the regular fruit bowl into an artistic and decorative bowl that besides from storing fruit in an elegant way, also acts as a piece of great design adorning any room. The Matégot Bowl is an easy and beautiful way to add a pop of colour to any setting.', 1, 4, '2019-08-15 10:19:14', '2019-08-15 12:24:22');

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(18, 6, 'bedss.webp', 'Gubi image', '2019-08-15 12:00:48', '2019-08-15 12:00:48');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_variations`
--

INSERT INTO `products_variations` (`id`, `products_id`, `variations_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2019-08-13 21:33:22', '2019-08-13 21:33:22'),
(5, 5, 1, '2019-08-14 18:25:04', '2019-08-14 18:25:04'),
(4, 1, 3, '2019-08-14 16:49:26', '2019-08-14 16:49:26'),
(6, 5, 4, '2019-08-14 18:25:12', '2019-08-14 18:25:12'),
(7, 6, 7, '2019-08-15 06:04:15', '2019-08-15 06:04:15'),
(8, 8, 2, '2019-08-15 10:19:34', '2019-08-15 10:19:34'),
(9, 7, 7, '2019-08-15 10:20:45', '2019-08-15 10:20:45'),
(10, 7, 2, '2019-08-15 10:20:53', '2019-08-15 10:20:53');

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(10, 3, 0, 0, 'Meeting Chairs', 'meeting-chairs', 1, NULL, NULL),
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
  `products_id` int(10) UNSIGNED NOT NULL,
  `variations_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variation_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(9, 5, 4, 'Pure White Shell', '', 'bras-wh.jpg', '2019-08-14 19:32:42', '2019-08-14 19:32:42'),
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
(22, 7, 2, 'Venetian Gold', '', 'metgot-gold.jpg', '2019-08-15 10:31:05', '2019-08-15 10:31:05');

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
