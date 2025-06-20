-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 20 Jun 2025 pada 10.09
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
-- Database: `lms_angkatan_2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `instructors`
--

CREATE TABLE `instructors` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `education` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instructors`
--

INSERT INTO `instructors` (`id`, `id_role`, `name`, `gender`, `education`, `phone`, `email`, `password`, `address`, `created_at`, `updated_at`) VALUES
(6, 5, 'Alpha', 0, 'master', '868686868', 'alpha@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jakarta', '2025-06-04 08:14:12', '2025-06-11 01:57:29'),
(7, 5, 'Bravo', 1, 'PhD', '01928374', 'bravo@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Bandung', '2025-06-04 08:14:34', '2025-06-11 01:57:43'),
(8, 5, 'Charlie', 0, 'Master', '12121212', 'charlie@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Kutai', '2025-06-04 08:14:56', '2025-06-11 01:57:55'),
(9, 5, 'Delta', 1, 'PhD', '4747474774', 'delta@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Denpasar', '2025-06-05 02:29:35', '2025-06-11 01:58:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `instructor_major`
--

CREATE TABLE `instructor_major` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `instructor_major`
--

INSERT INTO `instructor_major` (`id`, `id_major`, `id_instructor`, `created_at`, `updated_at`) VALUES
(1, 4, 5, '2025-06-04 06:38:04', NULL),
(2, 4, 5, '2025-06-04 06:44:20', NULL),
(27, 4, 7, '2025-06-05 02:21:01', NULL),
(29, 4, 6, '2025-06-05 02:23:39', NULL),
(30, 2, 8, '2025-06-05 02:25:46', NULL),
(31, 4, 9, '2025-06-05 02:29:47', NULL),
(32, 2, 9, '2025-06-05 02:29:52', NULL),
(33, 7, 9, '2025-06-05 02:29:55', '2025-06-05 02:44:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `majors`
--

CREATE TABLE `majors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `majors`
--

INSERT INTO `majors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Economics', '2025-06-04 02:38:36', '2025-06-04 02:38:36'),
(2, 'Marketing', '2025-06-04 02:38:09', NULL),
(4, 'English', '2025-06-04 02:38:19', NULL),
(5, 'Hospitality', '2025-06-04 02:38:29', NULL),
(7, 'Korean', '2025-06-04 02:39:30', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `parent_id` int(5) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(50) DEFAULT NULL,
  `urutan` int(5) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menus`
--

INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `url`, `urutan`, `created_at`, `updated_at`) VALUES
(3, 0, 'Master Data', 'bi bi-menu-button-wide', '', 2, '2025-06-11 04:38:24', NULL),
(4, 3, 'Instructor', 'bi bi-menu-button-wide', 'instructor', 1, '2025-06-11 05:35:33', NULL),
(5, 3, 'Major', 'bi bi-book', 'major', 2, '2025-06-11 07:02:43', NULL),
(6, 3, 'Menu', 'bi bi-book', 'menu', 3, '2025-06-11 07:03:10', NULL),
(8, 3, 'Role', 'bi bi-book', 'role', 5, '2025-06-11 07:03:51', NULL),
(9, 0, 'Dashboard', 'bi bi-menu-button-wide', 'home.php', 1, '2025-06-12 02:05:19', NULL),
(10, 3, 'User', 'bi bi-circle', 'user', 4, '2025-06-12 02:27:17', NULL),
(11, 0, 'Moduls', 'bi bi-book', '?page=moduls', 3, '2025-06-12 02:38:30', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_roles`
--

CREATE TABLE `menu_roles` (
  `id` int(11) NOT NULL,
  `id_roles` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu_roles`
--

INSERT INTO `menu_roles` (`id`, `id_roles`, `id_menu`, `created_at`, `updated_at`) VALUES
(1, 5, 9, '2025-06-12 07:41:13', NULL),
(2, 5, 3, '2025-06-12 07:41:13', NULL),
(3, 5, 4, '2025-06-12 07:41:13', NULL),
(4, 5, 5, '2025-06-12 07:41:13', NULL),
(5, 5, 6, '2025-06-12 07:41:13', NULL),
(6, 5, 10, '2025-06-12 07:41:13', NULL),
(7, 5, 8, '2025-06-12 07:41:13', NULL),
(8, 5, 11, '2025-06-12 07:41:13', NULL),
(15, 7, 9, '2025-06-12 07:41:42', NULL),
(16, 7, 11, '2025-06-12 07:41:42', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls`
--

CREATE TABLE `moduls` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `id_instructor` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `moduls`
--

INSERT INTO `moduls` (`id`, `id_major`, `id_instructor`, `name`, `created_at`, `updated_at`) VALUES
(13, 4, 9, 'intan', '2025-06-10 05:10:47', NULL),
(14, 2, 9, 'Abroor Rizky', '2025-06-10 05:11:33', NULL),
(15, 7, 9, 'kiki', '2025-06-10 07:24:47', NULL),
(16, 2, 8, 'haha', '2025-06-10 07:32:20', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `moduls_details`
--

CREATE TABLE `moduls_details` (
  `id` int(11) NOT NULL,
  `id_modul` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `moduls_details`
--

INSERT INTO `moduls_details` (`id`, `id_modul`, `file`, `created_at`, `updated_at`) VALUES
(1, 14, '6847be85be9ca-ava.jpg', '2025-06-10 05:11:33', NULL),
(2, 15, '6847ddbfc7cc2-sinchan1.jpg', '2025-06-10 07:24:47', NULL),
(3, 16, '6847df847119d-desert-Twilight.png', '2025-06-10 07:32:20', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'PIC', '2025-06-04 02:27:55', NULL),
(2, 'Admin', '2025-06-04 02:37:44', NULL),
(3, 'Helper', '2025-06-04 02:37:50', NULL),
(5, 'Instructor', '2025-06-04 02:56:35', NULL),
(6, 'Leader', '2025-06-04 02:56:53', NULL),
(7, 'Students', '2025-06-11 01:22:18', '2025-06-12 02:26:16');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `id_major` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `education` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `id_major`, `name`, `gender`, `education`, `phone`, `email`, `password`, `address`, `created_at`, `updated_at`) VALUES
(6, 4, 'Alpha', 0, 'master', '868686868686', 'alpha1@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Jakarta', '2025-06-04 08:14:12', '2025-06-10 07:43:23'),
(7, 4, 'Bravo', 1, 'PhD', '0192837465', 'bravo2@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Bandung', '2025-06-04 08:14:34', '2025-06-10 07:47:10'),
(8, 4, 'Charlie', 0, 'Master', '1212121212', 'charlie3@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Semarang', '2025-06-04 08:14:56', '2025-06-10 07:47:19'),
(9, 4, 'Delta', 1, 'PhD', '4747474774', 'delta4@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Denpasar', '2025-06-05 02:29:35', '2025-06-10 07:47:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `deleted_at` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '7c222fb2927d828af22f592134e8932480637c0d', '2025-06-03 02:51:27', '2025-06-10 03:21:16', 1),
(2, 'Jamal', 'jamal@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '2025-06-03 07:25:29', '2025-06-03 07:39:28', 1),
(3, 'Jaka', 'jaka@gmail.com', '46b30b07285d332913a25970522a3ccab0f2d97e', '2025-06-03 07:40:07', '2025-06-04 02:54:41', 0),
(4, 'siti', 'siti@gmail.com', '1c2441d43c1bed311da02828d833d2c7a859d72f', '2025-06-03 07:40:23', '2025-06-04 02:54:50', 1),
(5, 'Siti', 'siti2@gmail.com', '1c2441d43c1bed311da02828d833d2c7a859d72f', '2025-06-03 07:54:34', '2025-06-04 02:55:10', 0),
(6, 'john', 'john@gmail.com', '31f51faebeaafcb546721a7bd012db57b5434992', '2025-06-04 01:52:17', '2025-06-04 02:55:22', 1),
(7, 'Ahan', 'ahan@gmail.com', '8f218cbd944449308d8b3bd2ad8a0460b171bb9c', '2025-06-04 02:43:01', '2025-06-04 02:55:30', 1),
(8, 'Amel', 'amel@gmail.com', 'c6d635bda175ddecc8b5d468fff89d3ad2f1b42f', '2025-06-04 02:53:55', NULL, 0),
(9, 'Budi', 'budi@gmail.com', '30a96cdbc1205b1ed4ae399350fe8f6d839f32cc', '2025-06-04 02:54:20', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `instructor_major`
--
ALTER TABLE `instructor_major`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `majors`
--
ALTER TABLE `majors`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `moduls`
--
ALTER TABLE `moduls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `moduls_details`
--
ALTER TABLE `moduls_details`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `instructors`
--
ALTER TABLE `instructors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `instructor_major`
--
ALTER TABLE `instructor_major`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT untuk tabel `majors`
--
ALTER TABLE `majors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `menu_roles`
--
ALTER TABLE `menu_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `moduls`
--
ALTER TABLE `moduls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `moduls_details`
--
ALTER TABLE `moduls_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
