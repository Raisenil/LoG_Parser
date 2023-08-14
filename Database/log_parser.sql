-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 14, 2023 at 05:34 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `log_parser`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `Timestamp` varchar(255) NOT NULL,
  `Request_Name` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Count` int(255) NOT NULL,
  `Host_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `Timestamp`, `Request_Name`, `Status`, `Count`, `Host_Name`) VALUES
(181, '2023-08-14 20:49:31', 'GET', '301', 36, 'Raisenil'),
(182, '2023-08-14 20:49:31', 'GET', '200', 9396, 'Raisenil'),
(183, '2023-08-14 20:49:31', 'GET', '403', 92, 'Raisenil'),
(184, '2023-08-14 20:49:31', 'GET', '302', 11, 'Raisenil'),
(185, '2023-08-14 20:49:31', 'GET', '405', 1, 'Raisenil'),
(186, '2023-08-14 20:49:31', 'GET', '499', 4, 'Raisenil'),
(187, '2023-08-14 20:49:31', 'GET', '404', 1, 'Raisenil'),
(188, '2023-08-14 20:49:31', 'POST', '200', 346731, 'Raisenil'),
(189, '2023-08-14 20:49:31', 'POST', '400', 824, 'Raisenil'),
(190, '2023-08-14 20:49:31', 'POST', '403', 2, 'Raisenil'),
(191, '2023-08-14 20:49:31', 'POST', '301', 1, 'Raisenil'),
(192, '2023-08-14 20:49:31', 'POST', '404', 6, 'Raisenil'),
(193, '2023-08-14 20:49:31', 'POST', '502', 1, 'Raisenil'),
(194, '2023-08-14 20:49:31', 'POST', '307', 3, 'Raisenil'),
(195, '2023-08-14 20:49:31', 'POST', '499', 1, 'Raisenil'),
(196, '2023-08-14 20:49:31', 'HEAD', '302', 14, 'Raisenil'),
(197, '2023-08-14 20:49:31', 'HEAD', '200', 23, 'Raisenil'),
(198, '2023-08-14 20:49:31', 'HEAD', '301', 5, 'Raisenil'),
(199, '2023-08-14 20:49:31', 'OPTIONS', '301', 1, 'Raisenil'),
(200, '2023-08-14 20:49:31', 'OPTIONS', '400', 2, 'Raisenil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
