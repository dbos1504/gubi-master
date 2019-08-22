-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 22, 2019 at 11:57 AM
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(7, 7, 'Mirrors', 'mirrors', 1, NULL, '2019-08-17 15:56:25'),
(8, 8, 'Objects', 'objects', 1, '2019-08-18 20:14:52', '2019-08-19 05:44:05');

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
  UNIQUE KEY `products_id` (`products_id`,`categories_id`),
  KEY `categories_products_categories_id_foreign` (`categories_id`),
  KEY `categories_products_product_id_foreign` (`products_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories_products`
--

INSERT INTO `categories_products` (`id`, `categories_id`, `products_id`, `created_at`, `updated_at`) VALUES
(6, 3, 4, '2019-08-13 19:17:33', '2019-08-13 19:17:33'),
(8, 3, 5, '2019-08-14 18:24:34', '2019-08-14 18:24:34'),
(10, 6, 6, '2019-08-15 06:01:45', '2019-08-15 06:01:45'),
(14, 4, 9, '2019-08-15 18:01:43', '2019-08-15 18:01:43'),
(16, 3, 10, '2019-08-16 10:37:24', '2019-08-16 10:37:24'),
(17, 3, 11, '2019-08-16 20:50:39', '2019-08-16 20:50:39'),
(25, 1, 1, NULL, NULL),
(26, 1, 2, NULL, NULL),
(28, 1, 4, NULL, NULL),
(29, 1, 5, NULL, NULL),
(30, 1, 9, NULL, NULL),
(31, 1, 10, NULL, NULL),
(36, 7, 2, NULL, NULL),
(37, 2, 12, '2019-08-17 16:10:21', '2019-08-17 16:10:21'),
(38, 2, 13, '2019-08-17 16:40:58', '2019-08-17 16:40:58'),
(39, 8, 7, '2019-08-18 20:15:31', '2019-08-18 20:15:31'),
(40, 8, 8, '2019-08-18 20:16:11', '2019-08-18 20:16:11'),
(41, 5, 14, '2019-08-19 11:15:16', '2019-08-19 11:15:16'),
(42, 2, 15, '2019-08-20 08:27:16', '2019-08-20 08:27:16'),
(43, 1, 16, '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(44, 3, 16, '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(45, 1, 17, '2019-08-20 11:54:11', '2019-08-20 11:54:11'),
(46, 2, 17, '2019-08-20 11:54:11', '2019-08-20 11:54:11'),
(47, 3, 18, '2019-08-21 08:39:59', '2019-08-21 08:39:59'),
(48, 3, 19, '2019-08-21 09:18:46', '2019-08-21 09:18:46'),
(49, 3, 20, '2019-08-21 10:02:47', '2019-08-21 10:02:47'),
(52, 1, 22, '2019-08-22 05:38:31', '2019-08-22 05:38:31'),
(53, 3, 22, '2019-08-22 05:38:31', '2019-08-22 05:38:31'),
(54, 1, 23, '2019-08-22 05:43:30', '2019-08-22 05:43:30'),
(55, 2, 23, '2019-08-22 05:43:30', '2019-08-22 05:43:30'),
(56, 1, 24, '2019-08-22 05:48:28', '2019-08-22 05:48:28'),
(57, 3, 24, '2019-08-22 05:48:28', '2019-08-22 05:48:28');

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
CREATE TABLE IF NOT EXISTS `collections` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `designers_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `collection_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `inspiration_desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'No',
  `where_to_buy` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `gallery_status` int(11) NOT NULL,
  `slider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `designers_id`, `image`, `alt`, `headline`, `collection_desc`, `inspiration_desc`, `location`, `where_to_buy`, `body`, `status`, `gallery_status`, `slider_name`, `created_at`, `updated_at`) VALUES
(1, 5, 'bat-collection.png', 'THE BAT COLLECTION', 'THE BAT COLLECTION', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.', 'Get inspired by interior architects, professionals, renown restaurants & hotels or private homes.', 'bat-collection', '/subcategories/bat-collection', '<div class=\'w-9/12 mx-auto\'>\r\n<img src=\'/img/collections/bat.png\' alt=\'Bat collection\'>\r\n<p class=\'text-center my-10\'>\r\nThe Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.\r\n</p>\r\n</div>\r\n<hr>\r\n<div class=\'w-9/12 mx-auto\'>\r\n<h3 class=\"text-3xl text-center uppercase mb-3 font-serif p-4 text-black\">CREATE & COMBINE</h3>\r\n<p class=\'text-center mt-2 mb-10\'>\r\nThe Bat Chair can fulfil your dreams of a personalised chair, specifically made for your needs and interior style. In few steps, you are able to design a bespoke chair manufactured by GUBI just for you.\r\n</p>\r\n<img src=\'/img/collections/bat1.png\' alt=\'Bat collection\'>\r\n<h3 class=\"text-3xl text-center uppercase mb-3 font-serif mt-3 p-4 text-black\">BAT - FOR LIFE™</h3>\r\n<p class=\'text-center mt-1 mb-10\'>\r\nGUBI introduces the modular concept, BAT - For Life, which is similar to the successful BEETLE - For Life™ concept. The Bat Chair is a chair with a longer lifetime, as it can be adapted to needs and styles through its life. The modular structure makes it easy to change or replace textile upholstery. \r\n<br><br>\r\nA timeless armchair – The Bat Chair surprises by its matte texture and soft touch, its light expression combined with outstanding sitting comfort and durable material.\r\n</p>\r\n</div>', 1, 1, 'BAT DINING CHAIR COLLECTION', '2019-08-20 08:57:28', '2019-08-21 11:34:59'),
(2, 5, 'beetle-collection.png', 'THE BEETLE COLLECTION', 'THE BEETLE COLLECTION', 'The inspiration of the Beetle Collection was found in the insect world as GamFratesi has been looking closely at the anatomy, aesthetics and movement of a beetle. Selecting a beetle as source of inspiration is based on the design duo\'s fascination of how the external shell supports and protects the creature\'s body, and its gentle and charming look. The design of the collection reinterprets the characteristic elements of the beetles’ sections: shape, shells, sutures, rigid outside and soft inside.', 'Get inspired by interior architects, professionals, renown restaurants & hotels, private homes featuring the Beetle Collection. The appealing design, outstanding comfort and unique customization possibilities of the Beetle are largely appreciated around the world.', 'beetle-collection', '/subcategories/beetle-collection', '<div class=\'w-9/12 mx-auto\'>\r\n<img src=\'/img/collections/beetle.png\' alt=\'Bat collection\'>\r\n<p class=\'text-center my-10\'>\r\nThe inspiration of the Beetle Collection was found in the insect world as GamFratesi has been looking closely at the anatomy, aesthetics and movement of a beetle. Selecting a beetle as source of inspiration is based on the design duo\'s fascination of how the external shell supports and protects the creature\'s body, and its gentle and charming look. The design of the collection reinterprets the characteristic elements of the beetles’ sections: shape, shells, sutures, rigid outside and soft inside.\r\n</p>\r\n</div>\r\n<div class=\'lg:flex\'>\r\n<div class=\'mr-4 single-collection-image\'>\r\n<img src=\'/img/collections/beetle2.png\' alt=\'Bat collection\'>\r\n</div>\r\n<div class=\'mr-4 single-collection-image\'>\r\n<img src=\'/img/collections/beetle3.png\' alt=\'Bat collection\'>\r\n</div>\r\n<div class=\'mr-4 single-collection-image\'>\r\n<img src=\'/img/collections/beetle4.png\' alt=\'Bat collection\'>\r\n</div>\r\n</div>\r\n<div class=\'w-9/12 mx-auto\'>\r\n<p class=\'text-center my-10\'>\r\nThe result is a collection that cunningly interprets the shell of this four-legged creature. The comfortable yet dynamic design makes this collection suitable for multiple environments whether it is in the home or the workplace. The Beetle Collection consists of Beetle Dining Chair, Beetle Stool, Beetle Lounge Chair, Beetle Footstool, Beetle Sofa as well as a Beetle Table.\r\n</p>\r\n</div>\r\n<hr>\r\n<div class=\'w-9/12 mx-auto\'>\r\n<h3 class=\"text-3xl text-center uppercase mb-3 font-serif p-4 text-black\">CREATE & COMBINE</h3>\r\n<p class=\'text-center mt-2 mb-10\'>\r\nThe Beetle Chair can fulfil your dreams of a personalised chair, specifically made for your needs and interior style. In few steps, you are able to design a bespoke chair manufactured by GUBI just for you.\r\n</p>\r\n<img src=\'/img/collections/beetle1.png\' alt=\'Bat collection\'>\r\n<h3 class=\"text-3xl text-center uppercase mb-3 font-serif mt-3 p-4 text-black\">BEETLE - FOR LIFE™</h3>\r\n<p class=\'text-center mt-1 mb-10\'>\r\nWith the wish of offering the Beetle Chair to people in different stages of their lives and prolonging the chair’s life span, GUBI is pleased to introduce the modular concept, Beetle – For Life. \r\n<br><br>\r\nThe unupholstered Beetle Chair in polypropylene plastic gives the chair a light expression with notable durability at an advantageous price level. The chair’s subtle matte texture offers a soft tactility where its outstanding sitting comfort is obtained.\r\n</p>\r\n</div>', 1, 0, 'BEETLE CHAIR COLLECTION', '2019-08-20 08:59:00', '2019-08-21 11:30:33');

-- --------------------------------------------------------

--
-- Table structure for table `collections_images`
--

DROP TABLE IF EXISTS `collections_images`;
CREATE TABLE IF NOT EXISTS `collections_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `collections_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_images`
--

INSERT INTO `collections_images` (`id`, `collections_id`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(1, 1, 'slider.png', 'Bat', NULL, NULL),
(2, 2, 'beetle.jpg', 'Beetle', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collections_options`
--

DROP TABLE IF EXISTS `collections_options`;
CREATE TABLE IF NOT EXISTS `collections_options` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `collections_id` bigint(20) NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_options`
--

INSERT INTO `collections_options` (`id`, `collections_id`, `headline`, `body`, `created_at`, `updated_at`) VALUES
(1, 1, 'SHELL COLOURS', 'The Bat shells are available in 7 colours, which can be combined with unlimited fabric and leather options. Shell colours: Black, Dark Green, Dark Pink, New Beige, Smoke Blue, Sweet Pink and Pure White.', NULL, NULL),
(2, 1, 'UPHOLSTERY', 'Select between 4 options: un-upholstered with or without cushion, front upholstered or fully upholstered seating shell.', NULL, NULL),
(3, 1, 'BASE OPTIONS', 'As a dinning chair, select between conical metal or wood base. As a meeting chair, select between 4 additional bases: 4-Star Base, 4-Star with Castors, 4 Legs with Castors, Swivel Base. The wood options are: American Walnut, Black Stained Beech, Oak and Smoked Oak. The Metal finishes include Antique Brass, Black, Black Chrome, Brass, Chrome, Soft White and Polished Aluminium.', NULL, NULL),
(4, 2, 'SHELL COLOURS', 'The seven harmonious colours of the unupholstered seating shell may also be combined with seat or front upholstery to add an additional comfort and exude a personal adornment. Due to its unique design, it is possible to add partial or fully upholstery over time as well as change and upgrade legs and upholstery. Give the chair a different expression and new life to the interior decoration – you are able to create a Beetle for life. Choose between the colours black, dark pink, smoke blue, dark green, new beige, sweet pink and white.', NULL, NULL),
(5, 2, 'UPHOLSTERY', 'Select between an unupholstered, seat upholstered, front upholstered or fully upholstered seating shell in various colours and unlimited fabric and leather options.', NULL, NULL),
(6, 2, 'BASE OPTIONS', 'Select between conical and wood base in different colour and material choices.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `collections_options_images`
--

DROP TABLE IF EXISTS `collections_options_images`;
CREATE TABLE IF NOT EXISTS `collections_options_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `collections_options_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `headline` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections_options_images`
--

INSERT INTO `collections_options_images` (`id`, `collections_options_id`, `image`, `headline`, `created_at`, `updated_at`) VALUES
(1, 4, 'white.png', 'Soft White', NULL, NULL),
(2, 4, 'black.jpg', 'Black', NULL, NULL),
(3, 4, 'blue.jpg', 'Smoke Blue', NULL, NULL),
(4, 4, 'beige.jpg', 'New Beige', NULL, NULL),
(5, 4, 'pink.jpg', 'Dark Pink', NULL, NULL),
(6, 4, 'pink1.jpg', 'Sweet Pink', NULL, NULL),
(7, 4, 'green.jpg', 'Dark Green', NULL, NULL),
(8, 5, 'svetla.jpg', 'Front Upholstered', NULL, NULL),
(9, 5, 'brovn.jpg', 'Fully Upholstered', NULL, NULL),
(10, 5, 'black1.jpg', 'Un-Upholstered', NULL, NULL),
(11, 6, 'white1.jpg', 'Wood - Smoked Oak', NULL, NULL),
(12, 6, 'br.jpg', 'Wood - Oak', NULL, NULL),
(13, 6, 'coni.jpg', 'Conic - Chrome', NULL, NULL),
(14, 6, 'bla.jpg', 'Wood - Black Stained Beech', NULL, NULL),
(15, 6, 'brass.jpg', 'Conic - Brass\r\n', NULL, NULL),
(16, 6, 'coni1.jpg', 'Conic - Black\r\n', NULL, NULL),
(17, 6, 'brasss.jpg', 'Conic - Black Chrome', NULL, NULL),
(18, 1, 'b.jpg', 'Black', NULL, NULL),
(19, 1, 'b1.jpg', 'Smoke Blue', NULL, NULL),
(20, 1, 'g.jpg', 'Dark Green', NULL, NULL),
(21, 1, 'p.jpg', 'Dark Pink', NULL, NULL),
(22, 1, 'be.jpg', 'New Beige', NULL, NULL),
(23, 1, 'w2.jpg', 'Pure White', NULL, NULL),
(24, 1, 'pi.jpg', 'Sweet Pink', NULL, NULL),
(25, 3, 'a.jpg', 'Conic Antique Brass', NULL, NULL),
(26, 2, 'ro.jpg', 'Front Upholstered', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `email`, `subject`, `message`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Marko', 'Boskovic', 'test@gmail.com', 'Test', 'ttttttttttttt', 1, '2019-08-19 11:36:57', '2019-08-19 11:52:48'),
(6, 'Marko', 'Boskovic', 'admin@example.com', 'qqqqqqqqq', 'qqqqqqqqqqqqqqq', 1, '2019-08-19 11:54:12', '2019-08-20 07:12:23');

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
  `video` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `designers`
--

INSERT INTO `designers` (`id`, `collections_id`, `image`, `alt`, `location`, `name`, `main_image`, `main_image_alt`, `body`, `video`, `status`, `created_at`, `updated_at`) VALUES
(3, 0, 'bond-image.png', 'BONDERUP & THORUP', 'bonderup-thorup', 'BONDERUP & THORUP', 'bond.jpeg', 'BONDERUP & THORUP', '<p>Torsten Thorup (born 1944) and Claus Bonderup (born 1943) are both graduates from the Royal Danish Academy of Fine Arts, School of Architecture in 1969, and subsequently went to work together at Danish architect, Henning Larsen\'s studio in Copenhagen. The two architects teamed up professionally and worked together for the majority of their careers. Together they have designed watches and in-store displays for Georg Jensen, the Arktikum museum in Finland and the harbour area in Elsinore, where they designed everything, from urban planning to the ticket offices. They have through their long career served many Danish and international clients.</p>\r\n<br><br>\r\n<p>Thorup and Bonderup works are characterised by its honest and classic simplicity, where attention has been payed on the design\'s details and quality, which can be proved in the Semi Pendant from 1968.</p>', '', 1, '2019-08-15 18:21:43', '2019-08-15 18:21:43'),
(4, 0, 'carlo-image.png', 'CARLO DE CARLI', 'carlo-de-carli', 'CARLO DE CARLI', 'carlo-main-image.jpg', 'CARLO DE CARLI', '<p>Carlo De Carli (1910-1999) was not only an architect and designer, who made a profound impact on design in the 20th century, but also one of Italy’s leading and most respected professors, who left a fundamental mark of theoretical reflections and ethics of behaviour in an entire generation of architects.</p> \r\n<br><br>\r\n<p>Carlo De Carli graduated in architecture from the Politecnico di Milan in 1934 – a university in which he was strongly connected to throughout his career, being Dean of the Faculty of Architecture from 1965 to 1968 and teaching there until 1986. A respected academic and writer, his philosophy focused on the integration of space, material and the human body and gesture, and with this ideology he effectively engaged a dialog between design, universities and the craftsmanship world.</p> \r\n<br><br>\r\n<p>He worked with legendary architect and designer Gio Ponti, and his years with Ponti came to shape young Carlo De Carli’s language and approach to design. He later went on to set up a studio on his own, where his design quickly became widely recognized and manufactured by some of the most important and innovative Italian design companies.</p> \r\n<br><br>\r\n<p>A fine sense for modern material, design and industry and a willingness to experiment and invent, characterizes Carlo De Carli’s contribution to postwar architecture and design, and earned him a reputation as one of the greatest masters of Italian design.</p>', '', 1, NULL, NULL),
(5, 0, 'corsini.png', 'CORSINI', 'corsini-&-ruiz-millet', 'CORSINI & RUIZ MILLET', 'corsini1.jpg', 'CORSINI', 'Barba Corsini (1916-2008) was a leading functionalist architect who won international praise for his architecture and his design for La Pedrera in Barcelona. Corsini was strongly inspired by the German architect Mies van der Rohe and the American architect Frank Lloyd Wright. He also had a great affinity to Finnish architecture, which he believed to be the finest in Europe on account of the powerful simplicity of the designs. \'Powerful simplicity\' is perhaps an apt description of Corsini\'s personal design style, as represented by the Pedrera Collection.\r\n\r\nJoaquim Ruiz Millet (born 1955) founded Galeria H20 in Barcelona in 1989, where he furthered his activities as gallery owner, cultural agitator, curator of exhibitions, and editor of books and design objects. During the restoration of La Pedrera in 1991, he discovered the beauty of the great floor lamp PD2 and rescued it from being thrown away. Ruiz Millet started to collaborate with Corsini in order to relaunch the original designs designed for La Pedrera. As Corsini\'s protegé, Ruiz Millet wanted to help rescuing his work, make it more known and available for the public. ', '<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/28318078\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', 1, '2019-08-19 06:02:35', '2019-08-19 06:02:35'),
(6, 0, 'gamf.png', 'GAMFRATESI', 'gamfratesi', 'GAMFRATESI', 'gamfr.jpg', 'GAMFRATESI', '<p>GamFratesi Studio was established in 2006 by the Danish architect Stine Gam (born 1975) and the Italian architect Enrico Fratesi (born 1978). GamFratesi belongs to the latest generation of furniture architects and together they represent a new interpretation of the meeting between Danish and international design traditions.</p>\r\n<br>\r\n<p>GamFratesi\'s design takes its creative drive from a fusion of tradition and renewal and in an experimental approach to their chosen materials and techniques. With their diverse traditional background, they draw on the classic Danish furniture and craft tradition as well as the timeless Italian intellectual and conceptual approach. Understanding a tradition and addressing it actively in the workshop makes it possible to expand on it. From this cross-cultural partnership, they create furniture that respectfully reflect tradition while also featuring unique embedded stories, symbols and associations, often expressed in a minimalist idiom.</p>\r\n<br>\r\n<p>\"Our work is balancing between the traditional and surprising. Often it takes just a small detail to achieve or break an expression, and we are very curious about that. We work strictly with the Scandinavian approach to crafts, simplicity and functionalism, but there always happens to be a strong emotion to concept and story behind each work. Contrasts are often the center of our inspiration. Both in work and daily life we are constantly confronted with contrasts, and we do work a lot with references and respect to traditions in both our cultures. We both have roots in strong design cultures. Studying, researching and moving constantly between our two countries, it has become such a natural part of us, that it will also show in our work.\"</p>\r\n<br>\r\n<p>GamFratesi aim to create furniture that illustrates the process and the techniques that created it, and which reflect a persistent exploration of the diverse border zone between harmony and disharmony.</p>', '<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/31027129\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', 1, '2019-08-19 06:29:32', '2019-08-19 06:29:32'),
(7, 0, 'gio.png', 'GIO PONTI', 'gio-ponti', 'GIO PONTI', 'gio1.jpg', 'GIO PONTI', '<p>Italian designer, architect and editor, Gio Ponti (1891-1979) is one of the most influential design visionaries of the 20th century. Ponti designed a wide array of furniture and products through his career - from cabinets, lamps and chairs to ceramics and glassware - and his buildings, including Pirelli tower in Milan, and Denver Art Museum, were erected in 14 countries. Through Domus, the design magazine he founded in 1928, Ponti promoted a new curiosity and open-mindedness towards new design thinking.</p>\r\n <br>\r\n<p>Gio Ponti was a conceptualist who always drew lines between the architecture and the interior design. Ponti never viewed architecture as simply creating buildings. Instead, he often conceived of the building\'s interior as well; creating furniture, lighting appliances, and even ceramics, glassware and silverware to fit the overall concept.</p>\r\n  <br>\r\n<p>Ponti\'s signature furniture designs, such as the sleek Superleggera chair for Cassina or his elegant mirror collection provide a new perspective on traditional Italian furniture and blend style with functionality. His design was influenced by la dolce vita; he encouraged everybody to use good design to enjoy life to the fullest. This exact colourful, joyful, sensual Italian good life is reflected in his portfolio, and will certainly continue to influence artists and designers well into the future.</p>\r\n  <br>\r\n<p>Today, a wide range of Ponti\'s designs are snapped up by savvy collectors who want to give their homes a touch of Italian panache and effortless chic.</p>', '', 1, '2019-08-19 07:54:54', '2019-08-19 07:59:21'),
(8, 0, 'greta.png', 'GRETA M. GROSSMAN', 'greta-m.-grossman', 'GRETA M. GROSSMAN', 'greta.jpeg', 'GRETA M. GROSSMAN', '<p>Greta Magnusson Grossman (1906-1999) maintained a prolific forty-year career on two continents: Europe and North America and operated as mover and shaker in the male dominated world of mid-century modern design. Her achievements were many and encompassed industrial design, interior design and architecture. In 1933, having successfully completed her fellowship at the renowned Stockholm arts institution, Konstfack, she opened Studio, a combined store and workshop in Stockholm. During the same year Greta M. Grossman married jazz musician, Billy Grossman with whom she later emigrated to the United States, settling in Los Angeles.</p>\r\n<br>\r\n<p>Upon their arrival in California in 1940, Grossman opened a well publicized shop on Rodeo Drive, where she was among the first to bring the Scandinavian modern aesthetic to southern California\'s burgeoning modernist scene. Her unique approach to Swedish modernism was an instant hit in Los Angeles and soon she attracted celebrity clients, including Greta Garbo, Ingrid Bergman, Joan Fontaine, Gracie Allen and Frank Sinatra and it was not long before she began appearing alongside the likes of Charles Eames and Isamu Noguchi.</p> \r\n<br>\r\n<p>While Grossman is the architect behind more than 15 homes spanning the globe from California to Sweden, she is most noted for her industrial designs where the Gräshoppa Floor Lamp and Cobra Table Lamp belongs to the most famous works.</p>\r\n<br>\r\n<p>Through the 1940\'s and 50\'s Grossman exhibited her designs at museums worldwide, including MoMA in New York and The National Museum in Stockholm. Yet inexplicably, following her retirement in the late 1960\'s Grossman’s name all but disappeared from the design landscape.</p>', '<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/28300127\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', 1, '2019-08-22 08:15:52', '2019-08-22 08:15:52'),
(9, 0, 'gubii.png', 'GUBI OLSEN', 'gubi-olsen', 'GUBI OLSEN', 'gubii.jpg', 'GUBI OLSEN', '<p>Gubi Olsen (born 1947) together with his wife, Lisbeth Olsen, founded GUBI in 1967. From the outset, the company has been based upon product design and development. Over the years, the designer couple has created a large collection of upholstered furniture.</p>\r\n<br>\r\n<p>Gubi Olsen, who graduated from \"the Permanent Exhibition of Danish Crafts and Arts\", has always pushed the boundaries to explore new directions in design. Always with a global outlook he has created his own unique post-modernistic expression. The inspiration comes from the rich Danish tradition of craft and furniture production, mixed with historical and visual references such as, French cinema, Napoleon Bonaparte and a grand piano.</p>', '', 1, '2019-08-22 08:19:01', '2019-08-22 08:19:01'),
(10, 0, 'kerstin.png', 'KERSTIN H. HOLMQUIST', 'kerstin-h.-holmquist', 'KERSTIN H. HOLMQUIST', 'kerstin.jpg', 'KERSTIN H. HOLMQUIST', '<p>Kerstin Hörlin-Holmquist (1925-1997) was a Swedish modernist architect and designer. She is remembered today, for her ability to create designs for the modern home in the 1950\'s without worrying about short lived trends and what other people thought - to stay true to her own unique and humanistic design vision.</p>   \r\n<br>\r\n<p>She often worked with her husband Erik Holmquist, and together they modelled and created the pieces together. A key aspect for the couple was always to test their designs in their own home before completing a project.</p>    \r\n<br>\r\n<p>\"I think both furniture and textiles, wherever they end up, must be kind, gentle and courteous, but without losing their character. They should have human qualities, not be pompous and only stand alone, but be able to adapt to the environment they end up in...\"</p>\r\n<br>\r\n<p>Holmquist worked and studied in England from 1946-1947 immediately after the war where she also studied art history and became fascinated with the classic English upholstered furniture and style. Something that without a doubt inspired her own creations later in life while she still developed her own expression. She returned to Sweden where she attended and graduated from Konstfack in the years 1948-1952.</p>\r\n<br>\r\n<p>Her timeless and iconic Paradiset Collection was created during her employment with Nordiska Kompaniet in 1956-1957 and holds a soft simplicity and a uniqueness in their appearance - light, clean lines and yet gracious with an air of romance. Today, her designs are highly treasured collectibles and rarely to be found on auctions.</p>', '', 1, '2019-08-22 08:29:15', '2019-08-22 08:29:15'),
(11, 0, 'hening.png', 'HENNING LARSEN ARCHITECTS', 'henning-larsen-architects', 'HENNING LARSEN ARCHITECTS', 'hening.jpg', 'HENNING LARSEN ARCHITECTS', '<p>Henning Larsen Architects is an international architectural company with strong Scandinavian roots. Henning Larsen established the company in 1959 after a study trip to the United States, initially employing just one architecture student.</p>\r\n<br>\r\n<p>Henning Larsen Architects has always been characterised by curiosity and vision. Most of the company&rsquo;s projects are based on competitions and the international focus has been present right from the beginning. One of the first competitions won by Henning Larsen Architects was Stockholm University in 1961. The first prize resulted in an international breakthrough.</p>\r\n<br>\r\n<p>Over the years, Henning Larsen Architects has designed a large number of significant projects all over the world, including several educational institutions &ndash; from primary schools to universities - and cultural buildings &ndash; from museums to libraries and large, monumental concert halls.</p>\r\n<br>\r\n<p>Today, Henning Larsen Architects is one of Europe&rsquo;s leading architectural companies, with offices in several countries.</p>', '', 1, '2019-08-22 08:33:22', '2019-08-22 08:33:22'),
(12, 0, 'jacq.png', 'JACQUES ADNET', 'jacques-adnet', 'JACQUES ADNET', 'jacq.jpg', 'JACQUES ADNET', '<p>Jacques Adnet (1900 - 1984) was a French architect and Art Deco Modernist designer and an icon of luxurious French Modernism. After completing his studies at the Municipal School of Design in Auxerre and the Ecole des Arts Decoratifs, Adnet established the company JJ Adnet with his twin brother Jean Adnet. In 1925, Jacques Adnet was recognized as one of the most promising young designers at both the Salon d\'Automne and Les Expositions des Arts Decoratifs. As well as designing furniture and mirrors, Adnet designed apartments and offices for numerous clients, including the French president Vincent Auriol and Unesco.</p>\r\n<br>\r\n<p>Throughout his career, Adnet was always among the first artists to express new trends. As a true member of the avant-garde in his time, he was an innovative thinker and original in his choice of form and materials. He was among the first to integrate metal and glass in the structure and decoration of furniture and in the post-war period, Adnet began to cover his furniture with leather. To this day, he is one of the most revered French designers, whose perennial and innovative work is still highly sought for.</p>', '', 1, '2019-08-22 08:36:02', '2019-08-22 08:36:02'),
(13, 0, 'komplot.png', 'KOMPLOT DESIGN', 'komplot-design', 'KOMPLOT DESIGN', 'komplot.jpg', 'KOMPLOT DESIGN', '<p>Founded in 1987, Komplot Design, a partnership of the Danish architect Poul Christiansen (born 1947) and the Russian industrial and graphic designer Boris Berlin (born 1953), has designed furniture and created multidisciplinary design solutions for both Danish and international companies, including Le Klint and Lightyears.</p>\r\n<br>\r\n<p>Komplot Design&rsquo;s multidisciplinary activities within product, furniture and graphic design, from tractor to office furniture systems and to brochures and corporate identity programmes, are not only giving the complexity of design approach, but also positioning their design into the electric field of intense exchange of experience and attitudes of different branches.</p>\r\n<br>\r\n<p>\"<em>We believe that through design history, many traditions within the field have been preoccupied with the idea of total control over function, form, material and so on. This striving for control of our surroundings is probably a typical urge of Western culture, being both its principal strength and its greatest failing. Instead of fighting against mistakes by forcing the material to behave perfectly (often against its nature), we choose to accept the way the material wants to behave, the way its nature tells it to move&hellip;</em>\"</p>', '', 1, '2019-08-22 08:38:29', '2019-08-22 08:38:29'),
(14, 0, 'luis.png', 'LOUIS WEISDORF', 'louis-weisdorf', 'LOUIS WEISDORF', 'luis.jpg', 'LOUIS WEISDORF', '<p>Louis Weisdorf (born in 1932) is a well-known Danish architect and designer. After graduating from the The Royal Danish Academy of Fine Arts in Copenhagen in 1954, Weisdorf worked with everything from graphic-, interior- and industrial design, to recreational areas as well as most fields within the building trade. He described his career as \"specialises in versatility\", which, quite perfectly, sums up the long and notable career of this multi-designer.</p>\r\n<br>\r\n<p>In 1961, he started a ten-year assignment at Tivoli, amusement park in Copenhagen, and worked as the main assistant to Tivoli&rsquo;s chief architect Simon P Henningsen. In the late 1960\'s, Weisdorf set up his own design studio in Copenhagen, sharing the premises with architect Ole Panton (the younger brother of Verner Panton), where he served both national and international clients. During his active time as a designer, Weisdorf worked closely with many designers including Verner Panton, Poul Henningsen and Le Klint.</p>\r\n<br>\r\n<p>Louis Weisdorf has always been interested in creating lights from a single element that could be repeated and built together in various fashions and a guiding principle of shielding the eye from direct bulb glare at all angles, which can for example be seen in his Turbo Pendant from 1967.</p>\r\n<br>\r\n<p>Today, Weisdorf lamps are collectors\' items and can be bought on auctions.</p>', '', 1, '2019-08-22 08:40:54', '2019-08-22 08:40:54'),
(15, 0, 'marcel.png', 'MARCEL GASCOIN', 'marcel-gascoin', 'MARCEL GASCOIN', 'marcel.jpg', 'MARCEL GASCOIN', '<p>French designer Marcel Gascoin (1907-1986) was one of the leading furniture designers of the post-war era. He played a vital role in the reconstruction of France after World War II, where his streamlined wooden furniture, focused on clean aesthetics and functionality, became the staple for 1950s French households.&nbsp;</p>\r\n<br>\r\n<p>Gascoin worked as an interior architect and designer with the French Ministry of Reconstruction and Urbanism to design and build homes and the furniture to fill them during the post-war housing crisis in France. Forward-thinking for his time and with a strong social conscience, Gascoin&rsquo;s democratic design drew lines between art and industry, converging clean aesthetics with rational manufacturing processes.&nbsp;</p>\r\n<br>\r\n<p>From a young age he was inspired by the precision and practical sense of interior boat design and this deep appreciation of making optimal use of available space followed him throughout his entire career. This also led to a collaboration with fellow colleague Jean Prov&eacute; in a competition to design a boat cabin - and even though they did not win, the partnership between them proved a great mutual respect and revealed a common gratitude towards the work that is robust, clever and functional.&nbsp;</p>\r\n<br>\r\n<p>Marcel Gascoin was a member of the UAM (L&rsquo;Union des Artistes Moderne) alongside important modernist designers Robert Mallet Stevens, Charlotte Perriand, Rene Herbst and Le Corbusier. This was an intellectual movement bound by a philosophy of design that united function with fabrication. In his own workshop, Gascoin passed on his know-how to the following generations of interior decorators, and several of Gascoin&rsquo;s apprentices like Michel Mortier, Pierre Paulin and Joseph-Andr&eacute; Motte went on to distinguished careers as designers in their own right.&nbsp;</p>\r\n<br>\r\n<p>Today Gascoin&rsquo;s work, unrecognized for a long time, has been progressively re-discovered by collectors, adoring his simple and striking furniture creations.</p>', '', 1, '2019-08-22 08:43:18', '2019-08-22 08:43:18'),
(16, 0, 'mat.png', 'MATHIEU MATÉGOT', 'mathieu-matégot', 'MATHIEU MATÉGOT', 'mat.jpg', 'MATHIEU MATÉGOT', '<p>Mathieu Mat&eacute;got (1910 - 2001) was a versatile, independent and self-taught Hungarian designer, architect and artist who spent most of his life in his beloved Paris, where he for the first time settled in 1931 after finishing his studies at Budapest\'s School of Art and Architecture. In 1939, Mat&eacute;got signed up as a volunteer for the French army but was held as a prisoner in Germany until he escaped in 1944. This wartime captivity was an important time, career-wise, for Mat&eacute;got as it was here he was able to familiarise himself with the innovative material and technique, Rigitulle - which later would become the characteristic trait of his.</p>\r\n<br>\r\n<p>Mathieu Mat&eacute;got is most known for this groundbreaking material and technique, which he named Rigitulle, where metal tubing is combined with perforated metal sheet. Like fabric, Rigitulle could be bent, folded and shaped to give the furniture he designed transparency, weightlessness and everlasting modernity. Mathieu Mat&eacute;got even patented this material and teqnique and set up his own production so that he could apply it into his design. Like many of his peers, Mat&eacute;got travelled the world in search of inspiration, techniques and upon return transformed these impressions into his own unique designs and interpretations. Whether it was industrial processes or aesthetics, he always collected and interpreted.</p>\r\n<br>\r\n<p>In the 1950\'s - and for a decade and a half - that he devoted to the design of furniture and interior accessories, he created a wide range of distinctive designs that today is considered iconic and contemporary. To ensure quality in the production of his own designs, Mat&eacute;got set up two of his own workshops - Soci&eacute;t&eacute; Mategot, one in Paris that employed up to twenty workers and a second in Casablanca, Morocco. Both manufactured in limited numbers for up to 400 items and continued until the beginning of 1960\'s when Mat&eacute;got abruptly ended his production and began his work on tapestry, which he would continue for the rest of his career.</p>', '<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/28303273\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', 1, '2019-08-22 08:46:14', '2019-08-22 08:46:14'),
(17, 0, 'oe.png', 'OEO STUDIO', 'oeo-studio', 'OEO STUDIO', 'oe.jpg', 'OEO STUDIO', '<p>Designer and Creative Director Thomas Lykke (born 1971) trained as a fashion designer in Copenhagen and San Francisco before turning his eye to the design industry where he worked as Interiors Editor at Wallpaper* Magazine from 2000-2003 before setting up his own design company, OEO Studio, in Copenhagen in 2003.<p>\r\n <br>\r\n<p>OEO Studio always seeks to instill a sense of necessity, one that reflects our belief that great design is driven by passion and shaped by the vision to make a difference in a relevant, natural and respectful way. Our approach to design is holistic. To OEO Studio, communication is just as important as the product itself. Indeed, truth lies in the totality of the approach. OEO Studio seeks to touch and inspire people on an emotional level, to create engaging design universes with a cosmopolitan outlook.<p>\r\n <br>\r\n<p>\"We are creative people with a unique and refined sense of the DNA and personality of a brand: its heritage, qualities and core essence. We have developed masterly skills at taking a brand and bringing it to centre stage. We strive to create products that can last for generations for their outstanding qualities and aesthetics. Finally, we are strong believers in craftsmanship, tactile materials and the lived-in experience when creating meaningful products and ambiances\" says Thomas Lykke.<p>\r\n <br>\r\n<p>OEO Studio has created award-winning designs for a broad spectrum of discerning clients, from the most respected centuries-old crafts companies to corporate brand producers of high-quality products, including Georg Jensen, Dinesen, Kadeau, Takashimaya, Brdr. Krüger, Leica, Japan Handmade, Stellar Works, Hosoo and Sony HQ.Hosoo and Sony HQ.</p>', '', 1, '2019-08-22 08:49:57', '2019-08-22 08:49:57'),
(18, 0, 'oliver.png', 'OLIVER SCHICK', 'oliver-schick', 'OLIVER SCHICK', 'oliver.jpg', 'OLIVER SCHICK', '<p>Oliver Schick was born in 1969 in Darmstadt, Germany, and studied product design at the HBK - University of Fine Arts and Design in Saarbruecken. After graduating, he worked freelance for several studios and in 2005 he founded his own studio with a focus on furniture, lighting and interior design and has since worked for companies such as Ligne Roset and Skandiform.</p>\r\n<br>\r\n<p>\"My aim is to design products with character that are timeless and easy to comprehend. Often, only minor changes or unexpected details are needed to give a product a lively character which sparks the associations and emotions of the user.\" His Ronde Pendant clearly echoes this philosophy, with its understated yet effectual details.</p>\r\n<br>\r\n<p>Schick also engages with a range of more experimental projects with design-related themes, focusing on materials, functions, usage and sustainable development.</p>', '', 1, '2019-08-22 08:53:45', '2019-08-22 08:53:45'),
(19, 0, 'pavo.png', 'PAAVO TYNELL', 'paavo-tynell', 'PAAVO TYNELL', 'pavo.jpg', 'PAAVO TYNELL', '<p>Paavo Tynell (1890-1973) was an industrial designer, known as the great pioneer of Finnish lighting design and fondly dubbed as “the man who illuminated Finland”. Tyne was one of the founders and chief designers of Taito Oy – the first industrial producer of lighting fixtures in Finland. With the innovation of electricity in the beginning of the 20th century, Taito Oy and Tynell expanded the thinking and manufacturing of modern lighting solutions in Europe and abroad.</p> \r\n<br>\r\n<p>Paavo Tynell rose to prominence in the 1930s and 40s where he collaborated with some of the most renowned Finnish architects, Alvar Aalto being the most notable one. Working to incorporate artificial lighting into modern environments, Tynell’s company Taito Oy produced fixtures for all of Alvar Aalto’s major projects including the Paimio Sanatorium and the Viipuri Library.</p> \r\n<br>\r\n<p>Tynell was especially appraised through his involvement with the Finland House, a design atelier in New York that showcased the work of Finnish designers and craftspeople. His elegant brass designs became an instant success in North America, and he began creating lighting designs for the prestigious American company Lightolier.</p> \r\n<br>\r\n<p>A master craftsman himself, Tynell’s designs were derivative of a traditional aesthetic with a modern sensibility, mixed with an extensive use of perforated and polished brass as material. Marked by delicacy and softness, his most famous forms in lightning echo the structures of nature; he adroitly created sculptural shapes reminiscent of the branches of trees, swirling snowflakes and seashells.</p>\r\n<br>\r\n<p>Today Paavo Tynell lamps and lighting are highly sought after by an international clientele of collectors and prices of his most important pieces have lately soared on auctions.</p>', '', 1, '2019-08-22 08:55:26', '2019-08-22 08:55:26'),
(20, 0, 'paul.png', 'PAUL LEROY', 'paul-leroy', 'PAUL LEROY', 'paul.jpg', 'PAUL LEROY', '<p>Paul Leroy (born in 1960) studied architecture, furniture design, graphics and industrial design at The Royal Danish Academy of Fine Arts. He opened his design studio while studying in 1987 and today the clients include Mercedes-Benz, Apple, Google, Copenhagen Airports, B&O, Sony, Nike among others.</p>\r\n<br>\r\n<p>The philosophy behind the Paul Leroy designs is that timeless beauty created in adequate solutions does change the way we all think and act. The aim is to create and shape physical products and spaces with the purpose of giving you pleasure and lasting value in your daily life. Trying hard to avoid here-today-gone-tomorrow trend movements, seeking to deliver solutions that are relevant in the present context, but with an incorporated longer lasting value.</p>', '', 1, '2019-08-22 08:57:27', '2019-08-22 08:57:27'),
(21, 0, 'piere.png', 'PIERRE PAULIN', 'pierre-paulin', 'PIERRE PAULIN', 'piere1.png', 'PIERRE PAULIN', '<p>Legendary French furniture designer Pierre Paulin (1927-2009) bestrode the 1960’s and 70’s with his recognizable and innovative style that instantly revolutionized everyday furniture. He studied at the École Camondo design school in Paris, where his teacher urged him to join Marcel Gascoin’s workshop. There Paulin took in Scandinavian aesthetics and gained great insight in the role that design could play in society.</p> \r\n<br>\r\n<p>Through the 1950’s Pierre Paulin moved on to design furniture on his own and he began to experiment with stretchy, extensible fabrics that could be drawn across a chair’s armature. He started successful collaborations with Thonet France and Artifort, where the latter resulted in several iconic pieces such as the Mushroom, Ribbon and Tongue chairs, all of which have become sought-after design classics.</p> \r\n<br>\r\n<p>A joyful modernist, Paulin’s low-slung pieces provided a new laid-back perspective on life and his forward-looking, eclectic and sculptural approach to furniture design instantly caught the mood of the swinging 60’s. The hedonistic, sinuous style of Paulin’s design also attracted the patronage of presidents Georges Pompidou and François Mitterrand, who asked him to redecorate parts of the Elysée Palace in the 1970’s and 80’s.</p> \r\n<br>\r\n<p>Widely recognized, Pierre Paulin’s innovative designs can today be found in contemporary art and design collections around the world, from the Museum of Modern Art, New York to the Victoria and Albert Museum, London along with the National Centre for Art and Culture Georges Pompidou in Paris.</p>', '', 1, '2019-08-22 09:11:11', '2019-08-22 09:11:11'),
(22, 0, 'robert.png', 'ROBERT DUDLEY BEST', 'robert-dudley-best', 'ROBERT DUDLEY BEST', 'robert.jpg', 'ROBERT DUDLEY BEST', '<p>Robert Dudley Best (1892-1984) was heir to the world\'s largest lighting manufacturing company Best & Lloyd, founded in Birmingham in 1840. Despite the company\'s proud history of providing traditional lamps to a prestigious clientele, including Titanic and the Orient Express, Dudley Best was interested in a new collection that symbolised the spirit of the new age by appealing to the more avant-garde architects and setting a new agenda for lamp design.</p> \r\n<br>\r\n<p>Robert Dudley Best, a keen design enthusiast on top of his prominence as a young industrialist, spent the 1920\'s travelling around Europe meeting designers and furthering his interest in modernist movement. After visiting the Exhibition of Modern Design in Paris in 1925, where many of the designs exhibited were influenced by the work of Le Corbusier and Mies van der Rohe, he enrolled at the School of Industrial Design in Düsseldoft and in Paris. Interested in breaking the barriers between industrial and artistic merit, Dudley Best\'s ideals were shared by his friend Walter Gropius, the founder of the Bauhaus movement. It was during this period that Dudley Best made the first sketches of what would become the iconic Bestlite design.</p> \r\n<br>\r\n<p>Robert Dudley Best was strongly influenced by Bauhaus, which was taking Europe with storm with its stringent lines and clean style. Following Bauhaus principles, Dudley Best had done away with the trimmings and detail of traditional Best & Lloyd products; he had both commercial and domestic use in mind and believed that lighting should be functional and practical as well as elegant. With this in mind, he returned to Birmingham in 1930, determined to put his Bestlite lamp design into production.</p>', '<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/28348557\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>', 1, '2019-08-22 09:13:24', '2019-08-22 09:13:24'),
(23, 0, 'sebastian.png', 'SEBASTIAN HERKNER', 'sebastian-herkner', 'SEBASTIAN HERKNER', 'sabastian.jpg', 'SEBASTIAN HERKNER', '<p>It took the German designer Sebastian Herkner only a few years to convince the whole design scene of his talent with his unusual material mixes and timeless shapes, always managing to communicate an impression of sensibility. Today, he is contributing to the collections of the most important design houses worldwide and has won numerous awards for his design.</p>\r\n<br>\r\n<p>Sebastian Herkner was born in 1981 in Bad Mergentheim and moved to Offenbach am Main to study Product Design at Offenbach University of Art and Design.  While already focusing on designing objects and furniture by merging various cultural contexts, Herkner combined new technologies with traditional craftmanship. This was in order to highlight the multifaceted beauty of the materials and draw renewed attention to small details.</p>\r\n<br>\r\n<p>During his studies, Herkner did an internship with Stella McCartney in London and developed a particular liking for materials, colours, structures, textures and how they are connected to each other. Since founding his own design studio in Offenbach am Main in 2006, he has designed products for manufacturers such as Moroso, ClassiCon, Rosentahl, Very Wood and Pulpo, as well as working on interior design projects and for exhibitions and museums.</p>\r\n<br>\r\n<p>When designing everyday objects, Sebastian Herkner is influenced by his observations of people and their actions. In this context it is important to look beyond your own disciplines in order to achieve a value-added for the user. Herkner is not so much influenced by trends or current consumer criteria, because what interests him is a collage of simple techniques and traditional materials coupled with a simple mechanical principle and an unambiguous function. His idea of sustainability consists of employing traditional manufacturing techniques and their unique character. He then combines and interprets this by employing new technologies and finishing methods.</p>', '', 1, '2019-08-22 09:15:21', '2019-08-22 09:15:21'),
(24, 0, 'space.png', 'SPACE COPENHAGEN', 'space-copenhagen', 'SPACE COPENHAGEN', 'space.jpg', 'SPACE COPENHAGEN', '<p>Established in 2005 by Signe Bindslev Henriksen and Peter Bundgaard Rützou, Space Copenhagen is a design studio working across multiple disciplines from furniture, lighting and refined objects, to art installations, art direction and interior design for private homes, hotels and restaurants all over the world. </p>\r\n<br>\r\n<p>The ambition is to forge new paths by balancing opposites — classic and modern, industrial and organic, sculptural and minimal, light and shade. Duality and contrast. Curiosity as a fundamental human condition. </p>\r\n<br>\r\n<p>The studio’s intuitive approach embodies designs that are distinctively shaped by the given circumstances, functional needs, and a fundamental interest in human behavior. It is a sense of and belief in slow aesthetic that centers quality and longevity. </p>\r\n<br>\r\n<p>Space Copenhagen has created lauded furniture pieces for some of the world’s leading manufacturers and continuously substantiates their roster of high-end interiors at an international level, following, among others, their award-winning design for 11 Howard hotel in New York and acclaimed destination restaurants Geranium and Noma in Copenhagen.</p>', '', 1, '2019-08-22 09:17:19', '2019-08-22 09:17:19');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `firstname`, `lastname`, `email`, `phone`, `products`, `variation`, `inq`, `qty`, `message`, `image`, `status`, `created_at`, `updated_at`) VALUES
(34, 'dfgdfg', 'Boskovic', 'info@greyapartments.is', '345345', 'Bat Dining Chair - Un-Upholstered, Conic base', 'Black Base', 'Pure White Shell Black', '1', '345345345', 'white.webp', 1, '2019-08-17 20:28:24', '2019-08-17 20:35:40'),
(36, 'dfgdfg', 'Boskovic', 'info@greyapartments.is', '12321312', '9602 Floor Lamp', '', 'Wicker Willow', '1', '1231231232', 'floor1.jpg', 1, '2019-08-19 05:49:06', '2019-08-19 05:49:17'),
(37, 'Marko', 'Boskovic', 'test@gmail.com', '123123 4', '62 Desk', '', '', '1', 'test', 'desk.jpg', 1, '2019-08-19 11:21:22', '2019-08-19 11:21:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inspirations`
--

INSERT INTO `inspirations` (`id`, `image`, `alt`, `location`, `name`, `description`, `body`, `status`, `gallery_status`, `created_at`, `updated_at`) VALUES
(1, 'flora.png', 'flora', 'flora', 'FLORA DANICA', 'Project Maison du Danemark, Paris, France • Collection Beetle Chair, Beetle Bar Chair, TS Column Table • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '2019-08-19 05:47:02'),
(2, 'copen.png', 'Copenhague', 'copenhague', 'COPENHAGUE', 'Project Maison du Danemark, Paris, France • Collection Masculo Chair, Cobra Wall Lamp • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '2019-08-17 12:27:01'),
(3, 'standard-image.png', 'THE STANDARD', 'the-standard', 'THE STANDARD', 'Project The Standard, Copenhagen, Denmark • Collection Beetle Chair, Beetle Bar Chair, TS Table, Bestlite BL3 Floor Lamp, Cobra Wall Lamp • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'roch.png', 'LE ROCH', 'le-roch', 'LE ROCH', 'Project Le Roch Hotel & Spa, Paris, France • Collection Beetle Chair, GUBI Table 2.0, Beetle Lounge Chair, Modern Line Sofa • Interior Maison Sarah Lavione • Photographer Francis Amiand', '', 1, 1, '0000-00-00 00:00:00', '2019-08-18 18:34:21'),
(5, 'amass.png', 'AMASS', 'amass', 'AMASS', 'Project Amass, Copenhagen, Denmark • Collection Masculo Chair, Aoyama Table, Bestlite BL9 XL, GUBI Table 1.0, Grand Piano Sofa, Cobra Wall Lamp, Cobra Floor Lamp • Interior GUBI', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:00:22'),
(6, 'hotel.png', 'HOTEL MAURITZHOF', 'hotel-mauritzhof', 'HOTEL MAURITZHOF', 'Project Hotel Mauritzhof, Münster, Germany • Collection Beetle Chair, Beetle Lounge Chair, TS Table • Interior Lambs and Lions • Photographer Steve Herud', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:01:55'),
(7, 'imp.png', 'IMPLEMENT', 'implement', 'IMPLEMENT', 'Project Implement Consulting Group, Copenhagen, Denmark • Collection Beetle Chair, Beetle Lounge Chair, TS Table • Interior GamFratesi', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:04:22'),
(8, 'klub.png', 'KLUB', 'klub', 'KLUB', 'Project Klub, Copenhagen, Denmark • Collection Beetle Lounge Chair, Beetle Chair, Beetle Bar Chair, Masculo Chair, GUBI Bar Stool, Grand Piano Sofa, Bonaparte Lounge Chair, Adam Lounge Chair, GUBI Table 2.0, TS Table, Paper Table, Bestlite BL2 Table Lamp, Bestlite BL 9XL Pendant, Bestlite BL3 Floor Lamp, GOS3 Table • Interior GUBI', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:08:15'),
(9, 'fam.png', 'SECOND FEMALE', 'second-famale', 'SECOND FEMALE', 'Project Second Female Showroom & Office, Copenhagen, Denmark • Collection Beetle Chair, Moon Table, GUBI Bar Stool, Y! Table, GOS3 Table, GOS4 Desk, Stay Lounge Chair, Modern Line Sofa, TS Table, Bestlite BL1 Table Lamp • Interior GUBI', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:11:33'),
(10, 'v.png', 'HOTEL V', 'hotel-v', 'HOTEL V', 'Project Hotel V, Amsterdam, Netherlands • Collection Beetle Chair • Interior Pilou', '', 1, 1, '0000-00-00 00:00:00', '2019-08-22 08:12:27'),
(11, 'parc.png', 'PARC BROEKHUIZEN', 'parc-broekhuizen', 'PARC BROEKHUIZEN', 'Project Parc Broekhuizen, Leersum, Netherlands • Collection Beetle Chair, Beetle Lounge Chair, Coco Chair, GUBI Table 2.0, TS Table, Grand Piano Sofa, Stay Sofa • Interior judithvanmourik • Photographer Marc van Praag & Mitchell van Voorbergen', '', 1, 1, '0000-00-00 00:00:00', '2019-08-20 07:36:38');

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
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(20, 2, 'cop5.jpg', 'Gubi-image', '2019-08-17 12:26:49', '2019-08-17 12:26:49'),
(21, 4, 'image-asset (1).jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(22, 4, 'image-asset (2).jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(23, 4, 'image-asset (3).jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(24, 4, 'image-asset (4).jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(25, 4, 'image-asset (5).jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(26, 4, 'image-asset.jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(27, 4, 'Le-Roch-0716_13.jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(28, 4, 'Le-Roch-0716_24.jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(29, 4, 'Le-Roch-0716_29.jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(30, 4, 'Le-Roch-0716_31.jpg', 'Gubi-image', '2019-08-18 18:34:11', '2019-08-18 18:34:11'),
(32, 11, 'a.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(33, 11, 'c.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(34, 11, 'd.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(35, 11, 'f.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(36, 11, 'IMG_5419def.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(37, 11, 'IMG_5486def.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(38, 11, 'n.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(39, 11, 's.jpg', 'Gubi-image', '2019-08-20 07:36:26', '2019-08-20 07:36:26'),
(41, 11, 'm.jpg', 'Gubi-image', '2019-08-20 07:37:43', '2019-08-20 07:37:43'),
(51, 5, 'ama.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(52, 5, 'ama1.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(53, 5, 'ama2.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(54, 5, 'ama3.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(55, 5, 'ama4.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(56, 5, 'ama5.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(57, 5, 'ama6.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(58, 5, 'ama7.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(59, 5, 'ama8.jpg', 'Gubi-image', '2019-08-22 08:00:14', '2019-08-22 08:00:14'),
(60, 6, 'mau.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(61, 6, 'mau1.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(62, 6, 'mau2.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(63, 6, 'mau3.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(64, 6, 'mau4.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(65, 6, 'mau5.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(66, 6, 'mau6.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(67, 6, 'mau7.jpg', 'Gubi-image', '2019-08-22 08:01:50', '2019-08-22 08:01:50'),
(73, 7, 'im.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(74, 7, 'im1.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(75, 7, 'im2.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(76, 7, 'im3.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(77, 7, 'im4.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(78, 7, 'im5.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(79, 7, 'im6.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(80, 7, 'im7.jpg', 'Gubi-image', '2019-08-22 08:06:08', '2019-08-22 08:06:08'),
(81, 8, 'kl.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(82, 8, 'kl1.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(83, 8, 'kl2.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(84, 8, 'kl3.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(85, 8, 'kl4.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(86, 8, 'kl5.jpg', 'Gubi-image', '2019-08-22 08:08:10', '2019-08-22 08:08:10'),
(87, 8, 'kl6.jpg', 'Gubi-image', '2019-08-22 08:08:11', '2019-08-22 08:08:11'),
(88, 8, 'kl7.jpg', 'Gubi-image', '2019-08-22 08:08:11', '2019-08-22 08:08:11'),
(89, 8, 'kl8.jpg', 'Gubi-image', '2019-08-22 08:08:11', '2019-08-22 08:08:11'),
(90, 9, 'sc.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(91, 9, 'sc1.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(92, 9, 'sc2.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(93, 9, 'sc3.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(94, 9, 'sc4.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(95, 9, 'sc5.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(96, 9, 'sc6.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(97, 9, 'sc7.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(98, 9, 'sc8.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(99, 9, 'sc9.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(100, 9, 'sc10.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(101, 9, 'sc11.jpg', 'Gubi-image', '2019-08-22 08:11:29', '2019-08-22 08:11:29'),
(102, 10, 'hv.jpg', 'Gubi-image', '2019-08-22 08:12:22', '2019-08-22 08:12:22'),
(103, 10, 'hv1.jpg', 'Gubi-image', '2019-08-22 08:12:22', '2019-08-22 08:12:22'),
(104, 10, 'hv.jpg', 'Gubi-image', '2019-08-22 08:12:43', '2019-08-22 08:12:43');

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(25, '2019_08_17_124350_create_inspirations_images_table', 17),
(26, '2019_08_19_103210_create_news_images_table', 18),
(27, '2019_08_20_084433_create_collections_table', 19),
(28, '2019_08_20_104246_create_home_sliders_table', 20),
(29, '2019_08_20_124850_create_collections_images_table', 21),
(30, '2019_08_21_134448_create_collections_options_table', 22),
(31, '2019_08_21_135606_create_collections_options_images_table', 23);

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
  `body` text COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `gallery_status` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `alt`, `headline`, `location`, `description`, `body`, `status`, `gallery_status`, `created_at`, `updated_at`) VALUES
(1, '3days.png', '3 DAYS OF DESIGN', '3 DAYS OF DESIGN', '3-days-of-design', 'Позната је чињеница да ће читалац бити спутан правим читљивим текстом на страници када гледа њен распоред. Поента коришћења Lorem Ipsum модела је мање-више из разлога што је распор\r\n', '', 1, 0, '2019-08-15 13:43:26', '2019-08-15 13:43:26'),
(2, 'milan.png', 'MILAN DESIGN WEEK 2018', 'MILAN DESIGN WEEK 2018', 'milan-design-week-2018', 'We heartily thank you for the overwhelming attendance and positive responses during Milan Design Week! It was a pleasure to present our novelties and existing design icons in the 1200m2 universe of home, contract and hospitality sceneries, set within the historical backdrop of Palazzo Serbelloni.', '', 1, 1, '2019-08-15 13:49:54', '2019-08-15 13:49:54'),
(3, 'showroom.png', 'REDECORATED GUBI SHOWROOM', 'REDECORATED GUBI SHOWROOM', 'redecorated-gubi-showroom', '<p>Based in the rapidly growing seafront district of Copenhagen’s Nordhavn, the GUBI Showroom has recently been redecorated with the latest novelties and new inspiring spatial settings. Embracing an atmosphere characterized by warm colour schemes in playful combination with botanical and rich wall displays, the showroom takes you through colourful meeting settings to more sophisticated lounge areas.</p>\r\n<br>\r\n<p>A special highlight in our showroom is the un-upholstered <b>Beetle Chair</b> by GamFratesi, with options for seat and front upholstery, which allows endless of combinations in terms of seating shells, bases, colours and fabrics. Also displayed is the expanded versions of our <b>TS Collection</b> and <b>Masculo Collection</b> as well as new versions of the classic <b>Modern Line Sofa</b> and <b>Lounge Chair</b> by Greta M. Grossman.</p>\r\n<br>\r\n<p>We are very much looking forward to showing you the GUBI universe!</p>', '', 1, 1, '2019-08-19 08:56:59', '2019-08-19 09:35:49'),
(4, 'paris.png', 'PARISIAN INFLUENCES', 'PARISIAN INFLUENCES FOR THE NEW TS COLUMN TABLE', 'parisian-influences-for-the-new-ts-column-table', 'At the Parisian main street, overlooking the Arc du Triumph, is where Maison du Danemark - the House of Denmark, is located and hosts the two world-class restaurants Flora Danica and Copenhague. After thorough renovation and refurbishment by the design duo GamFratesi, the space has been given new life with the aim to revive the combination of classic Danish design with a Danish culinary experience.', '', 1, 0, '2019-08-19 10:43:10', '2019-08-22 09:39:32');

-- --------------------------------------------------------

--
-- Table structure for table `news_images`
--

DROP TABLE IF EXISTS `news_images`;
CREATE TABLE IF NOT EXISTS `news_images` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `news_id` bigint(20) NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_images`
--

INSERT INTO `news_images` (`id`, `news_id`, `image`, `alt`, `created_at`, `updated_at`) VALUES
(1, 2, 'milan.png', 'Milan', NULL, NULL),
(2, 2, 'milan1.png', 'Milan', NULL, NULL),
(3, 2, 'milan2.png', 'milan', NULL, NULL),
(4, 3, 'image-asset (1).jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41'),
(5, 3, 'image-asset (2).jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41'),
(6, 3, 'image-asset (3).jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41'),
(7, 3, 'image-asset (4).jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41'),
(8, 3, 'image-asset.jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41'),
(9, 3, 'IMG_8662_1.jpg', 'Gubi-image', '2019-08-19 09:07:41', '2019-08-19 09:07:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `designers_id`, `categories_id`, `sub_category_id`, `collections_id`, `image`, `alt`, `headline`, `price`, `price_status`, `currency`, `location`, `body`, `status`, `views`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 2, 0, 'floor.jpg', 'Canvas', '9602 Floor Lamp', '949.00', 0, '€', '9602-floor-lamp', '<p>The 9602 Floor Lamp, also known as &ldquo;Chinese Hat&rdquo; was designed by Paavo Tynell in 1935 for the Hotel Aulanko. Characterised by its elegant and airy lampshade and rattan-covered stem, the 9602 Floor Lamp shows the designer&rsquo;s limitless imagination and unparalleled ability to create designs of enduring beauty. Adding a playful, exuberant quality to the top, balanced by the more static form of the base, the 9602 Floor Lamp is perfectly suited for creating a gentle ambient light in the domestic living room.</p>', 1, 119, '2019-08-12 19:32:28', '2019-08-22 07:52:53'),
(2, 0, 1, 0, 0, 'adnet.jpg', 'Adnet Wall Mirror', 'Adnet Wall Mirror - Circular - Dia. 58 Alcantara', '854.00', 0, '€', 'adnet-wall-mirror-circular-dia.-58-alcantara', 'We proudly present the iconic Adnet Circulaire Mirror with a new and contemporary Alcantara frame to further extend this classic collection designed in 1946 by Jacques Adnet. The remarkable and extremely durable Alcantara fabric has a tactile feel and aesthetic qualities, that is pleasing to the eye.\r\n\r\nKnown for being an innovative thinker, Adnet was one of the first designers to integrate metal and glass in the structure and decoration of furniture. Accordingly, he designed the elegant, distinctive round mirror with equestrian inspired detailing - the Adnet Circulaire Mirror.\r\n\r\nThe timeless Adnet Circulaire Mirror adds a sculptural value and outstanding expression to any hallway, bathroom or living room.', 1, 146, '2019-08-13 18:05:48', '2019-08-22 06:30:56'),
(4, 6, 1, 5, 0, 'bat1.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Remix 123', '909.00', 0, '€', 'bat-dining-chair,-conic-base-fully-upholstered-in-remix-123', '<p>The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat&rsquo;s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration. This Designers Choice product features a Antique Brass Conic base and upholstery in Remix, Kvadrat (123).</p>', 1, 37, '2019-08-13 19:17:33', '2019-08-22 06:36:05'),
(5, 6, 1, 5, 1, 'bat-black.jpg', 'Bat Dining Chair', 'Bat Dining Chair - Un-Upholstered, Conic base', '309.00', 0, '€', 'bat-dining-chair-un-upholstered-conic-base', '<p>The Bat Dining Chair, designed by Danish-Italian design-duo GamFratesi, carries strong references to the interesting characteristics of bats, with its inviting, distinctive shell reminiscent of the shape of a bat&rsquo;s wingspan. Balancing between the traditional and surprising, the Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism while also carrying a strong embedded story and associations expressed in a minimalist idiom. The wide range of upholstery options and different bases makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.</p>', 1, 404, '2019-08-14 18:24:34', '2019-08-22 09:41:01'),
(6, 0, 6, 0, 0, 'bed.jpg', 'Stay Bed', 'Stay Bed - Fully Upholstered, Low back', '3,886.00', 0, '€', 'stay-bed-fully-upholstered-low-back', 'Stay here, stay with me, stay relaxed, stay and read... with the Stay Bed you do not want to do anything else than stay in bed. With its soft shape and gentle lines, it is a statement furniture for the private home and hotels. The new Stay Bed, is perfectly suited for relaxed times, and unifies luxury with comfort to enjoy the ultimate homely feeling, even though you are in a hotel. The organic shape gives a contemporary look and is almost like a singular continuous pencil stroke wrapping a solid texture. Combine it with the Stay Lounge Chair to get the optimal relaxation.\r\n\r\nSlatted bed base and mattresses not included. Fits box, sprung and foam mattresses. If foam or sprung mattress is used, a slatted bed base is needed. Box mattresses can be used directly in the frame.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 62, '2019-08-15 06:01:45', '2019-08-22 06:29:49'),
(7, 0, 8, 0, 0, 'metgot.jpg', 'Matégot Flower Pot', 'Matégot Flower Pot', '99.00', 0, '€', 'mategot-flower-pot', 'Designed in 1953 during Mathieu Matégot’s heydays, the Matégot Flower Pot is a proof of his success in turning perforated metal sheet into a refined, elegant material in which design, art and engineering are perfectly combined. This distinctive fabric-like metal sheet, which Matégot named Rigitulle, is crinkled and results in an airy grace that contributes to its genuine sculpture. \r\n\r\nAvailable in three different sizes, the Matégot Flower Pot allows playing with its appearance - whether the beauty is seen in pairs of the same sizes, one flower pot on its own or a number of flower pots in different sizes to create a perfect asymmetry. The largest pot can with its multipurpose nature, advantageously, also be used as a wastepaper basket.\r\n\r\nAvailable in Venetian Gold in Ø15.5 cm and Ø21 cm, and Midnight Black in all sizes.', 1, 55, '2019-08-15 10:16:46', '2019-08-22 09:44:55'),
(8, 0, 8, 0, 0, 'bowl.jpg', 'Matégot Bowl', 'Mategot Bowl', '159.00', 0, '€', 'mategot-bowl', 'Ahead of his time and with a modern spirit, Mathieu Matégot designed his contemporary Matégot bowl in 1953. The characteristic appearance of the transparent metal adds a light expression to this unique and spacious fruit bowl. As for many of Matégot\'s designs, the Matégot Bowl is trademarked by the solid yet light material Rigitulle; a thin perforated metal sheet tantamount to metal lace, where the inspiration is drawn from the material itself to explore all sorts of expression possible to create. \r\n\r\nThis luxurious material permitted Matégot to revamp the regular fruit bowl into an artistic and decorative bowl that besides from storing fruit in an elegant way, also acts as a piece of great design adorning any room. The Matégot Bowl is an easy and beautiful way to add a pop of colour to any setting.', 1, 17, '2019-08-15 10:19:14', '2019-08-22 06:34:03'),
(9, 0, 1, 12, 0, 'coffe.jpg', 'Adnet Coffee Table', 'Adnet Coffee Table - Circular, Ø70', '1,386.00', 0, '€', 'adnet-coffee-table-circular-070', 'The Adnet Coffee Table was originally designed by French Modernist Jacques Adnet (1901 - 1981) in the 1950’s. Adnet was always ahead of contemporary trends and became famous for his avant-garde designs and unusual combination of leather, metal and glass. The iconic Adnet Coffee Table exemplifies everything the French architect and interior designer stands for and perfectly merges his Art Deco style with his strong commitment to functionalist principles.\r\n\r\nPlaced on three soft curved metal legs, elegantly meeting in the heart of the table, the round glass top is edged with a hand-made leather rim and adorned with three gilded brass rings. The timeless design of the Adnet Coffee Table embodies modern materials and superb craftsmanship and adds a distinctive value to any home or professional space.', 1, 53, '2019-08-15 18:01:43', '2019-08-22 07:29:37'),
(10, 6, 1, 5, 0, 'wood.jpg', 'Bat Dining Chair, Wood Base', 'Bat Dining Chair, Wood Base - Front Upholstered in Crisp 04115', '559.00', 0, '€', 'bat-dining-chair,-wood-base-front-upholstered-in-crisp-04115', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan.\r\n\r\nThe wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts.\r\n\r\nDue to its unique design, the textile of the front upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Black Stained Beech wood base, New Beige Shell and upholstery in Crisp, Gabriel (04115).', 1, 52, '2019-08-16 10:37:24', '2019-08-22 06:36:09'),
(11, 4, 3, 6, 0, 'carlo.png', 'CDC.1 Lounge Chair', 'CDC.1 Lounge Chair', '2,186.00', 0, '€', 'cdc.1-lounge-chair', 'CDC.1 Lounge Chair was designed by Carlo De Carli in 1954 and features the elegantly minimalist design style, typical of the era.\r\n\r\nThe CDC.1 Lounge Chair meets the ground in a graceful and slender way; its arms swooping like wings, giving the furniture a sense of poetic depth, whilst carrying a strong character. With its sleek silhouette and dynamic, angular lines the lounge chair marries streamlined functionalism with playful whimsy and is well-suited for conversation and relaxation in the modern residential environment.', 1, 5, '2019-08-16 20:50:39', '2019-08-17 12:30:21'),
(12, 3, 2, 4, 0, 'mat.webp', 'Semi Pendant', 'Semi Pendant - Dia.30', '349.00', 0, '€', 'semi-pendant-dia-30', 'The Semi Pendant is a unique pendant lamp, based on two quarter-circles put together, back-to-back. It\'s distinctive arch-shaped, enamelled metal shade creates a diffused, cone-shaped light, ideal over a dining table or kitchen work surface. With its lightness of form, unique timeless design and range of colours and sizes, the Semi Pendant is extremely versatile and well suited to both private and public spaces.\r\n\r\nThe Semi Pendant was designed in 1968 as a product of the creative partnership between Claus Bonderup and Torsten Thorup. Reacting against the soft organic forms, the so-called cosy era, that was dominating Denmark at the time, Bonderup and Thorup wanted to create a lamp that incorporated sharp, clean lines and a geometric shape. Their design was submitted for a competition at the Royal Danish Academy of Fine Arts, School of Architecture and won first prize. In the 1980’s the pendant achieved great success and became, at that time, the best-selling Danish design and gained worldwide recognition and iconic status.', 1, 46, '2019-08-17 16:10:21', '2019-08-20 11:50:31'),
(13, 3, 2, 4, 0, 'bond.jpg', 'Semi Pendant - Dia.47', 'Semi Pendant - Dia.47', '579.00', 0, '€', 'semi-pendant-dia-47', 'The Semi Pendant is a unique pendant lamp, based on two quarter-circles put together, back-to-back. It\'s distinctive arch-shaped, enamelled metal shade creates a diffused, cone-shaped light, ideal over a dining table or kitchen work surface. With its lightness of form, unique timeless design and range of colours and sizes, the Semi Pendant is extremely versatile and well suited to both private and public spaces.\r\n\r\nThe Semi Pendant was designed in 1968 as a product of the creative partnership between Claus Bonderup and Torsten Thorup. Reacting against the soft organic forms, the so-called cosy era, that was dominating Denmark at the time, Bonderup and Thorup wanted to create a lamp that incorporated sharp, clean lines and a geometric shape. Their design was submitted for a competition at the Royal Danish Academy of Fine Arts, School of Architecture and won first prize. In the 1980’s the pendant achieved great success and became, at that time, the best-selling Danish design and gained worldwide recognition and iconic status.', 1, 24, '2019-08-17 16:40:58', '2019-08-22 05:45:47'),
(14, 8, 5, 16, 0, 'desk.jpg', '62 Desk', '62 Desk', '2,919.00', 0, '€', '62-desk', '<p>Designed in 1952 by Greta M. Grossman, but named the 62 Desk as it was deemed to be ten years ahead of its time. The 62 Desk appears characteristically light in weight and appears to defy gravity with its quirky asymmetric line and slender metal legs balancing on small wooden feet, a characteristic trait of its designer.</p>\r\n<p>&nbsp;</p>\r\n<p>Its exceptional shape is emphasized with the elegant pairing of materials. The desk is made in American walnut and provided with a deep, black full gloss finish on table top and cabinet door. The desk features one left cabinet comprising of two low drawers and one high drawer.</p>', 1, 7, '2019-08-19 11:15:15', '2019-08-22 09:20:37'),
(15, 0, 2, 1, 0, 'b-4.jpg', 'B-4 Table Lamp', 'B-4 Table Lamp', '299.00', 0, '€', 'b-4-table-lamp', 'The B-4 Table Lamp by Greta M. Grossman was designed in 1945 and bears her whimsical and powerful signature style. With playful angles and geometric elements, the table lamp is characterized by its colourful and movable visors allowing light to diffuse softly around any table it stands on. The lamp fits effortlessly into almost any environment, adding a dash of American modernism panache to the room. The silhouette of the B-4 Table Lamp, with its stilt base and alternating colour panels, resembles some of Greta M. Grossman’s most iconic architecture more than any other design item from her career. Typically, her houses were perched high up on stilts with cantilevered decks and walls of glass to take in the magnificent hillside views of Southern California – and with a fanciful style the B-4 Table Lamp beautifully reflects her modernist design principles.', 1, 8, '2019-08-20 08:27:16', '2019-08-21 18:15:22'),
(16, 0, 1, 6, 0, 'pacha.webp', 'Pacha Lounge Chair', 'Pacha Lounge Chair - Fully Upholstered', '1,749.00', 0, '€', 'pacha-lounge-chair-fully-upholstered', 'Legendary French designer Pierre Paulin originally designed the Pacha Chair in 1975. Paulin designed the chair in harmony with the changing design style of its period, replacing the austerity of post-war design with a new, vigorous approach.\r\n\r\nPaulin managed to give a real elegance to the rounded forms of the Pacha Chair by finding the perfect proportions, raising it lightly on its base and tracing in the foam and upholstery with stitching lines inclined inwards. Through pieces like the Pacha Chair, Pierre Paulin pioneered low-level living; a modern way of living and sitting on the floor, by getting rid of chair legs.\r\n\r\nWith comfort as the constant starting-point in his designs, the curvaceous, whimsical and organic shapes of the Pacha Chair is conceived to serve the body, providing both comfort and cosiness. Looking as contemporary today as when it first was designed, the Pacha Chair is an honest, functional piece that brings life and character to any interior setting.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 30, '2019-08-20 11:43:42', '2019-08-21 18:51:23'),
(17, 0, 1, 1, 0, 'lamp.jpg', '5321 Table Lamp', '5321 Table Lamp', '509.00', 0, '€', '5321-table-lamp', 'Paavo Tynell’s fanciful take on nature is gracefully echoed in the 5321 Table Lamp, designed by the Finnish designer in 1938. Under the distinctive shell-inspired brass shade, the bulb subtly appears from beneath; a picturesque detail resembling the desirable sea shell pearl and making the 5321 Table Lamp a perfect example on how Tynell brought a playful nature and romance to the simplified style of mid-century modernism. Blending timeless aesthetic with a unique sense of form, the 5321 Table Lamp adds an exquisite character to complement any modern space. Both decorative and functional, the lamp is a balance of elegance and curiosity, providing a design that is at once subtle and surprising.', 1, 8, '2019-08-20 11:54:11', '2019-08-22 06:43:18'),
(18, 6, 3, 5, 2, 'beetle.jpg', 'Beetle Dining Chair', 'Beetle Dining Chair - Seat Upholstered - Conic base', '449.00', 0, '€', 'beetle-dining-chair-seat-upholstered-conic-base', 'Taking inspiration from the four-legged creature - the beetle, GamFratesi has been looking closely at its characteristic elements: shape, shells, sutures, rigid outside and soft inside. With its polypropylene plastic shell and seat upholstery, the Beetle Chair has a light expression with an additional comfort. Thanks to its wide spectrum of colour options and upholstery possibilities, the chair encourages for personalisation. Due to its unique design, the seat upholstery can also be changed with time to give the chair a different expression and new life to the interior decoration. The comfortable yet dynamic design makes the Beetle Chair suitable for multiple environments whether it is in the home or the workplace.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 10, '2019-08-21 08:39:59', '2019-08-21 19:05:37'),
(19, 6, 3, 5, 2, 'beetle1.jpg', 'Beetle Dining Chair', 'Beetle Dining Chair - Fully Upholstered - Conic base', '829.00', 0, '€', 'beetle-dining-chair-fully-upholstered-conic-base', 'The Beetle Chair has since its introduction in 2013 being well received by end-consumers as well as interior architects. Due to its appealing design, outstanding comfort and unique customisation possibilities, the chair can be seen in many of the most renown restaurants around the world. The fully upholstered chair carries strong references to the design duo GamFratesi\'s inspirational source; the insect world, more specific the world of beetles. Not just the name indicates their inspiration, but also the characteristic elements of the beetles’ sections have been interpreted - shape, shells, sutures, rigid outside and soft inside. The wide range of upholstery options and different bases make it possible to put your personal touch to the chair and create one of its kind.\r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 6, '2019-08-21 09:18:46', '2019-08-21 18:50:58'),
(20, 6, 3, 10, 1, 'bat.jpg', 'Bat Meeting Chair', 'Bat Meeting Chair - Un-upholstered - 4-Star Swivel Base', '469.00', 0, '€', 'bat-meeting-chair-un-upholstered-4-star-swivel-base', 'The Bat Meeting Chair fulfils the natural balance between corporate necessity and formal elegance. While the base embodies clean design with great functionality, the fully moulded seat with armrest ensures high level of comfort. The features are paired and provide a sophisticated expression to any meeting room or home office.\r\n\r\nFront Upholstered: The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Meeting Chair fit perfectly into a variety of public and private contexts.\r\nDue to its unique design, the textile of the front upholstered Bat Meeting Chair can be changed with time to give the chair a different expression and new life to the interior decoration. \r\nFully Upholstered: The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Meeting Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Meeting Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\nThe Bat Meeting Chair is designed by GamFratesi and carries strong references to the interesting characteristics of bats, with its inviting, distinctive shell reminiscent of the shape of a bat’s wingspan.', 1, 8, '2019-08-21 10:02:47', '2019-08-21 16:38:07'),
(22, 6, 1, 6, 1, 'batt.webp', 'Bat Lounge Chair', 'Bat Lounge Chair - Fully Upholstered, High back, Conic base', '2,349.00', 0, '€', 'bat-lounge-chair-fully-upholstered-high-back-conic-base', 'The new Bat Lounge Chair, which comes in a high- and low-back version, is designed by Danish-Italian design-duo GamFratesi. The chair carries strong references to the interesting characteristics of bats, with its inviting, distinctive shell reminiscent of the shape of a bat’s wingspan.\r\n\r\n\r\nBalancing between the traditional and surprising, the Bat Lounge Chair is created with a Scandinavian approach to crafts, simplicity and functionalism while also carrying a strong embedded story and associations expressed in a minimalist idiom. The wide range of upholstery options and different bases makes the Bat Lounge Chair fit perfectly into a variety of public and private contexts.\r\n\r\n \r\n\r\nUpholstered products are not available for purchase online. Please contact us or find a dealer.', 1, 8, '2019-08-22 05:38:31', '2019-08-22 05:59:41'),
(23, 0, 1, 4, 0, 'pen.jpg', 'Collar Pendant', 'Collar Pendant Ø42', '509.00', 0, '€', 'collar-pendant-ø42', 'The Collar Pendant, designed by the German designer Sebastian Herkner, is a series of pendant lights where special attention has been paid on its details. The pendant is made of mouth-blown glass and crafted in line with old traditional techniques that gives every lamp its unique and iconic look. Its strong character is achieved by the combination of the soft rounded glass, with a matte surface, and a steel \"collar\", used as a reflector, that together perfectly diffuses a warm light that sets just the right lighting atmosphere.\r\n\r\nThe lamp looks great as a single feature alone over a table, but by mixing colours and large and small Collar Pendants, it gives possibilities for strong personal and playful installations.', 1, 4, '2019-08-22 05:43:30', '2019-08-22 05:45:45'),
(24, 6, 1, 5, 1, 'conicc.jpg', 'Bat Dining Chair', 'Bat Dining Chair, Conic Base - Fully Upholstered in Crisp 04115', '869.00', 0, '€', 'bat-dining-chair-conic-base-fully-upholstered-in-crisp-04115', 'The Bat Dining Chair is created with a Scandinavian approach to crafts, simplicity and functionalism by Danish-Italian design-duo GamFratesi. The embracing shell with armrests equally embodies both aesthetics and comfort while carrying strong references to the interesting and distinctive shape of a bat’s wingspan. The wide range of shell colours, upholstery options and diverse bases provides for a personalised expression that makes the Bat Dining Chair fit perfectly into a variety of public and private contexts. Due to its unique design, the textile of the fully upholstered Bat Dining Chair can be changed with time to give the chair a different expression and new life to the interior decoration.\r\n\r\nThis Designers Choice product features a Antique Brass Conic base and upholstery in Crisp, Gabriel (04115).', 1, 4, '2019-08-22 05:48:28', '2019-08-22 05:59:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(29, 13, 'bond.jpg', 'Gubi image', '2019-08-17 16:40:58', '2019-08-17 16:40:58'),
(30, 13, 'bond1.jpg', 'Gubi-image', '2019-08-17 16:43:01', '2019-08-17 16:43:01'),
(31, 12, 'mat-w.webp', 'Gubi-image', '2019-08-18 10:00:39', '2019-08-18 10:00:39'),
(32, 14, 'desk.jpg', 'Gubi image', '2019-08-19 11:15:16', '2019-08-19 11:15:16'),
(33, 14, 'desk1.jpg', 'Gubi image', '2019-08-19 11:15:16', '2019-08-19 11:15:16'),
(34, 15, 'b-4.jpg', 'Gubi image', '2019-08-20 08:27:16', '2019-08-20 08:27:16'),
(35, 15, 'B-4a.jpg', 'Gubi image', '2019-08-20 08:27:16', '2019-08-20 08:27:16'),
(36, 15, 'B-4b.jpg', 'Gubi image', '2019-08-20 08:27:17', '2019-08-20 08:27:17'),
(37, 15, 'b-4d.jpg', 'Gubi image', '2019-08-20 08:27:17', '2019-08-20 08:27:17'),
(38, 16, 'pacha.webp', 'Gubi image', '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(39, 16, 'pacha1.webp', 'Gubi image', '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(40, 16, 'pacha12.jpg', 'Gubi image', '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(41, 16, 'pacha123.jpg', 'Gubi image', '2019-08-20 11:43:42', '2019-08-20 11:43:42'),
(42, 17, 'lamp.jpg', 'Gubi image', '2019-08-20 11:54:11', '2019-08-20 11:54:11'),
(43, 17, 'lamp1.jpg', 'Gubi image', '2019-08-20 11:54:11', '2019-08-20 11:54:11'),
(44, 18, 'beetle.jpg', 'Gubi image', '2019-08-21 08:39:59', '2019-08-21 08:39:59'),
(45, 19, 'beetle1.jpg', 'Gubi image', '2019-08-21 09:18:46', '2019-08-21 09:18:46'),
(46, 20, 'bat.jpg', 'Gubi image', '2019-08-21 10:02:47', '2019-08-21 10:02:47'),
(47, 5, 'bat-black.jpg', 'Gubi-image', '2019-08-22 05:35:12', '2019-08-22 05:35:12'),
(48, 5, 'bat-black.jpg', 'Gubi-image', '2019-08-22 05:35:41', '2019-08-22 05:35:41'),
(49, 22, 'batt.webp', 'Gubi image', '2019-08-22 05:38:31', '2019-08-22 05:38:31'),
(50, 22, 'ant.webp', 'Gubi-image', '2019-08-22 05:40:25', '2019-08-22 05:40:25'),
(51, 23, 'pen.jpg', 'Gubi image', '2019-08-22 05:43:30', '2019-08-22 05:43:30'),
(52, 24, 'conicc.jpg', 'Gubi image', '2019-08-22 05:48:28', '2019-08-22 05:48:28'),
(53, 24, 'conicc1.jpg', 'Gubi image', '2019-08-22 05:48:28', '2019-08-22 05:48:28'),
(54, 4, 'bat-g.jpg', 'Gubi-image', '2019-08-22 06:00:37', '2019-08-22 06:00:37'),
(55, 9, 'sto.jpg', 'Gubi-image', '2019-08-22 06:03:15', '2019-08-22 06:03:15');

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
  UNIQUE KEY `products_id` (`products_id`,`variations_id`),
  KEY `variations_id` (`variations_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_variations`
--

INSERT INTO `products_variations` (`id`, `products_id`, `variations_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2019-08-13 21:33:22', '2019-08-13 21:33:22'),
(5, 5, 1, '2019-08-14 18:25:04', '2019-08-14 18:25:04'),
(6, 5, 4, '2019-08-14 18:25:12', '2019-08-14 18:25:12'),
(7, 6, 7, '2019-08-15 06:04:15', '2019-08-15 06:04:15'),
(8, 8, 2, '2019-08-15 10:19:34', '2019-08-15 10:19:34'),
(11, 9, 2, '2019-08-15 18:02:25', '2019-08-15 18:02:25'),
(12, 12, 3, '2019-08-17 16:11:32', '2019-08-17 16:11:32'),
(13, 13, 3, '2019-08-17 16:42:00', '2019-08-17 16:42:00'),
(14, 15, 2, '2019-08-20 08:27:53', '2019-08-20 08:27:53'),
(15, 16, 1, '2019-08-20 11:44:16', '2019-08-20 11:44:16'),
(16, 18, 1, '2019-08-21 08:40:51', '2019-08-21 08:40:51'),
(17, 18, 4, '2019-08-21 08:44:51', '2019-08-21 08:44:51'),
(18, 19, 1, '2019-08-21 09:21:43', '2019-08-21 09:21:43'),
(19, 20, 1, '2019-08-21 10:05:19', '2019-08-21 10:05:19'),
(20, 20, 4, '2019-08-21 10:05:33', '2019-08-21 10:05:33'),
(21, 22, 1, '2019-08-22 05:39:30', '2019-08-22 05:39:30'),
(22, 23, 2, '2019-08-22 05:44:35', '2019-08-22 05:44:35'),
(23, 1, 3, '2019-08-22 07:52:48', '2019-08-22 07:52:48'),
(24, 7, 7, '2019-08-22 09:41:58', '2019-08-22 09:41:58'),
(25, 7, 2, '2019-08-22 09:42:04', '2019-08-22 09:42:04');

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
(17, 5, 0, 0, 'Storage', 'storage', 1, NULL, NULL),
(18, 0, 0, 0, 'GamFratesi', 'gamfratesi', 0, NULL, NULL),
(19, 0, 0, 0, 'Bat Collection', 'bat-collection', 0, NULL, NULL),
(20, 0, 0, 0, 'Beetle Collection', 'beetle-collection', 0, NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_variations`
--

INSERT INTO `sub_variations` (`id`, `products_id`, `variations_id`, `name`, `variation_name`, `image`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 'Dusty Cedar', '', 'adnet.jpg', '2019-08-13 21:43:38', '2019-08-13 21:43:38'),
(3, 1, 3, 'Canvas', '', 'floor.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
(4, 1, 3, 'Wicker Willow', '', 'floor1.jpg', '2019-08-14 17:16:07', '2019-08-14 17:16:07'),
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
(23, 9, 2, 'Black Leather', '', 'coffe.jpg', '2019-08-15 18:02:58', '2019-08-15 18:02:58'),
(25, 12, 3, 'Brass Shade', '', 'semi.webp', '2019-08-17 16:11:54', '2019-08-17 16:11:54'),
(26, 12, 3, 'Chrome Shade', '', 'chrome-shade.webp', '2019-08-17 16:15:06', '2019-08-17 16:15:06'),
(27, 12, 3, 'Copper Shade', '', 'chooper.webp', '2019-08-17 16:19:45', '2019-08-17 16:19:45'),
(28, 12, 3, 'Matt Black Shade', '', 'mat.webp', '2019-08-17 16:23:02', '2019-08-17 16:23:02'),
(29, 12, 3, 'Matt White Shade', '', 'mat-w.webp', '2019-08-17 16:39:39', '2019-08-17 16:39:39'),
(30, 13, 3, 'Brass Shade', '', 'bond.jpg', '2019-08-17 16:42:33', '2019-08-17 16:42:33'),
(31, 13, 3, 'Chrome Shade', '', 'bond1.jpg', '2019-08-17 16:42:33', '2019-08-17 16:42:33'),
(32, 7, 2, 'Venetian Gold', '', 'metgot-gold.jpg', '2019-08-18 18:16:37', '2019-08-18 18:16:37'),
(33, 15, 2, 'French Blue', '', 'b-4.jpg', '2019-08-20 08:29:10', '2019-08-20 08:29:10'),
(34, 15, 2, 'Chianti Red', '', 'B-4a.jpg', '2019-08-20 08:29:10', '2019-08-20 08:29:10'),
(35, 15, 2, 'Black/White', '', 'B-4b.jpg', '2019-08-20 08:29:10', '2019-08-20 08:29:10'),
(36, 15, 2, 'Italien Green', '', 'b-4d.jpg', '2019-08-20 08:29:10', '2019-08-20 08:29:10'),
(37, 16, 1, 'Black Base', '', 'pacha.webp', '2019-08-20 11:45:10', '2019-08-20 11:45:10'),
(38, 16, 1, 'Pearl Gold Base', '', 'pacha1.webp', '2019-08-20 11:45:10', '2019-08-20 11:45:10'),
(39, 18, 1, 'Black Base', 'Black Base', '', '2019-08-21 08:44:10', '2019-08-21 08:44:10'),
(40, 18, 4, 'Black Shell', 'Black Shell', '', '2019-08-21 08:45:07', '2019-08-21 08:45:07'),
(41, 19, 1, 'Black Base', '', 'beetle1.jpg', '2019-08-21 09:22:08', '2019-08-21 09:22:08'),
(42, 5, 1, 'Black Base', '', 'bat-black.jpg', '2019-08-22 05:36:11', '2019-08-22 05:36:11'),
(43, 22, 1, 'Antique Brass', '', 'ant.webp', '2019-08-22 05:40:06', '2019-08-22 05:40:06'),
(44, 23, 2, 'Carbon', '', 'pen.jpg', '2019-08-22 05:44:55', '2019-08-22 05:44:55'),
(45, 22, 1, 'Black Matt', '', 'batt.webp', '2019-08-22 05:57:49', '2019-08-22 05:57:49'),
(46, 5, 4, 'Black Shell', '', 'bat-black.jpg', '2019-08-22 06:27:29', '2019-08-22 06:27:29'),
(47, 9, 2, 'Tan Leather', '', 'coffe1.jpg', '2019-08-22 07:29:23', '2019-08-22 07:29:23');

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
(1, 'Gubi', 'test@gmail.com', NULL, '$2y$10$TgQ7XfCYVj1YAj1I.S2G.uQdhMT8Sx72WA/uoZcqN2//QIbhraTla', NULL, '2019-08-12 17:16:36', '2019-08-12 17:16:36');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  ADD CONSTRAINT `categories_products_ibfk_1` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categories_products_ibfk_2` FOREIGN KEY (`products_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
