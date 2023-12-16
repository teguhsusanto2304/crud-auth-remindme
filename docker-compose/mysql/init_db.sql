-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table reminderme_db.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table reminderme_db.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.migrations: ~5 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2023_12_12_092505_create_reminders_table', 2);

-- Dumping structure for table reminderme_db.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table reminderme_db.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.personal_access_tokens: ~21 rows (approximately)
INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 1, 'api', '170bc27f75034b51ab3f520edcb8fec5af71996d43f090e7a562d6c42e9fa59c', '["*"]', NULL, NULL, '2023-12-11 20:04:11', '2023-12-11 20:04:11'),
	(2, 'App\\Models\\User', 1, 'api', '18f5b11645aeb0b35c943a864dd136c3bfc12d482cd38ec3cef86064c2e0edb2', '["*"]', NULL, NULL, '2023-12-11 20:05:10', '2023-12-11 20:05:10'),
	(3, 'App\\Models\\User', 1, 'api', '3c239e4f7148aebef672debce134faa8ee542ed854d164847471e96b0de05bdc', '["*"]', NULL, NULL, '2023-12-11 20:05:26', '2023-12-11 20:05:26'),
	(4, 'App\\Models\\User', 1, 'api', '86e539d92f724eba991788f198941218872d6152bf2571f55d7ec6bbdf0da8dd', '["*"]', NULL, NULL, '2023-12-11 20:06:32', '2023-12-11 20:06:32'),
	(5, 'App\\Models\\User', 1, 'api', 'c131c6e3498bf7cefcd9e6fa42e9f7632bb830e92c01fff0b9a7f0af04254b7a', '["*"]', NULL, NULL, '2023-12-11 20:18:33', '2023-12-11 20:18:33'),
	(6, 'App\\Models\\User', 1, 'api', 'f99dcff552494f4c83cd3d956790be4683396ba425d5891848b6d4d27769138c', '["*"]', NULL, NULL, '2023-12-11 20:22:21', '2023-12-11 20:22:21'),
	(7, 'App\\Models\\User', 1, 'access_token', '1e8d95b98b84fbf2a1d8bdd7e843d191fb41cfc0c40c9490770885e72c467f76', '["access-api"]', NULL, '2023-12-11 20:51:22', '2023-12-11 20:51:23', '2023-12-11 20:51:23'),
	(8, 'App\\Models\\User', 1, 'refresh_token', 'cc35445bfa63df534482a343f59c155c03106a627416d7038ae92f75e883ab97', '["issue-access-token"]', NULL, '2023-12-11 20:51:22', '2023-12-11 20:51:23', '2023-12-11 20:51:23'),
	(9, 'App\\Models\\User', 1, 'access_token', '44a6da588d7b6989f5558c32ed2bbe9c0576635b6d7bedde554758daaba6a548', '["access-api"]', NULL, '2023-12-11 21:10:30', '2023-12-11 21:10:30', '2023-12-11 21:10:30'),
	(10, 'App\\Models\\User', 1, 'refresh_token', '2fd9b6c8f5f8aec9b321acbffd3edd9c94af383e27b16862d0e86bd659ffe405', '["issue-access-token"]', NULL, '2023-12-11 21:10:30', '2023-12-11 21:10:30', '2023-12-11 21:10:30'),
	(11, 'App\\Models\\User', 1, 'access_token', '501ff27be1e1c03c0a28b6c9028979b7d68bf7a26807d746eb1495deadd6989e', '["access-api"]', NULL, '2023-12-11 21:15:16', '2023-12-11 21:15:16', '2023-12-11 21:15:16'),
	(12, 'App\\Models\\User', 1, 'refresh_token', 'f090b919183c535ab73988a867c91751878dac5e5f3209e75de7574c54285d0c', '["issue-access-token"]', NULL, '2023-12-11 21:15:16', '2023-12-11 21:15:16', '2023-12-11 21:15:16'),
	(13, 'App\\Models\\User', 1, 'access_token', '02118dc98c0fb7201d49c7344536ad2bd1409462069961e43900603efae5c3d8', '["access-api"]', NULL, '2023-12-12 00:37:48', '2023-12-12 00:37:48', '2023-12-12 00:37:48'),
	(14, 'App\\Models\\User', 1, 'refresh_token', '47656f1c96d663d46d001d33463315c6a6c8d9766670b7ca0e6ef681fb93547c', '["issue-access-token"]', NULL, '2023-12-12 00:37:48', '2023-12-12 00:37:48', '2023-12-12 00:37:48'),
	(15, 'App\\Models\\User', 1, 'access_token', '47a6ccc99a56c90d323938be1de79c4ae11f3fb21d4eb60b4aea27c4419359ba', '["access-api"]', NULL, '2023-12-12 01:07:21', '2023-12-12 01:07:21', '2023-12-12 01:07:21'),
	(16, 'App\\Models\\User', 1, 'refresh_token', 'c1782ac86970cb3919f610a24141a017fc3266c80711100b2f73c33c9033cc19', '["issue-access-token"]', NULL, '2023-12-12 01:07:21', '2023-12-12 01:07:21', '2023-12-12 01:07:21'),
	(17, 'App\\Models\\User', 2, 'access_token', 'af674722558e0491718be0df0a687aa42f3429af2f59fa7fe81e756a4dbf82d8', '["access-api"]', NULL, '2023-12-12 02:11:42', '2023-12-12 02:11:42', '2023-12-12 02:11:42'),
	(18, 'App\\Models\\User', 2, 'refresh_token', '7aa445f0109070922539f4839f786bc1d06a963d4d8a319df620f7a485b3f236', '["issue-access-token"]', NULL, '2023-12-12 02:11:42', '2023-12-12 02:11:42', '2023-12-12 02:11:42'),
	(19, 'App\\Models\\User', 2, 'access_token', '23b85c1fc06278b89d99b443c3353063fd641d0ce2343373d75a00d3098da1ed', '["access-api"]', NULL, '2023-12-12 02:15:56', '2023-12-12 02:15:56', '2023-12-12 02:15:56'),
	(20, 'App\\Models\\User', 2, 'access_token', '77956db0efdaef826758d30eb694ed7df0a4859cc6900da5466979d88355339c', '["access-api"]', NULL, '2023-12-12 02:20:26', '2023-12-12 02:20:26', '2023-12-12 02:20:26'),
	(21, 'App\\Models\\User', 2, 'access_token', 'ad0089a5aec2f124140f0f5e19000d87ecf0126de7a634e1f217f5ffbba7ca60', '["access-api"]', NULL, '2023-12-12 02:21:17', '2023-12-12 02:21:17', '2023-12-12 02:21:17'),
	(22, 'App\\Models\\User', 2, 'access_token', 'f87a2a79bad63f14d09db228a345dd981394cd41503891ce7efbfff0ad724877', '["access-api"]', NULL, '2023-12-12 02:34:51', '2023-12-12 02:34:51', '2023-12-12 02:34:51'),
	(23, 'App\\Models\\User', 2, 'access_token', '2ccb4f4bbede9d603ff6a5a72a120dd651f6f1374e2fe5a4b4042352598f1848', '["access-api"]', NULL, '2023-12-12 02:35:02', '2023-12-12 02:35:02', '2023-12-12 02:35:02'),
	(24, 'App\\Models\\User', 2, 'access_token', '1183d3def4632f13110b94277f228dd64ece7b92f6629558a940e8ca8764fa1d', '["access-api"]', NULL, '2023-12-12 04:23:48', '2023-12-12 03:23:48', '2023-12-12 03:23:48'),
	(25, 'App\\Models\\User', 2, 'access_token', '8e5e84f96a23ae41ced7b8bbdfba92d3280c8be2317c98851e0afa993682a971', '["access-api"]', NULL, '2023-12-12 22:39:29', '2023-12-12 21:39:29', '2023-12-12 21:39:29'),
	(26, 'App\\Models\\User', 2, 'access_token', '3e319a37cd82a0db1eee3a7ab2ffe3e2d6568522ff7de0978015415ca2d020c0', '["access-api"]', NULL, '2023-12-13 21:01:21', '2023-12-13 20:01:21', '2023-12-13 20:01:21');

