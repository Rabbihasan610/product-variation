-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 08, 2024 at 04:05 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `product_variation`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_01_08_033554_create_product_attibutes_table', 1),
(6, '2024_01_08_033609_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
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
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `orders` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `category_id`, `unit`, `sku`, `content`, `orders`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Product', 'product-blue-small', 1, 'asfas', 'product-blue-small', '{\"sku\":[\"product-blue-small\",\"product-black-small\"],\"color\":[\"Blue\",\"Black\"],\"value\":[\"Small\",\"Small\"],\"uint\":[\"asfas\",\"asfsafas\"]}', '0', 'Active', '2024-01-08 03:49:00', '2024-01-08 03:49:00'),
(2, 'Product', 'product-black-small', 1, 'asfsafas', 'product-black-small', '{\"sku\":[\"product-blue-small\",\"product-black-small\"],\"color\":[\"Blue\",\"Black\"],\"value\":[\"Small\",\"Small\"],\"uint\":[\"asfas\",\"asfsafas\"]}', '0', 'Active', '2024-01-08 03:49:00', '2024-01-08 03:49:00'),
(3, 'demo', 'demo-blue-small', 2, 'gdfg', 'demo-blue-small', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(4, 'demo', 'demo-blue-medium', 2, 'fdg', 'demo-blue-medium', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(5, 'demo', 'demo-blue-large', 2, 'fg', 'demo-blue-large', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(6, 'demo', 'demo-black-small', 2, 'dfgfd', 'demo-black-small', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(7, 'demo', 'demo-black-medium', 2, 'dfg', 'demo-black-medium', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(8, 'demo', 'demo-black-large', 2, 'fg', 'demo-black-large', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(9, 'demo', 'demo-green-small', 2, 'dfgdf', 'demo-green-small', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(10, 'demo', 'demo-green-medium', 2, 'fd', 'demo-green-medium', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(11, 'demo', 'demo-green-large', 2, 'df', 'demo-green-large', '{\"sku\":[\"demo-blue-small\",\"demo-blue-medium\",\"demo-blue-large\",\"demo-black-small\",\"demo-black-medium\",\"demo-black-large\",\"demo-green-small\",\"demo-green-medium\",\"demo-green-large\"],\"color\":[\"Blue\",\"Blue\",\"Blue\",\"Black\",\"Black\",\"Black\",\"Green\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\",\"Small\",\"Medium\",\"Large\"],\"uint\":[\"gdfg\",\"fdg\",\"fg\",\"dfgfd\",\"dfg\",\"fg\",\"dfgdf\",\"fd\",\"df\"]}', '0', 'Active', '2024-01-08 03:53:19', '2024-01-08 03:53:19'),
(12, 'demo', 'demo-blue-small-1', 2, NULL, 'demo-blue-small-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(13, 'demo', 'demo-blue-medium-1', 2, NULL, 'demo-blue-medium-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(14, 'demo', 'demo-black-small-1', 2, NULL, 'demo-black-small-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(15, 'demo', 'demo-black-medium-1', 2, NULL, 'demo-black-medium-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(16, 'demo', 'demo-green-small-1', 2, NULL, 'demo-green-small-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(17, 'demo', 'demo-green-medium-1', 2, NULL, 'demo-green-medium-1', '{\"sku\":[\"demo-blue-small-1\",\"demo-blue-medium-1\",\"demo-black-small-1\",\"demo-black-medium-1\",\"demo-green-small-1\",\"demo-green-medium-1\"],\"color\":[\"Blue\",\"Blue\",\"Black\",\"Black\",\"Green\",\"Green\"],\"value\":[\"Small\",\"Medium\",\"Small\",\"Medium\",\"Small\",\"Medium\"],\"uint\":[null,null,null,null,null,null]}', '0', 'Active', '2024-01-08 03:54:17', '2024-01-08 03:54:17'),
(18, 'dfghfdgh', 'dfghfdgh', 2, NULL, 'fdfdhfdh', NULL, '0', 'Active', '2024-01-08 03:55:24', '2024-01-08 03:55:24');

-- --------------------------------------------------------

--
-- Table structure for table `product_attibutes`
--

CREATE TABLE `product_attibutes` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attibutes`
--

INSERT INTO `product_attibutes` (`id`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Color', 0, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(2, 'Blue', 1, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(3, 'Black', 1, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(4, 'Green', 1, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(5, 'Size', 0, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(6, 'Small', 5, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(7, 'Medium', 5, '2024-01-07 22:32:08', '2024-01-07 22:32:08'),
(8, 'Large', 5, '2024-01-07 22:32:08', '2024-01-07 22:32:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

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
-- Indexes for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_attibutes`
--
ALTER TABLE `product_attibutes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
