-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2026 pada 16.28
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasbesareai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
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
-- Struktur dari tabel `jobs`
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
-- Struktur dari tabel `job_batches`
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
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_10_28_145149_create_products_table', 1),
(5, '2025_10_29_002509_create_orders_table', 1),
(6, '2025_10_29_002540_create_order_items_table', 1),
(7, '2025_10_29_061710_add_is_admin_to_users_table', 1),
(8, '2025_10_29_123424_add_google_fields_again_to_users_table', 1),
(9, '2025_11_01_093141_add_shipping_details_to_orders_table', 1),
(10, '2025_12_09_154040_create_personal_access_tokens_table', 1),
(11, '2025_12_11_134113_add_discount_value_in_orders_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `courier` varchar(255) NOT NULL,
  `payment_method` varchar(255) NOT NULL,
  `discount_value` int(11) DEFAULT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `province_id` varchar(255) DEFAULT NULL,
  `city_id` varchar(255) DEFAULT NULL,
  `district_id` varchar(255) DEFAULT NULL,
  `shipping_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_etd` varchar(255) DEFAULT NULL,
  `address_line_1` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `email`, `phone`, `address`, `courier`, `payment_method`, `discount_value`, `total_price`, `status`, `province_id`, `city_id`, `district_id`, `shipping_cost`, `shipping_etd`, `address_line_1`, `created_at`, `updated_at`) VALUES