-- Dumping structure for table reminderme_db.reminders
CREATE TABLE IF NOT EXISTS `reminders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remind_at` bigint NOT NULL DEFAULT '0',
  `event_at` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.reminders: ~2 rows (approximately)
INSERT INTO `reminders` (`id`, `title`, `description`, `remind_at`, `event_at`, `created_at`, `updated_at`) VALUES
	(1, 'testing teguh', 'deskripsinya teguh', 1701246722, 1701246722, '2023-12-14 02:16:26', '2023-12-14 02:45:08'),
	(2, 'testing', 'deskripsinya', 1701246722, 1701246722, '2023-12-14 02:18:32', '2023-12-14 02:18:32');

-- Dumping structure for table reminderme_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table reminderme_db.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Alicia', 'alice@mail.com', NULL, '$2y$12$bZjVo7ThKuGD7ElWTt88zuMFfDR8VFpJD6XFEYhaOvLweW/VQ64AC', NULL, '2023-12-11 19:58:03', '2023-12-11 19:58:03'),
	(2, 'Bob', 'bob@mail.com', NULL, '$2y$12$iRmZXNwfO7wbJ9CyOrH0bus.OpgoFl5w8udMWhrDtip5ZsYfSR0ne', NULL, '2023-12-11 19:58:04', '2023-12-11 19:58:04');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
