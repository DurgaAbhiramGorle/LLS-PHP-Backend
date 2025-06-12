-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 02, 2025 at 02:58 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydatabase`
--

-- --------------------------------------------------------

--
-- Table structure for table `course_parts`
--

CREATE TABLE `course_parts` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_parts`
--

INSERT INTO `course_parts` (`id`, `name`) VALUES
(1, 'part1'),
(2, 'part2');

-- --------------------------------------------------------

--
-- Table structure for table `course_sections`
--

CREATE TABLE `course_sections` (
  `id` int NOT NULL,
  `part_id` int DEFAULT NULL,
  `section_code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `order_index` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `course_sections`
--

INSERT INTO `course_sections` (`id`, `part_id`, `section_code`, `title`, `order_index`) VALUES
(1, 1, 'introduction1', 'Introduction', 1),
(2, 1, 'critical-eliteracy', 'Critical eHealth Literacy', 2),
(3, 1, 'marcosStory-chapter1', 'Marcos Story Chapter 1', 3),
(4, 1, 'hope-activity', 'Hope Activity', 4),
(5, 1, 'communicative-literacy', 'Communicative eHealth Literacy', 5),
(6, 1, 'marcosStory-chapter2', 'Marcos Story Chapter 2', 6),
(7, 1, 'clinical-literacy', 'Clinical eHealth Literacy', 7),
(8, 1, 'marcosStory-chapter3', 'Marcos Story Chapter 3', 8),
(9, 1, 'communication-with-doctors', 'Communication with Doctors', 9),
(10, 1, 'paces-introduction', 'PACES Introduction', 10),
(11, 1, 'p-present', 'P: Present Information', 11),
(12, 1, 'p-ask', 'A: Ask Questions', 12),
(13, 1, 'p-clarify', 'C: Check Understanding', 13),
(14, 1, 'p-express', 'E: Express Concerns', 14),
(15, 1, 'p-state', 'S: State Preferences', 15),
(16, 2, 'introduction2', 'Introduction', 1),
(17, 2, 'connecting-meeting', 'Connecting to Meaning', 2),
(18, 2, 'caregivers-stories1', 'Caregivers Stories', 3),
(19, 2, 'reflection-activity1', 'Reflection Activity', 4),
(20, 2, 'strengthening-family', 'Strengthening Family Bonds', 5),
(21, 2, 'caregivers-stories2', 'Caregivers Stories', 6),
(22, 2, 'reflection-activity2', 'Reflection Activity', 7),
(23, 2, 'challenges-communication', 'Challenges and Communication Skills', 8),
(24, 2, 'caregivers-stories3', 'Caregivers Stories', 9),
(25, 2, 'strategies-activity', 'Strategies Activity', 10),
(26, 2, 'practicing-skills', 'Practicing Skills', 11),
(27, 2, 'relational-intimacy', 'Relational Intimacy', 12),
(28, 2, 'future-uncertainty', 'Future Uncertainty and Mortality', 13),
(29, 2, 'distressing-emotions', 'Distressing Emotions and Concerns', 14),
(30, 2, 'conclusion', 'Conclusion', 15);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `name` varchar(256) DEFAULT NULL,
  `relation_to_patient` varchar(256) DEFAULT NULL,
  `location` varchar(256) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `total_time_spent` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `password`, `name`, `relation_to_patient`, `location`, `created_at`, `last_logged_in`, `total_time_spent`) VALUES
('test@example.com', '$2y$10$9v0xq4huJG0eMJw.6honA.Ucy5S/dKUF/qHZvc01KP6H6ge.axKGO', 'testing', 'Spouse', 'Gainesville', '2025-05-13 18:18:14', NULL, NULL),
('testing@gmail.com', '$2y$10$y51Jsh6aSez5qrLbBLWunO8DaJyYmeyeBRp.hhJdwx05oAczC7bZq', 'testingsfsa', 'spouse', 'Gainesville', '2025-05-21 17:35:22', '2025-05-28 19:10:10', NULL),
('testing1234@gmail.com', '$2y$10$Wy22OfauazzaYnEyBgEUr.wHSWjA4xZ6FpvCMLL2hvlUwV893xG8u', 'testing1234', 'spouse', 'canses', '2025-05-22 17:05:42', '2025-05-28 15:21:05', NULL),
('testt@example.com', '$2a$10$qC714g5bzySKUg1hqFPz5OBTzterzS2uc4XAzxd520C80tAkhklbq', NULL, NULL, NULL, '2025-05-13 18:11:40', NULL, NULL),
('tuser11@example.com', '$2y$10$EN74SXYpTSCnl6fYus5T1OL2OT6eq2vnc7mwlMAxsHOgJEmsypomm', 'user11', 'Spouse', 'Gainesville', '2025-05-28 15:24:19', '2025-05-28 15:25:38', NULL),
('user1@example.com', 'password1', 'User One', 'spouse', 'Location1', '2025-04-29 04:00:00', '2025-04-30 04:00:00', NULL),
('user10@example.com', 'password10', 'User Ten', 'spouse', 'Location10', '2025-05-26 04:00:00', '2025-05-27 04:00:00', NULL),
('user2@example.com', 'password2', 'User Two', 'spouse', 'Location2', '2025-05-02 04:00:00', '2025-05-03 04:00:00', NULL),
('user3@example.com', 'password3', 'User Three', 'spouse', 'Location3', '2025-05-05 04:00:00', '2025-05-06 04:00:00', NULL),
('user4@example.com', 'password4', 'User Four', 'spouse', 'Location4', '2025-05-08 04:00:00', '2025-05-09 04:00:00', NULL),
('user5@example.com', 'password5', 'User Five', 'spouse', 'Location5', '2025-05-11 04:00:00', '2025-05-12 04:00:00', NULL),
('user6@example.com', 'password6', 'User Six', 'spouse', 'Location6', '2025-05-14 04:00:00', '2025-05-15 04:00:00', NULL),
('user7@example.com', 'password7', 'User Seven', 'spouse', 'Location7', '2025-05-17 04:00:00', '2025-05-18 04:00:00', NULL),
('user8@example.com', 'password8', 'User Eight', 'spouse', 'Location8', '2025-05-20 04:00:00', '2025-05-21 04:00:00', NULL),
('user9@example.com', 'password9', 'User Nine', 'spouse', 'Location9', '2025-05-23 04:00:00', '2025-05-24 04:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_part_status`
--

CREATE TABLE `user_part_status` (
  `user_email` varchar(256) NOT NULL,
  `part_id` int NOT NULL,
  `last_section_id` int DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT '0',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_part_status`
--

INSERT INTO `user_part_status` (`user_email`, `part_id`, `last_section_id`, `is_completed`, `updated_at`) VALUES
('testing@gmail.com', 1, 15, 1, '2025-05-29 20:13:21'),
('testing@gmail.com', 2, 29, 1, '2025-05-29 20:13:32'),
('testing1234@gmail.com', 1, 15, 1, '2025-05-22 18:00:07'),
('testing1234@gmail.com', 2, 30, 1, '2025-05-28 15:22:18'),
('tuser11@example.com', 1, 15, 1, '2025-05-28 15:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `id` int NOT NULL,
  `user_email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `section_id` int NOT NULL,
  `started_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `completed_at` timestamp NULL DEFAULT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_progress`
--

INSERT INTO `user_progress` (`id`, `user_email`, `section_id`, `started_at`, `completed_at`, `is_completed`) VALUES
(57, 'testing1234@gmail.com', 1, '2025-05-22 17:50:37', '2025-05-22 17:50:37', 1),
(58, 'testing1234@gmail.com', 2, '2025-05-22 17:50:37', '2025-05-22 17:50:37', 1),
(59, 'testing1234@gmail.com', 3, '2025-05-22 17:50:37', '2025-05-22 17:50:39', 1),
(60, 'testing1234@gmail.com', 4, '2025-05-22 17:50:39', '2025-05-22 17:50:40', 1),
(61, 'testing1234@gmail.com', 5, '2025-05-22 17:50:40', '2025-05-22 17:50:41', 1),
(62, 'testing1234@gmail.com', 6, '2025-05-22 17:50:41', '2025-05-22 17:59:59', 1),
(63, 'testing1234@gmail.com', 12, '2025-05-22 17:57:19', '2025-05-22 18:00:04', 1),
(67, 'testing1234@gmail.com', 7, '2025-05-22 17:59:59', '2025-05-22 18:00:00', 1),
(68, 'testing1234@gmail.com', 8, '2025-05-22 18:00:00', '2025-05-22 18:00:01', 1),
(69, 'testing1234@gmail.com', 9, '2025-05-22 18:00:01', '2025-05-22 18:00:02', 1),
(70, 'testing1234@gmail.com', 10, '2025-05-22 18:00:02', '2025-05-22 18:00:03', 1),
(71, 'testing1234@gmail.com', 11, '2025-05-22 18:00:03', '2025-05-22 18:00:03', 1),
(72, 'testing1234@gmail.com', 12, '2025-05-22 18:00:03', '2025-05-22 18:00:04', 1),
(73, 'testing1234@gmail.com', 13, '2025-05-22 18:00:04', '2025-05-22 18:00:04', 1),
(76, 'testing@gmail.com', 1, '2025-05-22 18:58:23', '2025-05-29 18:53:19', 1),
(77, 'testing@gmail.com', 2, '2025-05-22 18:58:23', '2025-05-29 18:54:38', 1),
(78, 'testing@gmail.com', 3, '2025-05-22 18:58:25', '2025-05-29 18:54:39', 1),
(79, 'testing@gmail.com', 4, '2025-05-22 18:58:26', '2025-05-29 18:59:14', 1),
(80, 'testing@gmail.com', 5, '2025-05-22 18:58:27', '2025-05-29 19:54:12', 1),
(81, 'testing@gmail.com', 6, '2025-05-22 19:00:23', '2025-05-29 20:13:13', 1),
(82, 'testing@gmail.com', 7, '2025-05-22 19:00:25', '2025-05-29 20:13:14', 1),
(83, 'testing@gmail.com', 8, '2025-05-22 19:28:12', '2025-05-29 20:13:15', 1),
(84, 'testing@gmail.com', 16, '2025-05-27 17:57:48', '2025-05-29 20:13:28', 1),
(85, 'testing@gmail.com', 17, '2025-05-27 17:57:48', '2025-05-29 20:13:28', 1),
(86, 'testing@gmail.com', 18, '2025-05-27 17:57:49', '2025-05-29 20:13:29', 1),
(87, 'testing@gmail.com', 19, '2025-05-27 17:57:51', '2025-05-29 20:13:30', 1),
(88, 'testing@gmail.com', 20, '2025-05-27 17:57:52', '2025-05-29 20:13:30', 1),
(89, 'testing@gmail.com', 21, '2025-05-27 17:57:53', '2025-05-29 20:13:30', 1),
(90, 'testing@gmail.com', 22, '2025-05-27 17:57:54', '2025-05-29 20:13:31', 1),
(91, 'testing@gmail.com', 23, '2025-05-27 17:59:52', '2025-05-29 20:13:31', 1),
(93, 'testing@gmail.com', 9, '2025-05-27 18:00:04', '2025-05-29 20:13:16', 1),
(94, 'testing@gmail.com', 10, '2025-05-27 18:00:05', '2025-05-29 20:13:17', 1),
(95, 'testing@gmail.com', 11, '2025-05-27 18:00:05', '2025-05-29 20:13:17', 1),
(96, 'testing@gmail.com', 12, '2025-05-27 18:00:06', '2025-05-29 20:13:18', 1),
(97, 'testing@gmail.com', 13, '2025-05-27 18:00:06', '2025-05-29 20:13:19', 1),
(98, 'testing@gmail.com', 14, '2025-05-27 18:00:07', '2025-05-29 20:13:19', 1),
(99, 'testing@gmail.com', 15, '2025-05-27 18:00:08', '2025-05-29 20:13:21', 1),
(100, 'testing@gmail.com', 25, '2025-05-28 14:39:39', '2025-05-29 20:13:31', 1),
(101, 'testing@gmail.com', 26, '2025-05-28 14:39:40', '2025-05-29 20:13:32', 1),
(102, 'testing@gmail.com', 27, '2025-05-28 14:39:41', '2025-05-29 20:13:32', 1),
(103, 'testing@gmail.com', 28, '2025-05-28 14:39:42', '2025-05-29 20:13:32', 1),
(104, 'testing@gmail.com', 29, '2025-05-28 14:39:43', '2025-05-29 20:13:32', 1),
(105, 'testing@gmail.com', 30, '2025-05-28 14:39:45', '2025-05-29 20:13:32', 1),
(106, 'testing1234@gmail.com', 16, '2025-05-28 15:22:06', '2025-05-28 15:22:06', 1),
(107, 'testing1234@gmail.com', 17, '2025-05-28 15:22:06', '2025-05-28 15:22:06', 1),
(108, 'testing1234@gmail.com', 18, '2025-05-28 15:22:06', '2025-05-28 15:22:08', 1),
(109, 'testing1234@gmail.com', 19, '2025-05-28 15:22:08', '2025-05-28 15:22:09', 1),
(110, 'testing1234@gmail.com', 20, '2025-05-28 15:22:09', '2025-05-28 15:22:10', 1),
(111, 'testing1234@gmail.com', 21, '2025-05-28 15:22:10', '2025-05-28 15:22:11', 1),
(112, 'testing1234@gmail.com', 22, '2025-05-28 15:22:11', '2025-05-28 15:22:11', 1),
(113, 'testing1234@gmail.com', 23, '2025-05-28 15:22:11', '2025-05-28 15:22:12', 1),
(114, 'testing1234@gmail.com', 24, '2025-05-28 15:22:12', '2025-05-28 15:22:13', 1),
(115, 'testing1234@gmail.com', 25, '2025-05-28 15:22:13', '2025-05-28 15:22:14', 1),
(116, 'testing1234@gmail.com', 26, '2025-05-28 15:22:14', '2025-05-28 15:22:15', 1),
(117, 'testing1234@gmail.com', 27, '2025-05-28 15:22:15', '2025-05-28 15:22:16', 1),
(118, 'testing1234@gmail.com', 28, '2025-05-28 15:22:16', '2025-05-28 15:22:17', 1),
(119, 'testing1234@gmail.com', 29, '2025-05-28 15:22:17', '2025-05-28 15:22:18', 1),
(120, 'testing1234@gmail.com', 30, '2025-05-28 15:22:18', '2025-05-28 15:22:18', 1),
(121, 'tuser11@example.com', 1, '2025-05-28 15:25:52', '2025-05-28 15:25:52', 1),
(122, 'tuser11@example.com', 2, '2025-05-28 15:25:52', '2025-05-28 15:25:53', 1),
(123, 'tuser11@example.com', 3, '2025-05-28 15:25:53', '2025-05-28 15:25:54', 1),
(124, 'tuser11@example.com', 4, '2025-05-28 15:25:54', '2025-05-28 15:25:58', 1),
(125, 'tuser11@example.com', 5, '2025-05-28 15:25:58', '2025-05-28 15:26:00', 1),
(126, 'tuser11@example.com', 6, '2025-05-28 15:26:00', '2025-05-28 15:26:00', 1),
(127, 'tuser11@example.com', 7, '2025-05-28 15:26:00', '2025-05-28 15:26:01', 1),
(128, 'tuser11@example.com', 8, '2025-05-28 15:26:01', '2025-05-28 15:26:03', 1),
(129, 'tuser11@example.com', 9, '2025-05-28 15:26:03', '2025-05-28 15:26:04', 1),
(130, 'tuser11@example.com', 10, '2025-05-28 15:26:04', '2025-05-28 15:26:05', 1),
(131, 'tuser11@example.com', 11, '2025-05-28 15:26:05', '2025-05-28 15:26:05', 1),
(132, 'tuser11@example.com', 12, '2025-05-28 15:26:05', '2025-05-28 15:26:06', 1),
(133, 'tuser11@example.com', 13, '2025-05-28 15:26:06', '2025-05-28 15:26:06', 1),
(134, 'tuser11@example.com', 14, '2025-05-28 15:26:06', '2025-05-28 15:26:07', 1),
(135, 'tuser11@example.com', 15, '2025-05-28 15:26:07', '2025-05-28 15:26:08', 1),
(136, 'testing@gmail.com', 2, '2025-05-29 18:53:19', '2025-05-29 18:54:38', 1),
(137, 'testing@gmail.com', 3, '2025-05-29 18:54:33', '2025-05-29 18:54:39', 1),
(138, 'testing@gmail.com', 4, '2025-05-29 18:54:35', '2025-05-29 18:59:14', 1),
(139, 'testing@gmail.com', 3, '2025-05-29 18:54:38', '2025-05-29 18:54:39', 1),
(140, 'testing@gmail.com', 4, '2025-05-29 18:54:39', '2025-05-29 18:59:14', 1),
(141, 'testing@gmail.com', 5, '2025-05-29 18:59:11', '2025-05-29 19:54:12', 1),
(142, 'testing@gmail.com', 5, '2025-05-29 18:59:14', '2025-05-29 19:54:12', 1),
(143, 'testing@gmail.com', 6, '2025-05-29 18:59:14', '2025-05-29 20:13:13', 1),
(144, 'testing@gmail.com', 7, '2025-05-29 19:00:25', '2025-05-29 20:13:14', 1),
(145, 'testing@gmail.com', 6, '2025-05-29 19:54:12', '2025-05-29 20:13:13', 1),
(146, 'testing@gmail.com', 7, '2025-05-29 20:13:13', '2025-05-29 20:13:14', 1),
(147, 'testing@gmail.com', 8, '2025-05-29 20:13:14', '2025-05-29 20:13:15', 1),
(148, 'testing@gmail.com', 9, '2025-05-29 20:13:15', '2025-05-29 20:13:16', 1),
(149, 'testing@gmail.com', 10, '2025-05-29 20:13:16', '2025-05-29 20:13:17', 1),
(150, 'testing@gmail.com', 11, '2025-05-29 20:13:17', '2025-05-29 20:13:17', 1),
(151, 'testing@gmail.com', 12, '2025-05-29 20:13:17', '2025-05-29 20:13:18', 1),
(152, 'testing@gmail.com', 13, '2025-05-29 20:13:18', '2025-05-29 20:13:19', 1),
(153, 'testing@gmail.com', 14, '2025-05-29 20:13:19', '2025-05-29 20:13:19', 1),
(154, 'testing@gmail.com', 15, '2025-05-29 20:13:19', '2025-05-29 20:13:21', 1),
(155, 'testing@gmail.com', 17, '2025-05-29 20:13:28', '2025-05-29 20:13:28', 1),
(156, 'testing@gmail.com', 18, '2025-05-29 20:13:28', '2025-05-29 20:13:29', 1),
(157, 'testing@gmail.com', 19, '2025-05-29 20:13:29', '2025-05-29 20:13:30', 1),
(158, 'testing@gmail.com', 20, '2025-05-29 20:13:30', '2025-05-29 20:13:30', 1),
(159, 'testing@gmail.com', 21, '2025-05-29 20:13:30', '2025-05-29 20:13:30', 1),
(160, 'testing@gmail.com', 22, '2025-05-29 20:13:30', '2025-05-29 20:13:31', 1),
(161, 'testing@gmail.com', 23, '2025-05-29 20:13:31', '2025-05-29 20:13:31', 1),
(162, 'testing@gmail.com', 24, '2025-05-29 20:13:31', '2025-05-29 20:13:31', 1),
(163, 'testing@gmail.com', 25, '2025-05-29 20:13:31', '2025-05-29 20:13:31', 1),
(164, 'testing@gmail.com', 26, '2025-05-29 20:13:31', '2025-05-29 20:13:32', 1),
(165, 'testing@gmail.com', 27, '2025-05-29 20:13:32', '2025-05-29 20:13:32', 1),
(166, 'testing@gmail.com', 28, '2025-05-29 20:13:32', '2025-05-29 20:13:32', 1),
(167, 'testing@gmail.com', 29, '2025-05-29 20:13:32', '2025-05-29 20:13:32', 1),
(168, 'testing@gmail.com', 30, '2025-05-29 20:13:32', '2025-05-29 20:13:32', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course_parts`
--
ALTER TABLE `course_parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_id` (`part_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_part_status`
--
ALTER TABLE `user_part_status`
  ADD PRIMARY KEY (`user_email`,`part_id`),
  ADD UNIQUE KEY `user_email` (`user_email`,`part_id`),
  ADD KEY `part_id` (`part_id`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course_parts`
--
ALTER TABLE `course_parts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_sections`
--
ALTER TABLE `course_sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=169;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course_sections`
--
ALTER TABLE `course_sections`
  ADD CONSTRAINT `course_sections_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `course_parts` (`id`);

--
-- Constraints for table `user_part_status`
--
ALTER TABLE `user_part_status`
  ADD CONSTRAINT `user_part_status_ibfk_1` FOREIGN KEY (`part_id`) REFERENCES `course_parts` (`id`),
  ADD CONSTRAINT `user_part_status_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `course_sections` (`id`),
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `users` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