(1, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 3500000.00, 'completed', '8', '96', '887', 0.00, NULL, NULL, '2025-12-15 17:56:47', '2025-12-15 18:16:56'),
(2, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 7532000.00, 'completed', '8', '96', '887', 32000.00, NULL, NULL, '2025-12-15 17:58:14', '2025-12-15 18:49:54'),
(3, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 3208000.00, 'completed', '10', '136', '1338', 208000.00, NULL, NULL, '2025-12-15 18:29:06', '2025-12-15 18:39:00'),
(4, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 978000.00, 'paid', '22', '330', '3236', 18000.00, NULL, NULL, '2025-12-15 18:42:58', '2025-12-15 18:45:07'),
(5, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 783000.00, 'waiting_payment', '2', '11', '118', 33000.00, NULL, NULL, '2025-12-15 18:44:07', '2025-12-15 18:44:08'),
(6, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 2000, 262000.00, 'waiting_payment', '10', '136', '1331', 104000.00, NULL, NULL, '2025-12-15 18:51:24', '2025-12-15 18:51:25'),
(7, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 1000, 112000.00, 'waiting_payment', '2', '17', '161', 33000.00, NULL, NULL, '2025-12-15 18:52:36', '2025-12-15 18:52:36'),
(8, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 344000.00, 'waiting_payment', '10', '136', '1331', 104000.00, NULL, NULL, '2025-12-16 00:04:07', '2025-12-16 00:04:09'),
(9, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 1000, 192000.00, 'waiting_payment', '2', '11', '117', 33000.00, NULL, NULL, '2025-12-16 00:10:14', '2025-12-16 00:10:15'),
(10, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 1037000.00, 'completed', '7', '79', '5170', 37000.00, NULL, NULL, '2025-12-18 02:10:47', '2025-12-18 02:13:03'),
(11, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 2581000.00, 'completed', '16', '222', '2276', 81000.00, NULL, NULL, '2025-12-23 18:59:04', '2025-12-23 19:00:09'),
(12, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 50000, 1304000.00, 'completed', '10', '136', '1334', 104000.00, NULL, NULL, '2025-12-27 10:00:41', '2025-12-27 10:05:34'),
(13, 13, 'messi', 'messi12@gmail.com', '081397861233', NULL, 'jnt', 'xendit', 50000, 374000.00, 'waiting_payment', '10', '136', '1331', 104000.00, NULL, NULL, '2026-01-03 00:27:20', '2026-01-03 00:27:22'),
(14, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 50000, 294000.00, 'completed', '10', '136', '1331', 104000.00, NULL, NULL, '2026-01-03 00:29:46', '2026-01-03 00:31:49'),
(15, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 1029000.00, 'completed', '5', '77', '753', 29000.00, NULL, NULL, '2026-01-05 00:56:37', '2026-01-05 00:57:48'),
(16, 13, 'messi', 'messi12@gmail.com', '0812345678910', NULL, 'jnt', 'xendit', 0, 854000.00, 'completed', '10', '135', '1324', 104000.00, NULL, NULL, '2026-01-07 08:18:53', '2026-01-07 08:22:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `custom_size` varchar(255) DEFAULT NULL,
  `custom_chest` varchar(255) DEFAULT NULL,
  `custom_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `custom_size`, `custom_chest`, `custom_notes`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Jahit Kemeja Formal Pria', 14, 250000.00, 'xl', '96', 'panjang lengan 60 cm', '2025-12-15 17:56:47', '2025-12-15 17:56:47'),
(2, 2, 1, 'Jahit Kemeja Formal Pria', 30, 250000.00, 'XL', '98', 'panjang lengan 60 cm', '2025-12-15 17:58:14', '2025-12-15 17:58:14'),
(3, 3, 1, 'Jahit Kemeja Formal Pria', 12, 250000.00, 'xl', '97', 'panjang lengan 60 cm', '2025-12-15 18:29:06', '2025-12-15 18:29:06'),
(4, 4, 7, 'baju spongebob', 12, 80000.00, 'l', '80', '-', '2025-12-15 18:42:58', '2025-12-15 18:42:58'),
(5, 5, 1, 'Jahit Kemeja Formal Pria', 3, 250000.00, 'xl', '98', '60', '2025-12-15 18:44:07', '2025-12-15 18:44:07'),
(6, 6, 7, 'baju spongebob', 2, 80000.00, 'xl', '97', '60', '2025-12-15 18:51:24', '2025-12-15 18:51:24'),
(7, 7, 7, 'baju spongebob', 1, 80000.00, 'xl', '98', '60', '2025-12-15 18:52:36', '2025-12-15 18:52:36'),
(8, 8, 7, 'baju spongebob', 3, 80000.00, 'xl', '77', 'panjang lengan 50 cm', '2025-12-16 00:04:07', '2025-12-16 00:04:07'),
(9, 9, 7, 'baju spongebob', 2, 80000.00, 'xl', '88', '60', '2025-12-16 00:10:14', '2025-12-16 00:10:14'),
(10, 10, 1, 'Jahit Kemeja Formal Pria', 4, 250000.00, 'xl', '98', '60', '2025-12-18 02:10:47', '2025-12-18 02:10:47'),
(11, 11, 1, 'Jahit Kemeja Formal Pria', 10, 250000.00, 'xl', '97', 'panjang lengan 60', '2025-12-23 18:59:04', '2025-12-23 18:59:04'),
(12, 12, 1, 'Jahit Kemeja Formal Pria', 5, 250000.00, 'XL', '97', 'Panjang lengan 78 Cm', '2025-12-27 10:00:41', '2025-12-27 10:00:41'),
(13, 13, 7, 'baju spongebob', 4, 80000.00, 'XL', '98', 'Panjang lengan 70 cm', '2026-01-03 00:27:20', '2026-01-03 00:27:20'),
(14, 14, 7, 'baju spongebob', 3, 80000.00, 'XL', '97', 'Panjang lengan 70 cm', '2026-01-03 00:29:46', '2026-01-03 00:29:46'),
(15, 15, 1, 'Jahit Kemeja Formal Pria', 4, 250000.00, 'xl', '98', 'panjang lengan 70 cm', '2026-01-05 00:56:37', '2026-01-05 00:56:37'),
(16, 16, 1, 'Jahit Kemeja Formal Pria', 3, 250000.00, 'XL', '98', 'Panjang lengan 80 CM', '2026-01-07 08:18:53', '2026-01-07 08:18:53');

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 13, 'loyalty_app_token', '0c72664f89c69fd7dfb899f2427fc3f23312f72e67d8f0c6717eda1e1e3f695d', '[\"*\"]', NULL, NULL, '2025-12-15 17:59:04', '2025-12-15 17:59:04'),
(2, 'App\\Models\\User', 13, 'loyalty_app_token', '3f24b06ff1bbf1b4c1555664e9f4c82ebb354e81e5999a79f5cf5dbe44a6ceed', '[\"*\"]', NULL, NULL, '2025-12-15 18:02:09', '2025-12-15 18:02:09'),
(3, 'App\\Models\\User', 13, 'loyalty_app_token', 'c147c45c170855723700e9c7a7e3912b9943d5efffec9cee00d1f179ce04c2c9', '[\"*\"]', NULL, NULL, '2025-12-15 18:17:40', '2025-12-15 18:17:40'),
(4, 'App\\Models\\User', 13, 'loyalty_app_token', '9c38dc7f0872c7e5ee9ff7f8def49a6c3da86974a882452ee09d693ebe665b79', '[\"*\"]', NULL, NULL, '2025-12-15 18:25:25', '2025-12-15 18:25:25'),
(5, 'App\\Models\\User', 13, 'loyalty_app_token', '1941acdfe7f1e32121322a9d91b46a69b205ded44fba04d444a64139e558fb01', '[\"*\"]', NULL, NULL, '2025-12-15 18:40:46', '2025-12-15 18:40:46'),
(6, 'App\\Models\\User', 13, 'loyalty_app_token', '698d46f91d09e96965cf62bfd7fdcf0827a16aa630318e54a5f68fb7bdda366b', '[\"*\"]', NULL, NULL, '2025-12-15 18:45:35', '2025-12-15 18:45:35'),
(7, 'App\\Models\\User', 13, 'loyalty_app_token', '1dd75de26cea9bf51f9e7185d68a142f14cec73c284928661b024018e63fbbbe', '[\"*\"]', NULL, NULL, '2025-12-16 00:04:46', '2025-12-16 00:04:46'),
(8, 'App\\Models\\User', 13, 'loyalty_app_token', 'b28a0ecfe374aa7aa75e839b5198bae39c7de4f8fdc7d926623aec2d5eb5f3fb', '[\"*\"]', NULL, NULL, '2025-12-18 02:06:37', '2025-12-18 02:06:37'),
(9, 'App\\Models\\User', 13, 'loyalty_app_token', '9b9a27f5907ffde7ae85670ad40fabcf7185a06d6294c4461f2e85d99bbc6389', '[\"*\"]', NULL, NULL, '2025-12-18 02:13:23', '2025-12-18 02:13:23'),
(10, 'App\\Models\\User', 13, 'loyalty_app_token', 'b8f69a4fe2f8cebd72939b6ce0a22f649d32034da7c3f91a7c199daa0a321b22', '[\"*\"]', NULL, NULL, '2025-12-18 23:14:26', '2025-12-18 23:14:26'),
(11, 'App\\Models\\User', 13, 'loyalty_app_token', '63ee331492ad9702d68575c336cb65446baa4dc86720f300d8bdd332c87e04d1', '[\"*\"]', NULL, NULL, '2025-12-21 09:39:18', '2025-12-21 09:39:18'),
(12, 'App\\Models\\User', 13, 'loyalty_app_token', '9ae8735dbc836a69ecdb934ca24275b070a85fcccad0a8512a928415aa97d4c3', '[\"*\"]', NULL, NULL, '2025-12-21 10:15:51', '2025-12-21 10:15:51'),
(13, 'App\\Models\\User', 13, 'loyalty_app_token', '98d9b759728c17cbabe37250777113b7af38177ecd683db6724c75964e61f015', '[\"*\"]', NULL, NULL, '2025-12-21 10:15:52', '2025-12-21 10:15:52'),
(14, 'App\\Models\\User', 13, 'loyalty_app_token', '7187067f6d9abe3261dcdc32ec618ce99a1546737d48bbfbfde2b094acf0897b', '[\"*\"]', NULL, NULL, '2025-12-21 10:15:52', '2025-12-21 10:15:52'),
(15, 'App\\Models\\User', 13, 'loyalty_app_token', '1aa629429d902560e2640a5efc7cd43e703342ecf0d4080d4992730d1eafc3a7', '[\"*\"]', NULL, NULL, '2025-12-23 19:00:29', '2025-12-23 19:00:29'),
(16, 'App\\Models\\User', 13, 'loyalty_app_token', '9ffe7a1d5c842aed497a3ea4c939b343c5976be98c07a7aad7d052e74a455685', '[\"*\"]', NULL, NULL, '2025-12-23 22:00:22', '2025-12-23 22:00:22'),
(17, 'App\\Models\\User', 13, 'loyalty_app_token', '68b8c587f88a55318abce586515bfb72b611f9de5146910ef270d1c7fa0c7e98', '[\"*\"]', NULL, NULL, '2025-12-23 22:00:24', '2025-12-23 22:00:24'),
(18, 'App\\Models\\User', 13, 'loyalty_app_token', 'f376774e106f7740efef96104f1916fb5ab01d5ecb78ce256290a700feff0805', '[\"*\"]', '2025-12-23 22:07:01', NULL, '2025-12-23 22:06:59', '2025-12-23 22:07:01'),
(19, 'App\\Models\\User', 13, 'loyalty_app_token', '7e88707e8d5338a4d69e2bf4b5543d1caf682432300a96fe80a1c0e13f0afce9', '[\"*\"]', NULL, NULL, '2025-12-23 22:30:40', '2025-12-23 22:30:40'),
(20, 'App\\Models\\User', 13, 'loyalty_app_token', '226d0a72c384aa985c59584c1d67ff68ceadb61ed7e6aff9c431c1b4d1d77230', '[\"*\"]', NULL, NULL, '2025-12-23 22:34:23', '2025-12-23 22:34:23'),
(21, 'App\\Models\\User', 13, 'loyalty_app_token', '4c27e0ec74d236ab3cb23ed8c0c4c84ba8faa52ded2048a87a4eb25a9d99b7ab', '[\"*\"]', NULL, NULL, '2025-12-27 10:06:05', '2025-12-27 10:06:05'),
(22, 'App\\Models\\User', 13, 'loyalty_app_token', '2fc3f34023c5557e4a616d21f81114e4293d6abd95c3b594f0a743636b4ce446', '[\"*\"]', NULL, NULL, '2025-12-27 10:06:06', '2025-12-27 10:06:06'),
(23, 'App\\Models\\User', 13, 'loyalty_app_token', '60fc583959d3534e4eac65367874a9136618d35c435fd505e54d77f6fd48e40c', '[\"*\"]', NULL, NULL, '2025-12-27 10:06:51', '2025-12-27 10:06:51'),
(24, 'App\\Models\\User', 13, 'loyalty_app_token', '8bf485a9c53d8a74d229f02819530ce70119e6e78bac6f4ea1acd7ac44a6fe71', '[\"*\"]', NULL, NULL, '2026-01-03 00:32:13', '2026-01-03 00:32:13'),
(25, 'App\\Models\\User', 13, 'loyalty_app_token', '8e7c0379ea76ce26181a8f35d53612aacbf8120077623151a3c6dee7d807e271', '[\"*\"]', NULL, NULL, '2026-01-03 00:33:43', '2026-01-03 00:33:43'),
(26, 'App\\Models\\User', 13, 'loyalty_app_token', '1ed520aa3832060787bc51fe201f6b336ae6a07be5c2dcc938b805217f1b01ca', '[\"*\"]', NULL, NULL, '2026-01-05 00:50:08', '2026-01-05 00:50:08'),
(27, 'App\\Models\\User', 13, 'loyalty_app_token', '802755623a5d58c7f4fffc7431550996d8416c7bebe161e58b2b1d436945832e', '[\"*\"]', NULL, NULL, '2026-01-05 00:50:09', '2026-01-05 00:50:09'),
(28, 'App\\Models\\User', 13, 'loyalty_app_token', 'a5a20249e80cc8470dac80ff0611b2eac7ae2f038d197a7a381bf34346229aa7', '[\"*\"]', NULL, NULL, '2026-01-05 00:50:44', '2026-01-05 00:50:44'),
(29, 'App\\Models\\User', 13, 'loyalty_app_token', '8abd1c3bf10054b7e4895c93d953d8664e80ee530490495871ef2e4b189b4203', '[\"*\"]', NULL, NULL, '2026-01-05 00:52:13', '2026-01-05 00:52:13'),
(30, 'App\\Models\\User', 13, 'loyalty_app_token', 'ce844c8f9b1d0b95b34817a375ca39fdbd5a867cd01376f1ac416d3f686ea66e', '[\"*\"]', NULL, NULL, '2026-01-05 23:58:41', '2026-01-05 23:58:41'),
(31, 'App\\Models\\User', 13, 'loyalty_app_token', '0d88aab190bda342a49593a037df7914e8db3b36030284e9b66aafd7ade88c18', '[\"*\"]', NULL, NULL, '2026-01-06 00:02:20', '2026-01-06 00:02:20'),
(32, 'App\\Models\\User', 13, 'loyalty_app_token', 'ce1ba69d45d7566ac1c83f093b71798877d748459d1aa3d543d338105a78ca77', '[\"*\"]', NULL, NULL, '2026-01-06 00:15:53', '2026-01-06 00:15:53'),
(33, 'App\\Models\\User', 13, 'loyalty_app_token', '41d244d94e18ea4b1670cdee0cb7eafe28a0499b8bfd94705c51fce76d7ab8e5', '[\"*\"]', NULL, NULL, '2026-01-06 00:15:55', '2026-01-06 00:15:55'),
(34, 'App\\Models\\User', 13, 'loyalty_app_token', '88525c048f1c3e1501f46c745b0f3f9d6025cf39e07cbed04683767df7cfc474', '[\"*\"]', NULL, NULL, '2026-01-06 00:32:59', '2026-01-06 00:32:59'),
(35, 'App\\Models\\User', 13, 'loyalty_app_token', '61fa0612f093fe901ba233c2f36f4432f55f40dd4ea77c3e2fe69d09597ce8d3', '[\"*\"]', NULL, NULL, '2026-01-06 00:33:00', '2026-01-06 00:33:00'),
(36, 'App\\Models\\User', 13, 'loyalty_app_token', 'e89b6168a3501893b332b4f56dd0b1eb538316d00b58fb423bf6337e387c7c8a', '[\"*\"]', NULL, NULL, '2026-01-06 00:35:56', '2026-01-06 00:35:56'),
(37, 'App\\Models\\User', 13, 'loyalty_app_token', 'b7e283b3657e28aab973654ee05672f42adfd22a5f674e132474453ab3809ba7', '[\"*\"]', NULL, NULL, '2026-01-06 00:39:16', '2026-01-06 00:39:16'),
(38, 'App\\Models\\User', 13, 'loyalty_app_token', 'eb929c230b95fb75f7986b451802b57ace641a3fc74402053fc88d9931b142eb', '[\"*\"]', NULL, NULL, '2026-01-06 01:02:50', '2026-01-06 01:02:50'),
(39, 'App\\Models\\User', 13, 'loyalty_app_token', '075bc6023e10d3d6cd1bc28f4cd53ecc82654c9200c5177e6d4ebba148f28bae', '[\"*\"]', NULL, NULL, '2026-01-06 01:57:22', '2026-01-06 01:57:22'),
(40, 'App\\Models\\User', 13, 'loyalty_app_token', '1a2b16badf87d691aa4682ef8e443ae80623231509d013f7154bf1d577aeb545', '[\"*\"]', NULL, NULL, '2026-01-06 05:34:17', '2026-01-06 05:34:17'),
(41, 'App\\Models\\User', 13, 'loyalty_app_token', 'c5999dd5344755d2c2a8b03516ef7f1f008383a512330bb4da5e43defaa1ee38', '[\"*\"]', NULL, NULL, '2026-01-06 06:55:08', '2026-01-06 06:55:08'),
(42, 'App\\Models\\User', 13, 'loyalty_app_token', 'e34a3c5a7a46b7b8848da25cc83fa29bb88b863ac2c7cc1d2cc849acf72e6358', '[\"*\"]', NULL, NULL, '2026-01-06 07:01:38', '2026-01-06 07:01:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `description`, `price`, `image_url`, `category`, `created_at`, `updated_at`) VALUES
(1, 'Jahit Kemeja Formal Pria', 'kemeja-formal', 'Bahan katun premium, jahitan presisi. Cocok untuk kerja atau acara resmi.', 250000.00, 'https://www.atalon.id/cdn/shop/files/LIF_7038_NAVY.jpg?v=1712075389&width=1000', 'kemeja', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(2, 'Desain & Jahit Gaun Pesta', 'gaun-pesta', 'Wujudkan gaun impian Anda. Konsultasi desain gratis. Bahan brokat, satin, dll.', 800000.00, 'https://asset-a.grid.id/crop/0x0:0x0/x/photo/2023/08/21/vallinajpg-20230821023146.jpg', 'gaun', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(3, 'Sablon Kaos Komunitas', 'kaos-sablon', 'Minimal 12 pcs. Bahan Cotton Combed 30s. Sablon DTF atau Plastisol.', 85000.00, 'https://dagadu.co.id/cdn/shop/files/id-11134207-7rbk8-m73e223kjjexa5.jpg?v=1744257593&width=1445', 'kaos', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(4, 'Pembuatan Seragam Kantor', 'seragam-kantor', 'Kemeja PDH/PDL, wearpack, almamater. Termasuk bordir logo perusahaan.', 70000.00, 'https://werpak.id/wp-content/uploads/2022/12/Seragam-kerja-lapangan-wanita.jpg', 'seragam', '2025-12-15 17:52:13', '2026-01-07 08:26:54'),
(5, 'Jahit Kemeja Batik Custom', 'kemeja-batik', 'Jahit batik pria/wanita dengan furing atau tanpa furing. Model slim-fit modern.', 275000.00, 'https://www.elfs-shop.com/~img/kfbj_batik_katun_8f17007_bt_0-c93b8-3073_3214-t2494_81.webp', 'batik', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(6, 'Jasa Permak & Repair', 'permak', 'Potong celana, kecilkan pinggang, ganti ritsleting, dan perbaikan lainnya.', 20000.00, 'https://www.mokapos.com/blog/_next/image?url=http%3A%2F%2Fwp.mokapos.com%2Fwp-content%2Fuploads%2F2024%2F05%2F228203101_l_normal_none.jpg&w=1200&q=75', 'permak', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(7, 'baju spongebob', 'baju-spongebob', 'Baju colab dengan kartun spongebob edisi terbatas', 80000.00, 'https://images-cdn.ubuy.co.id/64d87bf495a1242edc09a738-spongebob-squarepants-face-adult-t-shirt.jpg', 'kaos', '2025-12-15 18:08:58', '2025-12-15 18:08:58');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
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
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2n4Z2plwb9iDOMrGfIP7wANm0o2ySvubbpHP2DTT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVlreW9LQjFsMG96b2E2M0hFMXE3aEpNUEpqZUgwS1FZaFFWaFAzQyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767702767),
('7PLbUaXjq6BXCPyiY2v1bVlzpoTKlX8c8NxzgF1f', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiM2RnTUdwcVdxeEp5WXdIbFZDb1ZHTXB3OXphZ1dHMjJmN2FyUjByUyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rZXJhbmphbmcvZGF0YSI7czo1OiJyb3V0ZSI7czoxNDoia2VyYW5qYW5nLmRhdGEiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMzt9', 1767707022),
('B1FCBsfJuEUH1c9omWnJsqh7VU4O2JLxpEaCkUfZ', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoidnNwUWNNTXdJTE1yVkVFb0kySWFDTXA3OVlXclQ4NGRTdTFlQXlWYSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO3M6NToicm91dGUiO3M6MTQ6ImtlcmFuamFuZy5kYXRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7fQ==', 1767799615),
('fy2BwGNwBpgBVilEocFaiOe5ltGA93yozgJfDr9S', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoibVJLTmwwNU1LQ3hneU9IS3RMcXZ5UjFsZXhpWFBlUE9jUEdOVEhncSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767799534),
('gcnpxxxkMN64FREmzDAt5pyQ3sOFeY9UPYNv0naS', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTU1VUTZyVmdzY29NbVlta3lobmNtY0lhMkJ4d3R4cGFSaXZIQW1XMCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rZXJhbmphbmcvZGF0YSI7czo1OiJyb3V0ZSI7czoxNDoia2VyYW5qYW5nLmRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMzt9', 1767707642),
('h3Kcwgl7DLLS3m9NEhWLmFXMSxVEvOSNilTKUlHu', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiYWhDc0lYTzNxUEQ2a0ZZdkFJUkFSSTFtS3NocjlCMnF1Q3hERDBkdiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozODoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Blc2FuYW4vMTYiO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozODoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Blc2FuYW4vMTYiO3M6NToicm91dGUiO3M6MTg6ImFkbWluLnBlc2FuYW4uc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767799536),
('jbrGbN7TV6PZ1MOkvkZsXzjYf8rkbq7Dplzko9Oy', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiVzJabjVJcXdvd1VwQ3RETnJOdGpmZjZxam1zYU1nMlpUOFhhbmpXQiI7czo3OiJsb3lhbHR5IjthOjE6e3M6ODoiY2FsbGJhY2siO3M6NDI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb3lhbHR5L3Nzby9jYWxsYmFjayI7fXM6MzoidXJsIjthOjE6e3M6ODoiaW50ZW5kZWQiO3M6MTA1OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbG95YWx0eS9hdXRob3JpemU/Y2FsbGJhY2s9aHR0cCUzQSUyRiUyRjEyNy4wLjAuMSUzQTgwMDElMkZsb3lhbHR5JTJGc3NvJTJGY2FsbGJhY2siO31zOjk6Il9wcmV2aW91cyI7YToyOntzOjM6InVybCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2tlcmFuamFuZy9kYXRhIjtzOjU6InJvdXRlIjtzOjE0OiJrZXJhbmphbmcuZGF0YSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEzO30=', 1767708056),
('LntbvkmDE2ShjeP7mmR2HwcqvBiesd074tlmNfhW', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiemMwcnVpYkJaR0owcVg0MlR2QlVEekMwd0hVeDJvb3VXWGpVS1VWRSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rZXJhbmphbmcvZGF0YSI7czo1OiJyb3V0ZSI7czoxNDoia2VyYW5qYW5nLmRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMzt9', 1767702864),
('MP4c2wuUG8mH7EqyeaA7PzFrUwDQHAvZBtibvmjX', 13, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaWtrWWpOWFRDcllmNWU2UXBaUEJzQ2dPNVIxZGFxNm51YlZMUTM3ciI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rZXJhbmphbmcvZGF0YSI7czo1OiJyb3V0ZSI7czoxNDoia2VyYW5qYW5nLmRhdGEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxMzt9', 1767799161),
('nRcSAGxVuWvHjnAqRDYHSrBLzx7UzdMttaKD62LE', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUzhjUmVPRVc1OHA3aGpqVXFUeEpocmE3TVJBcWs2a3QxRkxjeG94eiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rZXJhbmphbmcvZGF0YSI7czo1OiJyb3V0ZSI7czoxNDoia2VyYW5qYW5nLmRhdGEiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxNDt9', 1767799279),
('uel7KDa4GdSUvOSkjWqDkp7FkLMKzJE9CznlS9s2', 14, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWm5Td2ZBTVpORkdjdjg1ZzNrbG4xVnhqOFZLWmZ5dTVjMkxRWkw3bCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAva2VyYW5qYW5nL2RhdGEiO3M6NToicm91dGUiO3M6MTQ6ImtlcmFuamFuZy5kYXRhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7fQ==', 1767799363),
('wWxgA5F92HIBPnJu7hNnKAOofkDg7wp5doLLZMS4', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTBsRXdSNEJRN1BweDViTzdWMVdKRTBKSUZHemtIYndJQXdLc1g5SyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1767702766),
('YYqEwLDHoiVDMxKoDHCIxrPGOuw3klsxrdY6d3wZ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiek9aajdMQXpzaTdRSUVhaXhBTUdFNGZyM2FhUU52TjlSa2pNSVJYUSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2tlcmFuamFuZy9kYXRhIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1767702784);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `google_id` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `is_admin`, `google_id`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$nOggkZ9Bo19nmZhkCGdeuuw6k4gRqpTMEt7VNPfyvWzJJFSDoaEMG', 1, NULL, NULL, NULL, '2025-12-15 17:52:11', '2025-12-15 17:52:11'),
(2, 'Vanya Tira Usamah S.I.Kom', 'icha.lazuardi@example.org', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, '3CWxGPUxxS', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(3, 'Abyasa Latupono', 'purwanto.pradana@example.net', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'AkhzHMTmcu', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(4, 'Pranawa Kurniawan', 'vsihombing@example.org', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'egfXH85Qsc', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(5, 'Gamani Lasmono Budiyanto S.Pd', 'cnarpati@example.org', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'U2c0OSHUYO', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(6, 'Najib Siregar', 'banawa67@example.com', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'CbL22VrQIS', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(7, 'Ika Ida Puspita', 'kamaria.pranowo@example.net', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'bx3qZZcvzZ', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(8, 'Lala Lailasari', 'laksmiwati.rachel@example.net', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'J4jCGrnKFW', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(9, 'Aris Widodo', 'irma28@example.org', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'rEG1q7g8aM', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(10, 'Hilda Lailasari', 'karen92@example.net', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, '3q7ZyJVAU1', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(11, 'Kayla Agustina', 'wahyudin.gatra@example.com', '2025-12-15 17:52:13', '$2y$12$HuAG93mxmnULG6GhlGmBoeapWZ3B8t4NejY.Vxe2Lg/heh42i7f/O', 0, NULL, NULL, 'hjj8SoXBmv', '2025-12-15 17:52:13', '2025-12-15 17:52:13'),
(13, 'messi', 'messi12@gmail.com', NULL, '$2y$12$APX6qgzKt7O/TryXmQ1A1.pc4kRf.ljVA7A/b1pucdbUwXp5EUC7u', 0, NULL, NULL, NULL, '2025-12-15 17:55:33', '2025-12-15 17:55:33'),
(14, 'admin', 'admin12@gmail.com', NULL, '$2y$12$hYIvMLC444MmUzKfCZ3R4uh5gdceP0HtYqXq4diMTO9u62QwqiILC', 1, NULL, NULL, 'uHf4HQjwAvCxpEhPz6Upxc2JdStqSvdanr8UCHlxhyC0wXsAOAjZeatWXn7u', '2025-12-15 18:05:27', '2025-12-15 18:05:27');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_product_id_foreign` (`product_id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indeks untuk tabel `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_google_id_unique` (`google_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT untuk tabel `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
